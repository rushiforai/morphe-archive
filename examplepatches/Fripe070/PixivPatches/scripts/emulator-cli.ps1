<#
.SYNOPSIS
    Streamlined, robust emulator automation toolkit for Pixiv testing.

.DESCRIPTION
    Provides fast, one-liner commands for:
      - Screen capture with automatic loading-screen avoidance and no SD card round-trips
      - UI hierarchy inspection and automatic element tapping
      - Robust deep-linking directly into Pixiv

.EXAMPLE
    . .\scripts\emulator-cli.ps1
    Capture-Screen "detail.png" -WaitForNode "jp.pxv.android:id/tool_bar"
    Tap-Node -Desc "Download"
    Dump-Ui "Download"
#>

$Script:Adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
if (-not (Test-Path $Script:Adb)) {
    $foundAdb = Get-Command adb -ErrorAction SilentlyContinue
    if ($foundAdb) { $Script:Adb = $foundAdb.Source }
}
$Script:DefaultDevice = "emulator-5554"
$Script:RepoRoot = (Get-Item "$PSScriptRoot\..").FullName
$Script:CapturesDir = Join-Path $Script:RepoRoot "captures"

function Get-Adb {
    param([string]$DeviceId = $Script:DefaultDevice)
    return @($Script:Adb, "-s", $DeviceId)
}

function Invoke-AdbShell {
    param([string]$Cmd, [string]$DeviceId = $Script:DefaultDevice)
    $args = @("-s", $DeviceId, "shell") + $Cmd.Split(" ")
    & $Script:Adb $args
}

function Wait-For-ScreenReady {
    <#
    .SYNOPSIS
        Waits until the current screen is neither the Pixiv splash nor an empty spinner.
    #>
    param(
        [string]$MustHaveNode = "",
        [int]$TimeoutSec = 10,
        [string]$DeviceId = $Script:DefaultDevice
    )

    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    while ($sw.Elapsed.TotalSeconds -lt $TimeoutSec) {
        # Check current focused window
        $focus = & $Script:Adb -s $DeviceId shell "dumpsys window | grep mCurrentFocus"
        if ($focus -match "RoutingActivity" -or $focus -match "Splash") {
            Start-Sleep -Milliseconds 400
            continue
        }

        # Check UI hierarchy if a specific target node or general content is expected
        & $Script:Adb -s $DeviceId shell "uiautomator dump /sdcard/temp_dump.xml" 2>&1 | Out-Null
        $xmlContent = & $Script:Adb -s $DeviceId shell "cat /sdcard/temp_dump.xml" 2>&1

        # Check if spinner / splash is active
        $hasSpinner = ($xmlContent -match "ProgressBar" -or $xmlContent -match "CircularProgressIndicator")
        $hasPixivSplash = ($xmlContent -match "Splash" -or $xmlContent -match "brand_image")

        if (-not [string]::IsNullOrEmpty($MustHaveNode)) {
            if ($xmlContent -match [regex]::Escape($MustHaveNode)) {
                return $true
            }
        } else {
            # General readiness: not splash, and either no blocking spinner or has actual content
            $hasContent = ($xmlContent -match "tool_bar" -or $xmlContent -match "RecyclerView" -or $xmlContent -match "ThumbnailView")
            if ($hasContent -and -not $hasPixivSplash) {
                return $true
            }
        }
        Start-Sleep -Milliseconds 500
    }
    return $false
}

function Capture-Screen {
    <#
    .SYNOPSIS
        Captures the emulator screen directly to a local file (no SD card roundtrip).
        Optionally waits until splash/loading spinners dismiss.
    #>
    param(
        [string]$Name = "screen.png",
        [string]$WaitForNode = "",
        [switch]$Wait,
        [int]$TimeoutSec = 8,
        [string]$DeviceId = $Script:DefaultDevice
    )

    New-Item -ItemType Directory -Force -Path $Script:CapturesDir | Out-Null
    $outPath = Join-Path $Script:CapturesDir $Name

    if ($Wait -or -not [string]::IsNullOrEmpty($WaitForNode)) {
        Wait-For-ScreenReady -MustHaveNode $WaitForNode -TimeoutSec $TimeoutSec -DeviceId $DeviceId | Out-Null
    }

    # Robust binary capture via device /sdcard storage + adb pull (avoids PowerShell stdout text encoding corruption)
    & $Script:Adb -s $DeviceId shell screencap -p /sdcard/cli_screencap.png
    & $Script:Adb -s $DeviceId pull /sdcard/cli_screencap.png $outPath | Out-Null
    Copy-Item $outPath (Join-Path $Script:CapturesDir "latest.png") -Force
    Write-Host "[Captured] $outPath ($((Get-Item $outPath).Length) bytes) -> mirrored to captures/latest.png" -ForegroundColor Green
    return $outPath
}

function Dump-Ui {
    <#
    .SYNOPSIS
        Dumps and filters UI nodes on the active screen.
    #>
    param(
        [string]$Filter = "",
        [string]$DeviceId = $Script:DefaultDevice
    )

    & $Script:Adb -s $DeviceId shell "uiautomator dump /sdcard/ui_dump.xml" | Out-Null
    $raw = & $Script:Adb -s $DeviceId shell "cat /sdcard/ui_dump.xml"
    if ([string]::IsNullOrEmpty($Filter)) {
        return $raw
    }

    # Match nodes containing the filter string
    $pattern = "<node[^>]+($([regex]::Escape($Filter)))[^>]+>"
    [regex]::Matches($raw, $pattern) | ForEach-Object {
        $node = $_.Value
        $bounds = [regex]::Match($node, 'bounds="\[(\d+),(\d+)\]\[(\d+),(\d+)\]"')
        $desc = [regex]::Match($node, 'content-desc="([^"]*)"').Groups[1].Value
        $text = [regex]::Match($node, 'text="([^"]*)"').Groups[1].Value
        $resId = [regex]::Match($node, 'resource-id="([^"]*)"').Groups[1].Value

        if ($bounds.Success) {
            $x1 = [int]$bounds.Groups[1].Value; $y1 = [int]$bounds.Groups[2].Value
            $x2 = [int]$bounds.Groups[3].Value; $y2 = [int]$bounds.Groups[4].Value
            $cx = [math]::Round(($x1 + $x2) / 2); $cy = [math]::Round(($y1 + $y2) / 2)
            [PSCustomObject]@{
                Text = $text
                Desc = $desc
                Id = $resId
                Bounds = "[$x1,$y1][$x2,$y2]"
                Center = "($cx, $cy)"
            }
        }
    }
}

function Tap-Node {
    <#
    .SYNOPSIS
        Finds a node by description or resource ID and taps its center.
    #>
    param(
        [string]$Desc = "",
        [string]$Id = "",
        [string]$Text = "",
        [string]$DeviceId = $Script:DefaultDevice
    )

    $query = if ($Desc) { $Desc } elseif ($Id) { $Id } else { $Text }
    $nodes = @(Dump-Ui -Filter $query -DeviceId $DeviceId)
    if ($nodes.Count -eq 0) {
        Write-Warning "No UI node found matching '$query'."
        return $false
    }

    $target = $nodes[0]
    if ($target.Center -match '\((\d+),\s*(\d+)\)') {
        $x = $Matches[1]; $y = $Matches[2]
        Write-Host "[Tap] Tapping '$query' at ($x, $y)..." -ForegroundColor Cyan
        & $Script:Adb -s $DeviceId shell input tap $x $y
        return $true
    }
    return $false
}

function Open-Work {
    <#
    .SYNOPSIS
        Deep-links directly into Pixiv for an artwork ID, bypassing chooser/browser.
    #>
    param(
        [Parameter(Mandatory=$true)][string]$IllustId,
        [switch]$Wait,
        [string]$DeviceId = $Script:DefaultDevice
    )

    Write-Host "[Nav] Opening artwork $IllustId in Pixiv..." -ForegroundColor Cyan
    & $Script:Adb -s $DeviceId shell am start -a android.intent.action.VIEW -d "https://www.pixiv.net/artworks/$IllustId" -p jp.pxv.android | Out-Null
    if ($Wait) {
        Wait-For-ScreenReady -MustHaveNode "jp.pxv.android:id/tool_bar" -DeviceId $DeviceId | Out-Null
    }
}

function Test-EnhancedViewer {
    <#
    .SYNOPSIS
        Captures half-loaded fullscreen placeholder state vs full-res loaded state.
    #>
    param(
        [string]$IllustId = "148348720",
        [string]$DeviceId = $Script:DefaultDevice
    )

    Open-Work -IllustId $IllustId -Wait -DeviceId $DeviceId
    Start-Sleep -Seconds 3

    Write-Host "[Viewer] Clearing logcat and entering fullscreen..." -ForegroundColor Yellow
    & $Script:Adb -s $DeviceId logcat -c

    # Tap center of illustration
    & $Script:Adb -s $DeviceId shell input tap 540 600

    # Capture half-loaded placeholder immediately
    Start-Sleep -Milliseconds 450
    $p1 = Capture-Screen "viewer_half_loaded_${IllustId}.png" -DeviceId $DeviceId
    Write-Host "  -> Captured half-loaded placeholder view: $p1" -ForegroundColor Cyan

    # Wait for full-res load
    Start-Sleep -Seconds 3
    $p2 = Capture-Screen "viewer_fullres_${IllustId}.png" -DeviceId $DeviceId
    Write-Host "  -> Captured full-res loaded view: $p2" -ForegroundColor Cyan

    # Collect diagnostics
    $logs = & $Script:Adb -s $DeviceId logcat -d | Select-String -Pattern "MorpheEnhancedViewer"
    Write-Host "`nEnhanced Viewer Diagnostics:" -ForegroundColor Yellow
    if ($logs) {
        $logs | ForEach-Object { Write-Host "  " $_.Line -ForegroundColor Green }
    } else {
        Write-Host "  [OK] Fullscreen rendered without black screen hang." -ForegroundColor Green
    }

    # Dismiss
    & $Script:Adb -s $DeviceId shell input keyevent 4
}

Add-Type -AssemblyName System.Drawing

function Capture-TallScreen {
    <#
    .SYNOPSIS
        Captures a tall, stitched scrolling screenshot (like native Android scrolling screenshot).
        Ideal for artwork detail pages (capturing header art, metadata, recommended, and comments in one image).
    #>
    param(
        [string]$Name = "tall_detail.png",
        [int]$ScrollSteps = 3,
        [int]$SwipeStartY = 1800,
        [int]$SwipeEndY = 600,
        [int]$SwipeDurationMs = 400,
        [string]$DeviceId = $Script:DefaultDevice
    )

    $tempFiles = @()
    $bitmaps = @()
    $scrollDistance = $SwipeStartY - $SwipeEndY

    try {
        New-Item -ItemType Directory -Force -Path $Script:CapturesDir | Out-Null
        $outPath = Join-Path $Script:CapturesDir $Name

        Write-Host "[TallScreen] Starting scrolling capture ($ScrollSteps steps, scroll dist: ${scrollDistance}px)..." -ForegroundColor Cyan

        for ($i = 0; $i -lt $ScrollSteps; $i++) {
            $tmpFile = [System.IO.Path]::GetTempFileName() + ".png"
            $tempFiles += $tmpFile

            # Capture current viewport cleanly to avoid stdout corruption
            & $Script:Adb -s $DeviceId shell screencap -p /sdcard/cli_tall_step.png
            & $Script:Adb -s $DeviceId pull /sdcard/cli_tall_step.png $tmpFile | Out-Null
            $bmp = [System.Drawing.Bitmap]::FromFile($tmpFile)
            $bitmaps += $bmp

            if ($i -lt ($ScrollSteps - 1)) {
                # Scroll down
                & $Script:Adb -s $DeviceId shell input swipe 540 $SwipeStartY 540 $SwipeEndY $SwipeDurationMs
                Start-Sleep -Milliseconds 800
            }
        }

        # Stitch bitmaps
        $w = $bitmaps[0].Width
        $hFooter = 100

        # Calculate total height: first page minus footer + (subsequent pages * scrollDistance)
        $firstPageH = $bitmaps[0].Height - $hFooter
        $totalHeight = $firstPageH + (($bitmaps.Count - 1) * $scrollDistance)

        $stitched = [System.Drawing.Bitmap]::new($w, $totalHeight)
        $g = [System.Drawing.Graphics]::FromImage($stitched)
        $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic

        # Draw page 0 (all the way to above navigation pill)
        $srcRect0 = [System.Drawing.Rectangle]::new(0, 0, $w, $firstPageH)
        $destRect0 = [System.Drawing.Rectangle]::new(0, 0, $w, $firstPageH)
        $g.DrawImage($bitmaps[0], $destRect0, $srcRect0, [System.Drawing.GraphicsUnit]::Pixel)

        $destY = $firstPageH

        # Draw newly revealed strip from each subsequent scroll
        for ($i = 1; $i -lt $bitmaps.Count; $i++) {
            $srcY = [Math]::Max(0, $bitmaps[$i].Height - $hFooter - $scrollDistance)
            $srcRect = [System.Drawing.Rectangle]::new(0, $srcY, $w, $scrollDistance)
            $destRect = [System.Drawing.Rectangle]::new(0, $destY, $w, $scrollDistance)
            $g.DrawImage($bitmaps[$i], $destRect, $srcRect, [System.Drawing.GraphicsUnit]::Pixel)
            $destY += $scrollDistance
        }

        $g.Dispose()

        # Save result
        $stitched.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)
        $stitched.Dispose()
        Copy-Item $outPath (Join-Path $Script:CapturesDir "latest.png") -Force

        $fileSize = (Get-Item $outPath).Length
        Write-Host "[TallScreen] Generated $outPath (${w}x${totalHeight}px, $fileSize bytes) -> mirrored to captures/latest.png" -ForegroundColor Green
        return $outPath
    }
    finally {
        foreach ($b in $bitmaps) { $b.Dispose() }
        foreach ($f in $tempFiles) { Remove-Item $f -Force -ErrorAction SilentlyContinue }
    }
}

Write-Host "Pixiv Emulator Automation CLI loaded." -ForegroundColor Yellow
Write-Host "Available functions:" -ForegroundColor Gray
Write-Host "  Capture-Screen [-Name <name.png>] [-Wait] [-WaitForNode <id>]" -ForegroundColor DarkCyan
Write-Host "  Capture-TallScreen [-Name <name.png>] [-ScrollSteps <n>]" -ForegroundColor DarkCyan
Write-Host "  Dump-Ui [-Filter <pattern>]" -ForegroundColor DarkCyan
Write-Host "  Tap-Node [-Desc <str>] [-Id <str>] [-Text <str>]" -ForegroundColor DarkCyan
Write-Host "  Open-Work -IllustId <id> [-Wait]" -ForegroundColor DarkCyan
Write-Host "  Test-EnhancedViewer [-IllustId <id>]" -ForegroundColor DarkCyan
