$ErrorActionPreference='Stop'
$app=Split-Path -Parent $PSScriptRoot
$matrix=Get-Content -LiteralPath "$PSScriptRoot\revision34-accepted-matrix.log" -Raw
if($matrix -notmatch 'PASS: matrix uses one unchanged bundle SHA256'){throw 'Finish the exact compatibility matrix first'}
& "$app\verify-stable.ps1" auditPersonalFeatures -x verifyBundle "-PauditManifest=$PSScriptRoot\revision34-accepted-feature-manifest.txt" *> "$PSScriptRoot\revision34-accepted-feature-audit-r2.log"
if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\revision34-accepted-feature-audit-r2.log" -Tail 30;throw 'Compiled feature audit failed'}
& "$app\verify-stable.ps1" auditModelEntry -x verifyBundle "-PauditManifest=$PSScriptRoot\revision34-accepted-entry-manifest.txt" *> "$PSScriptRoot\revision34-accepted-entry-audit-r2.log"
if($LASTEXITCODE -ne 0){Get-Content -LiteralPath "$PSScriptRoot\revision34-accepted-entry-audit-r2.log" -Tail 30;throw 'Compiled native Lyrics audit failed'}
Write-Output 'PASS: 7 compiled feature audits and 4 native Lyrics audits'
