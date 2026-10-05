<#
.SYNOPSIS
    Authenticate local release assets offline against an independently pinned public key.
.DESCRIPTION
    Supply the complete fingerprint and public key obtained through your trusted route.
    Never select a key from the downloaded asset folder. No key server or download is used.
    Manager 1.33 and Desktop 1.18 do not perform this check. Run it before importing the assets.
#>
[CmdletBinding()]
param([Parameter(Mandatory)][string]$AssetDirectory, [Parameter(Mandatory)][string]$ChecksumsPath,
    [Parameter(Mandatory)][string]$SignaturePath, [Parameter(Mandatory)][string]$TrustedPublicKeyPath,
    [Parameter(Mandatory)][string]$TrustedFingerprint, [string[]]$ExpectedAssetNames, [string]$Gpg = 'gpg')
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'release-checksums.ps1')
$ExpectedAssetNames = @($ExpectedAssetNames | ForEach-Object { $_ -split ',' })
$checksums = Read-AuthenticatedReleaseChecksums -ChecksumsPath $ChecksumsPath -SignaturePath $SignaturePath `
    -TrustedPublicKeyPath $TrustedPublicKeyPath -TrustedFingerprint $TrustedFingerprint -Gpg $Gpg
Assert-ReleaseChecksumAssets -Checksums $checksums -AssetDirectory $AssetDirectory -ExpectedAssetNames $ExpectedAssetNames
