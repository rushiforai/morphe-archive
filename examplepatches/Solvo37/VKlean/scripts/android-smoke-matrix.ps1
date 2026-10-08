param(
    [Parameter(Mandatory = $true)]
    [string]$ApkPath,
    [string[]]$Avds = @("VKVideo_API35_Play"),
    [int]$BootTimeoutSeconds = 300,
    [int]$ObservationSeconds = 15
)

$ErrorActionPreference = "Stop"
$sdkRoot = if ($env:ANDROID_SDK_ROOT) { $env:ANDROID_SDK_ROOT } else { "C:\AndroidLab\Sdk" }
$avdRoot = if ($env:ANDROID_AVD_HOME) { $env:ANDROID_AVD_HOME } else { "C:\AndroidLab\Avd" }
$userRoot = if ($env:ANDROID_USER_HOME) { $env:ANDROID_USER_HOME } else { "C:\AndroidLab\User" }
$adb = Join-Path $sdkRoot "platform-tools\adb.exe"
$emulator = Join-Path $sdkRoot "emulator\emulator.exe"
$smokeTest = Join-Path $PSScriptRoot "android-smoke-test.ps1"

$env:ANDROID_SDK_ROOT = $sdkRoot
$env:ANDROID_HOME = $sdkRoot
$env:ANDROID_AVD_HOME = $avdRoot
$env:ANDROID_USER_HOME = $userRoot

$failures = [System.Collections.Generic.List[string]]::new()

& $adb devices |
    Select-String -Pattern "^(emulator-\d+)\s+device$" |
    ForEach-Object {
        $existingSerial = ($_.Line -split "\s+")[0]
        & $adb -s $existingSerial emu kill 2>$null | Out-Null
    }
Start-Sleep -Seconds 3

foreach ($avd in $Avds) {
    Write-Host "=== $avd ==="
    $logRoot = Join-Path $PSScriptRoot "..\test-results\android\emulator"
    New-Item -ItemType Directory -Force -Path $logRoot | Out-Null
    $stdout = Join-Path $logRoot "$avd-stdout.log"
    $stderr = Join-Path $logRoot "$avd-stderr.log"

    $process = Start-Process -FilePath $emulator `
        -ArgumentList @("@$avd", "-no-window", "-no-audio", "-no-boot-anim", "-gpu", "swiftshader_indirect", "-no-snapshot", "-wipe-data") `
        -RedirectStandardOutput $stdout `
        -RedirectStandardError $stderr `
        -WindowStyle Hidden `
        -PassThru

    try {
        $deadline = (Get-Date).AddSeconds($BootTimeoutSeconds)
        $serial = $null

        while ((Get-Date) -lt $deadline) {
            $deviceLine = & $adb devices | Select-String -Pattern "^emulator-\d+\s+device$" | Select-Object -First 1
            if ($deviceLine) {
                $serial = ($deviceLine.Line -split "\s+")[0]
                $boot = & $adb -s $serial shell getprop sys.boot_completed 2>$null
                if (($boot -join "").Trim() -eq "1") { break }
            }
            if ($process.HasExited) { throw "Emulator exited before boot; see $stderr" }
            Start-Sleep -Seconds 5
        }

        if (-not $serial -or (Get-Date) -ge $deadline) {
            throw "Timed out waiting for $avd to boot"
        }

        & $smokeTest -ApkPath $ApkPath -Serial $serial -ObservationSeconds $ObservationSeconds
    } catch {
        $failures.Add("${avd}: $($_.Exception.Message)")
    } finally {
        if ($serial) { & $adb -s $serial emu kill 2>$null | Out-Null }
        if (-not $process.HasExited) {
            $process.WaitForExit(15000) | Out-Null
            if (-not $process.HasExited) { $process.Kill() }
        }
        Start-Sleep -Seconds 3
    }
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Error $_ }
    throw "Android smoke matrix failed on $($failures.Count) profile(s)"
}

Write-Host "Android smoke matrix passed on all profiles"
