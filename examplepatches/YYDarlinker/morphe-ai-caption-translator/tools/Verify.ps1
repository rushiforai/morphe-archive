# Compatibility alias for the canonical source-distributed entry.
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
& (Join-Path $PSScriptRoot 'workspace/verify-full.ps1') @PSBoundParameters
exit $LASTEXITCODE
