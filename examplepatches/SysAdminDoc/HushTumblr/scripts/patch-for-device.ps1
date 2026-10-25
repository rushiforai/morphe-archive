<#
.SYNOPSIS
    Patch the vendor APK with every HushTumblr patch, sign it, and optionally install it.

.DESCRIPTION
    verify-all-patches.ps1 answers whether the patches apply and throws its APK away. This
    keeps one, signed with the sideload keystore so it installs on a phone, and installs it
    over adb when a serial is given. Installs require an exclusive whole-device lease and matching
    signers. Existing accounts, permissions and keys are preserved. Stock installs are refused.

    The signing password comes from HUSHTUMBLR_SIDELOAD_KEYSTORE_PASSWORD. When it is unset, the
    local test keystore's documented password, sideload, is used. A key whose own password differs
    from the store's takes it from HUSHTUMBLR_SIDELOAD_KEY_PASSWORD, and -NoStorePassword signs
    with a store that has none, like the morphe.keystore Morphe makes. The Morphe arguments travel
    through a temporary Java argument file so the password value is not in the child process
    command line. The file is deleted when patching exits.

    The vendor APK defaults to the newest declared build in the folder HUSHTUMBLR_FIXTURE_DIR
    names. -Apk takes any build the catalog declares, and the result is held to that APK's own
    version, read with aapt2. A build the catalog doesn't declare is refused before anything is
    patched. The desktop CLI is found through -DesktopJar, HUSHTUMBLR_DESKTOP_JAR or
    HUSHTUMBLR_WORKDIR, Java through -Java, HUSHTUMBLR_JAVA or JAVA_HOME, and aapt2 through
    -Aapt2, HUSHTUMBLR_AAPT2 or the SDK. None of them has a machine-specific default.

    When the release push gate has already patched this exact bundle onto this APK with the same
    patch selection, tools and verifier files, and kept the run (verify-all-patches.ps1 -KeepIn),
    that run's patched APK is signed with apksigner beside aapt2 and handed back instead of patching
    again. A BKS keystore, which apksigner.bat can't read, is signed through lib/apksigner.jar with
    the desktop CLI's BouncyCastle as its provider. The report and manifest checks below still run on it. The store is -AppliedDir, else
    HUSHTUMBLR_APPLY_RECORDS, else the default one in the temp folder; -NoReuse always patches.
    Nothing this script makes is kept there: it skips the resource table check.

    -Option gives a named patch an option value, written 'Patch name:key=value'. The CLI gets it as
    -O right after that patch's -e. A kept gate run was patched with the options as the bundle ships
    them and its key doesn't cover them, so a run with -Option always patches.

    The signed APK has to pass zipalign -c -P 16 -v 4, with the zipalign beside aapt2, and its
    64-bit libraries have to be Tumblr's own bytes (Assert-PageAlignment). A kept APK is held to
    that before it's signed as well. A library of Tumblr's that doesn't fit 16 KB pages is printed
    as a warning naming it a target limitation, and is never rewritten.

    Whichever signed it, the APK has to verify with apksigner as signed by -KeyAlias's certificate
    in -Keystore and no other, read with the keytool of the runtime java starts (a BKS store through
    the desktop CLI's BouncyCastle provider), before it's copied to -OutputApk or installed. The
    keystore is held from that read, before anything signs, to the end of the run, so nothing can
    swap the key between signing and the check.

.EXAMPLE
    scripts/patch-for-device.ps1 -Serial $env:HUSHTUMBLR_DEVICE_SERIAL
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [switch]$Replace,
    [string]$LeaseToken = $env:HUSHTUMBLR_DEVICE_LEASE_TOKEN,
    [string]$LeaseDirectory = $env:HUSHTUMBLR_DEVICE_LEASE_DIR,
    [string]$ChatIdentity = $env:HUSHTUMBLR_CHAT_ID,
    # Print every line the desktop CLI writes, not only errors.
    [switch]$ShowPatchLog,
    # Patch names to leave out of this build. The catalog applies everything, including any patch
    # that is off by default, so a check of what Tumblr does without one of them needs a build
    # that leaves it out.
    [string[]]$Exclude = @(),
    # Option values for named patches, each written 'Patch name:key=value', like
    # 'Dark background color:backgroundColor=#121212'. Without one a patch keeps the bundle's default.
    [string[]]$Option = @(),
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
    # The keystore has no store password. Its key's password then comes from
    # HUSHTUMBLR_SIDELOAD_KEY_PASSWORD.
    [switch]$NoStorePassword,
    [string]$OutDir = (Join-Path $env:TEMP 'hushtumblr-device'),
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
# The keystore likewise: Open-HeldFile holds it by [IO.File] and the signers read it by that path.
$OutDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutDir)
$Keystore = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Keystore)
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'patch-report.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
. (Join-Path $PSScriptRoot 'apk-provenance.ps1')
$Java = Resolve-Java -Explicit $Java
$DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $root -Required
$catalogPath = Join-Path $root 'patches-list.json'
if (-not (Test-Path -LiteralPath $catalogPath -PathType Leaf)) { throw "No patch list found: $catalogPath" }
$catalogHeld = Open-HeldFile -Path $catalogPath -What 'The device patch catalog'
try {
    $catalog = Get-Content -LiteralPath (Get-HeldPath $catalogHeld) -Raw | ConvertFrom-Json
    $catalogDigest = Get-StreamSha256 $catalogHeld
} catch { throw "Could not read patch list ${catalogPath}: $($_.Exception.Message)" }
finally { $catalogHeld.Dispose(); $catalogHeld = $null }
$target = Get-PatchTarget -PatchList $catalog
if (-not $Apk -and $env:HUSHTUMBLR_FIXTURE_DIR -and (Test-Path -LiteralPath $env:HUSHTUMBLR_FIXTURE_DIR -PathType Container)) {
    $Apk = (Get-ChildItem -LiteralPath $env:HUSHTUMBLR_FIXTURE_DIR `
        -File | Where-Object { $_.Name -like "*$($target.PackageVersion)*" -and $_.Extension -in '.apk', '.apkm', '.xapk' } |
        Sort-Object @{ Expression = { $_.Extension -ne '.apk' } }, Name | Select-Object -First 1).FullName
}
if (-not $Apk -or -not (Test-Path -LiteralPath $Apk -PathType Leaf)) {
    throw ("No vendor APK. Pass -Apk with the $($target.PackageVersion) build, or set " +
        'HUSHTUMBLR_FIXTURE_DIR to the folder that holds it.')
}
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
$patchInput = $null
$recorded = $null
$outHandle = $null
$resultHandle = $null
$reservedHandle = $null
$bundleHeld = $null
$keystoreHeld = $null
try {
$catalogHeld = Open-HeldFile -Path $catalogPath -Sha256 $catalogDigest -What 'The device patch catalog'
if ($OutputApk) {
    $reservedPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputApk)
    if (-not (Test-Path -LiteralPath (Split-Path -Parent $reservedPath) -PathType Container)) {
        throw 'The explicit APK destination directory does not exist.'
    }
    try { $outputReservation = [IO.File]::Open($reservedPath, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None) }
    catch [IO.IOException] { throw 'The explicit APK destination already exists or is owned by another run. No output was overwritten.' }
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
$passwordVariable = 'HUSHTUMBLR_SIDELOAD_KEYSTORE_PASSWORD'
$keyPasswordVariable = 'HUSHTUMBLR_SIDELOAD_KEY_PASSWORD'
if ($NoStorePassword) {
    $keystorePassword = ''
} else {
    $keystorePassword = [Environment]::GetEnvironmentVariable(
        $passwordVariable, [EnvironmentVariableTarget]::Process)
    if ([string]::IsNullOrEmpty($keystorePassword)) {
        $keystorePassword = 'sideload'
        Write-Host "[device] $passwordVariable is unset; using the documented local test-key fallback"
    }
}
# The key's own password, the store's unless the key has one of its own.
$keyPassword = [Environment]::GetEnvironmentVariable($keyPasswordVariable, [EnvironmentVariableTarget]::Process)
if ([string]::IsNullOrEmpty($keyPassword)) { $keyPassword = $keystorePassword }
# The alias's certificate, off the keystore held from then to the end of the run, so the key that
# signs the APK and the certificate the check below holds it to come from the same bytes. Read
# here, before anything signs, or at the check when the CLI made the keystore on its first run.
# Dot-sourced, so what it sets is the script's.
$readKeystore = {
    if (Test-Path -LiteralPath $Keystore -PathType Leaf) {
        $keystoreHeld = Open-HeldFile -Path $Keystore -What 'The keystore'
        $Keystore = Get-HeldPath -Stream $keystoreHeld
    }
    $keyCertificate = Get-KeystoreCertificate -Keystore $Keystore -Alias $KeyAlias -Password $keystorePassword -Java $Java -DesktopJar $DesktopJar
}
if (Test-Path -LiteralPath $Keystore -PathType Leaf) { . $readKeystore }
$version = Get-BundleVersion -Root $root
$bundle = Get-ReleaseBundlePath -Root $root -Version $version
if (-not (Test-Path $bundle)) { throw "No bundle at $bundle. Build it first: :patches:generatePatchesList then :patches:buildAndroid, through the governor." }
# Held from here to the end of the run: the applied record's key, the CLI and the register check's
# comparison with the bundle's extensions all read these bytes, and nothing can write them between.
$bundleHeld = Open-HeldFile -Path $bundle -What 'The bundle'
$bundle = Get-HeldPath -Stream $bundleHeld
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
# Each -Option is held to the catalog before anything is merged or patched: the patch has to be in
# this build and has to declare the key. The CLI ignores an option it can't place, and the APK
# would then read as a verdict on a value it never got.
$patchOptions = @{}
foreach ($entry in $Option) {
    $parsed = [regex]::Match([string]$entry, '^(?<patch>.+?):(?<key>[A-Za-z][A-Za-z0-9_]*)=(?<value>.*)$')
    if (-not $parsed.Success) { throw "-Option takes 'Patch name:key=value', not '$entry'." }
    $optionPatch = $parsed.Groups['patch'].Value
    $optionKey = $parsed.Groups['key'].Value
    $declaring = @($catalog.patches | Where-Object { $_.name -ceq $optionPatch })
    if ($declaring.Count -ne 1 -or $optionPatch -notin $names) { throw "No patch named '$optionPatch' in this build to give an option to." }
    $declaredKeys = @($declaring[0].options | ForEach-Object { [string]$_.key })
    if ($optionKey -cnotin $declaredKeys) {
        throw "$optionPatch has no option '$optionKey'. It declares: $(if ($declaredKeys.Count) { $declaredKeys -join ', ' } else { 'none' })."
    }
    if (-not $patchOptions.ContainsKey($optionPatch)) { $patchOptions[$optionPatch] = @() }
    $patchOptions[$optionPatch] += "$optionKey=$($parsed.Groups['value'].Value)"
    Write-Host "[device] option for ${optionPatch}: $optionKey=$($parsed.Groups['value'].Value)"
}
# A kept gate run was patched with every option as the bundle ships it.
if ($patchOptions.Count -gt 0) { $NoReuse = $true }
$dependencyNames = @(Get-PatchDependencyNames -PatchList $catalog -RequestedNames $names)

New-Item -ItemType Directory -Force $OutDir | Out-Null
$out = Join-Path $OutDir "hushtumblr-$version-signed.apk"
$temp = Join-Path $OutDir 'tmp'
$result = Join-Path $OutDir 'result.json'
if (Test-Path -LiteralPath $out) { throw 'The new run already has an APK output.' }

Write-Host "[device] $($names.Count) patches from $(Split-Path -Leaf $bundle) onto $(Split-Path -Leaf $Apk)"
# Every APK the merge is made from, or the plain APK, has to carry Tumblr's declared signer
# (Get-MergedApk), before anything is merged, signed or installed.
# It comes back held: nothing can write to it or put another file in its place until the finally,
# through the patch or signing run and every check that reads it, and the path is its real one.
$declaredSigners = @(Get-DeclaredSigners -PatchList $catalog -PackageName $target.PackageName)
$patchInput = Get-MergedApk -Apk $Apk -Destination (Join-Path $OutDir 'stock-merged.apk') `
    -Java $Java -DesktopJar $DesktopJar -Aapt2 $Aapt2 -PackageName $target.PackageName -Signers $declaredSigners
$stockManifest = Get-ApkManifestFacts -Apk $patchInput -Aapt2 $Aapt2
# The build this run was let through on was read off the base APK before anything was checked. It
# has to be the build of the APK that is held now (Assert-SameBuild).
Assert-SameBuild -Decided $stock -Held $stockManifest -Label (Split-Path -Leaf $Apk)

# A gate run that patched this exact bundle onto this APK with these patches and passed every check,
# as verify-all-patches.ps1 -KeepIn keeps it. Nothing is hashed while the store holds no record.
$recorded = $null
if (-not $NoReuse) {
    $store = Get-AppliedRecordStore -Path $AppliedDir
    if (@(Get-AppliedRecords -Store $store).Count -gt 0) {
        $hostStubs = Resolve-HostReferenceStubs -AndroidJar $AndroidJar -ApiVersions $ApiVersions -Aapt2 $Aapt2
        $AndroidJar = $hostStubs.AndroidJar
        $ApiVersions = $hostStubs.ApiVersions
        # Keyed on what the merge held above was made from, and the kept APK comes back held to the
        # digest it was kept with, through the signing below (Find-AppliedRecord).
        $identity = Get-AppliedRecordKey -Bundle $bundle -InputIdentity (Get-HeldInputIdentity -Merged $patchInput) `
            -PatchList $catalogPath -PatchNames $names -Forced $false -DesktopJar $DesktopJar -AndroidJar $AndroidJar `
            -ApiVersions $ApiVersions
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
    # apksigner.bat can't read the BKS store the desktop CLI makes (morphe.keystore): it stops at
    # "toDerInputStream rejects tag type 0". When it fails, the same signer runs from its jar with the
    # CLI's BouncyCastle as the keystore provider, as Get-KeystoreCertificate reads that store.
    $apksignerJar = Join-Path (Join-Path (Split-Path -Parent $Aapt2) 'lib') 'apksigner.jar'
    # zipalign can't put an APK right once it's signed, so the kept one is held to the 16 KB layout
    # before the signature goes on. The signed APK is held to it again below.
    Assert-PageAlignment -Apk $recorded.PatchedApk -Stock $patchInput -Aapt2 $Aapt2 | Out-Null
    $savedPassword = [Environment]::GetEnvironmentVariable($passwordVariable, [EnvironmentVariableTarget]::Process)
    $savedKeyPassword = [Environment]::GetEnvironmentVariable($keyPasswordVariable, [EnvironmentVariableTarget]::Process)
    # An empty password can't go through the environment, which drops a variable set to nothing.
    $storePass = if ($keystorePassword) { "env:$passwordVariable" } else { 'pass:' }
    $keyPass = if ($keyPassword) { "env:$keyPasswordVariable" } else { 'pass:' }
    $preference = $ErrorActionPreference
    try {
        [Environment]::SetEnvironmentVariable($passwordVariable, $keystorePassword, [EnvironmentVariableTarget]::Process)
        [Environment]::SetEnvironmentVariable($keyPasswordVariable, $keyPassword, [EnvironmentVariableTarget]::Process)
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $signOutput = @(& $apksigner sign --ks $Keystore --ks-key-alias $KeyAlias --ks-pass $storePass `
            --key-pass $keyPass --out $out $recorded.PatchedApk 2>&1 | ForEach-Object { "$_" })
        $signExitCode = $LASTEXITCODE
        if ($signExitCode -ne 0 -and (Test-Path -LiteralPath $apksignerJar -PathType Leaf)) {
            if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }
            $global:LASTEXITCODE = -1
            $bksOutput = @(& $Java -cp ($apksignerJar + [IO.Path]::PathSeparator + $DesktopJar) com.android.apksigner.ApkSignerTool sign `
                --provider-class org.bouncycastle.jce.provider.BouncyCastleProvider --ks-type BKS --ks-provider-name BC `
                --ks $Keystore --ks-key-alias $KeyAlias --ks-pass $storePass --key-pass $keyPass --out $out `
                $recorded.PatchedApk 2>&1 | ForEach-Object { "$_" })
            $bksExitCode = $LASTEXITCODE
            if ($bksExitCode -eq 0) {
                $signExitCode = 0
            } else {
                $signOutput += @("then as a BKS keystore (exit $bksExitCode):") + $bksOutput
            }
        }
    } finally {
        $ErrorActionPreference = $preference
        # Unset again when it was: PowerShell hands $null over as '', which PowerShell 7 keeps.
        [Environment]::SetEnvironmentVariable($passwordVariable, $(if ($null -eq $savedPassword) { [NullString]::Value } else { $savedPassword }),
            [EnvironmentVariableTarget]::Process)
        [Environment]::SetEnvironmentVariable($keyPasswordVariable, $(if ($null -eq $savedKeyPassword) { [NullString]::Value } else { $savedKeyPassword }),
            [EnvironmentVariableTarget]::Process)
    }
    if ($signExitCode -ne 0 -or -not (Test-Path -LiteralPath $out -PathType Leaf)) {
        throw "apksigner could not sign the kept APK (exit $signExitCode): $($signOutput -join ' ')"
    }
    # The copy is the run's output, for whoever reads it afterwards. The check below reads the kept
    # report through the path its held handle is at, since nothing holds the copy.
    Copy-Item -LiteralPath $recorded.Result -Destination $result
    $reportPath = $recorded.Result
} else {
$enable = @()
foreach ($name in $names) {
    $enable += '-e'; $enable += $name
    # The CLI reads -O as an option of the patch enabled just before it.
    if ($patchOptions.ContainsKey($name)) { foreach ($pair in $patchOptions[$name]) { $enable += '-O'; $enable += $pair } }
}
$arguments = @('patch', '--exclusive', '-p', $bundle, '-o', $out, '-t', $temp, '-r', $result,
    '--keystore', $Keystore, "--keystore-password=$keystorePassword",
    '--keystore-entry-alias', $KeyAlias, "--keystore-entry-password=$keyPassword") + $enable + @($patchInput)
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
    # The run waits for a slot in the machine's build queue first (Enter-HushTumblrQueue).
    $preference = $ErrorActionPreference
    $queued = Enter-HushTumblrQueue -Job 'device patch'
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
        Exit-HushTumblrQueue $queued
    }
    if ($cliExitCode -ne 0) { throw "The desktop CLI exited with $cliExitCode" }
} finally {
    if (-not (Test-Path -LiteralPath $ownerFile -PathType Leaf) -or [IO.File]::ReadAllText($ownerFile) -cne $runToken) {
        throw 'Patch workspace ownership changed. Argument cleanup refused.'
    }
    Remove-Item -LiteralPath $argumentFile -Force -ErrorAction SilentlyContinue
}
# The CLI's report is held from the moment it exits and read by the path its handle is at. One
# that wasn't there to hold is no report, whatever is at the path later.
if (Test-Path -LiteralPath $result -PathType Leaf) {
    $resultHandle = Open-HeldFile -Path $result -What 'The result report'
    $reportPath = Get-HeldPath -Stream $resultHandle
} else {
    $reportPath = $null
}
}
# The signed APK is held from here to the install, the copy to -OutputApk included, and every
# check reads it by the path its handle is at: nothing can swap it once it's been checked.
if (Test-Path -LiteralPath $out -PathType Leaf) {
    $outHandle = Open-HeldFile -Path $out -What 'The signed APK'
    $out = Get-HeldPath -Stream $outHandle
}
if ($recorded -and $null -ne $outHandle) {
    # Signing adds signature files and changes nothing else, so the signed APK has to hold the kept
    # one's entries, byte for byte, and nothing more: apksigner wrote it to a path nothing held. It
    # drops stamp-cert-sha256 too, the Play Source Stamp's certificate digest, since a stamp doesn't
    # survive signing again, so that one may be gone and may not be other bytes.
    $keptEntries = Get-ApkEntryDigests -File ([pscustomobject]@{ Member = 'The kept APK'; Handle = $recorded.Handle }) -Pattern '.'
    $signedEntries = Get-ApkEntryDigests -File ([pscustomobject]@{ Member = 'The signed APK'; Handle = $outHandle }) -Pattern '.'
    $stamp = 'stamp-cert-sha256'
    $isSigners = { param([string]$Name) $Name -ceq $stamp -or $Name -cmatch '^META-INF/(MANIFEST\.MF|[A-Za-z0-9._-]+\.(SF|RSA|DSA|EC))\z' }
    $unsigned = { param($Entries) @(foreach ($pair in $Entries.GetEnumerator()) { if (-not (& $isSigners $pair.Key)) { "$($pair.Key)=$($pair.Value)" } }) -join "`n" }
    if ((& $unsigned $signedEntries) -cne (& $unsigned $keptEntries) -or
        ($signedEntries.ContainsKey($stamp) -and (-not $keptEntries.ContainsKey($stamp) -or $signedEntries[$stamp] -cne $keptEntries[$stamp]))) {
        throw 'The signed APK holds other entries than the kept APK it was signed from, beyond the signature files.'
    }
}
# The same report check the throwaway verification applies: every requested patch, every
# step, the target, and a real APK. The build that goes onto a phone deserves no less. Only
# what is held is read: an APK that wasn't there to hold is no APK.
$report = $null
if ($reportPath) { $report = Get-Content -LiteralPath $reportPath -Raw | ConvertFrom-Json }
$validation = Test-PatchingReport -Report $report -ExpectedNames $names `
    -AllowedDependencyNames $dependencyNames -OutputPath $(if ($null -ne $outHandle) { $out } else { '' }) `
    -ExpectedPackageName $target.PackageName -ExpectedPackageVersion $stock.versionName
if (-not $validation.Valid) { throw "Patching did not produce a complete APK: $($validation.Reason)" }
# Whoever signed it, the APK that goes on a phone is signed by the keystore alias's key and no other.
# The kept-run comparison above skips the signature files and the v2 and v3 blocks aren't entries,
# and the CLI's output was written to a path nothing held, so another key's build, or an unsigned
# one, would pass everything else here.
if ($null -eq $keystoreHeld) { . $readKeystore }
$signedBy = Get-ApkSigners -Apk $out -Apksigner (Resolve-Apksigner -Aapt2 $Aapt2)
if (-not $signedBy.Verified -or (@($signedBy.Signers) -join ', ') -cne $keyCertificate) {
    throw "The signed APK isn't signed by the $KeyAlias key of $(Split-Path -Leaf $Keystore) ($keyCertificate) alone: apksigner says $($signedBy.Said)"
}
$manifestSelection = @($names) + @($dependencyNames)
$approvedChanges = @(Read-ManifestDeltaAllowlist -Path (Join-Path $PSScriptRoot 'manifest-delta-allowlist.txt') `
    -SelectedPatchNames $manifestSelection)
$patchedManifest = Get-ApkManifestFacts -Apk $out -Aapt2 $Aapt2
$manifestCheck = Test-ManifestDelta -Stock $stockManifest -Patched $patchedManifest `
    -SelectedPatchNames $manifestSelection -ApprovedManifestDelta $approvedChanges
if (-not $manifestCheck.Valid) { throw "Patching changed an unapproved compiled manifest fact: $($manifestCheck.Reason)" }
# What a phone with 16 KB pages needs of the signed APK: a ZIP layout zipalign -c -P 16 -v 4 passes
# and 64-bit libraries that are still Tumblr's bytes (Assert-PageAlignment). A library of Tumblr's
# own that doesn't fit is the target's limit, named here whatever the signature says.
foreach ($limit in @(Assert-PageAlignment -Apk $out -Stock $patchInput -Aapt2 $Aapt2)) { Write-Warning "[device] $limit" }
if ($recorded) {
    # Signing adds a signature block and leaves the dex alone, and these dex passed DexDiff and the
    # host reference check when the gate kept the run.
    Write-Host '[device] the structural and host reference checks passed on this dex in the kept run'
} else {
# The rebuilt resource table against the merge's, and every archive entry patching doesn't write
# against the merge's bytes: the CLI rebuilt a copy of the merge nothing held while it was copied.
# What the table and its files changed is held to resource-delta-allowlist.txt, for the patches
# this build selected.
$resourceReport = Join-Path $OutDir 'resources.txt'
$preference = $ErrorActionPreference
$selectionBefore = $env:HUSHTUMBLR_PATCH_SELECTION
$queued = Enter-HushTumblrQueue -Job 'device resources'
try {
    $ErrorActionPreference = 'Continue'
    $env:HUSHTUMBLR_PATCH_SELECTION = (@($names) + @($dependencyNames)) -join "`n"
    $global:LASTEXITCODE = -1
    $resourceOutput = @(& $Java '-Xmx4g' '-cp' $DesktopJar (Join-Path $PSScriptRoot 'ResourceTableCheck.java') `
        $patchInput $out $resourceReport (Join-Path $PSScriptRoot 'resource-delta-allowlist.txt') 2>&1)
    $resourceExitCode = $LASTEXITCODE
} finally {
    $env:HUSHTUMBLR_PATCH_SELECTION = $selectionBefore
    $ErrorActionPreference = $preference
    Exit-HushTumblrQueue $queued
}
$resourceOutput | ForEach-Object { Write-Host "[device] $_" }
if ($resourceExitCode -ne 0) {
    throw ("The patched resource table or archive failed its check against the merge (exit $resourceExitCode). " +
        "Report: $resourceReport. $(@($resourceOutput | Select-Object -Last 2) -join ' ')")
}
$registerReport = Join-Path $OutDir 'injected-registers.txt'
$global:LASTEXITCODE = -1
& (Join-Path $PSScriptRoot 'verify-injected-registers.ps1') -CleanApk $Apk -CleanMerged $patchInput `
    -PatchedApk $out -ReportPath $registerReport -Java $java -DesktopJar $DesktopJar -Aapt2 $Aapt2 `
    -SelectedPatchNames $manifestSelection -AndroidJar $AndroidJar -ApiVersions $ApiVersions -Bundle $bundle
if ($LASTEXITCODE -ne 0) { throw 'Patched bytecode failed its compiled mutation or structural checks.' }
}
# As the report check counted them, so a list the report leaves out isn't counted as one entry.
Write-Host "[device] applied $($validation.Applied), failed $($validation.Failed), target $($report.packageName) $($report.packageVersion)"
if ($outputReservation) {
    # Copied from the held handle and hashed as it goes, then the copy is held to that digest
    # through the install: the reserved file is closed in between, and anything could write to it.
    $sha = [System.Security.Cryptography.SHA256]::Create()
    try {
        $outHandle.Position = 0
        $buffer = New-Object byte[] 1048576
        while (($read = $outHandle.Read($buffer, 0, $buffer.Length)) -gt 0) {
            $outputReservation.Write($buffer, 0, $read)
            [void]$sha.TransformBlock($buffer, 0, $read, $null, 0)
        }
        $outputReservation.Flush($true)
        [void]$sha.TransformFinalBlock((New-Object byte[] 0), 0, 0)
        $copied = ([System.BitConverter]::ToString($sha.Hash) -replace '-', '').ToLowerInvariant()
    } finally { $sha.Dispose() }
    $outputReservation.Dispose()
    $outputReservation = $null
    $reservedHandle = Open-HeldFile -Path $reservedPath -Sha256 $copied -What 'The APK copied to -OutputApk'
    $out = Get-HeldPath -Stream $reservedHandle
}
$signedHandle = if ($reservedHandle) { $reservedHandle } else { $outHandle }
$provenance = [ordered]@{
    schema = 1
    bundleSha256 = Get-StreamSha256 $bundleHeld
    sourceSha256 = Get-HeldSourceSha256 -Merged $patchInput
    inputIdentity = Get-HeldInputIdentity -Merged $patchInput
    mergedApkSha256 = (Get-FileHash -LiteralPath $patchInput -Algorithm SHA256).Hash.ToLowerInvariant()
    catalogSha256 = Get-StreamSha256 $catalogHeld
    patches = @($names | Sort-Object)
    options = @($Option | Sort-Object)
    output = [ordered]@{
        sha256 = Get-StreamSha256 $signedHandle
        package = $patchedManifest.package
        versionName = $patchedManifest.versionName
        versionCode = [string]$patchedManifest.versionCode
        signers = @($signedBy.Signers)
    }
}
Write-HushApkProvenance -Path "$out.provenance.json" -Provenance $provenance
$complete = $true
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
    # Held until every reader is done, and a held file can't be deleted.
    foreach ($held in @($outHandle, $resultHandle, $reservedHandle, $bundleHeld, $keystoreHeld, $catalogHeld)) { if ($null -ne $held) { $held.Dispose() } }
    Close-AppliedRecord -Record $recorded
    Close-MergedApk -Merged $patchInput
    # These are this run's paths only. A missing or replaced owner marker fails closed.
    $safeRun = Resolve-WithinRoot -Path $OutDir -Root $runParent
    if (-not (Test-Path -LiteralPath $ownerFile -PathType Leaf) -or [IO.File]::ReadAllText($ownerFile) -cne $runToken) {
        throw 'Patch workspace ownership changed. Cleanup refused.'
    }
    foreach ($path in @((Join-Path $safeRun 'tmp'), (Join-Path $safeRun 'morphe-patch.args'),
            (Join-Path $safeRun 'stock-merged.apk'), (Join-Path $safeRun 'stock-merged.apk.buffer'),
            (Join-Path $safeRun 'stock-merged.apk.source'),
            (Join-Path $safeRun 'stock-merged.apk.xmltree'), (Join-Path $safeRun 'stock-merged.apk.authentic.json'))) {
        $safePath = Resolve-WithinRoot -Path $path -Root $safeRun
        if (Test-Path -LiteralPath $safePath) { Remove-Item -LiteralPath $safePath -Recurse -Force }
    }
    if (-not $complete) {
        Remove-Item -LiteralPath $safeRun -Recurse -Force
        if ($reservedPath -and $outputReservation) { Remove-Item -LiteralPath $reservedPath -Force }
    }
}
