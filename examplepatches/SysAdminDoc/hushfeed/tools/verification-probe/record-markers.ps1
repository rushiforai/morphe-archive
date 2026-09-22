<#
.SYNOPSIS
    Records the marker shapes of real videos for the content-filter corpus, and writes the corpus.

.DESCRIPTION
    ContentMarkerCorpusTest replays shapes recorded from TikTok itself through the content
    filters, because hand-built fakes never carried the defaults the server sends (Hide series
    emptied feeds three times over that gap). This script makes that recording repeatable for the
    next TikTok target.

    Recording drives the probe's marker-corpus action on the phone HUSHFEED_DEVICE_SERIAL names,
    only while TikTok is in front: one broadcast, then one swipe, per round. Every newly bound video
    is appended to work/marker-corpus/<route>.jsonl, keyed by a truncated hash of its id so repeats
    are dropped. Before the first round it snapshots what is already bound and leaves that out:
    Hushfeed's recent-binds cache still holds up to 16 videos of the screen you came from.

    -Write turns the four recordings into
    extensions/tiktok/src/test/resources/feed-markers/<route>-<version>.json. The key comes off
    every line, and every value is checked to be a shape token and never content: booleans,
    numbers clamped at 10,000, string lengths, and numerals of up to six digits.

.EXAMPLE
    Load the probe (tools/verification-probe/build.ps1), open the route in TikTok, then record:

    tools/verification-probe/record-markers.ps1 -Route for-you -Rounds 60
    tools/verification-probe/record-markers.ps1 -Route profile -Rounds 60 -FirstTap '270,1450'

    -FirstTap is tapped once after the snapshot, for example a profile grid tile, so the viewer it
    opens binds that route's videos while the swipes move through them. Then:

    tools/verification-probe/record-markers.ps1 -Write -TikTokVersion 47.0.3 -HushfeedBuild 0.58.0
#>
[CmdletBinding(DefaultParameterSetName = 'Record')]
param(
    [Parameter(Mandatory = $true, ParameterSetName = 'Record')]
    [ValidateSet('for-you', 'profile', 'following', 'search')][string]$Route,
    [Parameter(ParameterSetName = 'Record')][int]$Rounds = 20,
    # x1,y1,x2,y2 in panel pixels. The default moves a full-screen feed up one video.
    [Parameter(ParameterSetName = 'Record')][string]$Swipe = '540,1750,540,650',
    [Parameter(ParameterSetName = 'Record')][string]$FirstTap,
    [Parameter(ParameterSetName = 'Record')][int]$SettleMs = 2000,
    [Parameter(Mandatory = $true, ParameterSetName = 'Write')][switch]$Write,
    [Parameter(Mandatory = $true, ParameterSetName = 'Write')][string]$TikTokVersion,
    # The Hushfeed build installed on the phone while recording; its filters gave the verdicts.
    [Parameter(Mandatory = $true, ParameterSetName = 'Write')][string]$HushfeedBuild
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$workDir = Join-Path $root 'work/marker-corpus'
$routes = @('for-you', 'profile', 'following', 'search')

if ($Write) {
    $tokenKinds = @('b', 'n', 's', 'slen', 'sblank', 'snum', 'c', 'm', 'o')
    function Test-Token([object]$Value, [string]$Where) {
        if ($null -eq $Value) { return }
        $names = @($Value.PSObject.Properties.Name)
        if ($names.Count -ne 1 -or $names[0] -notin $tokenKinds) { throw "Not a shape token at ${Where}: $($Value | ConvertTo-Json -Compress)" }
        $inner = $Value.($names[0])
        if ($names[0] -eq 's' -and "$inner" -notmatch '^-?[0-9]{1,6}$') { throw "Text that is not a short numeral at $Where" }
        if ($names[0] -notin @('b', 's', 'o') -and [math]::Abs([long]$inner) -gt 10000) { throw "A number beyond the clamp at $Where" }
    }
    $target = Join-Path $root 'extensions/tiktok/src/test/resources/feed-markers'
    New-Item -ItemType Directory -Force $target | Out-Null
    foreach ($name in $routes) {
        $source = Join-Path $workDir "$name.jsonl"
        if (-not (Test-Path -LiteralPath $source)) { throw "No recording for $name at $source." }
        $items = New-Object System.Collections.Generic.List[string]
        $number = 0
        foreach ($line in Get-Content -LiteralPath $source) {
            $number++
            # The probe writes the key first; only the key comes off, so the rest stays byte for byte.
            if ($line -notmatch '^\{"key":"[0-9a-f]{12}",') { throw "$name line $number does not start with a key." }
            $item = '{' + $line.Substring($Matches[0].Length)
            $parsed = $item | ConvertFrom-Json
            if ((@($parsed.PSObject.Properties.Name) -join ',') -ne 'markers,shape') { throw "$name line $number has unexpected fields." }
            foreach ($field in $parsed.shape.PSObject.Properties) {
                $value = $field.Value
                if ($null -ne $value -and @($value.PSObject.Properties.Name).Count -eq 1 -and $value.PSObject.Properties.Name -in $tokenKinds) {
                    Test-Token $value "$name line $number $($field.Name)"
                } elseif ($null -ne $value) {
                    foreach ($inner in $value.PSObject.Properties) { Test-Token $inner.Value "$name line $number $($field.Name).$($inner.Name)" }
                }
            }
            $items.Add('    ' + $item)
        }
        $text = "{`n" +
            "  `"route`": `"$name`",`n" +
            "  `"tiktok`": `"$TikTokVersion`",`n" +
            "  `"recorded`": `"$((Get-Item -LiteralPath $source).LastWriteTime.ToString('yyyy-MM-dd'))`",`n" +
            "  `"source`": `"tools/verification-probe marker-corpus on the S22 test account, verdicts from Hushfeed $HushfeedBuild`",`n" +
            "  `"items`": [`n" + ($items -join ",`n") + "`n  ]`n}`n"
        $path = Join-Path $target "$name-$TikTokVersion.json"
        [IO.File]::WriteAllText($path, $text, (New-Object System.Text.UTF8Encoding($false)))
        $ordinary = @($items | Where-Object { $_ -like '*"markers":`[`]*' }).Count
        "$name`: $($items.Count) videos, $ordinary ordinary -> $path"
    }
    return
}

$serial = $env:HUSHFEED_DEVICE_SERIAL
if (-not $serial) { throw 'Set HUSHFEED_DEVICE_SERIAL to the serial of the test phone this machine may drive.' }
$swipePoints = @($Swipe -split ',' | ForEach-Object { [int]$_.Trim() })
if ($swipePoints.Count -ne 4) { throw "-Swipe needs four numbers, x1,y1,x2,y2: $Swipe" }
$tapPoint = if ($FirstTap) { @($FirstTap -split ',' | ForEach-Object { [int]$_.Trim() }) } else { @() }
if ($FirstTap -and $tapPoint.Count -ne 2) { throw "-FirstTap needs two numbers, x,y: $FirstTap" }

New-Item -ItemType Directory -Force $workDir | Out-Null
$out = Join-Path $workDir "$Route.jsonl"
$keys = New-Object System.Collections.Generic.HashSet[string]
if (Test-Path -LiteralPath $out) {
    foreach ($line in Get-Content -LiteralPath $out) { [void]$keys.Add(($line | ConvertFrom-Json).key) }
}
$start = $keys.Count

function Assert-TikTok {
    $top = [string](& adb -s $serial shell dumpsys activity activities | Select-String 'topResumedActivity' | Select-Object -First 1)
    if ($top -notmatch 'com\.zhiliaoapp\.musically') { throw "TikTok is not in front: $top" }
}

function Get-Bound {
    & adb -s $serial logcat -c
    & adb -s $serial shell am broadcast -a app.hushfeed.verification.PROBE -p com.zhiliaoapp.musically `
        -e action marker-corpus -e route $Route | Out-Null
    Start-Sleep -Milliseconds 1500
    $prefix = "corpus`t$Route`t"
    foreach ($line in @(& adb -s $serial logcat -d -s HushfeedProbe:V -v raw)) {
        if ($line.StartsWith($prefix)) { $line.Substring($prefix.Length) }
    }
}

Assert-TikTok
$exclude = New-Object System.Collections.Generic.HashSet[string]
foreach ($json in @(Get-Bound)) { [void]$exclude.Add(($json | ConvertFrom-Json).key) }
"left out $($exclude.Count) videos already bound before this route started"
if ($tapPoint.Count -eq 2) {
    Assert-TikTok
    & adb -s $serial shell input tap $tapPoint[0] $tapPoint[1]
    Start-Sleep -Milliseconds 3000
}

for ($round = 1; $round -le $Rounds; $round++) {
    Assert-TikTok
    $new = 0
    foreach ($json in @(Get-Bound)) {
        $key = ($json | ConvertFrom-Json).key
        if ($exclude.Contains($key) -or -not $keys.Add($key)) { continue }
        Add-Content -LiteralPath $out -Value $json
        $new++
    }
    "round ${round}: $new new, $($keys.Count) recorded"
    if ($round -lt $Rounds) {
        Assert-TikTok
        & adb -s $serial shell input swipe $swipePoints[0] $swipePoints[1] $swipePoints[2] $swipePoints[3] 350
        Start-Sleep -Milliseconds $SettleMs
    }
}
"${Route}: $($keys.Count - $start) new this run, $($keys.Count) in $out"
