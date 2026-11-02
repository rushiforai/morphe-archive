$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$matrix=Get-Content -LiteralPath "$PSScriptRoot\revision40\matrix-final-r1.log" -Raw
if($matrix -notmatch 'PASS: matrix uses one unchanged bundle SHA256'){throw 'Finish the exact compatibility matrix first'}
foreach($entry in @(@('auditPersonalFeatures','feature'),@('auditModelEntry','entry'))){
 & "$app\verify-stable.ps1" $entry[0] -x verifyBundle '-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4' "-PauditManifest=$PSScriptRoot\revision40\$($entry[1])-manifest-r1.txt" *> "$PSScriptRoot\revision40\$($entry[1])-audit-r1.log"
 if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\revision40\$($entry[1])-audit-r1.log" -Tail 30;throw 'Compiled audit failed'}
}
Write-Output 'PASS: 14 compiled feature audits and 8 native Lyrics audits'

& "$app\verify-stable.ps1" auditDownloads40 -x verifyBundle '-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4' "-PauditManifest=$PSScriptRoot\revision40\feature-manifest-r1.txt" *> "$PSScriptRoot\revision40\downloads-audit-r1.log"
if($LASTEXITCODE -ne 0){Get-Content "$PSScriptRoot\revision40\downloads-audit-r1.log" -Tail 25;throw 'Compiled native download audit failed'}
Write-Output 'PASS: 14 compiled native download/cache/artwork audits'
