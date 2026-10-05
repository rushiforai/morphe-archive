[CmdletBinding()]
param(
    [Parameter(Mandatory)][string] $OriginalBaseApk,
    [Parameter(Mandatory)][string] $OutputApk
)
. "$PSScriptRoot/common.ps1"
$original = (Resolve-Path -LiteralPath $OriginalBaseApk).Path
$output = (Resolve-Path -LiteralPath $OutputApk).Path
$run = New-RunDirectory 'verify'
$morphe = Get-MorphePath
$sdk = Get-AndroidSdk
& java '-Xmx4g' '--class-path' $morphe (Join-Path $PSScriptRoot 'verification/OriginalAwareVerifier.java') $original $output $sdk $run 2>&1 |
    Tee-Object -FilePath (Join-Path $run 'verification.log')
if ($LASTEXITCODE -ne 0) { throw "Original-aware audit failed. See $run. No installation authorized." }
Write-Host "Verification artifacts: $run"
