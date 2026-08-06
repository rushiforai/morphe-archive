[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Patch,
    [Parameter(Mandatory)][ValidateSet('tv','phone','real')][string]$Device,
    [string]$Serial,
    [ValidateSet('auto','universal','x86_64','arm64-v8a','armeabi-v7a')][string]$Asset = 'auto',
    [switch]$ReplaceOfficial
)

. "$PSScriptRoot\Common.ps1"
$config = Initialize-NuvioEnvironment
$manifest = Get-PatchManifest $Patch

if ($Device -eq 'real') {
    if (-not $Serial) {
        $Serial = (& adb devices | Select-String '\sdevice$' | ForEach-Object { ($_ -split '\s+')[0] } | Select-Object -First 1)
    }
    if (-not $Serial) { throw 'No real Android device is connected. Supply -Serial when more than one is present.' }
    $reportedAbi = (& adb -s $Serial shell getprop ro.product.cpu.abi).Trim()
    $deviceAbi = switch -Regex ($reportedAbi) {
        '^arm64' { 'arm64-v8a'; break }
        '^(armeabi|armv7)' { 'armeabi-v7a'; break }
        default { throw "Unsupported real-device ABI: $reportedAbi" }
    }
} else {
    $avd = if ($Device -eq 'tv') { $config.android.tvAvd } else { $config.android.phoneAvd }
    $Serial = Get-ConnectedAvdSerial $avd
    if (-not $Serial) {
        Start-Process (Join-Path $env:ANDROID_HOME 'emulator\emulator.exe') -ArgumentList @('-avd', $avd, '-no-snapshot-save') -WindowStyle Hidden
        $deadline = (Get-Date).AddMinutes(2)
        do {
            Start-Sleep -Seconds 2
            $Serial = Get-ConnectedAvdSerial $avd
        } while (-not $Serial -and (Get-Date) -lt $deadline)
    }
    if (-not $Serial) { throw "Could not start AVD '$avd'." }
    Wait-ForAndroid $Serial
    $deviceAbi = 'x86_64'
}

$assetKey = if ($Asset -eq 'auto') { $deviceAbi } else { $Asset }
if ($assetKey -ne 'universal' -and $assetKey -ne $deviceAbi) {
    throw "Asset '$assetKey' is incompatible with device ABI '$deviceAbi'. Use '$deviceAbi' or 'universal'."
}

$run = New-PatchRunDirectory $Patch $assetKey
& "$PSScriptRoot\patch.ps1" -Patch $Patch -Abi $assetKey -RunDirectory $run
if ($LASTEXITCODE -ne 0) { throw 'Patch application failed.' }
$apk = Join-Path $run 'nuviotv-patched.apk'

& adb -s $Serial logcat -c
function Install-TestApk {
    $previousErrorAction = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $output = (& adb -s $Serial install -r -d $apk 2>&1) -join [Environment]::NewLine
        $exitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $previousErrorAction
    }
    [pscustomobject]@{ Output = $output; ExitCode = $exitCode }
}

$install = Install-TestApk
if ($install.ExitCode -ne 0 -and $install.Output -match 'UPDATE_INCOMPATIBLE') {
    if ($Device -eq 'real' -and -not $ReplaceOfficial) {
        throw 'The installed app has a different signature. Re-run with -ReplaceOfficial to explicitly uninstall it and lose its local data.'
    }
    & adb -s $Serial uninstall $manifest.target.package | Out-Null
    $install = Install-TestApk
}
$install.Output | Set-Content -Encoding UTF8 (Join-Path $run 'install.log')
if ($install.ExitCode -ne 0 -or $install.Output -notmatch 'Success') { throw "Install failed: $($install.Output)" }

& adb -s $Serial shell am force-stop $manifest.target.package | Out-Null
& adb -s $Serial shell am start -n $manifest.target.launchComponent | Out-Null
Start-Sleep -Seconds 8
& adb -s $Serial logcat -d -v threadtime | Set-Content -Encoding UTF8 (Join-Path $run 'logcat.txt')
& adb -s $Serial shell uiautomator dump /sdcard/nuviotv-window.xml | Out-Null
& adb -s $Serial pull /sdcard/nuviotv-window.xml (Join-Path $run 'ui-dump.xml') | Out-Null
& adb -s $Serial shell screencap -p /sdcard/nuviotv-launch.png | Out-Null
& adb -s $Serial pull /sdcard/nuviotv-launch.png (Join-Path $run 'launch.png') | Out-Null

$facts = [ordered]@{
    serial = $Serial
    requestedDevice = $Device
    model = (& adb -s $Serial shell getprop ro.product.model).Trim()
    abi = (& adb -s $Serial shell getprop ro.product.cpu.abi).Trim()
    android = (& adb -s $Serial shell getprop ro.build.version.release).Trim()
    sdk = (& adb -s $Serial shell getprop ro.build.version.sdk).Trim()
}
$facts | ConvertTo-Json | Set-Content -Encoding UTF8 (Join-Path $run 'device.json')

$fatal = Select-String -Path (Join-Path $run 'logcat.txt') -Pattern 'FATAL EXCEPTION|VerifyError|ANR in com\.nuvio\.tv' -Quiet
$checklist = ($manifest.acceptance | ForEach-Object { "- [ ] $_" }) -join [Environment]::NewLine
$status = if ($fatal) { 'FAILED: fatal startup log found' } else { 'AUTOMATION PASSED; MANUAL RUNTIME CHECKS PENDING' }
@"
# Test report: $Patch

- Status: $status
- Device: $Device / $Serial
- APK asset: $assetKey
- Run: $run
- Automated: build, exclusive patch, digest verification, sign, install, launch, logcat, screenshot, UI dump

## Runtime acceptance

$checklist

## Manager check (Pixel_10)

- [ ] Add the public `liongalahad/nuviotv-morphe-patches` source and enable prereleases.
- [ ] Select only `$($manifest.name)` and export with the same test signing identity.
- [ ] Install the exported APK on the TV test target and repeat the runtime checks.
"@ | Set-Content -Encoding UTF8 (Join-Path $run 'TEST_REPORT.md')

if ($fatal) { throw "Fatal log signature found. See $run\logcat.txt" }
[pscustomobject]@{ Status = $status; RunDirectory = $run; Device = $facts }
