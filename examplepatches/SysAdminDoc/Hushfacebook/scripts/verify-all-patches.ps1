<#
.SYNOPSIS
    Apply every patch in the bundle and reject partial or unsuccessful output.

.DESCRIPTION
    The per-patch check with --exclusive answers one patch at a time. This applies all of
    them in a single run and validates the desktop CLI process, result report, patch names,
    target version and saved APK. A result file can be written from a finally block after a
    failed compile, so a zero failed-patch count is not enough to call the run successful.

    The bundle declares one compatible version, and the CLI refuses any other APK unless it is
    told to go ahead with -f. -Force does that for a retained newer build: the stock APK's own
    version is read with aapt2 and the result is held to that instead of the catalog's, so the
    run answers "which patches still apply on this build" rather than being refused before it
    starts. The package still has to be the catalog's.

    A split bundle is merged into one APK first, with the CLI's own merger (Get-MergedApk), and
    the CLI patches that merge. A clean run reads the manifests of the merge and the patched APK
    the way the release receipt does and prints what patching changed: permissions asked for or
    dropped, components exported or no longer. A change scripts/manifest-delta-allowlist.txt
    doesn't approve stops the run there, before the release. It then holds the patched APK's
    resource table to the merge's with ResourceTableCheck.java: every resource of every package
    has to resolve by its id with its type and each configuration's value, and every file and
    reference the patched values name has to be there. A failure names the id. What the patches
    rewrote, what the rebuild renamed and what was added go in a report beside the result file.

    Last, verify-injected-registers.ps1 holds the patched dex to the stock dex: register counts,
    branch targets, invoke registers, parameter kinds, try ranges and the one feed guard. Its
    report goes beside the result file too.

.EXAMPLE
    scripts/verify-all-patches.ps1 -Apk C:\path\to\native-fixture.apk `
        -DesktopJar C:\path\to\morphe-desktop.jar -WorkDir C:\path\to\scratch

.EXAMPLE
    scripts/verify-all-patches.ps1 -Apk C:\fixtures\facebook-older.apk -Force `
        -DesktopJar C:\path\to\morphe-desktop.jar -WorkDir C:\path\to\scratch
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Apk,
    [Parameter(Mandatory = $true)][string]$DesktopJar,
    [Parameter(Mandatory = $true)][string]$WorkDir,
    [string]$Bundle,
    [string]$PatchList,
    [string]$Java,
    [switch]$Force,
    [string]$Aapt2
)

$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
$Java = Resolve-Java -Explicit $Java
$root = Split-Path -Parent $PSScriptRoot
. (Join-Path $PSScriptRoot 'patch-report.ps1')
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')

if (-not $Bundle) {
    $version = Get-BundleVersion -Root $root
    $Bundle = Get-ReleaseBundlePath -Root $root -Version $version
    if (-not (Test-Path -LiteralPath $Bundle -PathType Leaf)) {
        throw "No bundle for version $version at $Bundle. Run :patches:generatePatchesList then :patches:buildAndroid."
    }
}
if (-not $PatchList) { $PatchList = Join-Path $root 'patches-list.json' }
if (-not $Bundle -or -not (Test-Path -LiteralPath $Bundle -PathType Leaf)) { throw "No bundle found. Run :patches:buildAndroid first." }
if (-not (Test-Path -LiteralPath $PatchList -PathType Leaf)) { throw "No patch list found: $PatchList" }
if (-not (Test-Path -LiteralPath $Apk -PathType Leaf)) { throw "APK not found: $Apk" }
if (-not (Test-Path -LiteralPath $DesktopJar -PathType Leaf)) { throw "Desktop CLI jar not found: $DesktopJar" }

try {
    $catalog = Get-Content -LiteralPath $PatchList -Raw | ConvertFrom-Json
    $names = @($catalog.patches | ForEach-Object { $_.name })
} catch {
    throw "Could not read patch list ${PatchList}: $($_.Exception.Message)"
}
$expectedTarget = Get-PatchTarget -PatchList $catalog
if ($names.Count -eq 0 -or @($names | Where-Object { [string]::IsNullOrWhiteSpace($_) }).Count -ne 0) {
    throw "No valid patches listed in $PatchList."
}
$dependencyNames = @(Get-PatchDependencyNames -PatchList $catalog -RequestedNames $names)
Write-Host "[verify] $($names.Count) patches from $(Split-Path -Leaf $Bundle)"

New-Item -ItemType Directory -Force -Path $WorkDir | Out-Null
$workRoot = (Resolve-Path -LiteralPath $WorkDir).Path
$runId = [guid]::NewGuid().ToString('N')
$runDir = Join-Path $workRoot "verify-$runId"
New-Item -ItemType Directory -Force -Path $runDir | Out-Null

# Facebook ships split bundles. aapt2 reads the version facts off one APK, the base, which holds
# the manifest, and the register check's clean side is the base too: it carries every dex and
# Meta's signature, which a merge doesn't keep.
$stockApk = Get-BaseApk -Apk $Apk -Destination (Resolve-WithinRoot -Path (Join-Path $runDir 'stock-base.apk') -Root $workRoot)

# The version the result is held to: the stock APK's own, read the same way the receipt reads
# it. The catalog declares more than one build, so a declared one (its version name and the code the
# catalog pins it to) is patched as a user's Manager patches it, and any other only with -Force,
# which tells the CLI to go ahead with -f.
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
$Aapt2 = Resolve-Aapt2 -Explicit $Aapt2 -Root $root
$stock = Get-ApkManifestFacts -Apk $stockApk -Aapt2 $Aapt2
if ($stock.package -ne $expectedTarget.PackageName) {
    throw "$(Split-Path -Leaf $Apk) is $($stock.package), not the catalog's target $($expectedTarget.PackageName)."
}
if ([string]::IsNullOrWhiteSpace($stock.versionName)) {
    throw "$(Split-Path -Leaf $Apk) carries no versionName, so there is nothing to hold the result to."
}
$expectedVersion = $stock.versionName
# A declared build by version code too: another arm64 build of a declared version has its own dex.
$forced = -not (Test-DeclaredBuild -Target $expectedTarget -VersionName ([string]$stock.versionName) `
    -VersionCode ([string]$stock.versionCode))
if ($forced -and -not $Force) {
    throw ("$(Split-Path -Leaf $Apk) is $($stock.versionName), which the bundle does not declare, at version code " +
        "$($stock.versionCode). It declares $(Format-DeclaredBuilds -Target $expectedTarget). Pass -Force to patch it anyway.")
}
if ($forced) {
    Write-Host ("[verify] forcing the bundle onto $($stock.package) $($stock.versionName) ($($stock.versionCode)); " +
        "it declares $(Format-DeclaredBuilds -Target $expectedTarget)")
} else {
    Write-Host "[verify] $($stock.package) $($stock.versionName) is a declared target, so nothing is forced"
}

$out = Resolve-WithinRoot -Path (Join-Path $runDir 'verify-all.apk') -Root $workRoot
$temp = Resolve-WithinRoot -Path (Join-Path $runDir 'verify-all-tmp') -Root $workRoot
$result = Resolve-WithinRoot -Path (Join-Path $workRoot "verify-all-result-$runId.json") -Root $workRoot
$exitCode = 1

try {
    # What the CLI patches and what the patched table is held to, one file: a bundle's merge, made
    # here because the CLI deletes its own, or the APK itself. A bundle that won't merge stops the
    # run; base.apk alone lacks the splits' resources and would pass a table that lost them.
    $mergedApk = Resolve-WithinRoot -Path (Join-Path $runDir 'stock-merged.apk') -Root $workRoot
    $patchInput = Get-MergedApk -Apk $Apk -Destination $mergedApk -Java $Java -DesktopJar $DesktopJar
    if ($patchInput -eq $mergedApk) { Write-Host "[verify] merged $(Split-Path -Leaf $Apk) into one APK for the CLI" }
    $enable = @()
    foreach ($name in $names) { $enable += '-e'; $enable += $name }
    $arguments = @('patch', '--exclusive', '--continue-on-error', '--unsigned', '-p', $Bundle,
        '-o', $out, '-t', $temp, '-r', $result)
    if ($forced) { $arguments += '-f' }
    $arguments = $arguments + $enable + @($patchInput)

    # Continue for the call alone: the CLI logs WARNING and SEVERE on stderr, which Windows
    # PowerShell 5.1 turns into a terminating error under Stop. The report and the exit code decide.
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $cliOutput = @(& $Java '-jar' $DesktopJar @arguments 2>&1)
        $cliExitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $preference
    }
    # WARNING lines are the patches' own: a patch that works down a list of targets names each one
    # the build lacks there, and still applies.
    $cliOutput | ForEach-Object {
        $line = [string]$_
        if ($line -match 'SEVERE|ERROR|WARNING|Exception|result saved|Saved to') { Write-Host "[verify] $line" }
    }

    $report = $null
    if (Test-Path -LiteralPath $result -PathType Leaf) {
        try { $report = Get-Content -LiteralPath $result -Raw | ConvertFrom-Json }
        catch { Write-Warning "Could not parse result JSON: $($_.Exception.Message)" }
    }
    $validation = Test-PatchingReport -Report $report -ExpectedNames $names `
        -AllowedDependencyNames $dependencyNames -OutputPath $out `
        -ExpectedPackageName $expectedTarget.PackageName -ExpectedPackageVersion $expectedVersion
    $reportApplied = if ($null -ne $report) { @($report.appliedPatches).Count } else { 0 }
    $reportFailed = if ($null -ne $report) { @($report.failedPatches).Count } else { 0 }
    $target = if ($null -ne $report) { "$($report.packageName) $($report.packageVersion)" } else { 'unknown target' }
    Write-Host "[verify] ${target}: applied $reportApplied, failed $reportFailed, CLI exit $cliExitCode"
    if ($null -ne $report) {
        foreach ($failure in @($report.failedPatches)) {
            $patchName = if ($null -ne $failure.patch) { $failure.patch.name } else { 'unknown patch' }
            Write-Host "[verify] FAILED ${patchName}: $($failure.reason -split "`n" | Select-Object -First 1)"
        }
    }
    Write-Host "[verify] result file: $result"
    if ($cliExitCode -ne 0) { Write-Warning "The desktop CLI exited with $cliExitCode." }
    if (-not $validation.Valid) { Write-Warning "[verify] $($validation.Reason)" }
    $unapprovedChanges = @()
    if ($cliExitCode -eq 0 -and $validation.Valid) {
        # What patching did to the manifest, read the way the release receipt reads it, against the
        # APK the CLI patched, and held to the same allowlist, so a change nobody approved stops this
        # run and not only the release. An approved change this run didn't make is reported and left
        # to the receipt, which needs every declared build to decide it.
        $manifestChanges = @(ConvertTo-ManifestDeltaEntries -Delta (Get-ManifestDelta `
            -Stock (Get-ApkManifestFacts -Apk $patchInput -Aapt2 $Aapt2) -Patched (Get-ApkManifestFacts -Apk $out -Aapt2 $Aapt2)))
        $approvedChanges = @(Read-ManifestDeltaAllowlist -Path (Join-Path $PSScriptRoot 'manifest-delta-allowlist.txt') |
            Where-Object { $_ })
        $unapprovedChanges = @($manifestChanges | Where-Object { $approvedChanges -cnotcontains $_ })
        Write-Host "[verify] manifest delta: $($manifestChanges.Count) change(s), $($unapprovedChanges.Count) not approved"
        foreach ($change in $manifestChanges) {
            $mark = if ($approvedChanges -ccontains $change) { 'approved' } else { 'NOT APPROVED' }
            Write-Host "[verify]   $change ($mark)"
        }
        $unmade = @($approvedChanges | Where-Object { $manifestChanges -cnotcontains $_ })
        if ($unmade.Count -gt 0) { Write-Host "[verify] approved but not made here: $($unmade -join ', ')" }
    }
    if ($cliExitCode -eq 0 -and $validation.Valid -and $unapprovedChanges.Count -gt 0) {
        Write-Warning ('[verify] the patched manifest changed in ways scripts/manifest-delta-allowlist.txt ' +
            "doesn't approve: $($unapprovedChanges -join ', ')")
    } elseif ($cliExitCode -eq 0 -and $validation.Valid) {
        # The rebuilt resource table against the stock one. A resource patch has Morphe decode and
        # rebuild the app's whole table, and an id the rebuild loses only fails when the app
        # inflates it (Hushfeed upstream #84, a layout in one of TikTok's feature packages). The
        # stock side is the APK the CLI patched, a split bundle's merge among them: that is the
        # table the patched APK was rebuilt from.
        $resourceReport = Resolve-WithinRoot -Path (Join-Path $workRoot "verify-all-resources-$runId.txt") -Root $workRoot
        # Continue for the call alone, as for the CLI: a JDK note or a stack trace on stderr would
        # otherwise end the run under Windows PowerShell 5.1 before the exit code is read.
        $preference = $ErrorActionPreference
        try {
            $ErrorActionPreference = 'Continue'
            $global:LASTEXITCODE = -1
            $resourceOutput = @(& $Java '-Xmx4g' '-cp' $DesktopJar (Join-Path $PSScriptRoot 'ResourceTableCheck.java') `
                $patchInput $out $resourceReport 2>&1)
            $resourceExitCode = $LASTEXITCODE
        } finally {
            $ErrorActionPreference = $preference
        }
        $resourceOutput | ForEach-Object { Write-Host "[verify] $_" }
        Write-Host "[verify] resource report: $resourceReport"
        if ($resourceExitCode -eq 0) {
            # The injected code against Meta's: registers, branches, invokes, parameters and try
            # ranges, the shapes that pass the CLI and fail on a device. The one-feed-guard rule
            # rides along from injected-mutation-contracts.txt; it's a project contract, which
            # the device verifier doesn't check.
            $registerReport = Resolve-WithinRoot -Path (Join-Path $workRoot "verify-all-registers-$runId.txt") -Root $workRoot
            $global:LASTEXITCODE = 0
            & (Join-Path $PSScriptRoot 'verify-injected-registers.ps1') -CleanApk $stockApk -CleanMerged $patchInput `
                -PatchedApk $out -ReportPath $registerReport -Java $Java -DesktopJar $DesktopJar -Aapt2 $Aapt2
            $registerExitCode = $LASTEXITCODE
            Write-Host "[verify] register report: $registerReport"
            if ($registerExitCode -eq 0) {
                Write-Host ('[verify] success: every requested patch applied to a valid APK whose manifest changes ' +
                    'are all approved, whose resource table holds every stock resource and whose injected code ' +
                    'passes the structural checks.')
                $exitCode = 0
            } else {
                Write-Warning "[verify] the injected code failed its structural checks (exit $registerExitCode)."
            }
        } else {
            Write-Warning "[verify] the patched resource table failed its check against the stock one (exit $resourceExitCode)."
        }
    }
} finally {
    Remove-GeneratedPath -Path $runDir -Root $workRoot
}

exit $exitCode
