[CmdletBinding()]
param(
    [ValidateSet('Capture', 'Snapshot', 'Offline', 'SelfTest')][string]$Mode = 'Capture',
    [string]$HostLog,
    [string]$AndroidLog,
    [string]$AdbPath,
    [ValidatePattern('^[A-Za-z0-9_.:\-]+$')][string]$DeviceSerial,
    [ValidatePattern('^[A-Za-z0-9_.]+$')][string]$Package = 'com.valvesoftware.steamlinkvr',
    [string]$OutputDirectory = (Join-Path ([Environment]::GetFolderPath('Desktop')) ('SteamLink-Colour-' + (Get-Date -Format 'yyyyMMdd-HHmmss-fff')))
)
$ErrorActionPreference = 'Stop'

function Read-SharedLog([string]$Path) {
    # SteamVR keeps its writer open. Also permit rotation while we read.
    $stream = [IO.File]::Open($Path, [IO.FileMode]::Open, [IO.FileAccess]::Read,
        ([IO.FileShare]::ReadWrite -bor [IO.FileShare]::Delete))
    $reader = $null
    try {
        $reader = [IO.StreamReader]::new($stream, [Text.Encoding]::UTF8, $true)
        return $reader.ReadToEnd()
    } finally {
        if ($null -ne $reader) { $reader.Dispose() }
        else { $stream.Dispose() }
    }
}

function Measure-Colour([string[]]$HostLines, [string[]]$AndroidLines) {
    $modes = @(); $formats = @(); $frames = 0; $candidates = @()
    $allocations = @(); $pixelConfigs = @(); $codecs = @()
    foreach ($line in $HostLines) {
        if ($line -match 'Using 10bit mode:\s*([01])\b') { $modes += [int]$Matches[1] }
    }
    foreach ($line in $AndroidLines) {
        if ($line -match 'CCodec\s*:.*Created component \[([A-Za-z0-9_.-]+)\]') { $codecs += $Matches[1] }
        if ($line -match 'CCodecConfig\s*:.*raw\.pixel-format\.value\s*=\s*(\d+)') { $pixelConfigs += [long]$Matches[1] }
        # Candidate words are deliberately NOT decoder proof. Input formats,
        # capability lists and requested configurations can contain these too.
        foreach ($hit in [regex]::Matches($line, '(?i)\b(?:P010|Main10|COLOR_FormatYUVP010|bit-depth|color-format|output-format)\b')) {
            $candidates += $hit.Value.ToLowerInvariant()
        }
        if ($line -notmatch 'GXRSurfaceTrigger.*?(\{"schema":.*)$') { continue }
        try { $entry = $Matches[1] | ConvertFrom-Json } catch { continue }
        if ($entry.schema -ne 2 -or $entry.source -ne 'openxr') { continue }
        if ($entry.event -eq 'create_swapchain' -and $null -ne $entry.result -and $entry.result -eq 0 -and $entry.androidSurfaceSwapchain -eq $false) {
            $allocatedFormat = [long]0
            if ([long]::TryParse([string]$entry.format, [ref]$allocatedFormat)) { $allocations += $allocatedFormat }
        }
        if ($entry.event -ne 'surface_trigger_frame') { continue }
        # Only formats attached to actual projection views, never the static
        # Android-surface terminal quad or an enumerated/supported format list.
        $frameFormats = @()
        foreach ($projection in $entry.projections) {
            foreach ($view in $projection.views) {
                $formatValue = [long]0
                if (-not [long]::TryParse([string]$view.format, [ref]$formatValue)) { $formatValue = 0 }
                $frameFormats += $formatValue
            }
        }
        if ($entry.sourceViewCount -in @(4, 6) -and $frameFormats.Count -eq $entry.sourceViewCount) {
            $frames++; $formats += $frameFormats
        }
    }
    $hostState = 'UNKNOWN - no fresh host negotiation marker'
    $uniqueModes = @($modes | Sort-Object -Unique)
    if ($uniqueModes.Count -gt 1) { $hostState = 'MIXED - 8-bit and 10-bit modes occurred; repeat with 1 connection' }
    elseif ($uniqueModes.Count -eq 1 -and $uniqueModes[0] -eq 1) { $hostState = '10-BIT MODE OBSERVED - host negotiation only' }
    elseif ($uniqueModes.Count -eq 1) { $hostState = '8-BIT MODE OBSERVED - host negotiation only' }
    $uniqueFormats = @($formats | Sort-Object -Unique)
    $xrState = 'UNKNOWN - no projection format telemetry'
    if ($uniqueFormats.Count -gt 0) {
        if (@($uniqueFormats | Where-Object { $_ -in @(32856, 35907) }).Count -gt 0) {
            $xrState = '8-BIT BOTTLENECK OBSERVED - sampled projection includes RGBA8/sRGB8'
        } elseif (@($uniqueFormats | Where-Object { $_ -notin @(32857, 34842, 34836) }).Count -eq 0) {
            $xrState = 'HIGH-PRECISION STORAGE OBSERVED - does not prove preserved 10-bit values'
        } else { $xrState = 'UNKNOWN FORMAT - needs graphics-API interpretation' }
    }
    [pscustomobject]@{
        Host = $hostState
        Decoder = 'UNKNOWN - stock logs do not establish actual decoded sample precision'
        OpenXR = $xrState
        Screen = 'UNVERIFIED - compositor/panel precision is not measured by this tool'
        HostModes = $uniqueModes
        ProjectionFormats = $uniqueFormats
        SampledFrames = $frames
        DecoderCandidateWords = @($candidates | Sort-Object -Unique)
        HostLineCount = @($HostLines | Where-Object { $_.Trim() }).Count
        AndroidLineCount = @($AndroidLines | Where-Object { $_ -match '^\d\d-\d\d\s' }).Count
        TraceLineCount = @($AndroidLines | Where-Object { $_ -match 'GXRSurfaceTrigger' }).Count
        AllocatedSwapchainFormats = @($allocations | Sort-Object -Unique)
        CodecComponents = @($codecs | Sort-Object -Unique)
        CodecPixelFormatConfigurations = @($pixelConfigs | Sort-Object -Unique)
    }
}

function Invoke-AdbText([string[]]$CommandArgs) {
    $argsList = @()
    if ($DeviceSerial) { $argsList += @('-s', $DeviceSerial) }
    $argsList += $CommandArgs
    $start = New-Object Diagnostics.ProcessStartInfo
    $start.FileName = $AdbPath
    $start.Arguments = (($argsList | ForEach-Object { '"' + $_.Replace('"', '\"') + '"' }) -join ' ')
    $start.UseShellExecute = $false
    $start.CreateNoWindow = $true
    $start.RedirectStandardOutput = $true
    $start.RedirectStandardError = $true
    $process = New-Object Diagnostics.Process
    $process.StartInfo = $start
    try {
        [void]$process.Start()
        $stdout = $process.StandardOutput.ReadToEndAsync()
        $stderr = $process.StandardError.ReadToEndAsync()
        if (-not $process.WaitForExit(20000)) { $process.Kill(); throw 'ADB timed out after 20 seconds.' }
        $result = $stdout.GetAwaiter().GetResult()
        $errorText = $stderr.GetAwaiter().GetResult()
        if ($process.ExitCode -ne 0) { throw ('ADB command failed: ' + $errorText.Trim()) }
        return $result
    } finally { $process.Dispose() }
}

if ($Mode -eq 'SelfTest') {
    function Assert($condition, $name) { if (-not $condition) { throw "FAILED: $name" } }
    $empty = Measure-Colour @() @()
    Assert ($empty.Host -like 'UNKNOWN*' -and $empty.OpenXR -like 'UNKNOWN*') 'missing evidence'
    $ten = Measure-Colour @('Using 10bit mode: 1') @('codec capability Main10 P010')
    Assert ($ten.Host -like '10-BIT*' -and $ten.Decoder -like 'UNKNOWN*') 'capability is not decoder proof'
    $mixed = Measure-Colour @('Using 10bit mode: 1', 'Using 10bit mode: 0') @()
    Assert ($mixed.Host -like 'MIXED*') 'mixed sessions'
    $prefix = '01-01 12:00:00.000 100 100 I GXRSurfaceTrigger: '
    $frame = '{"schema":2,"source":"openxr","event":"surface_trigger_frame","sourceViewCount":4,"projections":[{"views":[{"format":35907},{"format":35907}]},{"views":[{"format":35907},{"format":35907}]}]}'
    $eight = Measure-Colour @() @($prefix + $frame)
    Assert ($eight.OpenXR -like '8-BIT*' -and $eight.SampledFrames -eq 1) 'projection sRGB8'
    $high = Measure-Colour @() @($prefix + $frame.Replace('35907', '32857'))
    Assert ($high.OpenXR -like 'HIGH-PRECISION*' -and $high.Screen -like 'UNVERIFIED*') 'RGB10 is not panel proof'
    $quad = Measure-Colour @() @($prefix + '{"schema":2,"source":"openxr","event":"surface_trigger_create_result","format":35907}')
    Assert ($quad.OpenXR -like 'UNKNOWN*') 'ignore terminal quad'
    $unknown = Measure-Colour @() @($prefix + $frame.Replace('35907', '0'))
    Assert ($unknown.OpenXR -like 'UNKNOWN FORMAT*') 'unknown format'
    $malformed = Measure-Colour @() @($prefix + '{"schema":broken')
    Assert ($malformed.OpenXR -like 'UNKNOWN*') 'malformed JSON'
    $incomplete = Measure-Colour @() @($prefix + $frame.Replace('"sourceViewCount":4', '"sourceViewCount":6'))
    Assert ($incomplete.OpenXR -like 'UNKNOWN*') 'incomplete view contract'
    $sourceFile = Join-Path $PSScriptRoot '../../extensions/resolution-trace-layer/src/android_surface_trigger_passthrough_layer.cpp'
    $traceSource = [IO.File]::ReadAllText((Resolve-Path $sourceFile))
    Assert ($traceSource.Contains('kLogTag[] = "GXRSurfaceTrigger"') -and $traceSource.Contains('emit("surface_trigger_frame"')) 'trace source contract'
    $badFormat = Measure-Colour @() @($prefix + $frame.Replace('35907', '"invalid"'))
    Assert ($badFormat.OpenXR -like 'UNKNOWN FORMAT*') 'nonnumeric format'
    $lockedLog = [IO.Path]::GetTempFileName()
    $writer = $null
    try {
        $writer = [IO.File]::Open($lockedLog, [IO.FileMode]::Open, [IO.FileAccess]::Write, [IO.FileShare]::Read)
        $bytes = [Text.Encoding]::UTF8.GetBytes("Using 10bit mode: 1`n")
        $writer.Write($bytes, 0, $bytes.Length)
        $writer.Flush()
        Assert ((Read-SharedLog $lockedLog) -eq "Using 10bit mode: 1`n") 'read with active writer'
        $writer.Write($bytes, 0, $bytes.Length)
        $writer.Flush()
        Assert ((Read-SharedLog $lockedLog) -eq ("Using 10bit mode: 1`n" * 2)) 'read after writer appends'
        $writer.Dispose(); $writer = $null
        $writer = [IO.File]::Open($lockedLog, [IO.FileMode]::Open, [IO.FileAccess]::Write, [IO.FileShare]::None)
        $readFailed = $false
        try { [void](Read-SharedLog $lockedLog) } catch { $readFailed = $true }
        Assert $readFailed 'exclusive lock must not return empty evidence'
    } finally {
        if ($null -ne $writer) { $writer.Dispose() }
        Remove-Item -LiteralPath $lockedLog
    }
    $config = Measure-Colour @() @('09-06 13:30:12.915 10742 11402 D CCodecConfig: c2::u32 raw.pixel-format.value = 54')
    Assert ($config.CodecPixelFormatConfigurations -contains 54 -and $config.Decoder -like 'UNKNOWN*') 'P010 config is not buffer proof'
    $allocation = Measure-Colour @() @($prefix + '{"schema":2,"source":"openxr","event":"create_swapchain","result":0,"format":35907,"androidSurfaceSwapchain":false}')
    Assert ($allocation.AllocatedSwapchainFormats -contains 35907 -and $allocation.SampledFrames -eq 0 -and $allocation.OpenXR -like 'UNKNOWN*') 'allocation is not submitted projection'
    $failedAllocation = Measure-Colour @() @($prefix + '{"schema":2,"source":"openxr","event":"create_swapchain","result":-1,"format":35907,"androidSurfaceSwapchain":false}')
    Assert ($failedAllocation.AllocatedSwapchainFormats.Count -eq 0) 'failed allocation excluded'
    Write-Host 'PASS: 17 offline checks, including active-writer reads. No ADB or SteamVR access.'
    return
}

$notes = @(); $hostLines = @(); $androidLines = @()
$historyHost = @(); $historyAndroid = @()
if ($Mode -eq 'Offline') {
    if (-not $HostLog -and -not $AndroidLog) { throw 'Offline mode needs -HostLog and/or -AndroidLog.' }
    if ($HostLog) { $hostLines = @((Read-SharedLog $HostLog) -split '\r?\n') }
    if ($AndroidLog) { $androidLines = @((Read-SharedLog $AndroidLog) -split '\r?\n') }
    $notes += 'OFFLINE INPUT: age, application identity and connection alignment are not verified. Findings describe supplied logs only.'
} else {
    if (-not $HostLog) {
        $steamPath = (Get-ItemProperty 'HKCU:\Software\Valve\Steam' -ErrorAction SilentlyContinue).SteamPath
        if ($steamPath) { $HostLog = Join-Path $steamPath 'logs\driver_vrlink.txt' }
        else { $HostLog = Join-Path ${env:ProgramFiles(x86)} 'Steam\logs\driver_vrlink.txt' }
    }
    if (-not $AdbPath) {
        $adbCommand = Get-Command adb.exe -ErrorAction SilentlyContinue
        if ($adbCommand) { $AdbPath = $adbCommand.Source }
        else {
            $sdkAdb = Join-Path $env:LOCALAPPDATA 'Android\Sdk\platform-tools\adb.exe'
            if (Test-Path -LiteralPath $sdkAdb) { $AdbPath = $sdkAdb }
            else {
                $bundledAdb = Join-Path $PSScriptRoot '../../../Tools/install/platform-tools/adb.exe'
                if (Test-Path -LiteralPath $bundledAdb) { $AdbPath = (Resolve-Path $bundledAdb).Path }
            }
        }
    }
    $deviceStart = $null
    if ($AdbPath) {
        try {
            # Device clock avoids assuming PC/device time synchronization.
            $deviceStart = (Invoke-AdbText @('shell', 'date', '+%m-%dT%H:%M:%S')).Trim().Replace('T', ' ')
            if ($deviceStart -notmatch '^\d\d-\d\d \d\d:\d\d:\d\d$') { throw 'Unexpected device date format.' }
        } catch { $notes += ('Headset capture unavailable: ' + $_.Exception.Message); $deviceStart = $null }
    } else { $notes += 'ADB not found. Install Android platform-tools or pass -AdbPath. Host capture still available.' }
    $before = ''
    try {
        if (Test-Path -LiteralPath $HostLog) {
            $before = Read-SharedLog $HostLog
            $historyHost = @($before -split '\r?\n')
        }
    } catch {
        $before = $null
        $notes += 'Host baseline could not be read. Host evidence omitted to avoid stale results; repeat capture.'
        Write-Warning 'Host log unavailable; continuing with headset capture. Host result will be UNKNOWN.'
    }
    if ($Mode -eq 'Capture') {
        Write-Host ''
        Write-Host 'Ready. Now connect Steam Link to SteamVR and stream for 20-30 seconds.' -ForegroundColor Cyan
        Write-Host 'For startup telemetry, fully close and reopen the headset Steam Link app AFTER Ready.'
        Write-Host 'A stream reconnect alone may reuse the XR session and omit its first-frame telemetry.'
        Write-Host 'Keep this capture to 1 connection. Leave streaming active when pressing Enter.'
        [void](Read-Host 'Press Enter when ready to collect')
    } else { Write-Host 'Reading buffered context; no restart or connection capture.' -ForegroundColor Cyan }
    if ($null -ne $before) {
        try {
            if (Test-Path -LiteralPath $HostLog) {
                $after = Read-SharedLog $HostLog
                if ($after.StartsWith($before, [StringComparison]::Ordinal)) {
                    $hostLines = @($after.Substring($before.Length) -split '\r?\n')
                } else { $notes += 'Host log rotated/truncated: discarded to avoid stale results. Repeat capture.' }
            } else { $notes += 'Host log not found. Pass -HostLog with the driver_vrlink.txt path.' }
        } catch {
            $hostLines = @()
            $notes += 'Host final log could not be read. Host evidence unavailable; repeat capture.'
        }
    }
    if ($deviceStart) {
        try {
            $appPid = (Invoke-AdbText @('shell', 'pidof', $Package)).Trim()
            if ($appPid -notmatch '^\d+$') { throw 'Expected 1 running Steam Link process. Check -Package and leave streaming active.' }
            $tagFilters = @('GXRSurfaceTrigger:V', 'CCodec:V', 'CCodecConfig:V', 'MediaCodec:V', '*:S')
            if ($Mode -eq 'Capture') {
                $androidLines = @((Invoke-AdbText (@('logcat', '-d', '-v', 'threadtime', '-T', ($deviceStart + '.000'), ('--pid=' + $appPid)) + $tagFilters)) -split '\r?\n')
            }
            if ($Mode -eq 'Capture') {
                $notes += 'Fresh Android logcat is bounded by device start time and current Steam Link PID. Only selected colour/codec tags are read. Codec-service logs outside that PID are excluded. Ring-buffer loss is possible.'
            }
            try {
                $historyAndroid = @((Invoke-AdbText (@('logcat', '-d', '-v', 'threadtime', ('--pid=' + $appPid)) + $tagFilters)) -split '\r?\n')
                $notes += 'Buffered context reads retained logs for that PID with selected colour/codec tags; it may overlap capture or predate this connection. PID reuse is possible. Never treated as fresh evidence.'
            } catch { $notes += 'Buffered Android context unavailable; fresh capture retained.' }
        } catch { $notes += ('Headset capture failed: ' + $_.Exception.Message) }
    }
}
if ($Mode -eq 'Snapshot') {
    $hostLines = @(); $androidLines = @()
    $notes += 'SNAPSHOT: no fresh connection capture was attempted. Read BUFFERED CONTEXT below.'
}
$analysis = Measure-Colour $hostLines $androidLines
$history = Measure-Colour $historyHost $historyAndroid
if ($Mode -eq 'Capture') {
    if ($analysis.HostLineCount -eq 0) { $notes += 'No usable new host lines: the log may be idle, unavailable, or the selected path may be wrong.' }
    if ($analysis.AndroidLineCount -eq 0) { $notes += 'No timestamped app log lines collected in this window. A successful ADB command alone does not establish useful capture.' }
    if ($analysis.TraceLineCount -eq 0) { $notes += 'No GXRSurfaceTrigger tag in fresh app logs. Startup may have been missed, the trace may be absent/disabled, or buffered lines may be lost.' }
}
$report = @(
    'STEAM LINK COLOUR DEPTH',
    ('Captured: ' + (Get-Date -Format o)),
    '',
    ('PC / encoder: ' + $analysis.Host),
    ('Headset decoder: ' + $analysis.Decoder),
    ('OpenXR image: ' + $analysis.OpenXR),
    ('Physical screen: ' + $analysis.Screen),
    '',
    ('Host mode values: ' + ($analysis.HostModes -join ', ')),
    ('Sampled projection formats: ' + ($analysis.ProjectionFormats -join ', ')),
    ('Sampled frames: ' + $analysis.SampledFrames),
    ('Capture counts: host lines=' + $analysis.HostLineCount + '; app log lines=' + $analysis.AndroidLineCount + '; trace lines=' + $analysis.TraceLineCount),
    ('Decoder candidate words (NOT proof): ' + ($analysis.DecoderCandidateWords -join ', ')),
    ('Codec components in capture: ' + ($analysis.CodecComponents -join ', ')),
    ('Codec pixel-format configurations (not buffer proof): ' + ($analysis.CodecPixelFormatConfigurations -join ', ')),
    ('Successfully allocated swapchain formats (not submission proof): ' + ($analysis.AllocatedSwapchainFormats -join ', ')),
    '',
    'BUFFERED CONTEXT - NOT CURRENT-CONNECTION PROOF:',
    ('Host modes present BEFORE capture: ' + ($history.HostModes -join ', ')),
    ('Projection formats in buffered PID logs (may overlap capture): ' + ($history.ProjectionFormats -join ', ')),
    ('Buffered projection frame samples: ' + $history.SampledFrames),
    ('Buffered successful swapchain allocation formats: ' + ($history.AllocatedSwapchainFormats -join ', ')),
    ('Buffered codec components: ' + ($history.CodecComponents -join ', ')),
    ('Buffered codec pixel-format configurations: ' + ($history.CodecPixelFormatConfigurations -join ', ')),
    '',
    'Format key (this GLES trace): 35907=GL_SRGB8_ALPHA8, 32856=GL_RGBA8 (8-bit RGB);',
    '32857=GL_RGB10_A2 (10-bit RGB); 34842=GL_RGBA16F; 34836=GL_RGBA32F.',
    'Codec2 raw.pixel-format 54 = Android P010 (10-bit storage configuration, not sample validation).',
    'Trace samples projection formats on successful xrEndFrame; it does not establish panel output.',
    '',
    'NEXT STEP:',
    '8-bit projection: that sampled stage stores only 8 bits/channel, even with a 10-bit stream.',
    'Unknown decoder: need output-format + actual output-buffer format tied to the active decoder.',
    'High-precision projection: still need decoded sample/readback evidence and compositor/display evidence.',
    'A gradient, screenshot, Main10 profile, highp shader or HDR flag alone cannot prove the full path.',
    '',
    'CAPTURE NOTES:'
) + $notes
# Save only derived values, not raw device logs or host identifiers.
New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null
$reportPath = Join-Path $OutputDirectory 'READ-ME.txt'
$report | Set-Content -LiteralPath $reportPath -Encoding UTF8
[pscustomobject]@{ Schema = 2; Mode = $Mode; Findings = $analysis; BufferedContext = $history; Notes = $notes } |
    ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $OutputDirectory 'summary.json') -Encoding UTF8
$report | ForEach-Object { Write-Host $_ }
Write-Host "`nReport: $reportPath" -ForegroundColor Cyan
