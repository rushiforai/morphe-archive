<#
.SYNOPSIS
    Rank where a method went when Pinterest's next build renames it, from structural evidence.

.DESCRIPTION
    A patch finds its method by kept names, log literals and shapes. When a new Pinterest build moves
    one of those anchors, the patch fails at patch time, and somebody has to find where the method
    went. This runs scripts/FingerprintCandidates.java to do the looking.

    It captures the method's signature from the build the patch works on: its strings, its literals
    with the version bytes Pinterest changes masked, the references it makes with the obfuscated names
    taken out, an opcode sketch, its prototype, its class and its callers. Then it ranks every method
    of the new build against that and writes a report with the evidence for each candidate. The
    signature's format is scripts/fingerprint-signature.schema.json, so one captured today still
    ranks next month's build after the old APK is gone.

    It reports and nothing else. It never edits a patch and never accepts a candidate. When one
    candidate stands out it still says to check it by hand. When none does, the run fails closed
    (exit 1) and suggests none, and the report lists the closest for review.

    -Calibrate holds the ranking to a list of real transitions the patches resolve on two builds,
    each of which has to rank its known replacement in the top five, and -OldApk and -NewApk name
    the two builds it describes. The list is scripts/fingerprint-calibration.txt unless
    -CalibrationPath names another. HushPinterest has no bundled list yet: it needs a second Pinterest
    build and the transitions confirmed on it, so until then -Calibrate takes -CalibrationPath.

    An APK argument is a path to an .apk, .apkm or .xapk, or a version that names exactly one fixture
    in the folder HUSHPINTEREST_FIXTURE_DIR names, such as 14.38.0 or 14.38.0-14388010.

.EXAMPLE
    scripts/fingerprint-candidates.ps1 -OldApk 14.37.0 -Method '<descriptor>' -NewApk 14.38.0

.EXAMPLE
    scripts/fingerprint-candidates.ps1 -OldApk 14.38.0 -Method '<descriptor>' -SignaturePath feed-merge.json

    Captures the signature only, for a build that isn't out yet.

.EXAMPLE
    scripts/fingerprint-candidates.ps1 -Signature feed-merge.json -NewApk C:\bundles\pinterest-14.39.0.xapk

.EXAMPLE
    scripts/fingerprint-candidates.ps1 -Calibrate -CalibrationPath 14.38.0-to-14.39.0.txt -OldApk 14.38.0 -NewApk 14.39.0

    Checks the ranking against transitions confirmed on a later pair of builds.
#>
[CmdletBinding()]
param(
    [string]$Method,
    [string]$OldApk,
    [string]$NewApk,
    [string]$Signature,
    [string]$SignaturePath,
    [switch]$Calibrate,
    [string]$CalibrationPath,
    [ValidateRange(1, 50)][int]$Top = 5,
    [string]$ReportPath,
    [string]$Java,
    [string]$DesktopJar,
    [string]$Root
)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')

function Resolve-FullPath {
    param([string]$Path)
    return $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)
}

# A path the tool may write: never under the patch sources, which this only reads about.
function Assert-OutsidePatches {
    param([string]$Path, [string]$What)
    $full = [System.IO.Path]::GetFullPath((Resolve-FullPath $Path))
    $patches = [System.IO.Path]::GetFullPath((Join-Path $Root 'patches')).TrimEnd('\', '/') + [System.IO.Path]::DirectorySeparatorChar
    if ($full.StartsWith($patches, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to write the $What to $full, inside patches/: this tool never edits a patch."
    }
    return $full
}

# An .apk, .apkm or .xapk path, or a version naming exactly one fixture.
function Resolve-Build {
    param([string]$Value, [string]$What)
    if (Test-Path -LiteralPath $Value -PathType Leaf) { return (Resolve-FullPath $Value) }
    $fixtures = if ($env:HUSHPINTEREST_FIXTURE_DIR) { $env:HUSHPINTEREST_FIXTURE_DIR } else { Join-Path $Root 'fixtures' }
    $matching = @(Get-ChildItem -LiteralPath $fixtures -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Extension -in '.apk', '.apkm', '.xapk' -and $_.Name.Contains($Value) })
    # A version can have both the universal APK and a distributor's split bundle in the folder. The
    # plain APK stands for it; the bundle is still reachable by its path or its full file name.
    $plain = @($matching | Where-Object { $_.Extension -eq '.apk' })
    if ($matching.Count -gt 1 -and $plain.Count -eq 1) { $matching = $plain }
    if ($matching.Count -ne 1) {
        throw ("The $What '$Value' is not a file, and it names $($matching.Count) fixtures in $fixtures, not one. " +
            'Pass a path to an .apk, .apkm or .xapk, or set HUSHPINTEREST_FIXTURE_DIR.')
    }
    return $matching[0].FullName
}

# The tool, with Continue only in here: Windows PowerShell 5.1 turns a program's stderr into a
# terminating error under Stop. A java that can't start still throws out of here into the script's
# Stop, and the exit code starts at -1 so a run that never started can't read as a pass. The 8 GB
# run waits for a slot in the machine's build queue first.
function Invoke-Candidates {
    param([string[]]$Arguments)
    $ErrorActionPreference = 'Continue'
    $queued = Enter-HushPinterestQueue -Job 'fingerprint candidates'
    try {
        $global:LASTEXITCODE = -1
        & $script:JavaPath '-Xmx8g' '-cp' $script:DesktopJarPath (Join-Path $PSScriptRoot 'FingerprintCandidates.java') @Arguments 2>&1 |
            ForEach-Object { Write-Host "$_" }
        $exitCode = $LASTEXITCODE
    } finally {
        Exit-HushPinterestQueue $queued
    }
    return $exitCode
}

# -Method picks the capture mode. -OldApk names the build of the method there, and with -Calibrate
# the old build the calibration list describes, so it counts toward neither.
if ($OldApk -and -not ($Method -or $Calibrate)) { throw '-OldApk goes with -Method, or with -Calibrate.' }
$modes = @($Calibrate.IsPresent, [bool]$Signature, [bool]$Method) | Where-Object { $_ }
if (@($modes).Count -ne 1) {
    throw 'Pass -Calibrate, or -Signature with -NewApk, or -OldApk and -Method (with -NewApk, -SignaturePath or both).'
}
if ($Method -and -not $OldApk) { throw '-OldApk and -Method go together.' }
if ($Signature -and -not $NewApk) { throw '-Signature needs -NewApk to rank against.' }
if ($Method -and -not $NewApk -and -not $SignaturePath) { throw 'Pass -NewApk to rank, -SignaturePath to keep the signature, or both.' }
if ($Calibrate -and -not ($OldApk -and $NewApk)) { throw '-Calibrate needs -OldApk and -NewApk, the two builds its list describes.' }
if ($Calibrate -and -not $CalibrationPath) {
    $CalibrationPath = Join-Path $PSScriptRoot 'fingerprint-calibration.txt'
    if (-not (Test-Path -LiteralPath $CalibrationPath -PathType Leaf)) {
        throw ('There is no bundled calibration list yet: scripts/fingerprint-calibration.txt needs transitions ' +
            'confirmed on two Pinterest builds. Pass -CalibrationPath with a list of your own.')
    }
}

$script:JavaPath = Resolve-Java -Explicit $Java
$script:DesktopJarPath = Resolve-DesktopCli -Explicit $DesktopJar -Root $Root -Required
if (-not $ReportPath) {
    $stamp = (Get-Date).ToString('yyyyMMdd-HHmmss')
    $ReportPath = Join-Path ([System.IO.Path]::GetTempPath()) "hushpinterest-fingerprint-$stamp.txt"
}
$ReportPath = Assert-OutsidePatches $ReportPath 'report'
if ($SignaturePath) { $SignaturePath = Assert-OutsidePatches $SignaturePath 'signature' }

$work = Join-Path ([System.IO.Path]::GetTempPath()) ("hushpinterest-fingerprint-" + [guid]::NewGuid().ToString('N').Substring(0, 8))
New-Item -ItemType Directory -Force -Path $work | Out-Null
$exitCode = 2
try {
    if ($Calibrate) {
        $old = Get-BaseApk -Apk (Resolve-Build $OldApk 'old build') -Destination (Join-Path $work 'old-base.apk')
        $new = Get-BaseApk -Apk (Resolve-Build $NewApk 'new build') -Destination (Join-Path $work 'new-base.apk')
        $exitCode = Invoke-Candidates @('calibrate', (Resolve-FullPath $CalibrationPath), $old, $new, $ReportPath, '--top', "$Top")
    } else {
        $captured = 0
        if (-not $Signature) {
            $old = Get-BaseApk -Apk (Resolve-Build $OldApk 'old build') -Destination (Join-Path $work 'old-base.apk')
            $Signature = if ($SignaturePath) { $SignaturePath } else { Join-Path $work 'signature.json' }
            $captured = Invoke-Candidates @('capture', $old, $Method, $Signature)
            $exitCode = $captured
        }
        # A signature that wasn't captured has nothing to rank, and the capture's failure stands.
        if ($captured -eq 0 -and $NewApk) {
            $new = Get-BaseApk -Apk (Resolve-Build $NewApk 'new build') -Destination (Join-Path $work 'new-base.apk')
            $exitCode = Invoke-Candidates @('rank', (Resolve-FullPath $Signature), $new, $ReportPath, '--top', "$Top")
        }
    }
} finally {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}
exit $exitCode
