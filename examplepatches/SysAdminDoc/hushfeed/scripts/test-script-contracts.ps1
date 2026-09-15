<#
.SYNOPSIS
    Exercise shared patch-report, patch-target, Java-resolution and device replacement contracts.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'patch-report.ps1')
. (Join-Path $PSScriptRoot 'device-install.ps1')
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')

function Assert-True {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { throw $Message }
}

function Assert-Throws {
    param([scriptblock]$Action, [string]$Pattern, [string]$Message)
    try {
        & $Action
    } catch {
        if ($_.Exception.Message -like $Pattern) { return }
        throw "$Message Unexpected error: $($_.Exception.Message)"
    }
    throw "$Message No error was raised."
}

$catalog = Get-Content -LiteralPath (Join-Path $Root 'patches-list.json') -Raw | ConvertFrom-Json
$target = Get-PatchTarget -PatchList $catalog
Assert-True ($target.PackageName -eq 'com.zhiliaoapp.musically') 'The catalog package was not resolved.'
Assert-True ($target.PackageVersion -eq '46.2.3') 'The catalog version was not resolved.'

$allNames = @($catalog.patches | ForEach-Object { $_.name })
$allDependencies = @(Get-PatchDependencyNames -PatchList $catalog -RequestedNames $allNames)
Assert-True ($allDependencies.Count -eq 1 -and $allDependencies[0] -eq 'BytecodePatch') `
    'The real catalog dependency closure did not isolate the internal BytecodePatch.'
Assert-True (Test-ReportedPatchNames -Expected $allNames `
    -Actual @($allNames + $allDependencies) -AllowedDependencies $allDependencies) `
    'A result that included the real internal dependency was rejected.'

$dependencyCatalog = [pscustomobject]@{
    patches = @(
        [pscustomobject]@{ name = 'Root'; dependencies = @('Helper') },
        [pscustomobject]@{ name = 'Helper'; dependencies = @('Internal') },
        [pscustomobject]@{ name = 'Unrelated'; dependencies = @() }
    )
}
$dependencies = @(Get-PatchDependencyNames -PatchList $dependencyCatalog -RequestedNames @('Root'))
Assert-True ($dependencies.Count -eq 2 -and $dependencies -contains 'Helper' -and
    $dependencies -contains 'Internal') 'The transitive dependency closure was incomplete.'
Assert-True (Test-ReportedPatchNames -Expected @('Root') -Actual @('Root') `
    -AllowedDependencies $dependencies) 'A report that omitted optional dependency rows was rejected.'
Assert-True (Test-ReportedPatchNames -Expected @('Root') -Actual @('Internal', 'Root', 'Helper') `
    -AllowedDependencies $dependencies) 'Declared dependency rows were rejected or order mattered.'
Assert-True (-not (Test-ReportedPatchNames -Expected @('Root') -Actual @('Helper', 'Internal') `
    -AllowedDependencies $dependencies)) 'A report missing its requested root was accepted.'
Assert-True (-not (Test-ReportedPatchNames -Expected @('Root') -Actual @('Root', 'Unrelated') `
    -AllowedDependencies $dependencies)) 'An unrelated extra patch was accepted as a dependency.'
Assert-True (-not (Test-ReportedPatchNames -Expected @('Root') -Actual @('Root', 'Root') `
    -AllowedDependencies $dependencies)) 'A duplicated requested patch was accepted.'
Assert-True (-not (Test-ReportedPatchNames -Expected @('Root') -Actual @('Root', 'Helper', 'Helper') `
    -AllowedDependencies $dependencies)) 'A duplicated dependency patch was accepted.'

$futureCatalog = [pscustomobject]@{
    patches = @([pscustomobject]@{
        name = 'future target'
        compatiblePackages = [pscustomobject]@{ 'com.example.future' = @('99.4.2') }
    })
}
$futureTarget = Get-PatchTarget -PatchList $futureCatalog
Assert-True ($futureTarget.PackageName -eq 'com.example.future' -and
    $futureTarget.PackageVersion -eq '99.4.2') 'A synthetic future target was replaced by a pinned value.'

$twoVersions = [pscustomobject]@{
    patches = @([pscustomobject]@{
        name = 'two versions'
        compatiblePackages = [pscustomobject]@{ 'com.example.app' = @('1.0.0', '2.0.0') }
    })
}
Assert-Throws { Get-PatchTarget -PatchList $twoVersions } '*Expected one compatible version*' `
    'A catalog with two versions was accepted.'
$missingTarget = [pscustomobject]@{ patches = @([pscustomobject]@{ name = 'missing target' }) }
Assert-Throws { Get-PatchTarget -PatchList $missingTarget } '*has no compatible package*' `
    'A patch without compatibility metadata was accepted.'

$tempBase = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
$caseRoot = [System.IO.Path]::GetFullPath((Join-Path $tempBase ("hushfeed-script-test-" + [guid]::NewGuid().ToString('N'))))
$requiredPrefix = $tempBase.TrimEnd('\') + '\'
if (-not $caseRoot.StartsWith($requiredPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to create test files outside the temporary directory: $caseRoot"
}
try {
    New-Item -ItemType Directory -Path $caseRoot | Out-Null
    $reportApk = Join-Path $caseRoot 'report.apk'
    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::Open(
        $reportApk, [System.IO.Compression.ZipArchiveMode]::Create)
    try {
        foreach ($entryName in @('AndroidManifest.xml', 'classes.dex')) {
            $stream = $archive.CreateEntry($entryName).Open()
            try { $stream.WriteByte(0) } finally { $stream.Dispose() }
        }
    } finally {
        $archive.Dispose()
    }
    $dependencyReport = [pscustomobject]@{
        patchingSteps = @([pscustomobject]@{ success = $true })
        appliedPatches = @($allNames + $allDependencies | ForEach-Object {
            [pscustomobject]@{ name = $_ }
        })
        failedPatches = @()
        packageName = $target.PackageName
        packageVersion = $target.PackageVersion
    }
    $reportValidation = Test-PatchingReport -Report $dependencyReport -ExpectedNames $allNames `
        -AllowedDependencyNames $allDependencies -OutputPath $reportApk `
        -ExpectedPackageName $target.PackageName -ExpectedPackageVersion $target.PackageVersion
    Assert-True $reportValidation.Valid `
        "A complete result with a declared dependency was rejected: $($reportValidation.Reason)"

    $fakeAdb = Join-Path $caseRoot 'adb.cmd'
    $log = Join-Path $caseRoot 'adb.log'
    $mode = Join-Path $caseRoot 'mode.txt'
    $fakeBody = @'
@echo off
set /p FAKE_ADB_MODE=<"%~dp0mode.txt"
echo mode=%FAKE_ADB_MODE% args=%*>>"%~dp0adb.log"
if "%3|%4|%5"=="shell|pm|path" goto package_path
if "%3"=="uninstall" goto uninstall
exit /b 0
:package_path
if "%FAKE_ADB_MODE%"=="check-fail" goto check_fail
if "%FAKE_ADB_MODE%"=="present" echo package:/data/app/example/base.apk
if "%FAKE_ADB_MODE%"=="uninstall-fail" echo package:/data/app/example/base.apk
exit /b 0
:uninstall
if "%FAKE_ADB_MODE%"=="uninstall-fail" goto uninstall_fail
echo Success
exit /b 0
:check_fail
exit /b 17
:uninstall_fail
exit /b 19
'@
    [System.IO.File]::WriteAllText($fakeAdb, $fakeBody, [System.Text.Encoding]::ASCII)

    [System.IO.File]::WriteAllText($mode, 'absent', [System.Text.Encoding]::ASCII)
    $removed = Remove-AndroidPackageIfInstalled -Adb $fakeAdb -Serial 'CLEAN' -PackageName 'com.example.app'
    $calls = @(Get-Content -LiteralPath $log)
    Assert-True (-not $removed) 'An absent package was reported as removed.'
    Assert-True ($calls.Count -eq 1 -and $calls[0] -like '*shell pm path com.example.app') `
        'The absent-package path attempted an uninstall.'

    Remove-Item -LiteralPath $log -Force
    [System.IO.File]::WriteAllText($mode, 'present', [System.Text.Encoding]::ASCII)
    $removed = Remove-AndroidPackageIfInstalled -Adb $fakeAdb -Serial 'READY' -PackageName 'com.example.app'
    $calls = @(Get-Content -LiteralPath $log)
    Assert-True $removed 'An installed package was not removed.'
    Assert-True ($calls.Count -eq 2 -and $calls[0] -like '*shell pm path com.example.app' -and
        $calls[1] -like '*uninstall com.example.app') 'The installed-package path did not check then uninstall.'

    Remove-Item -LiteralPath $log -Force
    [System.IO.File]::WriteAllText($mode, 'check-fail', [System.Text.Encoding]::ASCII)
    Assert-Throws {
        Remove-AndroidPackageIfInstalled -Adb $fakeAdb -Serial 'BROKEN' -PackageName 'com.example.app'
    } '*could not check*' 'An ADB transport failure was treated as an absent package.'
    $calls = @(Get-Content -LiteralPath $log)
    Assert-True ($calls.Count -eq 1) 'The check-failure path continued after ADB failed.'

    Remove-Item -LiteralPath $log -Force
    [System.IO.File]::WriteAllText($mode, 'uninstall-fail', [System.Text.Encoding]::ASCII)
    Assert-Throws {
        Remove-AndroidPackageIfInstalled -Adb $fakeAdb -Serial 'LOCKED' -PackageName 'com.example.app'
    } '*uninstall failed*' 'An uninstall failure was accepted.'
    $calls = @(Get-Content -LiteralPath $log)
    Assert-True ($calls.Count -eq 2) 'The uninstall-failure path did not perform exactly a check and uninstall.'

    $emptyJdk = Join-Path $caseRoot 'empty-jdk'
    New-Item -ItemType Directory -Path $emptyJdk | Out-Null
    Assert-Throws {
        Resolve-Java -Explicit $emptyJdk
    } "*$emptyJdk*" 'An explicit directory without bin/java fell through to the PATH Java.'

    $pathJava = Resolve-Java
    $jdkRoot = Split-Path -Parent (Split-Path -Parent $pathJava)
    $resolvedJava = Resolve-Java -Explicit $jdkRoot
    Assert-True ([System.IO.Path]::GetFullPath($resolvedJava).Equals(
        [System.IO.Path]::GetFullPath($pathJava), [System.StringComparison]::OrdinalIgnoreCase)) `
        'A valid explicit JDK directory did not resolve its bin/java executable.'
} finally {
    if ($caseRoot.StartsWith($requiredPrefix, [System.StringComparison]::OrdinalIgnoreCase) -and
        (Test-Path -LiteralPath $caseRoot)) {
        Remove-Item -LiteralPath $caseRoot -Recurse -Force
    }
}

$consumerScripts = @('patch-for-device.ps1', 'verify-all-patches.ps1', 'measure-patch-heap.ps1')
foreach ($name in $consumerScripts) {
    $text = Get-Content -LiteralPath (Join-Path $PSScriptRoot $name) -Raw
    Assert-True ($text -notmatch '(?m)expectedPackageVersion\s*=\s*[''\"]') `
        "$name pins an expected package version instead of reading the catalog."
    Assert-True ($text -match 'Get-PatchTarget') "$name does not read its target through Get-PatchTarget."
    Assert-True ($text -match 'Get-PatchDependencyNames') `
        "$name does not derive the selected patches' dependency closure."
    Assert-True ($text -match 'AllowedDependencyNames') `
        "$name does not pass declared dependency names into result validation."
}

# --- release receipt -------------------------------------------------------------------------

. (Join-Path $PSScriptRoot 'release-receipt.ps1')

$manifestLines = @(
    'N: android=http://schemas.android.com/apk/res/android (line=1)',
    '  E: manifest (line=1)',
    '    A: http://schemas.android.com/apk/res/android:versionCode(0x0101021b)=2024607030',
    '    A: http://schemas.android.com/apk/res/android:versionName(0x0101021c)="46.7.3" (Raw: "46.7.3")',
    '    A: package="com.example.host" (Raw: "com.example.host")',
    '    A: platformBuildVersionCode=36',
    '      E: uses-permission (line=10)',
    '        A: http://schemas.android.com/apk/res/android:name(0x01010003)="android.permission.INTERNET" (Raw: "android.permission.INTERNET")',
    '      E: uses-permission (line=11)',
    '        A: http://schemas.android.com/apk/res/android:name(0x01010003)="android.permission.CAMERA" (Raw: "android.permission.CAMERA")',
    '      E: application (line=20)',
    '        E: activity (line=21)',
    '          A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.host.Main" (Raw: "com.example.host.Main")',
    '          A: http://schemas.android.com/apk/res/android:exported(0x01010010)=true',
    '            E: intent-filter (line=22)',
    '              E: action (line=23)',
    '                A: http://schemas.android.com/apk/res/android:name(0x01010003)="android.intent.action.MAIN" (Raw: "android.intent.action.MAIN")',
    '        E: activity (line=30)',
    '          A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.host.Private" (Raw: "com.example.host.Private")',
    '          A: http://schemas.android.com/apk/res/android:exported(0x01010010)=false',
    '        E: service (line=40)',
    '          A: http://schemas.android.com/apk/res/android:name(0x01010003)=".Sync" (Raw: ".Sync")',
    '          A: http://schemas.android.com/apk/res/android:exported(0x01010010)=true'
)

$facts = ConvertFrom-ManifestXmlTree -Lines $manifestLines -Source 'fixture'
Assert-True ($facts.package -eq 'com.example.host') 'The manifest package was not read.'
Assert-True ($facts.versionName -eq '46.7.3') 'The manifest version name was not read.'
Assert-True ($facts.versionCode -eq '2024607030') 'The manifest version code was not read.'
Assert-True (($facts.permissions -join ',') -eq 'android.permission.CAMERA,android.permission.INTERNET') `
    'The requested permissions were not read and sorted.'
Assert-True (($facts.exported -join ',') -eq 'activity:com.example.host.Main,service:com.example.host.Sync') `
    "Exported components were misread: $($facts.exported -join ',')"
Assert-True ($facts.exported -notcontains 'activity:com.example.host.Private') `
    'A component marked exported=false was reported as exported.'
Assert-True ($facts.exported -notcontains 'action:android.intent.action.MAIN') `
    'An intent-filter action was counted as an exported component.'

Assert-Throws {
    ConvertFrom-ManifestXmlTree -Lines @('  E: manifest (line=1)') -Source 'nameless'
} '*no package name*' 'A manifest with no package was accepted.'

$patchedFacts = ConvertFrom-ManifestXmlTree -Source 'patched' -Lines (
    @($manifestLines | Where-Object { $_ -notlike '*android.permission.CAMERA*' }) + @(
        '      E: uses-permission (line=12)',
        '        A: http://schemas.android.com/apk/res/android:name(0x01010003)="android.permission.VIBRATE" (Raw: "android.permission.VIBRATE")',
        '      E: application (line=20)',
        '        E: receiver (line=50)',
        '          A: http://schemas.android.com/apk/res/android:name(0x01010003)="com.example.host.Probe" (Raw: "com.example.host.Probe")',
        '          A: http://schemas.android.com/apk/res/android:exported(0x01010010)=true'))
$delta = Get-ManifestDelta -Stock $facts -Patched $patchedFacts
Assert-True (($delta.permissionsAdded -join ',') -eq 'android.permission.VIBRATE') `
    'An added permission was not reported.'
Assert-True (($delta.permissionsRemoved -join ',') -eq 'android.permission.CAMERA') `
    'A removed permission was not reported.'
Assert-True (($delta.exportedComponentsAdded -join ',') -eq 'receiver:com.example.host.Probe') `
    'A newly exported component was not reported.'
Assert-True (@($delta.exportedComponentsRemoved).Count -eq 0) `
    'A component that stayed exported was reported as removed.'
$entries = ConvertTo-ManifestDeltaEntries -Delta $delta
Assert-True (($entries -join '; ') -eq (@(
    'exported-added receiver:com.example.host.Probe',
    'permission-added android.permission.VIBRATE',
    'permission-removed android.permission.CAMERA') -join '; ')) `
    "The delta did not flatten to allowlist lines: $($entries -join '; ')"

$unchanged = Get-ManifestDelta -Stock $facts -Patched $facts
Assert-True (@(ConvertTo-ManifestDeltaEntries -Delta $unchanged).Count -eq 0) `
    'An unchanged manifest produced a delta.'

$checkedInAllowlist = Read-ManifestDeltaAllowlist -Path (Join-Path $PSScriptRoot 'manifest-delta-allowlist.txt')
Assert-True (@($checkedInAllowlist | Where-Object { $_ }).Count -eq 0) `
    ('The checked-in manifest delta allowlist is no longer empty, so the patches now change the ' +
     "Android manifest: $(@($checkedInAllowlist) -join ', ')")

$allowlistRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("receipt-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $allowlistRoot | Out-Null
try {
    $good = Join-Path $allowlistRoot 'good.txt'
    Set-Content -LiteralPath $good -Encoding UTF8 -Value @(
        '# a comment', '', 'permission-added android.permission.VIBRATE',
        'exported-added receiver:com.example.host.Probe')
    Assert-True (@(Read-ManifestDeltaAllowlist -Path $good).Count -eq 2) `
        'The allowlist reader did not skip comments and blank lines.'

    $bad = Join-Path $allowlistRoot 'bad.txt'
    Set-Content -LiteralPath $bad -Encoding UTF8 -Value @('permission-added')
    Assert-Throws { Read-ManifestDeltaAllowlist -Path $bad } '*<kind> <value>*' `
        'A malformed allowlist line was accepted.'
    Assert-Throws { Read-ManifestDeltaAllowlist -Path (Join-Path $allowlistRoot 'absent.txt') } `
        '*allowlist is missing*' 'A missing allowlist was treated as an empty one.'

    # A stand-in bundle, so the size, hash and manifest checks compare against real bytes.
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $commitSeconds = 1700000000L
    function New-TestBundle {
        param([string]$Path, [string]$Version = '9.9.9', [long]$Timestamp = 1700000000000L,
            [string]$Patcher = '1.12.0')
        if (Test-Path -LiteralPath $Path) { Remove-Item -LiteralPath $Path -Force }
        $archive = [System.IO.Compression.ZipFile]::Open(
            $Path, [System.IO.Compression.ZipArchiveMode]::Create)
        try {
            $entry = $archive.CreateEntry('META-INF/MANIFEST.MF')
            $writer = New-Object System.IO.StreamWriter($entry.Open())
            try {
                $writer.Write("Manifest-Version: 1.0`nVersion: $Version`n" +
                    "Timestamp: $Timestamp`nPatcher-Version: $Patcher`n`n")
            } finally { $writer.Dispose() }
        } finally { $archive.Dispose() }
    }

    $bundle = Join-Path $allowlistRoot 'patches-9.9.9.mpp'
    New-TestBundle -Path $bundle
    $bundleHash = Get-Sha256Hex -Path $bundle
    $bundleSize = (Get-Item -LiteralPath $bundle).Length

    $manifestFacts = Get-BundleManifestFacts -BundlePath $bundle
    Assert-True ($manifestFacts.version -eq '9.9.9') 'The bundle manifest version was not read.'
    Assert-True ($manifestFacts.timestamp -eq 1700000000000L) 'The bundle timestamp was not read.'
    Assert-True ($manifestFacts.patcherVersion -eq '1.12.0') 'The bundle patcher stamp was not read.'

    $template = [ordered]@{
        schemaVersion = Get-ReleaseReceiptSchemaVersion
        release   = [ordered]@{ version = '9.9.9'; tag = 'v9.9.9'
            commit = '0123456789abcdef0123456789abcdef01234567'
            commitTimestamp = $commitSeconds; patchCount = 2 }
        bundle    = [ordered]@{ file = 'patches-9.9.9.mpp'; sizeBytes = $bundleSize
            sha256 = $bundleHash; timestamp = 1700000000000L }
        toolchain = [ordered]@{ patcherVersion = '1.12.0'; managerFloor = '1.29.0' }
        extension = [ordered]@{ dexPayloads = @([ordered]@{
            name = 'extensions/tiktok.rve'; sizeBytes = 10; sha256 = ('A' * 64) }) }
        targets   = @([ordered]@{
            source = [ordered]@{ file = 'stock.apk'; package = 'com.example.host'
                versionName = '46.7.3'; versionCode = '2024607030'; sha256 = ('B' * 64) }
            patches = @([ordered]@{ name = 'Alpha'; applied = $true; reason = $null },
                        [ordered]@{ name = 'Beta'; applied = $true; reason = $null })
            manifestDelta = [ordered]@{ permissionsAdded = @(); permissionsRemoved = @()
                exportedComponentsAdded = @(); exportedComponentsRemoved = @() }
        })
    }
    $templateJson = $template | ConvertTo-Json -Depth 12

    function New-TestReceipt {
        param([scriptblock]$Mutate)
        $copy = $templateJson | ConvertFrom-Json
        if ($Mutate) { & $Mutate $copy }
        return $copy
    }

    function Test-TestReceipt {
        param($Receipt, [string[]]$Approved = @())
        return Test-ReleaseReceipt -Receipt $Receipt -ExpectedVersion '9.9.9' `
            -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
            -ExpectedManagerFloor '1.29.0' -BundlePath $bundle -ApprovedManifestDelta $Approved
    }

    $valid = Test-TestReceipt -Receipt (New-TestReceipt)
    Assert-True $valid.Valid "A complete receipt was refused: $($valid.Reason)"

    # Every fact the receipt exists to pin, put in front of the check one at a time. A gate that
    # has never been shown to fail is a gate nobody has tested.
    $mutations = [ordered]@{
        'a receipt from a different schema'     = { param($r) $r.schemaVersion = 99 }
        'a receipt for a different version'     = { param($r) $r.release.version = '9.9.8' }
        'a tag that does not match the version' = { param($r) $r.release.tag = 'v9.9.8' }
        'a short commit'                        = { param($r) $r.release.commit = '0123456' }
        'a patch count that is not the catalog' = { param($r) $r.release.patchCount = 3 }
        'a different patcher'                   = { param($r) $r.toolchain.patcherVersion = '1.13.0' }
        'a different Manager floor'             = { param($r) $r.toolchain.managerFloor = '1.30.0' }
        'a bundle size that is not the bundle'  = { param($r) $r.bundle.sizeBytes = 4 }
        'a bundle hash that is not the bundle'  = { param($r) $r.bundle.sha256 = ('C' * 64) }
        'an empty extension payload'            = { param($r) $r.extension.dexPayloads[0].sizeBytes = 0 }
        'an unhashed extension payload'         = { param($r) $r.extension.dexPayloads[0].sha256 = 'nope' }
        'no extension payload at all'           = { param($r) $r.extension.dexPayloads = @() }
        'no target at all'                      = { param($r) $r.targets = @() }
        'an unhashed source APK'                = { param($r) $r.targets[0].source.sha256 = '' }
        'fewer verdicts than patches'           = { param($r) $r.targets[0].patches = @($r.targets[0].patches[0]) }
        'a patch the catalog does not list'     = { param($r) $r.targets[0].patches[1].name = 'Gamma' }
        'the same patch reported twice'         = { param($r) $r.targets[0].patches[1].name = 'Alpha' }
        'a patch that did not apply'            = { param($r) $r.targets[0].patches[1].applied = $false }
        'a receipt with no commit time'         = { param($r) $r.release.commitTimestamp = 0 }
        'a stamp that is not the bundle stamp'  = { param($r) $r.bundle.timestamp = 1700000001000L }
    }
    foreach ($description in $mutations.Keys) {
        $result = Test-TestReceipt -Receipt (New-TestReceipt -Mutate $mutations[$description])
        Assert-True (-not $result.Valid) "Receipt validation accepted $description."
        Assert-True ([bool]$result.Reason) "Receipt validation refused $description without saying why."
    }

    # The bundle the receipt is about, gone. Every fact above is checked against a file, and a
    # missing file is the one case where there is nothing to disagree with, so an unguarded
    # check would read it as agreement and pass the release.
    $absent = Test-ReleaseReceipt -Receipt (New-TestReceipt) -ExpectedVersion '9.9.9' `
        -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
        -ExpectedManagerFloor '1.29.0' -BundlePath (Join-Path $allowlistRoot 'not-built.mpp')
    Assert-True (-not $absent.Valid) 'A receipt was accepted against a bundle that is not there.'
    Assert-True ($absent.Reason -like '*not there*') `
        "The missing bundle was refused for the wrong reason: $($absent.Reason)"

    # The bundle itself disagreeing with the receipt, which is the v0.28.0 failure: a bundle
    # built before its release commit existed carries the previous commit's pin, and nobody can
    # reproduce the published hash from the tag.
    $strayBundle = Join-Path $allowlistRoot 'patches-stray.mpp'
    New-TestBundle -Path $strayBundle -Timestamp 1699999999000L
    $strayReceipt = New-TestReceipt -Mutate {
        param($r)
        $r.bundle.sizeBytes = (Get-Item -LiteralPath $strayBundle).Length
        $r.bundle.sha256 = Get-Sha256Hex -Path $strayBundle
        $r.bundle.timestamp = 1699999999000L
    }
    $strayResult = Test-ReleaseReceipt -Receipt $strayReceipt -ExpectedVersion '9.9.9' `
        -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
        -ExpectedManagerFloor '1.29.0' -BundlePath $strayBundle
    Assert-True (-not $strayResult.Valid) 'A bundle built from another commit was accepted.'
    Assert-True ($strayResult.Reason -like '*different*commit*') `
        "The stale bundle pin was refused for the wrong reason: $($strayResult.Reason)"

    foreach ($wrong in @(
        @{ Name = 'a bundle stamped with another version'; Version = '9.9.8'; Patcher = '1.12.0'
            Pattern = '*manifest says version*' },
        @{ Name = 'a bundle stamped by another patcher'; Version = '9.9.9'; Patcher = '1.13.0'
            Pattern = '*stamped by patcher*' })) {
        $odd = Join-Path $allowlistRoot 'patches-odd.mpp'
        New-TestBundle -Path $odd -Version $wrong.Version -Patcher $wrong.Patcher
        $oddReceipt = New-TestReceipt -Mutate {
            param($r)
            $r.bundle.sizeBytes = (Get-Item -LiteralPath $odd).Length
            $r.bundle.sha256 = Get-Sha256Hex -Path $odd
        }
        $oddResult = Test-ReleaseReceipt -Receipt $oddReceipt -ExpectedVersion '9.9.9' `
            -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
            -ExpectedManagerFloor '1.29.0' -BundlePath $odd
        Assert-True (-not $oddResult.Valid) "Receipt validation accepted $($wrong.Name)."
        Assert-True ($oddResult.Reason -like $wrong.Pattern) `
            "$($wrong.Name) was refused for the wrong reason: $($oddResult.Reason)"
    }

    # The commit the receipt names, checked against something outside the receipt. Its own
    # timestamp field and the bundle stamp both come from the same document, so a receipt kept
    # from an earlier release agrees with itself and passes on that pair alone.
    $sameCommit = Test-ReleaseReceipt -Receipt (New-TestReceipt) -ExpectedVersion '9.9.9' `
        -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
        -ExpectedManagerFloor '1.29.0' -BundlePath $bundle `
        -ActualCommitTimestamp $commitSeconds
    Assert-True $sameCommit.Valid "A receipt matching git was refused: $($sameCommit.Reason)"

    $movedCommit = Test-ReleaseReceipt -Receipt (New-TestReceipt) -ExpectedVersion '9.9.9' `
        -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
        -ExpectedManagerFloor '1.29.0' -BundlePath $bundle `
        -ActualCommitTimestamp ($commitSeconds + 60)
    Assert-True (-not $movedCommit.Valid) `
        'A receipt whose commit time git disagrees with was accepted.'
    Assert-True ($movedCommit.Reason -like '*git says*') `
        "The stale receipt was refused for the wrong reason: $($movedCommit.Reason)"

    $otherCommit = Test-ReleaseReceipt -Receipt (New-TestReceipt) -ExpectedVersion '9.9.9' `
        -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
        -ExpectedManagerFloor '1.29.0' -BundlePath $bundle `
        -ExpectedCommit ('f' * 40)
    Assert-True (-not $otherCommit.Valid) 'A receipt for another commit was accepted on a release.'
    Assert-True ($otherCommit.Reason -like '*this release is*') `
        "The wrong-commit receipt was refused for the wrong reason: $($otherCommit.Reason)"

    # A truncated document, which is the shape @($null) turns into one null entry.
    foreach ($missing in @('targets', 'dexPayloads')) {
        $truncated = $templateJson | ConvertFrom-Json
        if ($missing -eq 'targets') {
            $truncated.PSObject.Properties.Remove('targets')
        } else {
            $truncated.extension.PSObject.Properties.Remove('dexPayloads')
        }
        $result = Test-TestReceipt -Receipt $truncated
        Assert-True (-not $result.Valid) "A receipt with no $missing was accepted."
        Assert-True ($result.Reason -like '*no target*' -or $result.Reason -like '*no extension*') `
            "A receipt with no $missing was refused for the wrong reason: $($result.Reason)"
    }

    $withDelta = New-TestReceipt -Mutate {
        param($r) $r.targets[0].manifestDelta.permissionsAdded = @('android.permission.VIBRATE')
    }
    $unreviewed = Test-TestReceipt -Receipt $withDelta
    Assert-True (-not $unreviewed.Valid) 'An unreviewed manifest change was accepted.'
    Assert-True ($unreviewed.Reason -like '*nobody reviewed*') `
        "The unreviewed manifest change was refused for the wrong reason: $($unreviewed.Reason)"

    $reviewed = Test-TestReceipt -Receipt $withDelta -Approved @('permission-added android.permission.VIBRATE')
    Assert-True $reviewed.Valid "A reviewed manifest change was refused: $($reviewed.Reason)"

    # The shape a real run hands over, rather than a literal @(). An allowlist file with no
    # entries reaches the validator as $null, and treating that null as an approved entry failed
    # every clean run with an empty list of changes nobody could read.
    $emptyFromFile = Join-Path $allowlistRoot 'empty.txt'
    Set-Content -LiteralPath $emptyFromFile -Encoding UTF8 -Value @('# nothing approved', '')
    $fromFile = Read-ManifestDeltaAllowlist -Path $emptyFromFile
    $clean = Test-TestReceipt -Receipt (New-TestReceipt) -Approved $fromFile
    Assert-True $clean.Valid `
        "A receipt with no manifest change failed against an empty allowlist: $($clean.Reason)"
    $cleanNull = Test-TestReceipt -Receipt (New-TestReceipt) -Approved $null
    Assert-True $cleanNull.Valid `
        "A receipt with no manifest change failed against a null allowlist: $($cleanNull.Reason)"

    $stale = Test-TestReceipt -Receipt (New-TestReceipt) -Approved @('permission-added android.permission.VIBRATE')
    Assert-True (-not $stale.Valid) 'An allowlist entry no patch produces was accepted.'
    Assert-True ($stale.Reason -like '*any more*') `
        "The stale allowlist entry was refused for the wrong reason: $($stale.Reason)"
} finally {
    Remove-Item -LiteralPath $allowlistRoot -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host '[scripts] release receipt schema, manifest reading and validation contracts passed'

# --- validate-release-facts.ps1 -------------------------------------------------------------
#
# The gate the pre-push hook runs on every push that touches a published file, and the one a
# release cannot go out without. Its receipt half has been exercised above since the receipt
# existed; the facts half, which is what holds README.md and patches-bundle.json to the
# generated catalog, had never been shown to fail at all.
#
# Driven against a copy of this checkout rather than a hand-built tree: a fixture assembled by
# hand is a second opinion about what the release files look like, and the thing worth catching
# is a real file drifting from the real catalog. One fact is moved per case.

$factsScript = Join-Path $PSScriptRoot 'validate-release-facts.ps1'
$factsRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushfeed-facts-" + [guid]::NewGuid().ToString('N'))
try {
    New-Item -ItemType Directory -Path $factsRoot -Force | Out-Null
    foreach ($relative in @('patches-list.json', 'patches-bundle.json', 'gradle.properties', 'README.md')) {
        Copy-Item -LiteralPath (Join-Path $Root $relative) -Destination (Join-Path $factsRoot $relative)
    }
    New-Item -ItemType Directory -Path (Join-Path $factsRoot 'gradle') -Force | Out-Null
    Copy-Item -LiteralPath (Join-Path $Root 'gradle/libs.versions.toml') `
        -Destination (Join-Path $factsRoot 'gradle/libs.versions.toml')

    function Invoke-Facts {
        param([switch]$WithUrls)
        $arguments = @{ Root = $factsRoot; SkipDescriptionTestCount = $true }
        if (-not $WithUrls) { $arguments['SkipUrlCheck'] = $true }
        # 6>, not *>. The check says what it found with Write-Host, which is the information
        # stream, and that is all this wants to hide. Redirecting every stream also swallows the
        # terminating error, so each case below was accepted in silence and proved nothing.
        & $factsScript @arguments 6> $null
    }

    function Set-FactsFile {
        param([string]$Name, [scriptblock]$Edit)
        $path = Join-Path $factsRoot $Name
        $text = Get-Content -LiteralPath $path -Raw
        Set-Content -LiteralPath $path -Value (& $Edit $text) -Encoding UTF8 -NoNewline
    }

    function Reset-FactsFile {
        param([string]$Name)
        Copy-Item -LiteralPath (Join-Path $Root $Name) -Destination (Join-Path $factsRoot $Name) -Force
    }

    # The control. Everything below is this same tree with one fact moved, so a failure there is
    # the moved fact talking and not the fixture being wrong.
    Invoke-Facts
    Assert-True ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) `
        'The release facts check refused an unmodified copy of this checkout.'

    $catalogVersion = ((Get-Content -LiteralPath (Join-Path $factsRoot 'gradle.properties')) `
        -match '^version\s*=' | Select-Object -First 1) -replace '^version\s*=\s*', ''

    # A published index naming a version the catalog does not build. This is the shape v0.28.0
    # shipped in: the index said one thing and the bundle behind it was another.
    Set-FactsFile 'patches-bundle.json' {
        param($text) $text -replace [regex]::Escape('"' + $catalogVersion + '"'), '"0.0.1"'
    }
    Assert-Throws { Invoke-Facts } '*' 'A published index naming another version was accepted.'
    Reset-FactsFile 'patches-bundle.json'

    # The count the published description quotes, which is what somebody reads before they
    # install. A number nobody would notice by eye, which is why the catalog is the source of it.
    Set-FactsFile 'patches-bundle.json' {
        param($text) $text -replace '\b\d+ patches\b', '3 patches'
    }
    Assert-Throws { Invoke-Facts } '*' 'An index counting patches the catalog does not have was accepted.'
    Reset-FactsFile 'patches-bundle.json'

    # The same number in the README, which is the other half of the same promise.
    Set-FactsFile 'README.md' {
        param($text) $text -replace '\b\d+ patches\b', '3 patches'
    }
    Assert-Throws { Invoke-Facts } '*' 'A README counting patches the catalog does not have was accepted.'
    Reset-FactsFile 'README.md'

    # The Manager floor in the README is what stops somebody being told to use a Manager that
    # refuses the bundle, so it is held to the patcher the catalog pins.
    Set-FactsFile 'README.md' {
        param($text) $text -replace 'Morphe Manager 1\.29\.0 or newer', 'Morphe Manager 1.20.0 or newer'
    }
    Assert-Throws { Invoke-Facts } '*' 'A README naming a Manager older than the patcher needs was accepted.'
    Reset-FactsFile 'README.md'

    # A dead link in the index, answered from this machine so the case needs no network of its
    # own: nothing listens on port 1, so the request is refused before it leaves the host.
    Set-FactsFile 'patches-bundle.json' {
        param($text) $text -replace 'https://github\.com/SysAdminDoc/hushfeed/releases/download/[^"]+',
            'http://127.0.0.1:1/patches.mpp'
    }
    Assert-Throws { Invoke-Facts -WithUrls } '*' 'An index pointing at a dead address was accepted.'
    Reset-FactsFile 'patches-bundle.json'

    # And the same tree, once every fact is put back, is accepted again. Without this the cases
    # above would also pass against a fixture that had become permanently broken.
    Invoke-Facts
    Assert-True ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) `
        'The release facts check refused the fixture after every change was put back.'
} finally {
    Remove-Item -LiteralPath $factsRoot -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host '[scripts] release facts contracts passed'

$global:LASTEXITCODE = 0
Write-Host '[scripts] report, target, Java and guarded replacement contracts passed'
