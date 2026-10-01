<#
.SYNOPSIS
    Reliably starts the Android emulator, waits for system boot, installs the patched APK,
    unlocks the device, and launches Pixiv ready for interaction.

.DESCRIPTION
    Eliminates manual live-piloting overhead for AI agents and developers by handling
    background process detachment, cold-boot ANRs, lock screens, and app deployment.
#>

param(
    [string]$AvdName = "Pixel_8_API_35",
    [string]$DeviceId = "emulator-5554",
    [string]$ApkPath = "$PSScriptRoot\..\pixiv-patched.apk"
)

$ErrorActionPreference = "Stop"

$Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
if (-not (Test-Path $Adb)) {
    $foundAdb = Get-Command adb -ErrorAction SilentlyContinue
    if ($foundAdb) { $Adb = $foundAdb.Source }
}
if (-not $Adb -or -not (Test-Path $Adb)) {
    throw "adb.exe not found in Android SDK platform-tools or PATH."
}

$Emulator = "$env:LOCALAPPDATA\Android\Sdk\emulator\emulator.exe"
if (-not (Test-Path $Emulator)) {
    $foundEmulator = Get-Command emulator -ErrorAction SilentlyContinue
    if ($foundEmulator) { $Emulator = $foundEmulator.Source }
}

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  Pixiv Morphe Emulator Bootstrap Pipeline" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan

# 1. Check if emulator is running
$Devices = & $Adb devices
$IsAttached = ($Devices -match $DeviceId)

if (-not $IsAttached) {
    Write-Host "[1/6] Launching emulator $AvdName detached (independent background process)..." -ForegroundColor Yellow
    if (-not (Test-Path $Emulator)) { throw "emulator.exe not found." }

    $cmdLine = "`"$Emulator`" -avd $AvdName -no-snapshot-load"
    $launched = $false
    try {
        $res = Invoke-CimMethod -ClassName Win32_Process -MethodName Create -Arguments @{ CommandLine = $cmdLine }
        if ($res.ReturnValue -eq 0) {
            $launched = $true
        } else {
            Write-Warning "WMI process creation returned status code $($res.ReturnValue); falling back to Start-Process..."
        }
    } catch {
        Write-Warning "WMI process creation threw an exception ($($_.Exception.Message)); falling back to Start-Process..."
    }

    if (-not $launched) {
        Start-Process -FilePath $Emulator -ArgumentList "-avd", $AvdName, "-no-snapshot-load" -WindowStyle Hidden
    }

    Write-Host "Waiting for device to connect to ADB..." -ForegroundColor Gray
    & $Adb -s $DeviceId wait-for-device
} else {
    Write-Host "[1/6] Emulator $DeviceId is already running." -ForegroundColor Green
}

# 2. Wait for boot completion
Write-Host "[2/6] Verifying Android system boot completion..." -ForegroundColor Yellow
$BootCompleted = $false
$Attempts = 0
while (-not $BootCompleted -and $Attempts -lt 45) {
    $Attempts++
    $Result = & $Adb -s $DeviceId shell getprop sys.boot_completed 2>$null
    if ($Result -and $Result.Trim() -eq "1") {
        $BootCompleted = $true
    } else {
        Start-Sleep -Seconds 2
    }
}
if (-not $BootCompleted) {
    throw "Timed out waiting for emulator boot completion."
}
Write-Host "  -> Android OS fully booted." -ForegroundColor Green

# 3. Wake screen and dismiss keyguard
Write-Host "[3/6] Waking screen and unlocking keyguard..." -ForegroundColor Yellow
& $Adb -s $DeviceId shell input keyevent 224
& $Adb -s $DeviceId shell wm dismiss-keyguard

# 4. Handle initial ANR / force-stop existing instance
Write-Host "[4/6] Resetting Pixiv process state..." -ForegroundColor Yellow
& $Adb -s $DeviceId shell am force-stop jp.pxv.android
Start-Sleep -Seconds 1

# 5. Install patched APK if present
if (Test-Path $ApkPath) {
    Write-Host "[5/6] Deploying $([System.IO.Path]::GetFileName($ApkPath))..." -ForegroundColor Yellow
    $InstallOutput = & $Adb -s $DeviceId install -r -d $ApkPath
    Write-Host "  -> $InstallOutput" -ForegroundColor Gray
} else {
    Write-Host "[5/6] $ApkPath not found; skipping install." -ForegroundColor Gray
}

# 6. Launch Pixiv
Write-Host "[6/6] Launching Pixiv..." -ForegroundColor Yellow
& $Adb -s $DeviceId shell monkey -p jp.pxv.android -c android.intent.category.LAUNCHER 1 | Out-Null
Start-Sleep -Seconds 4

Write-Host ""
Write-Host "============================================================" -ForegroundColor Green
Write-Host "  READY: Pixiv is running on $DeviceId" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Write-Host "Useful commands for agent / developer interaction:" -ForegroundColor Cyan
Write-Host "  Deep-link (preferred): Open-Work -IllustId `"<ID>`" -Wait  (from scripts\emulator-cli.ps1)"
Write-Host "  Deep-link (raw adb):   & `"$Adb`" -s $DeviceId shell am start -a android.intent.action.VIEW -d `"https://www.pixiv.net/artworks/<ID>`" -p jp.pxv.android"
Write-Host "  Capture screen:    & `"$Adb`" -s $DeviceId shell screencap -p /sdcard/s.png; & `"$Adb`" -s $DeviceId pull /sdcard/s.png captures/<name>.png"
Write-Host "  Tap coordinate:    & `"$Adb`" -s $DeviceId shell input tap <X> <Y>"
Write-Host "  Swipe / scroll:    & `"$Adb`" -s $DeviceId shell input swipe <X1> <Y1> <X2> <Y2> <duration_ms>"
Write-Host "  Press Back:        & `"$Adb`" -s $DeviceId shell input keyevent 4"
Write-Host ""
