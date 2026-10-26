# Complete candidate/release verification; no publication or model calls.
[CmdletBinding()]
param(
    [string]$RunId,
    [string]$EvidenceDirectory,
    [ValidateSet('candidate','release')][string]$Mode = 'candidate',
    [string]$ExpectedVersion,
    [string]$ExpectedBuildId,
    [switch]$Offline,
    [switch]$RerunTests
)
$ErrorActionPreference = 'Stop'
$envInfo = . (Join-Path $PSScriptRoot 'Enter-Dev.ps1')
$arguments = @('-X','utf8','tools/verify_current.py','--mode',$Mode)
if ($RunId) { $arguments += @('--run-id',$RunId) }
if ($EvidenceDirectory) { $arguments += @('--evidence-dir',$EvidenceDirectory) }
if ($ExpectedVersion) { $arguments += @('--version',$ExpectedVersion) }
if ($ExpectedBuildId) { $arguments += @('--build-id',$ExpectedBuildId) }
if ($Offline) { $arguments += '--offline' }
if ($RerunTests) { $arguments += '--rerun-tests' }
$ErrorActionPreference = 'Continue'
& $envInfo.Python @arguments
exit $LASTEXITCODE
