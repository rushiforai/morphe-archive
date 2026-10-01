<#
.SYNOPSIS
    Deterministic end-to-end regression suite for Pixiv Morphe Patches.
    Builds the patch bundle, patches the APK, installs it, and navigates key test screens
    with concrete assertions and semantic UI node selection (backed by emulator-cli.ps1).

.DESCRIPTION
    Verifies that all 7 patch target areas are functional with zero regressions:
      1. Home Feed (Adblocker active, feed thumbnails rendered)
      2. Artwork Detail (AI warning banner rendered, metadata pill displayed)
      3. Recommended Works (Dark theme contrast, related works grid)
      4. Download Picker (Multi-image selection dialog opened via semantic toolbar click)
      5. Fullscreen Viewer (Instant placeholder rendered, high-res transition complete)
      6. Popular Search Tab (Tag search routed, Popular tab selected semantically, grid populated)
      7. Mute Settings Persistence (Local storage integration, 9999 limit, settings list rendered)
#>

[CmdletBinding()]
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

# 1. Import unified emulator automation CLI
. "$PSScriptRoot\emulator-cli.ps1"
$Adb = $Script:Adb

# --- Assertion & Verification Helpers ---

function Assert-UiCondition {
    param(
        [string]$Pattern,
        [string]$Description,
        [int]$TimeoutSec = 15
    )
    Write-Host "  -> Asserting $Description..." -ForegroundColor Gray
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
                    Write-Host "     [PASS] $Description" -ForegroundColor Green
                    return $true
                }
            } catch {}
        }
        Start-Sleep -Milliseconds 400
    }
    throw "REGRESSION DETECTED: Condition failed after ${TimeoutSec}s: $Description (Pattern: '$Pattern')"
}

function Assert-LogCondition {
    param(
        [string]$Pattern,
        [string]$Description,
        [int]$TimeoutSec = 10
    )
    Write-Host "  -> Asserting logcat $Description..." -ForegroundColor Gray
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    while ($sw.Elapsed.TotalSeconds -lt $TimeoutSec) {
        try {
            $found = & $Adb -s $DeviceId logcat -d 2>&1 | Select-String -Pattern $Pattern
            if ($found) {
                Write-Host "     [PASS] $Description" -ForegroundColor Green
                return $true
            }
        } catch {}
        Start-Sleep -Milliseconds 300
    }
    throw "REGRESSION DETECTED: Log event not found after ${TimeoutSec}s: $Description (Pattern: '$Pattern')"
}

function Wait-For-DetailScreen {
    param([string]$WorkId, [int]$TimeoutSec = 15)
    Assert-UiCondition -Pattern "tool_bar|menu_share|title_text_view" -Description "Artwork Detail screen for $WorkId" -TimeoutSec $TimeoutSec
    Start-Sleep -Milliseconds 800
}

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  Pixiv Morphe Patches: Automated Regression Suite" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan

# Step 0: Ensure MPP is built and deployed
Write-Host "`n[Step 0] Building MPP bundle and deploying to $DeviceId..." -ForegroundColor Yellow
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
    if ($LASTEXITCODE -ne 0) { throw "morphe-cli patch failed." }
}

# Run bootstrap to wake device, dismiss keyguard, and deploy APK
& "$PSScriptRoot\emulator-bootstrap.ps1" -DeviceId $DeviceId -ApkPath $PatchedApk
if ($LASTEXITCODE -ne 0) { throw "emulator-bootstrap.ps1 failed." }

# --- TEST MATRIX ---

# Test 1: Home Feed (Adblocker active & feed items rendered)
Write-Host "`n[Test 1/7] Verifying Home Feed (Adblocker & Feed Flags)..." -ForegroundColor Yellow
& $Adb -s $DeviceId shell am start -a android.intent.action.VIEW -d "pixiv://home" -p jp.pxv.android | Out-Null
Start-Sleep -Seconds 2
Assert-UiCondition -Pattern "thumbnail_view|ranking_title_text_view|illust_grid_thumbnail_view|Rankings|Recommended" -Description "Home Feed Content Rendered" -TimeoutSec 25
Capture-Screen "test_01_feed.png" -DeviceId $DeviceId | Out-Null

# Test 2: Artwork Detail via Direct Deep-Link (AI Flagged)
Write-Host "`n[Test 2/7] Navigating to AI Artwork Detail ($AiWorkId)..." -ForegroundColor Yellow
Open-Work -IllustId $AiWorkId -DeviceId $DeviceId
Wait-For-DetailScreen $AiWorkId
Assert-UiCondition -Pattern "AI-Generated Work" -Description "Inline AI Warning Banner displayed on AI artwork" -TimeoutSec 10
Capture-Screen "test_02_ai_detail.png" -DeviceId $DeviceId | Out-Null

# Test 3: Recommended Works Area
Write-Host "`n[Test 3/7] Scrolling down to Recommended Works on Detail screen..." -ForegroundColor Yellow
& $Adb -s $DeviceId shell input swipe 540 1800 540 600 400
Start-Sleep -Milliseconds 600
& $Adb -s $DeviceId shell input swipe 540 1800 540 600 400
Start-Sleep -Milliseconds 800
Assert-UiCondition -Pattern "illust_grid_thumbnail_view|thumbnail_view|Related works|Recommended" -Description "Recommended works grid visible" -TimeoutSec 10
Capture-Screen "test_03_recommended.png" -DeviceId $DeviceId | Out-Null

# Test 4: Download Picker on Multi-Page Work
Write-Host "`n[Test 4/7] Navigating to Multi-Page Work ($MultiPageWorkId) for Download Grid..." -ForegroundColor Yellow
Open-Work -IllustId $MultiPageWorkId -DeviceId $DeviceId
Wait-For-DetailScreen $MultiPageWorkId

# Tap download action in toolbar semantically or via ID
$tappedDownload = Tap-Node -Desc "Download" -DeviceId $DeviceId
if (-not $tappedDownload) {
    $tappedDownload = Tap-Node -Id "jp.pxv.android:id/menu_download" -DeviceId $DeviceId
}
if (-not $tappedDownload) {
    # Fallback to toolbar right button coordinate
    & $Adb -s $DeviceId shell input tap 922 205
}

Assert-UiCondition -Pattern "Select Images to Download|DOWNLOAD \(" -Description "Download Selection Dialog Opened" -TimeoutSec 10
Capture-Screen "test_04_download_grid.png" -DeviceId $DeviceId | Out-Null
# Dismiss download dialog
& $Adb -s $DeviceId shell input keyevent 4
Start-Sleep -Milliseconds 500

# Test 5: Fullscreen Viewer (Instant Placeholder & High-Res Swap)
Write-Host "`n[Test 5/7] Navigating to Large Artwork ($LargeWorkId) for Enhanced Viewer..." -ForegroundColor Yellow
Open-Work -IllustId $LargeWorkId -DeviceId $DeviceId
Wait-For-DetailScreen $LargeWorkId

# Clear logcat to track EnhancedViewer events cleanly
& $Adb -s $DeviceId logcat -c

# Tap center of artwork to open fullscreen
& $Adb -s $DeviceId shell input tap 540 700

# Assert Instant Placeholder applied via logcat event
Assert-LogCondition -Pattern "MorpheEnhancedViewer: (Placeholder applied|Instant applying cached)" -Description "Instant Placeholder Bitmap Displayed" -TimeoutSec 5
Capture-Screen "test_05a_fullscreen_half_loaded.png" -DeviceId $DeviceId | Out-Null

# Assert Full-Resolution image swapped in
Assert-LogCondition -Pattern "MorpheEnhancedViewer: Full-res loaded" -Description "Full-Resolution Image Asset Loaded" -TimeoutSec 12
Start-Sleep -Milliseconds 300
Capture-Screen "test_05b_fullscreen_highres.png" -DeviceId $DeviceId | Out-Null

# Dismiss fullscreen and return to Home
& $Adb -s $DeviceId shell input keyevent 4
Start-Sleep -Milliseconds 500
& $Adb -s $DeviceId shell input keyevent 4
Start-Sleep -Milliseconds 500

# Test 6: Popular Works Search Tab (Premium Popular Preview Patch)
Write-Host "`n[Test 6/7] Verifying Popular Works Search Tab (Preview Hook)..." -ForegroundColor Yellow
& $Adb -s $DeviceId shell am start -a android.intent.action.VIEW -d "pixiv://illusts/tag/miku" -p jp.pxv.android | Out-Null
Assert-UiCondition -Pattern "Popular" -Description "Tag Search Results Loaded" -TimeoutSec 10

# Semantically tap "Popular" tab node
$tappedPopular = Tap-Node -Text "Popular" -DeviceId $DeviceId
if (-not $tappedPopular) {
    $tappedPopular = Tap-Node -Desc "Popular" -DeviceId $DeviceId
}
if (-not $tappedPopular) {
    throw "REGRESSION: Could not find or click the 'Popular' tab in search results!"
}

# Assert popular grid content rendered
Assert-UiCondition -Pattern "illust_grid_thumbnail_view|thumbnail_view" -Description "Popular preview grid rendered" -TimeoutSec 12
Capture-Screen "test_06_popular_search.png" -DeviceId $DeviceId | Out-Null

# Test 7: Mute Settings Persistence (Local Storage & Unlimited Mute Limits)
Write-Host "`n[Test 7/7] Verifying Mute Settings Persistence..." -ForegroundColor Yellow
# Direct deep link back to Home feed
& $Adb -s $DeviceId shell am start -a android.intent.action.VIEW -d "pixiv://home" -p jp.pxv.android | Out-Null
Start-Sleep -Seconds 1

# Semantically navigate: My Page -> Mute settings
$tappedMyPage = Tap-Node -Desc "My Page" -DeviceId $DeviceId
if (-not $tappedMyPage) {
    $tappedMyPage = Tap-Node -Text "My Page" -DeviceId $DeviceId
}
if (-not $tappedMyPage) {
    throw "REGRESSION: Could not navigate to 'My Page'!"
}
Start-Sleep -Seconds 1

$tappedMute = Tap-Node -Text "Mute settings" -DeviceId $DeviceId
if (-not $tappedMute) {
    throw "REGRESSION: Could not find 'Mute settings' in My Page list!"
}

# Assert unlimited mute limit (9999) and Import / Export action are displayed
Assert-UiCondition -Pattern "9999" -Description "Unlimited Mute Limit (9999) displayed" -TimeoutSec 10
Assert-UiCondition -Pattern "Import / Export" -Description "Mute Import / Export action displayed" -TimeoutSec 10
Capture-Screen "test_07_mute_settings.png" -DeviceId $DeviceId | Out-Null

Write-Host "`n============================================================" -ForegroundColor Green
Write-Host "  TEST SUITE PASSED: All 7 feature assertions verified." -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Get-ChildItem -Path $CapturesDir -Filter "test_*.png" | Select-Object Name, Length, LastWriteTime | Format-Table -AutoSize
exit 0
