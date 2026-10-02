<#
.SYNOPSIS
    Exercise both device builders with temporary signing keys and fake device commands.
#>
[CmdletBinding()]
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot),
    [string]$Sdk = "$env:LOCALAPPDATA\Android\Sdk",
    [string]$Java
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'apk-signing.ps1')
. (Join-Path $PSScriptRoot 'device-install.ps1')
$Java = Resolve-Java -Explicit $Java
$javaDirectory = Split-Path -Parent (Get-Command $Java).Source
$tools = Resolve-ApkSigningTools -Root $Root -Sdk $Sdk -KeystoreType BKS
$temporaryRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$fixture = Resolve-WithinRoot -Root $temporaryRoot -Path (Join-Path $temporaryRoot ('hushfeed-signing-test-' + [Guid]::NewGuid().ToString('N')))
$previousEnvironment = @{}
$storeSentinel = 'fixture-store-' + [Guid]::NewGuid().ToString('N')
$entrySentinel = 'fixture-entry-' + [Guid]::NewGuid().ToString('N')
$wrongSentinel = 'fixture-wrong-' + [Guid]::NewGuid().ToString('N')
$referencesBefore = @([Environment]::GetEnvironmentVariables('Process').Keys | Where-Object { $_ -like 'HUSHFEED_SIGNING_*' })
$assertions = 0
$fixtureLinks = @()

function Assert-Signing {
    param([bool]$Condition, [string]$Message)
    $script:assertions++
    if (-not $Condition) { throw $Message }
}

function Set-FixtureEnvironment {
    param([string]$Name, [AllowNull()][AllowEmptyString()][object]$Value)
    if (-not $previousEnvironment.ContainsKey($Name)) {
        $previousEnvironment[$Name] = [Environment]::GetEnvironmentVariable($Name, 'Process')
    }
    if ($null -eq $Value) { $Value = [NullString]::Value }
    [Environment]::SetEnvironmentVariable($Name, $Value, 'Process')
}

function Assert-NoSigningReferences {
    $remaining = @([Environment]::GetEnvironmentVariables('Process').Keys | Where-Object { $_ -like 'HUSHFEED_SIGNING_*' })
    Assert-Signing ((($remaining | Sort-Object) -join ',') -eq (($referencesBefore | Sort-Object) -join ',')) 'Signing password environment references survived a completed call.'
}

function Assert-NoSecrets {
    param([object[]]$Output)
    $text = $Output -join "`n"
    foreach ($sentinel in @($storeSentinel, $entrySentinel, $wrongSentinel)) {
        Assert-Signing (-not $text.Contains($sentinel)) 'A signing error or command exposed a fixture password.'
    }
}

function Assert-SigningRejected {
    param([scriptblock]$Action, [string]$Pattern)
    $captured = @()
    $message = $null
    try { $captured = @(& $Action *>&1) }
    catch { $message = $_.Exception.Message }
    Assert-NoSecrets -Output ($captured + @($message))
    Assert-Signing ($message -and $message -like $Pattern) 'A signing failure was not rejected with the expected error.'
    Assert-NoSigningReferences
    if (Test-Path -LiteralPath $adbLog) {
        Assert-Signing ((Get-Content -LiteralPath $adbLog -Raw) -notmatch '\b(install|uninstall)\b') 'A rejected build reached installation or uninstall.'
    }
}

try {
    New-Item -ItemType Directory -Path $fixture | Out-Null
    Set-FixtureEnvironment HUSHFEED_SIDELOAD_KEYSTORE_PASSWORD $null
    Set-FixtureEnvironment HUSHFEED_SIDELOAD_KEY_PASSWORD $null
    Set-FixtureEnvironment HUSHFEED_FIXTURE_STORE $storeSentinel
    Set-FixtureEnvironment HUSHFEED_FIXTURE_ENTRY $entrySentinel
    Set-FixtureEnvironment HUSHFEED_FIXTURE_WRONG $wrongSentinel
    foreach ($leaf in @('source.jks', 'other.jks')) {
        $ErrorActionPreference = 'Continue'
        $keyOutput = @(& (Join-Path $javaDirectory 'keytool.exe') -genkeypair -keystore (Join-Path $fixture $leaf) `
            -storetype JKS -alias sideload -keyalg RSA -keysize 2048 -validity 2 -dname 'CN=Signing fixture' `
            -storepass:env HUSHFEED_FIXTURE_STORE -keypass:env HUSHFEED_FIXTURE_ENTRY -noprompt 2>&1)
        $status = $LASTEXITCODE
        $ErrorActionPreference = 'Stop'
        Assert-Signing ($status -eq 0) 'Could not generate the temporary fixture key.'
        Assert-NoSecrets $keyOutput
    }
    $fixtureOutput = @(& $Java --class-path $tools.ClassPath (Join-Path $Root 'scripts/SigningKeyFixtures.java') $fixture 2>&1)
    Assert-Signing ($LASTEXITCODE -eq 0) 'Could not write the temporary signing stores.'
    Assert-NoSecrets $fixtureOutput

    # A tiny SDK fixture runs the real signing path in both builders. Compilation is real;
    # d8 only writes a placeholder entry, and every device command goes to the stand-in below.
    $fixtureSdk = Join-Path $fixture 'sdk'
    $fixtureTools = Join-Path $fixtureSdk 'build-tools/37.0.0'
    $fixturePlatform = Join-Path $fixtureSdk 'platforms/android-37'
    New-Item -ItemType Directory -Path (Join-Path $fixtureTools 'lib'), $fixturePlatform | Out-Null
    foreach ($leaf in @('aapt2.exe', 'zipalign.exe', 'lib/apksigner.jar')) {
        Copy-Item -LiteralPath (Join-Path $tools.BuildTools $leaf) -Destination (Join-Path $fixtureTools $leaf)
    }
    $platform = Get-ChildItem -LiteralPath (Join-Path $Sdk 'platforms') -Directory |
        Sort-Object { [int]($_.Name -replace '\D', '') } -Descending | Select-Object -First 1
    Copy-Item -LiteralPath (Join-Path $platform.FullName 'android.jar') -Destination (Join-Path $fixturePlatform 'android.jar')
    [IO.File]::WriteAllText((Join-Path $fixtureTools 'd8.bat'), @'
@echo off
if defined HUSHFEED_FIXTURE_DEX_FAIL exit /b 1
echo fixture dex>"%~6\classes.dex"
exit /b 0
'@)
    $manifest = Join-Path $fixture 'AndroidManifest.xml'
    [IO.File]::WriteAllText($manifest, '<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.zhiliaoapp.musically" android:versionCode="1" android:versionName="1.0.0"><uses-sdk android:minSdkVersion="23" android:targetSdkVersion="36"/><application android:hasCode="false"/></manifest>')
    $unsigned = Join-Path $fixture 'unsigned.apk'
    $apkOutput = @(& (Join-Path $fixtureTools 'aapt2.exe') link -I (Join-Path $fixturePlatform 'android.jar') --manifest $manifest -o $unsigned 2>&1)
    Assert-Signing ($LASTEXITCODE -eq 0) 'Could not create the tiny APK fixture.'
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [IO.Compression.ZipFile]::Open($unsigned, 'Update')
    try {
        $writer = New-Object IO.StreamWriter($zip.CreateEntry('classes.dex').Open())
        try { $writer.Write('fixture dex') } finally { $writer.Dispose() }
    } finally { $zip.Dispose() }

    $fixtureProject = Join-Path $fixture 'project'
    foreach ($directory in @('scripts', 'gradle', 'patches/build/release', 'tools/verification-probe/src')) {
        New-Item -ItemType Directory -Path (Join-Path $fixtureProject $directory) -Force | Out-Null
    }
    foreach ($leaf in @('patch-for-device.ps1', 'apk-signing.ps1', 'SigningCertificateCheck.java', 'common.ps1', 'Resolve-Java.ps1', 'patch-target.ps1', 'patch-report.ps1', 'device-install.ps1')) {
        Copy-Item -LiteralPath (Join-Path $Root "scripts/$leaf") -Destination (Join-Path $fixtureProject "scripts/$leaf")
    }
    foreach ($leaf in @('libs.versions.toml', 'verification-metadata.xml')) {
        Copy-Item -LiteralPath (Join-Path $Root "gradle/$leaf") -Destination (Join-Path $fixtureProject "gradle/$leaf")
    }
    Copy-Item -LiteralPath (Join-Path $Root 'tools/verification-probe/build.ps1') -Destination (Join-Path $fixtureProject 'tools/verification-probe/build.ps1')
    Copy-Item -LiteralPath (Join-Path $Root 'tools/verification-probe/AndroidManifest.xml') -Destination (Join-Path $fixtureProject 'tools/verification-probe/AndroidManifest.xml')
    Copy-Item -LiteralPath (Join-Path $Root 'tools/verification-probe/src') -Destination (Join-Path $fixtureProject 'tools/verification-probe') -Recurse -Force
    [IO.File]::WriteAllText((Join-Path $fixtureProject 'gradle.properties'), 'version=0.0.1')
    [IO.File]::WriteAllText((Join-Path $fixtureProject 'patches/build/release/patches-0.0.1.mpp'), 'fixture bundle')
    [IO.File]::WriteAllText((Join-Path $fixtureProject 'patches-list.json'), '{"patches":[{"name":"fixture","compatiblePackages":{"com.zhiliaoapp.musically":["1.0.0"]}}]}')
    $classes = Join-Path $fixture 'fixture-classes'
    New-Item -ItemType Directory -Path $classes | Out-Null
    $compileOutput = @(& (Join-Path $javaDirectory 'javac.exe') --class-path $tools.ClassPath -d $classes (Join-Path $Root 'scripts/SigningKeyFixtures.java') 2>&1)
    Assert-Signing ($LASTEXITCODE -eq 0) 'Could not compile the unsigned patcher stand-in.'
    $desktopJar = Join-Path $fixture 'desktop-fixture.jar'
    & (Join-Path $javaDirectory 'jar.exe') --create --file $desktopJar --main-class UnsignedPatcherFixture -C $classes .
    Assert-Signing ($LASTEXITCODE -eq 0) 'Could not package the unsigned patcher stand-in.'
    Set-FixtureEnvironment HUSHFEED_FIXTURE_APK $unsigned
    $patchLog = Join-Path $fixture 'patch.log'
    Set-FixtureEnvironment HUSHFEED_FIXTURE_PATCH_LOG $patchLog
    $adbLog = Join-Path $fixture 'adb.log'
    Set-FixtureEnvironment HUSHFEED_FIXTURE_ADB_LOG $adbLog
    $fakeBin = Join-Path $fixture 'bin'
    New-Item -ItemType Directory -Path $fakeBin | Out-Null
    $fakeAdb = Join-Path $fakeBin 'adb.cmd'
    [IO.File]::WriteAllText($fakeAdb, @'
@echo off
echo %*>>"%HUSHFEED_FIXTURE_ADB_LOG%"
if defined HUSHFEED_FIXTURE_QUERY_FAIL exit /b 1
if "%~3"=="pull" goto pull
if "%~4"=="pm" (
  if "%~6"=="app.hushfeed.verification" (
    if defined HUSHFEED_FIXTURE_PROBE_APK echo package:/fixture/probe/base.apk
  ) else (
    if defined HUSHFEED_FIXTURE_TARGET_APK echo package:/fixture/target/base.apk
  )
)
exit /b 0
:pull
if defined HUSHFEED_FIXTURE_PULL_FAIL exit /b 1
if "%~4"=="/fixture/probe/base.apk" (
  copy /Y "%HUSHFEED_FIXTURE_PROBE_APK%" "%~5" >nul
) else (
  copy /Y "%HUSHFEED_FIXTURE_TARGET_APK%" "%~5" >nul
)
exit /b %errorlevel%
'@)
    Set-FixtureEnvironment PATH ($fakeBin + [IO.Path]::PathSeparator + $env:PATH)
    Assert-Signing ((Get-Command adb).Source -eq $fakeAdb) 'The fixture did not resolve its fake device command.'
    $patchBuilder = Join-Path $fixtureProject 'scripts/patch-for-device.ps1'
    $probeBuilder = Join-Path $fixtureProject 'tools/verification-probe/build.ps1'
    $patchOut = Join-Path $fixture 'device-output'
    $probeOut = Join-Path $fixture 'probe-output'
    $patchArguments = @{ Java = $Java; Sdk = $fixtureSdk; DesktopJar = $desktopJar; Apk = $unsigned; AllowStaleBundle = $true; OutDir = $patchOut }
    $probeArguments = @{ Java = $Java; Sdk = $fixtureSdk; OutDir = $probeOut }
    $certificate = $null
    foreach ($case in @(
        @{ Leaf = 'blank.bks'; Type = 'BKS'; Store = ''; Entry = $entrySentinel }
        @{ Leaf = 'independent.bks'; Type = 'BKS'; Store = $storeSentinel; Entry = $entrySentinel }
        @{ Leaf = 'independent.jks'; Type = 'JKS'; Store = $storeSentinel; Entry = $entrySentinel }
        @{ Leaf = 'independent.p12'; Type = 'PKCS12'; Store = $storeSentinel; Entry = $entrySentinel }
        @{ Leaf = 'defaults.p12' }
    )) {
        $keyArguments = @{ Keystore = Join-Path $fixture $case.Leaf }
        if ($case.Type) {
            $keyArguments.KeystoreType = $case.Type
            $keyArguments.KeystorePassword = $case.Store
            $keyArguments.KeyPassword = $case.Entry
        }
        $output = @(& $patchBuilder @patchArguments @keyArguments *>&1)
        Assert-NoSecrets $output
        Assert-NoSigningReferences
        $output = @(& $probeBuilder @probeArguments @keyArguments *>&1)
        Assert-NoSecrets $output
        Assert-NoSigningReferences
        $session = New-ApkSigningSession -BoundParameters $keyArguments -Root $Root -Sdk $fixtureSdk -Java $Java `
            -Keystore $keyArguments.Keystore -KeyAlias sideload -KeystoreType $case.Type
        try {
            if (-not $certificate) { $certificate = $session.Certificate }
            Assert-Signing ($session.Certificate -eq $certificate) 'The fixture stores changed the signing certificate.'
            $signedDevice = Join-Path $patchOut 'hushfeed-0.0.1-signed.apk'
            $signedProbe = Join-Path $probeOut 'hushfeed-verification-probe.apk'
            foreach ($apk in @($signedDevice, $signedProbe)) {
                Assert-Signing ((Get-ApkSigningCertificate -Session $session -Apk $apk) -eq $certificate) 'The builders produced different or unverified certificates.'
            }
            Assert-Signing (-not (Test-Path -LiteralPath (Join-Path $patchOut 'morphe-patch.args'))) 'The desktop argument file survived a build.'
            Assert-Signing (-not (Test-Path -LiteralPath (Join-Path $patchOut 'hushfeed-0.0.1-unsigned.apk'))) 'The temporary unsigned desktop APK survived a build.'
        } finally { Close-ApkSigningSession $session }
    }
    $trustedDevice = Join-Path $fixture 'trusted-device.apk'
    $trustedProbe = Join-Path $fixture 'trusted-probe.apk'
    Copy-Item -LiteralPath $signedDevice -Destination $trustedDevice
    Copy-Item -LiteralPath $signedProbe -Destination $trustedProbe
    $signedDevice = $trustedDevice
    $signedProbe = $trustedProbe
    $defaults = @{ Keystore = Join-Path $fixture 'defaults.p12' }

    # Previous signing fixtures only rebuilt their dedicated output folder. They never proved
    # that an arbitrary -OutDir could not erase someone else's files or follow a junction.
    $tokens = $null
    $parseErrors = $null
    $probeSyntax = [Management.Automation.Language.Parser]::ParseFile($probeBuilder, [ref]$tokens, [ref]$parseErrors)
    $outputGuard = $probeSyntax.Find({ param($node)
        $node -is [Management.Automation.Language.FunctionDefinitionAst] -and $node.Name -eq 'Initialize-ProbeOutputDirectory'
    }, $false)
    Assert-Signing ($null -ne $outputGuard -and $parseErrors.Count -eq 0) 'The probe output guard could not be isolated for safe root fixtures.'
    . ([scriptblock]::Create($outputGuard.Extent.Text))
    & {
        # Even a regressed guard cannot mutate a real root in these cases. Both filesystem
        # mutators are shadowed, and their invocation fails with a different error.
        $script:guardMutations = 0
        function Remove-Item { $script:guardMutations++; throw 'Root fixture attempted deletion.' }
        function New-Item { $script:guardMutations++; throw 'Root fixture attempted creation.' }
        Assert-Signing ((Get-Command Remove-Item).CommandType -eq 'Function' -and
            (Get-Command New-Item).CommandType -eq 'Function') 'Root fixture mutators were not shadowed.'
        foreach ($protectedPath in @([IO.Path]::GetPathRoot($Root),
                [Environment]::GetFolderPath('UserProfile'), $Root,
                (Join-Path $Root '.'), (Split-Path -Parent $Root))) {
            Assert-SigningRejected { Initialize-ProbeOutputDirectory -Path $protectedPath -RepositoryRoot $Root } '*Refusing probe output*'
        }
        Assert-Signing ($script:guardMutations -eq 0) 'A protected root reached a filesystem mutation.'
    }

    $guardRoot = Join-Path $fixture 'output-guard'
    New-Item -ItemType Directory -Path $guardRoot | Out-Null
    $unowned = Join-Path $guardRoot 'unowned'
    $wrongOwner = Join-Path $guardRoot 'wrong-owner'
    $otherRepository = Join-Path $guardRoot 'repository'
    $existingFile = Join-Path $guardRoot 'file-output'
    New-Item -ItemType Directory -Path $unowned, $wrongOwner, (Join-Path $otherRepository '.git') -Force | Out-Null
    $sentinelText = 'keep this fixture file'
    foreach ($directory in @($unowned, $wrongOwner, $otherRepository)) {
        [IO.File]::WriteAllText((Join-Path $directory 'keep.txt'), $sentinelText)
    }
    [IO.File]::WriteAllText($existingFile, $sentinelText)
    Copy-Item -LiteralPath (Join-Path $probeOut '.hushfeed-probe-output') -Destination $wrongOwner
    foreach ($case in @(
        @{ Path = $unowned; Pattern = '*nonempty unowned*'; Sentinel = Join-Path $unowned 'keep.txt' }
        @{ Path = $wrongOwner; Pattern = '*nonempty unowned*'; Sentinel = Join-Path $wrongOwner 'keep.txt' }
        @{ Path = $otherRepository; Pattern = '*repository root*'; Sentinel = Join-Path $otherRepository 'keep.txt' }
        @{ Path = $existingFile; Pattern = '*existing file*'; Sentinel = $existingFile }
    )) {
        $guardArguments = $probeArguments.Clone()
        $guardArguments.OutDir = $case.Path
        Assert-SigningRejected { & $probeBuilder @guardArguments @defaults } $case.Pattern
        Assert-Signing ([IO.File]::ReadAllText($case.Sentinel) -eq $sentinelText) 'A rejected output path changed its sentinel file.'
    }
    Assert-Signing (-not (Test-Path -LiteralPath (Join-Path $unowned '.hushfeed-probe-output'))) 'An unowned directory was silently adopted.'

    $emptyOutput = Join-Path $guardRoot 'empty'
    New-Item -ItemType Directory -Path $emptyOutput | Out-Null
    $guardArguments = $probeArguments.Clone()
    $guardArguments.OutDir = $emptyOutput
    $output = @(& $probeBuilder @guardArguments @defaults *>&1)
    Assert-NoSecrets $output
    $staleClass = Join-Path $emptyOutput 'classes/stale.class'
    [IO.File]::WriteAllText($staleClass, 'stale fixture class')
    $guardArguments.OutDir = Join-Path $emptyOutput '../empty'
    $output = @(& $probeBuilder @guardArguments @defaults *>&1)
    Assert-NoSecrets $output
    Assert-Signing (-not (Test-Path -LiteralPath $staleClass)) 'A marked repeat build retained a stale class.'
    Assert-Signing ([IO.File]::ReadAllText((Join-Path $emptyOutput '.hushfeed-probe-output')) -eq
        "hushfeed-verification-probe-output-v1`n$([IO.Path]::GetFullPath($emptyOutput))") 'The output marker did not bind the resolved absolute path.'
    foreach ($relative in @('keep.txt', 'classes/keep.txt', 'dex/keep.txt')) {
        $markedSentinel = Join-Path $emptyOutput $relative
        [IO.File]::WriteAllText($markedSentinel, $sentinelText)
        Assert-SigningRejected { & $probeBuilder @guardArguments @defaults } '*unexpected files or directories*'
        Assert-Signing ([IO.File]::ReadAllText($markedSentinel) -eq $sentinelText -and
            (Test-Path -LiteralPath (Join-Path $emptyOutput 'hushfeed-verification-probe.apk'))) 'A marked output erased an unexpected addition or existing APK.'
        Remove-Item -LiteralPath $markedSentinel -Force
    }

    # Keep the normal default path, but point TEMP at this fixture so nothing outside it is cleared.
    $savedTemporaryDirectory = $env:TEMP
    $defaultTemporaryDirectory = Join-Path $guardRoot 'default-temp'
    New-Item -ItemType Directory -Path $defaultTemporaryDirectory | Out-Null
    try {
        Set-FixtureEnvironment TEMP $defaultTemporaryDirectory
        $defaultArguments = $probeArguments.Clone()
        $defaultArguments.Remove('OutDir')
        foreach ($run in @(1, 2)) {
            $output = @(& $probeBuilder @defaultArguments @defaults *>&1)
            Assert-NoSecrets $output
        }
    } finally { Set-FixtureEnvironment TEMP $savedTemporaryDirectory }
    $defaultOutput = Join-Path $defaultTemporaryDirectory 'hushfeed-probe'
    $session = New-ApkSigningSession -BoundParameters @{} -Root $Root -Sdk $fixtureSdk -Java $Java -Keystore $defaults.Keystore -KeyAlias sideload
    try {
        foreach ($directory in @($emptyOutput, $defaultOutput)) {
            Assert-Signing ((Get-ApkSigningCertificate -Session $session -Apk (Join-Path $directory 'hushfeed-verification-probe.apk')) -eq $certificate) 'A fresh or default repeat build lost the verified probe certificate.'
        }
    } finally { Close-ApkSigningSession $session }
    Assert-NoSigningReferences

    $linkTarget = Join-Path $guardRoot 'link-target'
    New-Item -ItemType Directory -Path $linkTarget | Out-Null
    $linkSentinel = Join-Path $linkTarget 'keep.txt'
    [IO.File]::WriteAllText($linkSentinel, $sentinelText)
    $outputLink = Join-Path $guardRoot 'output-link'
    New-Item -ItemType Junction -Path $outputLink -Target $linkTarget | Out-Null
    $fixtureLinks += @{ Path = $outputLink; Directory = $true }
    $nestedLink = Join-Path $emptyOutput 'classes/escape'
    New-Item -ItemType Junction -Path $nestedLink -Target $linkTarget | Out-Null
    $fixtureLinks += @{ Path = $nestedLink; Directory = $true }
    foreach ($path in @($outputLink, (Join-Path $outputLink 'new-output'), $emptyOutput)) {
        $guardArguments.OutDir = $path
        Assert-SigningRejected { & $probeBuilder @guardArguments @defaults } '*linked path*'
        Assert-Signing ([IO.File]::ReadAllText($linkSentinel) -eq $sentinelText) 'A junction escape changed files outside the selected output.'
    }
    Assert-Signing (-not (Test-Path -LiteralPath (Join-Path $linkTarget 'new-output'))) 'A rejected linked ancestor created an output directory.'
    Assert-Signing (Test-Path -LiteralPath (Join-Path $emptyOutput '.hushfeed-probe-output')) 'A nested junction rejection deleted a marked output.'
    # Junctions above are real. Hosts without symbolic-link privilege still exercise the
    # same reparse-point rejection through a narrow metadata shadow on an isolated path.
    $symbolicLink = Join-Path $guardRoot 'symbolic-output'
    New-Item -ItemType Directory -Path $symbolicLink | Out-Null
    $symbolicSentinel = Join-Path $symbolicLink 'keep.txt'
    [IO.File]::WriteAllText($symbolicSentinel, $sentinelText)
    & {
        function Get-Item {
            param([string]$LiteralPath, [switch]$Force)
            if ($LiteralPath -eq $symbolicLink) {
                return [pscustomobject]@{ Attributes = [IO.FileAttributes]::Directory -bor [IO.FileAttributes]::ReparsePoint }
            }
            Microsoft.PowerShell.Management\Get-Item @PSBoundParameters
        }
        $guardArguments.OutDir = $symbolicLink
        Assert-SigningRejected { & $probeBuilder @guardArguments @defaults } '*linked path*'
    }
    Assert-Signing ([IO.File]::ReadAllText($symbolicSentinel) -eq $sentinelText) 'A shadowed symbolic-link path changed its sentinel.'

    # Passwords from the legacy environment and the new entry environment stay independent.
    Set-FixtureEnvironment HUSHFEED_SIDELOAD_KEYSTORE_PASSWORD $storeSentinel
    Set-FixtureEnvironment HUSHFEED_SIDELOAD_KEY_PASSWORD $entrySentinel
    $session = New-ApkSigningSession -BoundParameters @{} -Root $Root -Sdk $fixtureSdk -Java $Java `
        -Keystore (Join-Path $fixture 'independent.jks') -KeyAlias sideload -KeystoreType JKS
    try { Assert-Signing ($session.Certificate -eq $certificate) 'Independent environment passwords were not used.' }
    finally { Close-ApkSigningSession $session }
    Set-FixtureEnvironment HUSHFEED_SIDELOAD_KEYSTORE_PASSWORD $null
    Set-FixtureEnvironment HUSHFEED_SIDELOAD_KEY_PASSWORD $null

    foreach ($case in @('blank.bks', 'independent.bks', 'independent.jks', 'independent.p12')) {
        $type = if ($case.EndsWith('.bks')) { 'BKS' } elseif ($case.EndsWith('.jks')) { 'JKS' } else { 'PKCS12' }
        $correctStore = if ($case -eq 'blank.bks') { '' } else { $storeSentinel }
        foreach ($bad in @(
            @{ KeystorePassword = $wrongSentinel; KeyPassword = $entrySentinel }
            @{ KeystorePassword = $correctStore; KeyPassword = $wrongSentinel }
            @{ KeystorePassword = $correctStore; KeyPassword = $entrySentinel; KeyAlias = 'missing' }
        )) {
            $bad.Keystore = Join-Path $fixture $case
            $bad.KeystoreType = $type
            foreach ($builder in @($patchBuilder, $probeBuilder)) {
                if (Test-Path -LiteralPath $adbLog) { Remove-Item -LiteralPath $adbLog -Force }
                if ($builder -eq $patchBuilder) {
                    Assert-SigningRejected { & $builder @patchArguments @bad -Serial SIGNINGFIXTURE -Replace } '*Could not unlock the signing key*'
                } else {
                    Assert-SigningRejected { & $builder @probeArguments @bad -Serial SIGNINGFIXTURE -Install } '*Could not unlock the signing key*'
                }
            }
        }
    }
    $session = New-ApkSigningSession -BoundParameters @{} -Root $Root -Sdk $fixtureSdk -Java $Java -Keystore $defaults.Keystore -KeyAlias sideload
    try {
        $other = New-ApkSigningSession -BoundParameters @{ KeystorePassword = $storeSentinel; KeyPassword = $entrySentinel } `
            -Root $Root -Sdk $fixtureSdk -Java $Java -Keystore (Join-Path $fixture 'other.jks') -KeyAlias sideload -KeystoreType JKS
        $differentApk = Join-Path $fixture 'different.apk'
        try { Invoke-ApkSigning -Session $other -InputApk $unsigned -OutputApk $differentApk }
        finally { Close-ApkSigningSession $other }
    } finally { Close-ApkSigningSession $session }
    Set-FixtureEnvironment HUSHFEED_FIXTURE_TARGET_APK $differentApk
    Set-FixtureEnvironment HUSHFEED_FIXTURE_PROBE_APK $signedProbe
    foreach ($action in @(
        { & $patchBuilder @patchArguments @defaults -Serial SIGNINGFIXTURE }
        { & $probeBuilder @probeArguments @defaults -Serial SIGNINGFIXTURE -Install }
    )) {
        if (Test-Path -LiteralPath $adbLog) { Remove-Item -LiteralPath $adbLog -Force }
        Assert-SigningRejected $action '*different signing certificate*'
    }
    Set-FixtureEnvironment HUSHFEED_FIXTURE_TARGET_APK $signedDevice
    Set-FixtureEnvironment HUSHFEED_FIXTURE_PROBE_APK $differentApk
    Remove-Item -LiteralPath $adbLog -Force
    Assert-SigningRejected { & $probeBuilder @probeArguments @defaults -Serial SIGNINGFIXTURE -Install } '*different signing certificate*'
    Set-FixtureEnvironment HUSHFEED_FIXTURE_PROBE_APK $signedProbe
    Set-FixtureEnvironment HUSHFEED_FIXTURE_TARGET_APK $null
    Remove-Item -LiteralPath $adbLog -Force
    Assert-SigningRejected { & $probeBuilder @probeArguments @defaults -Serial SIGNINGFIXTURE -Install } '*must be installed*'
    Set-FixtureEnvironment HUSHFEED_FIXTURE_TARGET_APK $signedDevice
    foreach ($failure in @('HUSHFEED_FIXTURE_QUERY_FAIL', 'HUSHFEED_FIXTURE_PULL_FAIL')) {
        Set-FixtureEnvironment $failure '1'
        if (Test-Path -LiteralPath $adbLog) { Remove-Item -LiteralPath $adbLog -Force }
        Assert-SigningRejected { & $patchBuilder @patchArguments @defaults -Serial SIGNINGFIXTURE } '*adb could not*'
        Set-FixtureEnvironment $failure $null
    }
    if (Test-Path -LiteralPath $adbLog) { Remove-Item -LiteralPath $adbLog -Force }
    $output = @(& $patchBuilder @patchArguments @defaults -Serial SIGNINGFIXTURE *>&1)
    Assert-NoSecrets $output
    $output = @(& $probeBuilder @probeArguments @defaults -Serial SIGNINGFIXTURE -Install *>&1)
    Assert-NoSecrets $output
    Assert-Signing (@(Get-Content -LiteralPath $adbLog | Where-Object { $_ -match '\binstall\b' }).Count -eq 2) 'Matching certificates did not reach both fake installations.'
    Assert-Signing ((Get-Content -LiteralPath $adbLog -Raw) -notmatch '\buninstall\b') 'An in-place fixture install uninstalled the package.'
    Assert-NoSigningReferences

    Remove-Item -LiteralPath $adbLog -Force
    Set-FixtureEnvironment HUSHFEED_FIXTURE_PATCH_FAIL '1'
    Assert-SigningRejected { & $patchBuilder @patchArguments @defaults -Serial SIGNINGFIXTURE } '*desktop CLI exited*'
    Assert-Signing (-not (Test-Path -LiteralPath (Join-Path $patchOut 'morphe-patch.args'))) 'The desktop argument file survived a CLI failure.'
    Assert-Signing (-not (Test-Path -LiteralPath (Join-Path $patchOut 'hushfeed-0.0.1-unsigned.apk'))) 'An unsigned desktop APK survived a CLI failure.'
    Set-FixtureEnvironment HUSHFEED_FIXTURE_PATCH_FAIL $null
    Set-FixtureEnvironment HUSHFEED_FIXTURE_DEX_FAIL '1'
    Assert-SigningRejected { & $probeBuilder @probeArguments @defaults -Serial SIGNINGFIXTURE -Install } '*d8 failed*'
    Set-FixtureEnvironment HUSHFEED_FIXTURE_DEX_FAIL $null

    Assert-SigningRejected {
        $session = New-ApkSigningSession -BoundParameters @{} -Root $Root -Sdk $fixtureSdk -Java $Java -Keystore $defaults.Keystore -KeyAlias sideload
        try { Get-ApkSigningCertificate -Session $session -Apk $unsigned }
        finally { Close-ApkSigningSession $session }
    } '*Could not verify the APK*'
    $rejectedOutput = Join-Path $fixture 'rejected.apk'
    Assert-SigningRejected {
        $session = New-ApkSigningSession -BoundParameters @{} -Root $Root -Sdk $fixtureSdk -Java $Java -Keystore $defaults.Keystore -KeyAlias sideload
        try {
            $session.Certificate = '0' * 64
            Invoke-ApkSigning -Session $session -InputApk $unsigned -OutputApk $rejectedOutput
        } finally { Close-ApkSigningSession $session }
    } '*does not match*'
    Assert-Signing (-not (Test-Path -LiteralPath $rejectedOutput)) 'A rejected signed output survived verification failure.'

    $badCache = Join-Path $fixture 'bad-cache'
    $pin = Get-Content -LiteralPath (Join-Path $Root 'gradle/libs.versions.toml') | Where-Object { $_ -match '^bouncycastle\s*=\s*"([^"]+)"' } | Select-Object -First 1
    [void]($pin -match '^bouncycastle\s*=\s*"([^"]+)"')
    $badProviderDirectory = Join-Path $badCache "caches/modules-2/files-2.1/org.bouncycastle/bcprov-jdk18on/$($Matches[1])/fixture"
    New-Item -ItemType Directory -Path $badProviderDirectory -Force | Out-Null
    [IO.File]::WriteAllText((Join-Path $badProviderDirectory "bcprov-jdk18on-$($Matches[1]).jar"), 'unverified provider')
    Set-FixtureEnvironment GRADLE_USER_HOME $badCache
    Assert-SigningRejected { Resolve-ApkSigningTools -Root $Root -Sdk $fixtureSdk -KeystoreType BKS } '*checksum-verified*'
    foreach ($file in @(Get-ChildItem -LiteralPath $fixtureProject, $patchOut, $probeOut -File -Recurse)) {
        $bytes = [IO.File]::ReadAllBytes($file.FullName)
        Assert-NoSecrets @([Text.Encoding]::UTF8.GetString($bytes))
    }
    Assert-NoSigningReferences
} finally {
    foreach ($name in $previousEnvironment.Keys) {
        $previous = $previousEnvironment[$name]
        if ($null -eq $previous) { $previous = [NullString]::Value }
        [Environment]::SetEnvironmentVariable($name, $previous, 'Process')
    }
    if (Test-Path -LiteralPath $fixture) {
        [void](Resolve-WithinRoot -Root $temporaryRoot -Path $fixture)
        foreach ($link in $fixtureLinks) {
            [void](Resolve-WithinRoot -Root $fixture -Path $link.Path)
            # Nonrecursive deletion removes only the fixture link, never its target.
            if ($link.Directory) { [IO.Directory]::Delete($link.Path) }
            else { [IO.File]::Delete($link.Path) }
        }
        Remove-Item -LiteralPath $fixture -Recurse -Force
    }
}
Assert-Signing (-not (Test-Path -LiteralPath $fixture)) 'The temporary signing keys survived fixture cleanup.'
$global:LASTEXITCODE = 0
Write-Host "[signing] $assertions assertions passed with BKS, JKS and PKCS12 stores; both builders signed the same certificate and only fake device commands ran"
