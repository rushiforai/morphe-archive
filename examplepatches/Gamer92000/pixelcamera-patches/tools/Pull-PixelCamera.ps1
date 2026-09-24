<#
.SYNOPSIS
    Pull the official Pixel Camera APK set from a connected device.

.DESCRIPTION
    Pixel Camera is preinstalled and Play-updated, so the genuine, current APK
    set is already on your own phone. Pulling it avoids downloading Google's
    APK from a third party and avoids redistributing it.

    The app is an app bundle: base.apk plus ~20 `split_*` dynamic feature
    modules. All DEX code lives in base.apk; the splits carry assets and a few
    feature-specific native libraries. Every part must be kept, because the
    patched app is installed with `pm install-multiple` and a missing feature
    module breaks the corresponding camera feature.

.PARAMETER OutputDirectory
    Where to write the pulled APKs. Created if missing.

.PARAMETER PackageName
    Override the package to pull. Defaults to the official Pixel Camera.

.PARAMETER Serial
    Target a specific adb device when more than one is attached.

.EXAMPLE
    .\tools\Pull-PixelCamera.ps1 -OutputDirectory .\work\pixelcamera
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string] $OutputDirectory,

    [string] $PackageName = 'com.google.android.GoogleCamera',

    [string] $Serial
)

$ErrorActionPreference = 'Stop'

function Invoke-Adb {
    param([Parameter(ValueFromRemainingArguments = $true)][string[]] $Arguments)
    if ($Serial) { $all = @('-s', $Serial) + $Arguments } else { $all = $Arguments }
    $output = & adb @all 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "adb $($all -join ' ') failed with exit code $LASTEXITCODE`n$output"
    }
    return $output
}

if (-not (Get-Command adb -ErrorAction SilentlyContinue)) {
    throw 'adb was not found on PATH. Install Android platform-tools first.'
}

$devices = (& adb devices) | Select-Object -Skip 1 | Where-Object { $_ -match '\sdevice$' }
if (-not $devices) {
    throw 'No authorised adb device. Enable USB debugging and accept the prompt on the phone.'
}

Write-Host 'Device:' (Invoke-Adb shell getprop ro.product.model)
Write-Host 'Build  :' (Invoke-Adb shell getprop ro.build.fingerprint)

$paths = Invoke-Adb shell pm path $PackageName |
    ForEach-Object { $_ -replace '^package:', '' } |
    ForEach-Object { $_.Trim() } |
    Where-Object { $_ }

if (-not $paths) {
    throw "Package '$PackageName' is not installed on this device."
}

if (-not (Test-Path $OutputDirectory)) {
    New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
}

Write-Host "Pulling $($paths.Count) APK(s) into $OutputDirectory ..."
foreach ($path in $paths) {
    $name = Split-Path $path -Leaf
    $destination = Join-Path $OutputDirectory $name
    Invoke-Adb pull $path $destination | Out-Null
    $sizeMb = [math]::Round((Get-Item $destination).Length / 1MB, 1)
    Write-Host ("  {0,-52} {1,8} MB" -f $name, $sizeMb)
}

$version = Invoke-Adb shell dumpsys package $PackageName |
    Select-String -Pattern 'versionName=' |
    Select-Object -First 1

Write-Host ''
Write-Host "Pulled $PackageName $version"
Write-Host 'Next:'
Write-Host "  python tools/dexscan.py info $OutputDirectory/base.apk"
Write-Host "  python tools/apksigcert.py $OutputDirectory/base.apk"
Write-Host "  python tools/verify_fingerprints.py $OutputDirectory/base.apk"
