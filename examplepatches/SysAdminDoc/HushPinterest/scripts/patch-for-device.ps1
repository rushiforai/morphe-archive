<#
.SYNOPSIS
    Patch the vendor APK with every HushPinterest patch, sign it, and optionally install it.

.DESCRIPTION
    verify-all-patches.ps1 answers whether the patches apply and throws its APK away. This
    keeps one, signed with the sideload keystore so it installs on a phone, and installs it
    over adb when a serial is given. Installs require an exclusive whole-device lease and matching
    signers. Existing accounts, permissions and keys are preserved. Stock installs are refused.

    The signing password comes from HUSHPINTEREST_SIDELOAD_KEYSTORE_PASSWORD. When it is unset, the
    local test keystore's documented password, sideload, is used. The Morphe arguments travel
    through a temporary Java argument file so the password value is not in the child process
    command line. The file is deleted when patching exits.

    The vendor APK defaults to the newest declared build in the folder HUSHPINTEREST_FIXTURE_DIR
    names. -Apk takes any build the catalog declares, and the result is held to that APK's own
    version, read with aapt2. A build the catalog doesn't declare is refused before anything is
    patched. The desktop CLI is found through -DesktopJar, HUSHPINTEREST_DESKTOP_JAR or
    HUSHPINTEREST_WORKDIR, Java through -Java, HUSHPINTEREST_JAVA or JAVA_HOME, and aapt2 through
    -Aapt2, HUSHPINTEREST_AAPT2 or the SDK. None of them has a machine-specific default.

    When the release push gate has already patched this exact bundle onto this APK with the same
    patch selection, tools and verifier files, and kept the run (verify-all-patches.ps1 -KeepIn),
    that run's patched APK is signed with apksigner beside aapt2 and handed back instead of patching
    again. The report and manifest checks below still run on it. The store is -AppliedDir, else
    HUSHPINTEREST_APPLY_RECORDS, else the default one in the temp folder; -NoReuse always patches.
    Nothing this script makes is kept there: it skips the resource table check.

.EXAMPLE
    scripts/patch-for-device.ps1 -Serial $env:HUSHPINTEREST_DEVICE_SERIAL
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [switch]$Replace,
    [string]$LeaseToken = $env:HUSHPINTEREST_DEVICE_LEASE_TOKEN,
    [string]$LeaseDirectory = $env:HUSHPINTEREST_DEVICE_LEASE_DIR,
    [string]$ChatIdentity = $env:HUSHPINTEREST_CHAT_ID,
    # Print every line the desktop CLI writes, not only errors.
    [switch]$ShowPatchLog,
    # Patch names to leave out of this build. The catalog applies everything, including any patch
    # that is off by default, so a check of what Pinterest does without one of them needs a build
    # that leaves it out.
    [string[]]$Exclude = @(),
    # Patch with the release bundle even when a source file is newer than it, for replaying
    # an earlier build on purpose. Without it a stale bundle stops the run.
    [switch]$AllowStaleBundle,
    [string]$Apk,
    [string]$DesktopJar,
    [string]$Java,
    [string]$Aapt2,
    [string]$AndroidJar,
    [string]$ApiVersions,
    [string]$Keystore = "$HOME\.android\sideload-release.jks",
    [string]$KeyAlias = 'sideload',
    [string]$OutDir = (Join-Path $env:TEMP 'hushpinterest-device'),
    # An explicit final destination is reserved atomically and never overwritten.
    [string]$OutputApk,
    # The checkout whose catalog and release bundle are used, the one holding this script unless
    # given. The contract tests point it at a fixture.
    [string]$Root,
    # The applied record store to look for a gate run of this bundle in.
    [string]$AppliedDir,
    # Patch with the CLI even when a kept gate run matches.
    [switch]$NoReuse
)

$ErrorActionPreference = 'Stop'
if ($Replace) { throw '-Replace is refused. Development installs never uninstall apps or erase accounts.' }
# Not a parameter default: Windows PowerShell leaves $PSScriptRoot empty while it evaluates the
# defaults of an advanced script started with -File. $root below is this same variable.
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
# The argument file is written with [IO.File], which reads a relative path against the process
# directory, while java is handed the same path from PowerShell's location. Absolute, they agree.
$OutDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutDir)
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'patch-report.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
$Java = Resolve-Java -Explicit $Java
$DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $root -Required
$catalogPath = Join-Path $root 'patches-list.json'
if (-not (Test-Path -LiteralPath $catalogPath -PathType Leaf)) { throw "No patch list found: $catalogPath" }
$catalogSha256 = (Get-FileHash -LiteralPath $catalogPath -Algorithm SHA256).Hash.ToLowerInvariant()
try { $catalog = Get-Content -LiteralPath $catalogPath -Raw | ConvertFrom-Json }
catch { throw "Could not read patch list ${catalogPath}: $($_.Exception.Message)" }
$target = Get-PatchTarget -PatchList $catalog
if (-not $Apk -and $env:HUSHPINTEREST_FIXTURE_DIR -and (Test-Path -LiteralPath $env:HUSHPINTEREST_FIXTURE_DIR -PathType Container)) {
    $Apk = (Get-ChildItem -LiteralPath $env:HUSHPINTEREST_FIXTURE_DIR `
        -File | Where-Object { $_.Name -like "*$($target.PackageVersion)*" -and $_.Extension -in '.apk', '.apkm', '.xapk' } |
        Sort-Object @{ Expression = { $_.Extension -ne '.apk' } }, Name | Select-Object -First 1).FullName
}
if (-not $Apk -or -not (Test-Path -LiteralPath $Apk -PathType Leaf)) {
    throw ("No vendor APK. Pass -Apk with the $($target.PackageVersion) build, or set " +
        'HUSHPINTEREST_FIXTURE_DIR to the folder that holds it.')
}
$fixtureSha256 = (Get-FileHash -LiteralPath $Apk -Algorithm SHA256).Hash.ToLowerInvariant()
# The version the result is held to: the vendor APK's own, read the way verify-all-patches.ps1
# and the receipt read it. The catalog can declare more than one build and the CLI reports the
# version of the APK it was given, so holding every run to the newest build failed an older build
# after it had been patched (the Facebook sibling's 577). A build the catalog doesn't declare is
# refused here: without -f the CLI refuses it too, but only after unpacking it, and this is the
# APK that goes on a phone.
$Aapt2 = Resolve-Aapt2 -Explicit $Aapt2 -Root $root
$runParent = $OutDir
$runToken = [guid]::NewGuid().ToString('N')
$OutDir = Join-Path $runParent $runToken
if (Test-Path -LiteralPath $OutDir) { throw 'The unique patch workspace already exists.' }
New-Item -ItemType Directory -Path $OutDir -Force | Out-Null
$ownerFile = Join-Path $OutDir 'owner.txt'
$owner = [IO.File]::Open($ownerFile, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None)
try {
    $ownerBytes = [Text.Encoding]::UTF8.GetBytes($runToken)
    $owner.Write($ownerBytes, 0, $ownerBytes.Length)
} finally { $owner.Dispose() }
$complete = $false
$outputReservation = $null
$reservedPath = $null
$ownedOutput = $false
$evidenceStream = $null
$evidencePath = $null
$ownedEvidence = $false
try {
if ($OutputApk) {
    $reservedPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputApk)
    if (-not (Test-Path -LiteralPath (Split-Path -Parent $reservedPath) -PathType Container)) {
        throw 'The explicit APK destination directory does not exist.'
    }
    try { $outputReservation = [IO.File]::Open($reservedPath, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None) }
    catch [IO.IOException] { throw 'The explicit APK destination already exists or is owned by another run. No output was overwritten.' }
    $ownedOutput = $true
    $evidencePath = "$reservedPath.build.json"
    try { $evidenceStream = [IO.File]::Open($evidencePath, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None) }
    catch [IO.IOException] { throw 'The explicit build-evidence destination already exists. No evidence was overwritten.' }
    $ownedEvidence = $true
}
$stockBase = Join-Path $OutDir 'stock-base.apk'
try {
    $stock = Get-ApkManifestFacts -Apk (Get-BaseApk -Apk $Apk -Destination $stockBase) -Aapt2 $Aapt2
} finally {
    # Only the copy taken out of a bundle. A plain APK is read where it is and stays there.
    Remove-Item -LiteralPath $stockBase -Force -ErrorAction SilentlyContinue
}
if ($stock.package -ne $target.PackageName) {
    throw "$(Split-Path -Leaf $Apk) is $($stock.package), not the catalog's target $($target.PackageName)."
}
# Its version code as well: another arm64 build of a declared version has its own dex, and nothing
# proved the patches on it.
if (-not (Test-DeclaredBuild -Target $target -VersionName ([string]$stock.versionName) -VersionCode ([string]$stock.versionCode))) {
    throw ("$(Split-Path -Leaf $Apk) is $($stock.package) $($stock.versionName), which the bundle does not " +
        "declare, at version code $($stock.versionCode). It declares $(Format-DeclaredBuilds -Target $target). " +
        'Build for a phone from a declared build; scripts/verify-all-patches.ps1 -Force shows what still applies on another one.')
}
$passwordVariable = 'HUSHPINTEREST_SIDELOAD_KEYSTORE_PASSWORD'
$keystorePassword = [Environment]::GetEnvironmentVariable(
    $passwordVariable, [EnvironmentVariableTarget]::Process)
if ([string]::IsNullOrEmpty($keystorePassword)) {
    $keystorePassword = 'sideload'
    Write-Host "[device] $passwordVariable is unset; using the documented local test-key fallback"
}
$version = Get-BundleVersion -Root $root
$bundle = Get-ReleaseBundlePath -Root $root -Version $version
if (-not (Test-Path $bundle)) { throw "No bundle at $bundle. Build it first: :patches:generatePatchesList then :patches:buildAndroid, through the governor." }
$buildInputs = [ordered]@{
    bundleSha256 = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant()
    fixtureSha256 = $fixtureSha256
    catalogSha256 = $catalogSha256
}
# Only buildAndroid writes this bundle; a test run after a patch change leaves it behind, and the
# phone would get the previous hooks while the result reads as a verdict on the new ones.
if (-not $AllowStaleBundle) {
    $newerSources = @(Get-SourcesNewerThanBundle -Root $root -Bundle $bundle)
    if ($newerSources.Count -gt 0) {
        throw ("The bundle at $bundle is older than $($newerSources.Count) source file(s), the newest " +
            "$($newerSources[0].FullName). Rebuild it first: :patches:buildAndroid through the governor " +
            '(or pass -AllowStaleBundle to patch with it as it is).')
    }
}
$names = @($catalog.patches | ForEach-Object { $_.name } | Where-Object { $_ -notin $Exclude })
foreach ($excluded in $Exclude) {
    if ($excluded -notin ($catalog.patches | ForEach-Object { $_.name })) { throw "No patch named '$excluded' to exclude." }
}
if ($Exclude.Count -gt 0) { Write-Host "[device] leaving out: $($Exclude -join ', ')" }
$dependencyNames = @(Get-PatchDependencyNames -PatchList $catalog -RequestedNames $names)

New-Item -ItemType Directory -Force $OutDir | Out-Null
$out = Join-Path $OutDir "hushpinterest-$version-signed.apk"
$temp = Join-Path $OutDir 'tmp'
$result = Join-Path $OutDir 'result.json'
if (Test-Path -LiteralPath $out) { throw 'The new run already has an APK output.' }

Write-Host "[device] $($names.Count) patches from $(Split-Path -Leaf $bundle) onto $(Split-Path -Leaf $Apk)"
$patchInput = Get-MergedApk -Apk $Apk -Destination (Join-Path $OutDir 'stock-merged.apk') `
    -Java $Java -DesktopJar $DesktopJar
$stockManifest = Get-ApkManifestFacts -Apk $patchInput -Aapt2 $Aapt2

# A gate run that patched this exact bundle onto this APK with these patches and passed every check,
# as verify-all-patches.ps1 -KeepIn keeps it. Nothing is hashed while the store holds no record.
$recorded = $null
if (-not $NoReuse) {
    $store = Get-AppliedRecordStore -Path $AppliedDir
    if (@(Get-AppliedRecords -Store $store).Count -gt 0) {
        $hostStubs = Resolve-HostReferenceStubs -AndroidJar $AndroidJar -ApiVersions $ApiVersions -Aapt2 $Aapt2
        $AndroidJar = $hostStubs.AndroidJar
        $ApiVersions = $hostStubs.ApiVersions
        $identity = Get-AppliedRecordKey -Bundle $bundle -Fixture $Apk -PatchList $catalogPath -PatchNames $names `
            -Forced $false -DesktopJar $DesktopJar -AndroidJar $AndroidJar -ApiVersions $ApiVersions
        $recorded = Find-AppliedRecord -Store $store -Key $identity.Key
    }
}
if ($recorded) {
    # The kept APK is unsigned. apksigner signs it with the same key and alias the CLI would have
    # used, reading the password from the environment so it stays off the command line.
    Write-Host ("[device] this bundle, APK and patch selection passed every check in the gate run kept as " +
        "$($identity.Key) at $($recorded.RecordedAt); signing that APK instead of patching again")
    $apksigner = Join-Path (Split-Path -Parent $Aapt2) 'apksigner.bat'
    if (-not (Test-Path -LiteralPath $apksigner -PathType Leaf)) {
        throw "No apksigner beside aapt2 at $apksigner to sign the kept APK. Pass -NoReuse to patch and sign with the CLI."
    }
    $savedPassword = [Environment]::GetEnvironmentVariable($passwordVariable, [EnvironmentVariableTarget]::Process)
    $preference = $ErrorActionPreference
    try {
        [Environment]::SetEnvironmentVariable($passwordVariable, $keystorePassword, [EnvironmentVariableTarget]::Process)
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $signOutput = @(& $apksigner sign --ks $Keystore --ks-key-alias $KeyAlias --ks-pass "env:$passwordVariable" `
            --key-pass "env:$passwordVariable" --out $out $recorded.PatchedApk 2>&1 | ForEach-Object { "$_" })
        $signExitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $preference
        [Environment]::SetEnvironmentVariable($passwordVariable, $savedPassword, [EnvironmentVariableTarget]::Process)
    }
    if ($signExitCode -ne 0 -or -not (Test-Path -LiteralPath $out -PathType Leaf)) {
        throw "apksigner could not sign the kept APK (exit $signExitCode): $($signOutput -join ' ')"
    }
    Copy-Item -LiteralPath $recorded.Result -Destination $result
} else {
$enable = @()
foreach ($name in $names) { $enable += '-e'; $enable += $name }
$arguments = @('patch', '--exclusive', '-p', $bundle, '-o', $out, '-t', $temp, '-r', $result,
    '--keystore', $Keystore, '--keystore-password', $keystorePassword,
    '--keystore-entry-alias', $KeyAlias, '--keystore-entry-password', $keystorePassword) + $enable + @($patchInput)
$argumentFile = Join-Path $OutDir 'morphe-patch.args'
$argumentFileLines = @($arguments | ForEach-Object {
    $value = [string]$_
    if ($value.IndexOfAny([char[]]"`r`n") -ge 0) {
        throw 'A Morphe command argument contains a newline and cannot be written safely.'
    }
    '"' + $value.Replace('\', '\\').Replace('"', '\"') + '"'
})
[System.IO.File]::WriteAllLines(
    $argumentFile,
    $argumentFileLines,
    (New-Object System.Text.UTF8Encoding($false)))
try {
    # Continue for the call alone: the CLI logs WARNING and SEVERE on stderr, which Windows
    # PowerShell 5.1 turns into a terminating error under Stop. The exit code decides.
    # The run waits for a slot in the machine's build queue first (Enter-HushPinterestQueue).
    $preference = $ErrorActionPreference
    $queued = Enter-HushPinterestQueue -Job 'device patch'
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        & $Java -jar $DesktopJar "@$argumentFile" 2>&1 | ForEach-Object {
            $line = [string]$_
            if ($ShowPatchLog -or $line -match 'SEVERE|ERROR|WARNING|Exception|Saved to') { Write-Host "[device] $line" }
        }
        $cliExitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $preference
        Exit-HushPinterestQueue $queued
    }
    if ($cliExitCode -ne 0) { throw "The desktop CLI exited with $cliExitCode" }
} finally {
    if (-not (Test-Path -LiteralPath $ownerFile -PathType Leaf) -or [IO.File]::ReadAllText($ownerFile) -cne $runToken) {
        throw 'Patch workspace ownership changed. Argument cleanup refused.'
    }
    Remove-Item -LiteralPath $argumentFile -Force -ErrorAction SilentlyContinue
}
}
# The same report check the throwaway verification applies: every requested patch, every
# step, the target, and a real APK. The build that goes onto a phone deserves no less.
$report = $null
if (Test-Path -LiteralPath $result -PathType Leaf) { $report = Get-Content -LiteralPath $result -Raw | ConvertFrom-Json }
$validation = Test-PatchingReport -Report $report -ExpectedNames $names `
    -AllowedDependencyNames $dependencyNames -OutputPath $out `
    -ExpectedPackageName $target.PackageName -ExpectedPackageVersion $stock.versionName
if (-not $validation.Valid) { throw "Patching did not produce a complete APK: $($validation.Reason)" }
$manifestSelection = @($names) + @($dependencyNames)
$approvedChanges = @(Read-ManifestDeltaAllowlist -Path (Join-Path $PSScriptRoot 'manifest-delta-allowlist.txt') `
    -SelectedPatchNames $manifestSelection)
$patchedManifest = Get-ApkManifestFacts -Apk $out -Aapt2 $Aapt2
$manifestCheck = Test-ManifestDelta -Stock $stockManifest -Patched $patchedManifest `
    -SelectedPatchNames $manifestSelection -ApprovedManifestDelta $approvedChanges
if (-not $manifestCheck.Valid) { throw "Patching changed an unapproved compiled manifest fact: $($manifestCheck.Reason)" }
if ($recorded) {
    # Signing adds a signature block and leaves the dex alone, and these dex passed DexDiff and the
    # host reference check when the gate kept the run.
    Write-Host '[device] the structural and host reference checks passed on this dex in the kept run'
} else {
$registerReport = Join-Path $OutDir 'injected-registers.txt'
$global:LASTEXITCODE = -1
& (Join-Path $PSScriptRoot 'verify-injected-registers.ps1') -CleanApk $Apk -CleanMerged $patchInput `
    -PatchedApk $out -ReportPath $registerReport -Java $java -DesktopJar $DesktopJar -Aapt2 $Aapt2 `
    -SelectedPatchNames $manifestSelection -AndroidJar $AndroidJar -ApiVersions $ApiVersions
if ($LASTEXITCODE -ne 0) { throw 'Patched bytecode failed its compiled mutation or structural checks.' }
}
Write-Host "[device] applied $(@($report.appliedPatches).Count), failed $(@($report.failedPatches).Count), target $($report.packageName) $($report.packageVersion)"
# Record provenance only after the patch report, manifest and dex checks succeeded. Recheck
# inputs so a concurrent rebuild cannot attach its new hash to an APK made from older bytes.
foreach ($entry in @(@('bundleSha256', $bundle), @('fixtureSha256', $Apk), @('catalogSha256', $catalogPath))) {
    if ((Get-FileHash -LiteralPath $entry[1] -Algorithm SHA256).Hash.ToLowerInvariant() -cne $buildInputs[$entry[0]]) {
        throw 'A patch input changed during the run. No build evidence can be issued.'
    }
}
$buildEvidence = [ordered]@{
    schema = 1
    bundleSha256 = $buildInputs.bundleSha256
    fixtureSha256 = $buildInputs.fixtureSha256
    catalogSha256 = $buildInputs.catalogSha256
    packageName = [string]$stock.package
    appVersion = [string]$stock.versionName
    appVersionCode = [string]$stock.versionCode
    selectedPatches = @($names)
    signedApkSha256 = (Get-FileHash -LiteralPath $out -Algorithm SHA256).Hash.ToLowerInvariant()
    completed = [DateTimeOffset]::UtcNow.UtcDateTime.ToString('o')
}
if (-not $evidenceStream) {
    $evidencePath = "$out.build.json"
    $evidenceStream = [IO.File]::Open($evidencePath, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None)
    $ownedEvidence = $true
}
$evidenceBytes = [Text.Encoding]::UTF8.GetBytes(($buildEvidence | ConvertTo-Json -Depth 4) + "`n")
$evidenceStream.Write($evidenceBytes, 0, $evidenceBytes.Length)
$evidenceStream.Flush($true)
if ($outputReservation) {
    $input = [IO.File]::OpenRead($out)
    try { $input.CopyTo($outputReservation); $outputReservation.Flush($true) }
    finally { $input.Dispose() }
    $out = $reservedPath
}
$complete = $true
$evidenceStream.Dispose()
$evidenceStream = $null
if ($outputReservation) { $outputReservation.Dispose(); $outputReservation = $null }
Write-Host "[device] $out"
Write-Output $out

if (-not $Serial) { return }
$adb = (Get-Command adb -ErrorAction SilentlyContinue).Source
if (-not $adb) { $adb = Get-ChildItem "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Recurse -Filter adb.exe -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName }
if (-not $adb) { throw 'No adb found. Put it on the PATH or install the platform tools.' }
. (Join-Path $PSScriptRoot 'device-install.ps1')
$lease = Enter-HushDeviceLease -Adb $adb -Serial $Serial -LeaseToken $LeaseToken `
    -LeaseDirectory $LeaseDirectory -ChatIdentity $ChatIdentity
try {
    Install-HushAndroidApk -Adb $adb -Serial $Serial -Apk $out -PackageName $target.PackageName `
        -Aapt2 $Aapt2 -Lease $lease
    & $adb -s $Serial shell dumpsys package $target.PackageName | Select-String 'versionName' | Out-Host
} finally { Exit-HushDeviceLease $lease }

} finally {
    if ($outputReservation) { $outputReservation.Dispose() }
    if ($evidenceStream) { $evidenceStream.Dispose() }
    # These are this run's paths only. A missing or replaced owner marker fails closed.
    $safeRun = Resolve-WithinRoot -Path $OutDir -Root $runParent
    if (-not (Test-Path -LiteralPath $ownerFile -PathType Leaf) -or [IO.File]::ReadAllText($ownerFile) -cne $runToken) {
        throw 'Patch workspace ownership changed. Cleanup refused.'
    }
    foreach ($path in @((Join-Path $safeRun 'tmp'), (Join-Path $safeRun 'morphe-patch.args'),
            (Join-Path $safeRun 'stock-merged.apk'), (Join-Path $safeRun 'stock-merged.apk.source'),
            (Join-Path $safeRun 'stock-merged.apk.xmltree'))) {
        $safePath = Resolve-WithinRoot -Path $path -Root $safeRun
        if (Test-Path -LiteralPath $safePath) { Remove-Item -LiteralPath $safePath -Recurse -Force }
    }
    if (-not $complete) {
        Remove-Item -LiteralPath $safeRun -Recurse -Force
        if ($ownedOutput) { Remove-Item -LiteralPath $reservedPath -Force }
        if ($ownedEvidence -and (Test-Path -LiteralPath $evidencePath)) { Remove-Item -LiteralPath $evidencePath -Force }
    }
}
