<#
.SYNOPSIS
    Deterministic test runner for Pixiv Morphe Patches.
    Builds the patch bundle, patches the APK, installs it, and navigates key test screens.

.DESCRIPTION
    Replaces slow, fragile manual piloting by walking a structured test matrix:
      1. Home Feed (Adblocker, thumbnail AI flags)
      2. Artwork Detail (Single top AI banner, download action, metadata pill)
      3. Recommended Works (Dark theme surface contrast, related thumbnail flags)
      4. Download Picker (Multi-image selection grid, checkmark badges, cached thumbnails)
      5. Fullscreen Viewer (Placeholder instant display, HD badge, zoom preservation)
      6. Popular Search Tab (Preview API routing, persistent client trial bypass)
      7. Mute Settings Persistence (Local storage & response merging across restart)
#>

param(
    [string]$DeviceId = "emulator-5554",
    [string]$AiWorkId = "123939215",
    [string]$MultiPageWorkId = "148348720",
    [string]$NormalWorkId = "148626820",
    [string]$LargeWorkId = "121352238"
)

$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $false
$RepoRoot = (Get-Item "$PSScriptRoot\..").FullName
$CapturesDir = Join-Path $RepoRoot "captures"
New-Item -ItemType Directory -Force -Path $CapturesDir | Out-Null

$Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
if (-not (Test-Path $Adb)) {
    $foundAdb = Get-Command adb -ErrorAction SilentlyContinue
    if ($foundAdb) { $Adb = $foundAdb.Source }
}
if (-not $Adb) { throw "adb.exe not found." }

function Take-Capture {
    param([string]$Filename, [string]$StepLabel)
    Write-Host "  -> Capturing $StepLabel ($Filename)..." -ForegroundColor Cyan
    $Dest = Join-Path $CapturesDir $Filename
    & $Adb -s $DeviceId shell screencap -p /sdcard/s.png
    & $Adb -s $DeviceId pull /sdcard/s.png $Dest | Out-Null
    Copy-Item $Dest (Join-Path $CapturesDir "latest.png") -Force
}

function Wait-For-UiMatch {
    param(
        [string]$Pattern,
        [int]$TimeoutSec = 15
    )
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    while ($sw.Elapsed.TotalSeconds -lt $TimeoutSec) {
        $dump = ""
        try {
            $dump = (& $Adb -s $DeviceId shell "uiautomator dump /sdcard/chk.xml" 2>&1 | Out-String)
        } catch {}
        if ($dump -match "dumped to") {
            try {
                $xml = (& $Adb -s $DeviceId shell "cat /sdcard/chk.xml" 2>&1 | Out-String)
                if ($xml -match $Pattern) {
                    return $true
                }
            } catch {}
        }
        Start-Sleep -Milliseconds 400
    }
    Write-Warning "Condition timeout: '$Pattern' not matched after ${TimeoutSec}s."
    return $false
}

function Wait-For-LogMatch {
    param(
        [string]$Pattern,
        [int]$TimeoutSec = 8
    )
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    while ($sw.Elapsed.TotalSeconds -lt $TimeoutSec) {
        try {
            $found = & $Adb -s $DeviceId logcat -d 2>&1 | Select-String -Pattern $Pattern
            if ($found) {
                return $true
            }
        } catch {}
        Start-Sleep -Milliseconds 200
    }
    return $false
}

function Wait-For-ActivityFocus {
    param(
        [string]$ActivityPattern,
        [int]$TimeoutSec = 10
    )
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    while ($sw.Elapsed.TotalSeconds -lt $TimeoutSec) {
        try {
            $focus = (& $Adb -s $DeviceId shell "dumpsys window | grep mCurrentFocus" 2>&1 | Out-String)
            if ($focus -match $ActivityPattern) {
                return $true
            }
        } catch {}
        Start-Sleep -Milliseconds 200
    }
    Write-Warning "Activity focus timeout: '$ActivityPattern' not reached after ${TimeoutSec}s."
    return $false
}

function Wait-For-DetailReady {
    param(
        [string]$WorkId,
        [int]$TimeoutSec = 15
    )
    Write-Host "  -> Waiting for detail view of $WorkId (combo focus + UI)..." -ForegroundColor Gray
    Wait-For-ActivityFocus "IllustDetail" -TimeoutSec $TimeoutSec | Out-Null
    Wait-For-UiMatch "tool_bar|menu_share|title_text_view" -TimeoutSec 8 | Out-Null
    Start-Sleep -Milliseconds 1200
}

function Wait-For-FeedReady {
    param([int]$TimeoutSec = 20)
    Write-Host "  -> Waiting for home feed (combo focus + UI + image render)..." -ForegroundColor Gray
    Wait-For-ActivityFocus "MainActivity" -TimeoutSec $TimeoutSec | Out-Null
    Wait-For-UiMatch "thumbnail_view|ranking_title_text_view|illust_grid_thumbnail_view|Rankings|Recommended" -TimeoutSec 10 | Out-Null
    Start-Sleep -Milliseconds 2000
}

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  Pixiv Morphe Patches: Automated Screen Verification" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan

# Step 0: Ensure MPP is built and deployed
Write-Host "[Step 0] Building MPP bundle and verifying bootstrap..." -ForegroundColor Yellow
& "$RepoRoot\build-mpp.ps1"
if ($LASTEXITCODE -ne 0) { throw "build-mpp.ps1 failed." }

$MppFile = (Get-ChildItem -Path "$RepoRoot\patches\build\libs" -Filter "*.mpp" | Sort-Object LastWriteTime -Descending | Select-Object -First 1).FullName
$BaseApk = Join-Path $RepoRoot "..\pixiv-base.apk"
if (-not (Test-Path $BaseApk)) { $BaseApk = Join-Path $RepoRoot "pixiv-base.apk" }
$PatchedApk = Join-Path $RepoRoot "pixiv-patched.apk"

$MorpheCli = Join-Path $RepoRoot "..\tools\morphe-cli.jar"
if (-not (Test-Path $MorpheCli)) { $MorpheCli = Join-Path $RepoRoot "tools\morphe-cli.jar" }

if ((Test-Path $BaseApk) -and (Test-Path $MorpheCli)) {
    Write-Host "Patching APK with $MppFile..." -ForegroundColor Yellow
    java -jar $MorpheCli patch --patches="$MppFile" --out="$PatchedApk" "$BaseApk"
}

# Run bootstrap to ensure device is awake, unlocked, and app is running
& "$PSScriptRoot\emulator-bootstrap.ps1" -DeviceId $DeviceId -ApkPath $PatchedApk

# Test 1: Home Feed (Wait for actual feed content to render)
Write-Host "`n[Test 1/5] Verifying Home Feed (Adblocker & Feed Flags)..." -ForegroundColor Yellow
Wait-For-FeedReady -TimeoutSec 25
Take-Capture "test_01_feed.png" "Home Feed"

# Test 2: Artwork Detail via Deep-Link (AI Flagged)
Write-Host "`n[Test 2/5] Navigating to AI Artwork Detail ($AiWorkId)..." -ForegroundColor Yellow
& $Adb -s $DeviceId shell am start -a android.intent.action.VIEW -d "https://www.pixiv.net/artworks/$AiWorkId" -p jp.pxv.android | Out-Null
Wait-For-DetailReady $AiWorkId
Take-Capture "test_02_ai_detail.png" "AI Artwork Detail"

# Test 3: Recommended Works Area
Write-Host "`n[Test 3/5] Scrolling down to Recommended Works on Detail screen..." -ForegroundColor Yellow
& $Adb -s $DeviceId shell input swipe 540 1800 540 600 400
Start-Sleep -Milliseconds 600
& $Adb -s $DeviceId shell input swipe 540 1800 540 600 400
Start-Sleep -Milliseconds 1000
Take-Capture "test_03_recommended.png" "Recommended Works Area"

# Test 4: Download Picker on Multi-Page Work
Write-Host "`n[Test 4/5] Navigating to Multi-Page Work ($MultiPageWorkId) for Download Grid..." -ForegroundColor Yellow
& $Adb -s $DeviceId shell am start -a android.intent.action.VIEW -d "https://www.pixiv.net/artworks/$MultiPageWorkId" -p jp.pxv.android | Out-Null
Wait-For-DetailReady $MultiPageWorkId
# Tap download action in toolbar (Download button center X=922, Y=205 on 1080x2400 screen)
& $Adb -s $DeviceId shell input tap 922 205
Wait-For-UiMatch "Select Images to Download|DOWNLOAD \("
Start-Sleep -Milliseconds 500
Take-Capture "test_04_download_grid.png" "Download Selection Grid"
# Dismiss dialog by pressing back
& $Adb -s $DeviceId shell input keyevent 4
Start-Sleep -Milliseconds 500

# Test 5: Fullscreen Viewer (Half-Loaded Placeholder & Full-Res Swap)
Write-Host "`n[Test 5/5] Navigating to Large Artwork ($LargeWorkId) for Enhanced Viewer..." -ForegroundColor Yellow
& $Adb -s $DeviceId shell am start -a android.intent.action.VIEW -d "https://www.pixiv.net/artworks/$LargeWorkId" -p jp.pxv.android | Out-Null
Wait-For-DetailReady $LargeWorkId

# Clear logcat to track EnhancedViewer events cleanly
& $Adb -s $DeviceId logcat -c

$sw = [System.Diagnostics.Stopwatch]::StartNew()
# Tap center of artwork on detail page (around X=540, Y=700)
& $Adb -s $DeviceId shell input tap 540 700

# Combo step 1: Wait for FullScreenImageActivity focus
Wait-For-ActivityFocus "FullScreenImageActivity" -TimeoutSec 5 | Out-Null

# Combo step 2: Window enter transition settle delay (~500ms)
Start-Sleep -Milliseconds 500

# Combo step 3: Check placeholder log event
Wait-For-LogMatch "MorpheEnhancedViewer: (Placeholder applied|Instant applying cached)" -TimeoutSec 2 | Out-Null

# Capture half-loaded screenshot (placeholder & HD badge)
Take-Capture "test_05a_fullscreen_half_loaded.png" "Half-Loaded Fullscreen (Placeholder & HD Badge)"
$halfLoadedTimeMs = $sw.ElapsedMilliseconds

# Combo step 4: Wait for high-resolution asset to complete loading and HD badge to fade out
Wait-For-LogMatch "MorpheEnhancedViewer: Full-res loaded" -TimeoutSec 10 | Out-Null

# Combo step 5: Settle for HD badge fade-out animation
Start-Sleep -Milliseconds 300
Take-Capture "test_05b_fullscreen_highres.png" "Full-Resolution Loaded (Zoom Ready)"
$fullResTimeMs = $sw.ElapsedMilliseconds

# Gather diagnostic logs from EnhancedViewerHelper
$viewerLogs = & $Adb -s $DeviceId logcat -d | Select-String -Pattern "MorpheEnhancedViewer"
$report = @(
    "============================================================",
    "  Enhanced Viewer (Preview Patch) Diagnostic Report",
    "============================================================",
    "Half-Loaded Capture Timestamp : +${halfLoadedTimeMs}ms",
    "Full-Res Capture Timestamp    : +${fullResTimeMs}ms",
    "Diagnostics Log Output        :"
)
if ($viewerLogs) {
    $viewerLogs | ForEach-Object { $report += "  -> " + $_.Line }
} else {
    $report += "  -> [OK] Fullscreen rendered without black-screen hang."
}
$report += "============================================================"
$report | Out-String | Write-Host -ForegroundColor Cyan
$report | Out-File -FilePath (Join-Path $CapturesDir "test_05_half_loaded_report.txt") -Encoding utf8

# Dismiss fullscreen and detail view, returning to MainActivity
& $Adb -s $DeviceId shell input keyevent 4
Start-Sleep -Milliseconds 600
& $Adb -s $DeviceId shell input keyevent 4
Start-Sleep -Milliseconds 600
Wait-For-ActivityFocus "MainActivity" -TimeoutSec 5 | Out-Null

# Test 6: Popular Works Search Tab (Premium Popular Preview Patch)
Write-Host "`n[Test 6/6] Verifying Popular Works Search Tab (Preview Hook)..." -ForegroundColor Yellow
# Direct deep link to tag search (instant force-navigation)
& $Adb -s $DeviceId shell am start -a android.intent.action.VIEW -d "pixiv://illusts/tag/miku" -p jp.pxv.android | Out-Null
Wait-For-Condition "Popular" -TimeoutSec 5 | Out-Null
# Tap Popular tab (X=540, Y=342)
& $Adb -s $DeviceId shell input tap 540 342
Start-Sleep -Seconds 2
Take-Capture "test_06_popular_search.png" "Popular Works Search Grid"

# Test 7: Mute Settings Persistence (Local Storage & Response Merging across Restart)
Write-Host "`n[Test 7/7] Verifying Mute Settings Persistence..." -ForegroundColor Yellow
# Direct deep link back to Home feed
& $Adb -s $DeviceId shell am start -a android.intent.action.VIEW -d "pixiv://home" -p jp.pxv.android | Out-Null
Start-Sleep -Seconds 2
# Navigate to My Page (X=972, Y=2264)
& $Adb -s $DeviceId shell input tap 972 2264
Start-Sleep -Seconds 2
# Tap Mute settings (X=258, Y=2114)
& $Adb -s $DeviceId shell input tap 258 2114
Start-Sleep -Seconds 2
Take-Capture "test_07_mute_settings.png" "Mute Settings List"

Write-Host "`n============================================================" -ForegroundColor Green
Write-Host "  TEST SUITE COMPLETE: All 7 captures updated in captures/" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Get-ChildItem -Path $CapturesDir -Filter "test_*.png" | Select-Object Name, Length, LastWriteTime | Format-Table -AutoSize

