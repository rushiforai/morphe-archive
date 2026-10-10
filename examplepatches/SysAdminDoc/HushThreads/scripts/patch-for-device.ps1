<#
.SYNOPSIS
    Patch the vendor APK with every HushThreads patch, sign it, and optionally install it.

.DESCRIPTION
    verify-all-patches.ps1 answers whether the patches apply and throws its APK away. This
    keeps one, signed with the sideload keystore so it installs on a phone, and installs it
    over adb when a serial is given. Device actions require an owned shared-pool lease and its
    expected model (physical devices) or AVD name (emulators). A signer conflict is refused;
    apps, accounts and installed signing keys are preserved. -Replace is no longer supported.

    The store password comes from HUSHTHREADS_SIDELOAD_KEYSTORE_PASSWORD. When it is unset, the
    local test keystore's documented password, sideload, is used. An explicitly empty value
    selects an unprotected store (PowerShell 7). HUSHTHREADS_SIDELOAD_KEY_PASSWORD supplies a
    different private-entry password when needed. Patching produces an unsigned
    APK, its native entries are aligned, then the existing BKS, JKS or PKCS12 key signs it.
    The password travels only through the signing process environment. No key is converted,
    created or replaced. The temporary patch argument file is deleted when patching exits.

    The vendor APK defaults to the newest declared build in the folder HUSHTHREADS_FIXTURE_DIR
    names. -Apk takes any build the catalog declares, and the result is held to that APK's own
    version, read with aapt2. A build the catalog doesn't declare is refused before anything is
    patched. The desktop CLI is found through -DesktopJar, HUSHTHREADS_DESKTOP_JAR or
    HUSHTHREADS_WORKDIR, Java through -Java, HUSHTHREADS_JAVA or JAVA_HOME, and aapt2 through
    -Aapt2, HUSHTHREADS_AAPT2 or the SDK. None of them has a machine-specific default.

.EXAMPLE
    scripts/patch-for-device.ps1 -Serial $env:HUSHTHREADS_DEVICE_SERIAL
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [switch]$Replace,
    # Print every line the desktop CLI writes, not only errors.
    [switch]$ShowPatchLog,
    # Patch names to leave out of this build. The catalog applies everything, including any patch
    # that is off by default, so a check of what Threads does without one of them needs a build
    # that leaves it out.
    [string[]]$Exclude = @(),
    # Patch with the release bundle even when a source file is newer than it, for replaying
    # an earlier build on purpose. Without it a stale bundle stops the run.
    [switch]$AllowStaleBundle,
    [string]$Apk,
    [string]$DesktopJar,
    [string]$Java,
    [string]$Aapt2,
    [string]$Keystore = "$HOME\.android\sideload-release.jks",
    [string]$KeyAlias = 'sideload',
    [string]$OutDir = (Join-Path $env:TEMP 'hushthreads-device'),
    # The checkout whose catalog and release bundle are used, the one holding this script unless
    # given. The contract tests point it at a fixture.
    [string]$Root
)

$ErrorActionPreference = 'Stop'
if ($Replace) { throw 'Replacement uninstall is disabled. Repatch with the installed signing key to preserve apps, accounts and data.' }
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
try { $catalog = Get-Content -LiteralPath $catalogPath -Raw | ConvertFrom-Json }
catch { throw "Could not read patch list ${catalogPath}: $($_.Exception.Message)" }
$target = Get-PatchTarget -PatchList $catalog
if (-not $Apk -and $env:HUSHTHREADS_FIXTURE_DIR -and (Test-Path -LiteralPath $env:HUSHTHREADS_FIXTURE_DIR -PathType Container)) {
    $Apk = (Get-ChildItem -LiteralPath $env:HUSHTHREADS_FIXTURE_DIR `
        -File | Where-Object { $_.Name -like "*$($target.PackageVersion)*" -and $_.Extension -in '.apk', '.apkm', '.xapk' } |
        Select-Object -First 1).FullName
}
if (-not $Apk -or -not (Test-Path -LiteralPath $Apk -PathType Leaf)) {
    throw ("No vendor APK. Pass -Apk with the $($target.PackageVersion) build, or set " +
        'HUSHTHREADS_FIXTURE_DIR to the folder that holds it.')
}
# The version the result is held to: the vendor APK's own, read the way verify-all-patches.ps1
# and the receipt read it. The catalog can declare more than one build and the CLI reports the
# version of the APK it was given, so holding every run to the newest build failed an older build
# after it had been patched (the Facebook sibling's 577). A build the catalog doesn't declare is
# refused here: without -f the CLI refuses it too, but only after unpacking it, and this is the
# APK that goes on a phone.
$Aapt2 = Resolve-Aapt2 -Explicit $Aapt2 -Root $root
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
$passwordVariable = 'HUSHTHREADS_SIDELOAD_KEYSTORE_PASSWORD'
$keystorePassword = [Environment]::GetEnvironmentVariable(
    $passwordVariable, [EnvironmentVariableTarget]::Process)
if ($null -eq $keystorePassword) {
    $keystorePassword = 'sideload'
    Write-Host "[device] $passwordVariable is unset; using the documented local test-key fallback"
}
foreach ($value in @($Keystore, $KeyAlias, $keystorePassword, $env:HUSHTHREADS_SIDELOAD_KEY_PASSWORD)) {
    if ($null -eq $value) { continue }
    if ($value.IndexOfAny([char[]]"`r`n") -ge 0) { throw 'A signing argument contains a newline.' }
}
$version = Get-BundleVersion -Root $root
$bundle = Get-ReleaseBundlePath -Root $root -Version $version
if (-not (Test-Path $bundle)) { throw "No bundle at $bundle. Build it first: :patches:generatePatchesList then :patches:buildAndroid, through the governor." }
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
$out = Join-Path $OutDir "hushthreads-$version-signed.apk"
$unsigned = Join-Path $OutDir "hushthreads-$version-unsigned.apk"
$temp = Join-Path $OutDir 'tmp'
$result = Join-Path $OutDir 'result.json'
if (Test-Path $out) { Remove-Item $out -Force }

Write-Host "[device] $($names.Count) patches from $(Split-Path -Leaf $bundle) onto $(Split-Path -Leaf $Apk)"
$enable = @()
foreach ($name in $names) { $enable += '-e'; $enable += $name }
$argumentFile = Join-Path $OutDir 'morphe-patch.args'
$mergedInput = Join-Path $OutDir 'stock-merged.apk'
$mergeRequired = [IO.Path]::GetExtension($Apk).TrimStart('.').ToLowerInvariant() -in @('apkm', 'apks', 'xapk')
# Whether a signed APK came out, in a table the block below fills in: the block runs in a scope of
# its own, so a plain assignment there wouldn't reach the cleanup.
$deviceRun = @{ SignedReady = $false }
try {
    # The merge, the CLI, the alignment, the signing and the identity check, in one slot of the
    # machine's build queue when there is one (Invoke-HeavyJob). A throw in it gives the slot back
    # and stops the build here, as before.
    Invoke-HeavyJob -Label "device $(Split-Path -Leaf $Apk)" -ScriptBlock {
        $patchInput = Get-MergedApk -Apk $Apk -Destination $mergedInput -Java $Java -DesktopJar $DesktopJar
        $arguments = @('patch', '--exclusive', '--unsigned', '-p', $bundle, '-o', $unsigned, '-t', $temp, '-r', $result) + $enable + @($patchInput)
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
        # Continue for the call alone: the CLI logs WARNING and SEVERE on stderr, which Windows
        # PowerShell 5.1 turns into a terminating error under Stop. The exit code decides.
        $preference = $ErrorActionPreference
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
        }
        if ($cliExitCode -ne 0) { throw "The desktop CLI exited with $cliExitCode" }
        $report = if (Test-Path -LiteralPath $result -PathType Leaf) { Get-Content -LiteralPath $result -Raw | ConvertFrom-Json } else { $null }
        $validation = Test-PatchingReport -Report $report -ExpectedNames $names -AllowedDependencyNames $dependencyNames `
            -OutputPath $unsigned -ExpectedPackageName $target.PackageName -ExpectedPackageVersion $stock.versionName
        if (-not $validation.Valid) { throw "Patching did not produce a complete APK: $($validation.Reason)" }
        $nativeId = [guid]::NewGuid().ToString('N')
        $baseline = Get-ApkManifestFacts -Apk $patchInput -Aapt2 $Aapt2
        $patchedManifest = Get-ApkManifestFacts -Apk $unsigned -Aapt2 $Aapt2
        $nativeStock = Get-NativePageFacts -Apk $patchInput -Java $Java -Aapt2 $Aapt2 `
            -ReportPath (Join-Path $OutDir "native-$nativeId-stock.json") -ExtractNativeLibs $baseline.extractNativeLibs
        $nativeRaw = Get-NativePageFacts -Apk $unsigned -Java $Java -Aapt2 $Aapt2 `
            -ReportPath (Join-Path $OutDir "native-$nativeId-unaligned.json") -ExtractNativeLibs $patchedManifest.extractNativeLibs
        Align-UnsignedNativeApk -Apk $unsigned -Aapt2 $Aapt2 -Java $Java -Facts $nativeRaw
        $savedPassword = [Environment]::GetEnvironmentVariable($passwordVariable, [EnvironmentVariableTarget]::Process)
        try {
            [Environment]::SetEnvironmentVariable($passwordVariable, $keystorePassword, [EnvironmentVariableTarget]::Process)
            $ErrorActionPreference = 'Continue'
            $signOutput = @(& $Java -cp $DesktopJar (Join-Path $PSScriptRoot 'SignAlignedApk.java') $unsigned $out $Keystore $KeyAlias 2>&1)
            $signCode = $LASTEXITCODE
        } finally {
            $ErrorActionPreference = $preference
            [Environment]::SetEnvironmentVariable($passwordVariable, $savedPassword, [EnvironmentVariableTarget]::Process)
        }
        if ($signCode -ne 0) { throw "APK signing failed (exit $signCode): $($signOutput -join ' ')" }
        $signOutput | ForEach-Object { Write-Host "[device] $_" }
        $identityOutput = @(& $Java -cp $DesktopJar (Join-Path $PSScriptRoot 'IdentityApkCheck.java') $bundle $out 2>&1)
        $identityCode = $LASTEXITCODE
        $identityOutput | ForEach-Object { Write-Host "[device] $_" }
        if ($identityCode -ne 0) { throw "APK identity verification failed (exit $identityCode)." }
        $nativeFinal = Get-NativePageFacts -Apk $out -Java $Java -Aapt2 $Aapt2 `
            -ReportPath (Join-Path $OutDir "native-$nativeId-signed.json") -ExtractNativeLibs $patchedManifest.extractNativeLibs
        $nativeAlignment = Get-NativePageDelta -Stock $nativeStock -Patched $nativeFinal
        $nativeAlignment | ConvertTo-Json -Depth 12 | Set-Content -LiteralPath (Join-Path $OutDir 'native-alignment.json') -Encoding UTF8
        if ($nativeAlignment.packagingDefects.Count -gt 0) { throw "Native packaging defects: $($nativeAlignment.packagingDefects -join ', ')" }
        if (-not $nativeAlignment.alignmentCompatible) { Write-Warning '[device] vendor ELF libraries remain incompatible with 16 KB pages.' }
        $deviceRun.SignedReady = $true
    }
} finally {
    Remove-Item -LiteralPath $argumentFile -Force -ErrorAction SilentlyContinue
    Remove-Item -LiteralPath $unsigned -Force -ErrorAction SilentlyContinue
    if (-not $deviceRun.SignedReady) { Remove-Item -LiteralPath $out -Force -ErrorAction SilentlyContinue }
    if ($mergeRequired) { Remove-Item -LiteralPath $mergedInput -Force -ErrorAction SilentlyContinue }
    # The CLI unpacks the whole APK here and a run against Threads leaves gigabytes behind.
    if (Test-Path -LiteralPath $temp) { Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue }
}
# The same report check the throwaway verification applies: every requested patch, every
# step, the target, and a real APK. The build that goes onto a phone deserves no less.
$report = $null
if (Test-Path -LiteralPath $result -PathType Leaf) { $report = Get-Content -LiteralPath $result -Raw | ConvertFrom-Json }
$validation = Test-PatchingReport -Report $report -ExpectedNames $names `
    -AllowedDependencyNames $dependencyNames -OutputPath $out `
    -ExpectedPackageName $target.PackageName -ExpectedPackageVersion $stock.versionName
if (-not $validation.Valid) { throw "Patching did not produce a complete APK: $($validation.Reason)" }
Write-Host "[device] applied $(@($report.appliedPatches).Count), failed $(@($report.failedPatches).Count), target $($report.packageName) $($report.packageVersion)"
Write-Host "[device] $out"

if (-not $Serial) { return }
$adb = (Get-Command adb -ErrorAction SilentlyContinue).Source
if (-not $adb) { $adb = Get-ChildItem "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Recurse -Filter adb.exe -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName }
if (-not $adb) { throw 'No adb found. Put it on the PATH or install the platform tools.' }
. (Join-Path $PSScriptRoot 'device-install.ps1')
Assert-HushThreadsDeviceLease -Adb $adb -Serial $Serial
Write-Host "[device] installing on $Serial"
# adb prints Failure [...] and exits non-zero on a refused install; without this the script
# went on to print the version of whatever was already on the phone, as if it were this build.
$install = Invoke-HushThreadsAdbCommand -Adb $adb -RequireLease -Arguments @('-s', $Serial, 'install', '-r', '-g', $out)
$install.Output | Out-Host
if ($install.ExitCode -ne 0) {
    if (($install.Output -join ' ') -match 'INSTALL_FAILED_UPDATE_INCOMPATIBLE') {
        throw "Signing key conflict on $Serial. Repatch with the installed key. No app was uninstalled or cleared."
    }
    throw "adb install failed on $Serial. The output above says why."
}
$installed = Invoke-HushThreadsAdbCommand -Adb $adb -RequireLease -Arguments @('-s', $Serial, 'shell', 'dumpsys', 'package', $target.PackageName)
if ($installed.ExitCode -ne 0) { throw "Could not read the installed package on $Serial." }
$installed.Output | Select-String 'versionName' | Out-Host
