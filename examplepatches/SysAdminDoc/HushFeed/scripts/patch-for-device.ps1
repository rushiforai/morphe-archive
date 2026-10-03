<#
.SYNOPSIS
    Patch the vendor APK with every Hushfeed patch, sign it, and optionally install it.

.DESCRIPTION
    verify-all-patches.ps1 answers whether the patches apply and throws its APK away. This
    keeps one, signed with the sideload keystore so it installs on a phone, and installs it
    over adb when a serial is given. The stock TikTok on the phone has a different signer, so
    it has to be uninstalled first; that is what -Replace does, and it wipes TikTok's data on
    that phone.

    Store and entry passwords can be supplied independently, including an empty store password
    for an exported BKS key. Unset passwords retain the local test-key defaults. Morphe produces
    an unsigned APK, then SDK apksigner signs it without copying or converting the key. Passwords
    travel through temporary process environment references and never through argument files.
    The key, output and installed APK certificates are checked before an in-place installation.
    Keep the key outside -OutDir. Keys and their copies or aliases are protected before output
    cleanup, and relative paths resolve from PowerShell's working folder.

    The vendor APK defaults to the build of the target version in the folder
    HUSHFEED_FIXTURE_DIR names. The desktop CLI is found through -DesktopJar,
    HUSHFEED_DESKTOP_JAR or HUSHFEED_WORKDIR, and Java through -Java, HUSHFEED_JAVA or
    JAVA_HOME. None of them has a machine-specific default.

.EXAMPLE
    scripts/patch-for-device.ps1 -Serial $env:HUSHFEED_DEVICE_SERIAL -Replace
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [switch]$Replace,
    # Print every line the desktop CLI writes, not only errors. The privacy patches say how
    # many call sites they intercepted, and a count of zero is the finding that matters.
    [switch]$ShowPatchLog,
    # Patch names to leave out of this build. The catalog applies everything, which puts the
    # optimizer strips on a test phone too, and "Remove creation tools" empties the video
    # editor's native libraries: the Create tab then dies in TENativeLibsLoader, so a camera
    # check needs a build without it.
    [string[]]$Exclude = @(),
    # Patch with the release bundle even when a source file is newer than it, for replaying
    # an earlier build on purpose. Without it a stale bundle stops the run.
    [switch]$AllowStaleBundle,
    [string]$Apk,
    [string]$DesktopJar,
    [string]$Java,
    [string]$Sdk = "$env:LOCALAPPDATA\Android\Sdk",
    [string]$Keystore = "$HOME\.android\sideload-release.jks",
    [string]$KeyAlias = 'sideload',
    [ValidateSet('BKS', 'JKS', 'PKCS12')][string]$KeystoreType,
    [AllowEmptyString()][string]$KeystorePassword,
    [AllowEmptyString()][string]$KeyPassword,
    [string]$OutDir = (Join-Path $env:TEMP 'hushfeed-device')
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'patch-report.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'apk-signing.ps1')
. (Join-Path $PSScriptRoot 'device-install.ps1')
$Java = Resolve-Java -Explicit $Java
$DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $root -Required
$catalogPath = Join-Path $root 'patches-list.json'
if (-not (Test-Path -LiteralPath $catalogPath -PathType Leaf)) { throw "No patch list found: $catalogPath" }
try { $catalog = Get-Content -LiteralPath $catalogPath -Raw | ConvertFrom-Json }
catch { throw "Could not read patch list ${catalogPath}: $($_.Exception.Message)" }
$target = Get-PatchTarget -PatchList $catalog
if (-not $Apk -and $env:HUSHFEED_FIXTURE_DIR -and (Test-Path -LiteralPath $env:HUSHFEED_FIXTURE_DIR -PathType Container)) {
    $Apk = (Get-ChildItem -LiteralPath $env:HUSHFEED_FIXTURE_DIR `
        -Filter "*$($target.PackageVersion)*.apk" -File | Select-Object -First 1).FullName
}
if (-not $Apk -or -not (Test-Path -LiteralPath $Apk -PathType Leaf)) {
    throw ("No vendor APK. Pass -Apk with a $(Format-VersionList -Versions @($target.PackageVersions)) build, or set " +
        'HUSHFEED_FIXTURE_DIR to the folder that holds one.')
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

$OutDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutDir)
$out = Join-Path $OutDir "hushfeed-$version-signed.apk"
$unsigned = Join-Path $OutDir "hushfeed-$version-unsigned.apk"
$temp = Join-Path $OutDir 'tmp'
$result = Join-Path $OutDir 'result.json'
$argumentFile = Join-Path $OutDir 'morphe-patch.args'
$signingSession = $null
$outputInitialized = $false
try {
$signingSession = New-ApkSigningSession -BoundParameters $PSBoundParameters -Root $root -Sdk $Sdk `
    -Java $Java -Keystore $Keystore -KeyAlias $KeyAlias -KeystoreType $KeystoreType -OutputDirectory $OutDir

New-Item -ItemType Directory -Force $OutDir | Out-Null
$outputInitialized = $true
if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }
if (Test-Path -LiteralPath $unsigned) { Remove-Item -LiteralPath $unsigned -Force }

Write-Host "[device] $($names.Count) patches from $(Split-Path -Leaf $bundle) onto $(Split-Path -Leaf $Apk)"
$enable = @()
foreach ($name in $names) { $enable += '-e'; $enable += $name }
$arguments = @('patch', '--exclusive', '--unsigned', '-p', $bundle, '-o', $unsigned, '-t', $temp, '-r', $result) + $enable + @($Apk)
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
# Windows PowerShell 5.1 turns a native command's stderr into a terminating error under Stop,
# even redirected, which lost the CLI's own failure lines. Relax for the call only.
$preference = $ErrorActionPreference
try {
    $ErrorActionPreference = 'Continue'
    & $Java -jar $DesktopJar "@$argumentFile" 2>&1 | ForEach-Object {
        $line = [string]$_
        if ($ShowPatchLog -or $line -match 'SEVERE|ERROR|Exception|Saved to') { Write-Host "[device] $line" }
    }
    $ErrorActionPreference = $preference
    if ($LASTEXITCODE -ne 0) { throw "The desktop CLI exited with $LASTEXITCODE" }
} finally {
    $ErrorActionPreference = $preference
    Remove-Item -LiteralPath $argumentFile -Force -ErrorAction SilentlyContinue
    # The CLI unpacks the whole APK here and a run against TikTok leaves gigabytes behind.
    if (Test-Path -LiteralPath $temp) { Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue }
}
# The same report check the throwaway verification applies: every requested patch, every
# step, the target, and a real APK. The build that goes onto a phone deserves no less.
$report = $null
if (Test-Path -LiteralPath $result -PathType Leaf) { $report = Get-Content -LiteralPath $result -Raw | ConvertFrom-Json }
$validation = Test-PatchingReport -Report $report -ExpectedNames $names `
    -AllowedDependencyNames $dependencyNames -OutputPath $unsigned `
    -ExpectedPackageName $target.PackageName -ExpectedPackageVersion (Get-DeclaredReportVersion -Report $report -Target $target)
if (-not $validation.Valid) { throw "Patching did not produce a complete APK: $($validation.Reason)" }
Invoke-ApkSigning -Session $signingSession -InputApk $unsigned -OutputApk $out
Write-Host "[device] applied $(@($report.appliedPatches).Count), failed $(@($report.failedPatches).Count), target $($report.packageName) $($report.packageVersion)"
Write-Host "[device] $out"

if (-not $Serial) { return }
$adb = (Get-Command adb -ErrorAction SilentlyContinue).Source
if (-not $adb) { $adb = Get-ChildItem "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Recurse -Filter adb.exe -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName }
if (-not $adb) { throw 'No adb found. Put it on the PATH or install the platform tools.' }
if ($Replace) {
    [void](Remove-AndroidPackageIfInstalled -Adb $adb -Serial $Serial -PackageName $target.PackageName)
} else {
    Assert-InstalledApkSigner -Adb $adb -Serial $Serial -PackageName $target.PackageName -SigningSession $signingSession
}
Write-Host "[device] installing on $Serial"
# adb prints Failure [...] and exits non-zero on a refused install; without this the script
# went on to print the version of whatever was already on the phone, as if it were this build.
$preference = $ErrorActionPreference
$ErrorActionPreference = 'Continue'
try {
    & $adb -s $Serial install -r -g $out 2>&1 | Out-Host
    $installStatus = $LASTEXITCODE
} finally {
    $ErrorActionPreference = $preference
}
if ($installStatus -ne 0) { throw "adb install failed on $Serial. The output above says why." }
& $adb -s $Serial shell dumpsys package $target.PackageName | Select-String 'versionName' | Out-Host
} finally {
    try {
        if ($outputInitialized) {
            Remove-Item -LiteralPath $argumentFile -Force -ErrorAction SilentlyContinue
            if (Test-Path -LiteralPath $unsigned) { Remove-Item -LiteralPath $unsigned -Force }
        }
    } finally { Close-ApkSigningSession -Session $signingSession }
}
