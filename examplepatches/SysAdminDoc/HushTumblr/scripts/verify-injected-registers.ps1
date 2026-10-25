<#
.SYNOPSIS
    Check what the bundle injected into Tumblr against the shapes that fail on a device.

.DESCRIPTION
    A patch that writes into a register beyond the method's register count, branches into the
    middle of an instruction, passes an invoke the wrong registers or reads a parameter as the
    wrong kind assembles without complaint and applies without complaint. The desktop CLI reports
    it as applied. It fails only when a device verifies the class, and then it fails as a
    VerifyError on whatever screen happens to reach it first.

    Two checks, either of which catches that:

    Static. scripts/DexDiff.java lists every method the patched APK does not share with the
    clean build it came from, and holds each line that was not in the clean body, and every
    line of every added method (the extension's and the helpers patches add to the app's own
    classes), to that method's register count. Every changed and added method is also checked
    for a register past its count, the upper half of a wide value included, for branch and
    switch targets, invoke registers, the static and wide parameter layout, move-result
    placement and try ranges, and the whole APK is held to
    scripts/injected-mutation-contracts.txt: none of the ShortcutManager calls the settings patch
    sends to SettingsEntry may be left anywhere outside the extension.

    On a device. The Android runtime's own verifier is the authority, so with -Serial the
    clean APK and the patched APK are both put through dex2oat with the verify filter and the
    verifier's messages are compared. The patched build has to raise exactly the same message
    multiset as the clean build, which for the Facebook sibling's builds was none. The verifier
    uses the instruction set reported by the leased device, including x86_64 emulators.

    Removed host methods and DEX entries fail the static check. The allowlist beside this script
    accepts only exact reviewed removals, and a stale entry fails so an old exception cannot mask
    a later regression.

    Both halves refuse to pass on absent evidence. A dex comparison that found no difference at
    all compared the wrong things, and a device run only counts once dex2oat has read a file of
    the size that was pushed (it exits 0 on a missing one). The clean side has to be Tumblr's own
    build of the same version as the patched one: a patched APK on the clean side would compare
    two bundles instead of the bundle against Tumblr.

    The package is the one patches-list.json declares (Get-PatchTarget): the installed app -FromDevice
    pulls, the patched APK's package and the signer the clean APK has to carry all come from it.

    The static half compares the whole clean bundle, merged the way the CLI merges it before it
    patches (Get-MergedApk), because the patched APK carries what the splits brought as well as
    base.apk's code: the Facebook sibling's 580 in-app browser shipped its own dex in
    split_heliumcore.apk, and against base.apk its methods read as some 12,000 added and 212
    changed. The merge carries no signature, so Tumblr's signer is checked on base.apk, and on
    every split before the merge is made (Get-MergedApk), and a merge handed over with
    -CleanMerged has to be one this process made and still holds, or the bytes -CleanApk merges to
    here, and its base this base.apk (Assert-AuthenticMerge).
    DexDiff holds the merge to base.apk's classes*.dex byte for byte (handed base.apk as its last
    argument), and it fails a clean side that holds any of the bundle's own code. The device half
    runs base.apk, the same app code.

    Every changed or added method and class shape is also held to what accounts for it: a mutation
    contract that validated it, the bundle's extension classes (-Bundle, held while DexDiff reads
    it, and by default the bundle the repo builds now, so an APK patched with another one needs its
    .mpp passed), or a line of scripts/dex-delta-allowlist.txt under a selected patch, which names the
    SHA-256 of what that patch writes there. A Tumblr method edited in the CLI's working copy, or an
    extension class swapped in, fails even when its code is well formed.

.EXAMPLE
    scripts/verify-injected-registers.ps1 -PatchedApk C:\work\patched.apk

    The clean side is the fixture of the same version in the folder HUSHTUMBLR_FIXTURE_DIR
    names: an .apk, or the .xapk or .apkm bundle Tumblr ships as. A bundle is merged here unless
    -CleanMerged hands over its merge (verify-all-patches.ps1 has made one to patch).

.EXAMPLE
    scripts/verify-injected-registers.ps1 -FromDevice -Serial $env:HUSHTUMBLR_DEVICE_SERIAL
#>
[CmdletBinding()]
param(
    [string]$CleanApk,
    [string]$CleanMerged,
    [string]$PatchedApk,
    [switch]$FromDevice,
    [string]$Serial,
    [string]$LeaseToken = $env:HUSHTUMBLR_DEVICE_LEASE_TOKEN,
    [string]$LeaseDirectory = $env:HUSHTUMBLR_DEVICE_LEASE_DIR,
    [string]$ChatIdentity = $env:HUSHTUMBLR_CHAT_ID,
    [string]$Adb,
    [string]$ReportPath,
    [string]$Java,
    [string]$DesktopJar,
    [string]$Aapt2,
    [string[]]$SelectedPatchNames,
    [string]$AndroidJar,
    [string]$ApiVersions,
    [string]$Bundle,
    [string]$DeviceEvidencePath,
    [string]$EvidenceRunId,
    [string]$ExpectedSourceSha256,
    [string]$ExpectedPatchedSha256
)

$ErrorActionPreference = 'Stop'
if ($DeviceEvidencePath) {
    if (-not $Serial -or $EvidenceRunId -cnotmatch '^[0-9a-f]{32}$' -or
        $ExpectedSourceSha256 -cnotmatch '^[0-9a-f]{64}$' -or $ExpectedPatchedSha256 -cnotmatch '^[0-9a-f]{64}$') {
        throw 'Device evidence requires a serial, walk run ID and both expected input digests.'
    }
    $DeviceEvidencePath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($DeviceEvidencePath)
    if (Test-Path -LiteralPath $DeviceEvidencePath) { throw 'Device evidence already exists. A new walk cannot reuse it.' }
}
$root = Split-Path -Parent $PSScriptRoot
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
. (Join-Path $PSScriptRoot 'injected-register-contracts.ps1')
. (Join-Path $PSScriptRoot 'injected-register-device.ps1')
$Java = Resolve-Java -Explicit $Java
# dexlib2 comes from the desktop CLI. Without it the comparison cannot run at all, and saying so
# beats a stack trace about a missing class.
$DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $root -Required
$Aapt2 = Resolve-Aapt2 -Explicit $Aapt2 -Root $root
# The app every check below is about, and whose signer the clean side carries: the one package the
# catalog declares, as the other scripts read it.
$catalog = Get-Content -LiteralPath (Join-Path $root 'patches-list.json') -Raw | ConvertFrom-Json
$package = (Get-PatchTarget -PatchList $catalog).PackageName

function Resolve-Adb {
    param([string]$Explicit)
    if ($Explicit) { return $Explicit }
    if ($env:HUSHTUMBLR_ADB) { return $env:HUSHTUMBLR_ADB }
    $onPath = Get-Command adb -ErrorAction SilentlyContinue
    if ($onPath) { return $onPath.Source }
    $sdkAdb = Join-Path (Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $Aapt2))) 'platform-tools\adb.exe'
    if (Test-Path -LiteralPath $sdkAdb -PathType Leaf) { return $sdkAdb }
    throw 'No adb found. Pass -Adb or set HUSHTUMBLR_ADB.'
}

# The certificate digests of every signer apksigner reports for an APK, a Source Stamp's aside
# (Get-ApkSigners in common.ps1).
function Get-SignerDigests {
    param([string]$Apk)
    $signed = Get-ApkSigners -Apk $Apk -Apksigner (Resolve-Apksigner -Aapt2 $Aapt2)
    if (-not $signed.Verified) { throw "apksigner could not verify ${Apk}: $($signed.Said)" }
    return @($signed.Signers)
}

# The split bundle a merged universal APK came from, or null: the APK has to fail apksigner, a bundle
# of the same name has to sit beside it, and every classes*.dex of the APK has to be byte-identical to
# the one of the same name in the bundle's base.apk, with neither side holding a dex the other lacks.
function Get-SignedBundleFor {
    param([string]$Apk)
    if ([System.IO.Path]::GetExtension($Apk).ToLowerInvariant() -ne '.apk') { return $null }
    $stem = Join-Path (Split-Path -Parent $Apk) ([System.IO.Path]::GetFileNameWithoutExtension($Apk))
    $bundle = @('.apkm', '.xapk', '.apks' | ForEach-Object { "$stem$_" } |
        Where-Object { Test-Path -LiteralPath $_ -PathType Leaf }) | Select-Object -First 1
    if (-not $bundle) { return $null }
    $apksigner = Join-Path (Split-Path -Parent $Aapt2) 'apksigner.bat'
    $ErrorActionPreference = 'Continue'
    & $apksigner verify $Apk *> $null
    if ($LASTEXITCODE -eq 0) { return $null }
    $ErrorActionPreference = 'Stop'
    $base = Get-BaseApk -Apk $bundle -Destination (Join-Path $work 'signed-form-base.apk')
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $digests = {
        param([string]$Path)
        $zip = [System.IO.Compression.ZipFile]::OpenRead($Path)
        try {
            $map = @{}
            foreach ($entry in @($zip.Entries | Where-Object { $_.FullName -match '^classes\d*\.dex$' })) {
                $stream = $entry.Open()
                $sha = [System.Security.Cryptography.SHA256]::Create()
                try { $map[$entry.FullName] = [BitConverter]::ToString($sha.ComputeHash($stream)) }
                finally { $sha.Dispose(); $stream.Dispose() }
            }
            return $map
        } finally { $zip.Dispose() }
    }
    $merged = & $digests $Apk
    $signed = & $digests $base
    if ($merged.Count -eq 0 -or $merged.Count -ne $signed.Count) { return $null }
    foreach ($name in $merged.Keys) { if ($signed[$name] -ne $merged[$name]) { return $null } }
    return $bundle
}

# DexDiff over the pair, with Continue only in here, as in Get-SignerDigests. Called inside the try
# below, a java that can't start throws out of here into the script's Stop. Called outside one, it
# wouldn't, and this would read the exit code apksigner left, so the code starts at -1. Each of the
# two 8 GB checks waits for a slot in the machine's build queue first, and gives it back in the
# finally, a java that never started included.
function Invoke-DexDiff {
    $ErrorActionPreference = 'Continue'
    $queued = Enter-HushTumblrQueue -Job 'dex diff'
    try {
        $global:LASTEXITCODE = -1
        $output = @(& $Java '-Xmx8g' '-cp' $DesktopJar (Join-Path $PSScriptRoot 'DexDiff.java') `
            $CleanMerged $PatchedApk $ReportPath `
            (Join-Path $PSScriptRoot 'injected-register-removal-allowlist.txt') `
            (Join-Path $PSScriptRoot 'injected-mutation-contracts.txt') $cleanBase $selectionFile `
            $bundlePath (Join-Path $PSScriptRoot 'dex-delta-allowlist.txt') 2>&1 | ForEach-Object { "$_" })
        $exitCode = $LASTEXITCODE
    } finally {
        Exit-HushTumblrQueue $queued
    }
    [pscustomobject]@{ ExitCode = $exitCode; Output = $output }
}

function Invoke-HostReferences {
    $ErrorActionPreference = 'Continue'
    $queued = Enter-HushTumblrQueue -Job 'host references'
    try {
        $global:LASTEXITCODE = -1
        $output = @(& $Java '-Xmx8g' '-cp' $DesktopJar (Join-Path $PSScriptRoot 'HostReferences.java') `
            $CleanMerged $PatchedApk $referenceReport $AndroidJar $ApiVersions "$($patched.minSdk)" `
            (Join-Path $PSScriptRoot 'host-reference-contracts.txt') 2>&1 | ForEach-Object { "$_" })
        $exitCode = $LASTEXITCODE
    } finally {
        Exit-HushTumblrQueue $queued
    }
    [pscustomobject]@{ ExitCode = $exitCode; Output = $output }
}

# By its real path, with a file kept open in it until the finally (Open-HeldDirectory): no junction
# on the way to it can be turned, and no folder above it renamed, while the clean side is read here.
$workHeld = Open-HeldDirectory -Path (Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-regs-" + [guid]::NewGuid().ToString('N').Substring(0, 8)))
$work = $workHeld.Path
# The report stays where the caller can read it after the run: at -ReportPath when one is given,
# and otherwise in the working directory, which is kept whenever the run failed or stopped short,
# because that is when the FAIL line points at the report. The pulled and extracted APKs never
# outlive the run, because a full Tumblr build runs to about eighty megabytes. Worked out before the default
# path is filled in: reading [bool]$ReportPath after that was always true, and read before it, it
# was false exactly when the report lived in the directory the cleanup removed.
$reportInWork = -not $ReportPath
if ($reportInWork) { $ReportPath = Join-Path $work 'injected-registers.txt' }
$failed = $false
$completed = $false
$deviceLease = $null
# What this run holds of the clean side, let go in the finally before anything is deleted.
$cleanSourceHeld = $null
$cleanBaseHeld = $null
$cleanMergedHeld = $null
$madeCleanMerge = $false
$bundleHeld = $null
$walkSourceHeld = $null
$walkPatchedHeld = $null
try {

$selectionFile = '-'
if ($PSBoundParameters.ContainsKey('SelectedPatchNames')) {
    if ($SelectedPatchNames.Count -eq 1) { $SelectedPatchNames = $SelectedPatchNames[0].Split(',') }
    if ($SelectedPatchNames.Count -eq 0 -or $SelectedPatchNames.Count -gt 128 -or
            @($SelectedPatchNames | Where-Object { [string]::IsNullOrWhiteSpace($_) -or $_.Length -gt 256 -or $_ -match '[\r\n]' }).Count -ne 0 -or
            @($SelectedPatchNames | Select-Object -Unique).Count -ne $SelectedPatchNames.Count) {
        throw 'Selected patch names must be a bounded nonempty unique list.'
    }
    $selectionFile = Join-Path $work 'selected-patches.txt'
    [IO.File]::WriteAllLines($selectionFile, $SelectedPatchNames, (New-Object Text.UTF8Encoding($false)))
}

# The bundle the patched APK was patched with: DexDiff holds the classes the patch added to its
# extensions, and what else it changed to dex-delta-allowlist.txt. The scripts that patch hand theirs
# over, held. Run on its own, this checks against the bundle the repo builds now, which only fits
# an APK patched with that build.
if (-not $Bundle) {
    $Bundle = Get-ReleaseBundlePath -Root $root -Version (Get-BundleVersion -Root $root)
    if (-not (Test-Path -LiteralPath $Bundle -PathType Leaf)) {
        throw "No -Bundle was given, and the bundle this repo builds now isn't at $Bundle. Pass -Bundle with the .mpp the APK was patched with."
    }
}
$bundleHeld = Open-HeldFile -Path $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Bundle) -What 'The bundle'
$bundlePath = Get-HeldPath -Stream $bundleHeld

$adbPath = $null
if ($FromDevice -or $Serial) { $adbPath = Resolve-Adb -Explicit $Adb }

if ($FromDevice) {
    if (-not $Serial) { throw '-FromDevice needs -Serial so it cannot pull from somebody else''s phone.' }
    $paths = @(& $adbPath -s $Serial shell pm path $package 2>&1 |
        ForEach-Object { "$_" } | Where-Object { $_ -match '^package:' })
    if ($paths.Count -eq 0) { throw "Tumblr ($package) is not installed on $Serial." }
    if ($paths.Count -ne 1) {
        # A split install has no single APK to compare, and quietly taking the first would
        # compare the base against a whole clean build and call the rest missing.
        throw "The install on $Serial is split across $($paths.Count) APKs; pass -PatchedApk instead."
    }
    $onDevice = ($paths[0] -replace '^package:', '').Trim()
    $PatchedApk = Join-Path $work 'patched-installed.apk'
    Write-Host "[registers] pulling $onDevice"
    & $adbPath -s $Serial pull $onDevice $PatchedApk | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "Could not pull the installed APK from $Serial." }
}

if (-not $PatchedApk -or -not (Test-Path -LiteralPath $PatchedApk -PathType Leaf)) {
    throw 'No patched APK. Pass -PatchedApk, or -FromDevice -Serial <serial>.'
}
if ($DeviceEvidencePath) {
    $walkPatchedHeld = Open-HeldFile -Path $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($PatchedApk) `
        -Sha256 $ExpectedPatchedSha256 -What 'The walked verifier output'
    if (-not [string]::Equals($PatchedApk, (Get-HeldPath $walkPatchedHeld), [StringComparison]::OrdinalIgnoreCase)) {
        throw 'Device evidence requires the canonical held patched APK path.'
    }
}
$patched = Get-ApkManifestFacts -Apk $PatchedApk -Aapt2 $Aapt2
if ($patched.package -ne $package -or [string]::IsNullOrWhiteSpace($patched.versionName)) {
    throw "$PatchedApk is $($patched.package) $($patched.versionName), not a Tumblr build ($package)."
}

if (-not $CleanApk) {
    $fixtures = if ($env:HUSHTUMBLR_FIXTURE_DIR) { $env:HUSHTUMBLR_FIXTURE_DIR } else { Join-Path $root 'fixtures' }
    $matching = @(Get-ChildItem -LiteralPath $fixtures -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Extension -in '.apk', '.apkm', '.xapk' -and $_.Name -like "*$($patched.versionName)*" })
    # The universal APK stands for a version that also has a distributor's split bundle in the folder.
    $plainFixtures = @($matching | Where-Object { $_.Extension -eq '.apk' })
    if ($matching.Count -gt 1 -and $plainFixtures.Count -eq 1) { $matching = $plainFixtures }
    if ($matching.Count -ne 1) {
        throw ("No single fixture for Tumblr $($patched.versionName) in $fixtures (found $($matching.Count)). " +
            'Pass -CleanApk with Tumblr''s build of that version.')
    }
    $CleanApk = $matching[0].FullName
}
if (-not (Test-Path -LiteralPath $CleanApk -PathType Leaf)) { throw "No clean APK at $CleanApk." }
if ($DeviceEvidencePath) {
    $walkSourceHeld = Open-HeldFile -Path $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($CleanApk) `
        -Sha256 $ExpectedSourceSha256 -What 'The walked verifier source'
    if (-not [string]::Equals($CleanApk, (Get-HeldPath $walkSourceHeld), [StringComparison]::OrdinalIgnoreCase)) {
        throw 'Device evidence requires the canonical held source APK path.'
    }
}
# Tumblr ships only the split bundle, so a universal APK kept beside it is a merge whose v2 and v3
# signature blocks no longer verify. Its signed form is the same-named bundle's base.apk, taken only
# when every classes*.dex of the merge is byte-identical to base.apk's. Get-MergedApk below holds the
# rest of the merge to that bundle, the way Fixtures.signedForm holds the Kotlin fixture tests. An APK
# that doesn't verify and isn't such a merge still fails below.
$signedBundle = Get-SignedBundleFor -Apk $CleanApk
$cleanSource = if ($signedBundle) { $signedBundle } else { $CleanApk }
# Resolve the signed container before extracting the single clean baseline. The static and device
# checks must keep this same base APK for the rest of the run.
# Get-BaseApk hands a signed plain APK back as the path it was given, so it is given the path the
# held source's handle is at: no junction is left on the way for another process to point
# elsewhere under the readers below.
$cleanSourceHeld = Open-HeldFile -Path $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($cleanSource) `
    -What 'The clean APK'
$cleanBase = Get-BaseApk -Apk (Get-HeldPath -Stream $cleanSourceHeld) -Destination (Join-Path $work 'clean-base.apk')
# Held from here to the end of the run, before anything is read from it: the manifest, the signer
# check, the dex comparison and the device verifier all read a file no other process can write, and
# Assert-AuthenticMerge below holds those same bytes to the base APK whose signer was checked.
$cleanBaseHeld = Open-HeldFile -Path $cleanBase -What 'The clean base APK'
$cleanSourceHeld.Dispose()
$cleanSourceHeld = $null
if ($signedBundle) {
    Write-Host "[registers] $(Split-Path -Leaf $CleanApk) is a merge of $(Split-Path -Leaf $signedBundle); its signer is read from that bundle's base.apk, whose dex it carries unchanged"
}

# The clean side has to be Tumblr's own build of the version that was patched, not a patched build
# or another version: two patched files differ from each other, both halves report differences,
# and the run would pass while comparing nothing against a clean baseline.
$clean = Get-ApkManifestFacts -Apk $cleanBase -Aapt2 $Aapt2
if ($clean.package -ne $patched.package -or $clean.versionName -ne $patched.versionName -or
        $clean.versionCode -ne $patched.versionCode) {
    throw ("The clean APK is $($clean.package) $($clean.versionName) ($($clean.versionCode)) and the " +
        "patched one $($patched.package) $($patched.versionName) ($($patched.versionCode)); they have to be the same build.")
}
$metaSigners = @(Get-DeclaredSigners -PatchList $catalog -PackageName $package)
# Every signer apksigner reports has to be a declared one, as the fixture suite holds each bundle
# (AppCompatibilitiesMatchFixturesTest). One declared signer beside one that isn't used to pass.
$cleanSigners = @(Get-SignerDigests -Apk $cleanBase)
$foreignSigners = @($cleanSigners | Where-Object { $metaSigners -notcontains $_ })
if ($cleanSigners.Count -eq 0 -or $foreignSigners.Count -gt 0) {
    throw "The clean APK at $CleanApk is signed by $($cleanSigners -join ', '), not by Tumblr alone; it is not a vendor build."
}
# The dex comparison's clean side: the whole bundle, merged as the CLI merged it before patching,
# so a split's dex (the Facebook sibling's 580 in-app browser shipped one) is on both sides. DexDiff
# holds it to the signed base.apk's classes*.dex. A plain APK is its own merge. Every APK the merge
# is made from passes the signer check first (Get-MergedApk), which hands the merge back held, so
# nothing can write to it while it is compared. A merge handed over with -CleanMerged has to be one
# this process made and still holds, as the scripts that run this one hand theirs over, or the very
# bytes -CleanApk merges to here (Assert-AuthenticMerge). No file beside it counts as proof.
if (-not $CleanMerged) {
    $CleanMerged = Get-MergedApk -Apk $CleanApk -Destination (Join-Path $work 'clean-merged.apk') -Java $Java -DesktopJar $DesktopJar `
        -Aapt2 $Aapt2 -PackageName $package -Signers $metaSigners
    $madeCleanMerge = $true
}
if (-not (Test-Path -LiteralPath $CleanMerged -PathType Leaf)) { throw "No merged clean APK at $CleanMerged." }
$cleanMergedHeld = Assert-AuthenticMerge -Merged $CleanMerged -Base $cleanBaseHeld -Apk $CleanApk -Scratch $work `
    -Java $Java -DesktopJar $DesktopJar -Aapt2 $Aapt2 -PackageName $package -Signers $metaSigners
# A merge handed over is read from here on by the path its handle is at, whatever the path given
# leads to by then.
if ($cleanMergedHeld) { $CleanMerged = Get-HeldPath -Stream $cleanMergedHeld }

# Found the way an applied record's key finds them (common.ps1), so a kept result and this run
# can't read different stubs.
$hostStubs = Resolve-HostReferenceStubs -AndroidJar $AndroidJar -ApiVersions $ApiVersions -Aapt2 $Aapt2
$AndroidJar = $hostStubs.AndroidJar
$ApiVersions = $hostStubs.ApiVersions
$referenceReport = "$ReportPath.host-references.txt"

Write-Host "[registers] clean   $CleanApk (Tumblr $($clean.versionName), signed by Tumblr)"
Write-Host "[registers] merged  $CleanMerged (the dex comparison's clean side)"
Write-Host "[registers] patched $PatchedApk"

$diff = Invoke-DexDiff
$diff.Output | ForEach-Object { Write-Host "[registers] $_" }

if ($diff.ExitCode -ne 0) {
    Write-Host "[registers] FAIL: the dex comparison exited $($diff.ExitCode); see $ReportPath"
    $failed = $true
} else {
    $references = Invoke-HostReferences
    $references.Output | ForEach-Object { Write-Host "[references] $_" }
    if ($references.ExitCode -ne 0) {
        Write-Host "[references] FAIL: host reference verification exited $($references.ExitCode); see $referenceReport"
        $failed = $true
    } else {
        Write-Host '[registers] static: injected registers, compiled feature contracts and inserted host/framework members passed.'
    }
}

if ($Serial -and -not $failed) {
    $deviceLease = Enter-HushDeviceLease -Adb $adbPath -Serial $Serial -LeaseToken $LeaseToken `
        -LeaseDirectory $LeaseDirectory -ChatIdentity $ChatIdentity
    Write-Host "[registers] running the device verifier on $Serial"
    $deviceStarted = [DateTimeOffset]::UtcNow
    $cleanEvidence = @{}
    $patchedEvidence = @{}
    $cleanTally = Invoke-AndroidVerifierTally -Adb $adbPath -Serial $Serial `
        -Local $cleanBase -Label 'clean' -LeaseToken $deviceLease.Token -LeaseDirectory (Split-Path -Parent $deviceLease.Path) `
        -ChatIdentity $ChatIdentity -Evidence $cleanEvidence
    $patchedTally = Invoke-AndroidVerifierTally -Adb $adbPath -Serial $Serial `
        -Local $PatchedApk -Label 'patched' -LeaseToken $deviceLease.Token -LeaseDirectory (Split-Path -Parent $deviceLease.Path) `
        -ChatIdentity $ChatIdentity -Evidence $patchedEvidence
    $comparison = Compare-VerifierTallies -Clean $cleanTally -Patched $patchedTally
    Write-Host "[registers] verifier messages: clean $($comparison.CleanTotal), patched $($comparison.PatchedTotal)"

    # Each tally is only returned after matching remote hashes and the pushed-size check, so two empty
    # tallies are an answer: a clean build that raises nothing (the Facebook sibling's never did)
    # holds the patched one to nothing more.
    if (-not $comparison.Valid) {
        $missing = @($comparison.Deltas | Where-Object Kind -eq 'missing')
        $extra = @($comparison.Deltas | Where-Object Kind -eq 'extra')
        if ($missing.Count -ne 0) {
            Write-Host "[registers] FAIL: the patched build is missing $($missing.Count) verifier message tally entry or count:"
            $missing | Select-Object -First 20 | ForEach-Object {
                Write-Host ("[registers]   {0}  (clean {1}, patched {2})" -f $_.Message, $_.Clean, $_.Patched)
            }
        }
        if ($extra.Count -ne 0) {
            Write-Host "[registers] FAIL: the patched build has $($extra.Count) extra verifier message tally entry or count:"
            $extra | Select-Object -First 20 | ForEach-Object {
                Write-Host ("[registers]   {0}  (clean {1}, patched {2})" -f $_.Message, $_.Clean, $_.Patched)
            }
        }
        $failed = $true
    } else {
        Write-Host '[registers] device: the clean and patched verifier message tallies are identical.'
        if ($DeviceEvidencePath) {
            $deviceEvidence = [ordered]@{
                schema = 1; runId = $EvidenceRunId; completed = $true; staticPassed = $true
                serial = $Serial; device = $deviceLease.Identity
                bundleSha256 = Get-StreamSha256 $bundleHeld
                sourceSha256 = Get-StreamSha256 $walkSourceHeld
                inputIdentity = Get-HeldInputIdentity -Merged $CleanMerged
                cleanBaseSha256 = Get-StreamSha256 $cleanBaseHeld
                patchedSha256 = Get-StreamSha256 $walkPatchedHeld
                started = $deviceStarted.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ')
                finished = [DateTimeOffset]::UtcNow.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ')
                clean = $cleanEvidence; patched = $patchedEvidence
            }
            Write-HushVerifierEvidence -Path $DeviceEvidencePath -Evidence $deviceEvidence
        }
    }
}

$completed = $true
} finally {
    try {
    # Held files can't be deleted, so the clean side is let go first.
    if ($walkSourceHeld) { $walkSourceHeld.Dispose() }
    if ($walkPatchedHeld) { $walkPatchedHeld.Dispose() }
    if ($cleanMergedHeld) { $cleanMergedHeld.Dispose() }
    if ($madeCleanMerge) { Close-MergedApk -Merged $CleanMerged }
    if ($cleanBaseHeld) { $cleanBaseHeld.Dispose() }
    if ($cleanSourceHeld) { $cleanSourceHeld.Dispose() }
    if ($bundleHeld) { $bundleHeld.Dispose() }
    $workHeld.Anchor.Dispose()
    $keepReport = $reportInWork -and ($failed -or -not $completed) -and
        (Test-Path -LiteralPath $ReportPath -PathType Leaf)
    if ($keepReport) {
        Get-ChildItem -LiteralPath $work -Recurse -File -Filter '*.apk' -ErrorAction SilentlyContinue |
            Remove-Item -Force -ErrorAction SilentlyContinue
        Write-Host "[registers] the report is kept at $ReportPath"
    } else {
        Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
    }
    } finally { Exit-HushDeviceLease $deviceLease }
}

# Success needs the try above to have run to its end. A launch error once left it early under a
# script-wide Continue, and the run fell through to the success line with nothing checked.
if ($failed -or -not $completed) { exit 1 }
Write-Host '[registers] success.'
exit 0
