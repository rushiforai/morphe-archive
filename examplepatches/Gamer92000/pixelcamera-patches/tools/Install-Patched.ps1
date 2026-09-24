<#
.SYNOPSIS
    Install a patched Pixel Camera APK set on an unrooted device.

.DESCRIPTION
    The patched app must be installed as a multi-APK session, because Pixel
    Camera is an app bundle. `adb install` on base.apk alone produces an app
    that starts and then fails as soon as it needs a feature module.

    IMPORTANT - this only succeeds if the patched build carries a DIFFERENT
    package name than the stock app. The stock Pixel Camera is a Google-signed
    privileged system app under /product/priv-app; installing a re-signed APK
    over it fails with INSTALL_FAILED_UPDATE_INCOMPATIBLE and cannot be forced
    without root. Apply Morphe's "Change package name" patch alongside this
    patch. See README.md -> Installation.

.PARAMETER ApkDirectory
    Directory holding the patched base.apk and its split_*.apk files.

.PARAMETER Serial
    Target a specific adb device when more than one is attached.

.PARAMETER Reinstall
    Pass -r to the install session (upgrade an existing install of the same
    package name and signature).

.EXAMPLE
    .\tools\Install-Patched.ps1 -ApkDirectory .\work\patched
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string] $ApkDirectory,

    [string] $Serial,

    [switch] $Reinstall
)

$ErrorActionPreference = 'Stop'

function Invoke-Adb {
    param([Parameter(ValueFromRemainingArguments = $true)][string[]] $Arguments)
    if ($Serial) { $all = @('-s', $Serial) + $Arguments } else { $all = $Arguments }
    $output = & adb @all 2>&1
    return @{ Output = ($output -join "`n"); ExitCode = $LASTEXITCODE }
}

if (-not (Test-Path $ApkDirectory)) {
    throw "Directory not found: $ApkDirectory"
}

$apks = Get-ChildItem -Path $ApkDirectory -Filter '*.apk' | Sort-Object Name
if (-not $apks) {
    throw "No .apk files in $ApkDirectory"
}

$base = $apks | Where-Object { $_.Name -eq 'base.apk' }
if (-not $base) {
    Write-Warning 'No base.apk found; the first APK will be treated as the base.'
}

Write-Host "Installing $($apks.Count) APK(s):"
$apks | ForEach-Object { Write-Host ("  {0,-52} {1,8} MB" -f $_.Name, [math]::Round($_.Length / 1MB, 1)) }

$installArgs = @('install-multiple')
if ($Reinstall) { $installArgs += '-r' }
$installArgs += $apks.FullName

$result = Invoke-Adb @installArgs
Write-Host $result.Output

if ($result.ExitCode -ne 0 -or $result.Output -match 'INSTALL_FAILED') {
    Write-Host ''
    Write-Host 'Install failed. Common causes:' -ForegroundColor Yellow
    Write-Host '  INSTALL_FAILED_UPDATE_INCOMPATIBLE   the package name still matches the'
    Write-Host '                                       Google-signed stock app. Apply the'
    Write-Host '                                       "Change package name" patch.'
    Write-Host '  INSTALL_FAILED_DUPLICATE_PERMISSION  a <permission> declared by the app'
    Write-Host '                                       collides with the stock install.'
    Write-Host '                                       Enable the rename patch option'
    Write-Host '                                       "updatePermissions".'
    Write-Host '  INSTALL_FAILED_CONFLICTING_PROVIDER  a <provider> authority collides.'
    Write-Host '                                       Enable "updateProviders".'
    Write-Host '  INSTALL_PARSE_FAILED_NO_CERTIFICATES the output was not signed.'
    exit 1
}

Write-Host ''
Write-Host 'Installed. Grant runtime permissions before first launch if you want to skip'
Write-Host 'the prompts, e.g.:'
Write-Host '  adb shell pm grant <package> android.permission.CAMERA'
Write-Host '  adb shell pm grant <package> android.permission.RECORD_AUDIO'
Write-Host '  adb shell pm grant <package> android.permission.ACCESS_FINE_LOCATION'
Write-Host '  adb shell pm grant <package> android.permission.READ_MEDIA_IMAGES'
Write-Host '  adb shell pm grant <package> android.permission.READ_MEDIA_VIDEO'
