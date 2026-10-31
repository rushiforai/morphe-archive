$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$matrix=Get-Content -LiteralPath "$PSScriptRoot\revision33-final-matrix.log" -Raw
if($matrix -notmatch 'PASS: matrix uses one unchanged bundle SHA256'){throw 'Finish the exact compatibility matrix first'}
& "$app\verify-stable.ps1" auditPersonalFeatures -x verifyBundle "-PauditManifest=$PSScriptRoot\revision33-final-feature-manifest.txt" *> "$PSScriptRoot\revision33-final-feature-audit.log"
if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\revision33-final-feature-audit.log" -Tail 30;throw 'Compiled feature audit failed'}
& "$app\verify-stable.ps1" auditModelEntry -x verifyBundle "-PauditManifest=$PSScriptRoot\revision33-final-entry-manifest.txt" *> "$PSScriptRoot\revision33-final-entry-audit.log"
if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\revision33-final-entry-audit.log" -Tail 30;throw 'Compiled native Lyrics audit failed'}
Write-Output 'PASS: 16 compiled feature audits and 12 native Lyrics audits'
