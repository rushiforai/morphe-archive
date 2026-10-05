<#
.SYNOPSIS
    Account-preserving installs. Stock or differently signed packages are refused.
#>

. (Join-Path $PSScriptRoot 'device-lease.ps1')

function Get-HushApkSigners {
    param([string]$Apk, [string]$Aapt2)
    $tool = Join-Path (Split-Path -Parent $Aapt2) 'apksigner.bat'
    if (-not (Test-Path -LiteralPath $tool -PathType Leaf)) { throw 'No apksigner beside aapt2.' }
    $ErrorActionPreference = 'Continue'
    $lines = @(& $tool verify --print-certs $Apk 2>&1 | ForEach-Object { "$_" })
    if ($LASTEXITCODE -ne 0) { throw 'APK signature verification refused.' }
    $digests = @($lines | Where-Object { $_ -match 'certificate SHA-256 digest: ([0-9a-fA-F]{64})' } |
        ForEach-Object { ($_.Substring($_.IndexOf('digest: ') + 8)).Trim().ToLowerInvariant() } | Sort-Object -Unique)
    if ($digests.Count -eq 0) { throw 'APK signer evidence missing. Install refused.' }
    return $digests
}

function Install-HushAndroidApk {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$PackageName,
        [Parameter(Mandatory = $true)][string]$Apk,
        [Parameter(Mandatory = $true)][string]$Aapt2,
        [Parameter(Mandatory = $true)]$Lease,
        [scriptblock]$AdbInvoker,
        [scriptblock]$SignerReader = { param($Path, $Tool) Get-HushApkSigners -Apk $Path -Aapt2 $Tool },
        [scriptblock]$ManifestReader = { param($Path, $Tool) Get-ApkManifestFacts -Apk $Path -Aapt2 $Tool }
    )

    if ($Serial -cne $Lease.Serial -or $PackageName -notmatch '^[A-Za-z0-9_.]+$') { throw 'Install identity refused.' }
    Renew-HushDeviceLease $Lease
    $new = & $ManifestReader $Apk $Aapt2
    $newSigners = @(& $SignerReader $Apk $Aapt2 | Sort-Object -Unique)
    if ($new.package -cne $PackageName -or "$($new.versionCode)" -notmatch '^\d+$' -or $newSigners.Count -eq 0) {
        throw 'New APK package, version or signer evidence refused.'
    }
    $paths = Invoke-HushLeasedAdb -Adb $Adb -Lease $Lease -Invoker $AdbInvoker -Arguments @('shell', 'pm', 'path', $PackageName)
    $installed = @($paths.Output | Where-Object { $_ -like 'package:*' })
    if ($installed.Count -eq 0 -and $paths.ExitCode -in @(0, 1) -and
        @($paths.Output | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }).Count -eq 0) {
        # Some Android builds return exit 1 for an absent package. Independently confirm absence,
        # including packages retained with user data, before treating that answer as a first install.
        $inventory = Invoke-HushLeasedAdb -Adb $Adb -Lease $Lease -Invoker $AdbInvoker `
            -Arguments @('shell', 'pm', 'list', 'packages', '-u', $PackageName)
        $entries = @($inventory.Output | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
        if ($inventory.ExitCode -ne 0 -or @($entries | Where-Object { $_ -notmatch '^package:[A-Za-z0-9_.]+$' }).Count -gt 0) {
            throw (Format-HushPinterestAdbFailure 'Package inventory query refused' $inventory)
        }
        if ($entries -ccontains "package:$PackageName") { throw 'Installed package has no readable APK path. Install refused.' }
    } elseif ($paths.ExitCode -ne 0 -or $installed.Count -eq 0) {
        throw (Format-HushPinterestAdbFailure 'Installed package query refused' $paths)
    }
    $local = Join-Path ([IO.Path]::GetTempPath()) ('hushpinterest-installed-' + [guid]::NewGuid().ToString('N') + '.apk')
    try {
        if ($installed.Count -gt 0) {
            $remote = ($installed[0] -replace '^package:', '').Trim()
            if ($remote -notmatch '^/data/app/[^\s]+\.apk$') { throw 'Installed APK path refused.' }
            $pull = Invoke-HushLeasedAdb -Adb $Adb -Lease $Lease -Invoker $AdbInvoker -Arguments @('pull', $remote, $local)
            if ($pull.ExitCode -ne 0) { throw (Format-HushPinterestAdbFailure 'Installed signer read refused' $pull) }
            $old = & $ManifestReader $local $Aapt2
            $oldSigners = @(& $SignerReader $local $Aapt2 | Sort-Object -Unique)
            if ($oldSigners.Count -eq 0 -or ($oldSigners -join ',') -cne ($newSigners -join ',')) {
                throw 'Installed APK has a different signer. Install refused without uninstalling or changing keys.'
            }
            if ($old.package -cne $PackageName -or "$($old.versionCode)" -notmatch '^\d+$' -or
                [long]$old.versionCode -gt [long]$new.versionCode) { throw 'Installed package or version downgrade refused.' }
        }
        $identity = Get-HushDeviceIdentity -Adb $Adb -Serial $Serial -AdbInvoker $AdbInvoker
        if (($identity | ConvertTo-Json -Compress) -cne ($Lease.Identity | ConvertTo-Json -Compress)) { throw 'Device identity changed. Install refused.' }
        $result = Invoke-HushLeasedAdb -Adb $Adb -Lease $Lease -Invoker $AdbInvoker -Arguments @('install', '-r', $Apk)
        $result.Output | Out-Host
        if ($result.ExitCode -ne 0) { throw (Format-HushPinterestAdbFailure 'ADB install refused' $result) }
    } finally { Remove-Item -LiteralPath $local -Force -ErrorAction SilentlyContinue }
}
