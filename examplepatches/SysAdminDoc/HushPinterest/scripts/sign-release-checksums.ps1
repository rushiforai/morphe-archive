<#
.SYNOPSIS
    Sign selected local release assets with an explicitly provisioned private key.
.DESCRIPTION
    Produces canonical SHA256SUMS.txt and its detached SHA256SUMS.txt.asc signature.
    Existing output files are refused. No key is generated, exported or downloaded.
    Keep the private keyring outside the repository. GPG handles its passphrase through pinentry.
    Manager 1.33 and Desktop 1.18 do not authenticate these signatures. Verify locally before
    supplying authenticated assets to either consumer.
#>
[CmdletBinding()]
param([Parameter(Mandatory)][string]$AssetDirectory, [Parameter(Mandatory)][string[]]$AssetNames,
    [Parameter(Mandatory)][string]$GpgHome, [Parameter(Mandatory)][string]$SigningFingerprint,
    [Parameter(Mandatory)][string]$TrustedPublicKeyPath, [string]$ChecksumsPath, [string]$SignaturePath,
    [string]$Gpg = 'gpg')
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'release-checksums.ps1')
$PSBoundParameters['AssetNames'] = @($AssetNames | ForEach-Object { $_ -split ',' })
Write-SignedReleaseChecksums @PSBoundParameters
