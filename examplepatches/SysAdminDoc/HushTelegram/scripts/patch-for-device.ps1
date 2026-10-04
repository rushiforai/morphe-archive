<#
.SYNOPSIS
    Patch the vendor APK with every HushTelegram patch, sign it, and optionally install it.

.DESCRIPTION
    verify-all-patches.ps1 answers whether the patches apply and throws its APK away. This
    keeps one, signed with the sideload keystore so it installs on a phone, and installs it
    over adb when a serial is given. Installation requires an owned whole-device lease and
    an exact model/profile. Existing apps must have the same signer and no newer version.
    The script never uninstalls an app or grants runtime permissions.

    The signing password comes from HUSHTELEGRAM_SIDELOAD_KEYSTORE_PASSWORD. When it is unset, the
    local test keystore's documented password, sideload, is used. The Morphe arguments travel
    through a temporary Java argument file so the password value is not in the child process
    command line. The file is deleted when patching exits.

    The vendor APK defaults to the newest declared build in the folder HUSHTELEGRAM_FIXTURE_DIR
    names. -Apk takes any build the catalog declares, and the result is held to that APK's own
    version, read with aapt2. A build the catalog doesn't declare is refused before anything is
    patched. The desktop CLI is found through -DesktopJar, HUSHTELEGRAM_DESKTOP_JAR or
    HUSHTELEGRAM_WORKDIR, Java through -Java, HUSHTELEGRAM_JAVA or JAVA_HOME, and aapt2 through
    -Aapt2, HUSHTELEGRAM_AAPT2 or the SDK. None of them has a machine-specific default.

.EXAMPLE
    scripts/patch-for-device.ps1 -Serial $env:HUSHTELEGRAM_DEVICE_SERIAL -ExpectedModel $env:HUSHTELEGRAM_DEVICE_MODEL
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [switch]$Replace,
    [string]$LeaseDirectory = $env:HUSHTELEGRAM_DEVICE_LEASE_DIR,
    [string]$LeaseToken = $env:HUSHTELEGRAM_DEVICE_LEASE_TOKEN,
    [string]$ChatIdentity = $env:HUSHTELEGRAM_DEVICE_CHAT,
    [string]$ExpectedModel,
    [string]$ExpectedAvd,
    # Print every line the desktop CLI writes, not only errors.
    [switch]$ShowPatchLog,
    # Patch names to leave out of this build. The catalog applies everything, including any patch
    # that is off by default, so a check of what Telegram does without one of them needs a build
    # that leaves it out.
    [string[]]$Exclude = @(),
    # Patch with the release bundle even when a source file is newer than it, for replaying
    # an earlier build on purpose. Without it a stale bundle stops the run.
    [switch]$AllowStaleBundle,
    [string]$Apk,
    # Used only to choose a default fixture. An explicit APK selects its declared native package.
    [string]$PackageName,
    [string]$DesktopJar,
    [string]$Java,
    [string]$Aapt2,
    [string]$Keystore = "$HOME\.android\sideload-release.jks",
    [string]$KeyAlias = 'sideload',
    [string]$OutDir = (Join-Path $env:TEMP 'hushtelegram-device'),
    # The checkout whose catalog and release bundle are used, the one holding this script unless
    # given. The contract tests point it at a fixture.
    [string]$Root
)

$ErrorActionPreference = 'Stop'
if ($Replace) { throw '-Replace is no longer supported. Keep app data and use the retained signing key for updates.' }
if ($Serial -and (-not $LeaseDirectory -or -not $LeaseToken -or -not $ChatIdentity -or -not $ExpectedModel)) {
    throw 'Installation requires the shared lease directory, owned token, chat identity and expected device model.'
}
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
. (Join-Path $PSScriptRoot 'device-install.ps1')
$Java = Resolve-Java -Explicit $Java
$DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $root -Required
$catalogPath = Join-Path $root 'patches-list.json'
if (-not (Test-Path -LiteralPath $catalogPath -PathType Leaf)) { throw "No patch list found: $catalogPath" }
try { $catalog = Get-Content -LiteralPath $catalogPath -Raw | ConvertFrom-Json }
catch { throw "Could not read patch list ${catalogPath}: $($_.Exception.Message)" }
$target = Get-PatchTarget -PatchList $catalog -PackageName $PackageName
if (-not $Apk -and $env:HUSHTELEGRAM_FIXTURE_DIR -and (Test-Path -LiteralPath $env:HUSHTELEGRAM_FIXTURE_DIR -PathType Container)) {
    $fixtureNames = @(foreach ($code in @($target.PackageVersionCodes[$target.PackageVersion])) {
        Get-VendorFixtureName -Target $target -VersionName $target.PackageVersion -VersionCode $code
    })
    $matching = @(Get-ChildItem -LiteralPath $env:HUSHTELEGRAM_FIXTURE_DIR -File |
        Where-Object { $fixtureNames -ccontains $_.Name })
    if ($matching.Count -gt 1) { throw 'More than one declared default fixture is present. Pass an exact -Apk.' }
    if ($matching.Count -eq 1) { $Apk = $matching[0].FullName }
}
if (-not $Apk -or -not (Test-Path -LiteralPath $Apk -PathType Leaf)) {
    throw ("No vendor APK. Pass -Apk with the $($target.PackageVersion) build, or set " +
        'HUSHTELEGRAM_FIXTURE_DIR to the folder that holds it.')
}
# The version the result is held to: the vendor APK's own, read the way verify-all-patches.ps1
# and the receipt read it. The catalog can declare more than one build and the CLI reports the
# version of the APK it was given, so holding every run to the newest build failed an older build
# after it had been patched (the Facebook sibling's 577). A build the catalog doesn't declare is
# refused here: without -f the CLI refuses it too, but only after unpacking it, and this is the
# APK that goes on a phone.
$Aapt2 = Resolve-Aapt2 -Explicit $Aapt2 -Root $root
$stockBase = Resolve-WithinRoot -Root $OutDir -Path (Join-Path $OutDir 'stock-base.apk')
try {
    $stock = Get-ApkManifestFacts -Apk (Get-BaseApk -Apk $Apk -Destination $stockBase) -Aapt2 $Aapt2
} finally {
    # Only the copy taken out of a bundle. A plain APK is read where it is and stays there.
    Remove-GeneratedPath -Root $OutDir -Path $stockBase -NoRecurse
}
if ($PackageName -and $stock.package -cne $PackageName) {
    throw "$(Split-Path -Leaf $Apk) is $($stock.package), not the catalog's target $($target.PackageName)."
}
$target = Get-PatchTarget -PatchList $catalog -PackageName ([string]$stock.package)
# Its version code as well: another arm64 build of a declared version has its own dex, and nothing
# proved the patches on it.
if (-not (Test-DeclaredBuild -Target $target -VersionName ([string]$stock.versionName) -VersionCode ([string]$stock.versionCode))) {
    throw ("$(Split-Path -Leaf $Apk) is $($stock.package) $($stock.versionName), which the bundle does not " +
        "declare, at version code $($stock.versionCode). It declares $(Format-DeclaredBuilds -Target $target). " +
        'Build for a phone from a declared build; scripts/verify-all-patches.ps1 -Force shows what still applies on another one.')
}
$passwordVariable = 'HUSHTELEGRAM_SIDELOAD_KEYSTORE_PASSWORD'
$keystorePassword = [Environment]::GetEnvironmentVariable(
    $passwordVariable, [EnvironmentVariableTarget]::Process)
if ([string]::IsNullOrEmpty($keystorePassword)) {
    $keystorePassword = 'sideload'
    Write-Host "[device] $passwordVariable is unset; using the documented local test-key fallback"
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
$out = Resolve-WithinRoot -Root $OutDir -Path (Join-Path $OutDir "hushtelegram-$version-signed.apk")
$temp = Resolve-WithinRoot -Root $OutDir -Path (Join-Path $OutDir 'tmp')
$result = Resolve-WithinRoot -Root $OutDir -Path (Join-Path $OutDir 'result.json')
$summaryPath = Resolve-WithinRoot -Root $OutDir -Path (Join-Path $OutDir 'public-summary.json')
if (Test-Path $out) { Remove-Item $out -Force }

Write-Host "[device] $($names.Count) patches from $(Split-Path -Leaf $bundle) onto $(Split-Path -Leaf $Apk)"
$enable = @()
foreach ($name in $names) { $enable += '-e'; $enable += $name }
$arguments = @('patch', '--exclusive', '-p', $bundle, '-o', $out, '-t', $temp, '-r', $result,
    '--keystore', $Keystore, '--keystore-password', $keystorePassword,
    '--keystore-entry-alias', $KeyAlias, '--keystore-entry-password', $keystorePassword) + $enable + @($Apk)
$argumentFile = Resolve-WithinRoot -Root $OutDir -Path (Join-Path $OutDir 'morphe-patch.args')
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
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        & $Java -jar $DesktopJar "@$argumentFile" 2>&1 | ForEach-Object {
            $line = [string]$_
            if ($ShowPatchLog) { Write-Host "[device] $line" }
        }
        $cliExitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $preference
    }
    $public = Export-PublicPatchSummary -ReportPath $result -SummaryPath $summaryPath -PatchList $catalog `
        -RequestedNames $names -BundleVersion $version -OutputPath $out -CliExitCode $cliExitCode `
        -ExpectedPackageName $target.PackageName -ExpectedPackageVersion $stock.versionName
    if (-not $public.Written) { throw $public.FailureCode }
    Write-Host '[device] public-summary.json contains the shareable patch summary'
    if ($cliExitCode -ne 0) { throw ('Patching failed: ' + ($public.Summary.failureCodes -join ', ')) }
} finally {
    Remove-GeneratedPath -Root $OutDir -Path $argumentFile -NoRecurse
    # The CLI unpacks the whole APK here and a run against Telegram leaves gigabytes behind.
    Remove-GeneratedPath -Root $OutDir -Path $temp
}
# The same report check the throwaway verification applies: every requested patch, every
# step, the target, and a real APK. The build that goes onto a phone deserves no less.
$report = $null
if (Test-Path -LiteralPath $result -PathType Leaf) {
    try { $report = Get-Content -LiteralPath $result -Raw | ConvertFrom-Json } catch { throw 'REPORT_INVALID' }
}
$validation = Test-PatchingReport -Report $report -ExpectedNames $names `
    -AllowedDependencyNames $dependencyNames -OutputPath $out `
    -ExpectedPackageName $target.PackageName -ExpectedPackageVersion $stock.versionName
if (-not $validation.Valid) { throw ('Patching failed: ' + ($public.Summary.failureCodes -join ', ')) }
Write-Host "[device] applied $(@($report.appliedPatches).Count), failed $(@($report.failedPatches).Count), target $($report.packageName) $($report.packageVersion)"
Write-Host "[device] $out"

if (-not $Serial) { return }
$adb = (Get-Command adb -ErrorAction SilentlyContinue).Source
if (-not $adb) { $adb = Get-ChildItem "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Recurse -Filter adb.exe -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName }
if (-not $adb) { throw 'No adb found. Put it on the PATH or install the platform tools.' }
Install-AndroidPackage -Adb $adb -Serial $Serial -PackageName $target.PackageName -Apk $out `
    -Aapt2 $Aapt2 -LeaseDirectory $LeaseDirectory -LeaseToken $LeaseToken -ChatIdentity $ChatIdentity -ExpectedModel $ExpectedModel `
    -ExpectedAvd $ExpectedAvd -WorkDirectory $OutDir
