$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$matrix=Get-Content -LiteralPath "$PSScriptRoot\revision38\matrix-final-r3.log" -Raw
if($matrix -notmatch 'PASS: matrix uses one unchanged bundle SHA256'){throw 'Finish the exact compatibility matrix first'}
foreach($entry in @(@('auditPersonalFeatures','feature'),@('auditModelEntry','entry'))){
 & "$app\verify-stable.ps1" $entry[0] -x verifyBundle '-PpatcherSource=../../BuildSources/morphe-patcher-2.1.0-dev.4' "-PauditManifest=$PSScriptRoot\revision38\$($entry[1])-manifest-r3.txt" *> "$PSScriptRoot\revision38\$($entry[1])-audit-r4.log"
 if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\revision38\$($entry[1])-audit-r4.log" -Tail 30;throw 'Compiled audit failed'}
}
Write-Output 'PASS: 14 compiled feature audits and 8 native Lyrics audits'
