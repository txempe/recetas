#$dest = "https://api.github.com/repos/txempe/recetas/git/trees/main?recursive=1"
#$proxy = ([System.Net.WebRequest]::GetSystemWebproxy()).GetProxy($dest)
#$salida=Invoke-WebRequest https://api.github.com/repos/txempe/recetas/git/trees/main?recursive=1 -Proxy $proxy -ProxyUseDefaultCredentials | Select-Object -Expand Content
$salida = $salida -replace ',',"`r`n"
$postres=$salida -Split([Environment]::NewLine) | Select-String -Pattern "postres" | Select-String -Pattern ".pdf" | Sort-Object
$postres=$postres -Replace '"',''
$postres=$postres -Replace '{path:postres/',''
$postres=$postres -Replace '\.pdf',''
#write-host "# Bienvenido a mi página de Recetas`r`n"
write-host "## Postres`r`n"
$postres | Foreach-Object { write-host "[$_](../recetas/postres/${_}.pdf)`r`n"}

$platos=$salida -Split([Environment]::NewLine) | Select-String -Pattern "platos" | Select-String -Pattern ".pdf" | Sort-Object
$platos=$platos -Replace '"',''
$platos=$platos -Replace '{path:platos/',''
$platos=$platos -Replace '\.pdf',''
write-host "`r`n`r`n## Platos`r`n"
$platos | Foreach-Object { write-host "[$_](../recetas/platos/${_}.pdf)`n"}

$entrantes=$salida -Split([Environment]::NewLine) | Select-String -Pattern "entrantes" | Select-String -Pattern ".pdf" | Sort-Object
$entrantes=$entrantes -Replace '"',''
$entrantes=$entrantes -Replace '{path:entrantes/',''
$entrantes=$entrantes -Replace '\.pdf',''
write-host "`r`n`r`n## Entrantes`r`n"
$entrantes | Foreach-Object { write-host "[$_](../recetas/entrantes/${_}.pdf)`n"}
