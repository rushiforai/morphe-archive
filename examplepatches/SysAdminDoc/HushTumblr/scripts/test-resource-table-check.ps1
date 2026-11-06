<#
.SYNOPSIS
    Exercise ResourceTableCheck.java against small APKs that aapt2 builds.

.DESCRIPTION
    The stock APK is Tumblr's own package, id 0x7f: two colors (one with a night value), a theme
    on a base theme, and one layout. A resource patch has Morphe rebuild the whole table, and a
    layout the rebuild drops only fails when the app inflates it (Hushfeed upstream #84, where
    this check came from). Each patched APK moves one thing. An unchanged table, a rewritten color
    and a renamed entry pass and are reported. A lost layout, a layout file missing from the
    archive, a changed layout file, a lost style item, a changed parent, a lost night value, a
    reference to nothing, a renamed type and a missing package fail, and each failure names what
    it lost. APKMirror ships Tumblr as a split bundle, and merging one into one APK drops the
    split descriptor bundletool
    wrote (xml/splits0): that loss passes and is reported, and any other lost xml resource still
    fails.

    With an allowlist each change has to be a line of [rebuild] or of a selected patch, and each
    line allows one change. An added resource is held to every value it holds (a style's parent and
    items, with #{option} for the color a patch option sets), an added file to its bytes, and the
    same resources added in a second package fail the lines made for one.

    A real split bundle too, built by aapt2 and merged by the CLI's own merger through
    MergeSplits.java, in both shapes such a bundle can come in: an XAPK laid out the way APKPure
    lays out a split Tumblr build (the base named for the package, config splits, manifest.json and
    icon.png) and an .apkm. Those APKs are unsigned, so they go through the steps Get-MergedApk
    takes once the signatures pass (unpack, lock and hash, merge exactly those bytes), called by
    this test alone. A resource only the split carries is in each merge, and a table that lost it
    fails against the merge while base.apk would only have called it added. Get-MergedApk refuses
    an unsigned plain APK and a bundle with no APK before anything is copied or merged.
    MergeSplits.java itself refuses a bundle handed to it straight, a directory holding anything
    but regular .apk files, and a directory that isn't exactly the APKs it was handed hashes of,
    with exactly those bytes.

    Then the same APKs signed with keytool and apksigner, one key standing for Tumblr's and one for
    anybody else's: a bundle whose APKs all carry the declared key merges, and Assert-AuthenticMerge
    takes that merge as the one this process made and holds. An unsigned universal APK passes as
    the merge of the same-named bundle beside it. An unsigned split, a split signed by the other key,
    a split changed after signing, and a universal APK whose dex, native libraries, assets or res
    files aren't the bundle's are each refused before the JDK starts, leaving nothing behind. A
    universal APK made only of the bundle's own files is still refused when it isn't the bundle's
    merge: one that left an asset out, one with the base APK's resource table and nothing the split
    adds, and one with a signed res file under another name. Those take the merge to tell, so the
    JDK runs for them, and they leave nothing behind either.

    Then a second process of the same user, which can write to anything this one can, tried at
    every point where a path used to be read twice. MergeSplits.java is held to the bytes of the
    CLI's own ApkMerger.merge first. A split put beside the checked ones during the merge isn't
    merged. An APK being merged, the merger's compression buffer and the APK being written can't
    be written, mapped, deleted, renamed or replaced, and neither can a merge the scripts hold
    until they let it go. A destination or an unpacked APK another process already has open to
    write, or mapped, is refused or left behind. An APK put in the merge's place between the
    merger closing it and the scripts opening it is refused by the digest the merger printed. A
    forged merge with a record written to match is refused, and the merge's own bytes pass with
    no record. A junction turned during the merge moves nothing.

    Last, what a device with 16 KB pages needs of a patched APK (Assert-PageAlignment), with the
    build-tools' zipalign and apksigner: an APK aligned and then signed passes, the same files left
    as jar packed them fail zipalign -c -P 16 -v 4, and an added library with a 4 KB LOAD segment,
    a GNU_RELRO that ends inside a 16 KB page or program headers that run past its end is refused
    on its own in an aligned APK. The same faults in a library the stock APK holds come back as
    target limitations on a signed APK, and a stock library rewritten to fit is refused.
#>
[CmdletBinding()]
param(
    [string]$Root,
    [string]$Java,
    [string]$DesktopJar,
    [string]$Aapt2
)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')

function Assert-True {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { throw $Message }
}

# Native calls run with Continue: under Stop, Windows PowerShell 5.1 (the hook's fallback host)
# turns any stderr line, a JDK warning included, into a terminating error. The exit code is judged.
function Invoke-Checked {
    param([string]$Program, [string[]]$Arguments, [string]$Description)
    $ErrorActionPreference = 'Continue'
    $output = @(& $Program @Arguments 2>&1 | ForEach-Object { "$_" })
    if ($LASTEXITCODE -ne 0) {
        throw "$Description exited $LASTEXITCODE.`n$($output -join "`n")"
    }
}

$package = 'com.tumblr'
$manifest = @"
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="$package">
    <application android:theme="@style/SearchTheme" />
</manifest>
"@
$colors = @'
<resources>
    <color name="accent">#ffff3b5c</color>
    <color name="surface">#ff121212</color>
</resources>
'@
$nightColors = @'
<resources>
    <color name="surface">#ff000000</color>
</resources>
'@
$styles = @'
<resources>
    <style name="BaseTheme">
        <item name="android:windowNoTitle">true</item>
    </style>
    <style name="SearchTheme" parent="BaseTheme">
        <item name="android:windowBackground">@color/surface</item>
        <item name="android:textColorPrimary">@color/accent</item>
    </style>
</resources>
'@
$layout = @'
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent" android:layout_height="match_parent"
    android:background="@color/surface" />
'@

# What a second process tries on a file, one step a line (step|path|argument), and what came of each:
# done, or refused with the error Windows gave. With -Ready it keeps what the hold steps opened until
# -Release is written, then writes through each of them and leaves.
$intruderText = @'
param([string]$Plan, [string]$Ready, [string]$Release)
$ErrorActionPreference = 'Stop'
$kept = New-Object System.Collections.Generic.List[object]
$all = [System.IO.FileShare]'ReadWrite, Delete'
function Step([string]$Name, [string]$Path, [scriptblock]$Do) {
    try { & $Do; "$Name|$Path|done" }
    catch {
        $e = $_.Exception
        while ($e.InnerException) { $e = $e.InnerException }
        "$Name|$Path|refused: $($e.GetType().Name) " + ('0x{0:x8}' -f $e.HResult)
    }
}
foreach ($line in [System.IO.File]::ReadAllLines($Plan)) {
    $op, $path, $arg = $line.Split('|')
    switch ($op) {
        'read' { Step $op $path { $s = [System.IO.File]::Open($path, 'Open', 'Read', $all); try { [void]$s.ReadByte() } finally { $s.Dispose() } } }
        'write' { Step $op $path { $s = [System.IO.File]::Open($path, 'Open', 'Write', $all); try { $s.WriteByte(0x58) } finally { $s.Dispose() } } }
        'append' { Step $op $path { $s = [System.IO.File]::Open($path, 'Append', 'Write', $all); try { $s.WriteByte(0x58) } finally { $s.Dispose() } } }
        'delete' { Step $op $path { [System.IO.File]::Delete($path); if ([System.IO.File]::Exists($path)) { throw 'it is still there' } } }
        'move' { Step $op $path { [System.IO.Directory]::Move($path, $arg) } }
        'copy' { Step $op $path { [System.IO.File]::Copy($arg, $path, $true) } }
        'create' { Step $op $path { [System.IO.File]::Copy($arg, $path, $false) } }
        'unlink' { Step $op $path { [System.IO.Directory]::Delete($path, $false) } }
        'junction' { Step $op $path { New-Item -ItemType Junction -Path $path -Target $arg -ErrorAction Stop | Out-Null } }
        # [NullString]: $null would be handed over as an empty map name, which is refused for that.
        'map' { Step $op $path {
                $m = [System.IO.MemoryMappedFiles.MemoryMappedFile]::CreateFromFile($path, 'Open', [NullString]::Value, 0, 'ReadWrite')
                try { $v = $m.CreateViewAccessor(0, 1); try { $v.Write(0, [byte]0x58) } finally { $v.Dispose() } } finally { $m.Dispose() }
            } }
        'hold-writer' { Step $op $path { $kept.Add([System.IO.File]::Open($path, 'Open', 'ReadWrite', $all)) } }
        # The mapping is let go of and the view kept: no handle to the file is left, only the view.
        'hold-map' { Step $op $path {
                $m = [System.IO.MemoryMappedFiles.MemoryMappedFile]::CreateFromFile($path, 'Open', [NullString]::Value, 0, 'ReadWrite')
                try { $kept.Add($m.CreateViewAccessor(0, 1)) } finally { $m.Dispose() }
            } }
        default { "$op|$path|refused: no such step" }
    }
}
if ($Ready) {
    [System.IO.File]::WriteAllText($Ready, 'ready')
    # Until it is let go, or the test's folder has gone from under it.
    while (-not (Test-Path -LiteralPath $Release) -and (Test-Path -LiteralPath $Plan)) { Start-Sleep -Milliseconds 20 }
    foreach ($thing in $kept) {
        Step 'late-write' $thing.GetType().Name {
            if ($thing -is [System.IO.FileStream]) { $thing.Position = 0; $thing.WriteByte(0x59); $thing.Flush() }
            else { $thing.Write(0, [byte]0x59); $thing.Flush() }
        }
        $thing.Dispose()
    }
}
'@

# Stands in for java in the swap cases: Get-MergedApk runs it as it runs the JDK. It starts the real
# one with -Dhushtumblr.merge.hold, so MergeSplits.java stops at each point it can be held at, runs
# the case's steps there and once the JDK has exited (closed), and hands back what the JDK printed
# and its exit code. $global:HushTumblrHeldJava carries the case: Java, Work, At and Reached.
$heldJavaText = @'
$plan = $global:HushTumblrHeldJava
$hold = Join-Path $plan.Work ('hold-' + [guid]::NewGuid().ToString('N'))
[void][System.IO.Directory]::CreateDirectory($hold)
$quoted = @(@("-Dhushtumblr.merge.hold=$hold") + $args | ForEach-Object {
        '"' + (([string]$_) -replace '(\\*)"', '$1$1\"' -replace '(\\+)$', '$1$1') + '"' })
$info = New-Object System.Diagnostics.ProcessStartInfo
$info.FileName = $plan.Java
$info.Arguments = $quoted -join ' '
$info.UseShellExecute = $false
$info.CreateNoWindow = $true
$info.RedirectStandardOutput = $true
$info.RedirectStandardError = $true
$process = [System.Diagnostics.Process]::Start($info)
$out = $process.StandardOutput.ReadToEndAsync()
$err = $process.StandardError.ReadToEndAsync()
try {
    foreach ($point in 'checked', 'buffered', 'written') {
        while (-not (Test-Path -LiteralPath (Join-Path $hold "$point.reached")) -and -not $process.HasExited) { Start-Sleep -Milliseconds 15 }
        if ($process.HasExited) { break }
        $plan.Reached += $point
        if ($plan.At.ContainsKey($point)) { & $plan.At[$point] $args[4] $args[5] | Out-Null }
        [System.IO.File]::WriteAllText((Join-Path $hold "$point.go"), 'go')
    }
    $process.WaitForExit()
    if ($plan.At.ContainsKey('closed')) { & $plan.At['closed'] $args[4] $args[5] | Out-Null }
} finally {
    if (-not $process.HasExited) { $process.Kill(); $process.WaitForExit() }
}
foreach ($line in @($err.Result -split "`r?`n" | Where-Object { $_ })) { Write-Error $line -ErrorAction Continue }
$out.Result -split "`r?`n" | Where-Object { $_ }
exit $process.ExitCode
'@

# The CLI's own merge of a folder of APKs, with the arguments its patch command passes, for the
# swap cases to hold MergeSplits.java's bytes to.
$pinnedMergeText = @'
import app.morphe.patcher.apk.ApkMerger;

import java.io.File;

public final class PinnedMerge {
    public static void main(String[] args) throws Exception {
        new ApkMerger().merge(new File(args[0]), new File(args[1]), true, null, true, null, false);
    }
}
'@

# An APK's resource table with its package 0x7f there a second time as 0x7e, written to a file: the
# same resources in two packages, which aapt2 can't link.
$twoPackagesText = @'
import com.reandroid.arsc.chunk.PackageBlock;
import com.reandroid.arsc.chunk.TableBlock;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.zip.ZipFile;

public final class TwoPackages {
    public static void main(String[] args) throws Exception {
        TableBlock table;
        try (ZipFile zip = new ZipFile(args[0]); InputStream in = new BufferedInputStream(zip.getInputStream(zip.getEntry("resources.arsc")))) {
            table = TableBlock.load(in, (read, total) -> { });
        }
        PackageBlock base = table.pickOne(0x7f);
        // ARSCLib merges only packages of one id, so the copy takes its own id afterwards.
        PackageBlock copy = table.newPackage(0x7f, base.getName());
        copy.merge(base);
        copy.setId(0x7e);
        table.refreshFull();
        Files.write(Path.of(args[1]), table.getBytes());
    }
}
'@

<#
    Links one APK from the files given, keyed by path under res/. With -EmitIds the ids aapt2
    chose are written out; with -StableIds every build keeps the stock build's ids.
#>
function New-ResourceApk {
    param([string]$Name, [System.Collections.IDictionary]$Files, [string]$EmitIds, [string]$StableIds, [string]$PackageId = '0x7f')
    $dir = Join-Path $caseRoot $Name
    foreach ($entry in $Files.GetEnumerator()) {
        $path = Join-Path $dir ($entry.Key -replace '/', [System.IO.Path]::DirectorySeparatorChar)
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $path) | Out-Null
        [System.IO.File]::WriteAllText($path, $entry.Value, [System.Text.UTF8Encoding]::new($false))
    }
    $manifestPath = Join-Path $dir 'AndroidManifest.xml'
    [System.IO.File]::WriteAllText($manifestPath, $manifest, [System.Text.UTF8Encoding]::new($false))
    $compiled = Join-Path $dir 'compiled.zip'
    Invoke-Checked -Program $Aapt2 -Arguments @('compile', '--dir', (Join-Path $dir 'res'), '-o', $compiled) `
        -Description "aapt2 compile for $Name"
    $apk = Join-Path $caseRoot "$Name.apk"
    $link = @('link', '-o', $apk, '-I', $androidJar, '--manifest', $manifestPath,
        '--package-id', $PackageId, '--allow-reserved-package-id')
    if ($EmitIds) { $link += @('--emit-ids', $EmitIds) }
    if ($StableIds) { $link += @('--stable-ids', $StableIds) }
    Invoke-Checked -Program $Aapt2 -Arguments ($link + @($compiled)) -Description "aapt2 link for $Name"
    return $apk
}

function Copy-ApkWith {
    param([string]$From, [string]$Name, [scriptblock]$Change)
    $apk = Join-Path $caseRoot "$Name.apk"
    Copy-Item -LiteralPath $From -Destination $apk
    $archive = [System.IO.Compression.ZipFile]::Open($apk, [System.IO.Compression.ZipArchiveMode]::Update)
    try { & $Change $archive } finally { $archive.Dispose() }
    return $apk
}

function Edit-Table {
    param([string]$Name, [byte[]]$Find, [byte[]]$Replace, [string]$What, [string]$From = $stockApk)
    return Copy-ApkWith -From $From -Name $Name -Change {
        param($archive)
        $entry = $archive.GetEntry('resources.arsc')
        $stream = $entry.Open()
        try { $buffer = [System.IO.MemoryStream]::new(); $stream.CopyTo($buffer); $bytes = $buffer.ToArray() } finally { $stream.Dispose() }
        $hits = @()
        for ($i = 0; $i -le $bytes.Length - $Find.Length; $i++) {
            $match = $true
            for ($j = 0; $j -lt $Find.Length; $j++) { if ($bytes[$i + $j] -ne $Find[$j]) { $match = $false; break } }
            if ($match) { $hits += $i }
        }
        if ($hits.Count -ne 1) { throw "expected one $What in the table, found $($hits.Count)" }
        $Replace.CopyTo($bytes, $hits[0])
        $entry.Delete()
        $replacement = $archive.CreateEntry('resources.arsc', [System.IO.Compression.CompressionLevel]::NoCompression)
        $out = $replacement.Open()
        try { $out.Write($bytes, 0, $bytes.Length) } finally { $out.Dispose() }
    }
}

<#
    Runs the check on one pair. With -Allowlist the changes are held to it, for the patches
    -Selection names (HUSHTUMBLR_PATCH_SELECTION, left unset when -Selection isn't given).
#>
function Invoke-Check {
    param([string]$Patched, [string]$Name, [string]$Stock = $stockApk, [string]$Allowlist, [string[]]$Selection)
    $report = Join-Path $caseRoot "$Name-report.txt"
    $arguments = @($Stock, $Patched, $report)
    if ($Allowlist) { $arguments += $Allowlist }
    $ErrorActionPreference = 'Continue'
    $global:LASTEXITCODE = 0
    $selectionBefore = $env:HUSHTUMBLR_PATCH_SELECTION
    try {
        $env:HUSHTUMBLR_PATCH_SELECTION = if ($Selection) { $Selection -join "`n" } else { $null }
        $output = @(& $Java '-Xmx1g' '-cp' $DesktopJar (Join-Path $PSScriptRoot 'ResourceTableCheck.java') `
            @arguments 2>&1 | ForEach-Object { "$_" })
    } finally { $env:HUSHTUMBLR_PATCH_SELECTION = $selectionBefore }
    [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = ($output -join "`n"); Report = $report }
}

# The call lines themselves, not any mention: the help text names the check too, and the gate's
# path list names this suite without running it.
$verifyText = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'verify-all-patches.ps1') -Raw
Assert-True ($verifyText -match '(?m)^[^#\r\n]*&\s*\$Java\b[^\r\n]*ResourceTableCheck\.java') `
    'verify-all-patches.ps1 does not run ResourceTableCheck.java.'
$prePushText = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'pre-push.ps1') -Raw
Assert-True ($prePushText -match "(?m)^\s*\`$suites \+= , @\('scripts/test-resource-table-check\.ps1'") `
    'The push gate does not run the resource table check fixtures.'

$Java = Resolve-Java -Explicit $Java
$DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $Root -Required
$Aapt2 = Resolve-Aapt2 -Explicit $Aapt2 -Root $Root
# The platform jar beside the SDK's build-tools: sdk/build-tools/<version>/aapt2 -> sdk/platforms.
$sdk = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $Aapt2))
$androidJar = Get-ChildItem -LiteralPath (Join-Path $sdk 'platforms') -Directory -ErrorAction SilentlyContinue |
    ForEach-Object { Join-Path $_.FullName 'android.jar' } |
    Where-Object { Test-Path -LiteralPath $_ -PathType Leaf } | Select-Object -Last 1
if (-not $androidJar) { throw "No platforms/*/android.jar in the SDK at $sdk for aapt2 to link against." }

$tempBase = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
$caseRoot = [System.IO.Path]::GetFullPath((Join-Path $tempBase `
    ('hushtumblr-resource-check-' + [guid]::NewGuid().ToString('N'))))
$requiredPrefix = $tempBase.TrimEnd([System.IO.Path]::DirectorySeparatorChar) + `
    [System.IO.Path]::DirectorySeparatorChar
if (-not $caseRoot.StartsWith($requiredPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to create test files outside the temporary directory: $caseRoot"
}
$caseRootAsked = $caseRoot
# Every second process a swap case starts, so none outlives the run.
$intruders = New-Object System.Collections.Generic.List[System.Diagnostics.Process]

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
# The merges below are of fixture-sized bundles, so they run straight away rather than waiting in
# the machine's build queue behind real builds. The queue itself is held by test-script-contracts.ps1.
$savedQueueScript = $env:BUILD_QUEUE_SCRIPT
$env:BUILD_QUEUE_SCRIPT = $null
try {
    New-Item -ItemType Directory -Path $caseRoot | Out-Null
    # By its real path from here on, which is how Get-MergedApk names what it returns: a temp
    # folder reached through a short name or a link would otherwise never equal the paths asked
    # for below. The cleanup keeps the path that was checked against the temp folder.
    $caseHeld = Open-HeldDirectory -Path $caseRoot
    $caseRoot = $caseHeld.Path
    $caseHeld.Anchor.Dispose()
    $ids = Join-Path $caseRoot 'stock-ids.txt'
    $stockFiles = [ordered]@{
        'res/values/colors.xml' = $colors
        'res/values-night/colors.xml' = $nightColors
        'res/values/styles.xml' = $styles
        'res/layout/feed_story.xml' = $layout
    }
    $stockApk = New-ResourceApk -Name 'stock' -Files $stockFiles -EmitIds $ids
    $idOf = @{}
    foreach ($line in Get-Content -LiteralPath $ids) {
        if ($line -match '^[^:]+:(\S+) = (0x[0-9a-f]{8})$') { $idOf[$Matches[1]] = $Matches[2] }
    }
    Assert-True ($idOf['layout/feed_story'] -like '0x7f*' -and $idOf['color/surface'] -like '0x7f*') `
        "aapt2 did not build package 0x7f: $($idOf.Keys -join ', ')"

    $same = Invoke-Check -Patched $stockApk -Name 'unchanged'
    Assert-True ($same.ExitCode -eq 0) "An unchanged table failed.`n$($same.Output)"
    Assert-True ($same.Output -match 'resolves in the patched table') "An unchanged table was not called whole.`n$($same.Output)"

    $blackFiles = [ordered]@{
        'res/values/colors.xml' = $colors -replace '#ffff3b5c', '#ff000000'
        'res/values/styles.xml' = $styles
        'res/layout/feed_story.xml' = $layout
        'res/values-night/colors.xml' = $nightColors
    }
    $black = Invoke-Check -Patched (New-ResourceApk -Name 'rewritten' -Files $blackFiles -StableIds $ids) -Name 'rewritten'
    Assert-True ($black.ExitCode -eq 0) "A rewritten color failed the check.`n$($black.Output)"
    Assert-True ($black.Output -match [regex]::Escape("$($idOf['color/accent']) color/accent [default] #ffff3b5c -> #ff000000")) `
        "The rewritten color was not reported with its id and both values.`n$($black.Output)"

    # Two values render alike only when they're alike. Each change below rendered the same on both
    # sides once, so it went unreported: a color written in another form, a reference or attribute
    # made dynamic, a backslash and n become a line break, and one unreadable string for another.
    # A quote inside a string is escaped, so a report line can't be read as another change.
    $colorForms = @(
        @{ Name = 'color-rgb'; Accent = '#ff3b5c'; Night = '#000'
            Says = @("$($idOf['color/accent']) color/accent [default] #ffff3b5c -> color_rgb8 #ffff3b5c",
                "$($idOf['color/surface']) color/surface [night", '] #ff000000 -> color_rgb4 #ff000000') },
        @{ Name = 'color-argb4'; Accent = '#ffff3b5c'; Night = '#f000'
            Says = @('', "$($idOf['color/surface']) color/surface [night", '] #ff000000 -> color_argb4 #ff000000') }
    )
    foreach ($case in $colorForms) {
        $formFiles = [ordered]@{
            'res/values/colors.xml' = $colors -replace '#ffff3b5c', $case.Accent
            'res/values/styles.xml' = $styles
            'res/layout/feed_story.xml' = $layout
            'res/values-night/colors.xml' = $nightColors -replace '#ff000000', $case.Night
        }
        $form = Invoke-Check -Patched (New-ResourceApk -Name $case.Name -Files $formFiles -StableIds $ids) -Name $case.Name
        $nightLine = [regex]::Escape($case.Says[1]) + '[^\]]*' + [regex]::Escape($case.Says[2])
        Assert-True ($form.ExitCode -eq 0 -and $form.Output -match $nightLine -and
            (-not $case.Says[0] -or $form.Output -match [regex]::Escape($case.Says[0]))) `
            "A color written in another form ($($case.Name)) wasn't reported as rewritten.`n$($form.Output)"
    }
    $surfaceReference = [byte[]](@(8, 0, 0, 1) + [BitConverter]::GetBytes([Convert]::ToUInt32($idOf['color/surface'], 16)))
    $dynamicReference = [byte[]]$surfaceReference.Clone()
    $dynamicReference[3] = 7
    $dynamic = Invoke-Check -Patched (Edit-Table -Name 'dynamic-reference' -Find $surfaceReference -Replace $dynamicReference `
        -What 'reference to color/surface') -Name 'dynamic-reference'
    Assert-True ($dynamic.ExitCode -eq 0 -and $dynamic.Output -match ([regex]::Escape("$($idOf['style/SearchTheme']) style/SearchTheme [default] item ") +
        '0x[0-9a-f]{8} ' + [regex]::Escape("@$($idOf['color/surface']) -> dynamic @$($idOf['color/surface'])"))) `
        "A reference made dynamic wasn't reported as rewritten.`n$($dynamic.Output)"

    $valueIds = Join-Path $caseRoot 'value-ids.txt'
    $valueFiles = [ordered]@{
        'res/values/strings.xml' = ('<resources><string name="line">a\\nb</string><string name="quote">say \"hi\"</string>' +
            '<string name="tap">By tapping <b>Next</b>:</string></resources>')
        'res/values/styles.xml' = '<resources><style name="SearchTheme"><item name="android:textColor">?android:attr/textColorPrimary</item></style></resources>'
    }
    $valueStock = New-ResourceApk -Name 'value-stock' -Files $valueFiles -EmitIds $valueIds
    $valueIdOf = @{}
    foreach ($line in Get-Content -LiteralPath $valueIds) {
        if ($line -match '^[^:]+:(\S+) = (0x[0-9a-f]{8})$') { $valueIdOf[$Matches[1]] = $Matches[2] }
    }
    $escapedFiles = [ordered]@{
        'res/values/strings.xml' = ('<resources><string name="line">a\nb</string><string name="quote">say hi</string>' +
            '<string name="tap">By tapping &lt;b>Next&lt;/b>:</string></resources>')
        'res/values/styles.xml' = $valueFiles['res/values/styles.xml']
    }
    # A bold span on Next and the same tags typed into a plain string read apart.
    $escaped = Invoke-Check -Stock $valueStock -Patched (New-ResourceApk -Name 'value-escaped' -Files $escapedFiles -StableIds $valueIds) -Name 'value-escaped'
    Assert-True ($escaped.ExitCode -eq 0 -and
        $escaped.Output -match [regex]::Escape("$($valueIdOf['string/line']) string/line [default] `"a\\nb`" -> `"a\nb`"") -and
        $escaped.Output -match [regex]::Escape("$($valueIdOf['string/quote']) string/quote [default] `"say \`"hi\`"`" -> `"say hi`"") -and
        $escaped.Output -match [regex]::Escape("$($valueIdOf['string/tap']) string/tap [default] `"By tapping Next:`" with spans `"b`" 11-14 -> `"By tapping <b>Next</b>:`"")) `
        "A backslash and n become a line break, a string that lost its quotes, or a span typed out as tags, wasn't reported escaped.`n$($escaped.Output)"
    # textColorPrimary, 0x01010036, as an attribute value.
    $attribute = [byte[]](8, 0, 0, 2, 0x36, 0, 1, 1)
    $dynamicAttribute = [byte[]](8, 0, 0, 8, 0x36, 0, 1, 1)
    $attributeCheck = Invoke-Check -Stock $valueStock -Name 'dynamic-attribute' -Patched (Edit-Table -Name 'dynamic-attribute' -From $valueStock `
        -Find $attribute -Replace $dynamicAttribute -What 'attribute value')
    Assert-True ($attributeCheck.ExitCode -eq 0 -and $attributeCheck.Output -match ([regex]::Escape("$($valueIdOf['style/SearchTheme']) style/SearchTheme [default] item ") +
        '0x[0-9a-f]{8} ' + [regex]::Escape('?0x01010036 -> dynamic ?0x01010036'))) `
        "An attribute made dynamic wasn't reported as rewritten.`n$($attributeCheck.Output)"

    # One string value in the table, so its type byte is the table's only one, pointed past the pool
    # on both sides at two different places.
    $loneIds = Join-Path $caseRoot 'lone-ids.txt'
    $loneStock = New-ResourceApk -Name 'lone-stock' -Files ([ordered]@{ 'res/values/strings.xml' = '<resources><string name="lone">Hush</string><style name="SearchTheme" /></resources>' }) `
        -EmitIds $loneIds
    $loneId = [regex]::Match((Get-Content -LiteralPath $loneIds -Raw), ':string/lone = (0x[0-9a-f]{8})').Groups[1].Value
    $stringValue = [byte[]](8, 0, 0, 3)
    $loneUnreadable = Edit-Table -Name 'lone-unreadable' -From $loneStock -Find $stringValue -Replace ([byte[]](8, 0, 0, 3, 0xff, 0x7f, 0, 0)) -What 'string value'
    $loneOther = Edit-Table -Name 'lone-unreadable-other' -From $loneStock -Find $stringValue -Replace ([byte[]](8, 0, 0, 3, 0xfe, 0x7f, 0, 0)) -What 'string value'
    $lone = Invoke-Check -Stock $loneUnreadable -Patched $loneOther -Name 'lone-unreadable'
    Assert-True ($lone.Output -match [regex]::Escape("$loneId string/lone [default] string (unreadable, pool index 32767) -> string (unreadable, pool index 32766)")) `
        "One unreadable string for another wasn't reported as rewritten.`n$($lone.Output)"

    $renamedIds = Join-Path $caseRoot 'renamed-ids.txt'
    [System.IO.File]::WriteAllText($renamedIds, ((Get-Content -LiteralPath $ids -Raw) -replace ':color/accent =', ':color/accent_renamed ='))
    $renamedFiles = [ordered]@{
        'res/values/colors.xml' = $colors -replace '"accent"', '"accent_renamed"'
        'res/values/styles.xml' = $styles -replace '@color/accent<', '@color/accent_renamed<'
        'res/layout/feed_story.xml' = $layout
        'res/values-night/colors.xml' = $nightColors
    }
    $renamed = Invoke-Check -Patched (New-ResourceApk -Name 'renamed' -Files $renamedFiles -StableIds $renamedIds) -Name 'renamed'
    Assert-True ($renamed.ExitCode -eq 0) "A renamed entry that keeps its id failed.`n$($renamed.Output)"
    Assert-True ($renamed.Output -match [regex]::Escape("$($idOf['color/accent']) color/accent is color/accent_renamed")) `
        "The renamed entry was not reported.`n$($renamed.Output)"

    $noLayoutFiles = [ordered]@{
        'res/values/colors.xml' = $colors
        'res/values/styles.xml' = $styles
        'res/values-night/colors.xml' = $nightColors
    }
    $lost = Invoke-Check -Patched (New-ResourceApk -Name 'lost-layout' -Files $noLayoutFiles -StableIds $ids) -Name 'lost-layout'
    Assert-True ($lost.ExitCode -eq 1) "A table that lost layout/feed_story passed.`n$($lost.Output)"
    Assert-True ($lost.Output -match [regex]::Escape("FAIL $($idOf['layout/feed_story']) layout/feed_story: not in the patched table")) `
        "The lost layout's failure did not name its id.`n$($lost.Output)"
    Assert-True ((Get-Content -LiteralPath $lost.Report -Raw) -match [regex]::Escape($idOf['layout/feed_story'])) `
        'The report file did not name the lost id.'

    $noFile = Copy-ApkWith -From $stockApk -Name 'lost-file' -Change {
        param($archive)
        $entry = $archive.GetEntry('res/layout/feed_story.xml')
        if (-not $entry) { throw 'the stock APK has no res/layout/feed_story.xml to remove' }
        $entry.Delete()
    }
    $file = Invoke-Check -Patched $noFile -Name 'lost-file'
    Assert-True ($file.ExitCode -eq 1) "A layout whose file left the archive passed.`n$($file.Output)"
    Assert-True ($file.Output -match [regex]::Escape("FAIL $($idOf['layout/feed_story']) layout/feed_story [default]: names res/layout/feed_story.xml, which is not in the patched archive")) `
        "The missing file's failure did not name the id and the path.`n$($file.Output)"

    $noItemFiles = [ordered]@{
        'res/values/colors.xml' = $colors
        'res/values/styles.xml' = $styles -replace '(?m)^\s*<item name="android:textColorPrimary">@color/accent</item>\r?\n', ''
        'res/layout/feed_story.xml' = $layout
        'res/values-night/colors.xml' = $nightColors
    }
    $item = Invoke-Check -Patched (New-ResourceApk -Name 'lost-item' -Files $noItemFiles -StableIds $ids) -Name 'lost-item'
    Assert-True ($item.ExitCode -eq 1) "A style that lost an item passed.`n$($item.Output)"
    Assert-True ($item.Output -match ([regex]::Escape("FAIL $($idOf['style/SearchTheme']) style/SearchTheme [default] item 0x01010036") + '.*the item is gone')) `
        "The lost item's failure did not name the style and the attr.`n$($item.Output)"

    $noNightFiles = [ordered]@{
        'res/values/colors.xml' = $colors
        'res/values/styles.xml' = $styles
        'res/layout/feed_story.xml' = $layout
    }
    $night = Invoke-Check -Patched (New-ResourceApk -Name 'lost-night' -Files $noNightFiles -StableIds $ids) -Name 'lost-night'
    Assert-True ($night.ExitCode -eq 1) "A color that lost its night value passed.`n$($night.Output)"
    Assert-True ($night.Output -match ([regex]::Escape("FAIL $($idOf['color/surface']) color/surface [night") + '[^\]]*\]: the value is gone')) `
        "The lost night value's failure did not name the id and the configuration.`n$($night.Output)"

    $orphanFiles = [ordered]@{
        'res/values/colors.xml' = $colors
        'res/values-night/colors.xml' = $nightColors
        'res/values/styles.xml' = $styles -replace ' parent="BaseTheme"', ''
        'res/layout/feed_story.xml' = $layout
    }
    $orphan = Invoke-Check -Patched (New-ResourceApk -Name 'lost-parent' -Files $orphanFiles -StableIds $ids) -Name 'lost-parent'
    Assert-True ($orphan.ExitCode -eq 1) "A style that lost its parent passed.`n$($orphan.Output)"
    Assert-True ($orphan.Output -match ([regex]::Escape("FAIL $($idOf['style/SearchTheme']) style/SearchTheme [default]: its parent @$($idOf['style/BaseTheme']) became @null"))) `
        "The lost parent's failure did not name the style and both parents.`n$($orphan.Output)"

    $changedFile = Copy-ApkWith -From $stockApk -Name 'changed-file' -Change {
        param($archive)
        $entry = $archive.GetEntry('res/layout/feed_story.xml')
        $stream = $entry.Open()
        try { $buffer = [System.IO.MemoryStream]::new(); $stream.CopyTo($buffer); $bytes = $buffer.ToArray() } finally { $stream.Dispose() }
        $entry.Delete()
        $replacement = $archive.CreateEntry('res/layout/feed_story.xml', [System.IO.Compression.CompressionLevel]::NoCompression)
        $out = $replacement.Open()
        try { $out.Write($bytes, 0, $bytes.Length); $out.Write([byte[]](0, 0, 0, 0), 0, 4) } finally { $out.Dispose() }
    }
    $changed = Invoke-Check -Patched $changedFile -Name 'changed-file'
    Assert-True ($changed.ExitCode -eq 1) "A layout file with other bytes passed.`n$($changed.Output)"
    Assert-True ($changed.Output -match [regex]::Escape("FAIL $($idOf['layout/feed_story']) layout/feed_story [default]: res/layout/feed_story.xml is not the file the stock archive holds for it")) `
        "The changed file's failure did not name the id and the path.`n$($changed.Output)"

    # A moved file is held to the stock one by its bytes, not its CRC and size: "plumless" and
    # "buckeroo" share both. The table's path to a raw file is changed in place to another of the
    # same length, and the archive's entry moved with it, once with the stock bytes and once with
    # the other word's.
    function Get-TestCrc32([byte[]]$Bytes) {
        $crc = [long]4294967295
        foreach ($byte in $Bytes) {
            $crc = $crc -bxor $byte
            for ($bit = 0; $bit -lt 8; $bit++) { $crc = if ($crc -band 1) { ($crc -shr 1) -bxor [long]3988292384 } else { $crc -shr 1 } }
        }
        return $crc -bxor [long]4294967295
    }
    $plumless = [System.Text.Encoding]::ASCII.GetBytes('plumless')
    $buckeroo = [System.Text.Encoding]::ASCII.GetBytes('buckeroo')
    Assert-True ((Get-TestCrc32 $plumless) -eq (Get-TestCrc32 $buckeroo) -and $plumless.Length -eq $buckeroo.Length) `
        'The two words for the moved-file case do not share a CRC and a size, so the case would show nothing.'
    $rawIds = Join-Path $caseRoot 'raw-ids.txt'
    $rawFiles = [ordered]@{}
    foreach ($entry in $stockFiles.GetEnumerator()) { $rawFiles[$entry.Key] = $entry.Value }
    $rawFiles['res/raw/word.txt'] = 'plumless'
    $rawStock = New-ResourceApk -Name 'raw-stock' -Files $rawFiles -EmitIds $rawIds
    $rawId = @(Get-Content -LiteralPath $rawIds | Where-Object { $_ -match ':raw/word = (0x[0-9a-f]{8})$' } | ForEach-Object { $Matches[1] })
    Assert-True ($rawId.Count -eq 1) "aapt2 gave raw/word no id: $(Get-Content -LiteralPath $rawIds -Raw)"
    function New-MovedApk([string]$Name, [byte[]]$Bytes) {
        try {
            $edited = Edit-Table -From $rawStock -Name "$Name-table" -What 'UTF-8 path res/raw/word.txt' `
                -Find ([System.Text.Encoding]::UTF8.GetBytes('res/raw/word.txt')) -Replace ([System.Text.Encoding]::UTF8.GetBytes('res/raw/wora.txt'))
        } catch {
            $edited = Edit-Table -From $rawStock -Name "$Name-table16" -What 'UTF-16 path res/raw/word.txt' `
                -Find ([System.Text.Encoding]::Unicode.GetBytes('res/raw/word.txt')) -Replace ([System.Text.Encoding]::Unicode.GetBytes('res/raw/wora.txt'))
        }
        return Copy-ApkWith -From $edited -Name $Name -Change {
            param($archive)
            $archive.GetEntry('res/raw/word.txt').Delete()
            $out = $archive.CreateEntry('res/raw/wora.txt').Open()
            try { $out.Write($Bytes, 0, $Bytes.Length) } finally { $out.Dispose() }
        }
    }
    $movedLine = "$($rawId[0]) raw/word [default] res/raw/word.txt -> res/raw/wora.txt"
    $movedSame = Invoke-Check -Stock $rawStock -Patched (New-MovedApk -Name 'moved-same' -Bytes $plumless) -Name 'moved-same'
    Assert-True ($movedSame.ExitCode -eq 0 -and $movedSame.Output -match [regex]::Escape("moved $movedLine")) `
        "A raw file moved with its stock bytes was not passed and reported as moved.`n$($movedSame.Output)"
    $movedOther = Invoke-Check -Stock $rawStock -Patched (New-MovedApk -Name 'moved-other' -Bytes $buckeroo) -Name 'moved-other'
    Assert-True ($movedOther.ExitCode -eq 1 -and
        $movedOther.Output -match [regex]::Escape("FAIL $($rawId[0]) raw/word [default]: res/raw/wora.txt is not the file the stock archive holds for it")) `
        "A raw file moved with other bytes of the same CRC and size passed.`n$($movedOther.Output)"

    # Every archive entry patching doesn't write keeps the stock bytes (checkArchive). Signature files
    # are the signer's: an unsigned output leaves them out and a signed one adds its own, both at
    # the top of META-INF with ASCII names. Anything else is held to the stock archive: an entry
    # with other bytes, one that's gone, one that's added, one that's there twice, and a name only
    # a Unicode case fold makes a signature file.
    function Add-TestEntry($Archive, [string]$Name, [string]$Text) {
        $out = $Archive.CreateEntry($Name).Open()
        try { $bytes = [System.Text.Encoding]::UTF8.GetBytes($Text); $out.Write($bytes, 0, $bytes.Length) } finally { $out.Dispose() }
    }
    $archiveStock = Copy-ApkWith -From $stockApk -Name 'archive-stock' -Change {
        param($archive)
        Add-TestEntry $archive 'assets/feed.json' '{"feed":"stock"}'
        Add-TestEntry $archive 'META-INF/com/android/build/gradle/app-metadata.properties' 'appMetadataVersion=1.1'
        foreach ($name in 'META-INF/MANIFEST.MF', 'META-INF/BNDLTOOL.SF', 'META-INF/BNDLTOOL.RSA') { Add-TestEntry $archive $name "stock $name" }
    }
    $archiveSame = Invoke-Check -Stock $archiveStock -Patched $archiveStock -Name 'archive-same'
    Assert-True ($archiveSame.ExitCode -eq 0 -and $archiveSame.Output -match "archive: \d+ entries patching doesn't write hold the stock bytes, 3 stock signature files left to the signer") `
        "An archive held to itself did not pass with its three signature files left to the signer.`n$($archiveSame.Output)"
    $resigned = Copy-ApkWith -From $archiveStock -Name 'archive-resigned' -Change {
        param($archive)
        foreach ($name in 'META-INF/MANIFEST.MF', 'META-INF/BNDLTOOL.SF', 'META-INF/BNDLTOOL.RSA') { $archive.GetEntry($name).Delete() }
        foreach ($name in 'META-INF/MANIFEST.MF', 'META-INF/MORPHE.SF', 'META-INF/MORPHE.RSA') { Add-TestEntry $archive $name "signed $name" }
    }
    $signedOver = Invoke-Check -Stock $archiveStock -Patched $resigned -Name 'archive-resigned'
    Assert-True ($signedOver.ExitCode -eq 0) "An archive signed again by another signer failed.`n$($signedOver.Output)"
    foreach ($case in @(
            @{ Name = 'archive-changed'; Says = 'archive entry assets/feed.json: not the bytes the stock archive holds'
                Change = { param($archive) $archive.GetEntry('assets/feed.json').Delete(); Add-TestEntry $archive 'assets/feed.json' '{"feed":"other"}' } },
            @{ Name = 'archive-gone'; Says = 'archive entry assets/feed.json: not in the patched archive'
                Change = { param($archive) $archive.GetEntry('assets/feed.json').Delete() } },
            @{ Name = 'archive-gone-metadata'; Says = 'archive entry META-INF/com/android/build/gradle/app-metadata.properties: not in the patched archive'
                Change = { param($archive) $archive.GetEntry('META-INF/com/android/build/gradle/app-metadata.properties').Delete() } },
            @{ Name = 'archive-added'; Says = 'archive entry assets/extra.bin: added, and patching writes no such file'
                Change = { param($archive) Add-TestEntry $archive 'assets/extra.bin' 'extra' } },
            @{ Name = 'archive-twice'; Says = 'archive entry assets/feed.json: appears more than once in the patched archive'
                Change = { param($archive) Add-TestEntry $archive 'assets/feed.json' '{"feed":"stock"}' } },
            @{ Name = 'archive-long-s'; Says = "archive entry META-INF/PAYLOAD.$([char]0x17F)F: added, and patching writes no such file"
                Change = { param($archive) Add-TestEntry $archive "META-INF/PAYLOAD.$([char]0x17F)F" 'payload' } },
            @{ Name = 'archive-dotless-i'; Says = "archive entry META-INF/MAN$([char]0x131)FEST.MF: added, and patching writes no such file"
                Change = { param($archive) Add-TestEntry $archive "META-INF/MAN$([char]0x131)FEST.MF" 'payload' } },
            @{ Name = 'archive-nested'; Says = 'archive entry META-INF/sub/OTHER.SF: added, and patching writes no such file'
                Change = { param($archive) Add-TestEntry $archive 'META-INF/sub/OTHER.SF' 'payload' } })) {
        $said = Invoke-Check -Stock $archiveStock -Patched (Copy-ApkWith -From $archiveStock -Name $case.Name -Change $case.Change) -Name $case.Name
        # The report, which is UTF-8 whatever the console's code page is, for the names that aren't ASCII.
        $reported = if (Test-Path -LiteralPath $said.Report) { [System.IO.File]::ReadAllText($said.Report, [System.Text.Encoding]::UTF8) } else { '' }
        Assert-True ($said.ExitCode -eq 1 -and $reported -match [regex]::Escape("FAIL $($case.Says)")) `
            "$($case.Name) passed, or failed for another reason than '$($case.Says)'.`n$($said.Output)"
    }

    # With an allowlist, every change has to be one it allows: under [rebuild], or under a patch the
    # run selected. A rewritten value, an added resource, an added file and a moved one, each
    # passed where its section applies and refused where none does.
    function New-TestAllowlist([string]$Name, [string[]]$Lines) {
        $path = Join-Path $caseRoot "$Name-allowlist.txt"
        [System.IO.File]::WriteAllText($path, (($Lines -join "`n") + "`n"), [System.Text.UTF8Encoding]::new($false))
        return $path
    }
    $blackApk = Join-Path $caseRoot 'rewritten.apk'
    $accentLine = "rewritten $($idOf['color/accent']) color/accent [default] #ffff3b5c -> #ff000000"
    $byPatch = New-TestAllowlist 'by-patch' @('# The accent a patch paints black.', '[rebuild]', '', '[Black accent]', $accentLine, 'rewritten 0x7f000000 color/none [default] #00000000 -> #ff000000')
    $allowed = Invoke-Check -Patched $blackApk -Name 'delta-allowed' -Allowlist $byPatch -Selection @('Other patch', 'Black accent')
    Assert-True ($allowed.ExitCode -eq 0 -and $allowed.Output -match [regex]::Escape('resource delta: 1 changes held to by-patch-allowlist.txt, sections rebuild, Black accent') -and
        $allowed.Output -match [regex]::Escape('allowed in those sections and not seen in this run: 1')) `
        "A rewritten value the selected patch's section allows was not passed, or its unused line not reported.`n$($allowed.Output)"
    $unselected = Invoke-Check -Patched $blackApk -Name 'delta-unselected' -Allowlist $byPatch -Selection @('Other patch')
    Assert-True ($unselected.ExitCode -eq 1 -and
        $unselected.Output -match [regex]::Escape("FAIL resource delta $($accentLine): allowed neither by [rebuild] nor by a selected patch in by-patch-allowlist.txt")) `
        "A rewritten value only an unselected patch's section allows passed.`n$($unselected.Output)"
    $byRebuild = Invoke-Check -Patched $blackApk -Name 'delta-rebuild' -Allowlist (New-TestAllowlist 'by-rebuild' @('[rebuild]', $accentLine)) -Selection @('Other patch')
    Assert-True ($byRebuild.ExitCode -eq 0) "A rewritten value [rebuild] allows failed.`n$($byRebuild.Output)"
    $unchangedHeld = Invoke-Check -Patched $stockApk -Name 'delta-none' -Allowlist (New-TestAllowlist 'empty' @('[rebuild]')) -Selection @('Other patch')
    Assert-True ($unchangedHeld.ExitCode -eq 0 -and $unchangedHeld.Output -match [regex]::Escape('resource delta: 0 changes held to empty-allowlist.txt, sections rebuild')) `
        "An unchanged table failed an allowlist that allows nothing.`n$($unchangedHeld.Output)"
    $realAllowlist = Join-Path $PSScriptRoot 'resource-delta-allowlist.txt'
    $real = Invoke-Check -Patched $stockApk -Name 'delta-real' -Allowlist $realAllowlist -Selection @('HushTumblr settings')
    Assert-True ($real.ExitCode -eq 0 -and $real.Output -match [regex]::Escape('resource delta: 0 changes held to resource-delta-allowlist.txt, sections rebuild, HushTumblr settings')) `
        "The checked-in allowlist could not be read, or its sections were not picked by the selection.`n$($real.Output)"

    # An added resource is held to every value it holds, and a file only the patched table names to
    # its bytes: another value, or a file with other bytes, fails the lines made for the first.
    $textSha = { param([string]$Text) ([System.BitConverter]::ToString([System.Security.Cryptography.SHA256]::Create().ComputeHash(
                [System.Text.Encoding]::UTF8.GetBytes($Text))) -replace '-', '').ToLowerInvariant() }
    $addedFiles = [ordered]@{}
    foreach ($entry in $stockFiles.GetEnumerator()) { $addedFiles[$entry.Key] = $entry.Value }
    $addedFiles['res/values/strings.xml'] = '<resources><string name="hush_row">Hush</string></resources>'
    $addedFiles['res/raw/hush_extra.txt'] = 'extra'
    $addedApk = New-ResourceApk -Name 'delta-added' -Files $addedFiles -StableIds $ids
    $fileLine = "file raw/hush_extra [default] res/raw/hush_extra.txt $(& $textSha 'extra')"
    $addedLines = @('added raw/hush_extra', 'added raw/hush_extra [default] file res/raw/hush_extra.txt', 'added string/hush_row',
        'added string/hush_row [default] "Hush"', $fileLine)
    $addedAllowlist = New-TestAllowlist 'added' (@('[rebuild]', '[Hush row]') + $addedLines)
    $addedAllowed = Invoke-Check -Patched $addedApk -Name 'delta-added' -Allowlist $addedAllowlist -Selection @('Hush row')
    Assert-True ($addedAllowed.ExitCode -eq 0 -and $addedAllowed.Output -match [regex]::Escape($fileLine.Substring('file '.Length)) -and
        $addedAllowed.Output -match [regex]::Escape('resource delta: 5 changes held to added-allowlist.txt')) `
        "Added resources, what they hold and the file one names, allowed without the ids the rebuild picked, failed or went unreported.`n$($addedAllowed.Output)"
    $fileRefused = Invoke-Check -Patched $addedApk -Name 'delta-file' -Allowlist (New-TestAllowlist 'no-file' (@('[rebuild]', '[Hush row]') + $addedLines[0..3])) -Selection @('Hush row')
    Assert-True ($fileRefused.ExitCode -eq 1 -and $fileRefused.Output -match [regex]::Escape("FAIL resource delta $($fileLine): allowed neither")) `
        "A file only the patched table names passed an allowlist that doesn't name it.`n$($fileRefused.Output)"
    foreach ($other in @(
            @{ Name = 'delta-added-value'; Key = 'res/values/strings.xml'; Text = '<resources><string name="hush_row">Hush!</string></resources>'
                Says = 'resource delta added string/hush_row [default] "Hush!": allowed neither' },
            @{ Name = 'delta-added-bytes'; Key = 'res/raw/hush_extra.txt'; Text = 'other'
                Says = "resource delta file raw/hush_extra [default] res/raw/hush_extra.txt $(& $textSha 'other'): allowed neither" })) {
        $files = [ordered]@{}
        foreach ($entry in $addedFiles.GetEnumerator()) { $files[$entry.Key] = $entry.Value }
        $files[$other.Key] = $other.Text
        $said = Invoke-Check -Patched (New-ResourceApk -Name $other.Name -Files $files -StableIds $ids) -Name $other.Name -Allowlist $addedAllowlist -Selection @('Hush row')
        Assert-True ($said.ExitCode -eq 1 -and $said.Output -match [regex]::Escape("FAIL $($other.Says)")) `
            "$($other.Name) passed the allowlist made for the resources as first added.`n$($said.Output)"
    }
    # Each line allows one change: the same resources added again in a second package (ARSCLib's
    # copy of package 0x7f as 0x7e) don't pass on the lines made for one.
    $twoPackagesSource = Join-Path $caseRoot 'TwoPackages.java'
    [System.IO.File]::WriteAllText($twoPackagesSource, $twoPackagesText, [System.Text.UTF8Encoding]::new($false))
    $twoTable = Join-Path $caseRoot 'two-packages.arsc'
    Invoke-Checked -Program $Java -Arguments @('-Xmx1g', '-cp', $DesktopJar, $twoPackagesSource, $addedApk, $twoTable) -Description 'TwoPackages.java'
    $twoApk = Copy-ApkWith -From $addedApk -Name 'delta-two-packages' -Change {
        param($archive)
        $archive.GetEntry('resources.arsc').Delete()
        $out = $archive.CreateEntry('resources.arsc', [System.IO.Compression.CompressionLevel]::NoCompression).Open()
        try { $bytes = [System.IO.File]::ReadAllBytes($twoTable); $out.Write($bytes, 0, $bytes.Length) } finally { $out.Dispose() }
    }
    $twice = Invoke-Check -Patched $twoApk -Name 'delta-two-packages' -Allowlist $addedAllowlist -Selection @('Hush row')
    Assert-True ($twice.ExitCode -eq 1 -and $twice.Output -match
        [regex]::Escape('FAIL resource delta added string/hush_row: a line of added-allowlist.txt allows one change, and more than one of this run fits it')) `
        "A resource added in two packages passed on one line of the allowlist.`n$($twice.Output)"

    # A style a patch adds: its parent and each item are lines, and #{option} stands for the color
    # a patch option sets, whichever it is. Another parent, an item more, or something other than a
    # color where the option's goes, fails.
    $styleText = '<resources><style name="HushDark"{0}><item name="android:colorBackground">{1}</item>' +
        '<item name="android:windowBackground">@color/surface</item>{2}</style></resources>'
    $styleLines = @('added style/HushDark', "added style/HushDark [default] parent @$($idOf['style/BaseTheme'])",
        'added style/HushDark [default] item 0x01010031 #{option}', "added style/HushDark [default] item 0x01010054 @$($idOf['color/surface'])")
    $styleAllowlist = New-TestAllowlist 'style' (@('[rebuild]', '[Dark background color]') + $styleLines)
    foreach ($styled in @(
            @{ Name = 'delta-style'; Parent = ' parent="BaseTheme"'; Color = '#ff121212'; More = '' },
            @{ Name = 'delta-style-black'; Parent = ' parent="BaseTheme"'; Color = '#ff000000'; More = '' },
            @{ Name = 'delta-style-orphan'; Parent = ''; Color = '#ff121212'; More = ''; Says = 'added style/HushDark [default] parent @null' },
            @{ Name = 'delta-style-more'; Parent = ' parent="BaseTheme"'; Color = '#ff121212'
                More = '<item name="android:textColorPrimary">@color/accent</item>'; Says = "added style/HushDark [default] item 0x01010036 @$($idOf['color/accent'])" },
            @{ Name = 'delta-style-reference'; Parent = ' parent="BaseTheme"'; Color = '@color/surface'; More = ''
                Says = "added style/HushDark [default] item 0x01010031 @$($idOf['color/surface'])" })) {
        $files = [ordered]@{}
        foreach ($entry in $stockFiles.GetEnumerator()) { $files[$entry.Key] = $entry.Value }
        $files['res/values/hush_styles.xml'] = $styleText -f $styled.Parent, $styled.Color, $styled.More
        $said = Invoke-Check -Patched (New-ResourceApk -Name $styled.Name -Files $files -StableIds $ids) -Name $styled.Name `
            -Allowlist $styleAllowlist -Selection @('Dark background color')
        Assert-True ($(if ($styled.Says) { $said.ExitCode -eq 1 -and $said.Output -match [regex]::Escape("FAIL resource delta $($styled.Says): allowed neither") }
                else { $said.ExitCode -eq 0 -and $said.Output -match [regex]::Escape('resource delta: 4 changes held to style-allowlist.txt') })) `
            "$($styled.Name) was judged wrong against the lines made for the style.`n$($said.Output)"
    }
    # Every placeholder of a run comes out of one solid color: #{option} that color, #{option+13} it
    # raised by 13 a channel as far as white. Colors that don't agree, or one that isn't solid, fail.
    $pairText = '<resources><style name="HushPair"><item name="android:colorForeground">{0}</item>' +
        '<item name="android:colorBackground">{1}</item><item name="android:textColorSecondary">{2}</item></style></resources>'
    $pairAllowlist = New-TestAllowlist 'pair' @('[rebuild]', '[Dark background color]', 'added style/HushPair', 'added style/HushPair [default] parent @null',
        'added style/HushPair [default] item 0x01010030 #{option+13}', 'added style/HushPair [default] item 0x01010031 #{option}',
        'added style/HushPair [default] item 0x01010038 #{option}')
    foreach ($paired in @(
            @{ Name = 'pair-dark'; Colors = @('#ff1f1f1f', '#ff121212', '#ff121212') },
            @{ Name = 'pair-white'; Colors = @('#ffffffff', '#fff8f8f8', '#fff8f8f8') },
            @{ Name = 'pair-flat'; Colors = @('#ff121212', '#ff121212', '#ff121212')
                Says = 'resource delta added style/HushPair [default] item 0x01010030 #ff121212: #ff121212 isn''t the option color #ff121212 raised by 13, #ff1f1f1f' },
            @{ Name = 'pair-apart'; Colors = @('#ff1f1f1f', '#ff121212', '#ff000000')
                Says = 'resource delta added style/HushPair [default] item 0x01010038 #ff000000: #ff000000 isn''t the option color #ff121212, which every' },
            @{ Name = 'pair-clear'; Colors = @('#801f1f1f', '#80121212', '#80121212')
                Says = 'resource delta added style/HushPair [default] item 0x01010031 #80121212: allowed neither' })) {
        $files = [ordered]@{}
        foreach ($entry in $stockFiles.GetEnumerator()) { $files[$entry.Key] = $entry.Value }
        $files['res/values/hush_styles.xml'] = $pairText -f $paired.Colors
        $said = Invoke-Check -Patched (New-ResourceApk -Name $paired.Name -Files $files -StableIds $ids) -Name $paired.Name `
            -Allowlist $pairAllowlist -Selection @('Dark background color')
        Assert-True ($(if ($paired.Says) { $said.ExitCode -eq 1 -and $said.Output -match [regex]::Escape("FAIL $($paired.Says)") }
                else { $said.ExitCode -eq 0 -and $said.Output -match [regex]::Escape('resource delta: 5 changes held to pair-allowlist.txt') })) `
            "$($paired.Name) was judged wrong against the option color lines.`n$($said.Output)"
    }
    # A bag that sets one attr twice, both rewritten alike, is two changes on two lines: the second
    # is numbered. SearchTheme's two items (aapt2 writes a style's items sorted by attr) are made
    # windowBackground twice in both tables, to the surface in one and the accent in the other.
    $mapItem = { param([uint32]$Attr, [string]$Id) [byte[]]([BitConverter]::GetBytes($Attr) + [byte[]](8, 0, 0, 1) + [BitConverter]::GetBytes([Convert]::ToUInt32($Id, 16))) }
    $searchItems = [byte[]]((& $mapItem 0x01010036 $idOf['color/accent']) + (& $mapItem 0x01010054 $idOf['color/surface']))
    $twiceStock = Edit-Table -Name 'twice-stock' -Find $searchItems -What 'SearchTheme items' `
        -Replace ([byte[]]((& $mapItem 0x01010054 $idOf['color/surface']) + (& $mapItem 0x01010054 $idOf['color/surface'])))
    $twicePatched = Edit-Table -Name 'twice-patched' -Find $searchItems -What 'SearchTheme items' `
        -Replace ([byte[]]((& $mapItem 0x01010054 $idOf['color/accent']) + (& $mapItem 0x01010054 $idOf['color/accent'])))
    $twiceWhere = "rewritten $($idOf['style/SearchTheme']) style/SearchTheme [default] item"
    $twiceChange = " 0x01010054 @$($idOf['color/surface']) -> @$($idOf['color/accent'])"
    $twiceItems = Invoke-Check -Stock $twiceStock -Patched $twicePatched -Name 'twice-items' `
        -Allowlist (New-TestAllowlist 'twice' @('[rebuild]', "$twiceWhere$twiceChange", "$twiceWhere#2$twiceChange")) -Selection @('Other patch')
    Assert-True ($twiceItems.ExitCode -eq 0 -and $twiceItems.Output -match [regex]::Escape('resource delta: 2 changes held to twice-allowlist.txt')) `
        "A bag setting one attr twice, rewritten alike, couldn't be held to a line for each.`n$($twiceItems.Output)"
    # A stock style given a configuration it didn't have: the bag it gets is reported parent and
    # item by item, as the values of an added resource are.
    $nightStyleFiles = [ordered]@{}
    foreach ($entry in $stockFiles.GetEnumerator()) { $nightStyleFiles[$entry.Key] = $entry.Value }
    $nightStyleFiles['res/values-night/styles.xml'] = '<resources><style name="SearchTheme" parent="BaseTheme">' +
        '<item name="android:windowBackground">@color/accent</item></style></resources>'
    $nightStyle = Invoke-Check -Patched (New-ResourceApk -Name 'night-style' -Files $nightStyleFiles -StableIds $ids) -Name 'night-style'
    $nightReport = if (Test-Path -LiteralPath $nightStyle.Report) { [System.IO.File]::ReadAllText($nightStyle.Report) } else { '' }
    # aapt2 files values-night under night-v8, the first platform that had it.
    Assert-True ($nightStyle.ExitCode -eq 0 -and
        $nightReport.Contains("$($idOf['style/SearchTheme']) style/SearchTheme [night-v8] added bag parent @$($idOf['style/BaseTheme'])") -and
        $nightReport.Contains("$($idOf['style/SearchTheme']) style/SearchTheme [night-v8] added bag item 0x01010054 @$($idOf['color/accent'])")) `
        "A bag added in a configuration of its own was not reported parent and item by item.`n$($nightStyle.Output)"
    $movedHeld = Invoke-Check -Stock $rawStock -Patched (Join-Path $caseRoot 'moved-same.apk') -Name 'delta-moved' `
        -Allowlist (New-TestAllowlist 'moved' @('[rebuild]')) -Selection @('Hush row')
    Assert-True ($movedHeld.ExitCode -eq 1 -and $movedHeld.Output -match [regex]::Escape("FAIL resource delta moved $($movedLine): allowed neither")) `
        "A moved file passed an allowlist that doesn't name it.`n$($movedHeld.Output)"
    $movedAllowed = Invoke-Check -Stock $rawStock -Patched (Join-Path $caseRoot 'moved-same.apk') -Name 'delta-moved-allowed' `
        -Allowlist (New-TestAllowlist 'moved-allowed' @('[rebuild]', "moved $movedLine")) -Selection @('Hush row')
    Assert-True ($movedAllowed.ExitCode -eq 0) "A moved file [rebuild] allows failed.`n$($movedAllowed.Output)"

    # An allowlist that can't be read as one stops the check before it reads an APK, and so does
    # one given with no selection.
    $noSelection = Invoke-Check -Patched $blackApk -Name 'delta-no-selection' -Allowlist $byPatch
    Assert-True ($noSelection.ExitCode -eq 2 -and $noSelection.Output -match 'no patch selection in HUSHTUMBLR_PATCH_SELECTION') `
        "An allowlist given with no selection did not stop the check.`n$($noSelection.Output)"
    foreach ($bad in @(
            @{ Name = 'bad-kind'; Lines = @('[rebuild]', 'recolored color/accent'); Says = 'line 2: not a kind' },
            @{ Name = 'bad-outside'; Lines = @($accentLine, '[rebuild]'); Says = 'line 1: not a kind' },
            @{ Name = 'bad-empty-item'; Lines = @('[rebuild]', 'added '); Says = 'line 2: not a kind' },
            @{ Name = 'bad-twice'; Lines = @('[rebuild]', '[rebuild]'); Says = 'line 2: a section with no name or one named twice' },
            @{ Name = 'bad-unnamed'; Lines = @('[rebuild]', '[ ]'); Says = 'line 2: a section with no name or one named twice' },
            @{ Name = 'bad-no-rebuild'; Lines = @('[Black accent]', $accentLine); Says = 'has no [rebuild] section' })) {
        $said = Invoke-Check -Patched $blackApk -Name "delta-$($bad.Name)" -Allowlist (New-TestAllowlist $bad.Name $bad.Lines) -Selection @('Black accent')
        Assert-True ($said.ExitCode -eq 2 -and $said.Output -match [regex]::Escape("$($bad.Name)-allowlist.txt") -and $said.Output -match [regex]::Escape($bad.Says)) `
            "The malformed allowlist $($bad.Name) did not stop the check with '$($bad.Says)'.`n$($said.Output)"
    }

    # A type renamed in the table's own type pool: every color resolves to a type called colox.
    # The pool is UTF-16 as aapt2 writes type names (length 5, then the characters); UTF-8 is the
    # other layout a pool can have.
    try {
        $typeRenamed = Edit-Table -Name 'renamed-type' -What 'UTF-16 type name "color"' `
            -Find ([byte[]](5, 0, 99, 0, 111, 0, 108, 0, 111, 0, 114, 0)) -Replace ([byte[]](5, 0, 99, 0, 111, 0, 108, 0, 111, 0, 120, 0))
    } catch {
        $typeRenamed = Edit-Table -Name 'renamed-type-utf8' -What 'UTF-8 type name "color"' `
            -Find ([byte[]](5, 5, 99, 111, 108, 111, 114)) -Replace ([byte[]](5, 5, 99, 111, 108, 111, 120))
    }
    $type = Invoke-Check -Patched $typeRenamed -Name 'renamed-type'
    Assert-True ($type.ExitCode -eq 1) "A table whose color type changed name passed.`n$($type.Output)"
    Assert-True ($type.Output -match ([regex]::Escape("FAIL $($idOf['color/accent']) color/accent: is colox/accent in the patched table"))) `
        "The changed type's failure did not name the id and both types.`n$($type.Output)"

    $otherPackage = New-ResourceApk -Name 'other-package' -Files $stockFiles -PackageId '0x7e'
    $package = Invoke-Check -Patched $otherPackage -Name 'other-package'
    Assert-True ($package.ExitCode -eq 1) "A table without the stock package passed.`n$($package.Output)"
    Assert-True ($package.Output -match 'FAIL package 0x7f com.tumblr: not in the patched table') `
        "The missing package's failure did not name the package.`n$($package.Output)"

    # A value that points at nothing: the theme's window background, as bytes, moved to an id the
    # table does not have.
    $surface = [Convert]::ToInt32($idOf['color/surface'].Substring(2), 16)
    $nowhere = $surface -bor 0xfff0
    $dangling = Copy-ApkWith -From $stockApk -Name 'dangling' -Change {
        param($archive)
        $entry = $archive.GetEntry('resources.arsc')
        $stream = $entry.Open()
        try { $buffer = [System.IO.MemoryStream]::new(); $stream.CopyTo($buffer); $bytes = $buffer.ToArray() } finally { $stream.Dispose() }
        $pattern = [byte[]](@(8, 0, 0, 1) + [BitConverter]::GetBytes([int]$surface))
        $hits = @()
        for ($i = 0; $i -le $bytes.Length - $pattern.Length; $i++) {
            $match = $true
            for ($j = 0; $j -lt $pattern.Length; $j++) { if ($bytes[$i + $j] -ne $pattern[$j]) { $match = $false; break } }
            if ($match) { $hits += $i }
        }
        if ($hits.Count -ne 1) { throw "expected one reference to color/surface in the table, found $($hits.Count)" }
        [BitConverter]::GetBytes([int]$nowhere).CopyTo($bytes, $hits[0] + 4)
        $entry.Delete()
        $replacement = $archive.CreateEntry('resources.arsc', [System.IO.Compression.CompressionLevel]::NoCompression)
        $out = $replacement.Open()
        try { $out.Write($bytes, 0, $bytes.Length) } finally { $out.Dispose() }
    }
    $pointer = Invoke-Check -Patched $dangling -Name 'dangling'
    $nowhereHex = '0x{0:x8}' -f $nowhere
    Assert-True ($pointer.ExitCode -eq 1) "A reference to nothing passed.`n$($pointer.Output)"
    Assert-True ($pointer.Output -match ([regex]::Escape("FAIL $($idOf['style/SearchTheme']) style/SearchTheme [default] item 0x01010054") + ".*points at $nowhereHex, which is not in the patched table")) `
        "The dangling reference's failure did not name the style, the attr and the id.`n$($pointer.Output)"

    # The split descriptor a merge drops on purpose, beside an xml resource it must not drop.
    $splitIds = Join-Path $caseRoot 'split-ids.txt'
    $splitFiles = [ordered]@{
        'res/values/colors.xml' = $colors
        'res/values-night/colors.xml' = $nightColors
        'res/values/styles.xml' = $styles
        'res/layout/feed_story.xml' = $layout
        'res/xml/splits0.xml' = '<splits><module name="base" /></splits>'
        'res/xml/feed_prefs.xml' = '<PreferenceScreen />'
    }
    $splitStock = New-ResourceApk -Name 'split-stock' -Files $splitFiles -EmitIds $splitIds
    $splitIdOf = @{}
    foreach ($line in Get-Content -LiteralPath $splitIds) {
        if ($line -match '^[^:]+:(\S+) = (0x[0-9a-f]{8})$') { $splitIdOf[$Matches[1]] = $Matches[2] }
    }
    $mergedFiles = [ordered]@{}
    foreach ($entry in $splitFiles.GetEnumerator()) { if ($entry.Key -ne 'res/xml/splits0.xml') { $mergedFiles[$entry.Key] = $entry.Value } }
    $merged = Invoke-Check -Stock $splitStock -Patched (New-ResourceApk -Name 'merged' -Files $mergedFiles -StableIds $splitIds) -Name 'merged'
    Assert-True ($merged.ExitCode -eq 0) "A merge that dropped only the split descriptor failed.`n$($merged.Output)"
    Assert-True ($merged.Output -match ('dropped with the split metadata when the bundle was merged: 1\s+' +
        [regex]::Escape("$($splitIdOf['xml/splits0']) xml/splits0"))) `
        "The dropped split descriptor was not reported with its id.`n$($merged.Output)"
    $lostXmlFiles = [ordered]@{}
    foreach ($entry in $splitFiles.GetEnumerator()) { if ($entry.Key -ne 'res/xml/feed_prefs.xml') { $lostXmlFiles[$entry.Key] = $entry.Value } }
    $lostXml = Invoke-Check -Stock $splitStock -Patched (New-ResourceApk -Name 'lost-xml' -Files $lostXmlFiles -StableIds $splitIds) -Name 'lost-xml'
    Assert-True ($lostXml.ExitCode -eq 1) "A table that lost xml/feed_prefs passed as a split descriptor.`n$($lostXml.Output)"
    Assert-True ($lostXml.Output -match [regex]::Escape("FAIL $($splitIdOf['xml/feed_prefs']) xml/feed_prefs: not in the patched table")) `
        "The lost xml resource's failure did not name its id.`n$($lostXml.Output)"

    # A real split bundle, merged by the CLI's own merger through MergeSplits.java.
    # aapt2 puts every xxhdpi value in a config split, so dimen/tray_height, which has no other
    # value, is in the split alone. Held to base.apk, the merge's copy of it is only "added" and
    # never compared, which is how 7,588 resources of the Facebook sibling's 580 went unchecked
    # once the CLI stopped leaving its merge behind; held to the merge, a table that lost it fails
    # by name.
    $bundleDir = Join-Path $caseRoot 'bundle'
    New-Item -ItemType Directory -Force -Path (Join-Path $bundleDir 'res/values'), (Join-Path $bundleDir 'res/values-xxhdpi'),
        (Join-Path $bundleDir 'out') | Out-Null
    [System.IO.File]::WriteAllText((Join-Path $bundleDir 'res/values/dimens.xml'),
        '<resources><dimen name="gap">4dp</dimen></resources>', [System.Text.UTF8Encoding]::new($false))
    [System.IO.File]::WriteAllText((Join-Path $bundleDir 'res/values-xxhdpi/dimens.xml'),
        '<resources><dimen name="gap">6dp</dimen><dimen name="tray_height">96dp</dimen></resources>',
        [System.Text.UTF8Encoding]::new($false))
    $bundleManifest = Join-Path $bundleDir 'AndroidManifest.xml'
    # The package by name: $package holds the other-package case's result by now. A version code,
    # which aapt2 copies into the split's manifest, because the signature check holds every APK of a
    # bundle to one build.
    [System.IO.File]::WriteAllText($bundleManifest, ('<manifest xmlns:android="http://schemas.android.com/apk/res/android" ' +
        'package="com.tumblr" android:versionCode="1460500109"><application /></manifest>'), [System.Text.UTF8Encoding]::new($false))
    $bundleCompiled = Join-Path $bundleDir 'compiled.zip'
    Invoke-Checked -Program $Aapt2 -Arguments @('compile', '--dir', (Join-Path $bundleDir 'res'), '-o', $bundleCompiled) `
        -Description 'aapt2 compile for the split bundle'
    $baseApk = Join-Path $bundleDir 'out/base.apk'
    $splitApk = Join-Path $bundleDir 'out/split_config.xxhdpi.apk'
    # aapt2 separates a split's path from its configurations with the platform's path separator.
    Invoke-Checked -Program $Aapt2 -Arguments @('link', '-o', $baseApk, '-I', $androidJar, '--manifest', $bundleManifest,
        '--package-id', '0x7f', '--allow-reserved-package-id', '--split', ($splitApk + [System.IO.Path]::PathSeparator + 'xxhdpi'),
        $bundleCompiled) -Description 'aapt2 link for the split bundle'
    # APKPure's layout of Tumblr: the base named for the package, each split as config.<name>.apk,
    # an icon, and a manifest.json whose split_apks name the base by id.
    $bundle = Join-Path $bundleDir 'tumblr-split.xapk'
    $archive = [System.IO.Compression.ZipFile]::Open($bundle, [System.IO.Compression.ZipArchiveMode]::Create)
    try {
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $baseApk, 'com.tumblr.apk') | Out-Null
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $splitApk, 'config.xxhdpi.apk') | Out-Null
        $writer = New-Object System.IO.StreamWriter($archive.CreateEntry('manifest.json').Open())
        try {
            $writer.Write('{"xapk_version":2,"package_name":"com.tumblr","name":"Tumblr","split_apks":[' +
                '{"file":"com.tumblr.apk","id":"base"},{"file":"config.xxhdpi.apk","id":"config.xxhdpi"}]}')
        } finally { $writer.Dispose() }
        $archive.CreateEntry('icon.png').Open().Dispose()
    } finally { $archive.Dispose() }
    # These APKs come straight from aapt2 and carry no signature, which Get-MergedApk refuses (the
    # signed cases are further down). So the resource cases merge them through the steps it takes
    # once the signatures have passed: unpack with every member name checked, lock and hash, merge
    # exactly those bytes. Only a test calls these steps itself; no script can skip the check.
    function Invoke-TestSplitMerge([string]$Bundle, [string]$Destination) {
        $splits = Expand-SplitBundle -Apk $Bundle -Destination $Destination
        try {
            Lock-SplitFiles -Splits $splits
            # The merge comes back held to the digest the merger printed. These cases only read it.
            $merge = Invoke-SplitMerge -Splits $splits -Destination $Destination -Java $Java -DesktopJar $DesktopJar
            $merge.Handle.Dispose()
            return $merge.Path
        } finally {
            Remove-SplitDirectory -Splits $splits
        }
    }
    $mergedApk = Invoke-TestSplitMerge -Bundle $bundle -Destination (Join-Path $bundleDir 'merged/stock-merged.apk')
    Assert-True ($mergedApk -eq (Join-Path $bundleDir 'merged/stock-merged.apk') -and (Test-Path -LiteralPath $mergedApk -PathType Leaf)) `
        "The split bundle was not merged into the APK asked for: $mergedApk"
    # The same two APKs as an .apkm merge the same way, and that merge carries the split's resource too.
    $apkm = Join-Path $bundleDir 'tumblr-split.apkm'
    $archive = [System.IO.Compression.ZipFile]::Open($apkm, [System.IO.Compression.ZipArchiveMode]::Create)
    try {
        foreach ($apk in $baseApk, $splitApk) {
            [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $apk, (Split-Path -Leaf $apk)) | Out-Null
        }
    } finally { $archive.Dispose() }
    $mergedApkm = Invoke-TestSplitMerge -Bundle $apkm -Destination (Join-Path $bundleDir 'merged/apkm-merged.apk')
    $apkmCaught = Invoke-Check -Stock $mergedApkm -Patched $baseApk -Name 'apkm-merged-stock'
    Assert-True ($apkmCaught.ExitCode -eq 1 -and $apkmCaught.Output -match 'FAIL 0x7f\w{6} dimen/tray_height: not in the patched table') `
        "A table that lost the split's resource passed against the .apkm's merge.`n$($apkmCaught.Output)"
    $blind = Invoke-Check -Stock $baseApk -Patched $mergedApk -Name 'base-stock'
    Assert-True ($blind.ExitCode -eq 0 -and $blind.Output -match 'added resources: 1\s+0x7f\w{6} dimen/tray_height') `
        "The merge does not carry the split's own resource, or base.apk compared it after all.`n$($blind.Output)"
    $caught = Invoke-Check -Stock $mergedApk -Patched $baseApk -Name 'merged-stock'
    Assert-True ($caught.ExitCode -eq 1 -and $caught.Output -match 'FAIL 0x7f\w{6} dimen/tray_height: not in the patched table') `
        "A table that lost the split's resource passed against the merge.`n$($caught.Output)"
    $whole = Invoke-Check -Stock $mergedApk -Patched $mergedApk -Name 'merged-whole'
    Assert-True ($whole.ExitCode -eq 0) "The merge failed against itself.`n$($whole.Output)"
    # Get-MergedApk itself, on these unsigned APKs. A plain APK that doesn't verify, with no bundle
    # of its name beside it to be the merge of, is refused before anything is copied, and no JDK is
    # started for it. A bundle with no APK is refused before anything is unpacked.
    $apksigner = Resolve-Apksigner -Aapt2 $Aapt2
    $noJava = Join-Path $bundleDir 'no-java.exe'
    $unsignedSigner = 'a' * 64
    $refused = $null
    try {
        Get-MergedApk -Apk $baseApk -Destination (Join-Path $bundleDir 'never.apk') -Java $noJava -DesktopJar $DesktopJar `
            -Aapt2 $Aapt2 -PackageName 'com.tumblr' -Signers $unsignedSigner | Out-Null
    } catch {
        $refused = $_.Exception.Message
    }
    Assert-True ($refused -like '*Refusing base.apk: it does not verify (*), and no .apkm, .xapk or .apks of the same name beside it*' -and
        -not (Test-Path -LiteralPath (Join-Path $bundleDir 'never.apk')) -and
        @(Get-ChildItem -LiteralPath $bundleDir -Force -Filter '.splits-*').Count -eq 0) `
        "An unsigned plain APK was not refused before it was copied: $refused"
    $empty = Join-Path $bundleDir 'empty.apkm'
    $archive = [System.IO.Compression.ZipFile]::Open($empty, [System.IO.Compression.ZipArchiveMode]::Create)
    try {
        $writer = New-Object System.IO.StreamWriter($archive.CreateEntry('info.json').Open())
        try { $writer.Write('{}') } finally { $writer.Dispose() }
    } finally { $archive.Dispose() }
    $refused = $null
    try {
        Get-MergedApk -Apk $empty -Destination (Join-Path $bundleDir 'merged/empty-merged.apk') -Java $Java -DesktopJar $DesktopJar `
            -Aapt2 $Aapt2 -PackageName 'com.tumblr' -Signers $unsignedSigner | Out-Null
    } catch {
        $refused = $_.Exception.Message
    }
    Assert-True ($refused -like '*empty.apkm holds no APK. Nothing was unpacked.*' -and
        -not (Test-Path -LiteralPath (Join-Path $bundleDir 'merged/empty-merged.apk'))) `
        "A bundle holding no APK was not refused before the merge: $refused"
    Assert-True (@(Get-ChildItem -LiteralPath (Join-Path $bundleDir 'merged') -Force -Filter '.splits-*').Count -eq 0) `
        'A merge left the folder it unpacked a bundle into behind.'

    # MergeSplits.java reads a directory of APKs the scripts unpacked and checked, and nothing else.
    # Handed a bundle straight, the merger would unpack it where its member names point, so that is
    # refused, and so is a directory holding anything but regular .apk files, or none, all before
    # the merger runs. Each APK's hash, taken where its signature was checked, comes after the two
    # paths, and the directory has to hold exactly the APKs listed, with exactly those bytes.
    function Invoke-MergeSplits([string]$Splits, [string]$Merged, [string[]]$Digests = @(), [string]$With = $Java) {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $said = @(& $With '-Xmx1g' '-cp' $DesktopJar (Join-Path $PSScriptRoot 'MergeSplits.java') $Splits $Merged @Digests 2>&1 |
            ForEach-Object { "$_" })
        [pscustomobject]@{ ExitCode = $LASTEXITCODE; Text = $said -join "`n" }
    }
    function Get-TestSha256([string]$Path) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }
    $baseDigest = "base.apk:$(Get-TestSha256 $baseApk)"
    $usage = Invoke-MergeSplits $apkm (Join-Path $bundleDir 'merged/usage.apk')
    Assert-True ($usage.ExitCode -eq 2 -and $usage.Text -like '*usage: MergeSplits*' -and
        -not (Test-Path -LiteralPath (Join-Path $bundleDir 'merged/usage.apk'))) `
        "MergeSplits.java went ahead without the hashes of what was checked.`n$($usage.Text)"
    $direct = Invoke-MergeSplits $apkm (Join-Path $bundleDir 'merged/direct.apk') @($baseDigest)
    Assert-True ($direct.ExitCode -eq 2 -and $direct.Text -like '*is not a directory of split APKs*' -and
        -not (Test-Path -LiteralPath (Join-Path $bundleDir 'merged/direct.apk'))) `
        "MergeSplits.java merged a bundle handed to it straight.`n$($direct.Text)"
    $mixedSplits = Join-Path $bundleDir 'mixed-splits'
    New-Item -ItemType Directory -Force -Path (Join-Path $mixedSplits 'nested') | Out-Null
    Copy-Item -LiteralPath $baseApk -Destination (Join-Path $mixedSplits 'base.apk')
    $nested = Invoke-MergeSplits $mixedSplits (Join-Path $bundleDir 'merged/mixed.apk') @($baseDigest)
    Assert-True ($nested.ExitCode -eq 2 -and $nested.Text -like '*holds nested, which is not a split APK*' -and
        -not (Test-Path -LiteralPath (Join-Path $bundleDir 'merged/mixed.apk'))) `
        "MergeSplits.java merged a directory holding a folder.`n$($nested.Text)"
    Remove-Item -LiteralPath (Join-Path $mixedSplits 'nested') -Force
    [System.IO.File]::WriteAllText((Join-Path $mixedSplits 'info.json'), '{}')
    $other = Invoke-MergeSplits $mixedSplits (Join-Path $bundleDir 'merged/mixed.apk') @($baseDigest)
    Assert-True ($other.ExitCode -eq 2 -and $other.Text -like '*holds info.json, which is not a split APK*' -and
        -not (Test-Path -LiteralPath (Join-Path $bundleDir 'merged/mixed.apk'))) `
        "MergeSplits.java merged a directory holding another file.`n$($other.Text)"
    Remove-Item -LiteralPath (Join-Path $mixedSplits 'info.json') -Force
    $noSplits = Join-Path $bundleDir 'no-splits'
    New-Item -ItemType Directory -Force -Path $noSplits | Out-Null
    $none = Invoke-MergeSplits $noSplits (Join-Path $bundleDir 'merged/none.apk') @($baseDigest)
    Assert-True ($none.ExitCode -eq 2 -and $none.Text -like '*holds no split APK*') `
        "MergeSplits.java went ahead with no split APK.`n$($none.Text)"
    # The digests themselves: one that isn't a name and a SHA-256, a name listed twice, an APK
    # listed that isn't there, an APK there that isn't listed, and bytes other than the ones hashed.
    $hashCases = @(
        @{ Name = 'malformed'; Digests = @('base.apk:NOT-A-DIGEST'); Says = '*base.apk:NOT-A-DIGEST is not <name>.apk:<sha256>*' }
        @{ Name = 'twice'; Digests = @($baseDigest, $baseDigest); Says = '*base.apk is listed twice*' }
        @{ Name = 'missing'; Digests = @($baseDigest, "split.apk:$('0' * 64)"); Says = '*holds `[base.apk`], and the APKs that were checked are `[base.apk, split.apk`]*' }
        @{ Name = 'other-bytes'; Digests = @("base.apk:$('0' * 64)"); Says = "*base.apk hashes to $(Get-TestSha256 $baseApk), not the $('0' * 64) that was checked*" })
    foreach ($case in $hashCases) {
        $result = Invoke-MergeSplits $mixedSplits (Join-Path $bundleDir "merged/$($case.Name).apk") $case.Digests
        Assert-True ($result.ExitCode -eq 2 -and $result.Text -like $case.Says -and
            -not (Test-Path -LiteralPath (Join-Path $bundleDir "merged/$($case.Name).apk"))) `
            "MergeSplits.java merged against the hashes '$($case.Digests -join ' ')'.`n$($result.Text)"
    }
    Copy-Item -LiteralPath $splitApk -Destination (Join-Path $mixedSplits 'extra.apk')
    $unlisted = Invoke-MergeSplits $mixedSplits (Join-Path $bundleDir 'merged/unlisted.apk') @($baseDigest)
    Assert-True ($unlisted.ExitCode -eq 2 -and $unlisted.Text -like '*holds `[base.apk, extra.apk`], and the APKs that were checked are `[base.apk`]*' -and
        -not (Test-Path -LiteralPath (Join-Path $bundleDir 'merged/unlisted.apk'))) `
        "MergeSplits.java merged an APK nobody checked.`n$($unlisted.Text)"

    # Signed for real: two keystores, A standing for Tumblr's certificate and B for anybody else's,
    # and apksigner from the build-tools aapt2 came from. The base carries a classes.dex, as Tumblr's
    # does, so a universal APK can be held to it, and an asset and two raw files for a universal APK
    # to leave out or swap.
    $keytool = Join-Path (Split-Path -Parent $Java) 'keytool.exe'
    if (-not (Test-Path -LiteralPath $keytool -PathType Leaf)) { throw "Required tool not found: $keytool" }
    $keys = Join-Path $bundleDir 'keys'
    $signed = Join-Path $bundleDir 'signed'
    New-Item -ItemType Directory -Force -Path $keys, $signed | Out-Null
    foreach ($key in 'a', 'b') {
        Invoke-Checked -Program $keytool -Arguments @('-genkeypair', '-keystore', (Join-Path $keys "$key.p12"), '-storetype', 'PKCS12',
            '-storepass', 'hushtest', '-keypass', 'hushtest', '-alias', 'test', '-keyalg', 'RSA', '-keysize', '2048',
            '-validity', '3650', '-dname', "CN=HushTumblr test $key", '-noprompt') -Description "keytool for key $key"
    }
    function New-SignedApk([string]$From, [string]$Key, [string]$Name) {
        $out = Join-Path $signed $Name
        Invoke-Checked -Program $apksigner -Arguments @('sign', '--ks', (Join-Path $keys "$Key.p12"), '--ks-pass', 'pass:hushtest',
            '--key-pass', 'pass:hushtest', '--ks-key-alias', 'test', '--out', $out, $From) -Description "apksigner sign $Name with key $Key"
        return $out
    }
    function New-TestApkm([string]$Name, [string[]]$Apks) {
        $path = Join-Path $signed $Name
        $zip = [System.IO.Compression.ZipFile]::Open($path, [System.IO.Compression.ZipArchiveMode]::Create)
        try {
            for ($i = 0; $i -lt $Apks.Count; $i++) {
                $member = if ($i -eq 0) { 'base.apk' } else { 'split_config.xxhdpi.apk' }
                [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $Apks[$i], $member) | Out-Null
            }
        } finally { $zip.Dispose() }
        return $path
    }
    $dexBase = Copy-ApkWith -From $baseApk -Name 'dex-base' -Change {
        param($archive)
        foreach ($file in @(@{ Name = 'classes.dex'; Text = "dex`n035`0 stand-in code" }, @{ Name = 'assets/kept.txt'; Text = 'an asset the app reads' },
                @{ Name = 'res/raw/one.txt'; Text = 'the first raw file' }, @{ Name = 'res/raw/two.txt'; Text = 'the second raw file' })) {
            $out = $archive.CreateEntry($file.Name).Open()
            try { $bytes = [System.Text.Encoding]::ASCII.GetBytes($file.Text); $out.Write($bytes, 0, $bytes.Length) } finally { $out.Dispose() }
        }
    }
    $baseA = New-SignedApk -From $dexBase -Key 'a' -Name 'base-a.apk'
    $splitA = New-SignedApk -From $splitApk -Key 'a' -Name 'split-a.apk'
    $splitB = New-SignedApk -From $splitApk -Key 'b' -Name 'split-b.apk'
    $splitTampered = Join-Path $signed 'split-tampered.apk'
    Copy-Item -LiteralPath $splitA -Destination $splitTampered
    $archive = [System.IO.Compression.ZipFile]::Open($splitTampered, [System.IO.Compression.ZipArchiveMode]::Update)
    try {
        $writer = New-Object System.IO.StreamWriter($archive.CreateEntry('res/raw/added.txt').Open())
        try { $writer.Write('added after signing') } finally { $writer.Dispose() }
    } finally { $archive.Dispose() }
    $signerA = Get-ApkSigners -Apk $baseA -Apksigner $apksigner
    $signerB = Get-ApkSigners -Apk $splitB -Apksigner $apksigner
    Assert-True ($signerA.Verified -and @($signerA.Signers).Count -eq 1 -and $signerB.Verified -and @($signerB.Signers).Count -eq 1 -and
        $signerA.Signers[0] -cne $signerB.Signers[0]) "apksigner did not report one certificate for each test key: $($signerA.Said) / $($signerB.Said)"
    $pinned = @($signerA.Signers)

    # A bundle whose APKs all carry A merges, with a record of what was checked beside the merge,
    # and the merge carries the split's resource.
    $signedApkm = New-TestApkm -Name 'signed.apkm' -Apks @($baseA, $splitA)
    $signedMerged = Join-Path $bundleDir 'merged/signed-merged.apk'
    Assert-True ((Get-MergedApk -Apk $signedApkm -Destination $signedMerged -Java $Java -DesktopJar $DesktopJar `
            -Aapt2 $Aapt2 -PackageName 'com.tumblr' -Signers $pinned) -eq $signedMerged) 'The signed bundle was not merged where asked.'
    $record = Get-Content -LiteralPath "$signedMerged.authentic.json" -Raw | ConvertFrom-Json
    Assert-True ($record.package -ceq 'com.tumblr' -and [string]$record.versionCode -ceq '1460500109' -and
        (@($record.signers) -join ',') -ceq $pinned[0] -and $record.baseSha256 -ceq (Get-TestSha256 $baseA) -and
        $record.mergedSha256 -ceq (Get-TestSha256 $signedMerged) -and @($record.apks).Count -eq 2 -and
        # The bundle's digest, taken through the handle it was unpacked from, names the input.
        $record.sourceSha256 -ceq (Get-TestSha256 $signedApkm) -and (Get-HeldSourceSha256 -Merged $signedMerged) -ceq $record.sourceSha256 -and
        # A bundle vouches for itself, so no other bundle is named.
        $null -eq $record.signedFormSha256 -and $null -eq (Get-HeldSignedFormSha256 -Merged $signedMerged) -and
        # AAPT2 adds the density qualifier's API 4 floor to the manifest split name.
        (@($record.apks | ForEach-Object { "$($_.member)=$($_.split)" } | Sort-Object) -join ';') -ceq 'base.apk=;split_config.xxhdpi.apk=config.xxhdpi_v4') `
        "The record of the signed merge is wrong: $($record | ConvertTo-Json -Depth 5 -Compress)"
    # The merge is one this process made and still holds, which is the evidence: nothing is opened
    # or merged again for it, and its base is the APK whose signer was checked.
    $heldBaseA = Open-HeldFile -Path $baseA -What 'The base APK'
    try {
        $opened = Assert-AuthenticMerge -Merged $signedMerged -Base $heldBaseA -Apk $signedApkm -Scratch (Join-Path $bundleDir 'merged') `
            -Java $noJava -DesktopJar $DesktopJar -Aapt2 $Aapt2 -PackageName 'com.tumblr' -Signers $pinned
        Assert-True ($null -eq $opened) 'A merge this process still holds was opened a second time to be checked.'
    } finally { $heldBaseA.Dispose() }
    $signedCaught = Invoke-Check -Stock $signedMerged -Patched $baseApk -Name 'signed-merged-stock'
    Assert-True ($signedCaught.ExitCode -eq 1 -and $signedCaught.Output -match 'FAIL 0x7f\w{6} dimen/tray_height: not in the patched table') `
        "The signed bundle's merge does not carry the split's resource.`n$($signedCaught.Output)"

    # A universal APK, which merging leaves unsigned, passes as the merge of the same-named bundle
    # beside it, and is copied for the CLI with a record naming that bundle. It is held to that
    # bundle's merge, made again for the check and deleted, so this one needs the JDK. One whose dex
    # isn't the bundle's base dex is refused, and so is one carrying a native library the bundle doesn't:
    # both comparisons once walked each digest map as a single object and matched whatever they got.
    $universal = Join-Path $signed 'universal.apk'
    Copy-Item -LiteralPath $signedMerged -Destination $universal
    Copy-Item -LiteralPath $signedApkm -Destination (Join-Path $signed 'universal.apkm')
    $universalCopy = Join-Path $bundleDir 'merged/universal-copy.apk'
    Get-MergedApk -Apk $universal -Destination $universalCopy -Java $Java -DesktopJar $DesktopJar `
        -Aapt2 $Aapt2 -PackageName 'com.tumblr' -Signers $pinned | Out-Null
    $universalRecord = Get-Content -LiteralPath "$universalCopy.authentic.json" -Raw | ConvertFrom-Json
    Assert-True ((Get-TestSha256 $universalCopy) -ceq (Get-TestSha256 $universal) -and
        $universalRecord.signedForm -ceq (Join-Path $signed 'universal.apkm') -and $universalRecord.baseSha256 -ceq (Get-TestSha256 $baseA) -and
        $universalRecord.sourceSha256 -ceq (Get-TestSha256 $universal) -and (Get-HeldSourceSha256 -Merged $universalCopy) -ceq $universalRecord.sourceSha256 -and
        # The bundle it was trusted on is named by that bundle's digest, as it was read to be checked.
        $universalRecord.signedFormSha256 -ceq (Get-TestSha256 (Join-Path $signed 'universal.apkm')) -and
        (Get-HeldSignedFormSha256 -Merged $universalCopy) -ceq $universalRecord.signedFormSha256 -and
        @(Get-ChildItem -LiteralPath (Join-Path $bundleDir 'merged') -Force -Filter '.trusted-*').Count -eq 0) `
        "The universal APK was not passed as the signed bundle's merge, or the merge it was held to was left behind: $($universalRecord | ConvertTo-Json -Depth 5 -Compress)"
    $otherDex = Copy-ApkWith -From $universal -Name 'other-dex' -Change {
        param($archive)
        $archive.GetEntry('classes.dex').Delete()
        $out = $archive.CreateEntry('classes.dex').Open()
        try { $bytes = [System.Text.Encoding]::ASCII.GetBytes("dex`n035`0 other code"); $out.Write($bytes, 0, $bytes.Length) } finally { $out.Dispose() }
    }
    Move-Item -LiteralPath $otherDex -Destination (Join-Path $signed 'other-dex.apk')
    Copy-Item -LiteralPath $signedApkm -Destination (Join-Path $signed 'other-dex.apkm')
    $otherLibs = Copy-ApkWith -From $universal -Name 'other-libs' -Change {
        param($archive)
        $out = $archive.CreateEntry('lib/arm64-v8a/libstandin.so').Open()
        try { $bytes = [System.Text.Encoding]::ASCII.GetBytes('stand-in library'); $out.Write($bytes, 0, $bytes.Length) } finally { $out.Dispose() }
    }
    Move-Item -LiteralPath $otherLibs -Destination (Join-Path $signed 'other-libs.apk')
    Copy-Item -LiteralPath $signedApkm -Destination (Join-Path $signed 'other-libs.apkm')
    # Past the code and libraries, everything but the manifest and resource table has to be one of
    # the bundle's files too: an added asset is refused by name, and a res file by its content,
    # since the merge may move a res file to a folder without its -v4 or -v21 qualifier.
    foreach ($added in @(@{ Name = 'other-asset'; Entry = 'assets/standin.txt' }, @{ Name = 'other-res'; Entry = 'res/raw/standin.txt' })) {
        $entryName = $added.Entry
        $copy = Copy-ApkWith -From $universal -Name $added.Name -Change {
            param($archive)
            $out = $archive.CreateEntry($entryName).Open()
            try { $bytes = [System.Text.Encoding]::ASCII.GetBytes('stand-in file'); $out.Write($bytes, 0, $bytes.Length) } finally { $out.Dispose() }
        }
        Move-Item -LiteralPath $copy -Destination (Join-Path $signed "$($added.Name).apk")
        Copy-Item -LiteralPath $signedApkm -Destination (Join-Path $signed "$($added.Name).apkm")
    }
    # A universal APK made of nothing but the bundle's own files passes all of that, and still isn't
    # the bundle's merge: an asset left out, base.apk's resource table in place of the merged one
    # (so the resource only the split carries is gone), one raw file holding the other's bytes, and
    # a raw file there a second time under a name the merge doesn't have. Only the merge tells.
    $baseArchive = [System.IO.Compression.ZipFile]::OpenRead($baseA)
    try {
        $stream = $baseArchive.GetEntry('resources.arsc').Open()
        try { $buffer = [System.IO.MemoryStream]::new(); $stream.CopyTo($buffer); $baseTable = $buffer.ToArray() } finally { $stream.Dispose() }
    } finally { $baseArchive.Dispose() }
    $secondRaw = [System.Text.Encoding]::ASCII.GetBytes('the second raw file')
    function Set-TestEntry($Archive, [string]$Name, [byte[]]$Bytes) {
        $existing = $Archive.GetEntry($Name)
        if ($existing) { $existing.Delete() }
        $out = $Archive.CreateEntry($Name).Open()
        try { $out.Write($Bytes, 0, $Bytes.Length) } finally { $out.Dispose() }
    }
    foreach ($unwhole in @(
            @{ Name = 'missing-asset'; Change = { param($archive) $archive.GetEntry('assets/kept.txt').Delete() } },
            @{ Name = 'lost-resource'; Change = { param($archive) Set-TestEntry $archive 'resources.arsc' $baseTable } },
            @{ Name = 'swapped-res'; Change = { param($archive) Set-TestEntry $archive 'res/raw/one.txt' $secondRaw } },
            @{ Name = 'copied-res'; Change = { param($archive) Set-TestEntry $archive 'res/raw/three.txt' $secondRaw } })) {
        $copy = Copy-ApkWith -From $universal -Name $unwhole.Name -Change $unwhole.Change
        Move-Item -LiteralPath $copy -Destination (Join-Path $signed "$($unwhole.Name).apk")
        Copy-Item -LiteralPath $signedApkm -Destination (Join-Path $signed "$($unwhole.Name).apkm")
    }

    # Every refusal leaves no merge, no record and no unpacked folder. The ones a signature or a
    # file of the bundle's decides come before the JDK would start (it isn't there). The last four
    # are held to the bundle's merge, which the JDK makes, and that merge is gone afterwards too.
    $refusals = @(
        @{ Apk = (New-TestApkm -Name 'unsigned-split.apkm' -Apks @($baseA, $splitApk))
            Says = '*Refusing unsigned-split.apkm: split_config.xxhdpi.apk does not verify (*Nothing was merged or patched.*' }
        @{ Apk = (New-TestApkm -Name 'foreign-split.apkm' -Apks @($baseA, $splitB))
            Says = "*Refusing foreign-split.apkm: split_config.xxhdpi.apk is signed by $($signerB.Signers[0]), which isn't a certificate patches-list.json declares for com.tumblr*" }
        @{ Apk = (New-TestApkm -Name 'tampered-split.apkm' -Apks @($baseA, $splitTampered))
            Says = '*Refusing tampered-split.apkm: split_config.xxhdpi.apk does not verify (*Nothing was merged or patched.*' }
        @{ Apk = (Join-Path $signed 'other-dex.apk')
            Says = "*Refusing other-dex.apk: it does not verify, and its dex files aren't those of the base APK of other-dex.apkm*" }
        @{ Apk = (Join-Path $signed 'other-libs.apk')
            Says = "*Refusing other-libs.apk: it does not verify, and its native libraries aren't those of other-libs.apkm*" }
        @{ Apk = (Join-Path $signed 'other-asset.apk')
            Says = "*Refusing other-asset.apk: it does not verify, and its assets/standin.txt isn't in any APK of other-asset.apkm*" }
        @{ Apk = (Join-Path $signed 'other-res.apk')
            Says = "*Refusing other-res.apk: it does not verify, and its res/raw/standin.txt isn't in any APK of other-res.apkm*" }
        @{ Apk = (Join-Path $signed 'missing-asset.apk'); Merged = $true
            Says = '*Refusing missing-asset.apk: it does not verify, and it has no assets/kept.txt, which the merge of missing-asset.apkm holds*' }
        @{ Apk = (Join-Path $signed 'lost-resource.apk'); Merged = $true
            Says = "*Refusing lost-resource.apk: it does not verify, and its resources.arsc isn't the one the merge of lost-resource.apkm holds*" }
        @{ Apk = (Join-Path $signed 'swapped-res.apk'); Merged = $true
            Says = "*Refusing swapped-res.apk: it does not verify, and its res/raw/one.txt isn't the one the merge of swapped-res.apkm holds*" }
        @{ Apk = (Join-Path $signed 'copied-res.apk'); Merged = $true
            Says = "*Refusing copied-res.apk: it does not verify, and its res/raw/three.txt isn't in the merge of copied-res.apkm*" })
    foreach ($case in $refusals) {
        $destination = Join-Path $bundleDir ("merged/refused-" + [System.IO.Path]::GetFileNameWithoutExtension($case.Apk) + '.apk')
        $caseJava = if ($case.Merged) { $Java } else { $noJava }
        $refused = $null
        try {
            Get-MergedApk -Apk $case.Apk -Destination $destination -Java $caseJava -DesktopJar $DesktopJar `
                -Aapt2 $Aapt2 -PackageName 'com.tumblr' -Signers $pinned | Out-Null
        } catch {
            $refused = $_.Exception.Message
        }
        Assert-True ($refused -like $case.Says -and -not (Test-Path -LiteralPath $destination) -and
            -not (Test-Path -LiteralPath "$destination.authentic.json") -and
            @(Get-ChildItem -LiteralPath (Join-Path $bundleDir 'merged') -Force -Filter '.splits-*').Count -eq 0 -and
            @(Get-ChildItem -LiteralPath (Join-Path $bundleDir 'merged') -Force -Filter '.trusted-*').Count -eq 0) `
            "$(Split-Path -Leaf $case.Apk) was not refused before anything was handed on: $refused"
    }

    # Another process of the same user can write to anything this one can, so every check above was
    # only as good as the last time a path was read. From here a second copy of this shell does what
    # such a process could ($intruderText), at each point where a path used to be read a second
    # time: while the merger holds its files, in the moment after it lets go of the merged APK, and
    # while the merge is read by whatever comes after. A stand-in for java starts the real merger
    # and stops it at those points ($heldJavaText). Each case has to end in the bytes that were
    # checked or in a refusal, and the second process has to have really tried.
    $swapDir = Join-Path $bundleDir 'swap'
    New-Item -ItemType Directory -Force -Path $swapDir | Out-Null
    $intruderScript = Join-Path $swapDir 'intruder.ps1'
    $heldJava = Join-Path $swapDir 'held-java.ps1'
    $pinnedMerge = Join-Path $swapDir 'PinnedMerge.java'
    [System.IO.File]::WriteAllText($intruderScript, $intruderText)
    [System.IO.File]::WriteAllText($heldJava, $heldJavaText)
    [System.IO.File]::WriteAllText($pinnedMerge, $pinnedMergeText)
    $shell = (Get-Process -Id $PID).Path
    function Start-Intruder([string[]]$Steps, [switch]$Stay) {
        $list = Join-Path $swapDir ([guid]::NewGuid().ToString('N') + '.steps')
        [System.IO.File]::WriteAllLines($list, $Steps)
        $start = New-Object System.Diagnostics.ProcessStartInfo
        $start.FileName = $shell
        $start.Arguments = "-NoProfile -NonInteractive -ExecutionPolicy Bypass -File `"$intruderScript`" -Plan `"$list`""
        if ($Stay) { $start.Arguments += " -Ready `"$list.ready`" -Release `"$list.release`"" }
        $start.UseShellExecute = $false
        $start.CreateNoWindow = $true
        $start.RedirectStandardOutput = $true
        $start.RedirectStandardError = $true
        $second = [System.Diagnostics.Process]::Start($start)
        $intruders.Add($second)
        $intruder = [pscustomobject]@{ Process = $second; Said = $second.StandardOutput.ReadToEndAsync()
            Failed = $second.StandardError.ReadToEndAsync(); Release = "$list.release" }
        while ($Stay -and -not (Test-Path -LiteralPath "$list.ready")) {
            if ($second.HasExited) { throw "The second process left before it was let go: $($intruder.Said.Result) $($intruder.Failed.Result)" }
            Start-Sleep -Milliseconds 15
        }
        return $intruder
    }
    # What each step came to, a line a step: <step>|<path>|done, or refused with what Windows said.
    function Stop-Intruder($Intruder) {
        [System.IO.File]::WriteAllText($Intruder.Release, 'go')
        $Intruder.Process.WaitForExit()
        if ($Intruder.Process.ExitCode -ne 0) { throw "The second process failed: $($Intruder.Said.Result) $($Intruder.Failed.Result)" }
        return @($Intruder.Said.Result -split "`r?`n" | Where-Object { $_ })
    }
    function Invoke-Intruder([string[]]$Steps) {
        $intruder = Start-Intruder -Steps $Steps
        $intruder.Process.WaitForExit()
        if ($intruder.Process.ExitCode -ne 0) { throw "The second process failed: $($intruder.Said.Result) $($intruder.Failed.Result)" }
        return @($intruder.Said.Result -split "`r?`n" | Where-Object { $_ })
    }
    # How Windows turns a second opener away from a held file (a sharing violation), and a rename
    # away from a folder with an open file under it (access denied). A step refused any other way,
    # for a path that isn't there or an argument that is wrong, tried nothing.
    $sharing = 'refused: IOException 0x80070020'
    $denied = 'refused: IOException 0x80070005'
    # Everything a second process could do to one file: read it, write into it, add to it, map it
    # to write, delete it, rename it, and copy another file over it.
    function Get-Attempts([string]$Path) {
        return @("read|$Path", "write|$Path", "append|$Path", "map|$Path", "delete|$Path", "move|$Path|$Path.moved", "copy|$Path|$probe")
    }
    function Assert-Attempts([string[]]$Said, [string]$Path, [string]$Read, [string]$Rest, [string]$What) {
        $expected = @("read|$Path|$Read") + @('write', 'append', 'map', 'delete', 'move', 'copy' | ForEach-Object { "$_|$Path|$Rest" })
        Assert-True (($Said -join "`n") -ceq ($expected -join "`n")) "${What}:`n$($Said -join "`n")`nwhere this was expected:`n$($expected -join "`n")"
    }
    function Invoke-Said([string]$Program, [string[]]$Arguments) {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $said = @(& $Program @Arguments 2>&1 | ForEach-Object { "$_" })
        [pscustomobject]@{ ExitCode = $LASTEXITCODE; Text = $said -join "`n" }
    }
    function Get-PrintedDigest([string]$Text) { [regex]::Match($Text, '(?m)^\[merge\] sha256 ([0-9a-f]{64})\s*$').Groups[1].Value }
    function Invoke-PinnedMerge([string]$Splits, [string]$Merged) {
        Invoke-Checked -Program $Java -Arguments @('-Xmx1g', '-cp', $DesktopJar, $pinnedMerge, $Splits, $Merged) -Description 'ApkMerger.merge'
        return Get-TestSha256 $Merged
    }
    # Get-MergedApk on the signed bundle with the stand-in for java, so -At's blocks run where the
    # merger is held (checked, buffered, written) and once it has exited (closed). A block is
    # handed the folder of unpacked APKs and the merged APK's path. It runs under Get-MergedApk, so
    # it reads this script's variables but not ones a function on the way names too, and it keeps
    # what it learns in $swap.
    $swap = @{ Said = @{} }
    function Invoke-HeldMerge([hashtable]$At, [string]$To) {
        $global:HushTumblrHeldJava = @{ Java = $Java; Work = $swapDir; At = $At; Reached = @() }
        $result = [pscustomobject]@{ Path = $null; Refused = $null; Untrusted = $false; Reached = @() }
        try {
            $result.Path = Get-MergedApk -Apk $signedApkm -Destination $To -Java $heldJava -DesktopJar $DesktopJar `
                -Aapt2 $Aapt2 -PackageName 'com.tumblr' -Signers $pinned
        } catch {
            $result.Refused = $_.Exception.Message
            # Windows with redirection guard on won't follow a junction an ordinary user made, from any
            # process (ERROR_UNTRUSTED_MOUNT_POINT, 448), so a destination reached through one is refused
            # by the first open under it, before anything is written there.
            for ($e = $_.Exception; $e; $e = $e.InnerException) {
                if (($e -is [ComponentModel.Win32Exception] -and $e.NativeErrorCode -eq 448) -or ($e.HResult -band 0xFFFF) -eq 448) { $result.Untrusted = $true }
            }
        }
        $result.Reached = @($global:HushTumblrHeldJava.Reached)
        return $result
    }
    # Nothing of a refused merge is left for a caller to pick up: it isn't held, and no record, no
    # unpacked APKs, no buffer and no file kept open are beside where it would have been.
    function Test-NothingHandedOn([string]$To) {
        $folder = Split-Path -Parent $To
        return -not (Get-HeldMerges).ContainsKey($To) -and -not (Test-Path -LiteralPath "$To.authentic.json") -and
            -not (Test-Path -LiteralPath "$To.buffer") -and
            @(Get-ChildItem -LiteralPath $folder -Force | Where-Object { $_.Name -like '.splits-*' -or $_.Name -like '.held-*' }).Count -eq 0
    }
    $cleanDigest = (Get-HeldMerges)[$signedMerged].Sha256
    Assert-True ($cleanDigest -match '^[0-9a-f]{64}$' -and $cleanDigest -ceq (Get-TestSha256 $signedMerged)) `
        "The signed bundle's merge is not held to the digest of the file that is there: $cleanDigest"
    $heldBefore = (Get-HeldMerges).Count
    $forgedSource = Join-Path $signed 'other-dex.apk'
    $forgedDigest = Get-TestSha256 $forgedSource
    $probe = Join-Path $swapDir 'probe.bin'
    [System.IO.File]::WriteAllBytes($probe, [byte[]](1..200))
    $probeDigest = Get-TestSha256 $probe

    # MergeSplits.java does the merger's steps itself now, through the channels it holds, so it is
    # held to ApkMerger.merge on the same APKs: the same bytes, and so the same manifest and
    # resource table, the same entries in the same order and the same alignment. This bundle's
    # manifest says its splits are required, twice over, which is what the merger takes out of a
    # manifest, and keeps native libraries in the APK (extractNativeLibs false, as Tumblr's does).
    # Its base carries one, which is what the 16 KB alignment moves: zipalign finds it stored on a
    # 16 KB boundary in the merge.
    $jar = Join-Path (Split-Path -Parent $Java) 'jar.exe'
    if (-not (Test-Path -LiteralPath $jar -PathType Leaf)) { throw "Required tool not found: $jar" }
    $zipalign = Resolve-Zipalign -Aapt2 $Aapt2
    $equalIn = Join-Path $swapDir 'equal-in'
    $libraryTree = Join-Path $swapDir 'library'
    New-Item -ItemType Directory -Force -Path $equalIn, (Join-Path $libraryTree 'lib/arm64-v8a') | Out-Null
    [System.IO.File]::WriteAllBytes((Join-Path $libraryTree 'lib/arm64-v8a/libstandin.so'), (New-Object byte[] 5000))
    $equalManifest = Join-Path $swapDir 'equal-manifest.xml'
    [System.IO.File]::WriteAllText($equalManifest, ('<manifest xmlns:android="http://schemas.android.com/apk/res/android" ' +
        'package="com.tumblr" android:versionCode="1460500109"><application android:extractNativeLibs="false" ' +
        'android:isSplitRequired="true"><meta-data android:name="com.android.vending.splits.required" android:value="true" />' +
        '</application></manifest>'), [System.Text.UTF8Encoding]::new($false))
    Invoke-Checked -Program $Aapt2 -Arguments @('link', '-o', (Join-Path $equalIn 'base.apk'), '-I', $androidJar, '--manifest', $equalManifest,
        '--package-id', '0x7f', '--allow-reserved-package-id',
        '--split', ((Join-Path $equalIn 'split_config.xxhdpi.apk') + [System.IO.Path]::PathSeparator + 'xxhdpi'), $bundleCompiled) `
        -Description 'aapt2 link for the bundle with a library'
    Invoke-Checked -Program $jar -Arguments @('--update', '--no-compress', '--no-manifest', '--file', (Join-Path $equalIn 'base.apk'),
        '-C', $libraryTree, 'lib') -Description 'jar for a stored library'
    $equalDigests = @(Get-ChildItem -LiteralPath $equalIn -Filter '*.apk' | ForEach-Object { "$($_.Name):$(Get-TestSha256 $_.FullName)" })
    $equalOut = Join-Path $swapDir 'equal-held.apk'
    $equal = Invoke-MergeSplits $equalIn $equalOut $equalDigests
    Assert-True ($equal.ExitCode -eq 0 -and (Get-PrintedDigest $equal.Text) -and (Get-PrintedDigest $equal.Text) -ceq (Get-TestSha256 $equalOut) -and
        -not (Test-Path -LiteralPath "$equalOut.buffer")) `
        "MergeSplits.java did not print the digest of the APK it wrote, or left its buffer behind.`n$($equal.Text)"
    $equalPinned = Invoke-PinnedMerge $equalIn (Join-Path $swapDir 'equal-pinned.apk')
    Assert-True ((Get-PrintedDigest $equal.Text) -ceq $equalPinned) `
        "MergeSplits.java does not write the bytes ApkMerger.merge writes for the same APKs: $(Get-PrintedDigest $equal.Text) and $equalPinned."
    $equalBaseSaid = Invoke-Said $Aapt2 @('dump', 'xmltree', '--file', 'AndroidManifest.xml', (Join-Path $equalIn 'base.apk'))
    Assert-True ($equalBaseSaid.Text -match 'isSplitRequired' -and $equalBaseSaid.Text -match 'com\.android\.vending\.splits\.required') `
        "The base APK's manifest does not say its splits are required, so the merge has nothing to take out.`n$($equalBaseSaid.Text)"
    $equalSaid = Invoke-Said $Aapt2 @('dump', 'xmltree', '--file', 'AndroidManifest.xml', $equalOut)
    Assert-True ($equalSaid.ExitCode -eq 0 -and $equalSaid.Text -match 'extractNativeLibs\(0x[0-9a-f]+\)=false' -and
        $equalSaid.Text -notmatch 'isSplitRequired|com\.android\.vending') `
        "The merge's manifest still says its splits are required, or lost what keeps libraries in the APK.`n$($equalSaid.Text)"
    $aligned = Invoke-Said $zipalign @('-c', '-P', '16', '-v', '4', $equalOut)
    Assert-True ($aligned.ExitCode -eq 0 -and $aligned.Text -match 'lib/arm64-v8a/libstandin\.so \(OK\)') `
        "The merge does not keep a stored library on a 16 KB boundary, so the comparison above did not cover it.`n$($aligned.Text)"

    # (1) A split nobody checked, put beside the checked ones once they have been hashed and taken
    # away again before the merge ends, so no listing before or after finds it. ApkMerger.merge
    # lists the folder for itself in between: the same three APKs through it are other bytes. The
    # merge is made of the two that were checked, read through the channels they were hashed by.
    $extraDir = Join-Path $swapDir 'extra'
    foreach ($values in 'values', 'values-xxhdpi') {
        New-Item -ItemType Directory -Force -Path (Join-Path $extraDir "res/$values") | Out-Null
        Copy-Item -LiteralPath (Join-Path $bundleDir "res/$values/dimens.xml") -Destination (Join-Path $extraDir "res/$values/dimens.xml")
    }
    New-Item -ItemType Directory -Force -Path (Join-Path $extraDir 'res/values-xhdpi') | Out-Null
    [System.IO.File]::WriteAllText((Join-Path $extraDir 'res/values-xhdpi/dimens.xml'),
        '<resources><dimen name="gap">5dp</dimen></resources>', [System.Text.UTF8Encoding]::new($false))
    Invoke-Checked -Program $Aapt2 -Arguments @('compile', '--dir', (Join-Path $extraDir 'res'), '-o', (Join-Path $extraDir 'compiled.zip')) `
        -Description 'aapt2 compile for the unchecked split'
    $extraSplit = Join-Path $extraDir 'split_config.xhdpi.apk'
    Invoke-Checked -Program $Aapt2 -Arguments @('link', '-o', (Join-Path $extraDir 'base.apk'), '-I', $androidJar, '--manifest', $bundleManifest,
        '--package-id', '0x7f', '--allow-reserved-package-id',
        '--split', ((Join-Path $extraDir 'split_config.xxhdpi.apk') + [System.IO.Path]::PathSeparator + 'xxhdpi'),
        '--split', ($extraSplit + [System.IO.Path]::PathSeparator + 'xhdpi'), (Join-Path $extraDir 'compiled.zip')) `
        -Description 'aapt2 link for the unchecked split'
    $listedDir = Join-Path $swapDir 'listed'
    New-Item -ItemType Directory -Force -Path $listedDir | Out-Null
    $inserted = Invoke-HeldMerge -To (Join-Path $swapDir 'inserted/out.apk') -At @{
        checked = {
            param($splitDir, $mergedPath)
            $swap.Extra = Join-Path $splitDir 'split_config.xhdpi.apk'
            $swap.Said['put'] = Invoke-Intruder @("create|$($swap.Extra)|$extraSplit")
            # The folder as a merger that lists it now would find it.
            Copy-Item -Path (Join-Path $splitDir '*.apk') -Destination $listedDir
        }
        written = { $swap.Said['took'] = Invoke-Intruder @("delete|$($swap.Extra)") }
    }
    Assert-True ($null -eq $inserted.Refused -and ($inserted.Reached -join ' ') -ceq 'checked buffered written') `
        "The merger was not stopped where its files are held: [$($inserted.Reached -join ' ')] $($inserted.Refused)"
    Assert-True ($swap.Said['put'] -ceq "create|$($swap.Extra)|done" -and $swap.Said['took'] -ceq "delete|$($swap.Extra)|done") `
        "The second process could not put a split beside the checked ones and take it away, so nothing was tried: $($swap.Said['put']) $($swap.Said['took'])"
    $listedDigest = Invoke-PinnedMerge $listedDir (Join-Path $swapDir 'listed.apk')
    Assert-True (@(Get-ChildItem -LiteralPath $listedDir -Filter '*.apk').Count -eq 3 -and $listedDigest -cne $cleanDigest) `
        "A merge that lists the folder is no different with the unchecked split in it, so the case shows nothing: $listedDigest"
    Assert-True ((Get-HeldMerges)[$inserted.Path].Sha256 -ceq $cleanDigest -and (Get-TestSha256 $inserted.Path) -ceq $cleanDigest) `
        ("A split nobody checked, beside the checked ones while they were merged, is in the merge: it hashes to " +
        "$((Get-HeldMerges)[$inserted.Path].Sha256), and the checked APKs alone merge to $cleanDigest.")

    # (2) Writers and mappings. First the merger on its own, with nothing of the scripts' holding
    # its files: what a second process can do to an APK being merged, to the buffer the merger
    # compresses changed entries into, and to the APK being written, during the merge and once it
    # is whole. It can read the first and the last. The buffer it can't so much as read.
    $heldIn = Join-Path $swapDir 'held-in'
    New-Item -ItemType Directory -Force -Path $heldIn | Out-Null
    Copy-Item -LiteralPath $baseA -Destination (Join-Path $heldIn 'base.apk')
    Copy-Item -LiteralPath $splitA -Destination (Join-Path $heldIn 'split_config.xxhdpi.apk')
    $heldSplit = Join-Path $heldIn 'base.apk'
    $heldOut = Join-Path $swapDir 'held-out.apk'
    $global:HushTumblrHeldJava = @{ Java = $Java; Work = $swapDir; Reached = @(); At = @{
            checked = { $swap.Said['split'] = Invoke-Intruder (Get-Attempts $heldSplit) }
            buffered = {
                $swap.BufferLength = ([System.IO.FileInfo]"$heldOut.buffer").Length
                $swap.Said['buffer'] = Invoke-Intruder (Get-Attempts "$heldOut.buffer")
                $swap.Said['output'] = Invoke-Intruder (Get-Attempts $heldOut)
            }
            written = { $swap.Said['whole'] = Invoke-Intruder (Get-Attempts $heldOut) }
        } }
    $heldRun = Invoke-MergeSplits $heldIn $heldOut @("base.apk:$(Get-TestSha256 $baseA)", "split_config.xxhdpi.apk:$(Get-TestSha256 $splitA)") $heldJava
    # Each point's attempts are read before the next point is asked about: a write that got through
    # breaks the merge, and the merger then never reaches the points after it.
    $reached = @($global:HushTumblrHeldJava.Reached)
    $stopped = "The merger was not stopped where its files are held: [$($reached -join ' ')]`n$($heldRun.Text)"
    Assert-True ($reached -ccontains 'checked') $stopped
    Assert-Attempts $swap.Said['split'] $heldSplit 'done' $sharing 'An APK being merged was not kept from a second process'
    Assert-True ($reached -ccontains 'buffered') $stopped
    Assert-True ($swap.BufferLength -gt 0) 'The merger compressed nothing into its buffer, so holding it showed nothing.'
    Assert-Attempts $swap.Said['buffer'] "$heldOut.buffer" $sharing $sharing 'The buffer of compressed entries was not kept from a second process'
    Assert-Attempts $swap.Said['output'] $heldOut 'done' $sharing 'The APK being written was not kept from a second process'
    Assert-True (($reached -join ' ') -ceq 'checked buffered written') $stopped
    Assert-Attempts $swap.Said['whole'] $heldOut 'done' $sharing 'The written APK was not kept from a second process until its digest was printed'
    Assert-True ($heldRun.ExitCode -eq 0 -and (Get-PrintedDigest $heldRun.Text) -ceq $cleanDigest -and (Get-TestSha256 $heldOut) -ceq $cleanDigest -and
        (Get-TestSha256 $heldSplit) -ceq (Get-TestSha256 $baseA) -and -not (Test-Path -LiteralPath "$heldOut.buffer") -and
        @(Get-ChildItem -LiteralPath $swapDir, $heldIn -Force -Filter '*.moved').Count -eq 0) `
        "A merge a second process tried all of that on is not the checked APKs' merge.`n$($heldRun.Text)"

    # A mapping and then a writer another process took on the destination before the merge began.
    # The merge is made as a new file, so both are left with the old one: what they write later
    # lands there, and the merge is still the checked bytes. Where Windows won't delete a mapped
    # file the merge is refused instead, which serves as well.
    $preOut = Join-Path $swapDir 'pre-opened/out.apk'
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $preOut) | Out-Null
    Copy-Item -LiteralPath $forgedSource -Destination $preOut
    $holder = Start-Intruder -Stay -Steps @("hold-map|$preOut", "hold-writer|$preOut")
    try { $pre = Invoke-HeldMerge -To $preOut -At @{} } finally { $late = Stop-Intruder $holder }
    Assert-True (($late -join "`n") -ceq (@("hold-map|$preOut|done", "hold-writer|$preOut|done", 'late-write|MemoryMappedViewAccessor|done',
            'late-write|FileStream|done') -join "`n")) "The second process did not hold the destination before the merge and write to it after:`n$($late -join "`n")"
    if ($pre.Refused) {
        Assert-True (Test-NothingHandedOn $preOut) "A merge refused over a destination already held left something to pick up: $($pre.Refused)"
    } else {
        Assert-True ((Get-HeldMerges)[$pre.Path].Sha256 -ceq $cleanDigest -and
            (Get-StreamSha256 -Stream (Get-HeldMerges)[$pre.Path].Handle) -ceq $cleanDigest -and (Get-TestSha256 $pre.Path) -ceq $cleanDigest) `
            "A writer and a mapping taken on the destination before the merge reached the merge: $(Get-TestSha256 $pre.Path)"
    }

    # A mapping taken in the moment after the merger closes the APK and before the scripts open
    # it. What it maps could change under every later reader, so the APK is not taken.
    $swap.Holder = $null
    $late = @()
    $mappedOut = Join-Path $swapDir 'mapped/out.apk'
    try {
        $mapped = Invoke-HeldMerge -To $mappedOut -At @{
            closed = { param($splitDir, $mergedPath) $swap.Holder = Start-Intruder -Stay -Steps @("hold-map|$mergedPath") } }
    } finally {
        if ($swap.Holder) { $late = Stop-Intruder $swap.Holder }
    }
    Assert-True ($late.Count -eq 2 -and $late[0] -ceq "hold-map|$mappedOut|done") "The second process did not map the merged APK once the merger closed it:`n$($late -join "`n")"
    Assert-True ($mapped.Refused -like "The merge of signed.apkm at $mappedOut can't be opened so that nothing else can write to it, so it isn't used:*" -and
        (Test-NothingHandedOn $mappedOut)) "A merged APK another process had mapped to write was taken: $($mapped.Refused)"

    # The same for any file the scripts take (Open-HeldFile): one a second process has open to
    # write, or mapped, is refused, and so is one whose bytes aren't the ones it was written with
    # once that process has let go. As it is, with its own digest, it is taken.
    foreach ($kind in 'hold-writer', 'hold-map') {
        $holder = Start-Intruder -Stay -Steps @("$kind|$probe")
        $refused = $null
        try { (Open-HeldFile -Path $probe -Sha256 $probeDigest -What 'The probe').Dispose() }
        catch { $refused = $_.Exception.Message }
        finally { $late = Stop-Intruder $holder }
        Assert-True ($late.Count -eq 2 -and $late[0] -ceq "$kind|$probe|done" -and $late[1] -like 'late-write|*|done' -and
            $refused -like "The probe at $probe can't be opened so that nothing else can write to it, so it isn't used:*") `
            "A file another process held with $kind was opened as one nothing can write to: $refused`n$($late -join "`n")"
    }
    $refused = $null
    try { (Open-HeldFile -Path $probe -Sha256 $probeDigest -What 'The probe').Dispose() } catch { $refused = $_.Exception.Message }
    Assert-True ($refused -ceq ("The probe at $probe isn't what was written there: read through a handle nothing else can write past, it hashes to " +
            "$(Get-TestSha256 $probe), and what was written hashed to $probeDigest. Something changed it in between, so it isn't used.")) `
        "A file written to since its digest was taken was opened as the file that was written: $refused"
    (Open-HeldFile -Path $probe -Sha256 (Get-TestSha256 $probe) -What 'The probe').Dispose()
    # And for an unpacked APK that is mapped before the scripts lock it.
    $lockedSplits = Expand-SplitBundle -Apk $signedApkm -Destination (Join-Path $swapDir 'locked/out.apk')
    $refused = $null
    try {
        $holder = Start-Intruder -Stay -Steps @("hold-map|$($lockedSplits.Files[0].Path)")
        try { Lock-SplitFiles -Splits $lockedSplits } catch { $refused = $_.Exception.Message } finally { $late = Stop-Intruder $holder }
    } finally {
        Remove-SplitDirectory -Splits $lockedSplits
    }
    Assert-True ($late.Count -eq 2 -and $late[0] -like 'hold-map|*|done' -and
        $refused -like "base.apk at $($lockedSplits.Files[0].Path) can't be opened so that nothing else can write to it, so it isn't used:*") `
        "An unpacked APK another process had mapped to write was locked and hashed as it was: $refused`n$($late -join "`n")"

    # (3) The moment between the merger closing the merged APK and the scripts opening it, which
    # no handle covers: one that can write and one that turns writers away can't both be open.
    # Another APK is put in its place then. The merger printed the digest of what it wrote, the
    # scripts hash what they now hold, and the two differ.
    $swappedOut = Join-Path $swapDir 'swapped/out.apk'
    $swapped = Invoke-HeldMerge -To $swappedOut -At @{
        closed = { param($splitDir, $mergedPath) $swap.Said['swap'] = Invoke-Intruder @("copy|$mergedPath|$forgedSource") } }
    Assert-True ($swap.Said['swap'] -ceq "copy|$swappedOut|done") "The second process could not put another APK where the merge was: $($swap.Said['swap'])"
    Assert-True ($swapped.Refused -ceq ("The merge of signed.apkm at $swappedOut isn't what was written there: read through a handle nothing else " +
            "can write past, it hashes to $forgedDigest, and what was written hashed to $cleanDigest. Something changed it in between, so it isn't used.") -and
        -not (Test-Path -LiteralPath $swappedOut) -and (Test-NothingHandedOn $swappedOut)) `
        "An APK put in the merge's place after the merger closed it was taken as the merge: $($swapped.Refused)"

    # (4) A merged APK handed over with a record beside it that says everything right. The record
    # used to be the proof. Whoever can write the APK can write the record, so the proof is the
    # merge made again from the checked APKs: the forged pair is refused, and the merge's own
    # bytes, with no record at all, pass and come back held. Either way the base has to be the
    # APK whose signer was checked.
    $forged = Join-Path $swapDir 'forged.apk'
    Copy-Item -LiteralPath $forgedSource -Destination $forged
    $forgedRecord = Get-Content -LiteralPath "$signedMerged.authentic.json" -Raw | ConvertFrom-Json
    $forgedRecord.mergedSha256 = $forgedDigest
    [System.IO.File]::WriteAllText("$forged.authentic.json", ($forgedRecord | ConvertTo-Json -Depth 5), (New-Object System.Text.UTF8Encoding($false)))
    $handed = Join-Path $swapDir 'handed.apk'
    Copy-Item -LiteralPath $signedMerged -Destination $handed
    $rebuiltIn = Join-Path $swapDir 'rebuilt'
    $heldAtFour = (Get-HeldMerges).Count
    $heldBaseA = Open-HeldFile -Path $baseA -What 'The base APK'
    $heldSplitA = Open-HeldFile -Path $splitA -What 'Another APK'
    $handedHeld = $null
    try {
        # What a call hands back is a hold on the file, and is let go here whether or not the call
        # should have handed anything back, or it would outlast the case.
        $refused = $null
        try {
            $handedHeld = Assert-AuthenticMerge -Merged $forged -Base $heldBaseA -Apk $signedApkm -Scratch $rebuiltIn -Java $Java -DesktopJar $DesktopJar `
                -Aapt2 $Aapt2 -PackageName 'com.tumblr' -Signers $pinned
        } catch { $refused = $_.Exception.Message }
        if ($handedHeld) { $handedHeld.Dispose(); $handedHeld = $null }
        Assert-True ($refused -like("$forged is not the merge of signed.apkm: read through a handle nothing else can write past, it hashes to " +
                "$forgedDigest, and that input's APKs, checked against the declared signer and merged here, hash to $cleanDigest. A record beside it is not evidence*")) `
            "A merged APK with other code in it and a record written to match was taken as the bundle's merge: $refused"
        $handedHeld = Assert-AuthenticMerge -Merged $handed -Base $heldBaseA -Apk $signedApkm -Scratch $rebuiltIn -Java $Java -DesktopJar $DesktopJar `
            -Aapt2 $Aapt2 -PackageName 'com.tumblr' -Signers $pinned
        Assert-True ($handedHeld -is [System.IO.FileStream] -and (Get-HeldPath -Stream $handedHeld) -eq $handed -and
            (Invoke-Intruder @("write|$handed")) -ceq "write|$handed|$sharing") `
            'The bundle''s own merge, handed over without a record, was not taken and held.'
        $handedHeld.Dispose()
        $handedHeld = $null
        $refused = $null
        try {
            $handedHeld = Assert-AuthenticMerge -Merged $handed -Base $heldSplitA -Apk $signedApkm -Scratch $rebuiltIn -Java $Java -DesktopJar $DesktopJar `
                -Aapt2 $Aapt2 -PackageName 'com.tumblr' -Signers $pinned
        } catch { $refused = $_.Exception.Message }
        if ($handedHeld) { $handedHeld.Dispose(); $handedHeld = $null }
        Assert-True ($refused -ceq"The clean base APK $splitA hashes to $(Get-TestSha256 $splitA), and the base whose signer stands for $handed hashed to $(Get-TestSha256 $baseA), so they aren't the same build.") `
            "A merge was taken beside a base APK that isn't the one its signer was checked on: $refused"
    } finally {
        if ($handedHeld) { $handedHeld.Dispose() }
        $heldBaseA.Dispose()
        $heldSplitA.Dispose()
    }
    Assert-True (@(Get-ChildItem -LiteralPath $rebuiltIn -Force).Count -eq 0 -and (Get-HeldMerges).Count -eq $heldAtFour) `
        'The merges made to hold a handed one to were left behind, or left held.'

    # (5) A destination reached through a junction, which a second process turns to another folder
    # once the APKs have been checked, with another APK waiting there under the same name. The
    # folder was taken by its real path before anything was written, so the merge is made there,
    # handed back by that path, and nothing is written where the junction now leads. The folder
    # itself, and the one the APKs were unpacked into, can't be renamed while a file in them is
    # held, during the merge or after it, and can once the merge is let go.
    $realDir = Join-Path $swapDir 'real'
    $otherDir = Join-Path $swapDir 'other'
    $link = Join-Path $swapDir 'link'
    New-Item -ItemType Directory -Force -Path $realDir, $otherDir | Out-Null
    Copy-Item -LiteralPath $forgedSource -Destination (Join-Path $otherDir 'out.apk')
    [System.IO.File]::WriteAllText((Join-Path $otherDir 'other-folder.txt'), 'the folder the junction is turned to')
    New-Item -ItemType Junction -Path $link -Target $realDir | Out-Null
    try {
        $turned = Invoke-HeldMerge -To (Join-Path $link 'out.apk') -At @{
            checked = {
                param($splitDir, $mergedPath)
                $swap.Said['turn'] = Invoke-Intruder @("move|$realDir|$realDir.moved", "move|$splitDir|$splitDir.moved", "unlink|$link", "junction|$link|$otherDir")
                $swap.Unpacked = $splitDir
            } }
        if ($turned.Untrusted) {
            # Nothing was unpacked, merged or held, in the folder the junction led to or where it can be
            # turned, and the turn was never tried, since no APK got as far as being checked.
            Assert-True ($null -eq $turned.Path -and $null -eq $swap.Said['turn'] -and (Test-NothingHandedOn (Join-Path $realDir 'out.apk')) -and
                @(Get-ChildItem -LiteralPath $realDir -Force).Count -eq 0 -and
                (@(Get-ChildItem -LiteralPath $otherDir -Force | ForEach-Object { $_.Name } | Sort-Object) -join ' ') -ceq 'other-folder.txt out.apk' -and
                (Get-TestSha256 (Join-Path $otherDir 'out.apk')) -ceq $forgedDigest -and (Get-HeldMerges).Count -eq $heldAtFour) `
                "A merge asked for through a junction Windows won't follow left something behind, or got as far as the turn: $($turned.Refused)"
            Write-Host "[resource-table] Windows here won't follow a junction an ordinary user made, so a junction turned during a merge went unchecked"
        } else {
            Assert-True (($swap.Said['turn'] -join "`n") -ceq (@("move|$realDir|$denied", "move|$($swap.Unpacked)|$denied", "unlink|$link|done",
                    "junction|$link|done") -join "`n")) "The folders a merge is made in were not kept where they are, or the junction was not turned:`n$($swap.Said['turn'] -join "`n")"
            Assert-True (Test-Path -LiteralPath (Join-Path $link 'other-folder.txt') -PathType Leaf) `
                'The junction does not lead to the other folder, so the case shows nothing.'
            Assert-True ($null -eq $turned.Refused -and $turned.Path -eq (Join-Path $realDir 'out.apk')) `
                "A merge asked for through a junction was not handed back by the real path of the folder it was made in: $($turned.Path) $($turned.Refused)"
            Assert-True ((Get-HeldMerges)[$turned.Path].Sha256 -ceq $cleanDigest -and (Get-TestSha256 $turned.Path) -ceq $cleanDigest -and
                (Test-Path -LiteralPath "$($turned.Path).authentic.json") -and
                (@(Get-ChildItem -LiteralPath $otherDir -Force | ForEach-Object { $_.Name } | Sort-Object) -join ' ') -ceq 'other-folder.txt out.apk' -and
                (Get-TestSha256 (Join-Path $otherDir 'out.apk')) -ceq $forgedDigest) `
                'A junction turned while the merge was made moved what was merged, or where it was written.'
            Assert-True ((Invoke-Intruder @("move|$realDir|$realDir.moved")) -ceq "move|$realDir|$denied") `
                'The folder of a merge that is still held could be renamed, and another put in its place.'
            Close-MergedApk -Merged $turned.Path
            Assert-True ((Invoke-Intruder @("move|$realDir|$realDir.moved")) -ceq "move|$realDir|done") `
                'A folder with nothing held in it could not be renamed either, so the refusals above were not the hold.'
        }
    } finally {
        if (Test-Path -LiteralPath $link) { [System.IO.Directory]::Delete($link, $false) }
    }

    # (6) While the merge is held, which is from the moment it is taken until Close-MergedApk:
    # through the patch run and every check that reads it. A second process can read it, as the
    # tools do, and can't write into it, add to it, map it to write, delete it, rename it or put
    # another file in its place. The record beside it is nobody's evidence, so writing over that
    # changes nothing. Once the merge is let go the same write goes through, so it was the hold.
    $kept = $inserted.Path
    $swap.Said['kept'] = Invoke-Intruder ((Get-Attempts $kept) + @("copy|$kept.authentic.json|$probe"))
    Assert-Attempts @($swap.Said['kept'] | Select-Object -First 7) $kept 'done' $sharing 'A merge that is held was not kept from a second process'
    Assert-True ($swap.Said['kept'][7] -ceq "copy|$kept.authentic.json|done") "The record beside the merge could not be written over, so nothing was tried: $($swap.Said['kept'][7])"
    $whole = Invoke-Check -Stock $kept -Patched $kept -Name 'kept-merged-whole'
    Assert-True ($whole.ExitCode -eq 0) "The resource check could not read a merge that is held.`n$($whole.Output)"
    $heldBaseA = Open-HeldFile -Path $baseA -What 'The base APK'
    try {
        $opened = Assert-AuthenticMerge -Merged $kept -Base $heldBaseA -Apk $signedApkm -Scratch $rebuiltIn -Java $noJava -DesktopJar $DesktopJar `
            -Aapt2 $Aapt2 -PackageName 'com.tumblr' -Signers $pinned
    } finally { $heldBaseA.Dispose() }
    Assert-True ($null -eq $opened -and (Get-StreamSha256 -Stream (Get-HeldMerges)[$kept].Handle) -ceq $cleanDigest -and (Get-TestSha256 $kept) -ceq $cleanDigest) `
        'A merge that is held changed, or stopped being the merge this process made, when the record beside it was written over.'
    Close-MergedApk -Merged $kept
    Assert-True ((Invoke-Intruder @("write|$kept")) -ceq "write|$kept|done" -and (Get-TestSha256 $kept) -cne $cleanDigest) `
        'A merge that was let go could not be written to either, so the refusals above were not the hold.'

    # What a run keeps (Save-AppliedRecord) is what it held. A handle that reads but lets a second
    # process write the file meanwhile is refused, and nothing is kept. Handles held as
    # Open-HeldFile holds them are kept, with the digests of the bytes they read.
    $saveDir = Join-Path $swapDir 'save'
    New-Item -ItemType Directory -Force -Path $saveDir | Out-Null
    $savedApk = Join-Path $saveDir 'patched.bin'
    $savedResult = Join-Path $saveDir 'result.json'
    [System.IO.File]::WriteAllText($savedApk, 'patched')
    [System.IO.File]::WriteAllText($savedResult, '{}')
    $saveIdentity = [pscustomobject]@{ Key = ('a' * 64); Inputs = [ordered]@{ case = 'save' } }
    $saveStore = Join-Path $saveDir 'store'
    $heldSavedResult = Open-HeldFile -Path $savedResult -What 'The result report'
    try {
        $loose = [System.IO.File]::Open($savedApk, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
        $refused = $null
        try {
            $swap.Said['loose'] = Invoke-Intruder @("write|$savedApk")
            Save-AppliedRecord -Store $saveStore -Identity $saveIdentity -PatchedApk $loose -Result $heldSavedResult | Out-Null
        } catch { $refused = $_.Exception.Message } finally { $loose.Dispose() }
        Assert-True ($swap.Said['loose'] -ceq "write|$savedApk|done" -and
            $refused -clike 'Nothing to keep: *patched.bin is open in a way that lets another program write to it.' -and
            -not (Test-Path -LiteralPath (Join-Path $saveStore $saveIdentity.Key))) `
            "A patched APK read through a handle that let a second process write to it was kept: $refused $($swap.Said['loose'])"
        # The same loose handle, sharing deletes too, with its file renamed away and another file at
        # the name it was opened by, held as Open-HeldFile holds it. A probe of that name would find
        # no writer gets in, and the handle's own file is still open to one.
        $movedApk = Join-Path $saveDir 'moved.bin'
        $loose = [System.IO.File]::Open($savedApk, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read,
            [System.IO.FileShare]::ReadWrite -bor [System.IO.FileShare]::Delete)
        $decoy = $null
        $refused = $null
        try {
            [System.IO.File]::Move($savedApk, $movedApk)
            [System.IO.File]::WriteAllText($savedApk, 'decoy')
            $decoy = Open-HeldFile -Path $savedApk -What 'The decoy'
            Save-AppliedRecord -Store $saveStore -Identity $saveIdentity -PatchedApk $loose -Result $heldSavedResult | Out-Null
        } catch { $refused = $_.Exception.Message } finally {
            $loose.Dispose()
            if ($null -ne $decoy) { $decoy.Dispose() }
            [System.IO.File]::Delete($savedApk)
            [System.IO.File]::Move($movedApk, $savedApk)
        }
        Assert-True ($refused -clike 'Nothing to keep: *patched.bin is open in a way that lets another program write to it.' -and
            -not (Test-Path -LiteralPath (Join-Path $saveStore $saveIdentity.Key))) `
            "A patched APK read through a loose handle was kept once its file moved and a held one took its name: $refused"
        # A loose handle opened after a writer that shares reading alone: that writer keeps a probe
        # for writing out as well as a held handle would, and can still write.
        $writer = [System.IO.File]::Open($savedApk, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Write, [System.IO.FileShare]::Read)
        $refused = $null
        try {
            $loose = [System.IO.File]::Open($savedApk, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
            try { Save-AppliedRecord -Store $saveStore -Identity $saveIdentity -PatchedApk $loose -Result $heldSavedResult | Out-Null }
            catch { $refused = $_.Exception.Message } finally { $loose.Dispose() }
        } finally { $writer.Dispose() }
        Assert-True ($refused -clike "Nothing to keep: *patched.bin is open for writing somewhere else too, so its bytes could change while they're copied." -and
            -not (Test-Path -LiteralPath (Join-Path $saveStore $saveIdentity.Key))) `
            "A patched APK read through a loose handle was kept while a writer that shares reading alone had it open: $refused"
        # A loose handle on a read-only file: the attribute turns a writer away as a held handle
        # would, and whoever owns the file can take it off.
        [System.IO.File]::SetAttributes($savedApk, [System.IO.FileAttributes]::ReadOnly)
        $refused = $null
        try {
            $loose = [System.IO.File]::Open($savedApk, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
            try { Save-AppliedRecord -Store $saveStore -Identity $saveIdentity -PatchedApk $loose -Result $heldSavedResult | Out-Null }
            catch { $refused = $_.Exception.Message } finally { $loose.Dispose() }
        } finally { [System.IO.File]::SetAttributes($savedApk, [System.IO.FileAttributes]::Normal) }
        Assert-True ($refused -clike "Nothing to keep: whether *patched.bin is open in a way that lets another program write to it can't be told, since opening it to write met Windows error 5 rather than its sharing." -and
            -not (Test-Path -LiteralPath (Join-Path $saveStore $saveIdentity.Key))) `
            "A patched APK read through a loose handle was kept because its file was read-only: $refused"
        $heldSavedApk = Open-HeldFile -Path $savedApk -What 'The patched APK'
        try { Save-AppliedRecord -Store $saveStore -Identity $saveIdentity -PatchedApk $heldSavedApk -Result $heldSavedResult | Out-Null }
        finally { $heldSavedApk.Dispose() }
    } finally { $heldSavedResult.Dispose() }
    $savedRecord = Get-Content -LiteralPath (Join-Path $saveStore "$($saveIdentity.Key)/record.json") -Raw | ConvertFrom-Json
    Assert-True ($savedRecord.patchedSha256 -ceq (Get-TestSha256 $savedApk) -and $savedRecord.resultSha256 -ceq (Get-TestSha256 $savedResult)) `
        "A run held as the scripts hold it was not kept with the digests of what it held: $($savedRecord | ConvertTo-Json -Compress)"

    Close-MergedApk -Merged $pre.Path
    Assert-True ((Get-HeldMerges).Count -eq $heldBefore -and @($intruders | Where-Object { -not $_.HasExited }).Count -eq 0) `
        'A swap case left a merge held or a second process running.'
    $global:HushTumblrHeldJava = $null

    # What a device with 16 KB pages needs of a patched APK (Assert-PageAlignment), with the
    # build-tools' own zipalign and apksigner on archives the JDK's jar packs uncompressed. A
    # library here is an ELF header and its program headers, which is all the check reads: one LOAD
    # segment, and a GNU_RELRO from 0x4000 up to -RelroEnd when one is asked for.
    $pageDir = Join-Path $caseRoot 'pages'
    function New-TestLibrary([long]$LoadAlign = 0x4000, [long]$RelroEnd = 0) {
        $bytes = New-Object byte[] 176
        ([byte[]]@(0x7F, 0x45, 0x4C, 0x46, 2, 1, 1)).CopyTo($bytes, 0)
        [System.BitConverter]::GetBytes([uint64]64).CopyTo($bytes, 0x20)
        [System.BitConverter]::GetBytes([uint16]56).CopyTo($bytes, 0x36)
        [System.BitConverter]::GetBytes([uint16]$(if ($RelroEnd) { 2 } else { 1 })).CopyTo($bytes, 0x38)
        [System.BitConverter]::GetBytes([uint32]1).CopyTo($bytes, 64)
        [System.BitConverter]::GetBytes([uint64]$LoadAlign).CopyTo($bytes, 64 + 48)
        if ($RelroEnd) {
            [System.BitConverter]::GetBytes([uint32]0x6474e552).CopyTo($bytes, 120)
            [System.BitConverter]::GetBytes([uint64]0x4000).CopyTo($bytes, 120 + 16)
            [System.BitConverter]::GetBytes([uint64]($RelroEnd - 0x4000)).CopyTo($bytes, 120 + 40)
        }
        return , $bytes
    }
    # The libraries and the stock APK's manifest, which apksigner reads the API floor from. Packed
    # as they come, or aligned and then signed, the order a build has to keep.
    function New-NativeApk([string]$Name, [System.Collections.IDictionary]$Libraries, [switch]$AsPacked) {
        $tree = Join-Path $pageDir $Name
        foreach ($library in $Libraries.GetEnumerator()) {
            $path = Join-Path $tree ("lib/$($library.Key)" -replace '/', [System.IO.Path]::DirectorySeparatorChar)
            New-Item -ItemType Directory -Force -Path (Split-Path -Parent $path) | Out-Null
            [System.IO.File]::WriteAllBytes($path, $library.Value)
        }
        $archive = [System.IO.Compression.ZipFile]::OpenRead($stockApk)
        try { [System.IO.Compression.ZipFileExtensions]::ExtractToFile($archive.GetEntry('AndroidManifest.xml'), (Join-Path $tree 'AndroidManifest.xml')) }
        finally { $archive.Dispose() }
        $packed = Join-Path $pageDir "$Name-packed.apk"
        Invoke-Checked -Program $jar -Arguments @('--create', '--no-compress', '--no-manifest', '--file', $packed, '-C', $tree, '.') `
            -Description "jar for $Name"
        if ($AsPacked) { return $packed }
        $aligned = Join-Path $pageDir "$Name-aligned.apk"
        Invoke-Checked -Program $zipalign -Arguments @('-f', '-P', '16', '4', $packed, $aligned) -Description "zipalign for $Name"
        $out = Join-Path $pageDir "$Name.apk"
        Invoke-Checked -Program $apksigner -Arguments @('sign', '--ks', (Join-Path $keys 'a.p12'), '--ks-pass', 'pass:hushtest',
            '--key-pass', 'pass:hushtest', '--ks-key-alias', 'test', '--out', $out, $aligned) -Description "apksigner sign $Name"
        return $out
    }
    function Invoke-PageCheck([string]$Apk, [string]$Stock) {
        try { return [pscustomobject]@{ Limits = @(Assert-PageAlignment -Apk $Apk -Stock $Stock -Aapt2 $Aapt2); Refused = $null } }
        catch { return [pscustomobject]@{ Limits = @(); Refused = $_.Exception.Message } }
    }
    # Tumblr's own, as far as these cases go: a library with a GNU_RELRO that ends on a 16 KB
    # boundary, one with none, a 32-bit one with 4 KB segments and a dex named .so. The last two
    # aren't read.
    $thirtyTwo = New-TestLibrary -LoadAlign 0x1000
    $thirtyTwo[4] = 1
    $clean = @{ 'arm64-v8a/libgood.so' = (New-TestLibrary -RelroEnd 0x8000); 'arm64-v8a/libplain.so' = (New-TestLibrary)
        'armeabi-v7a/libold.so' = $thirtyTwo; 'arm64-v8a/libcode.dex.so' = [System.Text.Encoding]::ASCII.GetBytes("dex`n035") }
    $cleanStock = New-NativeApk -Name 'clean-stock' -Libraries $clean -AsPacked
    $accepted = New-NativeApk -Name 'accepted' -Libraries $clean
    $said = Invoke-PageCheck -Apk $accepted -Stock $cleanStock
    Assert-True ($null -eq $said.Refused -and $said.Limits.Count -eq 0 -and (Get-ApkSigners -Apk $accepted -Apksigner $apksigner).Verified) `
        "An APK aligned before it was signed, with Tumblr's libraries as they were, was not accepted: $($said.Refused) $($said.Limits -join ' ')"
    # The same files as jar packed them: every library sits wherever the entry before it ended.
    $said = Invoke-PageCheck -Apk $cleanStock -Stock $cleanStock
    Assert-True ($said.Refused -like "*zipalign -c -P 16 -v 4 didn't pass clean-stock-packed.apk (exit 1)*lib/arm64-v8a/lib*.so (BAD*") `
        "An APK whose libraries aren't on 16 KB boundaries in the ZIP was not refused for that: $($said.Refused)"
    # A library Tumblr didn't ship, in an aligned ZIP: one LOAD segment aligned to 4 KB, one whose
    # GNU_RELRO ends 4 KB into a 16 KB page, and one that counts more program headers than it holds.
    $cutShort = New-TestLibrary
    $cutShort[0x38] = 9
    foreach ($added in @(
            @{ Name = 'small-load'; Library = (New-TestLibrary -LoadAlign 0x1000); Says = 'LOAD segment 0 is aligned to 0x1000, under 0x4000' },
            @{ Name = 'short-relro'; Library = (New-TestLibrary -RelroEnd 0x5000)
                Says = "GNU_RELRO segment 1 (VirtAddr 0x4000, MemSiz 0x1000) doesn't end on a 16 KB boundary" },
            @{ Name = 'cut-short'; Library = $cutShort; Says = 'its program headers run past the end of the file' })) {
        $said = Invoke-PageCheck -Apk (New-NativeApk -Name $added.Name -Libraries ($clean + @{ 'arm64-v8a/libadded.so' = $added.Library })) -Stock $cleanStock
        Assert-True ($said.Refused -like ("*lib/arm64-v8a/libadded.so in $($added.Name).apk, which Tumblr didn't ship, can't be mapped on a " +
                "device with 16 KB pages: $($added.Says).*")) "$($added.Name).apk was not refused for its library alone: $($said.Refused)"
    }
    # The same two faults in libraries the stock APK holds too are Tumblr's to fix. The APK is
    # taken, signature and all, and each one is named for the caller to report. Putting one right
    # by rewriting it is refused: it isn't Tumblr's library any more.
    $limited = $clean + @{ 'arm64-v8a/libinherited.so' = (New-TestLibrary -RelroEnd 0x6000)
        'x86_64/libinherited.so' = (New-TestLibrary -LoadAlign 0x1000) }
    $limitedStock = New-NativeApk -Name 'limited-stock' -Libraries $limited -AsPacked
    $limitedApk = New-NativeApk -Name 'limited' -Libraries $limited
    $said = Invoke-PageCheck -Apk $limitedApk -Stock $limitedStock
    $expectedLimits = @(
        "16 KB target limitation: lib/arm64-v8a/libinherited.so is Tumblr's own library, left as it is, and GNU_RELRO segment 1 (VirtAddr 0x4000, MemSiz 0x2000) doesn't end on a 16 KB boundary.",
        "16 KB target limitation: lib/x86_64/libinherited.so is Tumblr's own library, left as it is, and LOAD segment 0 is aligned to 0x1000, under 0x4000.")
    Assert-True ($null -eq $said.Refused -and (@($said.Limits | Sort-Object) -join "`n") -ceq ($expectedLimits -join "`n") -and
        (Get-ApkSigners -Apk $limitedApk -Apksigner $apksigner).Verified) `
        "Tumblr's own libraries that don't fit 16 KB pages were not reported as the target's limit on a signed APK: $($said.Refused) $($said.Limits -join ' ')"
    $rewritten = $limited.Clone()
    $rewritten['arm64-v8a/libinherited.so'] = New-TestLibrary -RelroEnd 0xC000
    $said = Invoke-PageCheck -Apk (New-NativeApk -Name 'rewritten' -Libraries $rewritten) -Stock $limitedStock
    Assert-True ($said.Refused -like "*lib/arm64-v8a/libinherited.so in rewritten.apk isn't the library Tumblr shipped*") `
        "An APK with one of Tumblr's libraries rewritten to fit was not refused: $($said.Refused) $($said.Limits -join ' ')"
} finally {
    $env:BUILD_QUEUE_SCRIPT = $savedQueueScript
    # Whatever is still held, a failed case's included: a held file can't be deleted.
    foreach ($heldMerge in @((Get-HeldMerges).Keys)) { Close-MergedApk -Merged $heldMerge }
    foreach ($second in $intruders) { if (-not $second.HasExited) { $second.Kill(); $second.WaitForExit() } }
    $global:HushTumblrHeldJava = $null
    if ($caseRootAsked.StartsWith($requiredPrefix, [System.StringComparison]::OrdinalIgnoreCase) -and `
        (Test-Path -LiteralPath $caseRootAsked)) {
        Remove-Item -LiteralPath $caseRootAsked -Recurse -Force
    }
}

$global:LASTEXITCODE = 0
Write-Host '[scripts] resource table check contracts passed'
