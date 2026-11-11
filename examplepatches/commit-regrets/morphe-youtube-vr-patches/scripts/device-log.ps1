<#
.SYNOPSIS
    Wake the headset, launch a watch URL in the patched app and read the evidence back --
    the AGENTS.md "Device access" recipe as one command.

.DESCRIPTION
    The launch recipe exists because two measured behaviours bite unattended runs: a sleeping
    headset CACHES `am start` instead of running it (the capture comes back empty, no crash,
    no error), and a headset that is not being worn sleeps whatever the power settings say.
    So: `svc power stayon true`, then KEYCODE_WAKEUP, then immediately the launch; logcat is
    cleared first and the extension's lines, the crash buffer, the process and the Guardian
    "launch is blocked" line are read back after a settle wait.

    Playback-dependent checks (onPlaying, ad slots, SponsorBlock fetch) need the app actually
    playing -- measured 2026-10-13, an unworn headset reaches the app but onPlaying never
    arrives. The lines this script prints still prove launch, extension start-up and no crash.

    Serial: pass -Serial or set ANDROID_SERIAL (two transports make bare adb ambiguous).

.EXAMPLE
    pwsh -NoProfile -File scripts\device-log.ps1
    pwsh -NoProfile -File scripts\device-log.ps1 -NoLaunch          # just read logcat again
#>
[CmdletBinding()]
param(
    # The watch URL to open (the app handles watch URLs, so playback starts with no taps).
    [string] $Video = 'https://www.youtube.com/watch?v=aqz-KE-bpKQ',

    # Skip the wake-and-launch and only read the current logcat/crash state.
    [switch] $NoLaunch,

    # Seconds to let the app settle before reading the log.
    [int] $WaitSeconds = 18,

    # adb executable; resolved from PATH / common install locations when not given.
    [string] $Adb,

    # Device serial; defaults to ANDROID_SERIAL, then adb's own pick.
    [string] $Serial
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
$script:Adb = $Adb
. (Join-Path $PSScriptRoot 'lib\resolvers.ps1')

function Fail([string] $message) {
    Write-Host "ERROR: $message" -ForegroundColor Red
    exit 1
}

$adb = Resolve-Adb
# The argument wins, then ANDROID_SERIAL. The indexer form this replaced was wrong in both
# directions: with only ANDROID_SERIAL set (the documented wireless setup) it handed adb an
# empty `-s ''`, and with -Serial given it picked ANDROID_SERIAL instead of the argument.
$serialValue = if ($Serial) { $Serial } else { $env:ANDROID_SERIAL }
$adbTarget = @()
if ($serialValue) { $adbTarget = @('-s', $serialValue) }

# Fail before printing anything that could be mistaken for evidence. With no device (or a stale
# serial) every adb call below fails to stderr and the empty capture would read as "no extension
# lines, empty crash buffer, app not running" -- a dead build rather than a missing connection.
$state = & $adb @adbTarget get-state 2>&1
$stateExit = $LASTEXITCODE
$stateText = ("$state").Trim()
if ($stateExit -ne 0 -or $stateText -ne 'device') {
    $target = if ($serialValue) { " at $serialValue" } else { '' }
    # Parenthesise the whole string BEFORE -f: it binds to the last operand of a `+` chain only,
    # which would leave these placeholders literal (the same trap audit-patched-apk.ps1 hit).
    Fail (("adb cannot reach a device{0} -- `get-state` answered '{1}' (exit {2}). Connect the " +
        "headset or set -Serial/ANDROID_SERIAL; an empty capture from a missing device is not " +
        "evidence about the patch.") -f $target, $stateText, $stateExit)
}

if (-not $NoLaunch) {
    # Wake immediately before the launch: a sleeping headset caches the intent instead of
    # running it, and the capture then comes back with zero matching lines (AGENTS.md).
    & $adb @adbTarget shell svc power stayon true | Out-Null
    & $adb @adbTarget shell input keyevent KEYCODE_WAKEUP | Out-Null
    Start-Sleep -Seconds 2
    & $adb @adbTarget shell logcat -c | Out-Null
    & $adb @adbTarget shell am start -a android.intent.action.VIEW -d $Video `
        -n app.morphe.android.youtube/com.google.android.apps.youtube.vr.activities.YouTubeVrActivity
    Start-Sleep -Seconds $WaitSeconds
}

Write-Host ""
Write-Host "--- extension lines (Ytvr/ytvr/SponsorBlock/VideoQuality/PotUrls/VerifyError) ---" -ForegroundColor Cyan
& $adb @adbTarget shell logcat -d -v time |
    Select-String -Pattern 'Ytvr|ytvr|SponsorBlock|VideoQuality|PotUrls|QuicTransport|VerifyError' |
    Select-Object -Last 60 | ForEach-Object { $_.Line }

Write-Host ""
Write-Host "--- crash buffer ---" -ForegroundColor Cyan
$crash = & $adb @adbTarget shell logcat -b crash -d
if ($crash) { $crash | Select-Object -First 20 | ForEach-Object { Write-Host $_ } }
else { Write-Host "(empty)" }

Write-Host ""
Write-Host "--- process / display ---" -ForegroundColor Cyan
$pid_ = & $adb @adbTarget shell pidof app.morphe.android.youtube
if ($pid_) { Write-Host "app.morphe.android.youtube pid=$pid_" }
else { Write-Host "app process NOT running" -ForegroundColor Yellow }
& $adb @adbTarget shell "dumpsys power | grep mWakefulness"

Write-Host ""
Write-Host "--- Guardian launch-block check ---" -ForegroundColor Cyan
$guard = & $adb @adbTarget shell logcat -d | Select-String -Pattern 'launch is blocked' | Select-Object -First 3
if ($guard) { $guard | ForEach-Object { Write-Host $_.Line -ForegroundColor Yellow } }
else { Write-Host "(none)" }
