param(
    [Parameter(Mandatory = $true)]
    [string]$ApkPath,
    [string]$Serial = "emulator-5554",
    [string]$PackageName = "com.vk.vkvideo",
    [int]$ObservationSeconds = 15
)

$ErrorActionPreference = "Stop"

$sdkRoot = if ($env:ANDROID_SDK_ROOT) {
    $env:ANDROID_SDK_ROOT
} elseif ($env:ANDROID_HOME) {
    $env:ANDROID_HOME
} else {
    "C:\AndroidLab\Sdk"
}

$adb = Join-Path $sdkRoot "platform-tools\adb.exe"
if (-not (Test-Path -LiteralPath $adb)) {
    throw "adb not found at $adb"
}

$resolvedApk = (Resolve-Path -LiteralPath $ApkPath).Path
$device = & $adb -s $Serial get-state 2>$null
if ($device -ne "device") {
    throw "Android device $Serial is not ready"
}

$resultRoot = Join-Path $PSScriptRoot "..\test-results\android"
New-Item -ItemType Directory -Force -Path $resultRoot | Out-Null
$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$logPath = Join-Path $resultRoot "$stamp-$Serial-logcat.txt"
$summaryPath = Join-Path $resultRoot "$stamp-$Serial-summary.txt"

$installOutput = & $adb -s $Serial install -r $resolvedApk 2>&1
$installExitCode = $LASTEXITCODE
$installOutput | Out-Host
if ($installExitCode -ne 0 -or ($installOutput -join "`n") -notmatch "Success") {
    throw "APK installation failed on $Serial"
}
& $adb -s $Serial shell pm clear $PackageName | Out-Host
& $adb -s $Serial logcat -c
& $adb -s $Serial shell am force-stop $PackageName

$activity = (& $adb -s $Serial shell cmd package resolve-activity --brief $PackageName 2>$null | Select-Object -Last 1)
if ([string]::IsNullOrWhiteSpace($activity) -or $activity -match "No activity found") {
    throw "Launcher activity not found for $PackageName"
}
$activity = $activity.Trim()

$startedAt = Get-Date
& $adb -s $Serial shell am start -W -n $activity | Out-Host
Start-Sleep -Seconds $ObservationSeconds

$pidValue = & $adb -s $Serial shell pidof $PackageName 2>$null
& $adb -s $Serial logcat -d -v threadtime | Set-Content -LiteralPath $logPath -Encoding utf8
$log = Get-Content -LiteralPath $logPath -Raw
$fatalPattern = "FATAL EXCEPTION:|Fatal signal|Process: $([regex]::Escape($PackageName))"
$fatal = $log -match $fatalPattern
$alive = -not [string]::IsNullOrWhiteSpace($pidValue)

@(
    "APK: $resolvedApk"
    "Device: $Serial"
    "Activity: $activity"
    "Started: $($startedAt.ToString('o'))"
    "Observed seconds: $ObservationSeconds"
    "Process alive: $alive"
    "PID: $($pidValue -join ',')"
    "Fatal marker: $fatal"
    "Logcat: $logPath"
) | Set-Content -LiteralPath $summaryPath -Encoding utf8

Get-Content -LiteralPath $summaryPath | Out-Host

if (-not $alive -or $fatal) {
    Get-Content -LiteralPath $logPath |
        Select-String -Pattern "FATAL EXCEPTION|AndroidRuntime|Fatal signal|NoSuchFieldError|NoSuchMethodError|VerifyError|UnsatisfiedLinkError" -Context 2,20 |
        Select-Object -Last 120 |
        Out-Host
    throw "Android smoke test failed"
}

Write-Host "Android smoke test passed"
