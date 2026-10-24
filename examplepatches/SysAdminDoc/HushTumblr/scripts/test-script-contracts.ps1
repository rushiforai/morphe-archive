<#
.SYNOPSIS
    Exercise the release and gate scripts: patch target and report, receipts, release facts,
    pre-push routing, the changelog, d8 and Java resolution, split bundles and the shared helpers.
.DESCRIPTION
    Ported from Hushfeed's suite by way of Hushfacebook and held to Tumblr's facts: the declared
    build at its pinned version code, Tumblr's signer, and .xapk or .apkm split bundles. The
    pre-push hook runs it for changes under scripts/, and for README.md,
    patches-list.json or patches/build.gradle.kts. A missing suite stops the push.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'patch-report.ps1')
. (Join-Path $PSScriptRoot 'device-install.ps1')
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'script-wiring.ps1')

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

function Test-DescriptionChangelogFacts {
    param([string]$ValidatorPath)
    $parseErrors = $null
    $ast = [System.Management.Automation.Language.Parser]::ParseFile($ValidatorPath, [ref]$null, [ref]$parseErrors)
    Assert-True (@($parseErrors).Count -eq 0) 'The release facts script does not parse.'
    $reader = $ast.Find({ param($node)
        $node -is [System.Management.Automation.Language.FunctionDefinitionAst] -and $node.Name -eq 'Get-DescriptionFacts'
    }, $true)
    Assert-True ($null -ne $reader) 'The release facts reader is missing.'
    Invoke-Expression $reader.Extent.Text

    $summary = 'HushTumblr v0.0.7: 42 patches for Tumblr 46.5.0.109. Validation: 900 runtime tests passed. All 200 patch tests passed. Needs Morphe Manager 1.34.0 or newer.'
    $history = '* **Tumblr:** Earlier releases had 36 patches for Tumblr 46.4.0.110, with 700 runtime tests passed and 180 patch tests passed. Needs Morphe Manager 1.33.0 or newer.'
    foreach ($newline in @("`n", "`r`n")) {
        foreach ($heading in @('### Changed', "###`tChanged")) {
            $facts = Get-DescriptionFacts -Text ($summary + $newline + $newline + $heading + $newline + $history) -Source 'fixture'
            Assert-True ($facts.PatchCount -eq 42 -and $facts.TargetVersion -eq '46.5.0.109') `
                'Historical changelog facts replaced the release summary.'
            Assert-True ($facts.Summary.TrimEnd() -ceq $summary) `
                'The release summary retained changelog test counts, versions or Manager requirements.'
        }
    }
    $facts = Get-DescriptionFacts -Text $summary -Source 'fixture'
    Assert-True ($facts.Summary -ceq $summary -and $facts.PatchCount -eq 42) 'A prose-only index stopped working.'
    $facts = Get-DescriptionFacts -Text ("Summary only.`n`n### Changed`n" + $history) -Source 'fixture'
    Assert-True ($null -eq $facts.PatchCount -and $null -eq $facts.TargetVersion) `
        'Changelog bullets supplied facts missing from the summary.'
    Assert-Throws { Get-DescriptionFacts -Text ($summary + ' It has 41 patches.') -Source 'fixture' } `
        '*names*patches*' 'Contradictory summary counts were accepted.'
    Assert-Throws { Get-DescriptionFacts -Text ($summary + ' Also targets Tumblr 46.4.0.110.') -Source 'fixture' } `
        '*names Tumblr*' 'Contradictory summary builds were accepted.'
    Assert-Throws { Get-DescriptionFacts -Text ($summary + ' An inline ### marker says 41 patches.') -Source 'fixture' } `
        '*names*patches*' 'An inline marker hid contradictory summary facts.'
    Write-Host '[test] Manager description summary and changelog contracts passed'
}
Test-DescriptionChangelogFacts -ValidatorPath (Join-Path $PSScriptRoot 'validate-release-facts.ps1')

function New-NotFoundAnswer {
    # What Invoke-WebRequest raises for a 404 in both shells, as far as Assert-UrlReachable reads
    # it: an error whose Response carries the status. A function named Invoke-WebRequest that
    # throws this stands in for the request, so no case here needs the network.
    $answer = New-Object System.Exception 'Response status code does not indicate success: 404 (Not Found).'
    Add-Member -InputObject $answer -NotePropertyName Response -NotePropertyValue ([pscustomobject]@{ StatusCode = 404 })
    return $answer
}

# --- patch-target.ps1 ------------------------------------------------------------------------
#
# Tumblr ships new builds often, so the catalog declares the build the bundle was last proved on
# and can keep the one before it. They come back newest first, by number and not by text, and every
# patch has to declare the same builds: a build only some patches declare is one the bundle can't
# fully patch, and the release scripts would take it for a declared target.
$catalog = Get-Content -LiteralPath (Join-Path $Root 'patches-list.json') -Raw | ConvertFrom-Json
$target = Get-PatchTarget -PatchList $catalog
Assert-True ($target.PackageName -eq 'com.tumblr') 'The catalog package was not resolved.'
Assert-True (@($target.PackageVersions).Count -ge 1 -and $target.PackageVersion -eq $target.PackageVersions[0]) `
    "The catalog's declared Tumblr builds were not read: $($target.PackageVersions -join ', ')"
foreach ($patch in @($catalog.patches)) {
    Assert-True (((@($patch.compatiblePackages.'com.tumblr') | Sort-Object) -join ',') -eq
        ((@($target.PackageVersions) | Sort-Object) -join ',')) `
        "$($patch.name) declares other Tumblr builds than the rest of the catalog."
}
# And the version code each build is pinned to. One Tumblr version can come as several arm64
# builds, each with its own dex, so a name alone doesn't say which of them the patches were proved
# on. In the Facebook sibling a receipt counted another 580 build (vc 475019283 beside the declared
# 475019344) as an unforced run of the declared one.
foreach ($version in @($target.PackageVersions)) {
    $pinned = @($catalog.patches[0].compatibility | Where-Object { $_.packageName -eq 'com.tumblr' } |
        ForEach-Object { @($_.targets) } | Where-Object { $_.version -eq $version } |
        ForEach-Object { $_.versionCodes.PSObject.Properties } | ForEach-Object { [string]$_.Value })
    Assert-True ($pinned.Count -gt 0 -and (@($target.PackageVersionCodes[$version]) -join ',') -eq (($pinned | Sort-Object -Unique) -join ',')) `
        "The version codes the catalog pins to Tumblr $version were not read: $(@($target.PackageVersionCodes[$version]) -join ', ')"
    Assert-True (Test-DeclaredBuild -Target $target -VersionName $version -VersionCode $pinned[0]) `
        "Tumblr $version at its pinned code $($pinned[0]) was not taken for a declared build."
    Assert-True (-not (Test-DeclaredBuild -Target $target -VersionName $version -VersionCode "$([long]$pinned[0] - 61)")) `
        "Another build of Tumblr $version, version code $([long]$pinned[0] - 61), was taken for the declared one."
}
Assert-True (-not (Test-DeclaredBuild -Target $target -VersionName '1.0.0' -VersionCode '1')) 'An undeclared version was taken for a declared build.'

$threeBuilds = [pscustomobject]@{
    patches = @(
        [pscustomobject]@{ name = 'one'
            compatiblePackages = [pscustomobject]@{ 'com.example.app' = @('448.0.0.54.85', '99.1.0.0.1', '449.0.0.54.82') } },
        [pscustomobject]@{ name = 'two'
            compatiblePackages = [pscustomobject]@{ 'com.example.app' = @('449.0.0.54.82', '99.1.0.0.1', '448.0.0.54.85') } })
}
$three = Get-PatchTarget -PatchList $threeBuilds
Assert-True (($three.PackageVersions -join ',') -eq '449.0.0.54.82,448.0.0.54.85,99.1.0.0.1' -and
    $three.PackageVersion -eq '449.0.0.54.82') `
    "Declared builds were not ordered newest first by number: $($three.PackageVersions -join ', ')"

# Every part of the version, as a number. Some apps' have five and [version] takes four, so the fifth
# was dropped and builds apart only there sorted as equals, the older one first in both shells.
$fifthPart = [pscustomobject]@{
    patches = @([pscustomobject]@{ name = 'hotfixes'
        compatiblePackages = [pscustomobject]@{ 'com.example.app' = @('449.0.0.54.8', '449.0.0.54.10', '449.0.0.54', '449.0.0.54.9') } })
}
$fifth = Get-PatchTarget -PatchList $fifthPart
Assert-True (($fifth.PackageVersions -join ',') -eq '449.0.0.54.10,449.0.0.54.9,449.0.0.54.8,449.0.0.54' -and
    $fifth.PackageVersion -eq '449.0.0.54.10') `
    "Builds apart only in their fifth part were not ordered newest first: $($fifth.PackageVersions -join ', ')"
$notNumbers = [pscustomobject]@{
    patches = @([pscustomobject]@{ name = 'lettered'
        compatiblePackages = [pscustomobject]@{ 'com.example.app' = @('449.0.0.54.82', '449.0.0.54.x') } })
}
Assert-Throws { Get-PatchTarget -PatchList $notNumbers } "*449.0.0.54.x, which isn't a version of dotted numbers*" `
    'A declared version that is not dotted numbers was sorted instead of refused.'

$uneven = [pscustomobject]@{
    patches = @(
        [pscustomobject]@{ name = 'both builds'
            compatiblePackages = [pscustomobject]@{ 'com.example.app' = @('449.0.0.54.82', '448.0.0.54.85') } },
        [pscustomobject]@{ name = 'newest only'
            compatiblePackages = [pscustomobject]@{ 'com.example.app' = @('449.0.0.54.82') } })
}
Assert-Throws { Get-PatchTarget -PatchList $uneven } '*newest only*' `
    'A build only some patches declare was accepted as a target of the whole bundle.'
# The same for the codes: two patches pinning one version to different builds don't declare one.
function New-PinnedPatch([string]$Name, [int]$Code) {
    [pscustomobject]@{ name = $Name
        compatiblePackages = [pscustomobject]@{ 'com.example.app' = @('449.0.0.54.82') }
        compatibility = @([pscustomobject]@{ packageName = 'com.example.app'
            targets = @([pscustomobject]@{ version = '449.0.0.54.82'; versionCodes = [pscustomobject]@{ ARM64_V8A = $Code } }) }) }
}
Assert-Throws { Get-PatchTarget -PatchList ([pscustomobject]@{ patches = @((New-PinnedPatch 'pinned' 511908382),
            (New-PinnedPatch 'another build' 511908321)) }) } '*another build declares 449.0.0.54.82 (511908321)*' `
    'Two patches pinning one version to different builds were read as one declared build.'
# A catalog that pins no code is read by the version name, as before.
Assert-True ((Test-DeclaredBuild -Target $three -VersionName '99.1.0.0.1' -VersionCode '12345') -and
    @($three.PackageVersionCodes['99.1.0.0.1']).Count -eq 0) 'A build declared without a version code was not matched by its name.'

# Tumblr's own signer, on every patch. Morphe Manager refuses an APK whose signer the patch
# doesn't list.
$tumblrSigners = @('39ac9c821ad2d605e4849f066e8aad3cca27d5e13eb03ad8755be234a2985dfd')
foreach ($patch in @($catalog.patches)) {
    $declaredSigners = @($patch.compatibility | Where-Object { $_.packageName -eq 'com.tumblr' } |
        ForEach-Object { @($_.signatures) } | Sort-Object -Unique)
    Assert-True (($declaredSigners -join ',') -eq ($tumblrSigners -join ',')) `
        "$($patch.name) declares Tumblr signers $($declaredSigners -join ', '), not Tumblr's own."
}

$allNames = @($catalog.patches | ForEach-Object { $_.name })
$allDependencies = @(Get-PatchDependencyNames -PatchList $catalog -RequestedNames $allNames | Sort-Object)
Assert-True (($allDependencies -join ',') -eq 'BytecodePatch,ResourcePatch') `
    "The real catalog dependency closure is not the two internal patch types: $($allDependencies -join ', ')"
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

$twoPackages = [pscustomobject]@{
    patches = @(
        [pscustomobject]@{ name = 'one app'; compatiblePackages = [pscustomobject]@{ 'com.example.app' = @('1.0.0') } },
        [pscustomobject]@{ name = 'another app'; compatiblePackages = [pscustomobject]@{ 'com.example.other' = @('1.0.0') } })
}
Assert-Throws { Get-PatchTarget -PatchList $twoPackages } '*Expected one compatible package*' `
    'A catalog naming two apps was accepted.'
$missingTarget = [pscustomobject]@{ patches = @([pscustomobject]@{ name = 'missing target' }) }
Assert-Throws { Get-PatchTarget -PatchList $missingTarget } '*has no compatible package*' `
    'A patch without compatibility metadata was accepted.'

$tempBase = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
$caseRoot = [System.IO.Path]::GetFullPath((Join-Path $tempBase ("hushtumblr-script-test-" + [guid]::NewGuid().ToString('N'))))
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
    # A result with no steps, or a null one, is turned down by its reason. It used to throw,
    # since @($null) holds one item, which ended a run that should have patched over a kept one.
    foreach ($steps in @('absent', 'null')) {
        $stepless = $dependencyReport.PSObject.Copy()
        if ($steps -eq 'absent') { $stepless.PSObject.Properties.Remove('patchingSteps') } else { $stepless.patchingSteps = @($null) }
        $steplessValidation = Test-PatchingReport -Report $stepless -ExpectedNames $allNames `
            -AllowedDependencyNames $allDependencies -OutputPath $reportApk `
            -ExpectedPackageName $target.PackageName -ExpectedPackageVersion $target.PackageVersion
        Assert-True (-not $steplessValidation.Valid -and $steplessValidation.Reason -ceq 'a patching step failed or is missing') `
            "A result whose patching steps are $steps was not turned down for them alone: $($steplessValidation.Reason)"
    }
    # morphe-desktop 1.19.0 names the list stepResults. Its passing steps count, and a failed one
    # is still refused, so the 1.19 shape is read and not just tolerated.
    foreach ($stepOk in @($true, $false)) {
        $renamed = $dependencyReport.PSObject.Copy()
        $renamed.PSObject.Properties.Remove('patchingSteps')
        $renamed | Add-Member -NotePropertyName stepResults -NotePropertyValue @(
            [pscustomobject]@{ success = $true }, [pscustomobject]@{ success = $stepOk })
        $renamedValidation = Test-PatchingReport -Report $renamed -ExpectedNames $allNames `
            -AllowedDependencyNames $allDependencies -OutputPath $reportApk `
            -ExpectedPackageName $target.PackageName -ExpectedPackageVersion $target.PackageVersion
        if ($stepOk) {
            Assert-True $renamedValidation.Valid "A 1.19 result with passing stepResults was rejected: $($renamedValidation.Reason)"
        } else {
            Assert-True (-not $renamedValidation.Valid -and $renamedValidation.Reason -ceq 'a patching step failed or is missing') `
                "A 1.19 result with a failed step in stepResults was not turned down: $($renamedValidation.Reason)"
        }
    }
    # failedPatches left out or null is no failed patch, as kotlinx leaves out a field equal to its
    # default; it used to count as one through @($null). A null entry in the list is still one.
    foreach ($failures in @('absent', 'null', 'null entry')) {
        $failless = $dependencyReport.PSObject.Copy()
        switch ($failures) {
            'absent' { $failless.PSObject.Properties.Remove('failedPatches') }
            'null' { $failless.failedPatches = $null }
            'null entry' { $failless.failedPatches = @($null) }
        }
        $faillessValidation = Test-PatchingReport -Report $failless -ExpectedNames $allNames `
            -AllowedDependencyNames $allDependencies -OutputPath $reportApk `
            -ExpectedPackageName $target.PackageName -ExpectedPackageVersion $target.PackageVersion
        $faillessOk = if ($failures -eq 'null entry') {
            -not $faillessValidation.Valid -and $faillessValidation.Reason -ceq '1 failed patches' -and $faillessValidation.Failed -eq 1
        } else { $faillessValidation.Valid -and $faillessValidation.Failed -eq 0 }
        Assert-True $faillessOk "A result whose failed patches are $failures was judged wrongly: $($faillessValidation.Reason)"
    }
    # A script hands no path for an output it couldn't hold. That's a result turned down for the
    # APK alone, not a throw, which Test-ApkFile's Test-Path on an empty path used to be. A $null
    # and a left-out -OutputPath both reach the [string] parameter as '', so this is all three.
    $noOutput = Test-PatchingReport -Report $dependencyReport -ExpectedNames $allNames `
        -AllowedDependencyNames $allDependencies -OutputPath '' `
        -ExpectedPackageName $target.PackageName -ExpectedPackageVersion $target.PackageVersion
    Assert-True (-not $noOutput.Valid -and $noOutput.Reason -ceq 'saved APK is missing or invalid') `
        "A result handed no output path wasn't turned down for the APK alone: $($noOutput.Reason)"

    # The old replacement expectations contradicted account preservation. Exercise refusal
    # before device mutation, signer checks and ownership instead of expecting uninstalls.
    & (Join-Path $PSScriptRoot 'test-device-safety.ps1') -Root $Root
    # The walk publish holds a release to: the result it earns and the receipts it writes.
    & (Join-Path $PSScriptRoot 'test-walk-app.ps1') -Root $Root

    $emptyJdk = Join-Path $caseRoot 'empty-jdk'
    New-Item -ItemType Directory -Path $emptyJdk | Out-Null
    Assert-Throws {
        Resolve-Java -Explicit $emptyJdk
    } "*$emptyJdk*" 'An explicit directory without bin/java fell through to the PATH Java.'

    $pathJava = Resolve-Java
    Assert-True ([System.IO.Path]::IsPathRooted($pathJava)) `
        'The Java resolver returned a command name instead of the executable path its callers need.'
    $jdkRoot = Split-Path -Parent (Split-Path -Parent $pathJava)
    $resolvedJava = Resolve-Java -Explicit $jdkRoot
    Assert-True ([System.IO.Path]::GetFullPath($resolvedJava).Equals(
        [System.IO.Path]::GetFullPath($pathJava), [System.StringComparison]::OrdinalIgnoreCase)) `
        'A valid explicit JDK directory did not resolve its bin/java executable.'

    # A release bundle older than the sources it is built from. On 2026-09-23 a test run after a
    # patch change left it behind the new hook and the phone got the old one; patch-for-device
    # now stops on it. Build output beside a module's sources must not count.
    $staleRoot = Join-Path $caseRoot 'stale-bundle'
    $patchSource = Join-Path $staleRoot 'patches/src/main/kotlin/Hook.kt'
    $extensionSource = Join-Path $staleRoot 'extensions/app/library/src/main/java/Hook.java'
    $buildOutput = Join-Path $staleRoot 'extensions/app/build/intermediates/Hook.class'
    $gradleFile = Join-Path $staleRoot 'extensions/app/build.gradle.kts'
    $staleBundle = Join-Path $staleRoot 'patches/build/release/patches-1.0.0.mpp'
    $staleFiles = @($patchSource, $extensionSource, $buildOutput, $gradleFile, $staleBundle)
    foreach ($file in $staleFiles) {
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $file) | Out-Null
        [System.IO.File]::WriteAllText($file, 'x', [System.Text.Encoding]::ASCII)
    }
    $then = [DateTime]::UtcNow.AddHours(-1)
    foreach ($file in $staleFiles) { [System.IO.File]::SetLastWriteTimeUtc($file, $then) }
    [System.IO.File]::SetLastWriteTimeUtc($staleBundle, $then.AddMinutes(5))
    Assert-True (@(Get-SourcesNewerThanBundle -Root $staleRoot -Bundle $staleBundle).Count -eq 0) `
        'A bundle built after every source was called stale.'
    [System.IO.File]::SetLastWriteTimeUtc($buildOutput, $then.AddMinutes(9))
    Assert-True (@(Get-SourcesNewerThanBundle -Root $staleRoot -Bundle $staleBundle).Count -eq 0) `
        'Build output written after the bundle was counted as a source.'
    [System.IO.File]::SetLastWriteTimeUtc($extensionSource, $then.AddMinutes(8))
    $newer = @(Get-SourcesNewerThanBundle -Root $staleRoot -Bundle $staleBundle)
    Assert-True ($newer.Count -eq 1 -and $newer[0].FullName -eq (Get-Item -LiteralPath $extensionSource).FullName) `
        "A submodule's source written after the bundle was missed: $(@($newer | ForEach-Object FullName) -join ', ')"
    [System.IO.File]::SetLastWriteTimeUtc($patchSource, $then.AddMinutes(6))
    [System.IO.File]::SetLastWriteTimeUtc($gradleFile, $then.AddMinutes(7))
    $newer = @(Get-SourcesNewerThanBundle -Root $staleRoot -Bundle $staleBundle)
    Assert-True ($newer.Count -eq 3 -and
        $newer[0].FullName -eq (Get-Item -LiteralPath $extensionSource).FullName -and
        $newer[1].FullName -eq (Get-Item -LiteralPath $gradleFile).FullName -and
        $newer[2].FullName -eq (Get-Item -LiteralPath $patchSource).FullName) `
        "Newer sources are not all listed, newest first: $(@($newer | ForEach-Object FullName) -join ', ')"
    # The R8 rules every extension's build reads, and a compile-only stub in a patches
    # submodule (its constants can be inlined into patch code), count too.
    $rules = Join-Path $staleRoot 'extensions/proguard-rules.pro'
    $stub = Join-Path $staleRoot 'patches/stub/src/main/java/android/os/Build.java'
    foreach ($file in @($rules, $stub)) {
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $file) | Out-Null
        [System.IO.File]::WriteAllText($file, 'x', [System.Text.Encoding]::ASCII)
        [System.IO.File]::SetLastWriteTimeUtc($file, $then)
    }
    Assert-True (@(Get-SourcesNewerThanBundle -Root $staleRoot -Bundle $staleBundle).Count -eq 3) `
        'An R8 rules file or a stub written before the bundle was counted.'
    [System.IO.File]::SetLastWriteTimeUtc($rules, $then.AddMinutes(10))
    [System.IO.File]::SetLastWriteTimeUtc($stub, $then.AddMinutes(11))
    $newer = @(Get-SourcesNewerThanBundle -Root $staleRoot -Bundle $staleBundle)
    Assert-True ($newer.Count -eq 5 -and
        $newer[0].FullName -eq (Get-Item -LiteralPath $stub).FullName -and
        $newer[1].FullName -eq (Get-Item -LiteralPath $rules).FullName) `
        "The R8 rules or a patches submodule's stub was missed: $(@($newer | ForEach-Object FullName) -join ', ')"
    # NOTICE as well: :extensions:tumblr compiles it into the payload for the Licenses row, so a
    # bundle built before it moved carries the old text.
    $notice = Join-Path $staleRoot 'NOTICE'
    [System.IO.File]::WriteAllText($notice, 'x', [System.Text.Encoding]::ASCII)
    [System.IO.File]::SetLastWriteTimeUtc($notice, $then)
    Assert-True (@(Get-SourcesNewerThanBundle -Root $staleRoot -Bundle $staleBundle).Count -eq 5) `
        'A NOTICE written before the bundle was counted.'
    [System.IO.File]::SetLastWriteTimeUtc($notice, $then.AddMinutes(12))
    $newer = @(Get-SourcesNewerThanBundle -Root $staleRoot -Bundle $staleBundle)
    Assert-True ($newer.Count -eq 6 -and $newer[0].FullName -eq (Get-Item -LiteralPath $notice).FullName) `
        "A NOTICE written after the bundle, which the payload carries, was missed: $(@($newer | ForEach-Object FullName) -join ', ')"
    $deviceScript = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'patch-for-device.ps1') -Raw
    Assert-True ($deviceScript -match 'Get-SourcesNewerThanBundle' -and
        $deviceScript -match '\[switch\]\$AllowStaleBundle') `
        'patch-for-device.ps1 patches with a bundle without asking whether its sources are newer.'
} finally {
    if ($caseRoot.StartsWith($requiredPrefix, [System.StringComparison]::OrdinalIgnoreCase) -and
        (Test-Path -LiteralPath $caseRoot)) {
        Remove-Item -LiteralPath $caseRoot -Recurse -Force
    }
}

$consumerScripts = @('patch-for-device.ps1', 'verify-all-patches.ps1', 'build-release-receipt.ps1')
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
    '      E: uses-sdk (line=8)',
    '        A: http://schemas.android.com/apk/res/android:minSdkVersion(0x0101020c)=21',
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
Assert-True ($facts.minSdk -eq 21) 'The binary manifest minimum SDK was not read.'
foreach ($withoutMinimum in @(
        @($manifestLines | Where-Object { $_ -notlike '*minSdkVersion*' }),
        @($manifestLines | Where-Object { $_ -notlike '*minSdkVersion*' -and $_ -notlike '*E: uses-sdk*' }))) {
    $defaultSdk = ConvertFrom-ManifestXmlTree -Lines $withoutMinimum -Source 'default-sdk'
    Assert-True ($defaultSdk.minSdk -eq 1) 'An omitted manifest minimum did not use Android''s API 1 default.'
}
foreach ($invalid in @('', '0', '-1', 'Future', '2147483648')) {
    $invalidLines = @($manifestLines | ForEach-Object { $_ -replace '(minSdkVersion\(0x0101020c\)=)21$', "`${1}$invalid" })
    Assert-Throws { ConvertFrom-ManifestXmlTree -Lines $invalidLines -Source 'invalid-sdk' } '*Invalid minSdkVersion*' `
        "A binary manifest with invalid minimum $invalid was accepted."
}
Assert-Throws {
    ConvertFrom-ManifestXmlTree -Lines ($manifestLines + @('      E: uses-sdk (line=90)')) -Source 'duplicate-sdk'
} '*More than one uses-sdk*' 'An ambiguous binary minimum SDK was accepted.'
foreach ($pair in @(@(21, 26), @(26, 26), @(36, 36))) {
    $floor = Test-PatchedMinSdk -StockMinSdk $pair[0] -PatchedMinSdk $pair[1]
    Assert-True $floor.Valid "A correct binary floor $($pair -join ' -> ') was refused: $($floor.Reason)"
}
foreach ($pair in @(@(21, 25), @(36, 26), @(21, 27), @($null, 26), @(21, $null), @('21', 26), @(21, 26.5))) {
    $floor = Test-PatchedMinSdk -StockMinSdk $pair[0] -PatchedMinSdk $pair[1]
    Assert-True (-not $floor.Valid) "An invalid binary floor $($pair -join ' -> ') was accepted."
}
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
$entries = ConvertTo-ManifestDeltaEntries -Delta $delta -SchemaVersion 3
Assert-True (($entries -join '; ') -eq (@(
    'exported-added receiver:com.example.host.Probe',
    'permission-added android.permission.VIBRATE',
    'permission-removed android.permission.CAMERA') -join '; ')) `
    "The delta did not flatten to allowlist lines: $($entries -join '; ')"

$unchanged = Get-ManifestDelta -Stock $facts -Patched $facts
Assert-True (@(ConvertTo-ManifestDeltaEntries -Delta $unchanged).Count -eq 0) `
    'An unchanged manifest produced a delta.'

# The checked-in allowlist approves one change and nothing else: HushTumblr settings exports an
# alias of Tumblr's launcher activity for Android's App info page.
$settingsTemplates = @(Read-ManifestDeltaAllowlist -Path (Join-Path $PSScriptRoot 'manifest-delta-allowlist.txt') `
    -SelectedPatchNames @('HushTumblr settings') | Where-Object { $_ })
$checkedInAllowlist = @($settingsTemplates | Where-Object { $_ -like 'exported-added *' })
$unselectedTemplates = @(Read-ManifestDeltaAllowlist -Path (Join-Path $PSScriptRoot 'manifest-delta-allowlist.txt') `
    -SelectedPatchNames @() |
    Where-Object { $_ })
$settingsAlias = 'activity-alias:app.hushtumblr.extension.tumblr.settings.OpenSettings'
$approvedEntries = @("exported-added $settingsAlias")
Assert-True ((@($checkedInAllowlist | Sort-Object -CaseSensitive) -join "`n") -ceq
        (@($approvedEntries | Sort-Object -CaseSensitive) -join "`n")) `
    ('The checked-in manifest delta allowlist approves something besides the settings alias, or leaves it ' +
     "out: $($checkedInAllowlist -join ', ')")
Assert-True ($settingsTemplates.Count -eq 3 -and $unselectedTemplates.Count -eq 0 -and
    @($settingsTemplates | Where-Object { $_ -like 'component-added *' }).Count -eq 1 -and
    @($settingsTemplates | Where-Object { $_ -like 'filter-added *' }).Count -eq 1) `
    'Settings must select only the reviewed alias, component and preferences intent filter templates.'

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
            [string]$Patcher = '1.12.0', [hashtable]$Entries = @{})
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
            foreach ($name in @($Entries.Keys | Sort-Object)) {
                $writer = New-Object System.IO.StreamWriter($archive.CreateEntry($name).Open())
                try { $writer.Write($Entries[$name]) } finally { $writer.Dispose() }
            }
        } finally { $archive.Dispose() }
    }

    # An SBOM in the shape :patches:releaseSbom writes, describing the bundle at -Bundle: its name,
    # hash, version and pinned stamp, the libraries given as package URLs, the patch module as the
    # first-party code, and each extension payload the bundle carries with its hash. -Mutate edits
    # the document before it's written.
    function New-TestSbom {
        param([string]$Path, [string]$Bundle,
            [string[]]$Libraries = @('pkg:maven/com.google.code.gson/gson@2.14.0'), [scriptblock]$Mutate)
        $bundleName = Split-Path -Leaf $Bundle
        $facts = Get-BundleManifestFacts -BundlePath $Bundle
        $components = New-Object System.Collections.Generic.List[object]
        foreach ($purl in @($Libraries | Where-Object { $_ })) {
            $parts = [regex]::Match($purl, '^pkg:maven/([^/]+)/([^@]+)@(.+)$')
            $components.Add([ordered]@{ type = 'library'; 'bom-ref' = $purl; group = $parts.Groups[1].Value
                name = $parts.Groups[2].Value; version = $parts.Groups[3].Value; scope = 'required'; purl = $purl
                properties = @([ordered]@{ name = 'hushtumblr:carried-by'; value = $bundleName }) })
        }
        $components.Add([ordered]@{ type = 'library'; 'bom-ref' = 'project:patches'; name = ':patches'
            version = $facts.version; scope = 'required'
            properties = @([ordered]@{ name = 'hushtumblr:first-party'; value = 'built from this repository' }) })
        $archive = [System.IO.Compression.ZipFile]::OpenRead($Bundle)
        try {
            foreach ($entry in @($archive.Entries | Where-Object { $_.FullName -like 'extensions/*.mpe' } | Sort-Object FullName)) {
                $stream = $entry.Open()
                $sha = [System.Security.Cryptography.SHA256]::Create()
                try { $digest = ($sha.ComputeHash($stream) | ForEach-Object { '{0:x2}' -f $_ }) -join '' } finally { $sha.Dispose(); $stream.Dispose() }
                $components.Add([ordered]@{ type = 'file'; 'bom-ref' = $entry.FullName; name = $entry.FullName
                    version = $facts.version; scope = 'required'; hashes = @([ordered]@{ alg = 'SHA-256'; content = $digest }) })
            }
        } finally { $archive.Dispose() }
        $document = [ordered]@{
            bomFormat = 'CycloneDX'; specVersion = '1.6'; serialNumber = "urn:uuid:$([guid]::NewGuid())"; version = 1
            metadata = [ordered]@{
                timestamp = [DateTimeOffset]::FromUnixTimeMilliseconds($facts.timestamp).UtcDateTime.ToString(
                    "yyyy-MM-dd'T'HH:mm:ss'Z'", [Globalization.CultureInfo]::InvariantCulture)
                component = [ordered]@{ type = 'file'; 'bom-ref' = $bundleName; name = $bundleName; version = $facts.version
                    hashes = @([ordered]@{ alg = 'SHA-256'; content = (Get-Sha256Hex -Path $Bundle).ToLowerInvariant() }) }
            }
            components = $components.ToArray()
            dependencies = @()
        }
        if ($Mutate) { & $Mutate $document }
        Set-Content -LiteralPath $Path -Encoding UTF8 -Value ($document | ConvertTo-Json -Depth 12)
    }

    $bundle = Join-Path $allowlistRoot 'patches-9.9.9.mpp'
    New-TestBundle -Path $bundle -Entries @{ 'extensions/tumblr.mpe' = "dex`n035 payload" }
    $bundleHash = Get-Sha256Hex -Path $bundle
    $bundleSize = (Get-Item -LiteralPath $bundle).Length
    $sbomFile = Join-Path $allowlistRoot 'patches-9.9.9.cdx.json'
    New-TestSbom -Path $sbomFile -Bundle $bundle

    $manifestFacts = Get-BundleManifestFacts -BundlePath $bundle
    Assert-True ($manifestFacts.version -eq '9.9.9') 'The bundle manifest version was not read.'
    Assert-True ($manifestFacts.timestamp -eq 1700000000000L) 'The bundle timestamp was not read.'
    Assert-True ($manifestFacts.patcherVersion -eq '1.12.0') 'The bundle patcher stamp was not read.'

    # Two declared builds, the way a catalog declares the newest release and the one before it
    # when Tumblr moves on, each pinned to its version code, and a run of each.
    $declaredBuilds = @('46.7.3', '46.6.1')
    $declaredCodes = @{ '46.7.3' = [string[]]@('2024607030'); '46.6.1' = [string[]]@('2024606010') }
    $template = [ordered]@{
        # These Alpha/Beta receipts exercise the historical four-list schema.
        schemaVersion = 3
        release   = [ordered]@{ version = '9.9.9'; tag = 'v9.9.9'
            commit = '0123456789abcdef0123456789abcdef01234567'
            commitTimestamp = $commitSeconds; patchCount = 2 }
        bundle    = [ordered]@{ file = 'patches-9.9.9.mpp'; sizeBytes = $bundleSize
            sha256 = $bundleHash; timestamp = 1700000000000L }
        sbom      = [ordered]@{ file = 'patches-9.9.9.cdx.json'; sha256 = (Get-Sha256Hex -Path $sbomFile); components = 3 }
        toolchain = [ordered]@{ patcherVersion = '1.12.0'; managerFloor = '1.29.0' }
        extension = [ordered]@{ dexPayloads = @([ordered]@{
            name = 'extensions/tumblr.mpe'; sizeBytes = 10; sha256 = ('A' * 64) }) }
        targets   = @([ordered]@{
            source = [ordered]@{ file = 'stock.apkm'; package = 'com.example.host'
                versionName = '46.7.3'; versionCode = '2024607030'; sha256 = ('B' * 64)
                forced = $false }
            patches = @([ordered]@{ name = 'Alpha'; applied = $true; reason = $null },
                        [ordered]@{ name = 'Beta'; applied = $true; reason = $null })
            sdk = [ordered]@{ stockMinSdk = 21; patchedMinSdk = 26 }
            manifestDelta = [ordered]@{ permissionsAdded = @(); permissionsRemoved = @()
                exportedComponentsAdded = @(); exportedComponentsRemoved = @() }
        }, [ordered]@{
            source = [ordered]@{ file = 'previous.apkm'; package = 'com.example.host'
                versionName = '46.6.1'; versionCode = '2024606010'; sha256 = ('D' * 64)
                signedFormSha256 = $null; forced = $false }
            patches = @([ordered]@{ name = 'Alpha'; applied = $true; reason = $null },
                        [ordered]@{ name = 'Beta'; applied = $true; reason = $null })
            sdk = [ordered]@{ stockMinSdk = 36; patchedMinSdk = 36 }
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
        param($Receipt, [string[]]$Approved = @(), [int]$Schema = 3)
        return Test-ReleaseReceipt -Receipt $Receipt -ExpectedVersion '9.9.9' `
            -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
            -ExpectedManagerFloor '1.29.0' -ExpectedPackageName 'com.example.host' -ExpectedPackageVersions $declaredBuilds `
            -ExpectedPackageVersionCodes $declaredCodes -BundlePath $bundle -ApprovedManifestDelta $Approved -ExpectedSchemaVersion $Schema
    }

    $valid = Test-TestReceipt -Receipt (New-TestReceipt)
    Assert-True $valid.Valid "A complete receipt was refused: $($valid.Reason)"
    # An unsigned universal APK's target names the bundle it was trusted on. A bundle's names none
    # (null), and a receipt from before the field leaves it out, as the first target does.
    $vouched = Test-TestReceipt -Receipt (New-TestReceipt -Mutate { param($r)
            $r.targets[1].source.file = 'previous.apk'; $r.targets[1].source.signedFormSha256 = ('E' * 64) })
    Assert-True $vouched.Valid "A receipt naming the bundle that vouched for a universal APK was refused: $($vouched.Reason)"

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
        'a vouching bundle named by no hash'    = { param($r) $r.targets[1].source.file = 'previous.apk'; $r.targets[1].source.signedFormSha256 = 'nope' }
        'a vouching bundle hash in lower case'  = { param($r) $r.targets[1].source.file = 'previous.apk'; $r.targets[1].source.signedFormSha256 = ('e' * 64) }
        'a vouching bundle hash and a newline'  = { param($r) $r.targets[1].source.file = 'previous.apk'; $r.targets[1].source.signedFormSha256 = ('E' * 64) + "`n" }
        'a vouching bundle named by a number'   = { param($r) $r.targets[1].source.file = 'previous.apk'; $r.targets[1].source.signedFormSha256 = 1234 }
        'a vouching bundle hash in an array'    = { param($r) $r.targets[1].source.file = 'previous.apk'; $r.targets[1].source.signedFormSha256 = @('E' * 64) }
        'a bundle vouched for by another'       = { param($r) $r.targets[1].source.signedFormSha256 = ('E' * 64) }
        'a target with no binary SDK facts'      = { param($r) $r.targets[0].PSObject.Properties.Remove('sdk') }
        'a target with no stock minimum'        = { param($r) $r.targets[0].sdk.PSObject.Properties.Remove('stockMinSdk') }
        'a target with no patched minimum'      = { param($r) $r.targets[0].sdk.PSObject.Properties.Remove('patchedMinSdk') }
        'a string SDK minimum'                  = { param($r) $r.targets[0].sdk.patchedMinSdk = '26' }
        'a fractional SDK minimum'              = { param($r) $r.targets[0].sdk.patchedMinSdk = 26.5 }
        'a minimum below API 26'                = { param($r) $r.targets[0].sdk.patchedMinSdk = 25 }
        'a lowered higher stock minimum'        = { param($r) $r.targets[1].sdk.patchedMinSdk = 26 }
        'an unnecessarily raised stock minimum' = { param($r) $r.targets[0].sdk.patchedMinSdk = 27 }
        'fewer verdicts than patches'           = { param($r) $r.targets[0].patches = @($r.targets[0].patches[0]) }
        'a patch the catalog does not list'     = { param($r) $r.targets[0].patches[1].name = 'Gamma' }
        'the same patch reported twice'         = { param($r) $r.targets[0].patches[1].name = 'Alpha' }
        'a patch that did not apply'            = { param($r) $r.targets[0].patches[1].applied = $false }
        'a receipt with no commit time'         = { param($r) $r.release.commitTimestamp = 0 }
        'a stamp that is not the bundle stamp'  = { param($r) $r.bundle.timestamp = 1700000001000L }
        'a run against another package'         = { param($r) $r.targets[0].source.package = 'com.example.other' }
        'a run with no version name'            = { param($r) $r.targets[0].source.versionName = '' }
        'a receipt that omits the forced flag'  = { param($r) $r.targets[0].source.PSObject.Properties.Remove('forced') }
        'a forced flag that is not a boolean'   = { param($r) $r.targets[0].source.forced = 'false' }
        'a declared-version run marked forced'  = { param($r) $r.targets[0].source.forced = $true }
        'only forced runs past the target'      = { param($r) $r.targets[0].source.versionName = '46.8.3'; $r.targets[0].source.forced = $true; $r.targets = @($r.targets[0]) }
        'a newer build patched without -f'      = { param($r) $r.targets[0].source.versionName = '46.8.3' }
        'a run of the newest declared build only' = { param($r) $r.targets = @($r.targets[0]) }
        'the older declared build forced'       = { param($r) $r.targets[1].source.forced = $true }
        'both runs at the newest declared build' = { param($r) $r.targets[1].source.versionName = '46.7.3' }
        'another build of a declared version patched without -f' = { param($r) $r.targets[1].source.versionCode = '2024605949' }
        'a receipt that names no SBOM'          = { param($r) $r.PSObject.Properties.Remove('sbom') }
        'an SBOM named for another version'     = { param($r) $r.sbom.file = 'patches-9.9.8.cdx.json' }
        'an SBOM with no hash'                  = { param($r) $r.sbom.sha256 = 'nope' }
        'an SBOM hash in lower case'            = { param($r) $r.sbom.sha256 = ([string]$r.sbom.sha256).ToLowerInvariant() }
        'an SBOM counting no component'         = { param($r) $r.sbom.components = 0 }
    }
    foreach ($description in $mutations.Keys) {
        $result = Test-TestReceipt -Receipt (New-TestReceipt -Mutate $mutations[$description])
        Assert-True (-not $result.Valid) "Receipt validation accepted $description."
        Assert-True ([bool]$result.Reason) "Receipt validation refused $description without saying why."
    }
    # Each malformed vouching hash is refused for being no upper-case SHA-256, not by some later
    # check: a one-element array included, which -cnotmatch alone lets through, since on an array
    # it answers the elements that don't match.
    foreach ($description in @($mutations.Keys | Where-Object { $_ -clike 'a vouching bundle*' })) {
        $result = Test-TestReceipt -Receipt (New-TestReceipt -Mutate $mutations[$description])
        Assert-True ([string]$result.Reason -clike "The receipt names the bundle that vouched for * by something that isn't an upper-case SHA-256:*") `
            "Receipt validation refused $description for another reason: $($result.Reason)"
    }

    # A receipt built only from forced runs against newer builds has to be refused for that
    # reason and name the target it is missing, not trip over some other field on the way.
    $onlyForced = Test-TestReceipt -Receipt (New-TestReceipt -Mutate $mutations['only forced runs past the target'])
    Assert-True ($onlyForced.Reason -like '*No target*46.7.3*without -f*46.8.3*') `
        "A forced-only receipt was refused for the wrong reason: $($onlyForced.Reason)"
    # A release that ran only the newest build names the declared build it never patched.
    $newestOnly = Test-TestReceipt -Receipt (New-TestReceipt -Mutate $mutations['a run of the newest declared build only'])
    Assert-True ($newestOnly.Reason -like '*No target*46.6.1*without -f*') `
        "A receipt missing a declared build was refused for the wrong reason: $($newestOnly.Reason)"
    $secondTarget = New-TestReceipt -Mutate {
        param($r)
        $newer = $r.targets[0] | ConvertTo-Json -Depth 8 | ConvertFrom-Json
        $newer.source.versionName = '46.8.3'
        $newer.source.forced = $true
        $r.targets = @($r.targets[0], $r.targets[1], $newer)
    }
    $twoTargets = Test-TestReceipt -Receipt $secondTarget
    Assert-True $twoTargets.Valid "A receipt with the declared target beside a forced run was refused: $($twoTargets.Reason)"
    # Another build of a declared version is a build of its own: patched without -f it is refused
    # for that, naming the code the catalog pins, and forced beside the declared runs it is fine.
    $otherBuild = Test-TestReceipt -Receipt (New-TestReceipt -Mutate $mutations['another build of a declared version patched without -f'])
    Assert-True ($otherBuild.Reason -like '*46.6.1 (version code 2024605949) was patched without -f at a declared build*46.6.1 (2024606010)*') `
        "Another build of a declared version was refused for the wrong reason: $($otherBuild.Reason)"
    $forcedOtherBuild = Test-TestReceipt -Receipt (New-TestReceipt -Mutate {
        param($r)
        $variant = $r.targets[1] | ConvertTo-Json -Depth 8 | ConvertFrom-Json
        $variant.source.versionCode = '2024605949'
        $variant.source.forced = $true
        $r.targets = @($r.targets[0], $r.targets[1], $variant)
    })
    Assert-True $forcedOtherBuild.Valid "Another build of a declared version, forced beside the declared runs, was refused: $($forcedOtherBuild.Reason)"

    # The bundle the receipt is about, gone. Every fact above is checked against a file, and a
    # missing file is the one case where there is nothing to disagree with, so an unguarded
    # check would read it as agreement and pass the release.
    $absent = Test-ReleaseReceipt -ExpectedSchemaVersion 3 -Receipt (New-TestReceipt) -ExpectedVersion '9.9.9' `
        -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
        -ExpectedManagerFloor '1.29.0' -ExpectedPackageName 'com.example.host' -ExpectedPackageVersions $declaredBuilds -BundlePath (Join-Path $allowlistRoot 'not-built.mpp')
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
    $strayResult = Test-ReleaseReceipt -ExpectedSchemaVersion 3 -Receipt $strayReceipt -ExpectedVersion '9.9.9' `
        -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
        -ExpectedManagerFloor '1.29.0' -ExpectedPackageName 'com.example.host' -ExpectedPackageVersions $declaredBuilds -BundlePath $strayBundle
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
        $oddResult = Test-ReleaseReceipt -ExpectedSchemaVersion 3 -Receipt $oddReceipt -ExpectedVersion '9.9.9' `
            -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
            -ExpectedManagerFloor '1.29.0' -ExpectedPackageName 'com.example.host' -ExpectedPackageVersions $declaredBuilds -BundlePath $odd
        Assert-True (-not $oddResult.Valid) "Receipt validation accepted $($wrong.Name)."
        Assert-True ($oddResult.Reason -like $wrong.Pattern) `
            "$($wrong.Name) was refused for the wrong reason: $($oddResult.Reason)"
    }

    # The commit the receipt names, checked against something outside the receipt. Its own
    # timestamp field and the bundle stamp both come from the same document, so a receipt kept
    # from an earlier release agrees with itself and passes on that pair alone.
    $sameCommit = Test-ReleaseReceipt -ExpectedSchemaVersion 3 -Receipt (New-TestReceipt) -ExpectedVersion '9.9.9' `
        -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
        -ExpectedManagerFloor '1.29.0' -ExpectedPackageName 'com.example.host' -ExpectedPackageVersions $declaredBuilds -BundlePath $bundle `
        -ActualCommitTimestamp $commitSeconds
    Assert-True $sameCommit.Valid "A receipt matching git was refused: $($sameCommit.Reason)"

    $movedCommit = Test-ReleaseReceipt -ExpectedSchemaVersion 3 -Receipt (New-TestReceipt) -ExpectedVersion '9.9.9' `
        -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
        -ExpectedManagerFloor '1.29.0' -ExpectedPackageName 'com.example.host' -ExpectedPackageVersions $declaredBuilds -BundlePath $bundle `
        -ActualCommitTimestamp ($commitSeconds + 60)
    Assert-True (-not $movedCommit.Valid) `
        'A receipt whose commit time git disagrees with was accepted.'
    Assert-True ($movedCommit.Reason -like '*git says*') `
        "The stale receipt was refused for the wrong reason: $($movedCommit.Reason)"

    $otherCommit = Test-ReleaseReceipt -ExpectedSchemaVersion 3 -Receipt (New-TestReceipt) -ExpectedVersion '9.9.9' `
        -ExpectedPatchNames @('Alpha', 'Beta') -ExpectedPatcherVersion '1.12.0' `
        -ExpectedManagerFloor '1.29.0' -ExpectedPackageName 'com.example.host' -ExpectedPackageVersions $declaredBuilds -BundlePath $bundle `
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

    # The checked-in allowlist, against receipts that carry the approved change on both builds. They
    # pass. They plus any other change are refused, naming only the other, and a receipt with the
    # approved change gone is refused for the one no patch makes any more.
    $withApproved = {
        param($r)
        foreach ($target in $r.targets) {
            $target.manifestDelta.exportedComponentsAdded = @($settingsAlias)
        }
    }
    $approvedReceipt = Test-TestReceipt -Receipt (New-TestReceipt -Mutate $withApproved) -Approved $checkedInAllowlist
    Assert-True $approvedReceipt.Valid "A receipt carrying the approved change was refused: $($approvedReceipt.Reason)"
    $unapproved = Test-TestReceipt -Receipt (New-TestReceipt) -Approved $checkedInAllowlist
    Assert-True (-not $unapproved.Valid -and $unapproved.Reason -like '*any more*') `
        "A receipt without the approved change passed the allowlist that approves it: $($unapproved.Reason)"
    foreach ($other in @(
            @{ Name = 'another permission asked for'; Entry = 'permission-added android.permission.READ_SMS'
                Change = { param($t) $t.manifestDelta.permissionsAdded = @($t.manifestDelta.permissionsAdded) + 'android.permission.READ_SMS' } },
            @{ Name = 'a second settings alias'; Entry = 'exported-added activity-alias:app.hushtumblr.extension.tumblr.settings.Other'
                Change = { param($t) $t.manifestDelta.exportedComponentsAdded = @($t.manifestDelta.exportedComponentsAdded) + 'activity-alias:app.hushtumblr.extension.tumblr.settings.Other' } },
            @{ Name = 'another permission dropped'; Entry = 'permission-removed android.permission.CAMERA'
                Change = { param($t) $t.manifestDelta.permissionsRemoved = @($t.manifestDelta.permissionsRemoved) + 'android.permission.CAMERA' } },
            @{ Name = 'a component exported'; Entry = 'exported-added service:com.tumblr.push.fcm.TumblrFirebaseMessagingService'
                Change = { param($t) $t.manifestDelta.exportedComponentsAdded = @($t.manifestDelta.exportedComponentsAdded) + 'service:com.tumblr.push.fcm.TumblrFirebaseMessagingService' } },
            @{ Name = 'a component no longer exported'; Entry = 'exported-removed activity:com.tumblr.ui.activity.JumpoffActivity'
                Change = { param($t) $t.manifestDelta.exportedComponentsRemoved = @('activity:com.tumblr.ui.activity.JumpoffActivity') } })) {
        $receipt = New-TestReceipt -Mutate { param($r) & $withApproved $r; & $other.Change $r.targets[1] }
        $result = Test-TestReceipt -Receipt $receipt -Approved $checkedInAllowlist
        Assert-True (-not $result.Valid) "With the settings alias approved, $($other.Name) was accepted."
        Assert-True ($result.Reason -like "*nobody reviewed: $($other.Entry)") `
            "With the settings alias approved, $($other.Name) was refused for the wrong reason: $($result.Reason)"
    }
    $halfway = New-TestReceipt -Mutate {
        param($r)
        & $withApproved $r
        foreach ($target in $r.targets) { $target.manifestDelta.exportedComponentsAdded = @() }
    }
    $half = Test-TestReceipt -Receipt $halfway -Approved $checkedInAllowlist
    Assert-True (-not $half.Valid -and $half.Reason -like '*any more*OpenSettings*') `
        "A receipt without the settings alias passed the allowlist that approves it: $($half.Reason)"

    # The SBOM a receipt names. Each refusal has to name the SBOM fact that failed rather than trip
    # over the next field, or a check that went missing would pass unseen behind the one after it.
    foreach ($named in @(
            @{ Name = 'a receipt that names no SBOM'; Pattern = '*names no SBOM*' },
            @{ Name = 'an SBOM named for another version'; Pattern = '*names the SBOM patches-9.9.8.cdx.json; the one for 9.9.9 is patches-9.9.9.cdx.json*' },
            @{ Name = 'an SBOM with no hash'; Pattern = '*no SHA-256 for patches-9.9.9.cdx.json*' },
            @{ Name = 'an SBOM hash in lower case'; Pattern = '*no SHA-256 for patches-9.9.9.cdx.json*' },
            @{ Name = 'an SBOM counting no component'; Pattern = '*counts no component in patches-9.9.9.cdx.json*' })) {
        $result = Test-TestReceipt -Receipt (New-TestReceipt -Mutate $mutations[$named.Name])
        Assert-True ($result.Reason -like $named.Pattern) "$($named.Name) was refused for the wrong reason: $($result.Reason)"
    }

    # Read back, the SBOM gives what it was written with, and it describes the bundle beside it.
    $sbomRead = Read-ReleaseSbom -Path $sbomFile
    Assert-True ($sbomRead.BundleName -eq 'patches-9.9.9.mpp' -and $sbomRead.BundleVersion -eq '9.9.9' -and
        $sbomRead.BundleSha256 -ceq $bundleHash.ToLowerInvariant() -and $sbomRead.Timestamp -eq '2023-11-14T22:13:20Z' -and
        @($sbomRead.Components).Count -eq 3 -and @($sbomRead.Libraries).Count -eq 1 -and
        $sbomRead.Libraries[0].Purl -eq 'pkg:maven/com.google.code.gson/gson@2.14.0' -and $sbomRead.Libraries[0].Name -eq 'gson' -and
        @($sbomRead.Payloads).Count -eq 1 -and $sbomRead.Payloads[0].Ref -eq 'extensions/tumblr.mpe' -and
        $sbomRead.Sha256 -eq (Get-Sha256Hex -Path $sbomFile)) `
        "The SBOM was misread: $($sbomRead.BundleName) $($sbomRead.BundleVersion) $($sbomRead.Timestamp), $(@($sbomRead.Components).Count) components"
    $bound = Test-ReleaseSbom -Sbom $sbomRead -BundlePath $bundle -BundleName 'patches-9.9.9.mpp'
    Assert-True $bound.Valid "An SBOM of the bundle was refused: $($bound.Reason)"

    # The receipt against the SBOM file itself: its hash and its count, and through it the bundle.
    function Test-ReceiptWithSbom($Receipt, [string]$Sbom = $sbomFile, [int]$Schema = 3) {
        return Test-ReleaseReceipt -Receipt $Receipt -ExpectedVersion '9.9.9' -ExpectedPatchNames @('Alpha', 'Beta') `
            -ExpectedPatcherVersion '1.12.0' -ExpectedManagerFloor '1.29.0' -ExpectedPackageName 'com.example.host' `
            -ExpectedPackageVersions $declaredBuilds -BundlePath $bundle -SbomPath $Sbom -ExpectedSchemaVersion $Schema
    }
    $withSbom = Test-ReceiptWithSbom (New-TestReceipt)
    Assert-True $withSbom.Valid "A receipt was refused against the SBOM it names: $($withSbom.Reason)"
    foreach ($wrong in @(
            @{ Name = 'an SBOM hash that is not the SBOM'; Mutate = { param($r) $r.sbom.sha256 = ('C' * 64) }; Pattern = '*says patches-9.9.9.cdx.json hashes to CCCC*' },
            @{ Name = 'a count that is not the SBOM''s'; Mutate = { param($r) $r.sbom.components = 4 }; Pattern = '*counts 4 components in patches-9.9.9.cdx.json; it lists 3*' })) {
        $result = Test-ReceiptWithSbom (New-TestReceipt -Mutate $wrong.Mutate)
        Assert-True (-not $result.Valid -and $result.Reason -like $wrong.Pattern) "A receipt with $($wrong.Name) was not refused for it: $($result.Reason)"
    }
    $missingSbom = Test-ReceiptWithSbom (New-TestReceipt) -Sbom (Join-Path $allowlistRoot 'absent.cdx.json')
    Assert-True ($missingSbom.Reason -like '*an SBOM that is not there*') "A receipt was checked against an SBOM that isn't there: $($missingSbom.Reason)"
    # An SBOM that isn't this bundle's, each way it can differ, with the receipt recording its hash
    # so that the difference is what refuses it.
    $variant = Join-Path $allowlistRoot 'variant\patches-9.9.9.cdx.json'
    New-Item -ItemType Directory -Path (Split-Path -Parent $variant) -Force | Out-Null
    foreach ($other in @(
            @{ Name = 'another bundle''s hash'; Mutate = { param($d) $d.metadata.component.hashes[0].content = ('0' * 64) }
                Pattern = '*describes a patches-9.9.9.mpp that hashes to 0000*written for another build*' },
            @{ Name = 'a date from the clock'; Mutate = { param($d) $d.metadata.timestamp = '2026-09-25T10:00:00Z' }
                Pattern = '*is dated 2026-09-25T10:00:00Z, and patches-9.9.9.mpp is stamped 2023-11-14T22:13:20Z*' },
            @{ Name = 'another version'; Mutate = { param($d) $d.metadata.component.version = '9.9.8' }; Pattern = '*says patches-9.9.9.mpp is version 9.9.8*' },
            @{ Name = 'another bundle''s name'; Mutate = { param($d) $d.metadata.component.name = 'patches-9.9.8.mpp' }; Pattern = '*describes patches-9.9.8.mpp, not patches-9.9.9.mpp*' },
            @{ Name = 'no payload'; Mutate = { param($d) $d.components = @($d.components | Where-Object { $_.type -ne 'file' }) }
                Pattern = '*carries extensions/tumblr.mpe, which patches-9.9.9.cdx.json doesn''t describe*' },
            @{ Name = 'another payload hash'; Mutate = { param($d) @($d.components | Where-Object { $_.type -eq 'file' })[0].hashes[0].content = ('1' * 64) }
                Pattern = '*describes extensions/tumblr.mpe hashing to 1111*' },
            @{ Name = 'a payload the bundle lacks'; Mutate = { param($d) $d.components = @($d.components) + @([ordered]@{ type = 'file'; 'bom-ref' = 'extensions/shared.mpe'
                    name = 'extensions/shared.mpe'; version = '9.9.9'; scope = 'required'; hashes = @([ordered]@{ alg = 'SHA-256'; content = ('2' * 64) }) }) }
                Pattern = '*describes extensions/shared.mpe, which patches-9.9.9.mpp doesn''t carry*' })) {
        New-TestSbom -Path $variant -Bundle $bundle -Mutate $other.Mutate
        $variantCount = @((Get-Content -LiteralPath $variant -Raw | ConvertFrom-Json).components).Count
        $result = Test-ReceiptWithSbom (New-TestReceipt -Mutate {
            param($r) $r.sbom.sha256 = Get-Sha256Hex -Path $variant; $r.sbom.components = $variantCount }) -Sbom $variant
        Assert-True (-not $result.Valid -and $result.Reason -like $other.Pattern) `
            "An SBOM with $($other.Name) was taken for the bundle's: $($result.Reason)"
    }

    # The SBOM's own shape. OSV answers {} for a package URL it can't read, so a library that isn't
    # asked about under its own group, name and version would read as having no advisory.
    foreach ($broken in @(
            @{ Name = 'another format'; Mutate = { param($d) $d.bomFormat = 'SPDX' }; Pattern = '*is not a CycloneDX 1.6 SBOM*' },
            @{ Name = 'another spec version'; Mutate = { param($d) $d.specVersion = '1.5' }; Pattern = '*is not a CycloneDX 1.6 SBOM*' },
            @{ Name = 'no bundle hash'; Mutate = { param($d) $d.metadata.component.Remove('hashes') }; Pattern = '*does not name the bundle it describes*' },
            @{ Name = 'a package URL for another version'; Mutate = { param($d) $d.components[0].purl = 'pkg:maven/com.google.code.gson/gson@2.8.8' }
                Pattern = '*with the package URL pkg:maven/com.google.code.gson/gson@2.8.8, which doesn''t name its own group, name and version*' },
            @{ Name = 'a package URL with no group'; Mutate = { param($d) $d.components[0].purl = 'pkg:maven/gson@2.14.0' }
                Pattern = '*with the package URL pkg:maven/gson@2.14.0, which doesn''t name*' },
            @{ Name = 'a package URL for another group'; Mutate = { param($d) $d.components[0].purl = 'pkg:maven/com.google.gson/gson@2.14.0' }
                Pattern = '*with the package URL pkg:maven/com.google.gson/gson@2.14.0, which doesn''t name*' },
            @{ Name = 'a package URL for another name'; Mutate = { param($d) $d.components[0].purl = 'pkg:maven/com.google.code.gson/gson-extras@2.14.0' }
                Pattern = '*with the package URL pkg:maven/com.google.code.gson/gson-extras@2.14.0, which doesn''t name*' },
            @{ Name = 'something that is not a package URL, beside empty fields'
                Mutate = { param($d) $d.components[0].purl = 'not-a-package-url'; $d.components[0].group = ''; $d.components[0].name = ''; $d.components[0].version = '' }
                Pattern = '*with the package URL not-a-package-url, which doesn''t name*' },
            @{ Name = 'a library with no package URL'; Mutate = { param($d) $d.components[0].Remove('purl') }; Pattern = '*the library pkg:maven/com.google.code.gson/gson@2.14.0 with no package URL*' },
            @{ Name = 'the same component twice'; Mutate = { param($d) $d.components = @($d.components) + @($d.components[0]) }; Pattern = '*lists pkg:maven/com.google.code.gson/gson@2.14.0 twice*' },
            @{ Name = 'a component of another type'; Mutate = { param($d) $d.components[0].type = 'framework' }; Pattern = '*as a framework, which a release SBOM doesn''t hold*' },
            @{ Name = 'a payload with no hash'; Mutate = { param($d) @($d.components | Where-Object { $_.type -eq 'file' })[0].Remove('hashes') }; Pattern = '*the file extensions/tumblr.mpe with no SHA-256*' },
            @{ Name = 'no component'; Mutate = { param($d) $d.components = @() }; Pattern = '*lists no component*' })) {
        New-TestSbom -Path $variant -Bundle $bundle -Mutate $broken.Mutate
        Assert-Throws { Read-ReleaseSbom -Path $variant } $broken.Pattern "An SBOM with $($broken.Name) was read without complaint."
    }
    Set-Content -LiteralPath $variant -Encoding ASCII -Value 'not json'
    Assert-Throws { Read-ReleaseSbom -Path $variant } '*patches-9.9.9.cdx.json is not JSON*' 'Text that is not JSON was read as an SBOM.'

    # A receipt cut before schema 2 names no SBOM, and is read as its own commit wrote it; each
    # schema is refused where the other is expected.
    $schemaOne = New-TestReceipt -Mutate {
        param($r)
        $r.schemaVersion = 1
        $r.PSObject.Properties.Remove('sbom')
        foreach ($target in $r.targets) { $target.PSObject.Properties.Remove('sdk') }
    }
    $oneAtOne = Test-ReleaseReceipt -Receipt $schemaOne -ExpectedVersion '9.9.9' -ExpectedPatchNames @('Alpha', 'Beta') `
        -ExpectedPatcherVersion '1.12.0' -ExpectedManagerFloor '1.29.0' -ExpectedPackageName 'com.example.host' `
        -ExpectedPackageVersions $declaredBuilds -BundlePath $bundle -ExpectedSchemaVersion 1
    Assert-True $oneAtOne.Valid "A schema 1 receipt was refused at schema 1: $($oneAtOne.Reason)"
    $oneAtTwo = Test-TestReceipt -Receipt $schemaOne -Schema 2
    Assert-True ($oneAtTwo.Reason -like '*schema version 1; its release is read at version 2*') `
        "A schema 1 receipt was not refused where schema 2 is expected: $($oneAtTwo.Reason)"
    $schemaTwo = New-TestReceipt -Mutate {
        param($r)
        $r.schemaVersion = 2
        foreach ($target in $r.targets) { $target.PSObject.Properties.Remove('sdk') }
    }
    $twoAtOne = Test-ReceiptWithSbom $schemaTwo -Schema 1
    Assert-True ($twoAtOne.Reason -like '*schema version 2; its release is read at version 1*') `
        "A schema 2 receipt was not refused where schema 1 is expected: $($twoAtOne.Reason)"
    $oneWithSbom = Test-ReceiptWithSbom $schemaOne -Schema 1
    Assert-True ($oneWithSbom.Reason -like '*schema 1 receipt names no SBOM to hold*') `
        "A schema 1 receipt was held to an SBOM it can't name: $($oneWithSbom.Reason)"
    $twoAtTwo = Test-ReceiptWithSbom $schemaTwo -Schema 2
    Assert-True $twoAtTwo.Valid "A shipped schema 2 receipt with its SBOM and no SDK facts was refused: $($twoAtTwo.Reason)"
    $twoAtCurrent = Test-TestReceipt -Receipt $schemaTwo
    Assert-True ($twoAtCurrent.Reason -like '*schema version 2; its release is read at version 3*') `
        "A schema 2 receipt was accepted where binary SDK facts are required: $($twoAtCurrent.Reason)"
} finally {
    Remove-Item -LiteralPath $allowlistRoot -Recurse -Force -ErrorAction SilentlyContinue
}

# Which catalog a receipt is judged against. A receipt describes a release that has shipped, so
# moving the patcher pin afterwards must not turn it into a failure; a release, whose receipt is
# cut against the catalog it was built from, must still be held to that catalog exactly.
#
# Driven against a real two-commit repository, because the whole question is what `git show` says
# at a commit and a fake cannot answer that.
#
# Every git call below goes through Invoke-FixtureGit, and that is not tidiness. On 2026-09-15
# this block ran from inside the pre-push hook, which is a git child process, so GIT_DIR and
# GIT_WORK_TREE were in its environment. `git -C <tempdir>` changes the working directory and
# does not override GIT_DIR, so `init` reused the real repository, `add -A` read the two-file
# temp tree through it and staged every other tracked file as deleted, and three fixture commits
# authored by Contracts landed on the branch and were pushed to main, where the tip deleted all
# 703 files. Clearing the environment is the fix; the assertion after init is what would have
# stopped it in the second it happened.
$toolchainRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-toolchain-" + [guid]::NewGuid().ToString('N'))
$toolchainRemote = "$toolchainRoot-published.git"

function Invoke-FixtureGit {
    <#
    .SYNOPSIS
        git against a fixture repository, with no inherited git environment.
    .DESCRIPTION
        Removes every GIT_* variable for the length of the call, so the repository git acts on is
        the one -C names and nothing else. Run from a hook, GIT_DIR alone is enough to point all
        of this at the real tree.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Root,
        [Parameter(Mandatory = $true)][string[]]$Arguments
    )

    $saved = @{}
    foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
        $saved[$variable.Name] = $variable.Value
        Remove-Item -LiteralPath ('Env:\' + $variable.Name) -ErrorAction SilentlyContinue
    }
    try {
        return & git -C $Root @Arguments 2>&1
    } finally {
        foreach ($name in $saved.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $saved[$name] }
    }
}

try {
    New-Item -ItemType Directory -Path (Join-Path $toolchainRoot 'gradle') -Force | Out-Null
    $catalogFile = Join-Path $toolchainRoot 'gradle/libs.versions.toml'
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('init', '--quiet') | Out-Null

    # Where git says it will write, asked before anything is written. A fixture that has taken
    # hold of the real repository fails here instead of committing to it.
    $fixtureGitDir = "$(Invoke-FixtureGit -Root $toolchainRoot -Arguments @('rev-parse', '--absolute-git-dir') |
        Select-Object -First 1)".Trim()
    $expectedGitDir = (Join-Path $toolchainRoot '.git')
    Assert-True ($fixtureGitDir -and
        ([IO.Path]::GetFullPath($fixtureGitDir).TrimEnd('\', '/') -ieq [IO.Path]::GetFullPath($expectedGitDir).TrimEnd('\', '/'))) `
        ("The fixture repository resolved to $fixtureGitDir, not $expectedGitDir. Refusing to " +
            'write: this is the shape that put three fixture commits on the real branch.')

    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('config', 'user.email', 'contracts@example.invalid') | Out-Null
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('config', 'user.name', 'Contracts') | Out-Null

    Set-Content -LiteralPath $catalogFile -Encoding UTF8 -Value @(
        '[versions]', 'morphe-patcher = "1.12.0"', 'manager-floor = "1.29.0"')
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('add', '-A') | Out-Null
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('commit', '-m', 'release', '--quiet') | Out-Null
    $releaseCommitSha = "$(Invoke-FixtureGit -Root $toolchainRoot -Arguments @('rev-parse', 'HEAD') |
        Select-Object -First 1)".Trim()

    # One file in the fixture, so one file in its first commit. A commit that carries hundreds is
    # a commit against somebody else's repository.
    $firstCommitFiles = @(Invoke-FixtureGit -Root $toolchainRoot `
        -Arguments @('show', '--name-only', '--format=', 'HEAD') | Where-Object { "$_".Trim() })
    Assert-True ($firstCommitFiles.Count -eq 1 -and "$($firstCommitFiles[0])".Trim() -eq 'gradle/libs.versions.toml') `
        ("The fixture's first commit touched $($firstCommitFiles.Count) files: " +
            (($firstCommitFiles | Select-Object -First 5) -join ', '))

    Set-Content -LiteralPath $catalogFile -Encoding UTF8 -Value @(
        '[versions]', 'morphe-patcher = "1.13.0"', 'manager-floor = "1.30.0"')
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('add', '-A') | Out-Null
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('commit', '-m', 'move the pin', '--quiet') | Out-Null

    $workingToolchain = Read-CatalogToolchain -Text (Get-Content -LiteralPath $catalogFile -Raw) `
        -Source 'the working catalog'
    Assert-True ($workingToolchain.PatcherVersion -eq '1.13.0' -and $workingToolchain.ManagerFloor -eq '1.30.0') `
        "The working catalog was not read: $($workingToolchain.PatcherVersion), $($workingToolchain.ManagerFloor)"

    # The source push after the pin moved: the receipt's own commit still pinned 1.12.0, so that
    # is what it answers for, and the push this used to stop now goes through.
    $atRelease = Resolve-ReceiptToolchain -Root $toolchainRoot -Commit $releaseCommitSha `
        -WorkingToolchain $workingToolchain
    Assert-True ($atRelease.Toolchain.PatcherVersion -eq '1.12.0') `
        "The receipt was not held to the patcher its own commit pinned: $($atRelease.Toolchain.PatcherVersion)"
    Assert-True ($atRelease.Toolchain.ManagerFloor -eq '1.29.0') `
        "The receipt was not held to the Manager floor its own commit pinned: $($atRelease.Toolchain.ManagerFloor)"
    Assert-True ($atRelease.Note -like '*1.12.0*' -and $atRelease.Note -like '*1.13.0*') `
        "The difference between the two catalogs was not reported: $($atRelease.Note)"

    # The release push: the receipt's commit is the commit being released, so the catalog it is
    # held to is the working one and the strict comparison is unchanged. Without this case the
    # one above would pass just as well if the check had been turned off.
    $head = "$(Invoke-FixtureGit -Root $toolchainRoot -Arguments @('rev-parse', 'HEAD') |
        Select-Object -First 1)".Trim()
    $atHead = Resolve-ReceiptToolchain -Root $toolchainRoot -Commit $head -WorkingToolchain $workingToolchain
    Assert-True ($atHead.Toolchain.PatcherVersion -eq '1.13.0' -and $atHead.Toolchain.ManagerFloor -eq '1.30.0') `
        "A receipt at the released commit was not held to that commit's catalog: $($atHead.Toolchain.PatcherVersion)"
    Assert-True ($null -eq $atHead.Note) "An unchanged catalog still reported a difference: $($atHead.Note)"

    # The floor the index description is held to: the published release's own, through its tag,
    # while the working catalog already pins the next one. An untagged version isn't guessed at.
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('tag', 'v0.0.9', $releaseCommitSha) | Out-Null
    $indexFloor = Resolve-IndexManagerFloor -Root $toolchainRoot -Version '0.0.9'
    Assert-True ($indexFloor.Floor -eq '1.29.0' -and $indexFloor.Source -eq 'tag v0.0.9') `
        "The index floor was not read at the release tag: $($indexFloor.Floor) from $($indexFloor.Source)"
    $untagged = Resolve-IndexManagerFloor -Root $toolchainRoot -Version '0.0.10'
    Assert-True ($null -eq $untagged.Floor -and $untagged.Note -like "*v0.0.10 isn't in this clone*") `
        "An untagged release was given a floor: $($untagged.Floor), $($untagged.Note)"
    # A commit the caller read off the remote wins over the clone's tag, which still names the old
    # commit after a release is re-cut on GitHub.
    $recutFloor = Resolve-IndexManagerFloor -Root $toolchainRoot -Version '0.0.9' -Commit $head
    Assert-True ($recutFloor.Floor -eq '1.30.0') "The clone's tag was read over the published commit: $($recutFloor.Floor)"
    # With no tag in the clone the remote is asked, since `gh release create` makes the tag on
    # GitHub only. A bare repository stands in for it: a lightweight tag, an annotated one read
    # through the commit it peels to, and one on a commit this clone doesn't have. The annotated
    # tag is made on the remote alone, so this clone has its commit and never saw the tag object:
    # only the peeled line leads to a commit here.
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('init', '--bare', '--quiet', $toolchainRemote) | Out-Null
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('push', '--quiet', $toolchainRemote,
        "${releaseCommitSha}:refs/tags/v0.0.12", "${head}:refs/heads/main") | Out-Null
    Invoke-FixtureGit -Root $toolchainRemote -Arguments @('-c', 'user.name=Contracts', '-c', 'user.email=contracts@example.invalid',
        'tag', '-a', '-m', 'release', 'v0.0.13', $head) | Out-Null
    $onlyThere = "$(Invoke-FixtureGit -Root $toolchainRemote -Arguments @('-c', 'user.name=Contracts',
        '-c', 'user.email=contracts@example.invalid', 'commit-tree', "$head^{tree}", '-m', 'only there') |
        Select-Object -First 1)".Trim()
    Invoke-FixtureGit -Root $toolchainRemote -Arguments @('tag', 'v0.0.14', $onlyThere) | Out-Null
    $remoteFloor = Resolve-IndexManagerFloor -Root $toolchainRoot -Version '0.0.12' -RemoteUrl $toolchainRemote
    Assert-True ($remoteFloor.Floor -eq '1.29.0' -and $remoteFloor.Source -eq "tag v0.0.12 on $toolchainRemote") `
        "A tag only the remote has was not read there: $($remoteFloor.Floor) from $($remoteFloor.Source), $($remoteFloor.Note)"
    $peeledFloor = Resolve-IndexManagerFloor -Root $toolchainRoot -Version '0.0.13' -RemoteUrl $toolchainRemote
    Assert-True ($peeledFloor.Floor -eq '1.30.0') `
        "An annotated tag only the remote has was not read at its commit: $($peeledFloor.Floor), $($peeledFloor.Note)"
    foreach ($unread in @(
            @{ Version = '0.0.14'; Remote = $toolchainRemote; Note = "*names commit $($onlyThere.Substring(0, 8)), which this clone doesn't have*" },
            @{ Version = '0.0.15'; Remote = $toolchainRemote; Note = "*v0.0.15 isn't in this clone or on $toolchainRemote*" },
            @{ Version = '0.0.15'; Remote = (Join-Path $toolchainRoot 'missing.git'); Note = "*couldn't be asked for it*" })) {
        $unreadFloor = Resolve-IndexManagerFloor -Root $toolchainRoot -Version $unread.Version -RemoteUrl $unread.Remote
        Assert-True ($null -eq $unreadFloor.Floor -and $unreadFloor.Note -like $unread.Note) `
            "A floor the remote couldn't give was not reported as unchecked: $($unreadFloor.Floor), $($unreadFloor.Note)"
    }
    # The clone's tag can be stale: a release re-cut on GitHub moves the tag there, and git fetch
    # won't move it here. With a remote named, the published tag is read first. The clone's v0.0.9
    # still names the release commit, and the remote's names the next one.
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('push', '--quiet', $toolchainRemote, "${head}:refs/tags/v0.0.9") | Out-Null
    $publishedFirst = Resolve-IndexManagerFloor -Root $toolchainRoot -Version '0.0.9' -RemoteUrl $toolchainRemote
    Assert-True ($publishedFirst.Floor -eq '1.30.0' -and $publishedFirst.Source -eq "tag v0.0.9 on $toolchainRemote") `
        "The clone's own tag was read over the published one: $($publishedFirst.Floor) from $($publishedFirst.Source)"

    # A commit with no catalog in it, and a receipt naming no commit at all. Both fall back to
    # the working catalog rather than throwing, and the first says so.
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('rm', '--quiet', '--', 'gradle/libs.versions.toml') | Out-Null
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('commit', '-m', 'no catalog', '--quiet') | Out-Null
    $bare = "$(Invoke-FixtureGit -Root $toolchainRoot -Arguments @('rev-parse', 'HEAD') |
        Select-Object -First 1)".Trim()
    $atBare = Resolve-ReceiptToolchain -Root $toolchainRoot -Commit $bare -WorkingToolchain $workingToolchain
    Assert-True ($atBare.Toolchain.PatcherVersion -eq '1.13.0') `
        'A commit with no catalog did not fall back to the working one.'
    Assert-True ($atBare.Note -like '*no version catalog*') `
        "The fallback was not reported: $($atBare.Note)"
    # The index floor doesn't fall back: the working catalog is the wrong answer for a release.
    Invoke-FixtureGit -Root $toolchainRoot -Arguments @('tag', 'v0.0.11', $bare) | Out-Null
    $bareFloor = Resolve-IndexManagerFloor -Root $toolchainRoot -Version '0.0.11'
    Assert-True ($null -eq $bareFloor.Floor -and $bareFloor.Note -like '*no version catalog*') `
        "A tag with no catalog was given a floor: $($bareFloor.Floor), $($bareFloor.Note)"

    $noCommit = Resolve-ReceiptToolchain -Root $toolchainRoot -Commit '' -WorkingToolchain $workingToolchain
    Assert-True ($noCommit.Toolchain.PatcherVersion -eq '1.13.0' -and $null -eq $noCommit.Note) `
        'A receipt naming no commit did not fall back quietly to the working catalog.'

    # The patch list, the same way: a patch renamed after the release is held to the name its own
    # commit carried, which is what the hold after 0.58.0 needed; the released commit itself is
    # held to the working list; no list at that commit, or no commit, falls back to the working one.
    $listFile = Join-Path $toolchainRoot 'patches-list.json'
    function Save-FixtureList([string[]]$Names) {
        $list = @{ patches = @($Names | ForEach-Object { @{ name = $_; compatiblePackages = @{ 'com.example' = @('1.0.0') } } }) }
        Set-Content -LiteralPath $listFile -Encoding UTF8 -Value ($list | ConvertTo-Json -Depth 5)
        Invoke-FixtureGit -Root $toolchainRoot -Arguments @('add', '-A') | Out-Null
        Invoke-FixtureGit -Root $toolchainRoot -Arguments @('commit', '-m', "list $($Names -join ' ')", '--quiet') | Out-Null
        return "$(Invoke-FixtureGit -Root $toolchainRoot -Arguments @('rev-parse', 'HEAD') | Select-Object -First 1)".Trim()
    }
    $listReleased = Save-FixtureList @('Alpha', 'Beta')
    $listNow = Save-FixtureList @('Alpha', 'Gamma')
    $workingList = Get-Content -LiteralPath $listFile -Raw | ConvertFrom-Json
    $atListRelease = Resolve-ReceiptCatalog -Root $toolchainRoot -Commit $listReleased -WorkingPatchList $workingList
    $namesAtRelease = @($atListRelease.PatchList.patches | ForEach-Object { [string]$_.name }) -join ','
    Assert-True ($namesAtRelease -eq 'Alpha,Beta' -and $atListRelease.Note -like '*2 patches*') `
        "The receipt was not held to the patch list its own commit carried: $namesAtRelease / $($atListRelease.Note)"
    $atListHead = Resolve-ReceiptCatalog -Root $toolchainRoot -Commit $listNow -WorkingPatchList $workingList
    Assert-True ((@($atListHead.PatchList.patches | ForEach-Object { [string]$_.name }) -join ',') -eq 'Alpha,Gamma' -and
        $null -eq $atListHead.Note) "A receipt at the released commit was not held to the working patch list: $($atListHead.Note)"
    $atNoList = Resolve-ReceiptCatalog -Root $toolchainRoot -Commit $releaseCommitSha -WorkingPatchList $workingList
    Assert-True ($atNoList.PatchList -eq $workingList -and $atNoList.Note -like '*no patch list*') `
        "A commit with no patch list did not fall back to the working one: $($atNoList.Note)"
    $atNoCommit = Resolve-ReceiptCatalog -Root $toolchainRoot -Commit '' -WorkingPatchList $workingList
    Assert-True ($atNoCommit.PatchList -eq $workingList -and $null -eq $atNoCommit.Note) `
        'A receipt naming no commit did not fall back quietly to the working patch list.'
    # And the release check hands the receipt that list, names and target both, rather than the
    # working one. A helper nothing calls would pass every case above. Anchored at the end, since
    # the unanchored pattern also matched PackageVersions[0], the newest build alone; the release
    # root section below runs the check on a receipt of its own as well.
    $factsSource = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'validate-release-facts.ps1') -Raw
    Assert-True ($factsSource -match '-ExpectedPatchNames @\(\$resolvedList\.PatchList\.patches' -and
        $factsSource -match '\$receiptTarget = Get-PatchTarget -PatchList \$resolvedList\.PatchList' -and
        $factsSource -match '-ExpectedPackageName \$receiptTarget\.PackageName' -and
        $factsSource -match '-ExpectedPackageVersions \$receiptTarget\.PackageVersions(?![\w.\[])' -and
        $factsSource -match '-ExpectedPackageVersionCodes \$receiptTarget\.PackageVersionCodes(?![\w.\[])') `
        ('validate-release-facts.ps1 no longer holds the receipt to the patch list its own commit ' +
            'carried, or to every build that list declares, version codes and all.')

    # The manifest delta allowlist, the same way: the one the receipt's own commit carried. An entry
    # added in the working tree and never committed approved a change into a release no commit had
    # reviewed, and one pruned after a release refused the release that needed it. A commit with no
    # allowlist, or no commit, gets the working one, the first with a note, and a malformed line at
    # the commit says where it is. Written without a byte order mark, as the repository's is, and
    # then with one, which git hands back as text.
    $allowlistFile = Join-Path $toolchainRoot 'scripts/manifest-delta-allowlist.txt'
    New-Item -ItemType Directory -Path (Split-Path -Parent $allowlistFile) -Force | Out-Null
    function Save-FixtureAllowlist([string[]]$Lines, [switch]$Bom, [switch]$Commit) {
        [System.IO.File]::WriteAllText($allowlistFile, (($Lines -join "`n") + "`n"), (New-Object System.Text.UTF8Encoding($Bom.IsPresent)))
        if (-not $Commit) { return $null }
        Invoke-FixtureGit -Root $toolchainRoot -Arguments @('add', '-A') | Out-Null
        Invoke-FixtureGit -Root $toolchainRoot -Arguments @('commit', '-m', 'allowlist', '--quiet') | Out-Null
        return "$(Invoke-FixtureGit -Root $toolchainRoot -Arguments @('rev-parse', 'HEAD') | Select-Object -First 1)".Trim()
    }
    $reviewed = 'exported-added activity:com.example.Reviewed'
    $unreviewed = 'exported-added activity:com.example.Unreviewed'
    foreach ($bom in $false, $true) {
        $allowlistCommit = Save-FixtureAllowlist @('# reviewed at the release', $reviewed) -Bom:$bom -Commit
        Save-FixtureAllowlist @('# added since, never committed', $unreviewed) | Out-Null
        $atAllowlist = Resolve-ReceiptManifestAllowlist -Root $toolchainRoot -Commit $allowlistCommit -WorkingPath $allowlistFile
        Assert-True ((@($atAllowlist.Entries) -join ',') -ceq $reviewed -and
            $atAllowlist.Note -like "*allowlist at its own commit $($allowlistCommit.Substring(0, 8)) reviews*") `
            "The receipt was not held to the allowlist its own commit carried (byte order mark: $bom): $(@($atAllowlist.Entries) -join ', ') / $($atAllowlist.Note)"
    }
    $atNoAllowlist = Resolve-ReceiptManifestAllowlist -Root $toolchainRoot -Commit $releaseCommitSha -WorkingPath $allowlistFile
    Assert-True ((@($atNoAllowlist.Entries) -join ',') -ceq $unreviewed -and $atNoAllowlist.Note -like '*has no manifest delta allowlist*') `
        "A commit with no allowlist did not fall back to the working one, saying so: $($atNoAllowlist.Note)"
    $noCommitAllowlist = Resolve-ReceiptManifestAllowlist -Root $toolchainRoot -Commit '' -WorkingPath $allowlistFile
    Assert-True ((@($noCommitAllowlist.Entries) -join ',') -ceq $unreviewed -and $null -eq $noCommitAllowlist.Note) `
        'A receipt naming no commit was not held quietly to the working allowlist.'
    $sameAllowlist = Resolve-ReceiptManifestAllowlist -Root $toolchainRoot -Commit (Save-FixtureAllowlist @($unreviewed) -Commit) `
        -WorkingPath $allowlistFile
    Assert-True ((@($sameAllowlist.Entries) -join ',') -ceq $unreviewed -and $null -eq $sameAllowlist.Note) `
        "An allowlist the working tree still holds as committed reported a difference: $($sameAllowlist.Note)"
    $brokenAllowlist = Save-FixtureAllowlist @('exported-added') -Commit
    Assert-Throws { Resolve-ReceiptManifestAllowlist -Root $toolchainRoot -Commit $brokenAllowlist -WorkingPath $allowlistFile } `
        "*allowlist at $($brokenAllowlist.Substring(0, 8)) has a line that is not*" `
        'A malformed allowlist at the receipt''s commit was read without complaint.'
    Assert-True ($factsSource -match '\$resolvedAllowlist = Resolve-ReceiptManifestAllowlist -Root \$rootPath -Commit \$receiptCommit' -and
        $factsSource -match '\$approvedDelta = @\(\$resolvedAllowlist\.Entries\)' -and
        $factsSource -match '-ApprovedManifestDelta \$approvedDelta' -and
        $factsSource -notmatch 'Read-ManifestDeltaAllowlist') `
        'validate-release-facts.ps1 no longer holds the receipt to the allowlist its own commit carried.'

    # The receipt schema, read the same way: out of scripts/release-receipt.ps1 at the receipt's
    # commit. A release cut before the SBOM is held to schema 1 and says so, one cut since to this
    # checkout's schema, one from a newer checkout is refused rather than misread, and a commit
    # with no receipt script, or none at all, gets this checkout's.
    $receiptScript = Join-Path $toolchainRoot 'scripts/release-receipt.ps1'
    New-Item -ItemType Directory -Path (Split-Path -Parent $receiptScript) -Force | Out-Null
    $currentSchema = Get-ReleaseReceiptSchemaVersion
    $schemaCommits = @{}
    foreach ($written in @(1, 2, $currentSchema, ($currentSchema + 1)) | Select-Object -Unique) {
        Set-Content -LiteralPath $receiptScript -Encoding UTF8 -Value @('function Get-ReleaseReceiptSchemaVersion {', '    <#',
            '    .SYNOPSIS', '        Bumped when the shape changes. A receipt at return 9 would be a surprise.', '    #>',
            "    return $written", '}')
        Invoke-FixtureGit -Root $toolchainRoot -Arguments @('add', '-A') | Out-Null
        Invoke-FixtureGit -Root $toolchainRoot -Arguments @('commit', '-m', "schema $written", '--quiet') | Out-Null
        $schemaCommits[$written] = "$(Invoke-FixtureGit -Root $toolchainRoot -Arguments @('rev-parse', 'HEAD') | Select-Object -First 1)".Trim()
    }
    $atOne = Resolve-ReceiptSchema -Root $toolchainRoot -Commit $schemaCommits[1]
    Assert-True ($atOne.Version -eq 1 -and $atOne.Note -like "*schema 1, which its own commit $($schemaCommits[1].Substring(0, 8)) wrote*") `
        "A receipt cut at schema 1 was not held to it: $($atOne.Version), $($atOne.Note)"
    $atTwo = Resolve-ReceiptSchema -Root $toolchainRoot -Commit $schemaCommits[2]
    Assert-True ($atTwo.Version -eq 2 -and $atTwo.Note -like '*names no binary SDK or compiled declaration facts*' -and $atTwo.Note -notlike '*no SBOM*') `
        "A shipped schema 2 receipt was not held to its schema without dropping SBOM checks: $($atTwo.Version), $($atTwo.Note)"
    $atCurrent = Resolve-ReceiptSchema -Root $toolchainRoot -Commit $schemaCommits[$currentSchema]
    Assert-True ($atCurrent.Version -eq $currentSchema -and $null -eq $atCurrent.Note) `
        "A receipt cut at this checkout's schema was not held to it quietly: $($atCurrent.Version), $($atCurrent.Note)"
    Assert-Throws { Resolve-ReceiptSchema -Root $toolchainRoot -Commit $schemaCommits[$currentSchema + 1] } `
        "*writes receipt schema $($currentSchema + 1), newer than the $currentSchema this checkout reads*" `
        'A receipt schema newer than this checkout reads was read as if it were known.'
    foreach ($none in @($releaseCommitSha, '')) {
        $atNone = Resolve-ReceiptSchema -Root $toolchainRoot -Commit $none
        Assert-True ($atNone.Version -eq $currentSchema -and $null -eq $atNone.Note) `
            "A commit with no receipt script was not held to this checkout's schema: $($atNone.Version), $($atNone.Note)"
    }
    Assert-True ([System.IO.File]::ReadAllText((Join-Path $PSScriptRoot 'release-receipt.ps1')) -match
            '(?s)function\s+Get-ReleaseReceiptSchemaVersion\b.*?#>\s*return\s+(\d+)\s*\}' -and [int]$Matches[1] -eq $currentSchema) `
        'Resolve-ReceiptSchema can no longer read the schema out of this checkout''s own release-receipt.ps1.'

    # A catalog that pins nothing usable still stops the run, rather than being read as blank.
    foreach ($broken in @(
        @{ Name = 'no patcher pin'; Lines = @('[versions]', 'manager-floor = "1.29.0"') },
        @{ Name = 'no Manager floor'; Lines = @('[versions]', 'morphe-patcher = "1.12.0"') },
        @{ Name = 'an unusable Manager floor'; Lines = @('[versions]', 'morphe-patcher = "1.12.0"', 'manager-floor = "latest"') })) {
        Assert-Throws { Read-CatalogToolchain -Text ($broken.Lines -join "`n") -Source 'the test catalog' } `
            '*the test catalog*' "A catalog with $($broken.Name) was read without complaint."
    }
} finally {
    Remove-Item -LiteralPath $toolchainRoot, $toolchainRemote -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host '[scripts] release receipt schema, manifest reading and validation contracts passed'

# --- release-advisories.ps1 ------------------------------------------------------------------
#
# The gate that asks OSV about the libraries a release's SBOM lists and refuses a release carrying
# a high or critical advisory. OSV's answers are recorded here as it gave them on 2026-09-25,
# trimmed to the fields the gate reads, and a stand-in for Invoke-RestMethod answers from them by
# package URL, so no case needs the network. A package URL it has no answer for fails the way an
# OSV this machine can't reach does. gson 2.8.8 is the deliberately vulnerable library:
# GHSA-4jrv-ppp4-jm57 (CVE-2022-25647), which OSV and GitHub rate HIGH.

. (Join-Path $PSScriptRoot 'release-advisories.ps1')

$gsonAdvisory = '{"id":"GHSA-4jrv-ppp4-jm57","summary":"Deserialization of Untrusted Data in Gson","aliases":["CVE-2022-25647"],"modified":"2026-09-10T03:49:19.710819205Z","database_specific":{"severity":"HIGH"},"severity":[{"type":"CVSS_V3","score":"CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:H/A:H"}]}'
$log4jCritical = '{"id":"GHSA-jfh8-c2jp-5v3q","summary":"Remote code injection in Log4j","aliases":["CVE-2021-44228"],"modified":"2025-10-22T19:37:02.616807Z","database_specific":{"severity":"CRITICAL"},"severity":[{"type":"CVSS_V3","score":"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:H/A:H/E:H"}]}'
$log4jModerate = '{"id":"GHSA-8489-44mv-ggj8","summary":"Improper Input Validation and Injection in Apache Log4j2","aliases":["CVE-2021-44832"],"modified":"2026-06-09T10:45:14.253296471Z","database_specific":{"severity":"MODERATE"},"severity":[{"type":"CVSS_V3","score":"CVSS:3.1/AV:N/AC:H/PR:H/UI:N/S:U/C:H/I:H/A:H"}]}'
# Rated only by a CVSS 4 vector once OSV's label is taken out, which this gate can't score.
$log4jVectorFour = '{"id":"GHSA-3pxv-7cmr-fjr4","summary":"Apache Log4j Core: Silent log event loss in XmlLayout due to unescaped XML 1.0 forbidden characters","aliases":["CVE-2026-34480"],"modified":"2026-09-10T03:50:42.492278990Z","severity":[{"type":"CVSS_V4","score":"CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:N/VI:N/VA:N/SC:N/SI:L/SA:N"}]}'
$guavaModerate = '{"id":"GHSA-7g45-4rm6-3mm3","summary":"Guava vulnerable to insecure use of temporary directory","aliases":["CVE-2023-2976"],"modified":"2026-09-10T03:49:53.859811124Z","database_specific":{"severity":"MODERATE"},"severity":[{"type":"CVSS_V3","score":"CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N"}]}'
$guavaLow = '{"id":"GHSA-5mg8-w23w-74h3","summary":"Information Disclosure in Guava","aliases":["CVE-2020-8908"],"modified":"2026-09-10T03:49:26.651391253Z","database_specific":{"severity":"LOW"},"severity":[{"type":"CVSS_V3","score":"CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N"}]}'
$gsonPurl = 'pkg:maven/com.google.code.gson/gson@2.8.8'
$cleanPurl = 'pkg:maven/com.google.code.gson/gson@2.14.0'
$osvRecorded = @{
    $gsonPurl = "{`"vulns`":[$gsonAdvisory]}"
    'pkg:maven/org.apache.logging.log4j/log4j-core@2.14.1' = "{`"vulns`":[$log4jCritical,$log4jModerate]}"
    'pkg:maven/com.google.guava/guava@31.1-jre' = "{`"vulns`":[$guavaModerate,$guavaLow]}"
    $cleanPurl = '{}'
}
# What the stand-in serves, which a case replaces to try another shape, and what it was asked.
$osvAnswers = $osvRecorded
$osvAsked = New-Object System.Collections.Generic.List[string]
$osvStandIn = {
    function Invoke-RestMethod {
        param($Uri, $Method, $ContentType, $Body, $TimeoutSec)
        $query = $Body | ConvertFrom-Json
        $key = [string]$query.package.purl
        if ($query.page_token) { $key += " page $($query.page_token)" }
        $osvAsked.Add($key)
        if (-not $osvAnswers.ContainsKey($key)) {
            throw "Unable to connect to the remote server (a stand-in for api.osv.dev with no answer for $key)"
        }
        $answer = $osvAnswers[$key]
        if ($answer -is [string] -and $answer.StartsWith('{')) { return ($answer | ConvertFrom-Json) }
        return $answer
    }
}
$advisoryRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-advisories-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $advisoryRoot -Force | Out-Null
try {
    $today = [datetime]'2026-09-25'
    # What Read-ReleaseSbom hands the gate, for the libraries named.
    function New-GateSbom([string[]]$Purls) {
        $libraries = @(foreach ($purl in @($Purls | Where-Object { $_ })) {
            $parts = [regex]::Match($purl, '^pkg:maven/([^/]+)/([^@]+)@(.+)$')
            [pscustomobject]@{ Ref = $purl; Type = 'library'; Group = $parts.Groups[1].Value; Name = $parts.Groups[2].Value
                Version = $parts.Groups[3].Value; Purl = $purl }
        })
        return [pscustomobject]@{ Path = (Join-Path $advisoryRoot 'patches-9.9.9.cdx.json'); Libraries = $libraries }
    }
    # The gate on an SBOM of these libraries with these exception lines, and everything it said,
    # warnings included.
    function Invoke-Gate([string[]]$Purls, [string[]]$Exceptions = @(), [switch]$Skip) {
        $list = Join-Path $advisoryRoot 'advisory-exceptions.txt'
        Set-Content -LiteralPath $list -Encoding ASCII -Value (@('# exceptions for this case') + @($Exceptions))
        . $osvStandIn
        $osvAsked.Clear()
        return (@(Invoke-ReleaseAdvisoryGate -Sbom (New-GateSbom $Purls) -ExceptionsPath $list -Today $today `
            -SkipAdvisoryCheck:$Skip 3>&1 6>&1 | ForEach-Object { "$_" }) -join "`n")
    }
    $later = $today.AddDays(30).ToString('yyyy-MM-dd')
    $why = 'Only the build reads JSON with it, never input from outside.'

    # CVSS 3 base scores, against the numbers NVD and the specification's calculator give. The guava
    # vectors are the two that plain rounding gets wrong (5.4 and 3.2), and the one scored 8.6
    # rounds down to 8.5 that way; roundup as 3.1 defines it is the difference.
    foreach ($known in @(
            @{ Vector = 'CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H'; Score = 9.8 },
            @{ Vector = 'CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:H/A:H'; Score = 7.7 },
            @{ Vector = 'CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:H/A:H/E:H'; Score = 10.0 },
            @{ Vector = 'CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:N/I:N/A:H'; Score = 8.6 },
            @{ Vector = 'CVSS:3.1/AV:N/AC:H/PR:H/UI:N/S:U/C:H/I:H/A:H'; Score = 6.6 },
            @{ Vector = 'CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N'; Score = 5.5 },
            @{ Vector = 'CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:L/I:N/A:N'; Score = 3.3 },
            @{ Vector = 'CVSS:3.0/AV:N/AC:L/PR:L/UI:R/S:C/C:L/I:L/A:N'; Score = 5.4 },
            @{ Vector = 'CVSS:3.1/AV:P/AC:H/PR:H/UI:R/S:U/C:N/I:N/A:N'; Score = 0.0 })) {
        $scored = Get-Cvss3BaseScore -Vector $known.Vector
        Assert-True ($null -ne $scored -and [Math]::Abs($scored - $known.Score) -lt 0.001) `
            "$($known.Vector) scored $scored, not $($known.Score)."
    }
    foreach ($unscored in @('CVSS:4.0/AV:N/AC:L/AT:N/PR:N/UI:N/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N',
            'CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H', 'CVSS:3.1/AV:X/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H',
            'CVSS:3.1/AV:n/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H', 'CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:u/C:H/I:H/A:H')) {
        Assert-True ($null -eq (Get-Cvss3BaseScore -Vector $unscored)) "$unscored was given a CVSS 3 score."
    }

    # How serious each recorded advisory is: OSV's label and the vector's score, whichever is worse,
    # and unrated when neither can be read.
    foreach ($rated in @(
            @{ Name = 'the gson advisory'; Json = $gsonAdvisory; Level = 'HIGH'; Serious = $true; Why = 'OSV rates it HIGH' },
            @{ Name = 'the gson advisory with no vector'; Json = $gsonAdvisory.Replace(',"severity":[{"type":"CVSS_V3","score":"CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:H/A:H"}]', '')
                Level = 'HIGH'; Serious = $true; Why = 'OSV rates it HIGH' },
            @{ Name = 'the gson advisory with no label'; Json = $gsonAdvisory.Replace('"database_specific":{"severity":"HIGH"},', '')
                Level = 'HIGH'; Serious = $true; Why = 'its CVSS 3 vector scores 7.7' },
            @{ Name = 'the gson advisory labelled LOW'; Json = $gsonAdvisory.Replace('"severity":"HIGH"', '"severity":"LOW"')
                Level = 'HIGH'; Serious = $true; Why = 'its CVSS 3 vector scores 7.7' },
            @{ Name = 'the log4j advisory'; Json = $log4jCritical; Level = 'CRITICAL'; Serious = $true; Why = 'OSV rates it CRITICAL' },
            @{ Name = 'a CVSS 4 vector alone'; Json = $log4jVectorFour; Level = 'UNRATED'; Serious = $true; Why = '*no severity*' },
            @{ Name = 'the guava temporary directory advisory'; Json = $guavaModerate; Level = 'MODERATE'; Serious = $false; Why = 'OSV rates it MODERATE' },
            @{ Name = 'a MEDIUM label'; Json = $guavaModerate.Replace('"MODERATE"', '"MEDIUM"'); Level = 'MODERATE'; Serious = $false; Why = 'OSV rates it MODERATE' },
            @{ Name = 'the guava disclosure advisory'; Json = $guavaLow; Level = 'LOW'; Serious = $false; Why = 'OSV rates it LOW' })) {
        $severity = Get-AdvisorySeverity -Advisory ($rated.Json | ConvertFrom-Json)
        Assert-True ($severity.Level -eq $rated.Level -and $severity.Serious -eq $rated.Serious -and $severity.Why -like $rated.Why) `
            "$($rated.Name) was rated $($severity.Level), serious $($severity.Serious), because $($severity.Why)."
    }

    # The exception list. Each broken line stops the read and names itself.
    $exceptionList = Join-Path $advisoryRoot 'read.txt'
    Set-Content -LiteralPath $exceptionList -Encoding ASCII -Value @('# accepted', '',
        "GHSA-4jrv-ppp4-jm57 com.google.code.gson:gson $later $why",
        "CVE-2021-44228 org.apache.logging.log4j:log4j-core 2026-09-24 $why")
    $read = @(Read-AdvisoryExceptions -Path $exceptionList -Today $today)
    Assert-True ($read.Count -eq 2 -and $read[0].Advisory -eq 'GHSA-4jrv-ppp4-jm57' -and $read[0].Package -eq 'com.google.code.gson:gson' -and
        -not $read[0].Expired -and $read[1].Expired -and $read[0].Reason -eq $why -and $read[0].Line -eq 3) `
        "The exception list was misread: $(@($read | ForEach-Object { "$($_.Advisory) $($_.Package) $($_.Until) expired=$($_.Expired)" }) -join '; ')"
    Assert-True (@(Read-AdvisoryExceptions -Path $exceptionList -Today $today.AddDays(-60)).Count -eq 2) `
        'An exception 90 days out on the day it was read was refused.'
    foreach ($broken in @(
            @{ Name = 'no date'; Line = "GHSA-4jrv-ppp4-jm57 com.google.code.gson:gson $why"; Pattern = '*isn''t a yyyy-MM-dd date*' },
            @{ Name = 'no package'; Line = "GHSA-4jrv-ppp4-jm57 $later $why"; Pattern = '*is not "<advisory> <group>:<name>*' },
            @{ Name = 'a date that does not exist'; Line = "GHSA-4jrv-ppp4-jm57 com.google.code.gson:gson 2026-02-30 $why"; Pattern = '*isn''t a yyyy-MM-dd date*' },
            @{ Name = 'a date 91 days out'; Line = "GHSA-4jrv-ppp4-jm57 com.google.code.gson:gson $($today.AddDays(91).ToString('yyyy-MM-dd')) $why"
                Pattern = '*more than 90 days out*' },
            @{ Name = 'a two-word reason'; Line = "GHSA-4jrv-ppp4-jm57 com.google.code.gson:gson $later Not reachable."; Pattern = '*without saying why*' },
            @{ Name = 'the same advisory twice'; Line = "GHSA-4jrv-ppp4-jm57 com.google.code.gson:gson $later $why"; Twice = $true; Pattern = '*a second time*' })) {
        $lines = @($broken.Line)
        if ($broken.Twice) { $lines += $broken.Line }
        Set-Content -LiteralPath $exceptionList -Encoding ASCII -Value $lines
        Assert-Throws { Read-AdvisoryExceptions -Path $exceptionList -Today $today } $broken.Pattern `
            "An exception list with $($broken.Name) was read without complaint."
    }
    Assert-Throws { Read-AdvisoryExceptions -Path (Join-Path $advisoryRoot 'absent.txt') -Today $today } '*list is missing*' `
        'A missing exception list was read as an empty one.'
    # The date in the list is a day on the maintainer's own calendar. Both functions defaulted to
    # the UTC date, so on the east coast an exception ran out at 19:00 on the last day it named
    # and refused a release it still covered. The clock can't be moved here, so the defaults are
    # read as written.
    foreach ($dated in 'Read-AdvisoryExceptions', 'Invoke-ReleaseAdvisoryGate') {
        $parameter = @((Get-Command $dated).ScriptBlock.Ast.Body.ParamBlock.Parameters |
            Where-Object { $_.Name.VariablePath.UserPath -eq 'Today' })
        $default = if ($parameter.Count -eq 1 -and $parameter[0].DefaultValue) { $parameter[0].DefaultValue.Extent.Text } else { '' }
        Assert-True ($default -eq '[datetime]::Today') "$dated takes today as $default, not the local calendar day."
    }
    $checkedIn = Join-Path $PSScriptRoot 'advisory-exceptions.txt'
    try {
        $null = @(Read-AdvisoryExceptions -Path $checkedIn)
    } catch {
        throw "The checked-in scripts/advisory-exceptions.txt does not read: $($_.Exception.Message)"
    }

    # The gate. A clean library is asked about once and passes.
    $said = Invoke-Gate @($cleanPurl)
    Assert-True ($said -like '*OSV has no advisory for the libraries patches-9.9.9.cdx.json lists: gson 2.14.0*' -and
        ($osvAsked -join ', ') -eq $cleanPurl) "The gate did not ask OSV about the clean library, or did not say so: $said"

    # The deliberately vulnerable library is refused, naming the advisory, its alias and the version.
    Assert-Throws { Invoke-Gate @($cleanPurl, $gsonPurl) } `
        '*high or critical*GHSA-4jrv-ppp4-jm57 (HIGH, CVE-2022-25647) in com.google.code.gson:gson 2.8.8*' `
        'The gate let a release carry gson 2.8.8.'
    Assert-Throws { Invoke-Gate @('pkg:maven/org.apache.logging.log4j/log4j-core@2.14.1') } '*GHSA-jfh8-c2jp-5v3q (CRITICAL*' `
        'The gate let a release carry log4j-core 2.14.1.'
    # Moderate and low go through, and say so.
    $said = Invoke-Gate @('pkg:maven/com.google.guava/guava@31.1-jre')
    Assert-True ($said -like '*below high, let through: GHSA-7g45-4rm6-3mm3 (MODERATE*' -and
        $said -like '*below high, let through: GHSA-5mg8-w23w-74h3 (LOW*' -and $said -like '*2 advisories, none refused*') `
        "The gate refused, or said nothing of, moderate and low advisories: $said"
    # An advisory rated only by a vector this gate can't score counts as serious.
    $osvAnswers = @{ 'pkg:maven/org.apache.logging.log4j/log4j-core@2.26.0' = "{`"vulns`":[$log4jVectorFour]}" }
    try {
        Assert-Throws { Invoke-Gate @('pkg:maven/org.apache.logging.log4j/log4j-core@2.26.0') } '*GHSA-3pxv-7cmr-fjr4 (UNRATED*' `
            'The gate let an advisory through that no severity it can read describes.'
    } finally {
        $osvAnswers = $osvRecorded
    }

    # Exceptions: by OSV's id or an alias, for the one package, until the date.
    foreach ($named in @('GHSA-4jrv-ppp4-jm57', 'CVE-2022-25647', 'ghsa-4jrv-ppp4-jm57')) {
        $said = Invoke-Gate @($gsonPurl) @("$named com.google.code.gson:gson $later $why")
        Assert-True ($said -like "*accepted: GHSA-4jrv-ppp4-jm57 (HIGH*accepted until $later`: $why*") `
            "An exception naming $named did not accept the gson advisory: $said"
    }
    Assert-Throws { Invoke-Gate @($gsonPurl) @("GHSA-4jrv-ppp4-jm57 com.google.code.gson:gson-extras $later $why") } `
        '*high or critical*GHSA-4jrv-ppp4-jm57*no longer reports*GHSA-4jrv-ppp4-jm57 for com.google.code.gson:gson-extras*' `
        'An exception for another package accepted the gson advisory, or was not called stale.'
    Assert-Throws { Invoke-Gate @($gsonPurl) @("GHSA-4jrv-ppp4-jm57 com.google.code.gson:gson 2026-09-24 $why") } `
        '*GHSA-4jrv-ppp4-jm57 (HIGH*its exception ran out on 2026-09-24*' 'An exception past its date still accepted the gson advisory.'
    Assert-Throws { Invoke-Gate @($cleanPurl) @("GHSA-4jrv-ppp4-jm57 com.google.code.gson:gson $later $why") } `
        '*no longer reports*GHSA-4jrv-ppp4-jm57 for com.google.code.gson:gson (line 2)*' 'An exception nothing matches any more went unnoticed.'

    # OSV has to answer, and answer with something the gate can read.
    Assert-Throws { Invoke-Gate @('pkg:maven/com.example/unknown@1.0') } '*could not be asked about pkg:maven/com.example/unknown@1.0*fails closed*' `
        'The gate read an OSV it could not reach as no advisories.'
    $unreadable = @(
        @{ Name = 'a page of HTML'; Answer = '<html>Service Unavailable</html>'; Pattern = '*isn''t a query result*' },
        @{ Name = 'an advisory with no id'; Answer = '{"vulns":[{"summary":"no id"}]}'; Pattern = '*has no id*' })
    foreach ($odd in $unreadable) {
        $osvAnswers = @{ $cleanPurl = $odd.Answer }
        try {
            Assert-Throws { Invoke-Gate @($cleanPurl) } $odd.Pattern "The gate took $($odd.Name) from OSV for an answer."
        } finally {
            $osvAnswers = $osvRecorded
        }
    }
    # The second page of an answer is read, and an advisory OSV withdrew is not one.
    $osvAnswers = @{ $gsonPurl = '{"next_page_token":"p2"}'; "$gsonPurl page p2" = "{`"vulns`":[$gsonAdvisory]}" }
    try {
        Assert-Throws { Invoke-Gate @($gsonPurl) } '*GHSA-4jrv-ppp4-jm57 (HIGH*' 'The gate stopped at the first page of an answer.'
        Assert-True (($osvAsked -join ', ') -eq "$gsonPurl, $gsonPurl page p2") "The gate did not ask for the second page: $($osvAsked -join ', ')"
        $osvAnswers = @{ $gsonPurl = "{`"vulns`":[$($gsonAdvisory.Replace('{"id"', '{"withdrawn":"2026-09-01T00:00:00Z","id"'))]}" }
        $said = Invoke-Gate @($gsonPurl)
        Assert-True ($said -like '*OSV has no advisory*') "A withdrawn advisory refused the release: $said"
    } finally {
        $osvAnswers = $osvRecorded
    }

    # Offline work: the check is skipped with a warning and OSV isn't asked, but the exception list
    # is still read. And an SBOM with no library has nothing to ask about.
    $said = Invoke-Gate @('pkg:maven/com.example/unknown@1.0') -Skip
    Assert-True ($said -like '*-SkipAdvisoryCheck: OSV was not asked about the libraries patches-9.9.9.cdx.json lists*' -and
        $osvAsked.Count -eq 0) "The skipped check asked OSV, or did not say it was skipped: $said"
    Assert-Throws { Invoke-Gate @($cleanPurl) @('GHSA-4jrv-ppp4-jm57 soon') -Skip } '*is not "<advisory>*' `
        'A skipped check left a broken exception list unread.'
    $said = Invoke-Gate @()
    Assert-True ($said -like '*lists no library to ask OSV about*' -and $osvAsked.Count -eq 0) `
        "An SBOM with no library was not passed as one: $said"
} finally {
    Remove-Item -LiteralPath $advisoryRoot -Recurse -Force -ErrorAction SilentlyContinue
}

& (Join-Path $PSScriptRoot 'test-advisory-inputs.ps1') -Root $Root
Write-Host '[scripts] advisory gate contracts passed'

# A GitHub description that names no version, count or build has nothing to go stale, so the
# facts check and the index step leave it as written. One naming any fact is still held to all.
$versionFree = 'HushTumblr Morphe patches for Tumblr. Takes ads and clutter out of your dashboard, and much more.'
Assert-True (-not (Test-RepoDescriptionNamesFacts -Description $versionFree)) 'A version-free description was read as naming facts.'
Assert-True (-not (Test-RepoDescriptionNamesFacts -Description '')) 'An empty description was read as naming facts.'
foreach ($named in 'Patches for Tumblr 46.5.0.109.', 'HushTumblr, 44 patches.', 'Patches, v0.0.8.', 'HushTumblr v0.0.7: 42 patches for Tumblr 46.5.0.109.') {
    Assert-True (Test-RepoDescriptionNamesFacts -Description $named) "A description naming a fact was read as version-free: $named"
}
Write-Host '[scripts] repository description fact contracts passed'

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

# HushTumblr publishes its first index with its first release, so a checkout from before then has
# no patches-bundle.json to copy, and its README and CHANGELOG can't yet name a release. The
# fixtures then start from what that release writes: an index with the catalog's version, patch
# count and newest build at its pinned code, the Manager floor and the release asset's address; the
# README's Manager floor badge, its install steps, and its sentence naming the latest release with the
# Morphe add-source link, each only where the README doesn't hold it yet; and a dated CHANGELOG
# heading with one bullet Morphe Manager scopes to Tumblr. Everything else is this checkout's own
# text. A later source version may keep notes under Unreleased until preparation. Strict release
# fixtures date that section in their own copy; the real file and published index stay unchanged.
$rootIndexPath = Join-Path $Root 'patches-bundle.json'
$preRelease = -not (Test-Path -LiteralPath $rootIndexPath -PathType Leaf)
$seedTarget = Get-PatchTarget -PatchList $catalog
$seedVersion = Get-BundleVersion -Root $Root
$seedFloor = (Read-CatalogToolchain -Source 'this checkout''s catalog' `
    -Text (Get-Content -LiteralPath (Join-Path $Root 'gradle/libs.versions.toml') -Raw)).ManagerFloor
$seedCode = @($seedTarget.PackageVersionCodes[$seedTarget.PackageVersion])[0]
$seedIndexText = ([ordered]@{
        created_at = '2026-09-29T00:00:00'
        description = ("HushTumblr v$seedVersion targets Tumblr $($seedTarget.PackageVersion) ($($seedTarget.PackageName)).`n`n" +
            "There are $(@($catalog.patches).Count) patches in all.`n`n" +
            "Validation: 100 runtime tests passed locally. All 50 patch tests passed too. All $(@($catalog.patches).Count) " +
            "patches applied to Tumblr $($seedTarget.PackageVersion); resource and injected-code checks passed.`n`n" +
            "Needs Morphe Manager $seedFloor or newer. Patch the arm64-v8a bundle of Tumblr $($seedTarget.PackageVersion), " +
            "build $seedCode. The .mpp is a patch bundle, not a Tumblr APK. Keep the manager's existing signing key when updating.")
        download_url = "https://github.com/SysAdminDoc/HushTumblr/releases/download/v$seedVersion/patches-$seedVersion.mpp"
        signature_download_url = ''
        version = $seedVersion
    } | ConvertTo-Json)
$rootChangelog = [System.IO.File]::ReadAllText((Join-Path $Root 'CHANGELOG.md'))
$seedPendingChangelog = -not $preRelease -and
    [version]$seedVersion -gt [version]((Get-Content -LiteralPath $rootIndexPath -Raw | ConvertFrom-Json).version) -and
    @(Get-ChangelogVersions -Text $rootChangelog) -notcontains $seedVersion -and
    $rootChangelog -match '(?m)^##[ \t]+Unreleased[ \t]*(?=\r?$)'
function Test-SeededReleaseFile([string]$Relative) {
    return ($preRelease -and $Relative -in @('patches-bundle.json', 'README.md', 'CHANGELOG.md')) -or
        ($seedPendingChangelog -and $Relative -eq 'CHANGELOG.md')
}
function Get-ReleaseFileText([string]$Relative) {
    if (-not (Test-SeededReleaseFile $Relative)) { return [System.IO.File]::ReadAllText((Join-Path $Root $Relative)) }
    switch ($Relative) {
        'patches-bundle.json' { $seedIndexText }
        'README.md' {
            # A README from before the first release can lack its whole install section: this one
            # says there's nothing to install yet, so it has no Manager floor badge and no install
            # step either. Each piece the first release's README carries is added only when it's
            # missing, so a README that already holds one is checked as written.
            $readme = [System.IO.File]::ReadAllText((Join-Path $Root 'README.md'))
            if ($readme -notmatch 'Morphe%20Manager%20') {
                $badged = ([regex]'(?m)^([ \t]*)(<img src="https://img\.shields\.io/badge/version-[^\r\n]*)(?=\r?\n)').Replace($readme,
                    ("`${1}`${2}`n`${1}<img src=`"https://img.shields.io/badge/for-Morphe%20Manager%20$seedFloor%2B-8A2BE2`" " +
                        "alt=`"For Morphe Manager $seedFloor or newer`">"), 1)
                if ($badged -ceq $readme) { throw 'The README has no version badge line to seed the Manager floor badge beside.' }
                $readme = $badged
            }
            $readme = $readme.TrimEnd()
            if ($readme -notmatch '(?m)^\d+\.\s+Install \[Morphe Manager\]') {
                $readme += "`n`n## Install`n`n" +
                    "1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager) $seedFloor or newer.`n" +
                    "2. Add HushTumblr as a patch source: https://morphe.software/add-source?github=SysAdminDoc%2FHushTumblr"
            }
            if ($readme -notmatch '(?i)\blatest (?:published )?release is\b') {
                $readme += "`n`n" +
                    "The latest release is [v$seedVersion](https://github.com/SysAdminDoc/HushTumblr/releases/tag/v$seedVersion), " +
                    "with $(@($catalog.patches).Count) patches. Add it to Morphe Manager from " +
                    "[its add-source page](https://morphe.software/add-source?github=SysAdminDoc%2FHushTumblr)."
            }
            $readme + "`n"
        }
        'CHANGELOG.md' {
            if ($seedPendingChangelog) {
                return ([regex]'(?m)^##[ \t]+Unreleased[ \t]*(?=\r?$)').Replace($rootChangelog,
                    "## $seedVersion (2026-09-29)", 1)
            }
            ([regex]'(?m)^## ').Replace([System.IO.File]::ReadAllText((Join-Path $Root 'CHANGELOG.md')),
                ("## $seedVersion (2026-09-29)`n`n* **Tumblr:** The first release, $(@($catalog.patches).Count) patches " +
                    "for Tumblr $($seedTarget.PackageVersion).`n`n## "), 1)
        }
    }
}
if ($seedPendingChangelog) {
    $originalChangelog = $rootChangelog
    try {
        $rootChangelog = $rootChangelog -replace '\r?\n', "`r`n"
        $windowsFixture = Get-ReleaseFileText 'CHANGELOG.md'
        $entry = Test-ChangelogManagerEntry -Current $windowsFixture -ExpectedVersion $seedVersion
        Assert-True $entry.Valid "Pending notes with Windows line endings did not produce a release fixture: $($entry.Reason)"
    } finally { $rootChangelog = $originalChangelog }
}
function Copy-ReleaseFile([string]$Relative, [string]$Destination) {
    if (-not (Test-SeededReleaseFile $Relative)) {
        Copy-Item -LiteralPath (Join-Path $Root $Relative) -Destination $Destination -Force
        return
    }
    [System.IO.File]::WriteAllText($Destination, (Get-ReleaseFileText $Relative), (New-Object System.Text.UTF8Encoding($false)))
}
function Get-ReleaseIndexVersion {
    $text = if ($preRelease) { $seedIndexText } else { Get-Content -LiteralPath $rootIndexPath -Raw }
    return "$(($text | ConvertFrom-Json).version)"
}

$factsScript = Join-Path $PSScriptRoot 'validate-release-facts.ps1'
$factsRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-facts-" + [guid]::NewGuid().ToString('N'))
try {
    New-Item -ItemType Directory -Path $factsRoot -Force | Out-Null
    foreach ($relative in @('patches-list.json', 'patches-bundle.json', 'gradle.properties', 'README.md', 'CHANGELOG.md')) {
        Copy-ReleaseFile $relative (Join-Path $factsRoot $relative)
    }
    New-Item -ItemType Directory -Path (Join-Path $factsRoot 'gradle') -Force | Out-Null
    Copy-Item -LiteralPath (Join-Path $Root 'gradle/libs.versions.toml') `
        -Destination (Join-Path $factsRoot 'gradle/libs.versions.toml')
    $bugFormRelative = '.github/ISSUE_TEMPLATE/bug_report.yml'
    New-Item -ItemType Directory -Path (Join-Path $factsRoot '.github/ISSUE_TEMPLATE') -Force | Out-Null
    Copy-Item -LiteralPath (Join-Path $Root $bugFormRelative) -Destination (Join-Path $factsRoot $bugFormRelative)

    function Invoke-Facts {
        param([switch]$WithUrls, [switch]$AllowLag)
        $arguments = @{ Root = $factsRoot; SkipDescriptionTestCount = $true }
        if (-not $WithUrls) { $arguments['SkipUrlCheck'] = $true }
        if ($AllowLag) { $arguments['AllowPublishedIndexLag'] = $true }
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

    # A prepare window: the source version has moved past the index, which still describes the
    # last release, and the gate allows that lag for an index that did not change. The copied
    # tree is not a release tree then, and holding it to the lagging index failed the control
    # for a reason that had nothing to do with the check (2026-09-17, 0.40.0 being prepared over
    # the 0.39.0 index). The copied index is written up to the catalog it sits beside, its
    # version strings, its patch count and the Tumblr build it names, so every case below
    # still moves exactly one fact and is judged on the strict path.
    # A release hold is the same lag with the version standing still: patches join the catalog
    # while the index keeps the published count (2026-09-23, 93 against 0.58.0's 91), so the count
    # is synced even when the version already matches.
    # The build moves the same way. Tumblr ships often, the catalog takes the new build before
    # the release that publishes it, and the index keeps naming the build it was released on
    # until then. Syncing only the version and the count left the description on the old build,
    # so the control failed on every tree the gate accepted in that window (2026-09-25 review).
    function Sync-FixtureIndex {
        $fixtureVersion = ((Get-Content -LiteralPath (Join-Path $factsRoot 'gradle.properties')) `
            -match '^version\s*=' | Select-Object -First 1) -replace '^version\s*=\s*', ''
        $indexPath = Join-Path $factsRoot 'patches-bundle.json'
        $indexText = Get-Content -LiteralPath $indexPath -Raw
        $index = $indexText | ConvertFrom-Json
        $indexVersion = "$($index.version)"
        $fixtureCatalog = Get-Content -LiteralPath (Join-Path $factsRoot 'patches-list.json') -Raw | ConvertFrom-Json
        $count = @($fixtureCatalog.patches).Count
        $synced = $indexText
        # Bounded by digits, and by a dot on the left, so a version never rewrites part of a build
        # number: 0.10.1 is inside 583.0.0.10.10.
        if ($indexVersion -ne $fixtureVersion) {
            $synced = $synced -replace ('(?<![\d.])' + [regex]::Escape($indexVersion) + '(?!\d)'), $fixtureVersion
        }
        # (?<!\d) and not \b, here and in the count cases below: the raw JSON writes a line break
        # as \n, so a count that opens a paragraph follows the letter n, where \b finds no edge,
        # and an edit that missed it left the description saying the old count.
        $synced = $synced -replace '(?<!\d)\d+ patches\b', "$count patches"
        # The build the description names first is the one the check reads as the published
        # target, so that is the one moved to the catalog's newest, everywhere it appears.
        $fixtureBuild = (Get-PatchTarget -PatchList $fixtureCatalog).PackageVersion
        $indexBuild = [regex]::Match([string]$index.description, 'Tumblr\s+(\d+(?:\.\d+)+)')
        if ($indexBuild.Success -and $indexBuild.Groups[1].Value -ne $fixtureBuild) {
            $synced = $synced -replace ('(?<![\d.])' + [regex]::Escape($indexBuild.Groups[1].Value) + '(?!\d)'), $fixtureBuild
        }
        if ($synced -ceq $indexText) { return }
        Set-FactsFile 'patches-bundle.json' { param($text) $synced }
    }

    # The bug form names the published version and build, which the synced index above now names
    # too. The build moved there without the form until 2026-10-10, so the control failed through
    # the whole 46.5.0.109 hold for a reason none of its cases were about.
    function Sync-FixtureBugForm {
        $fixtureVersion = ((Get-Content -LiteralPath (Join-Path $factsRoot 'gradle.properties')) `
            -match '^version\s*=' | Select-Object -First 1) -replace '^version\s*=\s*', ''
        $fixtureBuild = (Get-PatchTarget -PatchList (Get-Content -LiteralPath (Join-Path $factsRoot 'patches-list.json') -Raw |
            ConvertFrom-Json)).PackageVersion
        $text = Get-Content -LiteralPath (Join-Path $factsRoot $bugFormRelative) -Raw
        $synced = $text -replace '(placeholder:[ \t]*HushTumblr )\S+ on Tumblr \S+', "`${1}$fixtureVersion on Tumblr $fixtureBuild"
        if ($synced -ceq $text) { return }
        Set-FactsFile $bugFormRelative { param($unused) $synced }
    }

    # And the README's version badge and the sentence naming the latest release, which a release
    # moves with the index: the fixture's version, and its catalog's count.
    function Sync-FixtureReadme {
        $fixtureVersion = ((Get-Content -LiteralPath (Join-Path $factsRoot 'gradle.properties')) `
            -match '^version\s*=' | Select-Object -First 1) -replace '^version\s*=\s*', ''
        $count = @((Get-Content -LiteralPath (Join-Path $factsRoot 'patches-list.json') -Raw | ConvertFrom-Json).patches).Count
        $readmePath = Join-Path $factsRoot 'README.md'
        $text = Get-Content -LiteralPath $readmePath -Raw
        $synced = $text -replace 'badge/version-\d+(?:\.\d+)+-', "badge/version-$fixtureVersion-" `
            -replace 'alt="Version \d+(?:\.\d+)+"', "alt=`"Version $fixtureVersion`"" `
            -replace '(latest (?:published )?release is (?:still )?\[?v)\d+(?:\.\d+)+', "`${1}$fixtureVersion" `
            -replace '(latest release is \[v[^\]]*\]\([^)\s]*/tag/v)\d+(?:\.\d+)+', "`${1}$fixtureVersion" `
            -replace '(latest release is \[v[^\]]*\]\([^)\s]*\), with )\d+( patches)', "`${1}$count`${2}" `
            -replace "(\bThe v)\d+(?:\.\d+)+( bundle's line:)", "`${1}$fixtureVersion`${2}" `
            -replace '(?m)^([0-9a-f]{64}  patches-)\d+(?:\.\d+)+(\.mpp)', "`${1}$fixtureVersion`${2}"
        if ($synced -ceq $text) { return }
        Set-FactsFile 'README.md' { param($unused) $synced }
    }

    function Reset-FactsFile {
        param([string]$Name)
        Copy-ReleaseFile $Name (Join-Path $factsRoot $Name)
        if ($Name -eq 'patches-bundle.json') { Sync-FixtureIndex }
        if ($Name -eq $bugFormRelative) { Sync-FixtureBugForm }
        if ($Name -eq 'README.md') { Sync-FixtureReadme }
    }

    Sync-FixtureIndex
    Sync-FixtureBugForm
    Sync-FixtureReadme

    # The control. Everything below is this same tree with one fact moved, so a failure there is
    # the moved fact talking and not the fixture being wrong.
    Invoke-Facts
    Assert-True ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) `
        'The release facts check refused an unmodified copy of this checkout.'

    $catalogVersion = ((Get-Content -LiteralPath (Join-Path $factsRoot 'gradle.properties')) `
        -match '^version\s*=' | Select-Object -First 1) -replace '^version\s*=\s*', ''

    # Pending source notes are valid for an ordinary push, but cannot stand in for a release
    # entry once the index catches up. Published history and non-empty pending notes still count.
    $pendingNumber = [version]$catalogVersion
    $pendingVersion = "$($pendingNumber.Major).$($pendingNumber.Minor).$($pendingNumber.Build + 1)"
    Set-FactsFile 'gradle.properties' {
        param($text) $text -replace '(?m)^(\s*version\s*=\s*)\S+', "`${1}$pendingVersion"
    }
    Set-FactsFile 'patches-list.json' {
        param($text) $text.Replace('"v' + $catalogVersion + '"', '"v' + $pendingVersion + '"')
    }
    Copy-ReleaseFile 'patches-bundle.json' (Join-Path $factsRoot 'patches-bundle.json')
    Copy-ReleaseFile 'README.md' (Join-Path $factsRoot 'README.md')
    Copy-Item -LiteralPath (Join-Path $Root $bugFormRelative) -Destination (Join-Path $factsRoot $bugFormRelative) -Force
    Set-FactsFile 'README.md' {
        param($text) $text -replace 'badge/version-\d+(?:\.\d+)+-', "badge/version-$pendingVersion-" `
            -replace 'alt="Version \d+(?:\.\d+)+"', "alt=`"Version $pendingVersion`""
    }
    Set-FactsFile 'CHANGELOG.md' {
        param($text) "## Unreleased`n`n* **Tumblr:** Pending settings changes.`n`n$text"
    }
    $pendingChangelog = Get-Content -LiteralPath (Join-Path $factsRoot 'CHANGELOG.md') -Raw
    Invoke-Facts -AllowLag
    Assert-True ($LASTEXITCODE -eq 0) 'An ordinary source push with Unreleased notes was refused.'
    Set-FactsFile 'CHANGELOG.md' {
        param($text) $text -replace '(?ms)^## Unreleased.*?(?=^## |\z)', "## Unreleased`n`n"
    }
    Assert-Throws { Invoke-Facts -AllowLag } "*no heading for $pendingVersion*" `
        'An undocumented source version was accepted during an index lag.'
    Set-FactsFile 'CHANGELOG.md' { param($unused) $pendingChangelog }
    $publishedChangelogVersion = Get-ReleaseIndexVersion
    Set-FactsFile 'CHANGELOG.md' {
        param($text) $text -replace ('(?m)^##\s+' + [regex]::Escape($publishedChangelogVersion) + '\b.*$'), '## Retired'
    }
    Assert-Throws { Invoke-Facts -AllowLag } "*no heading for $publishedChangelogVersion*" `
        'Unreleased notes hid the removal of a published changelog entry.'
    Set-FactsFile 'CHANGELOG.md' { param($unused) $pendingChangelog }
    Sync-FixtureIndex
    Sync-FixtureBugForm
    Sync-FixtureReadme
    Assert-Throws { Invoke-Facts } "*no heading for $pendingVersion*" `
        'A release index accepted Unreleased notes instead of its dated entry.'
    foreach ($name in @('gradle.properties', 'patches-list.json', 'README.md', 'CHANGELOG.md',
            'patches-bundle.json', $bugFormRelative)) {
        Reset-FactsFile $name
    }

    # The windows the sync above exists for, built the way a move to a new Tumblr build makes
    # them: the catalog and the README move to a newer Tumblr build while the index
    # still describes the last release. Prepared, the version is bumped and the CHANGELOG has
    # its entry; held, the version stays. The gate's own lenient run accepts both, and the
    # control built from the same tree has to as well, or every script push in that window stops.
    $newestBuild = (Get-PatchTarget -PatchList (Get-Content -LiteralPath (Join-Path $factsRoot 'patches-list.json') -Raw |
        ConvertFrom-Json)).PackageVersion
    $movedBuild = "$([int]($newestBuild -split '\.')[0] + 3).0.0.10.10"
    $current = [version]$catalogVersion
    $nextVersion = "$($current.Major).$($current.Minor).$($current.Build + 1)"
    foreach ($window in @('prepared', 'held')) {
        if ($window -eq 'prepared') {
            Set-FactsFile 'gradle.properties' {
                param($text) $text -replace '(?m)^(\s*version\s*=\s*)\S+', "`${1}$nextVersion"
            }
            Set-FactsFile 'patches-list.json' {
                param($text) $text.Replace('"v' + $catalogVersion + '"', '"v' + $nextVersion + '"')
            }
            Set-FactsFile 'CHANGELOG.md' {
                param($text) ([regex]'(?m)^## ').Replace($text,
                    "## $nextVersion (2026-09-26)`n`n* **Tumblr:** Moves the patches to Tumblr $movedBuild.`n`n## ", 1)
            }
            # The badge moves with the source; the sentence naming the latest release waits for it.
            Set-FactsFile 'README.md' {
                param($text) $text -replace 'badge/version-\d+(?:\.\d+)+-', "badge/version-$nextVersion-" `
                    -replace 'alt="Version \d+(?:\.\d+)+"', "alt=`"Version $nextVersion`""
            }
        }
        Set-FactsFile 'patches-list.json' { param($text) $text.Replace($newestBuild, $movedBuild) }
        Set-FactsFile 'README.md' { param($text) $text.Replace($newestBuild, $movedBuild) }
        # What the maintainer's tree holds: the published index and form as they were. While the
        # index lags, the form names the published release and the build it was made for, the one a
        # reporter on it runs. This case used to move the form's build with the catalog, which only
        # went unnoticed while the published form named an older build than the catalog's newest;
        # the 0.0.7 index push (2026-10-10) was the first tree where it didn't.
        Copy-ReleaseFile 'patches-bundle.json' (Join-Path $factsRoot 'patches-bundle.json')
        Copy-Item -LiteralPath (Join-Path $Root $bugFormRelative) -Destination (Join-Path $factsRoot $bugFormRelative) -Force
        # And its README sentence and checksum example naming that published release, which the sync
        # above moved to the source's version. They only match when this checkout's source is the published one.
        $publishedHere = Get-ReleaseIndexVersion
        Set-FactsFile 'README.md' {
            param($text) $text -replace '(latest (?:published )?release is (?:still )?\[?v)\d+(?:\.\d+)+', "`${1}$publishedHere" `
                -replace '(latest release is \[v[^\]]*\]\([^)\s]*/tag/v)\d+(?:\.\d+)+', "`${1}$publishedHere" `
                -replace "(\bThe v)\d+(?:\.\d+)+( bundle's line:)", "`${1}$publishedHere`${2}" `
                -replace '(?m)^([0-9a-f]{64}  patches-)\d+(?:\.\d+)+(\.mpp)', "`${1}$publishedHere`${2}"
        }
        $global:LASTEXITCODE = 0
        & $factsScript -Root $factsRoot -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipUrlCheck 6> $null
        Assert-True ($LASTEXITCODE -eq 0) "The gate refused the $window tree this case is built on, so it proves nothing."
        # A form that names the catalog's build while the index still describes the last release
        # asks a reporter on that release for a build they don't have.
        $windowForm = Get-Content -LiteralPath (Join-Path $factsRoot $bugFormRelative) -Raw
        Set-FactsFile $bugFormRelative {
            param($text) $text -replace '(placeholder:[ \t]*HushTumblr \S+ on Tumblr )\S+', "`${1}$movedBuild"
        }
        Assert-Throws { & $factsScript -Root $factsRoot -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipUrlCheck 6> $null } `
            '*bug report form version placeholder*' "The gate accepted a $window bug form naming the catalog's build instead of the published one."
        Set-FactsFile $bugFormRelative { param($unused) $windowForm }
        # Lagging, the README may name the source's version or the published one, and no other.
        $windowReadme = Get-Content -LiteralPath (Join-Path $factsRoot 'README.md') -Raw
        $staleReadmes = @(
            @{ Pattern = '*version badge names 0.1.0*'; Edit = { param($text) $text -replace 'badge/version-\d+(?:\.\d+)+-', 'badge/version-0.1.0-' } },
            @{ Pattern = '*latest release is v0.1.0*'; Edit = { param($text) $text -replace '(latest release is \[v)\d+(?:\.\d+)+', '${1}0.1.0' } },
            @{ Pattern = '*checksum example is labeled v0.1.0*'; Edit = { param($text) $text -replace "(\bThe v)\d+(?:\.\d+)+( bundle's line:)", '${1}0.1.0${2}' } })
        if ($window -eq 'prepared') {
            # The checksum example quotes a signed bundle, so unlike the badge it never runs ahead to the source.
            $staleReadmes += @{ Pattern = "*checksum example names patches-$nextVersion.mpp*"
                Edit = { param($text) $text -replace '(?m)^([0-9a-f]{64}  patches-)\d+(?:\.\d+)+(\.mpp)', "`${1}$nextVersion`${2}" } }
        }
        foreach ($stale in $staleReadmes) {
            Set-FactsFile 'README.md' $stale.Edit
            Assert-Throws { & $factsScript -Root $factsRoot -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipUrlCheck 6> $null } `
                $stale.Pattern "The gate accepted a $window README naming a version that is neither the source's nor the published one."
            Set-FactsFile 'README.md' { param($unused) $windowReadme }
        }
        Sync-FixtureIndex
        Sync-FixtureBugForm
        Sync-FixtureReadme
        try {
            Invoke-Facts
        } catch {
            throw "The release facts check refused the $window tree the gate accepts: $($_.Exception.Message)"
        }
        Assert-True ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) `
            "The release facts check refused the $window tree the gate accepts."
        $syncedDescription = [string](Get-Content -LiteralPath (Join-Path $factsRoot 'patches-bundle.json') -Raw | ConvertFrom-Json).description
        Assert-True ($syncedDescription -match "Tumblr $([regex]::Escape($movedBuild))(?!\d)" -and
            $syncedDescription -notmatch [regex]::Escape($newestBuild)) `
            "The $window index was not synced to the catalog's build: $syncedDescription"
        foreach ($name in @('gradle.properties', 'patches-list.json', 'README.md', 'CHANGELOG.md',
                'patches-bundle.json', $bugFormRelative)) {
            Reset-FactsFile $name
        }
    }

    # The sync's version edit is bounded on both sides, because a version can sit in the build
    # number the index describes. Inside one, as 0.10.1 is in 583.0.0.10.10, either bound stops the
    # edit; at the end of one, as in 583.0.0.10.1, only the dot before it does; at the start, as in
    # 0.10.15, only the digit after it. Unbounded, syncing that index to 0.10.2 rewrote the build, the
    # build edit then found nothing to move, and the control would have refused the tree over a
    # build nobody released.
    foreach ($describedBuild in @('583.0.0.10.10', '583.0.0.10.1', '0.10.15')) {
        Set-FactsFile 'patches-bundle.json' {
            param($text) ($text -replace ('(?<![\d.])' + [regex]::Escape($catalogVersion) + '(?!\d)'), '0.10.1').Replace(
                $newestBuild, $describedBuild)
        }
        Set-FactsFile 'gradle.properties' { param($text) $text -replace '(?m)^(\s*version\s*=\s*)\S+', '${1}0.10.2' }
        try {
            Sync-FixtureIndex
            $syncedDescription = [string](Get-Content -LiteralPath (Join-Path $factsRoot 'patches-bundle.json') -Raw | ConvertFrom-Json).description
            Assert-True ($syncedDescription -match "\bv0\.10\.2\b" -and
                $syncedDescription -match "Tumblr $([regex]::Escape($newestBuild))(?!\d)" -and
                $syncedDescription -notmatch 'Tumblr (?:583|0\.10)\.') `
                "Syncing an index at 0.10.1 that describes Tumblr $describedBuild to 0.10.2 did not move it to the catalog's build: $syncedDescription"
        } finally {
            Reset-FactsFile 'gradle.properties'
            Reset-FactsFile 'patches-bundle.json'
        }
    }

    # Manager decodes created_at as kotlinx.datetime.LocalDateTime, not Instant.
    # A trailing Z produces its generic "remote metadata file is unavailable" error,
    # even when both the JSON and bundle download answer HTTP 200.
    foreach ($invalidTimestamp in @(
            '"2026-09-20T21:23:31Z"',
            '"2026-09-20T21:23:31+00:00"',
            '"2026-02-30T21:23:31"',
            '"2026-09-20"',
            '""',
            'null',
            '1790000000')) {
        Set-FactsFile 'patches-bundle.json' {
            param($text)
            $text -replace '"created_at"\s*:\s*("[^"\r\n]*"|null|\d+)', ('"created_at": ' + $invalidTimestamp)
        }
        Assert-Throws { Invoke-Facts } '*created_at*' `
            "An index with a Manager-incompatible created_at was accepted: $invalidTimestamp"
        Reset-FactsFile 'patches-bundle.json'
    }
    Set-FactsFile 'patches-bundle.json' {
        param($text) $text -replace '"created_at"\s*:\s*"[^"\r\n]*"\s*,', ''
    }
    Assert-Throws { Invoke-Facts } '*created_at*' 'An index without created_at was accepted.'
    Reset-FactsFile 'patches-bundle.json'

    # A published index naming a version the catalog does not build. This is the shape v0.28.0
    # shipped in: the index said one thing and the bundle behind it was another.
    Set-FactsFile 'patches-bundle.json' {
        param($text) $text -replace [regex]::Escape('"' + $catalogVersion + '"'), '"9.9.9"'
    }
    Assert-Throws { Invoke-Facts } '*' 'A published index naming another version was accepted.'
    Reset-FactsFile 'patches-bundle.json'

    # The count the published description quotes, which is what somebody reads before they
    # install. A number nobody would notice by eye, which is why the catalog is the source of it.
    Set-FactsFile 'patches-bundle.json' {
        param($text) $text -replace '(?<!\d)\d+ patches\b', '97 patches'
    }
    Assert-Throws { Invoke-Facts } '*' 'An index counting patches the catalog does not have was accepted.'
    Reset-FactsFile 'patches-bundle.json'

    # Read one way, all at once: every "N patches" the description says has to be one count and
    # every "Tumblr <build>" one build. The lag check read the first of each and the equality
    # check any, so a description quoting the catalog's count once and a stale one elsewhere, or
    # naming another build beside the target, passed the equality check. On both paths now.
    # Facts come from the summary alone, the prose before the first ### heading (Get-DescriptionFacts),
    # since the bullets after it can name older builds. So the cases count and edit in that part:
    # in the raw file it ends at the first escaped newline before ###.
    $factsIndexText = Get-Content -LiteralPath (Join-Path $factsRoot 'patches-bundle.json') -Raw
    $summaryEnd = $factsIndexText.IndexOf('\n###')
    $indexSummary = if ($summaryEnd -ge 0) { $factsIndexText.Substring(0, $summaryEnd) } else { $factsIndexText }
    $indexCount = [regex]::Match([string]($factsIndexText | ConvertFrom-Json).description, '(?<![\d.])(\d+) patches\b').Groups[1].Value
    $indexCounts = [regex]::Matches($indexSummary, '(?<!\d)\d+ patches\b').Count
    Assert-True ($indexCounts -ge 2) "The copied description's summary names its patch count once, so the stale-count case would prove nothing."
    $factsTarget = (Get-PatchTarget -PatchList (Get-Content -LiteralPath (Join-Path $factsRoot 'patches-list.json') -Raw |
        ConvertFrom-Json)).PackageVersion
    Assert-True ([regex]::Matches($indexSummary, "Tumblr $([regex]::Escape($factsTarget))(?!\d)").Count -ge 2) `
        "The copied description's summary names Tumblr $factsTarget once, so the other-build case would prove nothing."
    foreach ($case in @(
            @{ Name = 'a stale count beside the catalog''s'; Pattern = "*names 97 and $indexCount patches, and it has to name one count*"
                Edit = { param($text) ([regex]'(?<!\d)\d+ patches\b').Replace($text, '97 patches', 1) } },
            @{ Name = 'another build beside the target'; Pattern = "*names Tumblr $factsTarget and Tumblr 9.9.9.9.9, and it has to name one build*"
                Edit = { param($text) $end = $text.IndexOf('\n###'); if ($end -lt 0) { $end = $text.Length }
                    $at = $text.LastIndexOf("Tumblr $factsTarget", $end - 1)
                    $text.Substring(0, $at) + 'Tumblr 9.9.9.9.9' + $text.Substring($at + "Tumblr $factsTarget".Length) } })) {
        Set-FactsFile 'patches-bundle.json' $case.Edit
        try {
            Assert-Throws { Invoke-Facts } $case.Pattern "An index description naming $($case.Name) was accepted."
            Assert-Throws { & $factsScript -Root $factsRoot -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipUrlCheck 6> $null } `
                $case.Pattern "The lenient check read an index description naming $($case.Name) as one fact."
        } finally {
            Reset-FactsFile 'patches-bundle.json'
        }
    }

    # The same number in the README, which is the other half of the same promise.
    Set-FactsFile 'README.md' {
        param($text) $text -replace '(?<!\d)\d+ patches\b', '97 patches'
    }
    Assert-Throws { Invoke-Facts } '*' 'A README counting patches the catalog does not have was accepted.'
    Reset-FactsFile 'README.md'

    # The version badge and the sentence naming the latest release, which open the README and which
    # nothing read: a copy with both at 0.1.0 passed. Each is held to the release, on both paths.
    foreach ($case in @(
            @{ Name = 'a badge picture naming another version'; Pattern = '*version badge names*0.1.0*'
                Edit = { param($text) $text -replace 'badge/version-\d+(?:\.\d+)+-', 'badge/version-0.1.0-' } },
            @{ Name = 'a badge alt text naming another version'; Pattern = '*version badge names*0.1.0*'
                Edit = { param($text) $text -replace 'alt="Version \d+(?:\.\d+)+"', 'alt="Version 0.1.0"' } },
            @{ Name = 'no version badge'; Pattern = '*no version badge*'
                Edit = { param($text) $text -replace '<img src="https://img\.shields\.io/badge/version-[^>]*>', '' } },
            @{ Name = 'a latest release of another version'; Pattern = '*latest release is v0.1.0*'
                Edit = { param($text) $text -replace '(latest release is \[v)\d+(?:\.\d+)+(\]\([^)\s]*/tag/v)\d+(?:\.\d+)+', '${1}0.1.0${2}0.1.0' } },
            @{ Name = 'a latest release linked to another tag'; Pattern = '*links it to*/tag/v0.1.0*'
                Edit = { param($text) $text -replace '(latest release is \[v\d+(?:\.\d+)+\]\([^)\s]*/tag/v)\d+(?:\.\d+)+', '${1}0.1.0' } },
            # One more than the catalog, so the count never lands on the one the seeded README already states.
            @{ Name = 'a latest release counting other patches'; Pattern = "*latest release has $(@($catalog.patches).Count + 1) patches*"
                Edit = { param($text) $text -replace '(latest release is \[v[^\]]+\]\([^)\s]*\), with )\d+( patches)',
                    ('${1}' + (@($catalog.patches).Count + 1) + '${2}') } },
            @{ Name = 'no sentence naming the latest release'; Pattern = '*does not say which release is the latest*'
                Edit = { param($text) $text -replace 'The latest release is \[v[^\]]+\]\([^)\s]*\), with \d+ patches\.', 'Releases are on GitHub.' } },
            # The checksum example under Verify a download: its label and file name, each on its own, and the pair gone.
            @{ Name = 'a checksum example labeled for another version'; Pattern = '*checksum example is labeled v0.1.0*'
                Edit = { param($text) $text -replace "(\bThe v)\d+(?:\.\d+)+( bundle's line:)", '${1}0.1.0${2}' } },
            @{ Name = 'a checksum example naming another bundle'; Pattern = '*checksum example names patches-0.1.0.mpp*'
                Edit = { param($text) $text -replace '(?m)^([0-9a-f]{64}  patches-)\d+(?:\.\d+)+(\.mpp)', '${1}0.1.0${2}' } },
            @{ Name = 'no checksum example'; Pattern = "*Verify a download section needs one*It has 1 and 0.*"
                Edit = { param($text) $text -replace '(?m)^[0-9a-f]{64}  patches-\d+(?:\.\d+)+\.mpp', 'see SHA256SUMS.txt' } })) {
        $unedited = Get-Content -LiteralPath (Join-Path $factsRoot 'README.md') -Raw
        Set-FactsFile 'README.md' $case.Edit
        try {
            Assert-True ((Get-Content -LiteralPath (Join-Path $factsRoot 'README.md') -Raw) -cne $unedited) `
                "The README case '$($case.Name)' changed nothing, so it proves nothing."
            Assert-Throws { Invoke-Facts } $case.Pattern "A README with $($case.Name) was accepted."
            Assert-Throws { & $factsScript -Root $factsRoot -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipUrlCheck 6> $null } `
                $case.Pattern "The lenient check accepted a README with $($case.Name)."
        } finally {
            Reset-FactsFile 'README.md'
        }
    }

    # The Manager floor in the README is what stops somebody being told to use a Manager that
    # refuses the bundle, so it is held to the patcher the catalog pins.
    #
    # The floor is read out of the fixture rather than written here. It used to name 1.29.0, and
    # when the catalog moved to Manager 1.30.0 the replacement below stopped matching: the README
    # went in unchanged, the check passed as it should have, and this case failed with "No error
    # was raised" while the gate it covers was working perfectly. A version literal in a test
    # goes stale on the next bump, and does it silently until something reads the message.
    $fixtureFloor = ([regex]::Match(
        (Get-Content -LiteralPath (Join-Path $factsRoot 'gradle/libs.versions.toml') -Raw),
        '(?m)^\s*manager-floor\s*=\s*"([^"]+)"')).Groups[1].Value
    Assert-True ($fixtureFloor -match '^\d+\.\d+\.\d+$') `
        "The fixture catalog does not pin a Manager floor, so this case would prove nothing: $fixtureFloor"
    Set-FactsFile 'README.md' {
        param($text) $text -replace ('Morphe Manager ' + [regex]::Escape($fixtureFloor) + ' or newer'),
            'Morphe Manager 1.20.0 or newer'
    }
    Assert-Throws { Invoke-Facts } '*' 'A README naming a Manager older than the patcher needs was accepted.'
    Reset-FactsFile 'README.md'

    # The same floor in the install step, where a link sits between the name and the version, so
    # the pattern above never reached it and a stale step passed while the badge was right. And in
    # the badge's picture, which carries it URL-encoded.
    Set-FactsFile 'README.md' {
        param($text) $text -replace ('(\[Morphe Manager\]\([^)\s]+\)\s+)' + [regex]::Escape($fixtureFloor) + ' or newer'),
            '${1}1.20.0 or newer'
    }
    Assert-Throws { Invoke-Facts } '*Morphe Manager 1.20.0 or newer*' `
        'A README whose install step names an older Manager was accepted.'
    Reset-FactsFile 'README.md'
    Set-FactsFile 'README.md' {
        param($text) $text.Replace("Morphe%20Manager%20$fixtureFloor%2B", 'Morphe%20Manager%201.20.0%2B')
    }
    Assert-Throws { Invoke-Facts } '*README badge Manager floor*' 'A README badge showing an older Manager was accepted.'
    Reset-FactsFile 'README.md'

    # And each copy has to be there. The alt text and install step cases above name a stale floor,
    # which the stale-floor check refuses before the presence checks run, so neither presence check
    # was ever reached. An alt text with no version, or a step reworded past the stale-floor
    # pattern ("or later" for "or newer"), leaves no stale floor to find, and each is refused by
    # its own check's name.
    Set-FactsFile 'README.md' {
        param($text) $text.Replace("alt=`"For Morphe Manager $fixtureFloor or newer`"", 'alt="For Morphe Manager"')
    }
    Assert-Throws { Invoke-Facts } '*README badge alt Manager floor*' 'A README badge whose alt text names no Manager was accepted.'
    Reset-FactsFile 'README.md'
    Set-FactsFile 'README.md' {
        param($text) $text -replace ('(?m)^(\d+\.\s+Install \[Morphe Manager\]\([^)\s]+\))\s+' + [regex]::Escape($fixtureFloor) +
            '\s+or newer\.'), '${1}, version 1.31.0 or later.'
    }
    Assert-Throws { Invoke-Facts } '*README install step Manager floor*' `
        'A README install step reworded past the stale-floor check was accepted.'
    Reset-FactsFile 'README.md'

    # The heading that says this version shipped. Renaming it is what happened on 2026-09-14,
    # and the file is read by this check and by nothing else.
    Set-FactsFile 'CHANGELOG.md' {
        param($text) $text -replace ('(?m)^##\s+' + [regex]::Escape($catalogVersion) + '\b.*$'), '## Unreleased'
    }
    Assert-Throws { Invoke-Facts } '*' 'A CHANGELOG with no heading for the built version was accepted.'
    Reset-FactsFile 'CHANGELOG.md'

    # The bug form's placeholders, which sat three releases behind the target on Hushfeed before
    # anything read them. One for the version line, one for the manager line.
    Set-FactsFile $bugFormRelative {
        param($text) $text -replace '(placeholder:\s*HushTumblr \S+ on Tumblr )\S+', '${1}46.2.3'
    }
    Assert-Throws { Invoke-Facts } '*bug report form version placeholder*' `
        'A bug report form naming an old Tumblr build was accepted.'
    Reset-FactsFile $bugFormRelative
    # A hold: the catalog has moved to a newer Tumblr build while the index keeps the version
    # and the build it was released on. A reporter then runs the published release on that older
    # build, so under the gate's lag allowance the form names the index's build, and a form that
    # already names the catalog's build is refused.
    $catalogBuild = (Get-PatchTarget -PatchList (Get-Content -LiteralPath (Join-Path $factsRoot 'patches-list.json') -Raw |
        ConvertFrom-Json)).PackageVersion
    $heldBuild = '46.0.0.100'
    Set-FactsFile 'patches-bundle.json' {
        param($text) $text -replace ('(?<![\d.])' + [regex]::Escape($catalogBuild) + '(?!\d)'), $heldBuild
    }
    Set-FactsFile $bugFormRelative {
        param($text) $text -replace '(placeholder:[ \t]*HushTumblr \S+ on Tumblr )\S+', "`${1}$heldBuild"
    }
    try { Invoke-Facts -AllowLag } catch {
        throw "A held index with the bug form on its own build was refused: $($_.Exception.Message)"
    }
    Set-FactsFile $bugFormRelative {
        param($text) $text -replace '(placeholder:[ \t]*HushTumblr \S+ on Tumblr )\S+', "`${1}$catalogBuild"
    }
    Assert-Throws { Invoke-Facts -AllowLag } '*bug report form version placeholder*' `
        'A bug report form naming the catalog''s unreleased build while the index lags was accepted.'
    Reset-FactsFile 'patches-bundle.json'
    Reset-FactsFile $bugFormRelative
    Set-FactsFile $bugFormRelative {
        param($text) $text -replace '(placeholder:\s*Morphe Manager )\S+', '${1}1.20.0'
    }
    Assert-Throws { Invoke-Facts } '*bug report form Manager placeholder*' `
        'A bug report form naming a Manager below the floor was accepted.'
    Reset-FactsFile $bugFormRelative
    # And its patch list, which names the catalog's patches: one left out, one the catalog doesn't
    # have and one listed twice are each refused by name, and a form with no list at all is refused.
    $listedPatch = [string]@($catalog.patches)[0].name
    $listedLine = '(?m)^( +)- ' + [regex]::Escape($listedPatch) + '$'
    foreach ($listCase in @(
            @{ Name = 'leaves a patch out'; Pattern = "*bug report form's patch list*leaves out $listedPatch*"
                Edit = { param($text) $text -replace ($listedLine + '\n'), '' } },
            @{ Name = 'lists a patch the catalog lacks'; Pattern = "*bug report form's patch list*patches-list.json has no Hide everything*"
                Edit = { param($text) $text -replace $listedLine, "`${1}- $listedPatch`n`${1}- Hide everything" } },
            @{ Name = 'lists a patch twice'; Pattern = "*bug report form's patch list*lists $listedPatch more than once*"
                Edit = { param($text) $text -replace $listedLine, "`${1}- $listedPatch`n`${1}- $listedPatch" } },
            @{ Name = 'has no patch list'; Pattern = '*bug report form has no patch list*'
                Edit = { param($text) $text -replace 'id: selected_patches', 'id: chosen_patches' } })) {
        Set-FactsFile $bugFormRelative $listCase.Edit
        Assert-Throws { Invoke-Facts } $listCase.Pattern "A bug report form that $($listCase.Name) was accepted."
        Reset-FactsFile $bugFormRelative
    }

    # The download address, one check at a time in the order the script makes them: the release
    # asset's path, HTTPS, then GitHub. Each is refused by name, because a pattern that accepts
    # any error let this case pass on the shape check while it said it tested a dead link.
    foreach ($address in @(
            @{ From = 'https://github\.com/SysAdminDoc/HushTumblr/releases/download/[^"]+'; To = 'http://127.0.0.1:1/patches.mpp'
                Pattern = '*patches-bundle.json download URL does not match*'; Name = 'an index whose address is not the release asset' },
            @{ From = '"https://github\.com/'; To = '"http://github.com/'
                Pattern = '*must use HTTPS*'; Name = 'an index serving the bundle over plain HTTP' },
            @{ From = '"https://github\.com/'; To = '"https://example.com/'
                Pattern = '*must be on github.com*'; Name = 'an index serving the bundle from another host' })) {
        Set-FactsFile 'patches-bundle.json' { param($text) $text -replace $address.From, $address.To }
        Assert-Throws { Invoke-Facts } $address.Pattern "The release facts check accepted $($address.Name)."
        Reset-FactsFile 'patches-bundle.json'
    }

    # A dead link: the address has every right shape and names a release nobody published, which
    # is how the index once pointed at a tag that did not exist yet. GitHub answers 404 for it;
    # here a stand-in for the request does, so the case needs no network. The fetch itself is
    # held to a refused connection with the shared helpers below.
    & {
        function Invoke-WebRequest { throw (New-NotFoundAnswer) }
        Assert-Throws { Invoke-Facts -WithUrls } '*indexed bundle URL https://github.com/*answered HTTP 404*' `
            'An index naming a release nobody published was accepted.'
    }

    # The test counts the description quotes, which only the strict path reads: a release, or the
    # push that rewrites the index. The copied tree holds no test results, so each folder gets a
    # suite of exactly as many tests as the copied description names, and one fact moves per case.
    # The patch count is two folders together, :patches:test's and :patches:fixtureTest's: one
    # fixture test, and the rest in the quick task.
    $factsDescription = [string](Get-Content -LiteralPath (Join-Path $factsRoot 'patches-bundle.json') -Raw |
        ConvertFrom-Json).description
    $runtimeQuoted = [int]([regex]::Match($factsDescription, '\b(\d+) runtime tests passed\b').Groups[1].Value)
    $patchQuoted = [int]([regex]::Match($factsDescription, '\b(\d+) patch tests passed\b').Groups[1].Value)
    Assert-True ($runtimeQuoted -gt 0 -and $patchQuoted -gt 0) `
        "The copied description quotes no test counts, so these cases would prove nothing: $factsDescription"
    function Write-FactsResults {
        param([string]$Folder, [string]$Suite, [int]$Tests, [int]$Skipped = 0)
        $directory = Join-Path $factsRoot $Folder
        Remove-Item -LiteralPath $directory -Recurse -Force -ErrorAction SilentlyContinue
        New-Item -ItemType Directory -Path $directory -Force | Out-Null
        $cases = (1..$Tests | ForEach-Object {
            if ($_ -le $Skipped) { "<testcase name=`"t$_`" classname=`"fixture.$Suite`"><skipped/></testcase>" }
            else { "<testcase name=`"t$_`" classname=`"fixture.$Suite`"/>" }
        }) -join ''
        Set-Content -LiteralPath (Join-Path $directory "TEST-fixture.$Suite.xml") -Encoding UTF8 -Value (
            "<?xml version=`"1.0`" encoding=`"UTF-8`"?><testsuite name=`"fixture.$Suite`" tests=`"$Tests`" " +
            "skipped=`"$Skipped`" failures=`"0`" errors=`"0`">$cases</testsuite>")
    }
    function Invoke-StrictFacts { & $factsScript -Root $factsRoot -SkipUrlCheck 6> $null }
    $runtimeResults = 'extensions/tumblr/build/test-results/testDebugUnitTest'
    $patchResults = 'patches/build/test-results/test'
    $fixtureResults = 'patches/build/test-results/fixtureTest'
    Assert-True ($patchQuoted -gt 2) "The copied description quotes too few patch tests to split between the tasks: $patchQuoted"
    try {
        Write-FactsResults $runtimeResults 'RuntimeTest' $runtimeQuoted
        Write-FactsResults $patchResults 'PatchTest' ($patchQuoted - 1)
        Write-FactsResults $fixtureResults 'FixtureTest' 1
        Invoke-StrictFacts
        Assert-True ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) `
            'The strict release check refused test results that match the description.'

        # A fixture test that skipped, which Gradle reports as a pass.
        Write-FactsResults $fixtureResults 'FixtureTest' 1 -Skipped 1
        Assert-Throws { Invoke-StrictFacts } '*skipped 1 test*' `
            'A release was checked against patch test results with a skipped fixture test.'
        Write-FactsResults $fixtureResults 'FixtureTest' 1

        # The quick task's results alone, as a run of :patches:test without :patches:fixtureTest
        # leaves them. Their count can even match: here the quick folder holds every test.
        Remove-Item -LiteralPath (Join-Path $factsRoot $fixtureResults) -Recurse -Force
        Write-FactsResults $patchResults 'PatchTest' $patchQuoted
        Assert-Throws { Invoke-StrictFacts } '*No patch test results*fixtureTest*:patches:fixtureTest*' `
            'A release was checked with no results from the tests that open the vendor APKs.'
        Write-FactsResults $patchResults 'PatchTest' ($patchQuoted - 1)
        Write-FactsResults $fixtureResults 'FixtureTest' 1

        # A count the run doesn't have, which is how "All 269 patch tests passed" was written.
        Write-FactsResults $patchResults 'PatchTest' $patchQuoted
        Assert-Throws { Invoke-StrictFacts } '*patch test count*' `
            'A description quoting a patch test count the run does not have was accepted.'

        # A test class deleted since the last run. Its results stay until the tests run again,
        # no source left is newer than them, and every class left has results, so its tests
        # were counted as passing. The sources go in first so the results are the newer files.
        $runtimeSource = Join-Path $factsRoot 'extensions/tumblr/src/test/java/fixture/RuntimeTest.java'
        $patchSource = Join-Path $factsRoot 'patches/src/test/kotlin/fixture/PatchTest.kt'
        $fixtureSource = Join-Path $factsRoot 'patches/src/test/kotlin/fixture/FixtureTest.kt'
        foreach ($source in @($runtimeSource, $patchSource, $fixtureSource)) {
            New-Item -ItemType Directory -Path (Split-Path -Parent $source) -Force | Out-Null
            Set-Content -LiteralPath $source -Value '' -Encoding ASCII
        }
        function Add-OrphanResult([string]$Folder, [string]$Suite) {
            Set-Content -LiteralPath (Join-Path (Join-Path $factsRoot $Folder) "TEST-fixture.$Suite.xml") -Encoding UTF8 -Value (
                "<?xml version=`"1.0`" encoding=`"UTF-8`"?><testsuite name=`"fixture.$Suite`" tests=`"1`" " +
                "skipped=`"0`" failures=`"0`" errors=`"0`"><testcase name=`"t1`" classname=`"fixture.$Suite`"/></testsuite>")
        }
        Write-FactsResults $patchResults 'PatchTest' ($patchQuoted - 1)
        Write-FactsResults $fixtureResults 'FixtureTest' 1
        Write-FactsResults $runtimeResults 'RuntimeTest' ($runtimeQuoted - 1)
        Add-OrphanResult $runtimeResults 'GoneTest'
        Assert-Throws { Invoke-StrictFacts } '*runtime test results include 1 test class*GoneTest*' `
            'The runtime results of a deleted test class were counted.'
        Write-FactsResults $runtimeResults 'RuntimeTest' $runtimeQuoted
        Write-FactsResults $patchResults 'PatchTest' ($patchQuoted - 2)
        Add-OrphanResult $patchResults 'GonePatchTest'
        Assert-Throws { Invoke-StrictFacts } '*patch test results include 1 test class*GonePatchTest*' `
            'The patch results of a deleted test class were counted.'
        # The same orphan left in the fixture task's folder.
        Write-FactsResults $patchResults 'PatchTest' ($patchQuoted - 2)
        Add-OrphanResult $fixtureResults 'GonePatchTest'
        Assert-Throws { Invoke-StrictFacts } '*patch test results include 1 test class*GonePatchTest*' `
            'The fixture results of a deleted test class were counted.'
        # A class with one fixture test among quick ones has results in both folders, and that is
        # one class with all its tests counted, not an orphan.
        Write-FactsResults $patchResults 'PatchTest' ($patchQuoted - 2)
        Write-FactsResults $fixtureResults 'FixtureTest' 1
        Add-OrphanResult $fixtureResults 'PatchTest'
        Invoke-StrictFacts
        Assert-True ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) `
            'The strict release check refused a test class whose tests ran in both patch test tasks.'
        # The control: the same sources with no orphan pass.
        Write-FactsResults $runtimeResults 'RuntimeTest' $runtimeQuoted
        Write-FactsResults $patchResults 'PatchTest' ($patchQuoted - 1)
        Write-FactsResults $fixtureResults 'FixtureTest' 1
        Invoke-StrictFacts
        Assert-True ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) `
            'The strict release check refused results that match their sources and the description.'
        foreach ($folder in @('extensions/tumblr/src', 'patches/src')) {
            Remove-Item -LiteralPath (Join-Path $factsRoot $folder) -Recurse -Force
        }

        Remove-Item -LiteralPath (Join-Path $factsRoot 'patches') -Recurse -Force
        Assert-Throws { Invoke-StrictFacts } '*No patch test results*' `
            'A release was checked with no patch test results at all.'

        # Results the check is told to leave unread, as the pre-push hook does in its worktree,
        # where they can belong to another commit: read, a skipped runtime test fails the lenient
        # check; unread, it doesn't. A check that quotes counts can't be told to skip them.
        Write-FactsResults $runtimeResults 'RuntimeTest' $runtimeQuoted -Skipped 1
        Assert-Throws { Invoke-Facts } '*skipped=1*' 'A lenient check read past a skipped runtime test.'
        & $factsScript -Root $factsRoot -SkipDescriptionTestCount -SkipUrlCheck -SkipTestResults 6> $null
        Assert-True ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) `
            'A check told to leave the test results unread read them anyway.'
        Assert-Throws { & $factsScript -Root $factsRoot -SkipUrlCheck -SkipTestResults 6> $null } `
            '*SkipDescriptionTestCount*' 'A check holding the description to its counts left the results unread.'
    } finally {
        foreach ($folder in @('patches', 'extensions')) {
            Remove-Item -LiteralPath (Join-Path $factsRoot $folder) -Recurse -Force -ErrorAction SilentlyContinue
        }
    }

    # And the same tree, once every fact is put back, is accepted again. Without this the cases
    # above would also pass against a fixture that had become permanently broken.
    Invoke-Facts
    Assert-True ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) `
        'The release facts check refused the fixture after every change was put back.'
} finally {
    Remove-Item -LiteralPath $factsRoot -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host '[scripts] release facts contracts passed'

# --- pre-push.ps1 ----------------------------------------------------------------------------
#
# Which files make the hook run the release check. The receipt is what the check holds a release
# to and the allowlist is what it accepts manifest changes from, and a push that moved only one
# of them ran no release check at all. Driven against a stub root whose validate script records
# that it was called, so the case proves the routing and not the check.

$prePushScript = Join-Path $PSScriptRoot 'pre-push.ps1'
$hookRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-hook-" + [guid]::NewGuid().ToString('N'))
$routingFixtures = $null
$savedSkip = $env:HUSHTUMBLR_SKIP_PRE_PUSH
$savedRoutingWrapper = $env:HUSHTUMBLR_BUILD_WRAPPER
$savedRoutingFixtures = $env:HUSHTUMBLR_FIXTURE_DIR
$savedRoutingActor = $env:GITHUB_ACTOR
$savedRoutingToken = $env:GITHUB_TOKEN
$savedHookGit = @{}
# These cases invoke another hook against a foreign repository. Git's own hook environment
# must not leak into that repository or its local bare transport, including GIT_EXEC_PATH.
foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
    $savedHookGit[$variable.Name] = $variable.Value
    Remove-Item -LiteralPath ('Env:\' + $variable.Name)
}
try {
    $env:HUSHTUMBLR_SKIP_PRE_PUSH = $null
    New-Item -ItemType Directory -Path (Join-Path $hookRoot 'scripts') -Force | Out-Null
    # A repository from the start, empty until the cases below commit to it: every push is scanned
    # for machine names now, a run by hand included, and the scan reads the root through git.
    & git -C $hookRoot init --quiet
    $actualHookGitDir = (& git -C $hookRoot rev-parse --absolute-git-dir).Trim()
    Assert-True ([IO.Path]::GetFullPath($actualHookGitDir).TrimEnd('\', '/') -ieq
        [IO.Path]::GetFullPath((Join-Path $hookRoot '.git')).TrimEnd('\', '/')) `
        'The hook fixture resolved outside its temporary repository; refusing to write.'
    & git -C $hookRoot config user.name 'Hook Contract'
    & git -C $hookRoot config user.email 'hook@example.invalid'
    # The hook requires the pushed tree's pinned catalog before starting even a recording build.
    # Every routing repository carries that same catalog/helper, with APK stand-ins outside it.
    function Initialize-HookFixtureCatalog([string]$Repository) {
        New-Item -ItemType Directory -Path (Join-Path $Repository 'scripts') -Force | Out-Null
        Copy-Item -LiteralPath (Join-Path $Root 'patches-list.json') -Destination (Join-Path $Repository 'patches-list.json')
        Copy-Item -LiteralPath (Join-Path $Root 'scripts/patch-target.ps1') -Destination (Join-Path $Repository 'scripts/patch-target.ps1')
        $fixtureWrapper = Join-Path $Repository 'gradle/wrapper'
        New-Item -ItemType Directory -Path $fixtureWrapper -Force | Out-Null
        foreach ($name in @('gradle-wrapper.properties', 'gradle-wrapper.jar')) {
            Copy-Item -LiteralPath (Join-Path $Root ('gradle/wrapper/' + $name)) -Destination (Join-Path $fixtureWrapper $name)
        }
        # A later isolation case copies the hook beside this scanner. Keep its real wrapper
        # guard when dot-sourced, while the recorded scan itself still needs no network/report.
        $checker = Join-Path $Root 'scripts/build-advisories.ps1'
        $checkerAst = [Management.Automation.Language.Parser]::ParseFile($checker, [ref]$null, [ref]$null)
        $wrapperGuard = $checkerAst.Find({ param($node)
            $node -is [Management.Automation.Language.FunctionDefinitionAst] -and
                $node.Name -ceq 'Assert-ReviewedGradleWrapper'
        }, $true).Extent.Text
        Set-Content -LiteralPath (Join-Path $Repository 'scripts/build-advisories.ps1') -Encoding ASCII -Value @(
            'param([string]$Root)', $wrapperGuard, 'if ($MyInvocation.InvocationName -eq ''.'') { return }', 'exit 0')
    }
    Initialize-HookFixtureCatalog $hookRoot
    $routingFixtures = [IO.Path]::GetFullPath("$hookRoot-fixtures")
    Assert-True ([IO.Path]::GetDirectoryName($routingFixtures) -ieq
        [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\', '/')) `
        'The routing fixture directory resolved outside the temporary directory.'
    New-Item -ItemType Directory -Path $routingFixtures -Force | Out-Null
    $routingTarget = Get-PatchTarget -PatchList $catalog
    foreach ($version in $routingTarget.PackageVersions) {
        foreach ($code in @($routingTarget.PackageVersionCodes[$version])) {
            Set-Content -LiteralPath (Join-Path $routingFixtures "tumblr-$version-$code.apk") `
                -Value 'vendor APK stand-in' -Encoding ASCII
        }
    }
    $env:HUSHTUMBLR_FIXTURE_DIR = $routingFixtures
    $factsMarker = Join-Path $hookRoot 'facts-ran.txt'
    $contractsMarker = Join-Path $hookRoot 'contracts-ran.txt'
    Set-Content -LiteralPath (Join-Path $hookRoot 'scripts/validate-release-facts.ps1') -Encoding UTF8 -Value @(
        'param([string]$Root, [switch]$SkipDescriptionTestCount, [switch]$AllowPublishedIndexLag,',
        '    [switch]$VerifyPublishedAsset, [string]$ArtifactPath, [switch]$ArtifactIsHosted)',
        ("Set-Content -LiteralPath '$factsMarker' -Value " +
            "`"lag=`$AllowPublishedIndexLag skip=`$SkipDescriptionTestCount verify=`$VerifyPublishedAsset artifact=`$ArtifactPath hosted=`$ArtifactIsHosted`""),
        'exit 0')
    # A released checkout holds the index. The cases that take it away are marked below.
    $stubIndex = Join-Path $hookRoot 'patches-bundle.json'
    Set-Content -LiteralPath $stubIndex -Encoding UTF8 -Value '{}'
    Set-Content -LiteralPath (Join-Path $hookRoot 'scripts/test-script-contracts.ps1') -Encoding UTF8 -Value @(
        'param([string]$Root)',
        "Set-Content -LiteralPath '$contractsMarker' -Value 'ran'",
        'exit 0')
    # The runtime tests start through HUSHTUMBLR_BUILD_WRAPPER, which the hook reads from the
    # user's environment when this process lacks it, so a stub stands in for it here: it records
    # that the tests were asked for and builds nothing. The credentials the build path wants first
    # are dummies. The build sections further down put stubs of their own in its place.
    $buildMarker = Join-Path $hookRoot 'build-ran.txt'
    $routingBuild = Join-Path $hookRoot 'routing-build.ps1'
    Set-Content -LiteralPath $routingBuild -Encoding UTF8 -Value @(
        'param([string]$ProjectDir, [string[]]$Tasks)',
        "Set-Content -LiteralPath '$buildMarker' -Value 'ran'",
        'exit 0')
    $env:HUSHTUMBLR_BUILD_WRAPPER = $routingBuild
    $env:GITHUB_ACTOR = 'contract'
    $env:GITHUB_TOKEN = 'contract'

    function Invoke-Hook {
        param([string[]]$Paths)
        Remove-Item -LiteralPath $factsMarker, $contractsMarker, $buildMarker -Force -ErrorAction SilentlyContinue
        $global:LASTEXITCODE = 0
        & $prePushScript -Root $hookRoot -ChangedPaths $Paths 6> $null
        if ($LASTEXITCODE -ne 0) { throw "pre-push exited $LASTEXITCODE for $($Paths -join ', ')" }
    }

    # The control: a file no gate reads runs no gate, so a marker below is the routing talking.
    Invoke-Hook -Paths @('CONTRIBUTING.md')
    Assert-True (-not (Test-Path -LiteralPath $factsMarker)) `
        'The release check ran for a push that changed nothing it reads.'

    # HUSHTUMBLR_SKIP_PRE_PUSH is the way through the hook's own messages offer, and it has to
    # work whatever the working tree holds. A copy of the hook beside a common.ps1 with conflict
    # markers in it, as mid-rebase, stops on the parse error without the switch and goes through
    # with it. The hook used to load common.ps1 first and stop either way.
    $brokenHook = Join-Path $hookRoot 'broken-hook'
    New-Item -ItemType Directory -Path (Join-Path $brokenHook 'scripts') -Force | Out-Null
    Copy-Item -LiteralPath $prePushScript -Destination (Join-Path $brokenHook 'scripts/pre-push.ps1')
    Set-Content -LiteralPath (Join-Path $brokenHook 'scripts/common.ps1') -Encoding ASCII -Value @(
        '<<<<<<< HEAD', 'function Find-MachineNames {', '=======', '>>>>>>> theirs')
    $brokenPrePush = Join-Path $brokenHook 'scripts/pre-push.ps1'
    try {
        Assert-Throws { & $brokenPrePush -Root $brokenHook -ChangedPaths @('README.md') 6> $null } '*common.ps1*' `
            'The hook ran with a common.ps1 that does not parse, so the case below would prove nothing.'
        $env:HUSHTUMBLR_SKIP_PRE_PUSH = '1'
        $global:LASTEXITCODE = 0
        try {
            $skipped = @(& $brokenPrePush -Root $brokenHook -ChangedPaths @('README.md') 6>&1 | ForEach-Object { "$_" }) -join "`n"
        } catch {
            throw "HUSHTUMBLR_SKIP_PRE_PUSH=1 did not get a push past a common.ps1 that does not parse: $($_.Exception.Message)"
        }
        Assert-True ($LASTEXITCODE -eq 0 -and $skipped -like '*skipped by HUSHTUMBLR_SKIP_PRE_PUSH*') `
            "HUSHTUMBLR_SKIP_PRE_PUSH=1 did not say it skipped the hook: $skipped"
    } finally {
        $env:HUSHTUMBLR_SKIP_PRE_PUSH = $null
        Remove-Item -LiteralPath $brokenHook -Recurse -Force -ErrorAction SilentlyContinue
    }

    Invoke-Hook -Paths @('release-receipt-0.31.0.json')
    Assert-True (Test-Path -LiteralPath $factsMarker) `
        'A push that changed only the release receipt ran no release check.'
    Assert-True ((Get-Content -LiteralPath $factsMarker -Raw) -like 'lag=True*') `
        'A receipt-only push took the strict published-index path.'

    # Before the first release: no index and no v* tag means no release facts, so a README push
    # says so and runs no release check. A tag alone brings the check back, and so does an index
    # alone, which the case above already had.
    Remove-Item -LiteralPath $stubIndex -Force
    try {
        Remove-Item -LiteralPath $factsMarker -Force -ErrorAction SilentlyContinue
        $global:LASTEXITCODE = 0
        $unreleased = @(& $prePushScript -Root $hookRoot -ChangedPaths @('README.md') 6>&1 | ForEach-Object { "$_" }) -join "`n"
        Assert-True ($LASTEXITCODE -eq 0 -and -not (Test-Path -LiteralPath $factsMarker)) `
            'A README push before the first release ran the release check, which needs an index that does not exist yet.'
        Assert-True ($unreleased -like '*nothing has been released yet*') `
            "A README push before the first release did not say why it skipped the release check: $unreleased"
        & git -C $hookRoot commit --allow-empty --quiet -m 'release base'
        & git -C $hookRoot tag v0.0.1
        try {
            Invoke-Hook -Paths @('README.md')
            Assert-True (Test-Path -LiteralPath $factsMarker) `
                'A README push after a release tag, with the index gone, ran no release check.'
        } finally {
            & git -C $hookRoot tag -d v0.0.1 | Out-Null
        }
    } finally {
        Set-Content -LiteralPath $stubIndex -Encoding UTF8 -Value '{}'
    }

    Invoke-Hook -Paths @('scripts/manifest-delta-allowlist.txt')
    Assert-True (Test-Path -LiteralPath $factsMarker) `
        'A push that changed only the manifest delta allowlist ran no release check.'
    Assert-True (Test-Path -LiteralPath $contractsMarker) `
        'A push that changed the manifest delta allowlist skipped the script contract tests.'

    # Any script change runs the contract tests, and a gate that finds them gone stops the push
    # instead of noting it and carrying on, which is how this suite was missing for HushTumblr's
    # first commits.
    Invoke-Hook -Paths @('scripts/patch-report.ps1')
    Assert-True (Test-Path -LiteralPath $contractsMarker) `
        'A push that changed a script outside every named suite skipped the script contract tests.'
    $contractsStubPath = Join-Path $hookRoot 'scripts/test-script-contracts.ps1'
    $contractsStubText = Get-Content -LiteralPath $contractsStubPath -Raw
    Remove-Item -LiteralPath $contractsStubPath -Force
    try {
        Assert-Throws { Invoke-Hook -Paths @('scripts/patch-report.ps1') } '*test-script-contracts.ps1 is missing*' `
            'A script push went through with the contract tests missing.'
        Assert-Throws { Invoke-Hook -Paths @('scripts/test-script-contracts.ps1') } '*was deleted in this push*' `
            'A push that deleted the contract tests went through.'
    } finally {
        Set-Content -LiteralPath $contractsStubPath -Value $contractsStubText -Encoding UTF8 -NoNewline
    }

    # The five verifier suites run only when their own files move, and pre-push.ps1 decides which
    # files those are. A push of pre-push.ps1 runs this suite and no other, so an edit that put a
    # suite line behind a dead branch, or dropped a file from a suite's list, went out through the
    # gate it switched off. This suite is the one place that holds the routing, then: all six
    # suite lines read through the parser (script-wiring.ps1), each also tried behind a dead
    # branch so the check can't pass by passing everything, and every file a verifier suite guards
    # pushed through the hook against stub suites that record they ran. A file starts exactly the
    # suites whose lists hold it. The source ledger's suite also guards files outside scripts/,
    # which are pushed after.
    $prePushSource = [System.IO.File]::ReadAllText($prePushScript)
    $deadSuiteCopy = Join-Path $hookRoot 'pre-push-dead-suite.ps1'
    $verifierRoutes = [ordered]@{
        'scripts/test-injected-registers.ps1' = @('BadDexFixture.java', 'DexDiff.java', 'DexDeltaFixture.java', 'dex-delta-allowlist.txt',
            'FeatureDexFixture.java', 'SelectorDexFixture.java',
            'AccountDexFixture.java', 'MatureDexFixture.java', 'RootMuteDexFixture.java', 'MutualDexFixture.java',
            'HostReferences.java', 'HostReferenceFixture.java', 'host-reference-contracts.txt', 'test-host-references.ps1',
            'patch-for-device.ps1', 'injected-mutation-contracts.txt',
            'injected-register-contracts.ps1', 'injected-register-removal-allowlist.txt', 'script-wiring.ps1',
            'test-injected-registers.ps1', 'verify-all-patches.ps1', 'verify-injected-registers.ps1')
        'scripts/test-resource-table-check.ps1' = @('MergeSplits.java', 'ResourceTableCheck.java', 'resource-delta-allowlist.txt',
            'test-resource-table-check.ps1', 'verify-all-patches.ps1')
        'scripts/test-injected-register-device.ps1' = @('injected-register-device.ps1', 'script-wiring.ps1',
            'test-injected-register-device.ps1', 'verify-injected-registers.ps1')
        'scripts/test-fingerprint-candidates.ps1' = @('FingerprintCandidates.java', 'FingerprintFixture.java',
            'fingerprint-calibration.txt', 'fingerprint-candidates.ps1', 'fingerprint-signature.schema.json',
            'test-fingerprint-candidates.ps1')
        'scripts/test-tumblr-sources.ps1' = @('audit-tumblr-sources.ps1', 'tumblr-sources.ps1', 'patch-target.ps1',
            'test-tumblr-sources.ps1')
    }
    foreach ($suite in @('scripts/test-script-contracts.ps1') + @($verifierRoutes.Keys)) {
        Assert-True (Test-PushGateRunsSuite $prePushScript $suite) "The push gate does not run $suite."
        $suiteLine = { param($Node)
            $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
            $Node.Left.Extent.Text -eq '$suites' -and $Node.Extent.Text -like "*'$suite'*" }.GetNewClosure()
        [System.IO.File]::WriteAllText($deadSuiteCopy,
            (Edit-ScriptNode $prePushSource $suiteLine { param($Text) "if (`$false) { $Text }" }))
        Assert-True (-not (Test-PushGateRunsSuite $deadSuiteCopy $suite)) `
            "The wiring check read $suite as running from behind a dead branch."
    }
    $verifierMarker = { param([string]$Suite) Join-Path $hookRoot ([IO.Path]::GetFileNameWithoutExtension($Suite) + '-ran.txt') }
    foreach ($suite in $verifierRoutes.Keys) {
        Set-Content -LiteralPath (Join-Path $hookRoot $suite) -Encoding UTF8 -Value @(
            'param([string]$Root)', "Set-Content -LiteralPath '$(& $verifierMarker $suite)' -Value 'ran'", 'exit 0')
    }
    foreach ($file in @(@($verifierRoutes.Values | ForEach-Object { $_ }) + @('patch-report.ps1') | Select-Object -Unique)) {
        foreach ($suite in $verifierRoutes.Keys) { Remove-Item -LiteralPath (& $verifierMarker $suite) -Force -ErrorAction SilentlyContinue }
        Invoke-Hook -Paths @("scripts/$file")
        $ran = @($verifierRoutes.Keys | Where-Object { Test-Path -LiteralPath (& $verifierMarker $_) }) -join ', '
        $expected = @($verifierRoutes.Keys | Where-Object { $verifierRoutes[$_] -contains $file }) -join ', '
        Assert-True ($ran -eq $expected) "A push of scripts/$file ran [$ran], not [$expected]."
    }
    # The ledger's rules read NOTICE, provenance.json and the catalog, and hold docs/sources.md to
    # the ledger. A push of any of those, or of the ledger alone, runs its suite and no other
    # verifier; the catalog also runs the release facts and the contract tests, held below.
    foreach ($file in @('sources/tumblr-sources.json', 'NOTICE', 'provenance.json', 'docs/sources.md', 'patches-list.json')) {
        foreach ($suite in $verifierRoutes.Keys) { Remove-Item -LiteralPath (& $verifierMarker $suite) -Force -ErrorAction SilentlyContinue }
        Invoke-Hook -Paths @($file)
        $ran = @($verifierRoutes.Keys | Where-Object { Test-Path -LiteralPath (& $verifierMarker $_) }) -join ', '
        Assert-True ($ran -eq 'scripts/test-tumblr-sources.ps1') "A push of $file ran [$ran], not the source ledger's suite alone."
        if ($file -ne 'patches-list.json') {
            Assert-True (-not (Test-Path -LiteralPath $contractsMarker) -and -not (Test-Path -LiteralPath $factsMarker)) `
                "A push of $file ran the contract tests or the release facts, which read nothing it changes."
        }
    }

    # The catalog is held to Tumblr's signer, the builds every patch declares and the internal
    # dependencies the release scripts expect, and only the contract tests read it for those. A
    # push of the catalog alone ran the release facts and never them.
    Invoke-Hook -Paths @('patches-list.json')
    Assert-True ((Test-Path -LiteralPath $factsMarker) -and (Test-Path -LiteralPath $contractsMarker)) `
        'A push that changed only the catalog did not run both the release check and the script contract tests.'

    # These tests copy the README into the release facts fixture and hold it to the catalog there,
    # so a push of only the README runs them as well as the release check.
    Invoke-Hook -Paths @('README.md')
    Assert-True ((Test-Path -LiteralPath $factsMarker) -and (Test-Path -LiteralPath $contractsMarker)) `
        'A push that changed only the README did not run both the release check and the script contract tests.'

    Invoke-Hook -Paths @('CHANGELOG.md')
    Assert-True (Test-Path -LiteralPath $factsMarker) `
        'A push that changed only the CHANGELOG ran no release check.'
    Assert-True (-not (Test-Path -LiteralPath $contractsMarker)) `
        'A push that changed only the CHANGELOG ran the script contract tests; the release check is what holds that file.'

    Invoke-Hook -Paths @('.github/ISSUE_TEMPLATE/bug_report.yml')
    Assert-True (Test-Path -LiteralPath $factsMarker) `
        'A push that changed only the bug report form ran no release check.'

    Invoke-Hook -Paths @('patches-bundle.json')
    Assert-True (Test-Path -LiteralPath $factsMarker) 'An index change ran no release check.'
    Assert-True ((Get-Content -LiteralPath $factsMarker -Raw) -like 'lag=False*') `
        'An index change was allowed to lag behind the published release.'
    # With no bundle built here the hosted one is checked on its own, never skipped; the release
    # root section below runs that against the real check.
    Assert-True ((Get-Content -LiteralPath $factsMarker -Raw) -like '*verify=True artifact= hosted=True*') `
        "An index push with no bundle built here did not have the hosted one checked: $(Get-Content -LiteralPath $factsMarker -Raw)"

    # The order that shipped a dexless bundle: buildAndroid, then any task that reruns
    # :patches:jar, which leaves the plain jar in build/libs under the bundle's own name. The
    # finished bundle sits in build/release, and the index push must be compared against that
    # one. A plain jar left beside it in build/libs is the state :patches:test produces.
    $releaseDirectory = Join-Path $hookRoot 'patches/build/release'
    $libsDirectory = Join-Path $hookRoot 'patches/build/libs'
    New-Item -ItemType Directory -Path $releaseDirectory, $libsDirectory -Force | Out-Null
    # Normalized, because the hook hands over the listing's own full name.
    $releaseCopy = [System.IO.Path]::GetFullPath((Join-Path $releaseDirectory 'patches-9.9.9.mpp'))
    Set-Content -LiteralPath $releaseCopy -Value 'bundle with classes.dex' -Encoding ASCII
    Set-Content -LiteralPath (Join-Path $libsDirectory 'patches-9.9.9.mpp') -Value 'plain jar' -Encoding ASCII
    Invoke-Hook -Paths @('patches-bundle.json')
    $routed = Get-Content -LiteralPath $factsMarker -Raw
    Assert-True ($routed -like '*verify=True*') `
        'An index push with a built release bundle did not compare it against the published asset.'
    Assert-True ($routed -like "*artifact=$releaseCopy hosted=False*") `
        "The index push compared something other than the release copy: $routed"
    Remove-Item -LiteralPath (Join-Path $hookRoot 'patches') -Recurse -Force

    # The files outside the source trees that the runtime tests read. ReadmePatchNamesTest holds the
    # README's patch rows to the catalog, ProvenanceTest holds NOTICE and every source's header to
    # provenance.json, PatchFamilyTest reads the catalog, and ShortcutCallsTest reads the mutation
    # contracts. The Gradle files declare them as test inputs, and a push of one alone still never
    # started the tests. Files no test reads still don't start them.
    foreach ($route in @(
            @{ Path = 'README.md'; Build = $true }, @{ Path = 'NOTICE'; Build = $true },
            @{ Path = 'provenance.json'; Build = $true }, @{ Path = 'patches-list.json'; Build = $true },
            @{ Path = 'scripts/injected-mutation-contracts.txt'; Build = $true },
            @{ Path = 'scripts/injected-register-removal-allowlist.txt'; Build = $false },
            @{ Path = 'CHANGELOG.md'; Build = $false }, @{ Path = 'docs/sources.md'; Build = $false },
            @{ Path = 'sources/tumblr-sources.json'; Build = $false }, @{ Path = 'patches-bundle.json'; Build = $false },
            @{ Path = 'assets/icons/icon-16.png'; Build = $false }, @{ Path = 'CONTRIBUTING.md'; Build = $false })) {
        Invoke-Hook -Paths @($route.Path)
        $started = Test-Path -LiteralPath $buildMarker
        Assert-True ($started -eq $route.Build) `
            "A push of only $($route.Path) $(if ($started) { 'started' } else { 'did not start' }) the runtime tests."
    }

    # What a push changes, read the way git lists it. Taken for a rename, a moved file was listed
    # under its new path alone: patches-bundle.json moved away ran no release check, a source moved
    # out of extensions/ no runtime tests, and a verifier suite renamed was never looked for, so the
    # push went out without it. And git quotes a path with a byte outside ASCII unless told not to,
    # and "extensions/.../\303\234ber.java" in quotes matched no route. A repository of its own,
    # clean and pushed from HEAD, so every check runs in place from the stubs its commits carry.
    $listingRepo = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-listing-" + [guid]::NewGuid().ToString('N'))
    $listingRan = "$listingRepo-ran"
    New-Item -ItemType Directory -Path (Join-Path $listingRepo 'scripts'), $listingRan -Force | Out-Null
    try {
        & git -C $listingRepo init --quiet
        $listingGitDir = (& git -C $listingRepo rev-parse --absolute-git-dir).Trim()
        Assert-True ([IO.Path]::GetFullPath($listingGitDir).TrimEnd('\', '/') -ieq
            [IO.Path]::GetFullPath((Join-Path $listingRepo '.git')).TrimEnd('\', '/')) `
            'The listing fixture resolved outside its temporary repository; refusing to write.'
        & git -C $listingRepo config user.name 'Listing Contract'
        & git -C $listingRepo config user.email 'listing@example.invalid'
        & git -C $listingRepo config core.autocrlf false
        Initialize-HookFixtureCatalog $listingRepo
        $listingStubs = [ordered]@{
            'scripts/validate-release-facts.ps1' = ('param([string]$Root, [switch]$SkipDescriptionTestCount, ' +
                '[switch]$AllowPublishedIndexLag, [switch]$VerifyPublishedAsset, [string]$ArtifactPath, ' +
                '[switch]$ArtifactIsHosted, [switch]$SkipTestResults)')
        }
        foreach ($suite in @('scripts/test-script-contracts.ps1') + @($verifierRoutes.Keys)) {
            $listingStubs[$suite] = 'param([string]$Root)'
        }
        foreach ($stub in $listingStubs.Keys) {
            $ranFile = Join-Path $listingRan ([IO.Path]::GetFileNameWithoutExtension($stub) + '.txt')
            $markerValue = if ($stub -eq 'scripts/validate-release-facts.ps1') {
                "Set-Content -LiteralPath '$ranFile' -Value `"lag=`$AllowPublishedIndexLag skip=`$SkipDescriptionTestCount`""
            } else {
                "Set-Content -LiteralPath '$ranFile' -Value 'ran'"
            }
            Set-Content -LiteralPath (Join-Path $listingRepo $stub) -Encoding UTF8 -Value @(
                $listingStubs[$stub], $markerValue, 'exit 0')
        }
        # Commits what -Change leaves, pushes it the way git hands the hook a push, and answers
        # with what ran: the stubs by name, and build for the runtime tests.
        function Push-ListingChange([scriptblock]$Change, [switch]$NewBranch) {
            $before = if ($NewBranch) { '0' * 40 } else { (& git -C $listingRepo rev-parse HEAD).Trim() }
            & $Change
            & git -C $listingRepo add -A
            & git -C $listingRepo commit --quiet -m 'listing case'
            $after = (& git -C $listingRepo rev-parse HEAD).Trim()
            Remove-Item -Path (Join-Path $listingRan '*') -Force -ErrorAction SilentlyContinue
            Remove-Item -LiteralPath $buildMarker -Force -ErrorAction SilentlyContinue
            $global:LASTEXITCODE = 0
            & $prePushScript -Root $listingRepo -PushedRefs "refs/heads/main $after refs/heads/main $before" 6> $null
            if ($LASTEXITCODE -ne 0) { throw "pre-push exited $LASTEXITCODE" }
            $ran = @(Get-ChildItem -LiteralPath $listingRan -File | ForEach-Object { $_.BaseName } | Sort-Object)
            if (Test-Path -LiteralPath $buildMarker) { $ran = @('build') + $ran }
            return ($ran -join ', ')
        }

        # A new branch is read from its whole tree, where the one source has a name outside ASCII.
        $javaFolder = Join-Path $listingRepo 'extensions/tumblr/src/main/java'
        $ran = Push-ListingChange -NewBranch {
            New-Item -ItemType Directory -Path $javaFolder -Force | Out-Null
            Set-Content -LiteralPath (Join-Path $javaFolder "$([char]0x00DC)ber.java") -Encoding ASCII -Value 'final class U {}'
        }
        Assert-True ($ran -like 'build, *') "A new branch whose only source has a name outside ASCII ran [$ran], without the runtime tests."
        $ran = Push-ListingChange {
            Set-Content -LiteralPath (Join-Path $listingRepo 'patches-bundle.json') -Encoding ASCII -Value '{}'
            Set-Content -LiteralPath (Join-Path $javaFolder 'Moved.java') -Encoding ASCII -Value 'final class Moved {}'
        }
        Assert-True ($ran -eq 'build, validate-release-facts') "A push adding the index and a source ran [$ran]."
        $featureTip = (& git -C $listingRepo rev-parse HEAD).Trim()
        Remove-Item -Path (Join-Path $listingRan '*') -Force -ErrorAction SilentlyContinue
        $global:LASTEXITCODE = 0
        & $prePushScript -Root $listingRepo -PushedRefs "refs/heads/feature $featureTip refs/heads/feature $('0' * 40)" 6> $null
        Assert-True ($LASTEXITCODE -eq 0) 'A new feature branch with an index file failed its push gate.'
        $featureFacts = Get-Content -LiteralPath (Join-Path $listingRan 'validate-release-facts.txt') -Raw
        Assert-True ($featureFacts -like 'lag=True skip=True*') `
            'A new feature branch was checked as if it published the index.'
        # The same new branch pushed beside main, whose own change leaves the index alone. Whether a
        # push rewrites the index is a fact about each ref: pooled, main's ref and the branch's whole
        # tree, which always holds patches-bundle.json, made one index push of the two.
        Set-Content -LiteralPath (Join-Path $listingRepo 'README.md') -Encoding ASCII -Value 'readme only'
        & git -C $listingRepo add -A
        & git -C $listingRepo commit --quiet -m 'readme only'
        $readmeTip = (& git -C $listingRepo rev-parse HEAD).Trim()
        Remove-Item -Path (Join-Path $listingRan '*') -Force -ErrorAction SilentlyContinue
        $global:LASTEXITCODE = 0
        & $prePushScript -Root $listingRepo -PushedRefs ("refs/heads/main $readmeTip refs/heads/main $featureTip`n" +
            "refs/heads/topic $readmeTip refs/heads/topic $('0' * 40)") 6> $null
        Assert-True ($LASTEXITCODE -eq 0) 'A push of main and a new branch together failed its gate.'
        $mixedFacts = Get-Content -LiteralPath (Join-Path $listingRan 'validate-release-facts.txt') -Raw
        Assert-True ($mixedFacts -like 'lag=True skip=True*') `
            "A push of main beside a new branch, neither rewriting main's index, was checked as an index push: $mixedFacts"

        # Nor may a file the push changes hold an unresolved merge conflict. A CHANGELOG reached main
        # with one in it and every gate passed it. ======= on its own is a Markdown heading's
        # underline, not a conflict, and passes.
        Assert-Throws { Push-ListingChange {
                Set-Content -LiteralPath (Join-Path $listingRepo 'CHANGELOG.md') -Encoding ASCII -Value @(
                    '## Unreleased', '', '<<<<<<< HEAD', '* **Tumblr:** one side.', '||||||| base', '=======',
                    '* **Tumblr:** the other side.', '>>>>>>> 0123abc (the other side)') } } `
            '*unresolved merge conflict*CHANGELOG.md:3:<<<<<<< HEAD*' 'A push carrying an unresolved merge conflict went out.'
        $ran = Push-ListingChange {
            Set-Content -LiteralPath (Join-Path $listingRepo 'CHANGELOG.md') -Encoding ASCII -Value @(
                '## Unreleased', '', '* **Tumblr:** one side.', '* **Tumblr:** the other side.')
            New-Item -ItemType Directory -Path (Join-Path $listingRepo 'docs') -Force | Out-Null
            Set-Content -LiteralPath (Join-Path $listingRepo 'docs/heading.md') -Encoding ASCII -Value @('A heading', '=======', '', 'Text.')
        }
        Assert-True ($ran -eq 'validate-release-facts') `
            "A push resolving the conflict, beside a heading underlined with =======, ran [$ran] instead of the release check."

        # Each end of a move counts where it is.
        $ran = Push-ListingChange {
            New-Item -ItemType Directory -Path (Join-Path $listingRepo 'attic') -Force | Out-Null
            & git -C $listingRepo mv patches-bundle.json attic/patches-bundle.json
        }
        Assert-True ($ran -eq 'validate-release-facts') "A push that moved patches-bundle.json away ran [$ran], not the release check."
        $ran = Push-ListingChange { & git -C $listingRepo mv extensions/tumblr/src/main/java/Moved.java attic/Moved.java }
        Assert-True ($ran -eq 'build') "A push that moved a source out of extensions/ ran [$ran], not the runtime tests."

        # A gate suite renamed away is one the gate still expects, by the name it had.
        foreach ($suite in @('scripts/test-script-contracts.ps1') + @($verifierRoutes.Keys)) {
            $renamed = "scripts/retired-$(Split-Path -Leaf $suite)"
            Assert-Throws { Push-ListingChange { & git -C $listingRepo mv $suite $renamed } } "*$suite was deleted in this push*" `
                "A push that renamed $suite went out without it."
            & git -C $listingRepo mv $renamed $suite
            & git -C $listingRepo commit --quiet -m 'the suite back'
        }

        # And a changed path with a name outside ASCII, where the push is a range.
        $ran = Push-ListingChange {
            Set-Content -LiteralPath (Join-Path $listingRepo "scripts/n$([char]0x00F6)tes.txt") -Encoding ASCII -Value 'notes'
        }
        Assert-True ($ran -eq 'test-script-contracts') "A push of a script with a name outside ASCII ran [$ran], not the contract tests."
        $ran = Push-ListingChange {
            Set-Content -LiteralPath (Join-Path $javaFolder "Caf$([char]0x00E9).java") -Encoding ASCII -Value 'final class Cafe {}'
        }
        Assert-True ($ran -eq 'build') "A push of a source with a name outside ASCII ran [$ran], not the runtime tests."
    } finally {
        foreach ($line in @(& git -C $listingRepo worktree list --porcelain)) {
            if ($line -like 'worktree *') {
                $listed = $line.Substring('worktree '.Length)
                if ([IO.Path]::GetFullPath($listed).TrimEnd('\', '/') -ine [IO.Path]::GetFullPath($listingRepo).TrimEnd('\', '/')) {
                    & git -C $listingRepo worktree remove --force $listed
                }
            }
        }
        Remove-Item -LiteralPath $listingRepo, $listingRan -Recurse -Force -ErrorAction SilentlyContinue
    }

    # A new remote branch can contain several unpublished commits. The code change here is in
    # the first commit and the tip changes only documentation. Looking at HEAD^..HEAD silently
    # misses the code and skips every build gate.
    $newBranchSource = Join-Path $hookRoot 'extensions/tumblr/src/main/java/FirstCommit.java'
    New-Item -ItemType Directory -Path (Split-Path -Parent $newBranchSource) -Force | Out-Null
    Set-Content -LiteralPath $newBranchSource -Encoding UTF8 -Value 'final class FirstCommit {}'
    & git -C $hookRoot add extensions/tumblr/src/main/java/FirstCommit.java patches-list.json `
        gradle/wrapper/gradle-wrapper.properties gradle/wrapper/gradle-wrapper.jar `
        scripts/patch-target.ps1 scripts/build-advisories.ps1 scripts/test-script-contracts.ps1 scripts/test-tumblr-sources.ps1
    & git -C $hookRoot commit --quiet -m 'code first'
    $firstCommit = (& git -C $hookRoot rev-parse HEAD).Trim()
    Set-Content -LiteralPath (Join-Path $hookRoot 'CONTRIBUTING.md') -Encoding UTF8 -Value 'tip only'
    & git -C $hookRoot add CONTRIBUTING.md
    & git -C $hookRoot commit --quiet -m 'docs tip'
    $newBranchHead = (& git -C $hookRoot rev-parse HEAD).Trim()
    # A stale local remote-tracking ref that already points at the code commit must not subtract
    # that commit from a new branch push. The destination advertises this branch as new.
    & git -C $hookRoot update-ref refs/remotes/origin/stale $firstCommit
    $newBranchRefs = "refs/heads/new $newBranchHead refs/heads/new $('0' * 40)"
    $savedNewBranchPath = $env:PATH
    $savedNewBranchActor = $env:GITHUB_ACTOR
    $savedNewBranchToken = $env:GITHUB_TOKEN
    try {
        $env:PATH = Split-Path -Parent (Get-Command git).Source
        $env:GITHUB_ACTOR = $null
        $env:GITHUB_TOKEN = $null
        Assert-Throws { & $prePushScript -Root $hookRoot -PushedRefs $newBranchRefs 6> $null } `
            '*GITHUB_ACTOR*' 'A new branch checked only its documentation tip and skipped earlier code.'
    } finally {
        $env:PATH = $savedNewBranchPath
        $env:GITHUB_ACTOR = $savedNewBranchActor
        $env:GITHUB_TOKEN = $savedNewBranchToken
    }


    # A release tag can name the exact tree already on a remote branch. It adds a pointer,
    # not a new index: treating it as a first branch push creates a publication deadlock.
    $tagRemote = Join-Path $hookRoot 'tag-remote.git'
    & git init --bare --quiet $tagRemote
    & git -C $hookRoot push --quiet $tagRemote "${newBranchHead}:refs/heads/main"
    & git -C $hookRoot tag -a release-same-tree -m 'release' $newBranchHead
    $tagObject = (& git -C $hookRoot rev-parse refs/tags/release-same-tree).Trim()
    $tagRefs = "refs/tags/release-same-tree $tagObject refs/tags/release-same-tree $('0' * 40)"
    # Git hooks put git-core first. Keeping only that directory breaks Windows Git's local
    # transport because its runtime DLLs live elsewhere. Hide gh, not Git's dependencies.
    $pathWithoutGh = (@($savedNewBranchPath -split [IO.Path]::PathSeparator | Where-Object {
        $directory = $_.Trim('"')
        $directory -and -not (@('gh', 'gh.exe', 'gh.cmd', 'gh.bat') | Where-Object {
            Test-Path -LiteralPath (Join-Path $directory $_) -PathType Leaf
        })
    }) -join [IO.Path]::PathSeparator)
    try {
        $env:PATH = $pathWithoutGh
        Assert-True (-not (Get-Command gh -ErrorAction SilentlyContinue)) 'The tag fixture still exposes gh.'
        $env:GITHUB_ACTOR = $null
        $env:GITHUB_TOKEN = $null
        & $prePushScript -Root $hookRoot -RemoteUrl $tagRemote -PushedRefs $tagRefs 6> $null
        Assert-True ($LASTEXITCODE -eq 0) 'An annotated tag of the advertised remote tree reran file-change gates.'
        $lightTagRefs = "refs/tags/light $newBranchHead refs/tags/light $('0' * 40)"
        & $prePushScript -Root $hookRoot -RemoteUrl $tagRemote -PushedRefs $lightTagRefs 6> $null
        Assert-True ($LASTEXITCODE -eq 0) 'A lightweight tag of the advertised remote tree reran file-change gates.'

        # A stale local tracking ref is not proof that the target is hosted. Only the live
        # remote advertisement above can qualify; unknown targets retain the full-tree gate.
        $unknownTagRefs = "refs/tags/unknown $firstCommit refs/tags/unknown $('0' * 40)"
        Assert-Throws { & $prePushScript -Root $hookRoot -RemoteUrl $tagRemote -PushedRefs $unknownTagRefs 6> $null } `
            '*GITHUB_ACTOR*' 'A tag not matching an advertised remote branch skipped code checks.'
        Assert-Throws { & $prePushScript -Root $hookRoot -RemoteUrl $tagRemote -PushedRefs "$tagRefs`n$newBranchRefs" 6> $null } `
            '*GITHUB_ACTOR*' 'A known tag suppressed checks for a new branch in the same push.'
        Assert-Throws { & $prePushScript -Root $hookRoot -RemoteUrl (Join-Path $hookRoot 'missing-remote.git') -PushedRefs $tagRefs 6> $null } `
            '*remote branches*' 'An unavailable remote was treated as proof that a tag target was already hosted.'
    } finally {
        $env:PATH = $savedNewBranchPath
        $env:GITHUB_ACTOR = $savedNewBranchActor
        $env:GITHUB_TOKEN = $savedNewBranchToken
    }

    # The scan every push gets. A doc naming the maintainer's notes folder or a phone's serial
    # routes to no gate at all, and a test under patches/ or extensions/ only to the Gradle
    # gates, which never read for them, so neither reached the contract tests' scan. The hook
    # reads the pushed commit, whatever the working tree holds, and .gitignore stays exempt.
    $notesFolder = '.' + 'cla' + 'ude'
    $phoneSerial = 'R5' + 'C' + 'ZZZZ9999'
    $phoneDoc = Join-Path $hookRoot 'docs/phone.md'
    New-Item -ItemType Directory -Path (Split-Path -Parent $phoneDoc) -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $hookRoot 'CONTRIBUTING.md') -Encoding UTF8 -Value "Fixtures live in ~/$notesFolder/fixtures."
    Set-Content -LiteralPath $phoneDoc -Encoding UTF8 -Value "adb -s $phoneSerial install app.apk"
    Set-Content -LiteralPath (Join-Path $hookRoot '.gitignore') -Encoding UTF8 -Value "$notesFolder/"
    & git -C $hookRoot add CONTRIBUTING.md docs/phone.md .gitignore
    & git -C $hookRoot commit --quiet -m 'names the machine'
    $namingCommit = (& git -C $hookRoot rev-parse HEAD).Trim()
    Assert-Throws { & $prePushScript -Root $hookRoot -PushedRefs "refs/heads/main $namingCommit refs/heads/main $newBranchHead" 6> $null } `
        "*$namingCommit*CONTRIBUTING.md*docs/phone.md*" 'A push of docs naming the machine and a phone went through.'
    Assert-Throws { & $prePushScript -Root $hookRoot -ChangedPaths @('docs/phone.md') 6> $null } `
        '*the working tree*CONTRIBUTING.md*docs/phone.md*' 'A run by hand passed a working tree whose docs name the machine.'
    # The control: the same files naming nothing, .gitignore still naming the folder, go through.
    Set-Content -LiteralPath (Join-Path $hookRoot 'CONTRIBUTING.md') -Encoding UTF8 -Value 'Fixtures live in HUSHTUMBLR_FIXTURE_DIR.'
    Set-Content -LiteralPath $phoneDoc -Encoding UTF8 -Value 'adb -s $env:HUSHTUMBLR_DEVICE_SERIAL install app.apk'
    & git -C $hookRoot add CONTRIBUTING.md docs/phone.md
    & git -C $hookRoot commit --quiet -m 'names nothing'
    $cleanCommit = (& git -C $hookRoot rev-parse HEAD).Trim()
    $global:LASTEXITCODE = 0
    & $prePushScript -Root $hookRoot -PushedRefs "refs/heads/main $cleanCommit refs/heads/main $namingCommit" 6> $null
    Assert-True ($LASTEXITCODE -eq 0) 'A push whose files name nothing, .gitignore aside, was stopped.'

    # Both cases above push HEAD of a tree that matches it, so a scan of the working tree passed
    # them too. Here the pushed commit and the working tree disagree, both ways round, and the
    # refusal is read for the <commit>:<path>: prefix git grep gives only a hit it read out of a
    # commit: the naming commit is refused while the tree holds the clean text, and the clean
    # commit goes through while the tree names the machine.
    Assert-Throws { & $prePushScript -Root $hookRoot -PushedRefs "refs/heads/main $namingCommit refs/heads/main $newBranchHead" 6> $null } `
        "*${namingCommit}:CONTRIBUTING.md:1:*${namingCommit}:docs/phone.md:1:*" `
        'A push of a commit naming the machine went through because the working tree does not.'
    Set-Content -LiteralPath (Join-Path $hookRoot 'CONTRIBUTING.md') -Encoding UTF8 -Value "Fixtures live in ~/$notesFolder/fixtures."
    Set-Content -LiteralPath $phoneDoc -Encoding UTF8 -Value "adb -s $phoneSerial install app.apk"
    try {
        $global:LASTEXITCODE = 0
        & $prePushScript -Root $hookRoot -PushedRefs "refs/heads/main $cleanCommit refs/heads/main $namingCommit" 6> $null
        Assert-True ($LASTEXITCODE -eq 0) "pre-push exited $LASTEXITCODE."
    } catch {
        throw "A push of a clean commit was stopped by what the working tree names: $($_.Exception.Message)"
    } finally {
        & git -C $hookRoot checkout --quiet -- CONTRIBUTING.md docs/phone.md
    }

    # Every commit the push publishes, not only each ref's tip: a serial one commit adds and the
    # next removes still goes out in the first, and the refusal names that commit by the prefix git
    # grep gives a hit read out of it. Pushed as an update of a branch, and as a new branch to a
    # remote whose main already holds the clean commit, as its tracking ref here says too.
    Set-Content -LiteralPath $phoneDoc -Encoding UTF8 -Value "adb -s $phoneSerial install app.apk"
    & git -C $hookRoot add docs/phone.md
    & git -C $hookRoot commit --quiet -m 'names the phone again'
    $servedSerial = (& git -C $hookRoot rev-parse HEAD).Trim()
    & git -C $hookRoot rm --quiet docs/phone.md
    Set-Content -LiteralPath (Join-Path $hookRoot 'CONTRIBUTING.md') -Encoding UTF8 -Value 'Fixtures live in HUSHTUMBLR_FIXTURE_DIR, not in docs.'
    & git -C $hookRoot add CONTRIBUTING.md
    & git -C $hookRoot commit --quiet -m 'drops the doc'
    $droppedSerial = (& git -C $hookRoot rev-parse HEAD).Trim()
    $scanRemote = Join-Path $hookRoot 'scan-remote.git'
    & git init --bare --quiet $scanRemote
    & git -C $hookRoot push --quiet $scanRemote "${cleanCommit}:refs/heads/main"
    & git -C $hookRoot update-ref refs/remotes/origin/main $cleanCommit
    # And more branches than one rev-list call takes, none of them ever fetched here, sorted so
    # main lands in the middle batch: what a new branch publishes has to hold for every batch.
    foreach ($side in @(@{ Prefix = 'a'; From = 1 }, @{ Prefix = 'zz'; From = 1000 })) {
        foreach ($n in 0..209) {
            [IO.File]::WriteAllText((Join-Path $scanRemote ("refs/heads/$($side.Prefix){0:d3}" -f $n)),
                ('{0:x40}' -f ($side.From + $n)) + "`n")
        }
    }
    # A new branch is checked from its whole tree, code included, so a scan that let it through
    # would reach the build gates. With no credentials and no gh they refuse by name instead.
    $savedScanPath = $env:PATH
    $savedScanActor = $env:GITHUB_ACTOR
    $savedScanToken = $env:GITHUB_TOKEN
    try {
        $env:PATH = $pathWithoutGh
        $env:GITHUB_ACTOR = $null
        $env:GITHUB_TOKEN = $null
        foreach ($refs in @("refs/heads/main $droppedSerial refs/heads/main $cleanCommit",
                "refs/heads/topic $droppedSerial refs/heads/topic $('0' * 40)")) {
            Assert-Throws { & $prePushScript -Root $hookRoot -RemoteUrl $scanRemote -PushedRefs $refs 6> $null } `
                "*commit $servedSerial name*${servedSerial}:docs/phone.md:1:*" `
                "A push went through with a phone serial in an earlier commit than its tip: $refs"
        }
    } finally {
        $env:PATH = $savedScanPath
        $env:GITHUB_ACTOR = $savedScanActor
        $env:GITHUB_TOKEN = $savedScanToken
    }

    # Commits that cancel each other out change no file, and each still goes out. The scan runs
    # before the changed paths decide there's nothing to check.
    New-Item -ItemType Directory -Path (Split-Path -Parent $phoneDoc) -Force | Out-Null
    Set-Content -LiteralPath $phoneDoc -Encoding UTF8 -Value "adb -s $phoneSerial install app.apk"
    & git -C $hookRoot add docs/phone.md
    & git -C $hookRoot commit --quiet -m 'names the phone once more'
    $namesAgain = (& git -C $hookRoot rev-parse HEAD).Trim()
    & git -C $hookRoot rm --quiet docs/phone.md
    & git -C $hookRoot commit --quiet -m 'takes it out again'
    $cancelledOut = (& git -C $hookRoot rev-parse HEAD).Trim()
    Assert-Throws { & $prePushScript -Root $hookRoot -PushedRefs "refs/heads/main $cancelledOut refs/heads/main $droppedSerial" 6> $null } `
        "*commit $namesAgain name*${namesAgain}:docs/phone.md:1:*" `
        'A push whose commits cancel each other out went through with them unscanned.'

    # A remote-tracking ref can outlive its branch on the remote, deleted there and never pruned
    # here, and a commit only it held is still published by a new branch that reaches it. What the
    # remote holds is read off the remote. The whole tree of a new branch reaches the build gates,
    # so they refuse by name again if the scan ever lets it through. The remote's main moves on by
    # its ref file, since only what the remote advertises is read and git won't push to a remote
    # whose other branches name commits it doesn't have.
    [IO.File]::WriteAllText((Join-Path $scanRemote 'refs/heads/main'), "$cancelledOut`n")
    New-Item -ItemType Directory -Path (Split-Path -Parent $phoneDoc) -Force | Out-Null
    Set-Content -LiteralPath $phoneDoc -Encoding UTF8 -Value "adb -s $phoneSerial install app.apk"
    & git -C $hookRoot add docs/phone.md
    & git -C $hookRoot commit --quiet -m 'names the phone on a branch deleted since'
    $staleNamed = (& git -C $hookRoot rev-parse HEAD).Trim()
    & git -C $hookRoot update-ref refs/remotes/origin/old $staleNamed
    & git -C $hookRoot rm --quiet docs/phone.md
    & git -C $hookRoot commit --quiet -m 'takes it out on a new branch'
    $staleDropped = (& git -C $hookRoot rev-parse HEAD).Trim()
    try {
        $env:PATH = $pathWithoutGh
        $env:GITHUB_ACTOR = $null
        $env:GITHUB_TOKEN = $null
        Assert-Throws { & $prePushScript -Root $hookRoot -RemoteUrl $scanRemote `
                -PushedRefs "refs/heads/topic2 $staleDropped refs/heads/topic2 $('0' * 40)" 6> $null } `
            "*commit $staleNamed name*${staleNamed}:docs/phone.md:1:*" `
            'A new branch went through with a commit only a stale remote-tracking ref held.'
    } finally {
        $env:PATH = $savedScanPath
        $env:GITHUB_ACTOR = $savedScanActor
        $env:GITHUB_TOKEN = $savedScanToken
    }

    # The scan hands git grep its commits a batch at a time. Batches of two over five commits
    # reach the third batch, a short one, where the only commit naming the phone sits.
    $batched = @(Find-MachineNames -Root $hookRoot -BatchSize 2 `
        -Commit @($cleanCommit, $droppedSerial, $newBranchHead, $cancelledOut, $servedSerial))
    Assert-True (($batched -join "`n") -like "*${servedSerial}:docs/phone.md:1:*") `
        "The scan missed a commit past its first batch: $($batched -join '; ')"

    # A hit in a binary file: git grep prints the file's bytes, and a carriage return among them
    # splits the printed line into pieces that don't open with a commit. The refusal puts the hit
    # down to the one commit that carries it, and none of the pieces.
    $binaryDoc = Join-Path $hookRoot 'docs/logo.bin'
    New-Item -ItemType Directory -Path (Split-Path -Parent $binaryDoc) -Force | Out-Null
    [IO.File]::WriteAllBytes($binaryDoc, [byte[]](@(0x89, 0x50, 0x4E, 0x47, 0x00, 0x0D) +
        [Text.Encoding]::ASCII.GetBytes("x$([char]13)adb -s $phoneSerial") + @(0x0D, 0x00, 0x0A)))
    & git -C $hookRoot add docs/logo.bin
    & git -C $hookRoot commit --quiet -m 'a picture that names the phone'
    $binaryNamed = (& git -C $hookRoot rev-parse HEAD).Trim()
    try {
        & $prePushScript -Root $hookRoot -PushedRefs "refs/heads/main $binaryNamed refs/heads/main $staleDropped" 6> $null
        $binaryRefusal = 'no refusal'
    } catch {
        $binaryRefusal = $_.Exception.Message
    }
    Assert-True ($binaryRefusal -like "Tracked files in commit $binaryNamed name the maintainer's machine or phone*" -and
        $binaryRefusal -like "*${binaryNamed}:docs/logo.bin:1:*") `
        "A hit in a binary file was not put down to its commit alone: $binaryRefusal"
    & git -C $hookRoot rm --quiet docs/logo.bin
    & git -C $hookRoot commit --quiet -m 'takes the picture out'
    $pictureGone = (& git -C $hookRoot rev-parse HEAD).Trim()

    # Text in UTF-16, which is what Windows PowerShell's > writes (little-endian, with a byte order
    # mark), or big-endian: git grep reads bytes, where every letter sits beside a NUL. The phone
    # and the notes folder are both found that way, in a pushed commit and in the working tree.
    # Mid-sentence each byte order's pattern also finds the other, the NULs of the letters around
    # lining up, so each file puts its name where only its own pattern can: first thing after the
    # little-endian byte order mark, or last thing in a big-endian file.
    $notesName = $notesFolder.Substring(1)
    $wideDocs = [ordered]@{
        'docs/notes-be.txt' = @([Text.Encoding]::BigEndianUnicode, "Fixtures live in ~/.$notesName")
        'docs/notes-le.txt' = @([Text.Encoding]::Unicode, "$notesName keeps the working notes.")
        'docs/phone-be.txt' = @([Text.Encoding]::BigEndianUnicode, "adb -s $phoneSerial")
        'docs/phone-le.txt' = @([Text.Encoding]::Unicode, "$phoneSerial is the test phone.")
    }
    New-Item -ItemType Directory -Path (Join-Path $hookRoot 'docs') -Force | Out-Null
    foreach ($doc in $wideDocs.Keys) {
        [IO.File]::WriteAllText((Join-Path $hookRoot $doc), $wideDocs[$doc][1], $wideDocs[$doc][0])
    }
    & git -C $hookRoot add -- @($wideDocs.Keys)
    & git -C $hookRoot commit --quiet -m 'wide text names the machine'
    $wideNamed = (& git -C $hookRoot rev-parse HEAD).Trim()
    Assert-Throws { & $prePushScript -Root $hookRoot -PushedRefs "refs/heads/main $wideNamed refs/heads/main $pictureGone" 6> $null } `
        ("*${wideNamed}:docs/notes-be.txt:1:*${wideNamed}:docs/notes-le.txt:1:*" +
            "${wideNamed}:docs/phone-be.txt:1:*${wideNamed}:docs/phone-le.txt:1:*") `
        'A push went through with UTF-16 text naming the machine and a phone.'
    try {
        & $prePushScript -Root $hookRoot -ChangedPaths @('docs/phone-le.txt') 6> $null
        $wideHandRun = 'no refusal'
    } catch {
        $wideHandRun = $_.Exception.Message
    }
    Assert-True ($wideHandRun -like '*the working tree*docs/notes-be.txt:1:*docs/notes-le.txt:1:*docs/phone-be.txt:1:*docs/phone-le.txt:1:*') `
        "A run by hand passed a working tree whose UTF-16 text names the machine: $wideHandRun"
    & git -C $hookRoot rm --quiet -- @($wideDocs.Keys)
    & git -C $hookRoot commit --quiet -m 'takes the wide text out'

    # The build branch, which runs the Gradle gates that hold the Bouncy Castle graphs to the
    # reviewed release. Starting a real build from a contract test would be absurd, so the case
    # reads the first thing that branch does instead: with no GitHub credentials and no gh on
    # the path, it refuses by name, and nothing else in the hook says that. A push that moved
    # only a pin used to take the release path and never reach this. Git stays on the path for
    # the scan every push makes; only gh goes.
    $savedPath = $env:PATH
    $savedActor = $env:GITHUB_ACTOR
    $savedToken = $env:GITHUB_TOKEN
    try {
        $env:PATH = $pathWithoutGh
        $env:GITHUB_ACTOR = $null
        $env:GITHUB_TOKEN = $null
        foreach ($pin in @('gradle/libs.versions.toml', 'gradle/verification-metadata.xml',
                'settings.gradle.kts', 'build.gradle.kts', 'patches/build.gradle.kts')) {
            Assert-Throws { & $prePushScript -Root $hookRoot -ChangedPaths @($pin) 6> $null } `
                '*GITHUB_ACTOR*' "A push that changed $pin did not reach the build gates."
        }
        # And the control: a file the build branch has no interest in must not reach it.
        & $prePushScript -Root $hookRoot -ChangedPaths @('CONTRIBUTING.md') 6> $null
        Assert-True ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) `
            'A file no gate reads was routed into the build gates.'
    } finally {
        $env:PATH = $savedPath
        $env:GITHUB_ACTOR = $savedActor
        $env:GITHUB_TOKEN = $savedToken
    }

    # The build wrapper. HUSHTUMBLR_BUILD_WRAPPER names the script that runs Gradle on this
    # machine, and the hook hands it the repository and the tasks. A stub stands in for it and
    # records what it was given, so no build starts.
    $savedWrapper = $env:HUSHTUMBLR_BUILD_WRAPPER
    $savedActor = $env:GITHUB_ACTOR
    $savedToken = $env:GITHUB_TOKEN
    try {
        $env:GITHUB_ACTOR = 'contract'
        $env:GITHUB_TOKEN = 'contract'
        $wrapperMarker = Join-Path $hookRoot 'wrapper-ran.txt'
        $wrapperStub = Join-Path $hookRoot 'build-wrapper.ps1'
        Set-Content -LiteralPath $wrapperStub -Encoding UTF8 -Value @(
            'param([string]$ProjectDir, [string[]]$Tasks)',
            "Set-Content -LiteralPath '$wrapperMarker' -Value (`"dir=`$ProjectDir tasks=`" + (`$Tasks -join ','))",
            'exit 0')
        $env:HUSHTUMBLR_BUILD_WRAPPER = $wrapperStub
        & $prePushScript -Root $hookRoot -ChangedPaths @('extensions/tumblr/src/main/java/Any.java') 6> $null
        Assert-True (Test-Path -LiteralPath $wrapperMarker) `
            'The hook did not run the build through the wrapper HUSHTUMBLR_BUILD_WRAPPER names.'
        $wrapped = Get-Content -LiteralPath $wrapperMarker -Raw
        Assert-True ($wrapped -like "dir=$hookRoot tasks=*:extensions:tumblr:test*:patches:test*") `
            "The build wrapper was not handed the repository and the test tasks: $wrapped"
        # The tests that open the vendor APKs come last, after the quick tests and the lint.
        Assert-True ($wrapped.Trim() -like "dir=$hookRoot tasks=*,:patches:test,*:extensions:tumblr:lint,:patches:fixtureTest") `
            "The build wrapper was not handed :patches:fixtureTest after the quick checks: $wrapped"

        # A release push (HUSHTUMBLR_RELEASE_GATE=1) also builds the bundle, last, and runs every
        # declared fixture through the pushed commit's verify-all-patches.ps1 with that bundle and
        # the record store, patching each in full (-NoReuse) and keeping the run that passes. The
        # flag is read once and taken out of the environment. An everyday push builds no bundle
        # and patches nothing.
        $releaseLog = Join-Path $hookRoot 'release-gate.log'
        $releaseFails = Join-Path $hookRoot 'release-gate-verify-fails.txt'
        $releaseStore = Join-Path $hookRoot 'release-gate-records'
        $releaseVerifier = Join-Path $hookRoot 'scripts/verify-all-patches.ps1'
        $releaseProperties = Join-Path $hookRoot 'gradle.properties'
        $releaseBundleHere = Get-ReleaseBundlePath -Root $hookRoot -Version '9.9.9'
        $passStub = Join-Path $hookRoot 'build-wrapper-passes.ps1'
        Set-Content -LiteralPath $passStub -Encoding UTF8 -Value @(
            'param([string]$ProjectDir, [string[]]$Tasks)',
            "Add-Content -LiteralPath '$releaseLog' -Value ('build ' + (`$Tasks -join ','))",
            'exit 0')
        Set-Content -LiteralPath $releaseVerifier -Encoding UTF8 -Value @(
            'param([string]$Apk, [string]$DesktopJar, [string]$WorkDir, [string]$Bundle, [string]$KeepIn, [switch]$NoReuse)',
            "Add-Content -LiteralPath '$releaseLog' -Value (`"verify apk=`$Apk bundle=`$Bundle keep=`$KeepIn full=`$NoReuse`")",
            "if (Test-Path -LiteralPath '$releaseFails') { exit 1 }",
            'exit 0')
        Set-Content -LiteralPath $releaseProperties -Encoding ASCII -Value 'version = 9.9.9'
        New-Item -ItemType Directory -Path (Split-Path -Parent $releaseBundleHere) -Force | Out-Null
        Set-Content -LiteralPath $releaseBundleHere -Encoding ASCII -Value 'bundle stand-in'
        $savedDesktopJar = $env:HUSHTUMBLR_DESKTOP_JAR
        $savedRecordStore = $env:HUSHTUMBLR_APPLY_RECORDS
        try {
            $env:HUSHTUMBLR_BUILD_WRAPPER = $passStub
            $env:HUSHTUMBLR_DESKTOP_JAR = $passStub
            $env:HUSHTUMBLR_APPLY_RECORDS = $releaseStore
            $declaredHere = @(foreach ($version in $routingTarget.PackageVersions) {
                    foreach ($code in @($routingTarget.PackageVersionCodes[$version])) { Join-Path $routingFixtures "tumblr-$version-$code.apk" }
                })
            Assert-True ($declaredHere.Count -gt 0) 'The routing fixture folder holds no declared build to patch.'

            Remove-Item -LiteralPath $releaseLog -Force -ErrorAction SilentlyContinue
            $env:HUSHTUMBLR_RELEASE_GATE = '1'
            & $prePushScript -Root $hookRoot -ChangedPaths @('extensions/tumblr/src/main/java/Any.java') 6> $null
            Assert-True (-not (Test-Path Env:\HUSHTUMBLR_RELEASE_GATE)) 'The hook left HUSHTUMBLR_RELEASE_GATE set for what it ran.'
            $logged = @(Get-Content -LiteralPath $releaseLog)
            $builds = @($logged | Where-Object { $_ -like 'build *' })
            $verifies = @($logged | Where-Object { $_ -like 'verify *' })
            Assert-True ($builds.Count -ge 1 -and $builds[-1] -like '*,:patches:fixtureTest,:patches:buildAndroid' -and
                @($builds | Select-Object -SkipLast 1 | Where-Object { $_ -like '*:patches:buildAndroid*' }).Count -eq 0) `
                "A release push did not build the bundle last, in its final pass: $($builds -join ' | ')"
            Assert-True ($logged.IndexOf($builds[-1]) -lt $logged.IndexOf($verifies[0])) `
                "A release push patched the fixtures before its build finished: $($logged -join ' | ')"
            $expectedVerifies = @($declaredHere | ForEach-Object { "verify apk=$_ bundle=$releaseBundleHere keep=$releaseStore full=True" })
            Assert-True ((@($verifies | Sort-Object) -join "`n") -ceq (@($expectedVerifies | Sort-Object) -join "`n")) `
                "A release push did not patch each declared fixture in full through verify-all-patches.ps1 with the bundle it built, keeping it in the record store: $($verifies -join ' | ')"

            Set-Content -LiteralPath $releaseFails -Value 'fail' -Encoding ASCII
            $env:HUSHTUMBLR_RELEASE_GATE = '1'
            Assert-Throws { & $prePushScript -Root $hookRoot -ChangedPaths @('extensions/tumblr/src/main/java/Any.java') 6> $null } `
                '*did not pass verify-all-patches.ps1 with the bundle built from*' 'A release push went out with a fixture that failed verify-all-patches.ps1.'
            Remove-Item -LiteralPath $releaseFails -Force

            Remove-Item -LiteralPath $releaseLog -Force -ErrorAction SilentlyContinue
            & $prePushScript -Root $hookRoot -ChangedPaths @('extensions/tumblr/src/main/java/Any.java') 6> $null
            $logged = @(Get-Content -LiteralPath $releaseLog)
            Assert-True (@($logged | Where-Object { $_ -like '*buildAndroid*' -or $_ -like 'verify *' }).Count -eq 0) `
                "An everyday push built the bundle or patched a fixture: $($logged -join ' | ')"
        } finally {
            Remove-Item -LiteralPath Env:\HUSHTUMBLR_RELEASE_GATE -ErrorAction SilentlyContinue
            $env:HUSHTUMBLR_DESKTOP_JAR = $savedDesktopJar
            $env:HUSHTUMBLR_APPLY_RECORDS = $savedRecordStore
            $env:HUSHTUMBLR_BUILD_WRAPPER = $wrapperStub
            Remove-Item -LiteralPath $releaseLog, $releaseFails, $passStub, $releaseVerifier, $releaseProperties -Force -ErrorAction SilentlyContinue
            Remove-Item -LiteralPath (Join-Path $hookRoot 'patches') -Recurse -Force -ErrorAction SilentlyContinue
        }

        # The cheap checks fail first: one build without the fixture suite (and a release push's
        # bundle), then the full one, which finds the quick pass's tasks up to date. A quick pass
        # that fails stops the push before the fixture suite starts. A stub logs each call and fails
        # the quick one while the fail marker exists.
        $passLog = Join-Path $hookRoot 'wrapper-passes.txt'
        $passFails = Join-Path $hookRoot 'wrapper-quick-fails.txt'
        $quickStub = Join-Path $hookRoot 'build-wrapper-quick.ps1'
        Set-Content -LiteralPath $quickStub -Encoding UTF8 -Value @(
            'param([string]$ProjectDir, [string[]]$Tasks)',
            "Add-Content -LiteralPath '$passLog' -Value (`$Tasks -join ',')",
            "if ((Test-Path -LiteralPath '$passFails') -and `$Tasks -notcontains ':patches:fixtureTest') { exit 1 }",
            'exit 0')
        $env:HUSHTUMBLR_BUILD_WRAPPER = $quickStub
        try {
            Remove-Item -LiteralPath $passLog, $passFails -Force -ErrorAction SilentlyContinue
            & $prePushScript -Root $hookRoot -ChangedPaths @('extensions/tumblr/src/main/java/Any.java') 6> $null
            $passes = @(Get-Content -LiteralPath $passLog)
            Assert-True ($passes.Count -eq 2) "The gate did not build twice, quick then full: $($passes -join ' | ')"
            Assert-True ($passes[0] -like '*:extensions:tumblr:test*:patches:test*:extensions:tumblr:lint*' -and
                $passes[0] -notlike '*fixtureTest*' -and $passes[0] -notlike '*buildAndroid*') `
                "The first build was not the quick one without the fixture suite: $($passes[0])"
            Assert-True ($passes[1] -like '*:patches:test*' -and $passes[1] -like '*,:patches:fixtureTest') `
                "The second build was not the full one ending with the fixture suite: $($passes[1])"

            Remove-Item -LiteralPath $passLog -Force
            Set-Content -LiteralPath $passFails -Value 'fail' -Encoding ASCII
            Assert-Throws { & $prePushScript -Root $hookRoot -ChangedPaths @('extensions/tumblr/src/main/java/Any.java') 6> $null } `
                '*quick pass failed, so the fixture suite never started*' 'A failed quick build was ignored.'
            Assert-True (@(Get-Content -LiteralPath $passLog).Count -eq 1) 'The full build ran after the quick one failed.'
        } finally {
            Remove-Item -LiteralPath $passLog, $passFails, $quickStub -Force -ErrorAction SilentlyContinue
            $env:HUSHTUMBLR_BUILD_WRAPPER = $wrapperStub
        }

        # The Gradle file that writes the release bundle. The contract tests hold it to the
        # directory common.ps1 reads the bundle from, and a push that moved only it ran the build
        # and never them; the bundle path then went unchecked until the next script push.
        Remove-Item -LiteralPath $contractsMarker, $wrapperMarker -Force -ErrorAction SilentlyContinue
        & $prePushScript -Root $hookRoot -ChangedPaths @('patches/build.gradle.kts') 6> $null
        Assert-True ((Test-Path -LiteralPath $contractsMarker) -and (Test-Path -LiteralPath $wrapperMarker)) `
            'A push that changed only patches/build.gradle.kts did not run both the script contract tests and the build.'

        $env:HUSHTUMBLR_BUILD_WRAPPER = Join-Path $hookRoot 'no-such-wrapper.ps1'
        Assert-Throws { & $prePushScript -Root $hookRoot -ChangedPaths @('patches/build.gradle.kts') 6> $null } `
            '*HUSHTUMBLR_BUILD_WRAPPER*' 'A build wrapper that is not there was ignored rather than reported.'

        # The gate builds what is pushed, not what happens to be in the working tree. A stub build
        # fails on any tree whose marker says broken, and records the tree it was handed.
        $gateRepo = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-gate-" + [guid]::NewGuid().ToString('N'))
        New-Item -ItemType Directory -Path (Join-Path $gateRepo 'extensions') -Force | Out-Null
        & git -C $gateRepo init --quiet
        $actualGateGitDir = (& git -C $gateRepo rev-parse --absolute-git-dir).Trim()
        Assert-True ([IO.Path]::GetFullPath($actualGateGitDir).TrimEnd('\', '/') -ieq
            [IO.Path]::GetFullPath((Join-Path $gateRepo '.git')).TrimEnd('\', '/')) `
            'The gate fixture resolved outside its temporary repository; refusing to write.'
        & git -C $gateRepo config user.name 'Gate Contract'
        & git -C $gateRepo config user.email 'gate@example.invalid'
        Initialize-HookFixtureCatalog $gateRepo
        foreach ($suite in @('scripts/test-script-contracts.ps1', 'scripts/test-tumblr-sources.ps1',
                'scripts/test-injected-registers.ps1', 'scripts/test-resource-table-check.ps1')) {
            Set-Content -LiteralPath (Join-Path $gateRepo $suite) -Encoding UTF8 -Value @(
                'param([string]$Root)', 'exit 0')
        }
        & git -C $gateRepo add patches-list.json scripts/patch-target.ps1 `
            gradle/wrapper/gradle-wrapper.properties gradle/wrapper/gradle-wrapper.jar `
            scripts/build-advisories.ps1 scripts/test-script-contracts.ps1 scripts/test-tumblr-sources.ps1 `
            scripts/test-injected-registers.ps1 scripts/test-resource-table-check.ps1
        $gateMarker = Join-Path $hookRoot 'gate-ran.txt'
        $gateStub = Join-Path $hookRoot 'gate-wrapper.ps1'
        Set-Content -LiteralPath $gateStub -Encoding UTF8 -Value @(
            'param([string]$ProjectDir, [string[]]$Tasks)',
            '$state = (Get-Content -LiteralPath (Join-Path $ProjectDir ''extensions/marker.txt'') -Raw).Trim()',
            "Set-Content -LiteralPath '$gateMarker' -Value (`"dir=`$ProjectDir marker=`$state gitdir=`$env:GIT_DIR`")",
            'if ($state -eq ''broken'') { exit 1 }',
            'exit 0')
        $env:HUSHTUMBLR_BUILD_WRAPPER = $gateStub
        $gateFile = Join-Path $gateRepo 'extensions/marker.txt'
        function Save-GateCommit([string]$State) {
            Set-Content -LiteralPath $gateFile -Value $State -Encoding ASCII
            & git -C $gateRepo add extensions/marker.txt
            & git -C $gateRepo commit --quiet -m $State
            return (& git -C $gateRepo rev-parse HEAD).Trim()
        }
        try {
            $good = Save-GateCommit 'good'
            Set-Content -LiteralPath $gateFile -Value 'broken' -Encoding ASCII
            & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $good refs/heads/main $('0' * 40)" 6> $null
            Assert-True ($LASTEXITCODE -eq 0) 'An uncommitted edit in the working tree failed a clean commit.'
            $built = Get-Content -LiteralPath $gateMarker -Raw
            Assert-True ($built -like '*marker=good*' -and $built -notlike "*dir=$gateRepo marker*") `
                "The gate built the working tree instead of the pushed commit: $built"

            $broken = Save-GateCommit 'broken'
            Set-Content -LiteralPath $gateFile -Value 'good' -Encoding ASCII
            Assert-Throws { & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $broken refs/heads/main $good" 6> $null } `
                '*did not pass*' 'An uncommitted fix in the working tree passed a broken commit.'
            Assert-True ((& git -C $gateRepo status --porcelain) -like '*extensions/marker.txt*') `
                'Building the pushed commit touched the working tree it was kept apart from.'

            # A clean tree still builds in place.
            $fixed = Save-GateCommit 'good'
            & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $fixed refs/heads/main $broken" 6> $null
            Assert-True ($LASTEXITCODE -eq 0) 'A clean tree with a good commit did not pass.'
            Assert-True ((Get-Content -LiteralPath $gateMarker -Raw) -like "*dir=$gateRepo marker=good*") `
                'A clean tree was not built in place.'

            # A tree that changes while it is built in place: an edit landing mid-build was tested
            # along with the commit, so that build says nothing about the commit alone.
            $meddler = Join-Path $hookRoot 'gate-wrapper-meddles.ps1'
            $meddled = Join-Path $gateRepo 'README.md'
            Set-Content -LiteralPath $meddler -Encoding UTF8 -Value @(
                'param([string]$ProjectDir, [string[]]$Tasks)',
                'Set-Content -LiteralPath (Join-Path $ProjectDir ''README.md'') -Value ''edited mid-build'' -Encoding ASCII',
                'exit 0')
            $env:HUSHTUMBLR_BUILD_WRAPPER = $meddler
            try {
                Assert-Throws { & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $fixed refs/heads/main $broken" 6> $null } `
                    '*changed while the runtime test build ran in place*' `
                    'A working tree that changed during an in-place build passed on that build.'
            } finally {
                $env:HUSHTUMBLR_BUILD_WRAPPER = $gateStub
                Remove-Item -LiteralPath $meddled -Force -ErrorAction SilentlyContinue
            }
            & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $fixed refs/heads/main $broken" 6> $null
            Assert-True ($LASTEXITCODE -eq 0) 'A clean tree failed once the mid-build edit was gone.'

            # But only for HEAD. A clean tree whose HEAD is good says nothing about an older commit
            # pushed by name, or another branch, and those used to have HEAD built in their place.
            Assert-Throws { & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/other $broken refs/heads/other $good" 6> $null } `
                '*did not pass*' 'A clean tree passed a broken commit that was pushed but is not HEAD.'

            # Uncommitted files anywhere count, not only under the source folders: the tests read
            # README.md and patches-list.json from the root.
            $rootFile = Join-Path $gateRepo 'README.md'
            Set-Content -LiteralPath $rootFile -Value 'uncommitted' -Encoding ASCII
            & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $fixed refs/heads/main $broken" 6> $null
            $built = Get-Content -LiteralPath $gateMarker -Raw
            Assert-True ($LASTEXITCODE -eq 0 -and $built -like '*marker=good*' -and $built -notlike "*dir=$gateRepo marker*") `
                "An uncommitted root file was built in place with the push: $built"
            Remove-Item -LiteralPath $rootFile -Force

            # Git hands a hook GIT_DIR and GIT_WORK_TREE. Neither may steer the worktree commands
            # into this working tree, nor reach the build.
            Set-Content -LiteralPath $gateFile -Value 'broken' -Encoding ASCII
            $headBefore = (& git -C $gateRepo symbolic-ref HEAD).Trim()
            try {
                $env:GIT_DIR = Join-Path $gateRepo '.git'
                $env:GIT_WORK_TREE = $gateRepo
                & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $fixed refs/heads/main $broken" 6> $null
            } finally {
                Remove-Item -LiteralPath Env:\GIT_DIR, Env:\GIT_WORK_TREE -ErrorAction SilentlyContinue
            }
            $built = Get-Content -LiteralPath $gateMarker -Raw
            Assert-True ($LASTEXITCODE -eq 0 -and $built.Trim() -like '*marker=good gitdir=') `
                "The build ran with git's hook variables set: $built"
            Assert-True ((Get-Content -LiteralPath $gateFile -Raw).Trim() -eq 'broken' -and
                (& git -C $gateRepo symbolic-ref HEAD).Trim() -eq $headBefore) `
                "With GIT_DIR set, building the pushed commit rewrote the working tree it was kept apart from."

            # One push at a time through the gate worktree. With the lock held here, a hook in
            # another process has to give up rather than check its commit out under a running build.
            $gateHasher = [System.Security.Cryptography.SHA256]::Create()
            try {
                $gateDigest = $gateHasher.ComputeHash([Text.Encoding]::UTF8.GetBytes(
                    [IO.Path]::GetFullPath($gateRepo).ToLowerInvariant()))
            } finally {
                $gateHasher.Dispose()
            }
            $gateKey = -join ($gateDigest[0..5] | ForEach-Object { $_.ToString('x2') })
            $shell = (Get-Process -Id $PID).Path
            $childRefs = "refs/heads/main $fixed refs/heads/main $broken"
            function Invoke-ChildPush {
                # Windows PowerShell stops on a native command's first line of standard error.
                $preference = $ErrorActionPreference
                $ErrorActionPreference = 'Continue'
                try {
                    return (& $shell -NoProfile -File $prePushScript -Root $gateRepo -PushedRefs $childRefs `
                        -GateLockTimeoutSeconds 1 2>&1 | Out-String)
                } finally {
                    $ErrorActionPreference = $preference
                }
            }
            $held = New-Object System.Threading.Mutex($false, "Local\hushtumblr-pre-push-$gateKey")
            Assert-True ($held.WaitOne(0)) 'The contract could not take the gate lock itself.'
            try {
                $waited = Invoke-ChildPush
                Assert-True ($LASTEXITCODE -ne 0 -and $waited -like '*held the gate worktree*') `
                    "A second push used the gate worktree while another push held it: $waited"
            } finally {
                $held.ReleaseMutex()
                $held.Dispose()
            }
            # The control: the same child push, with the lock free, goes through.
            $free = Invoke-ChildPush
            Assert-True ($LASTEXITCODE -eq 0) "The child push failed with the gate lock free: $free"

            # The release facts half checks the files a push carries as well. A stub check, committed
            # the way the real one is, fails on a README that says broken and records where it ran
            # and whether it read test results. Its own commit is never in a pushed range, so no
            # push below touches scripts/. A README push asks for the contract tests too, since they
            # hold the README to the catalog, so a stub suite that passes is committed with it.
            $gateFacts = Join-Path $hookRoot 'gate-facts-ran.txt'
            & git -C $gateRepo checkout --quiet -- extensions/marker.txt
            New-Item -ItemType Directory -Path (Join-Path $gateRepo 'scripts') -Force | Out-Null
            Set-Content -LiteralPath (Join-Path $gateRepo 'scripts/test-script-contracts.ps1') -Encoding UTF8 -Value @(
                'param([string]$Root)', 'exit 0')
            & git -C $gateRepo add scripts/test-script-contracts.ps1
            Set-Content -LiteralPath (Join-Path $gateRepo 'scripts/validate-release-facts.ps1') -Encoding UTF8 -Value @(
                'param([string]$Root, [switch]$SkipDescriptionTestCount, [switch]$AllowPublishedIndexLag,',
                '    [switch]$VerifyPublishedAsset, [string]$ArtifactPath, [switch]$SkipTestResults)',
                '$state = (Get-Content -LiteralPath (Join-Path $Root ''README.md'') -Raw).Trim()',
                "Set-Content -LiteralPath '$gateFacts' -Value (`"root=`$Root readme=`$state results=`$(-not `$SkipTestResults)`")",
                'if ($state -eq ''broken'') { exit 1 }',
                'exit 0')
            $gateReadme = Join-Path $gateRepo 'README.md'
            function Save-GateReadme([string]$State) {
                Set-Content -LiteralPath $gateReadme -Value $State -Encoding ASCII
                & git -C $gateRepo add README.md
                & git -C $gateRepo commit --quiet -m "readme $State"
                return (& git -C $gateRepo rev-parse HEAD).Trim()
            }
            & git -C $gateRepo add scripts/validate-release-facts.ps1
            $factsBase = Save-GateReadme 'base'
            # Released, so a README push has release facts to check. With no tag and no index
            # the hook would call it unreleased and check nothing, which the routing cases cover.
            & git -C $gateRepo tag v0.0.1 $factsBase
            $factsGood = Save-GateReadme 'good'

            # An uncommitted README that would fail the check doesn't fail a push without it.
            Set-Content -LiteralPath $gateReadme -Value 'broken' -Encoding ASCII
            & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $factsGood refs/heads/main $factsBase" 6> $null
            $checked = Get-Content -LiteralPath $gateFacts -Raw
            Assert-True ($LASTEXITCODE -eq 0 -and $checked -like '*readme=good results=False*' -and
                $checked -notlike "*root=$gateRepo *") `
                "The release facts were read from the working tree instead of the pushed commit: $checked"

            # And an uncommitted fix doesn't pass a push whose own README fails.
            $factsBroken = Save-GateReadme 'broken'
            Set-Content -LiteralPath $gateReadme -Value 'good' -Encoding ASCII
            Assert-Throws { & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $factsBroken refs/heads/main $factsGood" 6> $null } `
                '*release facts do not agree*' 'An uncommitted README fix passed a push whose README fails the release facts.'

            # An index push is checked against the bundle and results this checkout built, so from a
            # dirty tree it is refused by name rather than checked against the wrong files.
            Set-Content -LiteralPath (Join-Path $gateRepo 'patches-bundle.json') -Value '{}' -Encoding ASCII
            & git -C $gateRepo add patches-bundle.json
            & git -C $gateRepo commit --quiet -m 'index'
            $factsIndex = (& git -C $gateRepo rev-parse HEAD).Trim()
            Assert-Throws { & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $factsIndex refs/heads/main $factsBroken" 6> $null } `
                '*clean checkout of the commit it pushes*' 'An index push from a dirty tree was checked against files it does not carry.'

            # The control: a clean tree pushing HEAD is checked in place, results and all.
            & git -C $gateRepo checkout --quiet -- README.md
            $factsFixed = Save-GateReadme 'good'
            & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $factsFixed refs/heads/main $factsIndex" 6> $null
            $checked = Get-Content -LiteralPath $gateFacts -Raw
            Assert-True ($LASTEXITCODE -eq 0 -and $checked -like "*root=$gateRepo readme=good results=True*") `
                "A clean tree pushing HEAD was not checked in place: $checked"

            # The script suites are the pushed commit's too, run against that commit: they copy the
            # root files into their fixtures, and ran from the working tree until 2026-09-21. A stub
            # suite records where it ran and the state it was committed with.
            $gateContracts = Join-Path $hookRoot 'gate-contracts-ran.txt'
            $contractsStub = Join-Path $gateRepo 'scripts/test-script-contracts.ps1'
            function Save-GateContracts([string]$State) {
                Set-Content -LiteralPath $contractsStub -Encoding UTF8 -Value @(
                    'param([string]$Root)',
                    "Set-Content -LiteralPath '$gateContracts' -Value (`"root=`$Root state=$State`")",
                    $(if ($State -eq 'broken') { 'exit 1' } else { 'exit 0' }))
                & git -C $gateRepo add scripts/test-script-contracts.ps1
                & git -C $gateRepo commit --quiet -m "contracts $State"
                return (& git -C $gateRepo rev-parse HEAD).Trim()
            }
            $contractsGood = Save-GateContracts 'good'
            Set-Content -LiteralPath $contractsStub -Encoding UTF8 -Value @('param([string]$Root)', 'exit 1')
            & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $contractsGood refs/heads/main $factsFixed" 6> $null
            $ran = Get-Content -LiteralPath $gateContracts -Raw
            Assert-True ($LASTEXITCODE -eq 0 -and $ran -like '*state=good*' -and $ran -notlike "*root=$gateRepo *") `
                "The script contract tests ran from the working tree instead of the pushed commit: $ran"
            & git -C $gateRepo checkout --quiet -- scripts/test-script-contracts.ps1
            & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $contractsGood refs/heads/main $factsFixed" 6> $null
            $ran = Get-Content -LiteralPath $gateContracts -Raw
            Assert-True ($LASTEXITCODE -eq 0 -and $ran -like "*root=$gateRepo state=good*") `
                "A clean tree pushing HEAD did not run its script contract tests in place: $ran"
            $contractsBroken = Save-GateContracts 'broken'
            Assert-Throws { & $prePushScript -Root $gateRepo -PushedRefs "refs/heads/main $contractsBroken refs/heads/main $contractsGood" 6> $null } `
                '*script contract tests did not pass*' 'A push whose own script contract tests fail was let through.'

            # A pushed commit's suite and facts check run in a process of their own. Run in the
            # hook's, they saw every function the hook and the working tree's common.ps1 define, so
            # a suite calling a helper that exists only uncommitted passed the hook and failed for
            # anyone who checked the commit out. A copy of the hook sits in this working tree beside
            # a common.ps1 that defines such a helper, uncommitted; the commit's own common.ps1
            # doesn't, until the control commits it. The suite and the check each call it.
            $helperMarker = Join-Path $hookRoot 'gate-helper-ran.txt'
            $gateCommon = Join-Path $gateRepo 'scripts/common.ps1'
            $gateHook = Join-Path $gateRepo 'scripts/pre-push.ps1'
            $helperCalls = @('$ErrorActionPreference = ''Stop''', '. (Join-Path $PSScriptRoot ''common.ps1'')',
                "Set-Content -LiteralPath '$helperMarker' -Value (Get-UncommittedHelper)")
            function Save-GateHelperCommit([string]$Message, [string[]]$Common, [string[]]$Suite, [string[]]$Facts) {
                Set-Content -LiteralPath $gateCommon -Encoding UTF8 -Value $Common
                if ($Suite) { Set-Content -LiteralPath $contractsStub -Encoding UTF8 -Value $Suite }
                if ($Facts) { Set-Content -LiteralPath (Join-Path $gateRepo 'scripts/validate-release-facts.ps1') -Encoding UTF8 -Value $Facts }
                # By name: the hook's copy sits in scripts/ too, and it isn't part of any commit.
                & git -C $gateRepo add scripts/common.ps1 scripts/test-script-contracts.ps1 scripts/validate-release-facts.ps1
                & git -C $gateRepo commit --quiet -m $Message
                return (& git -C $gateRepo rev-parse HEAD).Trim()
            }
            $withoutHelper = @('function Get-CommittedHelper { ''committed'' }')
            $suiteCallingHelper = @('param([string]$Root)') + $helperCalls + @('exit 0')
            $factsCallingHelper = @('param([string]$Root, [switch]$SkipDescriptionTestCount, [switch]$AllowPublishedIndexLag,',
                '    [switch]$VerifyPublishedAsset, [string]$ArtifactPath, [switch]$SkipTestResults)') + $helperCalls + @('exit 0')
            $helperBase = (& git -C $gateRepo rev-parse HEAD).Trim()
            $suiteNeedsHelper = Save-GateHelperCommit 'suite calls a helper' -Common $withoutHelper -Suite $suiteCallingHelper
            # The working tree's common.ps1: the hook's own helpers, and the one nobody committed.
            Set-Content -LiteralPath $gateCommon -Encoding UTF8 -Value (@(Get-Content -LiteralPath (Join-Path $PSScriptRoot 'common.ps1')) +
                @('function Get-UncommittedHelper { ''uncommitted'' }'))
            Copy-Item -LiteralPath $prePushScript -Destination $gateHook
            try {
                Remove-Item -LiteralPath $helperMarker -Force -ErrorAction SilentlyContinue
                Assert-Throws { & $gateHook -Root $gateRepo -PushedRefs "refs/heads/main $suiteNeedsHelper refs/heads/main $helperBase" 6> $null } `
                    '*script contract tests did not pass*' `
                    'A pushed suite calling a helper only the working tree defines passed the hook.'
                Assert-True (-not (Test-Path -LiteralPath $helperMarker)) 'The pushed suite reached a helper its commit does not define.'
                # The facts check the same way, on a README push, with a suite that calls nothing.
                $factsNeedsHelper = Save-GateHelperCommit 'facts check calls a helper' -Common $withoutHelper `
                    -Suite @('param([string]$Root)', 'exit 0') -Facts $factsCallingHelper
                Set-Content -LiteralPath $gateCommon -Encoding UTF8 -Value (@(Get-Content -LiteralPath (Join-Path $PSScriptRoot 'common.ps1')) +
                    @('function Get-UncommittedHelper { ''uncommitted'' }'))
                $factsReadme = Save-GateReadme 'helper'
                Assert-Throws { & $gateHook -Root $gateRepo -PushedRefs "refs/heads/main $factsReadme refs/heads/main $factsNeedsHelper" 6> $null } `
                    '*release facts do not agree*' 'A pushed facts check calling a helper only the working tree defines passed the hook.'
                # The control: the helper committed, and the same pushes go through from the same
                # dirty tree, each script finding it in its own commit's common.ps1.
                $helperCommitted = Save-GateHelperCommit 'helper committed' -Common @($withoutHelper + @('function Get-UncommittedHelper { ''committed now'' }')) `
                    -Suite $suiteCallingHelper -Facts $factsCallingHelper
                Set-Content -LiteralPath $gateCommon -Encoding UTF8 -Value (@(Get-Content -LiteralPath (Join-Path $PSScriptRoot 'common.ps1')) +
                    @('function Get-UncommittedHelper { ''uncommitted'' }'))
                $controlReadme = Save-GateReadme 'control'
                Remove-Item -LiteralPath $helperMarker -Force -ErrorAction SilentlyContinue
                $global:LASTEXITCODE = 0
                & $gateHook -Root $gateRepo -PushedRefs "refs/heads/main $controlReadme refs/heads/main $helperBase" 6> $null
                Assert-True ($LASTEXITCODE -eq 0 -and (Get-Content -LiteralPath $helperMarker -Raw).Trim() -eq 'committed now') `
                    "A pushed commit whose own common.ps1 defines the helper did not pass from a dirty tree: $LASTEXITCODE"
            } finally {
                Remove-Item -LiteralPath $gateHook -Force -ErrorAction SilentlyContinue
                & git -C $gateRepo checkout --quiet -- scripts
            }
        } finally {
            foreach ($line in @(& git -C $gateRepo worktree list --porcelain)) {
                if ($line -like 'worktree *') {
                    $listed = $line.Substring('worktree '.Length)
                    if ([IO.Path]::GetFullPath($listed).TrimEnd('\', '/') -ine [IO.Path]::GetFullPath($gateRepo).TrimEnd('\', '/')) {
                        & git -C $gateRepo worktree remove --force $listed
                    }
                }
            }
            Remove-Item -LiteralPath $gateRepo -Recurse -Force -ErrorAction SilentlyContinue
        }
    } finally {
        $env:HUSHTUMBLR_BUILD_WRAPPER = $savedWrapper
        $env:GITHUB_ACTOR = $savedActor
        $env:GITHUB_TOKEN = $savedToken
    }
} finally {
    # Pushed-commit cases give the hook a gate worktree of $hookRoot, made in the temp directory
    # beside it. Removing the fixture alone left that worktree behind on every run. This runs
    # before Git's hook variables come back, so they can't point these commands elsewhere.
    if (Test-Path -LiteralPath (Join-Path $hookRoot '.git') -PathType Container) {
        foreach ($line in @(& git -C $hookRoot worktree list --porcelain)) {
            if ($line -notlike 'worktree *') { continue }
            $listed = [IO.Path]::GetFullPath($line.Substring('worktree '.Length)).TrimEnd('\', '/')
            if ($listed -ieq [IO.Path]::GetFullPath($hookRoot).TrimEnd('\', '/')) { continue }
            if ([IO.Path]::GetFileName($listed) -notmatch '^hushtumblr-pre-push-[a-f0-9]{12}$') {
                throw "Refusing to remove unexpected fixture worktree $listed."
            }
            & git -C $hookRoot worktree remove --force $listed
        }
    }
    $env:HUSHTUMBLR_SKIP_PRE_PUSH = $savedSkip
    $env:HUSHTUMBLR_BUILD_WRAPPER = $savedRoutingWrapper
    $env:HUSHTUMBLR_FIXTURE_DIR = $savedRoutingFixtures
    $env:GITHUB_ACTOR = $savedRoutingActor
    $env:GITHUB_TOKEN = $savedRoutingToken
    foreach ($name in $savedHookGit.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $savedHookGit[$name] }
    Remove-Item -LiteralPath $hookRoot -Recurse -Force -ErrorAction SilentlyContinue
    if ($routingFixtures) { Remove-Item -LiteralPath $routingFixtures -Recurse -Force -ErrorAction SilentlyContinue }
}

Write-Host '[scripts] pre-push routing contracts passed'
& (Join-Path $PSScriptRoot 'test-fixture-gate.ps1') -Root $Root
if ($LASTEXITCODE -ne 0) { throw 'The pre-push fixture contracts did not pass.' }
& (Join-Path $PSScriptRoot 'test-build-advisories.ps1') -Root $Root
if ($LASTEXITCODE -ne 0) { throw 'The resolved build advisory contracts did not pass.' }

# --- Test-ChangelogVersions ------------------------------------------------------------------
#
# A released version's heading is the only record a reader has that it shipped. On 2026-09-14 a
# post-release commit renamed "## 0.31.0" to "## Unreleased" and the file then said that release
# never happened; nothing read this file at all. Both directions are exercised here, and the
# real CHANGELOG is the control.

$headingShapes = @"
## 0.32.0
some text
## 0.31.0 (2026-09-14)
more text
## [0.1.5](https://example.invalid/compare/v0.1.4...v0.1.5) (2026-06-01)
older text
"@
$shapes = @(Get-ChangelogVersions -Text $headingShapes)
Assert-True (($shapes -join ',') -eq '0.32.0,0.31.0,0.1.5') `
    "The heading shapes this file uses were not all read: $($shapes -join ',')"
Assert-True (@(Get-ChangelogVersions -Text "## Unreleased`n## Notes").Count -eq 0) `
    'A heading that names no version was read as one.'

$previousChangelog = "## 0.31.0`nshipped`n## 0.30.2`nshipped"
$goodChangelog = "## 0.32.0`nnew`n" + $previousChangelog
$good = Test-ChangelogVersions -Current $goodChangelog -ExpectedVersion '0.32.0' `
    -Previous $previousChangelog -PreviousLabel 'tag v0.31.0'
Assert-True $good.Valid "A CHANGELOG that kept every shipped version was refused: $($good.Reason)"

# The 2026-09-14 defect, exactly: the previous version's heading renamed to Unreleased.
$renamed = Test-ChangelogVersions -Current ("## 0.32.0`nnew`n## Unreleased`nshipped`n## 0.30.2`nshipped") `
    -ExpectedVersion '0.32.0' -Previous $previousChangelog -PreviousLabel 'tag v0.31.0'
Assert-True (-not $renamed.Valid) 'A released version renamed to Unreleased was accepted.'
Assert-True ($renamed.Reason -like '*0.31.0*tag v0.31.0*') `
    "The renamed heading was refused for the wrong reason: $($renamed.Reason)"

$dropped = Test-ChangelogVersions -Current "## 0.32.0`nnew`n## 0.31.0`nshipped" `
    -ExpectedVersion '0.32.0' -Previous $previousChangelog
Assert-True (-not $dropped.Valid) 'A shipped version deleted from the CHANGELOG was accepted.'

$noHeading = Test-ChangelogVersions -Current $previousChangelog -ExpectedVersion '0.32.0' `
    -Previous $previousChangelog
Assert-True (-not $noHeading.Valid) 'A CHANGELOG with no heading for the built version was accepted.'
Assert-True ($noHeading.Reason -like '*no heading for 0.32.0*') `
    "The missing heading was refused for the wrong reason: $($noHeading.Reason)"

Assert-True (-not (Test-ChangelogVersions -Current "# Changelog`nnothing here" -ExpectedVersion '0.32.0').Valid) `
    'A CHANGELOG naming no version at all was accepted.'

# With no earlier file to compare against, the version being built is still required and a
# CHANGELOG that has it is still accepted. A first release has no tag behind it.
Assert-True (Test-ChangelogVersions -Current $goodChangelog -ExpectedVersion '0.32.0').Valid `
    'A checkout with no earlier tag was refused.'

# The control. The real file, held to the real version, must pass: every case above is this
# same shape with one heading moved. Before the first release it carries the dated heading that
# release adds (Get-ReleaseFileText, above the release facts).
$realVersion = Get-BundleVersion -Root $Root
$realChangelog = Get-ReleaseFileText 'CHANGELOG.md'
# Asked only when a tag is reachable: before the first release git describe writes "No names
# found" to stderr, and Windows PowerShell, which the hook falls back to when Git's PATH has no
# pwsh, turns that into a terminating error under Stop even with 2>$null.
$realTag = if (@(& git -C $Root tag --merged HEAD).Count -gt 0) {
    "$(& git -C $Root describe --tags --abbrev=0 HEAD | Select-Object -First 1)".Trim()
} else { '' }
$realPrevious = if ($realTag) { (& git -C $Root show "${realTag}:CHANGELOG.md" 2>$null) -join "`n" } else { '' }
$realCheck = if ([string]::IsNullOrWhiteSpace($realPrevious)) {
    Test-ChangelogVersions -Current $realChangelog -ExpectedVersion $realVersion
} else {
    Test-ChangelogVersions -Current $realChangelog -ExpectedVersion $realVersion -Previous $realPrevious
}
Assert-True $realCheck.Valid "This repository's own CHANGELOG was refused: $($realCheck.Reason)"

Write-Host '[scripts] changelog history contracts passed'

# --- Test-ChangelogManagerEntry --------------------------------------------------------------
#
# Morphe Manager skips a heading with no date and flags an app only for bullets scoped to it.
# Every heading from 0.23.0 to 0.40.0 was bare and Manager's list stopped at 0.22.0, while the
# history check above passed them all. Each refusal below is the readable entry with one thing
# taken away, and the real CHANGELOG is the control.

$readable = @"
## Unreleased

* not held to anything yet

## 0.42.0 (2026-09-20)

A sentence about the release.

### Settings

* **Tumblr:** one change.
* **Tumblr:** another change.

### On the video

* **Tumblr:** a third.

## 0.41.0

* an older entry, frozen as it shipped
"@
$entry = Test-ChangelogManagerEntry -Current $readable -ExpectedVersion '0.42.0'
Assert-True $entry.Valid "A dated entry with scoped bullets was refused: $($entry.Reason)"
Assert-True ($entry.Date -eq '2026-09-20' -and $entry.Bullets -eq 3) `
    "The readable entry was misread: date $($entry.Date), $($entry.Bullets) bullets"
$crlf = Test-ChangelogManagerEntry -Current ($readable -replace "`r?`n", "`r`n") -ExpectedVersion '0.42.0'
Assert-True ($crlf.Valid -and $crlf.Bullets -eq 3) "CRLF line endings changed the reading: $($crlf.Reason)"

$undated = Test-ChangelogManagerEntry -Current ($readable -replace '## 0\.42\.0 \(2026-09-20\)', '## 0.42.0') `
    -ExpectedVersion '0.42.0'
Assert-True (-not $undated.Valid) 'An undated heading, which Manager skips, was accepted.'
Assert-True ($undated.Reason -like '*no date*') "The undated heading was refused for the wrong reason: $($undated.Reason)"

$unscoped = Test-ChangelogManagerEntry -Current ($readable -replace '\* \*\*Tumblr:\*\* another', '* another') `
    -ExpectedVersion '0.42.0'
Assert-True (-not $unscoped.Valid) 'A bullet Manager does not scope to Tumblr was accepted.'
Assert-True ($unscoped.Reason -like 'Line 12 *') "The unscoped bullet was refused for the wrong reason: $($unscoped.Reason)"

$wrapped = Test-ChangelogManagerEntry -Current ($readable -replace 'one change\.', "one`n  change.") `
    -ExpectedVersion '0.42.0'
Assert-True (-not $wrapped.Valid) 'A wrapped bullet, whose second line Manager drops, was accepted.'
Assert-True ($wrapped.Reason -like '*continues the bullet*') "The wrapped bullet was refused for the wrong reason: $($wrapped.Reason)"

$noBullets = Test-ChangelogManagerEntry -Current "## 0.42.0 (2026-09-20)`n`nOnly prose.`n" -ExpectedVersion '0.42.0'
Assert-True (-not $noBullets.Valid) 'An entry with no scoped bullet, which gets no update badge, was accepted.'

$otherScope = Test-ChangelogManagerEntry -Current ($readable -replace '\*\*Tumblr:\*\* a third', '**Instagram:** a third') `
    -ExpectedVersion '0.42.0'
Assert-True (-not $otherScope.Valid) 'A bullet scoped to another app was accepted.'

# A development-only change is written "* **Tooling:** ...", and a release made from the entries
# under Unreleased carries them. Manager shows a line only to the app it's scoped to, so it shows
# these to nobody, which is what they're for: allowed, and not counted as Tumblr changes. The
# release check refused every one, so a release had to drop them or relabel them for users.
$withTooling = Test-ChangelogManagerEntry -Current ($readable -replace '(\* \*\*Tumblr:\*\* a third\.)',
    "`$1`n* **Tooling:** a development-only change.") -ExpectedVersion '0.42.0'
Assert-True ($withTooling.Valid -and $withTooling.Bullets -eq 3) `
    "A Tooling bullet in the released entry was refused or counted: $($withTooling.Reason), $($withTooling.Bullets) bullets"
$toolingOnly = Test-ChangelogManagerEntry -Current "## 0.42.0 (2026-09-20)`n`n* **Tooling:** only this.`n" -ExpectedVersion '0.42.0'
Assert-True (-not $toolingOnly.Valid -and $toolingOnly.Reason -like '*no "* **Tumblr:** " bullet*') `
    "An entry with Tooling bullets alone, which gets no update badge, was not refused for that: $($toolingOnly.Reason)"
$wrappedTooling = Test-ChangelogManagerEntry -Current ($readable -replace '(\* \*\*Tumblr:\*\* a third\.)',
    "`$1`n* **Tooling:** a development-only`n  change.") -ExpectedVersion '0.42.0'
Assert-True ($wrappedTooling.Reason -like '*continues the bullet*') `
    "A wrapped Tooling bullet was not held to one line like the others: $($wrappedTooling.Reason)"

Assert-True (-not (Test-ChangelogManagerEntry -Current $readable -ExpectedVersion '0.43.0').Valid) `
    'An entry for a version the CHANGELOG does not name was accepted.'

# The control. The real file, held to the real version, must pass.
$realEntry = Test-ChangelogManagerEntry -Current $realChangelog -ExpectedVersion $realVersion
Assert-True $realEntry.Valid "Morphe Manager could not read this repository's own $realVersion entry: $($realEntry.Reason)"

Write-Host '[scripts] changelog Manager contracts passed'

# --- Resolve-D8 ------------------------------------------------------------------------------
#
# The build-tools directory is chosen by version number. Sorted as text, 9.0.0 wins over 37.0.0
# and 100.0.0 loses to it; the installed set happens to be 34 through 37, which is why nobody
# had seen it pick wrong.

. (Join-Path $PSScriptRoot 'injected-register-contracts.ps1')
$sdkRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-sdk-" + [guid]::NewGuid().ToString('N'))
try {
    $checkout = Join-Path $sdkRoot 'checkout'
    $sdk = Join-Path $sdkRoot 'sdk'
    foreach ($version in @('9.0.0', '37.0.0', '100.0.0', 'not-a-version')) {
        $tools = Join-Path (Join-Path $sdk 'build-tools') $version
        New-Item -ItemType Directory -Path $tools -Force | Out-Null
        Set-Content -LiteralPath (Join-Path $tools 'd8.bat') -Value '@echo off' -Encoding ASCII
    }
    # 38.0.0 is there but carries no d8, so it must not be picked over 37.0.0.
    New-Item -ItemType Directory -Path (Join-Path (Join-Path $sdk 'build-tools') '38.0.0') -Force | Out-Null
    New-Item -ItemType Directory -Path $checkout -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $checkout 'local.properties') -Encoding ASCII `
        -Value ('sdk.dir=' + ($sdk -replace '\\', '\\'))

    $chosen = Resolve-D8 -Root $checkout
    Assert-True ($chosen -like '*100.0.0*d8.bat') "Resolve-D8 chose $chosen, not the newest build-tools by version."

    Remove-Item -LiteralPath (Join-Path (Join-Path $sdk 'build-tools') '100.0.0') -Recurse -Force
    $chosen = Resolve-D8 -Root $checkout
    Assert-True ($chosen -like '*37.0.0*d8.bat') "Resolve-D8 chose $chosen over 37.0.0; 9.0.0 sorts above it as text."

    $explicit = Join-Path (Join-Path (Join-Path $sdk 'build-tools') '9.0.0') 'd8.bat'
    Assert-True ((Resolve-D8 -Explicit $explicit -Root $checkout) -eq $explicit) `
        'An explicit d8 path was not honoured.'
    Assert-Throws { Resolve-D8 -Root (Join-Path $sdkRoot 'nowhere') } '*local.properties*' `
        'A checkout with no local.properties resolved a d8 from somewhere.'
} finally {
    Remove-Item -LiteralPath $sdkRoot -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host '[scripts] d8 resolution contracts passed'

# --- common.ps1 ------------------------------------------------------------------------------
#
# The helpers four release scripts used to carry copies of. They had already drifted: the
# cleanup helper recursed unconditionally in one script and only on request in another, and two
# of the four version reads were missing -LiteralPath, which turns a repository path holding a
# bracket into a wildcard that matches nothing.

$commonRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-common-" + [guid]::NewGuid().ToString('N'))
$savedJar = $env:HUSHTUMBLR_DESKTOP_JAR
$savedWork = $env:HUSHTUMBLR_WORKDIR
try {
    New-Item -ItemType Directory -Path $commonRoot -Force | Out-Null
    $work = Join-Path $commonRoot 'work'
    New-Item -ItemType Directory -Path $work -Force | Out-Null

    # The path guard, which is what keeps a generated name from reaching outside the directory
    # the caller owns.
    $inside = Resolve-WithinRoot -Path (Join-Path $work 'run/output.apk') -Root $work
    Assert-True ($inside -like "$work*") 'A path inside the work directory was refused.'
    Assert-Throws { Resolve-WithinRoot -Path (Join-Path $commonRoot 'elsewhere.apk') -Root $work } `
        '*outside the work directory*' 'A path outside the work directory was accepted.'
    Assert-Throws { Resolve-WithinRoot -Path (Join-Path $work '..\escape.apk') -Root $work } `
        '*outside the work directory*' 'A path that climbs out with .. was accepted.'
    # The prefix trap: a sibling directory whose name starts with the work directory's name.
    Assert-Throws { Resolve-WithinRoot -Path ($work + '-other\file.apk') -Root $work } `
        '*outside the work directory*' 'A sibling sharing the name prefix was accepted as inside.'

    # Cleanup, recursive by default, and refusing anything outside the work directory.
    $tree = Join-Path $work 'run/deep'
    New-Item -ItemType Directory -Path $tree -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $tree 'leaf.txt') -Value 'x' -Encoding ASCII
    Remove-GeneratedPath -Path (Join-Path $work 'run') -Root $work
    Assert-True (-not (Test-Path -LiteralPath (Join-Path $work 'run'))) `
        'A generated directory tree was left behind by the default cleanup.'

    $single = Join-Path $work 'one.txt'
    Set-Content -LiteralPath $single -Value 'x' -Encoding ASCII
    Remove-GeneratedPath -Path $single -Root $work -NoRecurse
    Assert-True (-not (Test-Path -LiteralPath $single)) 'A single generated file was not removed.'

    $outside = Join-Path $commonRoot 'keep.txt'
    Set-Content -LiteralPath $outside -Value 'x' -Encoding ASCII
    Remove-GeneratedPath -Path $outside -Root $work -WarningAction SilentlyContinue
    Assert-True (Test-Path -LiteralPath $outside) 'Cleanup deleted a path outside the work directory.'
    # A path that is simply not there is nothing to do, not a failure.
    Remove-GeneratedPath -Path (Join-Path $work 'never-existed') -Root $work

    # The version read. -LiteralPath is the difference that had already drifted, so the fixture
    # directory carries the bracket that makes a wildcard read find nothing.
    $bracketRoot = Join-Path $commonRoot 'repo [1]'
    New-Item -ItemType Directory -Path $bracketRoot -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $bracketRoot 'gradle.properties') -Encoding ASCII -Value @(
        'org.gradle.caching = true', 'version = 9.9.9', 'android.useAndroidX = true')
    Assert-True ((Get-BundleVersion -Root $bracketRoot) -eq '9.9.9') `
        'The version read failed on a path containing a bracket.'
    Assert-Throws { Get-BundleVersion -Root (Join-Path $commonRoot 'no-such-repo') } `
        '*no gradle.properties*' 'A missing gradle.properties was not reported.'
    Set-Content -LiteralPath (Join-Path $bracketRoot 'gradle.properties') -Value 'name = x' -Encoding ASCII
    Assert-Throws { Get-BundleVersion -Root $bracketRoot } '*names no version*' `
        'A gradle.properties with no version was accepted.'
    Set-Content -LiteralPath (Join-Path $bracketRoot 'gradle.properties') -Value 'version =' -Encoding ASCII
    Assert-Throws { Get-BundleVersion -Root $bracketRoot } '*empty version*' `
        'A gradle.properties with an empty version was accepted.'

    # The desktop CLI lookup, which was two functions with different search orders. The jar
    # ships under its version, so the newest by write time is taken: sorting names as text puts
    # 1.9.0 above 1.15.0.
    $env:HUSHTUMBLR_DESKTOP_JAR = $null
    $env:HUSHTUMBLR_WORKDIR = $null
    $tools = Join-Path $commonRoot 'repo/build/morphe-tools'
    New-Item -ItemType Directory -Path $tools -Force | Out-Null
    $older = Join-Path $tools 'morphe-desktop-1.9.0-all.jar'
    $newer = Join-Path $tools 'morphe-desktop-1.15.0-all.jar'
    Set-Content -LiteralPath $older -Value 'old' -Encoding ASCII
    Set-Content -LiteralPath $newer -Value 'new' -Encoding ASCII
    (Get-Item -LiteralPath $older).LastWriteTime = (Get-Date).AddDays(-2)
    (Get-Item -LiteralPath $newer).LastWriteTime = (Get-Date)
    $repoRoot = Join-Path $commonRoot 'repo'
    Assert-True ((Resolve-DesktopCli -Root $repoRoot) -eq $newer) `
        'The desktop CLI lookup did not take the newest jar by write time.'

    Assert-True ($null -eq (Resolve-DesktopCli -Root (Join-Path $commonRoot 'empty'))) `
        'The lookup invented a jar where there is none.'
    Assert-Throws { Resolve-DesktopCli -Root (Join-Path $commonRoot 'empty') -Required } `
        '*No Morphe desktop CLI*' 'A required lookup with nothing to find did not say so.'
    Assert-Throws { Resolve-DesktopCli -Explicit (Join-Path $commonRoot 'absent.jar') -Root $repoRoot } `
        '*at the path given*' 'A named jar that is not there was quietly replaced by a search.'
    Assert-True ((Resolve-DesktopCli -Explicit $older -Root $repoRoot) -eq $older) `
        'An explicitly named jar was not honoured.'

    $env:HUSHTUMBLR_DESKTOP_JAR = $newer
    Assert-True ((Resolve-DesktopCli -Root $repoRoot) -eq $newer) `
        'HUSHTUMBLR_DESKTOP_JAR was not read.'

    # Split bundles. Tumblr comes as an .xapk or an .apkm, and aapt2, apksigner and the resource
    # check each read one APK: the base, whose manifest and resource table describe the app. A
    # split is often the larger file, so the base is found
    # by name first: base.apk, then the file an .xapk's manifest.json names, and by size only when
    # nothing names it, among the files that aren't config or split_ APKs before all of them.
    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    function New-TestBundleArchive {
        param([string]$Path, [System.Collections.Specialized.OrderedDictionary]$Entries)
        $archive = [System.IO.Compression.ZipFile]::Open($Path, [System.IO.Compression.ZipArchiveMode]::Create)
        try {
            foreach ($name in $Entries.Keys) {
                $writer = New-Object System.IO.StreamWriter($archive.CreateEntry($name).Open())
                try { $writer.Write($Entries[$name]) } finally { $writer.Dispose() }
            }
        } finally { $archive.Dispose() }
    }
    function Test-SamePath([string]$A, [string]$B) {
        return [System.IO.Path]::GetFullPath($A).Equals([System.IO.Path]::GetFullPath($B),
            [System.StringComparison]::OrdinalIgnoreCase)
    }
    $plainApk = Join-Path $commonRoot 'plain.apk'
    Set-Content -LiteralPath $plainApk -Value 'one apk' -Encoding ASCII
    Assert-True (Test-SamePath (Get-BaseApk -Apk $plainApk -Destination (Join-Path $commonRoot 'never.apk')) $plainApk) `
        'A plain APK was copied or replaced instead of being read as it is.'

    $apkm = Join-Path $commonRoot 'tumblr.apkm'
    $apkmEntries = [ordered]@{
        'info.json' = '{"versioncode":"1460500109"}'
        'base.apk' = 'base'
        'split_config.arm64_v8a.apk' = ('native code ' * 64)
    }
    New-TestBundleArchive -Path $apkm -Entries $apkmEntries
    $baseOut = Join-Path $commonRoot 'out/base.apk'
    Assert-True ((Test-SamePath (Get-BaseApk -Apk $apkm -Destination $baseOut) $baseOut) -and
        (Get-Content -LiteralPath $baseOut -Raw) -eq 'base') `
        'The base APK was not the one taken out of an .apkm with a larger split beside it.'

    # Relative paths, the way the recipe in the notes passes a fixture, from a session whose
    # process directory is somewhere else. PowerShell reads them against its own location and
    # .NET against the process's, so an unresolved path named a file in the wrong folder.
    $savedProcessDirectory = [Environment]::CurrentDirectory
    Push-Location -LiteralPath $commonRoot
    try {
        [Environment]::CurrentDirectory = [System.IO.Path]::GetTempPath()
        $relativeOut = Get-BaseApk -Apk 'tumblr.apkm' -Destination 'out\relative-base.apk'
        Assert-True ((Test-SamePath $relativeOut (Join-Path $commonRoot 'out\relative-base.apk')) -and
            (Get-Content -LiteralPath (Join-Path $commonRoot 'out\relative-base.apk') -Raw) -eq 'base') `
            'A relative bundle path was read against the process directory instead of the current location.'
    } finally {
        [Environment]::CurrentDirectory = $savedProcessDirectory
        Pop-Location
    }

    $xapk = Join-Path $commonRoot 'unnamed.xapk'
    $xapkEntries = [ordered]@{
        'config.en.apk' = 'language'
        'com.example.app.apk' = ('app ' * 64)
    }
    New-TestBundleArchive -Path $xapk -Entries $xapkEntries
    $xapkOut = Join-Path $commonRoot 'out/xapk-base.apk'
    Assert-True ((Test-SamePath (Get-BaseApk -Apk $xapk -Destination $xapkOut) $xapkOut) -and
        (Get-Content -LiteralPath $xapkOut -Raw).StartsWith('app ')) `
        'A bundle with no base.apk did not fall back to its largest APK.'

    # APKPure's layout of a split Tumblr build: the base named for the package, the arm64 split
    # larger than it, and a manifest.json whose split_apks name the base by id. Size alone took the
    # split. (APKMirror's Tumblr is an .apkm and APKPure's an .xapk, and Get-BaseApk has to read
    # either.)
    $tumblrXapk = Join-Path $commonRoot 'tumblr.xapk'
    New-TestBundleArchive -Path $tumblrXapk -Entries ([ordered]@{
        'com.tumblr.apk' = 'tumblr base'
        'icon.png' = 'icon'
        'config.arm64_v8a.apk' = ('native code ' * 64)
        'config.mdpi.apk' = 'densities'
        'manifest.json' = ('{"xapk_version":2,"package_name":"com.tumblr","split_apks":[' +
            '{"file":"com.tumblr.apk","id":"base"},{"file":"config.arm64_v8a.apk","id":"config.arm64_v8a"},' +
            '{"file":"config.mdpi.apk","id":"config.mdpi"}]}')
    })
    $tumblrOut = Join-Path $commonRoot 'out/tumblr-base.apk'
    Assert-True ((Test-SamePath (Get-BaseApk -Apk $tumblrXapk -Destination $tumblrOut) $tumblrOut) -and
        (Get-Content -LiteralPath $tumblrOut -Raw) -eq 'tumblr base') `
        'The base an .xapk manifest names was not taken over the larger arm64 split beside it.'
    # Without split_apks, the manifest's package name still names the base.
    $packageOnlyXapk = Join-Path $commonRoot 'package-only.xapk'
    New-TestBundleArchive -Path $packageOnlyXapk -Entries ([ordered]@{
        'config.arm64_v8a.apk' = ('native code ' * 64)
        'other.apk' = ('other ' * 32)
        'com.tumblr.apk' = 'tumblr base'
        'manifest.json' = '{"package_name":"com.tumblr"}'
    })
    $packageOnlyOut = Join-Path $commonRoot 'out/package-only-base.apk'
    Assert-True ((Test-SamePath (Get-BaseApk -Apk $packageOnlyXapk -Destination $packageOnlyOut) $packageOnlyOut) -and
        (Get-Content -LiteralPath $packageOnlyOut -Raw) -eq 'tumblr base') `
        'The base an .xapk manifest names by its package was not taken over larger APKs.'
    # With nothing naming the base, a larger config split still loses to the app's own APK.
    $unnamedSplitXapk = Join-Path $commonRoot 'unnamed-split.xapk'
    New-TestBundleArchive -Path $unnamedSplitXapk -Entries ([ordered]@{
        'config.arm64_v8a.apk' = ('native code ' * 64)
        'split_feature.apk' = ('feature ' * 48)
        'com.tumblr.apk' = 'tumblr base'
    })
    $unnamedSplitOut = Join-Path $commonRoot 'out/unnamed-split-base.apk'
    Assert-True ((Test-SamePath (Get-BaseApk -Apk $unnamedSplitXapk -Destination $unnamedSplitOut) $unnamedSplitOut) -and
        (Get-Content -LiteralPath $unnamedSplitOut -Raw) -eq 'tumblr base') `
        'A bundle naming no base took a larger config or split_ APK for it.'
    # And a bundle of splits alone hands back its largest, as before.
    $splitsOnly = Join-Path $commonRoot 'splits-only.xapk'
    New-TestBundleArchive -Path $splitsOnly -Entries ([ordered]@{ 'config.mdpi.apk' = 'small'; 'config.arm64_v8a.apk' = ('native ' * 8) })
    $splitsOnlyOut = Join-Path $commonRoot 'out/splits-only-base.apk'
    Assert-True ((Test-SamePath (Get-BaseApk -Apk $splitsOnly -Destination $splitsOnlyOut) $splitsOnlyOut) -and
        (Get-Content -LiteralPath $splitsOnlyOut -Raw).StartsWith('native ')) `
        'A bundle of splits alone did not hand back its largest APK.'

    $noApk = Join-Path $commonRoot 'empty.apkm'
    New-TestBundleArchive -Path $noApk -Entries ([ordered]@{ 'info.json' = '{}' })
    Assert-Throws { Get-BaseApk -Apk $noApk -Destination (Join-Path $commonRoot 'out/none.apk') } `
        '*holds no APK*' 'A bundle with no APK in it handed back something to read.'

    # Unpacking a bundle for the merge (Expand-SplitBundle, behind Get-MergedApk). The CLI's merger
    # unpacked a bundle into a folder beside it and wrote each .apk member where its name pointed,
    # truncating whatever was there, so a member named ../sentinel.apk overwrote the APK beside the
    # bundle. Every name is checked now before anything is written, and the APKs go into a folder
    # the run owns. Each case is a bundle in a folder of its own, beside an APK a name that climbs
    # one level would land on, with another one level up. A refusal leaves both as they were: no
    # merge, no unpacked folder, no file changed. The archives are written byte by byte, stored and
    # deflated, because an archive library writes only the names it thinks are sensible.
    function Get-TestCrc32([byte[]]$Bytes) {
        $crc = [long]4294967295
        foreach ($byte in $Bytes) {
            $crc = $crc -bxor [long]$byte
            for ($bit = 0; $bit -lt 8; $bit++) {
                if (($crc -band 1) -eq 1) { $crc = ($crc -shr 1) -bxor [long]3988292384 } else { $crc = $crc -shr 1 }
            }
        }
        return [uint32]($crc -bxor [long]4294967295)
    }
    function New-TestRawZip([string]$Path, [object[]]$Members) {
        $archive = New-Object System.IO.MemoryStream
        $central = New-Object System.IO.MemoryStream
        $local = New-Object System.IO.BinaryWriter($archive)
        $index = New-Object System.IO.BinaryWriter($central)
        foreach ($member in $Members) {
            $nameBytes = [System.Text.Encoding]::UTF8.GetBytes([string]$member.Name)
            $data = [System.Text.Encoding]::ASCII.GetBytes([string]$member.Text)
            $crc = Get-TestCrc32 $data
            # The size both headers declare, which a crafted member can set below what it holds.
            $declares = if ($null -ne $member.Declares) { [uint32]$member.Declares } else { [uint32]$data.Length }
            [uint16]$method = 0
            $stored = $data
            if ($member.Deflate) {
                $method = 8
                $packed = New-Object System.IO.MemoryStream
                $deflate = New-Object System.IO.Compression.DeflateStream($packed, [System.IO.Compression.CompressionMode]::Compress, $true)
                $deflate.Write($data, 0, $data.Length)
                $deflate.Dispose()
                $stored = $packed.ToArray()
            }
            $local.Flush()
            $offset = [uint32]$archive.Position
            $local.Write([uint32]0x04034b50); $local.Write([uint16]20); $local.Write([uint16]0); $local.Write($method)
            $local.Write([uint16]0); $local.Write([uint16]0x21); $local.Write([uint32]$crc)
            $local.Write([uint32]$stored.Length); $local.Write($declares)
            $local.Write([uint16]$nameBytes.Length); $local.Write([uint16]0); $local.Write($nameBytes); $local.Write($stored)
            $index.Write([uint32]0x02014b50); $index.Write([uint16]20); $index.Write([uint16]20); $index.Write([uint16]0)
            $index.Write($method); $index.Write([uint16]0); $index.Write([uint16]0x21); $index.Write([uint32]$crc)
            $index.Write([uint32]$stored.Length); $index.Write($declares); $index.Write([uint16]$nameBytes.Length)
            $index.Write([uint16]0); $index.Write([uint16]0); $index.Write([uint16]0); $index.Write([uint16]0)
            $index.Write([uint32]0); $index.Write([uint32]$offset); $index.Write($nameBytes)
        }
        $local.Flush()
        $index.Flush()
        $directory = $central.ToArray()
        $start = [uint32]$archive.Position
        $local.Write($directory)
        $local.Write([uint32]0x06054b50); $local.Write([uint16]0); $local.Write([uint16]0)
        $local.Write([uint16]$Members.Count); $local.Write([uint16]$Members.Count)
        $local.Write([uint32]$directory.Length); $local.Write($start); $local.Write([uint16]0)
        $local.Flush()
        [System.IO.File]::WriteAllBytes($Path, $archive.ToArray())
    }
    function Get-TestTreeState([string]$Path) {
        return (@(Get-ChildItem -LiteralPath $Path -Recurse -Force | Sort-Object FullName | ForEach-Object {
            if ($_.PSIsContainer) { "dir $($_.FullName)" }
            else { "file $($_.FullName) $((Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash)" }
        }) -join "`n")
    }
    $guardRoot = Join-Path $commonRoot 'split-guard'
    New-Item -ItemType Directory -Path $guardRoot -Force | Out-Null
    $outerSentinel = Join-Path $guardRoot 'outer.apk'
    [System.IO.File]::WriteAllText($outerSentinel, 'outer sentinel')
    $guardBase = @{ Name = 'base.apk' }
    $guardCases = @(
        @{ Case = 'climbs out, stored'; Members = @($guardBase, @{ Name = '../sentinel.apk' }); Says = 'climbs with a . or .. segment' }
        @{ Case = 'climbs out, deflated'; Members = @($guardBase, @{ Name = '../sentinel.apk'; Deflate = $true }); Says = 'climbs with a . or .. segment' }
        @{ Case = 'climbs out before the base'; Members = @(@{ Name = '../sentinel.apk'; Deflate = $true }, $guardBase); Says = 'climbs with a . or .. segment' }
        @{ Case = 'climbs two levels'; Members = @($guardBase, @{ Name = 'splits/../../outer.apk' }); Says = 'climbs with a . or .. segment' }
        @{ Case = 'climbs out of a folder'; Members = @($guardBase, @{ Name = 'splits/../sentinel.apk'; Deflate = $true }); Says = 'climbs with a . or .. segment' }
        @{ Case = 'starts with a dot segment'; Members = @($guardBase, @{ Name = './split_config.en.apk' }); Says = 'climbs with a . or .. segment' }
        @{ Case = 'is rooted'; Members = @($guardBase, @{ Name = '/sentinel.apk' }); Says = 'is rooted' }
        @{ Case = 'is a UNC path with slashes'; Members = @($guardBase, @{ Name = '//server/share/sentinel.apk' }); Says = 'is rooted' }
        @{ Case = 'is rooted with a backslash'; Members = @($guardBase, @{ Name = '\sentinel.apk' }); Says = 'uses a backslash*' }
        @{ Case = 'is a UNC path'; Members = @($guardBase, @{ Name = '\\server\share\sentinel.apk'; Deflate = $true }); Says = 'uses a backslash*' }
        @{ Case = 'names a drive root'; Members = @($guardBase, @{ Name = 'C:\sentinel.apk' }); Says = 'uses a backslash*' }
        @{ Case = 'names a drive root with a slash'; Members = @($guardBase, @{ Name = 'C:/sentinel.apk' }); Says = 'holds a colon*' }
        @{ Case = 'is relative to a drive'; Members = @($guardBase, @{ Name = 'C:sentinel.apk' }); Says = 'holds a colon*' }
        @{ Case = 'names a stream'; Members = @($guardBase, @{ Name = 'split_config.en.apk:hidden' }); Says = 'holds a colon*' }
        @{ Case = 'uses a backslash as a separator'; Members = @($guardBase, @{ Name = 'splits\split_config.en.apk' }); Says = 'uses a backslash*' }
        @{ Case = 'mixes separators'; Members = @($guardBase, @{ Name = 'splits/..\sentinel.apk'; Deflate = $true }); Says = 'uses a backslash*' }
        @{ Case = 'has an empty segment'; Members = @($guardBase, @{ Name = 'splits//split_config.en.apk' }); Says = 'has an empty path segment' }
        @{ Case = 'ends in a dot'; Members = @($guardBase, @{ Name = 'split_config.en.apk.' }); Says = 'ends a segment with a dot or a space*' }
        @{ Case = 'has a folder ending in a space'; Members = @($guardBase, @{ Name = 'splits /split_config.en.apk' }); Says = 'ends a segment with a dot or a space*' }
        @{ Case = 'names a device'; Members = @($guardBase, @{ Name = 'nul.apk' }); Says = 'names a Windows device' }
        @{ Case = 'holds a shell character'; Members = @($guardBase, @{ Name = 'split&calc.apk' }); Says = 'is an APK whose file name holds more than*' }
        # The Kelvin sign is a k once case is ignored, which let it past the name check that
        # Get-InputIdentity, matching case, then refused after the merge.
        @{ Case = 'holds a letter only a match without case takes'; Members = @($guardBase, @{ Name = "split_$([char]0x212A).apk" }); Says = 'is an APK whose file name holds more than*' }
        @{ Case = 'repeats a name'; Members = @($guardBase, @{ Name = 'base.apk'; Deflate = $true }); Says = "is the same path as 'base.apk' once case is ignored" }
        @{ Case = 'repeats a name in other case'; Members = @($guardBase, @{ Name = 'BASE.apk' }); Says = "is the same path as 'base.apk' once case is ignored" }
        @{ Case = 'repeats a file name in a folder'; Members = @($guardBase, @{ Name = 'splits/base.apk' }); Says = "unpacks to base.apk, as 'base.apk' does" }
        @{ Case = 'repeats a file name with the extension in capitals'; Members = @($guardBase, @{ Name = 'splits/Base.APK' }); Says = "unpacks to Base.apk, as 'base.apk' does" }
    )
    foreach ($case in $guardCases) {
        $caseDir = Join-Path $guardRoot ($case.Case -replace '[^A-Za-z0-9]+', '-')
        New-Item -ItemType Directory -Path $caseDir -Force | Out-Null
        $caseBundle = Join-Path $caseDir 'bundle.apkm'
        [System.IO.File]::WriteAllText((Join-Path $caseDir 'sentinel.apk'), 'sentinel')
        New-TestRawZip -Path $caseBundle -Members @($case.Members | ForEach-Object {
            @{ Name = $_.Name; Text = "the bytes of $($_.Name)"; Deflate = [bool]$_.Deflate } })
        $caseBefore = Get-TestTreeState $caseDir
        $outerBefore = (Get-FileHash -LiteralPath $outerSentinel -Algorithm SHA256).Hash
        $caseMerge = Join-Path $caseDir 'merged.apk'
        $refusal = "*Refusing bundle.apkm: its member*$($case.Says)*Nothing was unpacked*"
        Assert-Throws { Expand-SplitBundle -Apk $caseBundle -Destination $caseMerge } $refusal `
            "A bundle with a member that $($case.Case) was unpacked."
        # The shared merge path refuses it the same way, before any JDK, aapt2 or apksigner is looked for.
        Assert-Throws { Get-MergedApk -Apk $caseBundle -Destination $caseMerge -Java (Join-Path $caseDir 'no-java.exe') `
                -DesktopJar (Join-Path $caseDir 'no.jar') -Aapt2 (Join-Path $caseDir 'no-aapt2.exe') -PackageName 'com.tumblr' `
                -Signers @('0' * 64) } $refusal "The merge took a bundle with a member that $($case.Case)."
        Assert-True ((Get-TestTreeState $caseDir) -ceq $caseBefore -and
            (Get-FileHash -LiteralPath $outerSentinel -Algorithm SHA256).Hash -ceq $outerBefore) `
            "Refusing a bundle with a member that $($case.Case) changed a file or left one behind."
    }
    $noApkDir = Join-Path $guardRoot 'no-apk'
    Assert-Throws { Expand-SplitBundle -Apk $noApk -Destination (Join-Path $noApkDir 'merged.apk') } `
        '*empty.apkm holds no APK. Nothing was unpacked.*' 'A bundle with no APK in it was unpacked.'
    Assert-True (-not (Test-Path -LiteralPath $noApkDir)) 'Refusing a bundle with no APK in it created its merge folder.'

    # Sizes are capped before anything is written, so a crafted bundle can't fill the disk: one APK
    # declaring more than -MemberLimit, or APKs declaring more than -TotalLimit together, are refused
    # with nothing unpacked, and a bundle right at both limits unpacks. The limits are small here; the
    # defaults are 1 GiB an APK and 2 GiB a bundle. Get-BaseApk holds the base to the same rule.
    $sizeDir = Join-Path $guardRoot 'sizes'
    New-Item -ItemType Directory -Path $sizeDir -Force | Out-Null
    $sizeBundle = Join-Path $sizeDir 'bundle.apkm'
    New-TestRawZip -Path $sizeBundle -Members @(
        @{ Name = 'base.apk'; Text = ('b' * 600) }, @{ Name = 'split_config.en.apk'; Text = ('e' * 600); Deflate = $true })
    $sizeBefore = Get-TestTreeState $sizeDir
    $sizeMerge = Join-Path $sizeDir 'merged.apk'
    Assert-Throws { Expand-SplitBundle -Apk $sizeBundle -Destination $sizeMerge -MemberLimit 500 } `
        "*Refusing bundle.apkm: its member 'base.apk' would unpack to 600 bytes, more than the 500 bytes one APK may take. Nothing was unpacked.*" `
        'An APK past the size limit was unpacked.'
    Assert-Throws { Expand-SplitBundle -Apk $sizeBundle -Destination $sizeMerge -TotalLimit 1000 } `
        '*Refusing bundle.apkm: its APKs would unpack to 1200 bytes, more than the 1000 bytes a bundle may take. Nothing was unpacked.*' `
        'A bundle past the size limit was unpacked.'
    Assert-Throws { Get-BaseApk -Apk $sizeBundle -Destination (Join-Path $sizeDir 'base.apk') -Limit 500 } `
        "*Refusing bundle.apkm: its base APK 'base.apk' would unpack to 600 bytes, more than the 500 bytes one APK may take*" `
        'A base APK past the size limit was taken out.'
    Assert-True ((Get-TestTreeState $sizeDir) -ceq $sizeBefore) 'Refusing a bundle past a size limit changed a file or left one behind.'
    $withinLimits = Expand-SplitBundle -Apk $sizeBundle -Destination $sizeMerge -MemberLimit 600 -TotalLimit 1200
    try {
        Assert-True (@($withinLimits.Files).Count -eq 2 -and
            (@($withinLimits.Files | ForEach-Object { (Get-Item -LiteralPath $_.Path).Length }) -join ',') -ceq '600,600') `
            'A bundle right at its size limits did not unpack whole.'
    } finally { Remove-SplitDirectory -Splits $withinLimits }

    # A member declaring fewer bytes than it inflates to never unpacks past what it declares, the
    # size the limits read. Windows PowerShell 5.1's .NET Framework inflater reads to the end, which
    # Copy-BundleMember refuses; newer .NET stops at the declared size itself. Either way no file holds
    # more than 100 bytes, and a refusal leaves no unpacked folder.
    $lyingBundle = Join-Path $sizeDir 'lying.apkm'
    New-TestRawZip -Path $lyingBundle -Members @(@{ Name = 'base.apk'; Text = ('b' * 4000); Deflate = $true; Declares = 100 })
    foreach ($taker in @('Expand-SplitBundle', 'Get-BaseApk')) {
        $taken = $null
        $lyingRefusal = $null
        $lyingOut = Join-Path $sizeDir "lying-$taker.apk"
        try { $taken = & $taker -Apk $lyingBundle -Destination $lyingOut } catch { $lyingRefusal = $_.Exception.Message }
        try {
            $written = @(if ($taker -eq 'Expand-SplitBundle') { @($taken.Files | ForEach-Object { $_.Path }) } else { @($taken) }) |
                Where-Object { $_ -and (Test-Path -LiteralPath $_) }
            Assert-True ((-not $lyingRefusal -or ($lyingRefusal -like "*Refusing lying.apkm: its member 'base.apk'*Nothing was kept.*" -and
                        -not (Test-Path -LiteralPath $lyingOut) -and @(Get-ChildItem -LiteralPath $sizeDir -Force -Filter '.splits-*').Count -eq 0)) -and
                    @($written | Where-Object { (Get-Item -LiteralPath $_).Length -gt 100 }).Count -eq 0) `
                "$taker unpacked a member declaring 100 bytes past what it declares: $lyingRefusal"
        } finally {
            if ($taker -eq 'Expand-SplitBundle') { Remove-SplitDirectory -Splits $taken }
            Remove-Item -LiteralPath $lyingOut -Force -ErrorAction SilentlyContinue
        }
    }

    # An .xapk's manifest.json, which Get-BaseApk reads into memory to find the base, is capped at
    # 1 MiB by what it declares, so a crafted one can't fill memory the way a crafted APK could fill
    # the disk.
    $bigManifest = Join-Path $sizeDir 'big-manifest.xapk'
    New-TestRawZip -Path $bigManifest -Members @(
        @{ Name = 'manifest.json'; Text = '{"package_name":"com.tumblr"}'; Deflate = $true; Declares = 2097152 },
        @{ Name = 'com.tumblr.apk'; Text = 'base' })
    $bigManifestOut = Join-Path $sizeDir 'big-manifest-base.apk'
    Assert-Throws { Get-BaseApk -Apk $bigManifest -Destination $bigManifestOut } `
        '*Refusing big-manifest.xapk: its manifest.json would unpack to 2097152 bytes, more than the 1048576 bytes it may take. Nothing was unpacked.*' `
        'A manifest.json past its size limit was read.'
    Assert-True (-not (Test-Path -LiteralPath $bigManifestOut)) 'Refusing an oversized manifest.json left a base APK behind.'

    # Distributors' layouts unpack whole, the APKs alone and byte for byte, into a .splits- folder
    # beside the merge that is gone once the caller is done: an .apkm (base.apk, its splits,
    # info.json and an icon, one split's extension in capitals, which is written as .apk, the name
    # the merger reads), an .xapk (the base named for the package, config splits, manifest.json, an
    # icon and an OBB in a folder) and an .apks, whose APKs sit in splits/ and unpack by file name.
    foreach ($layout in @(
            @{ Name = 'tumblr.apkm'; Entries = [ordered]@{ 'info.json' = '{"versioncode":"1"}'; 'icon.png' = 'icon'
                    'base.apk' = 'base'; 'split_config.arm64_v8a.apk' = 'arm64'; 'split_config.xxhdpi.APK' = 'xxhdpi' }
                Unpacked = [ordered]@{ 'base.apk' = 'base'; 'split_config.arm64_v8a.apk' = 'arm64'; 'split_config.xxhdpi.apk' = 'xxhdpi' } }
            @{ Name = 'tumblr.xapk'; Entries = [ordered]@{ 'com.tumblr.apk' = 'base'; 'config.arm64_v8a.apk' = 'arm64'
                    'config.en.apk' = 'en'; 'icon.png' = 'icon'; 'manifest.json' = '{"package_name":"com.tumblr"}'
                    'Android/obb/com.tumblr/main.1.com.tumblr.obb' = 'obb' }
                Unpacked = [ordered]@{ 'com.tumblr.apk' = 'base'; 'config.arm64_v8a.apk' = 'arm64'; 'config.en.apk' = 'en' } }
            @{ Name = 'tumblr.apks'; Entries = [ordered]@{ 'toc.pb' = 'toc'; 'splits/' = ''; 'splits/base-master.apk' = 'base'
                    'splits/base-xxhdpi.apk' = 'xxhdpi' }
                Unpacked = [ordered]@{ 'base-master.apk' = 'base'; 'base-xxhdpi.apk' = 'xxhdpi' } })) {
        $layoutDir = Join-Path $guardRoot ('layout-' + $layout.Name)
        New-Item -ItemType Directory -Path $layoutDir -Force | Out-Null
        $layoutBundle = Join-Path $layoutDir $layout.Name
        New-TestBundleArchive -Path $layoutBundle -Entries $layout.Entries
        $splits = Expand-SplitBundle -Apk $layoutBundle -Destination (Join-Path $layoutDir 'merged.apk')
        try {
            $found = @(Get-ChildItem -LiteralPath $splits.Directory -Force | Sort-Object Name | ForEach-Object {
                "$($_.Name)=$([System.IO.File]::ReadAllText($_.FullName))" }) -join ';'
            $expected = @($layout.Unpacked.Keys | Sort-Object | ForEach-Object { "$_=$($layout.Unpacked[$_])" }) -join ';'
            $listed = @($splits.Files | ForEach-Object { $_.Name } | Sort-Object) -join ';'
            Assert-True ($found -ceq $expected -and $listed -ceq (@($layout.Unpacked.Keys | Sort-Object) -join ';') -and
                (Test-SamePath (Split-Path -Parent $splits.Directory) $layoutDir) -and
                (Split-Path -Leaf $splits.Directory) -like '.splits-*') `
                "$($layout.Name) did not unpack its APKs alone, byte for byte, into a folder of its own beside the merge: $found"
        } finally {
            Remove-SplitDirectory -Splits $splits
        }
        Assert-True (@(Get-ChildItem -LiteralPath $layoutDir -Force -Filter '.splits-*').Count -eq 0 -and
            -not (Test-Path -LiteralPath (Join-Path $layoutDir 'merged.apk'))) "$($layout.Name) left its unpacked folder behind."
    }

    # The input is named by the digest taken through the handle it was unpacked or copied from, and
    # each APK by the bytes written for it, which the lock holds the file to: nothing holds the file
    # between the write and the lock, so one changed then is refused instead of hashed as it is.
    $sourceDir = Join-Path $guardRoot 'source-digest'
    New-Item -ItemType Directory -Path $sourceDir -Force | Out-Null
    $sourceBundle = Join-Path $sourceDir 'tumblr.apkm'
    New-TestBundleArchive -Path $sourceBundle -Entries ([ordered]@{ 'info.json' = '{}'; 'base.apk' = 'base'; 'split_config.en.apk' = 'en' })
    $sourcePlain = Join-Path $sourceDir 'tumblr.apk'
    [System.IO.File]::WriteAllText($sourcePlain, 'plain')
    $lowerHash = { param([string]$Path) (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }
    foreach ($taker in @('Expand-SplitBundle', 'Copy-ApkToSplitDirectory')) {
        $taken = if ($taker -eq 'Expand-SplitBundle') { $sourceBundle } else { $sourcePlain }
        $splits = & $taker -Apk $taken -Destination (Join-Path $sourceDir 'merged.apk')
        try {
            $unwritten = @($splits.Files | Where-Object { $_.Written -cne (& $lowerHash $_.Path) })
            Assert-True ($splits.Sha256 -ceq (& $lowerHash $taken) -and $unwritten.Count -eq 0) `
                "$taker didn't name $(Split-Path -Leaf $taken) by its own digest, or an APK by the bytes written for it."
            Lock-SplitFiles -Splits $splits
            Assert-True (@($splits.Files | Where-Object { $_.Sha256 -cne $_.Written -or -not $_.Handle }).Count -eq 0) `
                "Lock-SplitFiles didn't hold what $taker wrote to the digest it was written with."
        } finally { Remove-SplitDirectory -Splits $splits }
        $splits = & $taker -Apk $taken -Destination (Join-Path $sourceDir 'merged.apk')
        try {
            [System.IO.File]::WriteAllText($splits.Files[0].Path, 'swapped in after the write')
            Assert-Throws { Lock-SplitFiles -Splits $splits } "*$($splits.Files[0].Member) at $($splits.Files[0].Path) isn't what was written there*" `
                "Lock-SplitFiles locked an APK $taker wrote and something then changed."
        } finally { Remove-SplitDirectory -Splits $splits }
    }
    $unnamed = [pscustomobject]@{ Bundle = $sourcePlain; Directory = $null
        Files = @([pscustomobject]@{ Name = 'input.apk'; Path = $sourcePlain; Member = 'tumblr.apk'; Sha256 = $null; Handle = $null }) }
    try {
        Assert-Throws { Lock-SplitFiles -Splits $unnamed } '*has no digest of what was written for it*' `
            'Lock-SplitFiles locked an APK nothing said the bytes of.'
    } finally { Remove-SplitDirectory -Splits $unnamed }
    Assert-Throws { Get-HeldSourceSha256 -Merged (Join-Path $sourceDir 'not-held.apk') } "*isn't a merge this process holds*" `
        'Get-HeldSourceSha256 named the input of a merge nothing holds.'

    # The fetch the release facts make of the indexed bundle and the add-source page. A real
    # request first: nothing listens on port 1, so it is refused before it leaves this machine.
    # Then the two answers a stand-in gives, a 404 the way both shells raise it and a 200.
    Assert-Throws {
        Assert-UrlReachable -Uri ([Uri]'http://127.0.0.1:1/patches.mpp') -Description 'test bundle URL' -FailureHint 'hint'
    } '*Could not reach the test bundle URL http://127.0.0.1:1/patches.mpp*' 'An address nothing answers passed the reachability check.'
    & {
        function Invoke-WebRequest { throw (New-NotFoundAnswer) }
        Assert-Throws {
            Assert-UrlReachable -Uri ([Uri]'https://github.com/example/none.mpp') -Description 'test bundle URL' `
                -FailureHint 'Publish it first.'
        } '*test bundle URL https://github.com/example/none.mpp answered HTTP 404. Publish it first.' `
            'An address answering 404 passed the reachability check.'
    }
    & {
        function Invoke-WebRequest { [pscustomobject]@{ StatusCode = 200 } }
        Assert-UrlReachable -Uri ([Uri]'https://github.com/example/patches.mpp') -Description 'test bundle URL' `
            -FailureHint 'hint' 6> $null
    }
} finally {
    $env:HUSHTUMBLR_DESKTOP_JAR = $savedJar
    $env:HUSHTUMBLR_WORKDIR = $savedWork
    Remove-Item -LiteralPath $commonRoot -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host '[scripts] shared helper contracts passed'

# --- build queue ---------------------------------------------------------------------------------
#
# The heavy desktop jobs (a CLI patch run, a merge, the resource table check, the dex and host
# reference checks, the fingerprint ranking, the gate's own Gradle run without a wrapper) wait for
# a slot in the machine's build queue when BUILD_QUEUE_SCRIPT names one, so build-queue.ps1 -Status
# shows them and they never start beside two Gradle builds. A stand-in queue lets every job straight
# through and writes down what entered, at which priority, and what left.

function New-FakeBuildQueue {
    param([string]$Path, [string]$Log)
    $quotedLog = "'" + $Log.Replace("'", "''") + "'"
    $mutexName = 'Local\HushTumblrFixtureQueue-' + [guid]::NewGuid().ToString('N')
    # Only the log append is serialized. The builders still run concurrently.
    # PowerShell 5.1's Add-Content can fail while reopening a contended file.
    Set-Content -LiteralPath $Path -Encoding ASCII -Value @(
        'param([switch]$Status, [string]$Label, [string]$Priority, [string]$Run)',
        'function Enter-BuildQueue {',
        '    param([string]$Label = ''build'', [string]$Priority)',
        '    if (-not $Priority) { $Priority = if ($env:BUILD_QUEUE_PRIORITY -eq ''release'') { ''release'' } else { ''normal'' } }',
        "    `$mutex = New-Object System.Threading.Mutex(`$false, '$mutexName')",
        '    try {',
        '        [void]$mutex.WaitOne()',
        "        try { [IO.File]::AppendAllText($quotedLog, ""enter `$Priority `$Label"" + [Environment]::NewLine, [Text.Encoding]::ASCII) }",
        '        finally { $mutex.ReleaseMutex() }',
        '    } finally { $mutex.Dispose() }',
        '    return [pscustomobject]@{ slot = 0; label = $Label }',
        '}',
        'function Exit-BuildQueue {',
        '    param($Ticket)',
        "    `$mutex = New-Object System.Threading.Mutex(`$false, '$mutexName')",
        '    try {',
        '        [void]$mutex.WaitOne()',
        "        try { [IO.File]::AppendAllText($quotedLog, ""exit `$(`$Ticket.label)"" + [Environment]::NewLine, [Text.Encoding]::ASCII) }",
        '        finally { $mutex.ReleaseMutex() }',
        '    } finally { $mutex.Dispose() }',
        '}',
        'function Get-BuildQueueMask {',
        '    param([int]$Slot)',
        '    return [System.Diagnostics.Process]::GetCurrentProcess().ProcessorAffinity',
        '}')
}

$queueRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-queue-" + [guid]::NewGuid().ToString('N'))
$savedQueueScript = $env:BUILD_QUEUE_SCRIPT
$savedQueuePriority = $env:BUILD_QUEUE_PRIORITY
try {
    New-Item -ItemType Directory -Path $queueRoot | Out-Null
    $queueLog = Join-Path $queueRoot 'queue.log'
    $fakeQueue = Join-Path $queueRoot 'build-queue.ps1'
    New-FakeBuildQueue -Path $fakeQueue -Log $queueLog
    $env:BUILD_QUEUE_PRIORITY = $null

    # No queue named: nothing to wait for, and nothing to give back.
    $env:BUILD_QUEUE_SCRIPT = $null
    $global:LASTEXITCODE = 3
    $held = Enter-HushTumblrQueue -Job 'fixture job'
    Exit-HushTumblrQueue $held
    Assert-True ($null -eq $held -and $LASTEXITCODE -eq 3 -and -not (Test-Path -LiteralPath $queueLog)) `
        'A job waited for a build queue nobody named, or lost the exit code the caller reads.'

    # A queue named: the job takes a slot under its label, runs below normal priority, and leaves
    # with the exit code of the job it held the slot for.
    $env:BUILD_QUEUE_SCRIPT = $fakeQueue
    $process = [System.Diagnostics.Process]::GetCurrentProcess()
    $priorityBefore = $process.PriorityClass
    $held = Enter-HushTumblrQueue -Job 'fixture job'
    try {
        $process.Refresh()
        Assert-True ($process.PriorityClass -eq [System.Diagnostics.ProcessPriorityClass]::BelowNormal) `
            "A job holding a queue slot ran at $($process.PriorityClass) priority."
        $global:LASTEXITCODE = 7
    } finally {
        Exit-HushTumblrQueue $held
    }
    $process.Refresh()
    Assert-True ($LASTEXITCODE -eq 7 -and $process.PriorityClass -eq $priorityBefore) `
        "Leaving the queue lost the job's exit code ($LASTEXITCODE) or kept its priority ($($process.PriorityClass))."
    Assert-True ((@(Get-Content -LiteralPath $queueLog) -join '|') -ceq 'enter normal hushtumblr fixture job|exit hushtumblr fixture job') `
        "The job did not take and give back one queue slot under its own label: $(@(Get-Content -LiteralPath $queueLog) -join '; ')"

    # A release run's jobs go ahead of everyday ones.
    Remove-Item -LiteralPath $queueLog -Force
    $env:BUILD_QUEUE_PRIORITY = 'release'
    Exit-HushTumblrQueue (Enter-HushTumblrQueue -Job 'fixture release')
    Assert-True ((@(Get-Content -LiteralPath $queueLog) -join '|') -ceq 'enter release hushtumblr fixture release|exit hushtumblr fixture release') `
        "A release job did not ask the queue for release priority: $(@(Get-Content -LiteralPath $queueLog) -join '; ')"
    $env:BUILD_QUEUE_PRIORITY = $null

    # A queue named but not there is a mistake to correct, not a reason to run outside it.
    $env:BUILD_QUEUE_SCRIPT = Join-Path $queueRoot 'no-such-queue.ps1'
    Assert-Throws { Enter-HushTumblrQueue -Job 'fixture job' } '*BUILD_QUEUE_SCRIPT names*which is not there*' `
        'A build queue that is not there was ignored.'
} finally {
    $env:BUILD_QUEUE_SCRIPT = $savedQueueScript
    $env:BUILD_QUEUE_PRIORITY = $savedQueuePriority
    Remove-Item -LiteralPath $queueRoot -Recurse -Force -ErrorAction SilentlyContinue
}

# Every heavy call site enters the queue, under a label of its own.
$queuedJobs = [ordered]@{
    'common.ps1'                       = @('merge')
    'verify-all-patches.ps1'           = @('verify patch', 'verify resources')
    'build-release-receipt.ps1'        = @('receipt patch', 'receipt resources')
    'verify-injected-registers.ps1'    = @('dex diff', 'host references')
    'patch-for-device.ps1'             = @('device patch', 'device resources')
    'fingerprint-candidates.ps1'       = @('fingerprint candidates')
    'pre-push.ps1'                     = @('gate gradle')
    'test-bouncycastle-test-graph.ps1' = @('bouncycastle review')
}
foreach ($name in $queuedJobs.Keys) {
    $text = Get-Content -LiteralPath (Join-Path $PSScriptRoot $name) -Raw
    foreach ($job in $queuedJobs[$name]) {
        Assert-True ($text -match "(?m)^[^#\r\n]*\`$queued = Enter-HushTumblrQueue -Job '$job'\r?$") `
            "$name does not wait in the build queue for its $job job."
    }
    Assert-True (([regex]::Matches($text, '(?m)^[^#\r\n]*Exit-HushTumblrQueue \$queued\r?$')).Count -eq $queuedJobs[$name].Count) `
        "$name does not give back every queue slot it takes."
}
$receiptText = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'build-release-receipt.ps1') -Raw
Assert-True ($receiptText -match "(?m)^\`$env:BUILD_QUEUE_PRIORITY = 'release'\r?$" -and
    $receiptText -match '(?m)^\s+\$env:BUILD_QUEUE_PRIORITY = \$savedQueuePriority\r?$') `
    'The receipt builder does not ask the build queue for release priority, or keeps it after the run.'
$hookText = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'pre-push.ps1') -Raw
Assert-True ($hookText -match "'HUSHTUMBLR_BUILD_WRAPPER', 'HUSHTUMBLR_DEVICE_SERIAL', 'BUILD_QUEUE_SCRIPT'\)\) \{") `
    'The hook does not read the build wrapper and the build queue from the user environment.'

Write-Host '[scripts] build queue contracts passed'

# --- applied record keys ---------------------------------------------------------------------
#
# A fixture apply that passed every check is kept under a key (Get-AppliedRecordKey), and a run
# with the same key reuses it. The key has to move when any input moves: the bundle, the fixture,
# the catalog, the patch selection, the forced flag, the desktop CLI, the SDK stubs and every file
# the verifier loads or starts, DexDiff.java among them. The order the patches are named in
# doesn't count. And the verifier file list has to be what verify-all-patches.ps1 and
# verify-injected-registers.ps1 actually reach, followed through every script they dot-source.
$reached = New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::OrdinalIgnoreCase)
$pending = New-Object 'System.Collections.Generic.Queue[string]'
foreach ($start in @('verify-all-patches.ps1', 'verify-injected-registers.ps1')) { [void]$reached.Add($start); $pending.Enqueue($start) }
while ($pending.Count -gt 0) {
    $text = Get-Content -LiteralPath (Join-Path $PSScriptRoot $pending.Dequeue()) -Raw
    foreach ($reference in [regex]::Matches($text, "Join-Path \`$PSScriptRoot '([^']+)'")) {
        $name = $reference.Groups[1].Value
        if ($reached.Add($name) -and $name -like '*.ps1') { $pending.Enqueue($name) }
    }
}
$keyed = @(Get-AppliedRecordVerifierFiles)
$unkeyed = @($reached | Where-Object { $keyed -notcontains $_ } | Sort-Object)
$unreached = @($keyed | Where-Object { -not $reached.Contains($_) } | Sort-Object)
Assert-True ($unkeyed.Count -eq 0 -and $unreached.Count -eq 0 -and $keyed -contains 'DexDiff.java') `
    ("Get-AppliedRecordVerifierFiles isn't the set the verifier reaches. Not keyed: $($unkeyed -join ', '). " +
        "Keyed but not reached: $($unreached -join ', ').")

$keyRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-record-key-" + [guid]::NewGuid().ToString('N'))
try {
    $keyInputs = @{}
    foreach ($name in @('Bundle', 'PatchList', 'DesktopJar', 'AndroidJar', 'ApiVersions')) {
        $keyInputs[$name] = Join-Path $keyRoot "$name.bin"
    }
    $keyScripts = Join-Path $keyRoot 'scripts'
    New-Item -ItemType Directory -Path $keyScripts -Force | Out-Null
    foreach ($name in @($keyInputs.Keys)) { [IO.File]::WriteAllText($keyInputs[$name], "stand-in $name") }
    foreach ($name in $keyed) { Copy-Item -LiteralPath (Join-Path $PSScriptRoot $name) -Destination $keyScripts }
    # The input is named by what a held merge was made from (Get-HeldInputIdentity), a digest
    # rather than a path, so a stand-in digest is enough here.
    function Get-TestRecordKey([string[]]$Names = @('Hide ads', 'Download pins'), [bool]$Forced = $false, [string]$Identity = ('a' * 64)) {
        return (Get-AppliedRecordKey @keyInputs -InputIdentity $Identity -PatchNames $Names -Forced $Forced -ScriptRoot $keyScripts).Key
    }
    $baseKey = Get-TestRecordKey
    Assert-True ($baseKey -cmatch '^[0-9a-f]{64}$') "The applied record key isn't a SHA-256 in lower-case hex: $baseKey"
    Assert-True ((Get-TestRecordKey -Names @('Download pins', 'Hide ads')) -ceq $baseKey) `
        'The applied record key depends on the order the patches are named in.'
    Assert-True ((Get-TestRecordKey -Names @('Hide ads')) -cne $baseKey) 'Leaving a patch out did not change the applied record key.'
    Assert-True ((Get-TestRecordKey -Forced $true) -cne $baseKey) 'A forced run has the key of a declared one.'
    Assert-True ((Get-TestRecordKey -Identity ('b' * 64)) -cne $baseKey) 'Another input left the applied record key as it was.'
    Assert-Throws { Get-TestRecordKey -Identity (Join-Path $keyRoot 'Fixture.apk') } '*InputIdentity*' `
        'The applied record key took a path for the input instead of what a held merge was made from.'
    # What a merge was made from: a plain APK by its copy, a bundle by its APKs' names and digests
    # in any order, and the two never alike. The merger orders and names its modules by the file
    # names, so the same APKs under other names are another input.
    $one = '1' * 64; $two = '2' * 64
    $apk = { param([string]$Name, [string]$Sha256) [pscustomobject]@{ Name = $Name; Sha256 = $Sha256 } }
    $base = & $apk 'base.apk' $one; $split = & $apk 'split_config.xxhdpi.apk' $two
    $plainIdentity = Get-InputIdentity -Plain $one
    Assert-True ($plainIdentity -cmatch '^[0-9a-f]{64}$' -and $plainIdentity -cne $one -and
        (Get-InputIdentity -Apks @($base, $split)) -ceq (Get-InputIdentity -Apks @($split, $base)) -and
        (Get-InputIdentity -Apks @($base)) -cne $plainIdentity -and
        (Get-InputIdentity -Apks @($base, $split)) -cne (Get-InputIdentity -Apks @($base))) `
        'Get-InputIdentity does not name a plain APK and a bundle apart, or depends on the order of the APKs.'
    Assert-True ((Get-InputIdentity -Apks @($base, $split)) -cne (Get-InputIdentity -Apks @((& $apk 'base.apk' $two), (& $apk 'split_config.xxhdpi.apk' $one))) -and
        (Get-InputIdentity -Apks @($base)) -cne (Get-InputIdentity -Apks @((& $apk 'other.apk' $one)))) `
        'Get-InputIdentity names a bundle alike when its APKs swap names or one is renamed.'
    Assert-Throws { Get-InputIdentity -Plain $one -Apks @($split) } '*not both or neither*' 'Get-InputIdentity took a plain APK and a bundle at once.'
    Assert-Throws { Get-InputIdentity } '*not both or neither*' 'Get-InputIdentity named nothing.'
    Assert-Throws { Get-InputIdentity -Apks @($base, (& $apk 'base.apk' $two)) } '*names base.apk twice*' 'Get-InputIdentity took one name twice.'
    foreach ($badName in @('', 'base', 'a b.apk', "base.apk`napk $two x.apk", '../base.apk')) {
        Assert-Throws { Get-InputIdentity -Apks @((& $apk $badName $one)) } '*Not the name of an unpacked APK*' `
            "Get-InputIdentity took '$badName' for an APK's name."
    }
    # Digits have no case, so the upper-case digest needs letters to differ from a lower-case one.
    $upper = ('ab' * 32).ToUpperInvariant()
    Assert-Throws { Get-InputIdentity -Apks @((& $apk 'base.apk' $upper)) } '*lower-case hex*' 'Get-InputIdentity took a digest in upper case.'
    Assert-Throws { Get-TestRecordKey -Identity $upper } '*InputIdentity*' 'The applied record key took an input identity in upper case.'
    Assert-Throws { Get-HeldInputIdentity -Merged (Join-Path $keyRoot 'not-held.apk') } "*isn't a merge this process holds*" `
        'Get-HeldInputIdentity named a merge nothing holds.'
    $moved = @()
    foreach ($file in @($keyInputs.Values) + @($keyed | ForEach-Object { Join-Path $keyScripts $_ })) {
        $saved = [IO.File]::ReadAllBytes($file)
        try {
            [IO.File]::AppendAllText($file, "`nchanged")
            if ((Get-TestRecordKey) -ceq $baseKey) { $moved += Split-Path -Leaf $file }
        } finally { [IO.File]::WriteAllBytes($file, $saved) }
    }
    Assert-True ($moved.Count -eq 0) "Changing these inputs left the applied record key as it was: $($moved -join ', ')"
    Assert-True ((Get-TestRecordKey) -ceq $baseKey) 'The applied record key did not come back with its inputs.'
    Remove-Item -LiteralPath (Join-Path $keyScripts 'DexDiff.java') -Force
    Assert-Throws { Get-TestRecordKey } '*without the verifier file DexDiff.java*' 'A key was made without DexDiff.java.'
    # A record that names another key, or none, is never handed back.
    $store = Join-Path $keyRoot 'store'
    New-Item -ItemType Directory -Path (Join-Path $store $baseKey) -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $store "$baseKey/record.json") -Encoding ASCII -Value ('{"schema":1,"key":"' + ('0' * 64) + '"}')
    Assert-True ($null -eq (Find-AppliedRecord -Store $store -Key $baseKey 3> $null)) 'A record naming another key was handed back.'
    Assert-True ($null -eq (Find-AppliedRecord -Store $store -Key ('1' * 64))) 'A key with no record found one.'
    # A record that holds together comes back with its patched APK and result report held to the
    # digests they were kept with: nothing can write to either until Close-AppliedRecord, and the
    # paths handed on are where the handles are. A record naming no digest, or another one, for
    # either file is passed over.
    $keptDir = Join-Path $store $baseKey
    $keptApk = Join-Path $keptDir 'patched.apk'
    $keptResult = Join-Path $keptDir 'result.json'
    [IO.File]::WriteAllText($keptApk, 'stand-in patched APK')
    [IO.File]::WriteAllText($keptResult, '{}')
    $keptDigest = (Get-FileHash -LiteralPath $keptApk -Algorithm SHA256).Hash.ToLowerInvariant()
    $resultDigest = (Get-FileHash -LiteralPath $keptResult -Algorithm SHA256).Hash.ToLowerInvariant()
    $openToWrite = { param([string]$Path) [System.IO.File]::Open($Path, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Write,
            [System.IO.FileShare]'ReadWrite, Delete').Dispose() }
    $writeRecord = { param([string]$Patched, [string]$Result)
        Set-Content -LiteralPath (Join-Path $keptDir 'record.json') -Encoding ASCII `
            -Value ('{"schema":1,"key":"' + $baseKey + '","patchedSha256":"' + $Patched + '","resultSha256":"' + $Result + '"}') }
    foreach ($digestCase in @(
            @{ Patched = ''; Result = $resultDigest; Says = '*names no patched APK digest*' },
            @{ Patched = ('0' * 64); Result = $resultDigest; Says = '*its patched APK changed after it was kept*' },
            @{ Patched = $keptDigest; Result = ''; Says = '*names no result report digest*' },
            @{ Patched = $keptDigest; Result = ('0' * 64); Says = '*its result report changed after it was kept*' })) {
        & $writeRecord $digestCase.Patched $digestCase.Result
        $said = @(Find-AppliedRecord -Store $store -Key $baseKey 3>&1)
        $warned = @($said | Where-Object { $_ -is [System.Management.Automation.WarningRecord] })
        $handed = @($said | Where-Object { $null -ne $_ -and $_ -isnot [System.Management.Automation.WarningRecord] })
        Assert-True ($handed.Count -eq 0 -and $warned.Count -eq 1 -and "$($warned[0])" -like $digestCase.Says) `
            "A record with digests '$($digestCase.Patched)' and '$($digestCase.Result)' was handed back, or not said: $($said -join '; ')"
        # Passed over, it holds nothing: the patched APK held before the report failed is let go,
        # and so is a report that didn't hash to its digest.
        & $openToWrite $keptApk
        & $openToWrite $keptResult
    }
    & $writeRecord $keptDigest $resultDigest
    $found = Find-AppliedRecord -Store $store -Key $baseKey
    try {
        Assert-True ($null -ne $found -and $null -ne $found.Handle -and $null -ne $found.ResultHandle -and
            [IO.Path]::GetFullPath($found.PatchedApk) -eq [IO.Path]::GetFullPath((Resolve-Path -LiteralPath $keptApk).Path) -and
            [IO.Path]::GetFullPath($found.Result) -eq [IO.Path]::GetFullPath((Resolve-Path -LiteralPath $keptResult).Path)) `
            "Find-AppliedRecord did not hand back the kept APK and report held, by the paths their handles are at: $($found.PatchedApk), $($found.Result)"
        foreach ($heldFile in @($keptApk, $keptResult)) {
            $turnedAway = $null
            try { & $openToWrite $heldFile } catch { $turnedAway = $_.Exception.GetBaseException() }
            Assert-True ($turnedAway -is [System.IO.IOException] -and $turnedAway.HResult -eq -2147024864) `
                "$(Split-Path -Leaf $heldFile) could be opened to write while Find-AppliedRecord held it: $turnedAway"
        }
        Assert-True ((Get-Content -LiteralPath $found.Result -Raw).Trim() -eq '{}') 'The held result report could not be read where it was handed on.'
    } finally { Close-AppliedRecord -Record $found }
    Assert-True ($null -eq $found.Handle -and $null -eq $found.ResultHandle) 'Close-AppliedRecord left the kept APK or report held.'
    & $openToWrite $keptApk
    & $openToWrite $keptResult
    Close-AppliedRecord -Record $null
} finally {
    Remove-Item -LiteralPath $keyRoot -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host '[scripts] applied record key contracts passed'

# --- split bundle callers ----------------------------------------------------------------------
#
# The morphe CLI merges an .apkm's splits into one APK before it patches, and since 1.17.0 deletes
# that merge when it's done. The patched manifest and resource table have to be compared with the
# merge, not with the base APK: the merge itself moves the manifest, and base.apk lacks every
# resource the splits carry. So the receipt builder and verify-all-patches.ps1 merge first
# (Get-MergedApk) and hand the CLI the merge, and both are run against exactly that in the release
# root section below, a merge that yields nothing among the cases. Every caller that reads the
# manifest facts out of a bundle goes through Get-BaseApk, and no caller looks for a merge the CLI
# left behind: there is none to find.
foreach ($name in @('build-release-receipt.ps1', 'verify-all-patches.ps1', 'verify-injected-registers.ps1')) {
    Assert-True ((Get-Content -LiteralPath (Join-Path $PSScriptRoot $name) -Raw) -match 'Get-BaseApk -Apk') `
        "$name reads a bundle without taking its base APK out first."
}
foreach ($name in @('build-release-receipt.ps1', 'verify-all-patches.ps1')) {
    $text = Get-Content -LiteralPath (Join-Path $PSScriptRoot $name) -Raw
    Assert-True ($text -match '(?m)^[^#\r\n]*\$patchInput = Get-MergedApk -Apk ' -and $text -notmatch '\*-merged\.apk') `
        "$name does not merge a bundle before it patches, or still looks for the merge the CLI deletes."
}

# Every script that takes a fixture or an APK straight goes through Get-MergedApk, which holds each
# APK to Tumblr's declared signer before anything is merged, and none runs the unpack, lock or
# merge steps itself: those run unchecked only in the resource table test, on APKs aapt2 builds
# there. Get-MergedApk has no switch, so nothing can ask it to skip the check, and in each script
# it comes before the CLI patches, a kept APK is signed, a kept run is looked up or the clean side
# is compared. Assert-AuthenticInput runs the same checks with nothing merged, so the receipt
# builder can refuse its whole fixture list first; the steps it opens and closes stay in common.ps1.
$checkedSteps = @('Expand-SplitBundle', 'Copy-ApkToSplitDirectory', 'Lock-SplitFiles', 'Invoke-SplitMerge', 'Assert-SplitsAuthentic',
    'Open-AuthenticInput', 'Close-AuthenticInput')
foreach ($script in @(Get-ChildItem -LiteralPath $PSScriptRoot -Filter '*.ps1' -File |
        Where-Object { $_.Name -ne 'common.ps1' -and $_.Name -notlike 'test-*' })) {
    $scriptAst = [System.Management.Automation.Language.Parser]::ParseFile($script.FullName, [ref]$null, [ref]$null)
    $direct = @($scriptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and
            $checkedSteps -contains $node.GetCommandName() }, $true))
    Assert-True ($direct.Count -eq 0) `
        "$($script.Name) calls $(@($direct | ForEach-Object { $_.GetCommandName() }) -join ', ') itself instead of going through Get-MergedApk."
    # What was checked about a merge is kept in the process, with the handle that holds it, and
    # only common.ps1 reads or writes that table.
    $table = @($scriptAst.FindAll({ param($node)
            ($node -is [System.Management.Automation.Language.CommandAst] -and $node.GetCommandName() -eq 'Get-HeldMerges') -or
            ($node -is [System.Management.Automation.Language.VariableExpressionAst] -and $node.VariablePath.UserPath -match '(?i)HushTumblrHeldMerges') }, $true))
    Assert-True ($table.Count -eq 0) "$($script.Name) reads or writes the table of merges this process holds, which is common.ps1's alone."
}
# Another process of the same user can write to anything this one can, so Get-MergedApk hands the
# merge back held: opened so nothing can write to it, and kept that way through the patch run,
# the signing and every check that reads it. Each script lets go of it once, in a finally, since a
# held file can't be deleted, and reads it nowhere after that. The merger does its steps through
# files it holds rather than by a path a second time: it never hands the folder back to the
# library to list, opens what it writes as new files that other processes can't write or delete,
# and prints the digest of what it wrote. And nothing that vouches for a merge reads the record
# beside one, since whoever could write the merge could write the record to match.
foreach ($release in @(@{ Name = 'patch-for-device.ps1'; Variable = 'patchInput' }, @{ Name = 'build-release-receipt.ps1'; Variable = 'patchInput' },
        @{ Name = 'verify-all-patches.ps1'; Variable = 'patchInput' }, @{ Name = 'verify-injected-registers.ps1'; Variable = 'CleanMerged' })) {
    $scriptAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot $release.Name), [ref]$null, [ref]$null)
    $closes = @($scriptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and
            $node.GetCommandName() -eq 'Close-MergedApk' }, $true))
    $inFinally = @($closes | Where-Object {
            $found = $false
            for ($parent = $_.Parent; $null -ne $parent; $parent = $parent.Parent) {
                if ($parent -is [System.Management.Automation.Language.TryStatementAst] -and $null -ne $parent.Finally -and
                        $_.Extent.StartOffset -ge $parent.Finally.Extent.StartOffset -and
                        $_.Extent.EndOffset -le $parent.Finally.Extent.EndOffset) { $found = $true }
            }
            $found })
    Assert-True ($closes.Count -eq 1 -and $inFinally.Count -eq 1 -and $closes[0].Extent.Text -ceq "Close-MergedApk -Merged `$$($release.Variable)") `
        "$($release.Name) does not let go of the merge Get-MergedApk handed it once, in a finally."
    $readsAfter = @($scriptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.VariableExpressionAst] -and
            $node.VariablePath.UserPath -eq $release.Variable -and $node.Extent.StartOffset -gt $closes[0].Extent.EndOffset }, $true))
    Assert-True ($readsAfter.Count -eq 0) "$($release.Name) reads the merge after it has let go of it, when anything could have been written there."
}
$mergerText = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'MergeSplits.java') -Raw
$mergerCode = [regex]::Replace($mergerText, '(?s)/\*.*?\*/|//[^\r\n]*', '')
Assert-True ($mergerCode -notmatch 'loadApkDirectory|loadApkFile|\.merge\(' -and
    $mergerCode -match 'NOSHARE_READ' -and $mergerCode -match 'NOSHARE_WRITE' -and $mergerCode -match 'NOSHARE_DELETE' -and
    @([regex]::Matches($mergerCode, 'StandardOpenOption\.CREATE_NEW')).Count -eq 2 -and
    $mergerCode -notmatch 'StandardOpenOption\.(CREATE|TRUNCATE_EXISTING|APPEND)\b' -and
    $mergerCode -match 'System\.out\.println\("\[merge\] sha256 " \+ digest\)') `
    'MergeSplits.java hands the folder or a path back to the library to read, writes into a file that was already there, or does not print the digest of what it wrote.'
$commonAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot 'common.ps1'), [ref]$null, [ref]$null)
foreach ($vouching in 'Get-MergedApk', 'Assert-AuthenticMerge', 'Open-AuthenticInput', 'Invoke-SplitMerge') {
    $body = @($commonAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.FunctionDefinitionAst] -and
            $node.Name -eq $vouching }, $true))
    Assert-True ($body.Count -eq 1) "common.ps1 does not define $vouching once."
    $readers = @($body[0].Body.FindAll({ param($node)
            ($node -is [System.Management.Automation.Language.CommandAst] -and
                @('Get-Content', 'ConvertFrom-Json', 'Import-Clixml') -contains $node.GetCommandName()) -or
            ($node -is [System.Management.Automation.Language.InvokeMemberExpressionAst] -and
                $node.Member.Extent.Text -match '^(ReadAllText|ReadAllBytes|ReadAllLines|OpenText)$') }, $true))
    Assert-True ($readers.Count -eq 0) "$vouching reads a file's word for where a merge came from: $(@($readers | ForEach-Object { $_.Extent.Text }) -join '; ')"
}
$mergeCommand = Get-Command -Name Get-MergedApk -CommandType Function
$mergeParameters = @($mergeCommand.Parameters.Keys | Where-Object {
        [System.Management.Automation.Cmdlet]::CommonParameters -notcontains $_ -and
        [System.Management.Automation.Cmdlet]::OptionalCommonParameters -notcontains $_ } | Sort-Object)
Assert-True (($mergeParameters -join ',') -ceq 'Aapt2,Apk,DesktopJar,Destination,Java,PackageName,Signers' -and
    @($mergeParameters | Where-Object { $mergeCommand.Parameters[$_].SwitchParameter -or
        @($mergeCommand.Parameters[$_].Attributes | Where-Object {
            $_ -is [System.Management.Automation.ParameterAttribute] -and $_.Mandatory }).Count -eq 0 }).Count -eq 0) `
    "Get-MergedApk takes something other than its seven mandatory values, a switch to skip the signer check among them: $($mergeParameters -join ', ')"
function Get-FirstCommandOffset($ScriptAst, [scriptblock]$Match) {
    $hits = @($ScriptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and (& $Match $node) }, $true) |
        Sort-Object { $_.Extent.StartOffset })
    if ($hits.Count -eq 0) { return -1 }
    return $hits[0].Extent.StartOffset
}
$isMerge = { param($node) $node.GetCommandName() -eq 'Get-MergedApk' }
$isCliPatch = { param($node) $node.Extent.Text -match "^&\s*\`$Java\s+'?-jar'?\s" }
$isKeptLookup = { param($node) $node.GetCommandName() -eq 'Find-AppliedRecord' }
$isKeptSign = { param($node) $node.Extent.Text -match '^&\s*\$apksigner\s+sign\s' }
foreach ($order in @(
        @{ Name = 'patch-for-device.ps1'; After = @(@{ What = 'a kept run is looked up'; Match = $isKeptLookup },
            @{ What = 'a kept APK is signed'; Match = $isKeptSign }, @{ What = 'the CLI patches'; Match = $isCliPatch }) },
        @{ Name = 'build-release-receipt.ps1'; After = @(@{ What = 'the CLI patches'; Match = $isCliPatch }) },
        @{ Name = 'verify-all-patches.ps1'; After = @(@{ What = 'a kept run is looked up'; Match = $isKeptLookup },
            @{ What = 'the CLI patches'; Match = $isCliPatch }) },
        @{ Name = 'verify-injected-registers.ps1'; After = @(
            @{ What = 'the merge is held to what was checked'; Match = { param($node) $node.GetCommandName() -eq 'Assert-AuthenticMerge' } },
            @{ What = 'DexDiff compares the clean side'; Match = { param($node) $node.GetCommandName() -eq 'Invoke-DexDiff' } }) })) {
    $scriptPath = Join-Path $PSScriptRoot $order.Name
    $scriptAst = [System.Management.Automation.Language.Parser]::ParseFile($scriptPath, [ref]$null, [ref]$null)
    $calls = @($scriptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and
            $node.GetCommandName() -eq 'Get-MergedApk' }, $true))
    Assert-True ($calls.Count -eq 1) "$($order.Name) doesn't merge through exactly one Get-MergedApk call."
    $bound = @($calls[0].CommandElements | Where-Object { $_ -is [System.Management.Automation.Language.CommandParameterAst] } |
        ForEach-Object { $_.ParameterName })
    foreach ($parameter in @('Aapt2', 'PackageName', 'Signers')) {
        Assert-True ($bound -contains $parameter) "$($order.Name) calls Get-MergedApk without -$parameter."
    }
    $mergeAt = Get-FirstCommandOffset $scriptAst $isMerge
    foreach ($later in $order.After) {
        $laterAt = Get-FirstCommandOffset $scriptAst $later.Match
        Assert-True ($laterAt -gt $mergeAt) "In $($order.Name), $($later.What) before Get-MergedApk has checked the APKs, or never."
    }
}
# What each of the three decided on before the merge, the build and whether it is forced, was read
# off a base APK nothing held. Each holds that to the merge once (Assert-SameBuild), after
# Get-MergedApk has handed the merge back and before the build is acted on.
foreach ($decided in @(
        @{ Name = 'patch-for-device.ps1'; Before = @($isKeptLookup, $isKeptSign, $isCliPatch) },
        @{ Name = 'build-release-receipt.ps1'; Before = @($isCliPatch) },
        @{ Name = 'verify-all-patches.ps1'; Before = @($isKeptLookup, $isCliPatch) })) {
    $scriptAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot $decided.Name), [ref]$null, [ref]$null)
    $sameBuild = @($scriptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and
            $node.GetCommandName() -eq 'Assert-SameBuild' }, $true))
    Assert-True ($sameBuild.Count -eq 1 -and $sameBuild[0].Extent.StartOffset -gt (Get-FirstCommandOffset $scriptAst $isMerge)) `
        "$($decided.Name) does not hold the build it read first to the merge once, after Get-MergedApk."
    foreach ($use in $decided.Before) {
        Assert-True ((Get-FirstCommandOffset $scriptAst $use) -gt $sameBuild[0].Extent.StartOffset) `
            "$($decided.Name) acts on the build it read first before it has held it to the merge (Assert-SameBuild)."
    }
}
# A kept run is looked up by what the held merge was made from, never by a path hashed after the
# merge let the input go: each of the two that reuse one keys it with -InputIdentity taken from the
# merge it holds, once. The kept APK comes back held (Find-AppliedRecord), into $recorded, and each
# lets go of it once, in a finally, before the merge. The receipt reads none (below).
function Get-NamedCommands($ScriptAst, [string]$Name) {
    @($ScriptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and
            $node.GetCommandName() -eq $Name }, $true))
}
foreach ($keyedScript in @('patch-for-device.ps1', 'verify-all-patches.ps1')) {
    $scriptAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot $keyedScript), [ref]$null, [ref]$null)
    $keys = Get-NamedCommands $scriptAst 'Get-AppliedRecordKey'
    $named = @($keys | ForEach-Object { $_.CommandElements } | Where-Object { $_ -is [System.Management.Automation.Language.CommandParameterAst] } |
        ForEach-Object { $_.ParameterName })
    $identityArgument = $null
    if ($keys.Count -eq 1) {
        $elements = @($keys[0].CommandElements)
        for ($i = 0; $i -lt $elements.Count - 1; $i++) {
            if ($elements[$i] -is [System.Management.Automation.Language.CommandParameterAst] -and $elements[$i].ParameterName -eq 'InputIdentity') {
                $identityArgument = $elements[$i + 1].Extent.Text
            }
        }
    }
    Assert-True ($keys.Count -eq 1 -and $named -notcontains 'Fixture' -and $identityArgument -ceq '(Get-HeldInputIdentity -Merged $patchInput)') `
        "$keyedScript doesn't key its kept run once on what the merge it holds was made from: $identityArgument"
    $lookups = Get-NamedCommands $scriptAst 'Find-AppliedRecord'
    $assigned = $null
    if ($lookups.Count -eq 1) {
        for ($parent = $lookups[0].Parent; $null -ne $parent; $parent = $parent.Parent) {
            if ($parent -is [System.Management.Automation.Language.AssignmentStatementAst]) { $assigned = $parent.Left.Extent.Text; break }
        }
    }
    Assert-True ($lookups.Count -eq 1 -and $assigned -ceq '$recorded') "$keyedScript doesn't look a kept run up once, into `$recorded."
    $closes = Get-NamedCommands $scriptAst 'Close-AppliedRecord'
    $closeInFinally = @($closes | Where-Object {
            $found = $false
            for ($parent = $_.Parent; $null -ne $parent; $parent = $parent.Parent) {
                if ($parent -is [System.Management.Automation.Language.TryStatementAst] -and $null -ne $parent.Finally -and
                    $_.Extent.StartOffset -ge $parent.Finally.Extent.StartOffset -and $_.Extent.EndOffset -le $parent.Finally.Extent.EndOffset) { $found = $true }
            }
            $found -and $_.Extent.Text -ceq 'Close-AppliedRecord -Record $recorded' })
    $mergeClose = Get-NamedCommands $scriptAst 'Close-MergedApk'
    Assert-True ($closeInFinally.Count -eq 1 -and $mergeClose.Count -eq 1 -and
        $closeInFinally[0].Extent.StartOffset -lt $mergeClose[0].Extent.StartOffset) `
        "$keyedScript does not let go of the kept APK Find-AppliedRecord held, once in a finally before the merge."
}
# A kept run's report is checked through the path its held handle is at, never a copy of it:
# patch-for-device.ps1 copied it into its output folder and checked the copy, which nothing held.
foreach ($reader in @(@{ Name = 'patch-for-device.ps1'; Reads = '$reportPath' }, @{ Name = 'verify-all-patches.ps1'; Reads = '$recorded.Result' })) {
    $readerAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot $reader.Name), [ref]$null, [ref]$null)
    $reads = @(Get-NamedCommands $readerAst 'Get-Content' | ForEach-Object {
            $elements = @($_.CommandElements)
            for ($i = 0; $i -lt $elements.Count - 1; $i++) {
                if ($elements[$i] -is [System.Management.Automation.Language.CommandParameterAst] -and $elements[$i].ParameterName -eq 'LiteralPath') {
                    $elements[$i + 1].Extent.Text
                }
            } })
    $fromKept = @($readerAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                $node.Left.Extent.Text -ceq $reader.Reads -and $node.Right.Extent.Text -ceq '$recorded.Result' }, $true))
    Assert-True ($reads -ccontains $reader.Reads -and ($reader.Reads -ceq '$recorded.Result' -or $fromKept.Count -eq 1) -and
        ($reader.Name -ne 'patch-for-device.ps1' -or $reads -cnotcontains '$result')) `
        "$($reader.Name) doesn't check a kept run's report through the path Find-AppliedRecord holds: $($reads -join ', ')"
}
# In patch-for-device.ps1 the report path is set in the kept-run if alone: the held kept report
# where a kept run is used, and in the else branch the path the CLI's report is held at, or none
# where the CLI left none to hold (the report check then fails, whatever is at the path later).
# Nowhere after.
$deviceAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot 'patch-for-device.ps1'), [ref]$null, [ref]$null)
$reportSets = @($deviceAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
            $node.Left.Extent.Text -ceq '$reportPath' }, $true))
$reportBranches = @($deviceAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.IfStatementAst] -and
            $node.Clauses.Count -eq 1 -and $null -ne $node.ElseClause }, $true) | Where-Object {
        $branch = $_
        $kept = @($reportSets | Where-Object { $_.Right.Extent.Text -ceq '$recorded.Result' -and
                $_.Extent.StartOffset -ge $branch.Clauses[0].Item2.Extent.StartOffset -and $_.Extent.EndOffset -le $branch.Clauses[0].Item2.Extent.EndOffset })
        $own = @($reportSets | Where-Object { $_.Extent.StartOffset -ge $branch.ElseClause.Extent.StartOffset -and
                $_.Extent.EndOffset -le $branch.ElseClause.Extent.EndOffset } | ForEach-Object { $_.Right.Extent.Text })
        $kept.Count -eq 1 -and ($own -join '; ') -ceq 'Get-HeldPath -Stream $resultHandle; $null' })
Assert-True ($reportSets.Count -eq 3 -and $reportBranches.Count -eq 1) `
    "patch-for-device.ps1 sets the report path outside the branches of the kept-run if: $(@($reportSets | ForEach-Object { $_.Extent.Text }) -join '; ')"
# What the CLI wrote is held from the moment it exits: the patched APK and the report are opened
# by Open-HeldFile before anything reads them, and from then on read by the path the handle is at.
# patch-for-device.ps1 holds the APK after the kept-run if, so apksigner's output is held too.
foreach ($writer in @(
        @{ Name = 'verify-all-patches.ps1'; Apk = '$out'; Report = '$result' },
        @{ Name = 'build-release-receipt.ps1'; Apk = '$out'; Report = '$resultPath' },
        @{ Name = 'patch-for-device.ps1'; Apk = '$out'; Report = '$result' })) {
    $writerAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot $writer.Name), [ref]$null, [ref]$null)
    $cliAt = @($writerAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and (& $isCliPatch $node) }, $true) |
        ForEach-Object { $_.Extent.EndOffset } | Sort-Object)
    # The first report check after the CLI: verify-all checks a kept run's report before it.
    $firstRead = if ($cliAt.Count -eq 1) {
        Get-FirstCommandOffset $writerAst { param($node) $node.GetCommandName() -eq 'Test-PatchingReport' -and $node.Extent.StartOffset -gt $cliAt[0] }
    } else { -1 }
    $unheld = @()
    foreach ($held in @(@{ Path = $writer.Apk; Handle = '$outHandle' }, @{ Path = $writer.Report; Handle = '$resultHandle' })) {
        $opens = @($writerAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                    $node.Left.Extent.Text -ceq $held.Handle -and $node.Right.Extent.Text -clike "Open-HeldFile -Path $($held.Path) -What *" }, $true))
        $moves = @($writerAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                    $node.Left.Extent.Text -ceq $held.Path -and $node.Right.Extent.Text -ceq "Get-HeldPath -Stream $($held.Handle)" }, $true))
        if ($opens.Count -ne 1 -or $moves.Count -ne 1 -or $cliAt.Count -ne 1 -or $firstRead -lt 0 -or
            $opens[0].Extent.StartOffset -lt $cliAt[0] -or $moves[0].Extent.StartOffset -lt $opens[0].Extent.EndOffset -or
            $moves[0].Extent.EndOffset -gt $firstRead) { $unheld += $held.Path }
    }
    if ($writer.Name -eq 'patch-for-device.ps1') {
        # The device run's report comes in a $reportPath of its own, checked above.
        $unheld = @($unheld | Where-Object { $_ -cne '$result' })
        $deviceReportOpen = @($writerAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                    $node.Left.Extent.Text -ceq '$resultHandle' -and $node.Right.Extent.Text -clike 'Open-HeldFile -Path $result -What *' }, $true))
        if ($deviceReportOpen.Count -ne 1 -or $deviceReportOpen[0].Extent.StartOffset -lt $cliAt[0]) { $unheld += '$result' }
    }
    $disposed = @($writerAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.ForEachStatementAst] -and
                $node.Condition.Extent.Text -clike '@($outHandle, $resultHandle*)' -and $node.Parent.Parent -is [System.Management.Automation.Language.TryStatementAst] -and
                $node.Parent -eq $node.Parent.Parent.Finally }, $true))
    Assert-True ($unheld.Count -eq 0 -and $disposed.Count -eq 1) `
        "$($writer.Name) reads what the CLI wrote before it holds it, or never lets it go: $($unheld -join ', ') ($($disposed.Count) finally disposing the handles)"
}
# An output the CLI didn't leave to hold is none: the report check after the CLI gets the APK's
# path only when $outHandle holds it, and verify-all reads the report only when $resultHandle
# holds it. Neither handle is let go or set to anything else before the finally checked above,
# since from then on its path is one anything can put a file at.
foreach ($name in 'verify-all-patches.ps1', 'build-release-receipt.ps1', 'patch-for-device.ps1') {
    $writerAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot $name), [ref]$null, [ref]$null)
    $cliEnd = @($writerAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and (& $isCliPatch $node) }, $true) |
        ForEach-Object { $_.Extent.EndOffset })
    $outputPaths = @(Get-NamedCommands $writerAst 'Test-PatchingReport' | Where-Object { $cliEnd.Count -eq 1 -and $_.Extent.StartOffset -gt $cliEnd[0] } |
        ForEach-Object {
            $elements = @($_.CommandElements)
            $given = @(for ($i = 0; $i -lt $elements.Count - 1; $i++) {
                    if ($elements[$i] -is [System.Management.Automation.Language.CommandParameterAst] -and $elements[$i].ParameterName -eq 'OutputPath') {
                        $elements[$i + 1].Extent.Text } })
            if ($given.Count -eq 1) { $given[0] } else { "$($given.Count) -OutputPath" } })
    Assert-True ($outputPaths.Count -eq 1 -and $outputPaths[0] -ceq '$(if ($null -ne $outHandle) { $out } else { '''' })') `
        "$name hands the report check an APK path it doesn't hold: $($outputPaths -join '; ')"
    $handleUses = @($writerAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.MemberExpressionAst] -and
                $node.Expression.Extent.Text -cin @('$outHandle', '$resultHandle') -and $node.Member.Extent.Text -cnotin @('Position', 'Read') }, $true) |
        ForEach-Object { $_.Extent.Text })
    $handleSets = @($writerAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                $node.Left.Extent.Text -cin @('$outHandle', '$resultHandle') }, $true) | ForEach-Object { $_.Extent.Text } |
        Where-Object { $_ -cnotmatch '^\$(outHandle|resultHandle) = (\$null|Open-HeldFile -Path \$\w+ -What .+)\z' })
    Assert-True ($handleUses.Count -eq 0 -and $handleSets.Count -eq 0) `
        "$name lets go of a held output, or sets its handle, outside the finally that disposes it: $(@($handleUses) + @($handleSets) -join '; ')"
}
$verifyReportReads = @(Get-NamedCommands ([System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot 'verify-all-patches.ps1'),
            [ref]$null, [ref]$null)) 'Get-Content' | Where-Object { $_.Extent.Text -clike 'Get-Content -LiteralPath $result *' } | ForEach-Object {
        $guard = $_
        while ($null -ne $guard -and $guard -isnot [System.Management.Automation.Language.IfStatementAst]) { $guard = $guard.Parent }
        if ($guard) { $guard.Clauses[0].Item1.Extent.Text } else { '(no if)' } })
Assert-True (($verifyReportReads -join '; ') -ceq '$null -ne $resultHandle') `
    "verify-all-patches.ps1 reads the CLI's report without its handle holding it: $($verifyReportReads -join '; ')"
# Each resource check holds what the table and its files changed to resource-delta-allowlist.txt,
# with the run's patches and the ones they pull in as HUSHTUMBLR_PATCH_SELECTION, set in the try
# around the call and put back in its finally.
foreach ($resourceRun in @(@{ Name = 'verify-all-patches.ps1'; Names = '$names' }, @{ Name = 'build-release-receipt.ps1'; Names = '$patchNames' },
        @{ Name = 'patch-for-device.ps1'; Names = '$names' })) {
    $runAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot $resourceRun.Name), [ref]$null, [ref]$null)
    $selection = '(@(' + $resourceRun.Names + ') + @($dependencyNames)) -join "`n"'
    $resourceCalls = @($runAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and
                $node.Extent.Text -match '^&[^\r\n]*ResourceTableCheck\.java' }, $true))
    $wired = @($resourceCalls | Where-Object {
            $call = $_
            $around = $call
            while ($null -ne $around -and $around -isnot [System.Management.Automation.Language.TryStatementAst]) { $around = $around.Parent }
            $setsIn = { param($Block) if ($null -eq $Block) { return '' }
                @($Block.FindAll({ param($node) $node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                            $node.Left.Extent.Text -ceq '$env:HUSHTUMBLR_PATCH_SELECTION' }, $true) | ForEach-Object { $_.Right.Extent.Text }) -join '; ' }
            $null -ne $around -and @($call.CommandElements)[-1].Extent.Text -ceq "(Join-Path `$PSScriptRoot 'resource-delta-allowlist.txt')" -and
                (& $setsIn $around.Body) -ceq $selection -and (& $setsIn $around.Finally) -ceq '$selectionBefore' })
    Assert-True ($resourceCalls.Count -eq 1 -and $wired.Count -eq 1) `
        "$($resourceRun.Name) doesn't hold its resource check to resource-delta-allowlist.txt for the patches it selected."
}
# The allowlist's sections are [rebuild] and patches the catalog lists.
$resourceSections = @(Get-Content -LiteralPath (Join-Path $PSScriptRoot 'resource-delta-allowlist.txt') |
    Where-Object { $_ -match '^\[(.+)\]$' } | ForEach-Object { $Matches[1] })
$catalogNames = @($catalog.patches | ForEach-Object { [string]$_.name })
$strangeSections = @($resourceSections | Where-Object { $_ -cne 'rebuild' -and $catalogNames -cnotcontains $_ })
Assert-True ($resourceSections -ccontains 'rebuild' -and $strangeSections.Count -eq 0) `
    "resource-delta-allowlist.txt has sections for no patch the catalog lists: $($strangeSections -join ', ')"
# The dex delta allowlist's sections are patches the catalog lists: alternatives joined by " | ",
# each one patch or several that write the code together joined by " + ". The check is tried on
# made-up headers too, so a header DexDiff reads can't fail it and a misspelled one can't pass.
$dexSections = @(Get-Content -LiteralPath (Join-Path $PSScriptRoot 'dex-delta-allowlist.txt') |
    Where-Object { $_ -match '^\[(.+)\]$' } | ForEach-Object { $Matches[1] })
$isStrangeDexSection = { param([string]$Header)
    @($Header -split ' \| ' | ForEach-Object { $_ -split ' \+ ' } | Where-Object { $catalogNames -cnotcontains $_ }).Count -gt 0
}
$firstName, $secondName = $catalogNames[0], $catalogNames[1]
foreach ($case in @(@("$firstName + $secondName", $false), @("$firstName | $firstName + $secondName", $false),
        @("$firstName+$secondName", $true), @("$firstName + Not a patch", $true), @("Not a patch | $secondName", $true))) {
    Assert-True ((& $isStrangeDexSection $case[0]) -eq $case[1]) `
        "The dex allowlist header check read [$($case[0])] as $(if ($case[1]) { 'naming only catalog patches' } else { 'naming a patch the catalog lacks' })."
}
$strangeDexSections = @($dexSections | Where-Object { & $isStrangeDexSection $_ })
Assert-True ($dexSections.Count -gt 0 -and $strangeDexSections.Count -eq 0) `
    "dex-delta-allowlist.txt has sections naming a patch the catalog doesn't list: $($strangeDexSections -join ', ')"
# Each script that patches hands the verifier the bundle it patched with by the path of a handle it
# holds for the whole run, and the verifier hands DexDiff the path of its own hold, so a bundle
# swapped after the patch can't stand in for the one the patcher read. Each is also tried with that
# wiring taken out, so the check can't pass by passing everything.
$holdsBundle = { param([string]$Text, [string]$Variable, [bool]$Hands)
    $ast = [System.Management.Automation.Language.Parser]::ParseInput($Text, [ref]$null, [ref]$null)
    $assignments = @($ast.FindAll({ param($node) $node -is [System.Management.Automation.Language.AssignmentStatementAst] }, $true))
    $assigned = @($assignments | Where-Object { $_.Left.Extent.Text -eq $Variable })
    $heldAt = @($assigned | Where-Object { $_.Right.Extent.Text -ceq 'Get-HeldPath -Stream $bundleHeld' })
    $opens = @($assignments | Where-Object { $_.Left.Extent.Text -ceq '$bundleHeld' -and $_.Right.Extent.Text -clike 'Open-HeldFile *' })
    $later = @(if ($heldAt.Count -eq 1) { $assigned | Where-Object { $_.Extent.StartOffset -gt $heldAt[0].Extent.StartOffset } })
    $disposed = @($ast.FindAll({ param($node) $node -is [System.Management.Automation.Language.TryStatementAst] }, $true) |
        Where-Object { $null -ne $_.Finally -and $_.Finally.Extent.Text -match '\$bundleHeld\b' }).Count -gt 0
    $handed = $true
    if ($Hands) {
        $calls = @($ast.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] }, $true) |
            Where-Object { $_.Extent.Text -match "^&\s*\(Join-Path \`$PSScriptRoot 'verify-injected-registers\.ps1'\)" })
        $handed = $calls.Count -eq 1 -and @(for ($k = 0; $k + 1 -lt $calls[0].CommandElements.Count; $k++) {
                $element = $calls[0].CommandElements[$k]
                if ($element -is [System.Management.Automation.Language.CommandParameterAst] -and $element.ParameterName -eq 'Bundle' -and
                    $calls[0].CommandElements[$k + 1].Extent.Text -eq $Variable) { $true } }).Count -eq 1
    }
    $heldAt.Count -eq 1 -and $opens.Count -eq 1 -and $later.Count -eq 0 -and $disposed -and $handed
}
foreach ($bundleRun in @(@{ Name = 'verify-all-patches.ps1'; Variable = '$Bundle'; Hands = $true; Cut = ' -Bundle $Bundle' }
        @{ Name = 'patch-for-device.ps1'; Variable = '$bundle'; Hands = $true; Cut = ' -Bundle $bundle' }
        @{ Name = 'build-release-receipt.ps1'; Variable = '$Bundle'; Hands = $true; Cut = ' -Bundle $Bundle' }
        @{ Name = 'verify-injected-registers.ps1'; Variable = '$bundlePath'; Hands = $false; Cut = 'Get-HeldPath -Stream $bundleHeld'; Into = '$Bundle' })) {
    $runText = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot $bundleRun.Name))
    $cutText = $runText.Replace($bundleRun.Cut, [string]$bundleRun.Into)
    Assert-True ((& $holdsBundle $runText $bundleRun.Variable $bundleRun.Hands) -and $cutText -cne $runText -and
        -not (& $holdsBundle $cutText $bundleRun.Variable $bundleRun.Hands)) `
        "$($bundleRun.Name) doesn't hand on the bundle by the path of a handle it holds for the whole run, or the check passes it without that."
}
# A kept run is copied from the handles the run held, never from a path.
$verifyAllAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot 'verify-all-patches.ps1'), [ref]$null, [ref]$null)
$keepCalls = @(Get-NamedCommands $verifyAllAst 'Save-AppliedRecord' | ForEach-Object { $_.Extent.Text })
Assert-True ($keepCalls.Count -eq 1 -and $keepCalls[0] -clike '*-PatchedApk $outHandle*' -and $keepCalls[0] -clike '*-Result $resultHandle *') `
    "verify-all-patches.ps1 keeps a run from something other than its held handles: $($keepCalls -join '; ')"
# The receipt builder checks its whole fixture list before it merges any fixture.
$receiptAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot 'build-release-receipt.ps1'), [ref]$null, [ref]$null)
$fixtureCheckAt = Get-FirstCommandOffset $receiptAst { param($node) $node.GetCommandName() -eq 'Assert-AuthenticInput' }
Assert-True ($fixtureCheckAt -ge 0 -and $fixtureCheckAt -lt (Get-FirstCommandOffset $receiptAst $isMerge)) `
    'build-release-receipt.ps1 merges a fixture before it has checked every fixture (Assert-AuthenticInput), or never checks them.'
# It names each fixture by the digest the held merge was made from, never by hashing its path: the
# hashes it takes itself are the bundle's, which the scan has to find, and the extension payloads'
# inside it (Get-ExtensionPayloads, handed the bundle alone), and the target's source.sha256 is
# what Get-HeldSourceSha256 gives.
$sourceDigests = @(Get-NamedCommands $receiptAst 'Get-HeldSourceSha256' | ForEach-Object { $_.Extent.Text })
$receiptHashNodes = @(foreach ($name in 'Get-Sha256Hex', 'Get-FileHash', 'Get-StreamSha256') { Get-NamedCommands $receiptAst $name })
$receiptHashNodes += @($receiptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.InvokeMemberExpressionAst] -and
            $node.Member.Extent.Text -match '^(ComputeHash|HashData|TransformBlock|TransformFinalBlock)$' }, $true))
$payloadFunction = @($receiptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.FunctionDefinitionAst] -and
            $node.Name -ceq 'Get-ExtensionPayloads' }, $true))
$payloadCalls = @(Get-NamedCommands $receiptAst 'Get-ExtensionPayloads' | ForEach-Object { $_.Extent.Text })
$receiptHashes = @($receiptHashNodes | Where-Object { $payloadFunction.Count -ne 1 -or
        $_.Extent.StartOffset -lt $payloadFunction[0].Extent.StartOffset -or $_.Extent.EndOffset -gt $payloadFunction[0].Extent.EndOffset } |
    ForEach-Object { $_.Extent.Text })
Assert-True ($payloadFunction.Count -eq 1 -and ($payloadCalls -join '; ') -ceq 'Get-ExtensionPayloads -BundlePath $Bundle') `
    "build-release-receipt.ps1 hashes extension payloads of something other than the bundle: $($payloadCalls -join '; ')"
$sourceEntries = @($receiptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.HashtableAst] }, $true) |
    ForEach-Object { $_.KeyValuePairs } | Where-Object { $_.Item1.Extent.Text -ceq 'source' } | ForEach-Object { $_.Item2.Extent.Text })
$heldSourceEntries = @($sourceEntries | Where-Object {
        $_ -match '(?m)^\s*sha256\s*=\s*\(Get-HeldSourceSha256 -Merged \$patchInput\)\.ToUpperInvariant\(\)\r?$' -and
        @([regex]::Matches($_, '(?m)^\s*sha256\s*=')).Count -eq 1 })
# The bundle an unsigned universal APK was trusted on is named the same way, from the held merge.
$vouchDigests = @(Get-NamedCommands $receiptAst 'Get-HeldSignedFormSha256' | ForEach-Object {
        $statement = $_
        while ($null -ne $statement -and $statement -isnot [System.Management.Automation.Language.AssignmentStatementAst]) { $statement = $statement.Parent }
        if ($statement) { $statement.Extent.Text } else { $_.Extent.Text } })
$vouchEntries = @($sourceEntries | Where-Object {
        $_ -match '(?m)^\s*signedFormSha256\s*=\s*if \(\$vouchedBy\) \{ \$vouchedBy\.ToUpperInvariant\(\) \} else \{ \$null \}\r?$' -and
        @([regex]::Matches($_, '(?m)^\s*signedFormSha256\s*=')).Count -eq 1 })
# And $vouchedBy is that and nothing else: set once and read twice, in that entry. A second
# assignment would name the bundle by whatever it computed.
$receiptTokens = $null
[void][System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot 'build-release-receipt.ps1'), [ref]$receiptTokens, [ref]$null)
$vouchTokens = @($receiptTokens | Where-Object { $_.Text -match 'vouchedBy' })
Assert-True (($vouchDigests -join '; ') -ceq '$vouchedBy = Get-HeldSignedFormSha256 -Merged $patchInput' -and $vouchEntries.Count -eq 1 -and
    $vouchTokens.Count -eq 3) `
    "build-release-receipt.ps1 doesn't name the bundle that vouched for a fixture by the held merge: $($vouchDigests -join '; ') ($($vouchTokens.Count) uses of `$vouchedBy)"
Assert-True ($sourceDigests.Count -eq 1 -and $sourceDigests[0] -ceq 'Get-HeldSourceSha256 -Merged $patchInput' -and
    ($receiptHashes -join '; ') -ceq 'Get-Sha256Hex -Path $Bundle' -and $sourceEntries.Count -eq 1 -and $heldSourceEntries.Count -eq 1) `
    ("build-release-receipt.ps1 doesn't name its fixtures by the held merge's input alone: $($sourceDigests + $receiptHashes -join '; ') " +
        "($($sourceEntries.Count) source entries, $($heldSourceEntries.Count) named by Get-HeldSourceSha256)")
# It never reads a kept run: a kept run is a record and an APK any program of the same user can
# write together, so it can't show which bundle made the APK, and the receipt is what a release is
# trusted on. Every fixture is patched and checked here, with no condition around any of the three.
$receiptReuse = @(foreach ($name in 'Get-AppliedRecordStore', 'Get-AppliedRecordKey', 'Find-AppliedRecord', 'Get-AppliedRecords', 'Close-AppliedRecord', 'Save-AppliedRecord') {
        Get-NamedCommands $receiptAst $name | ForEach-Object { $_.Extent.Text } })
$receiptReuse += @($receiptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.VariableExpressionAst] -and
            @('recorded', 'AppliedDir') -contains $node.VariablePath.UserPath }, $true) | ForEach-Object { $_.Extent.Text })
$receiptRuns = @($receiptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and
            ((& $isCliPatch $node) -or $node.Extent.Text -match "^&[^\r\n]*ResourceTableCheck\.java" -or
                $node.Extent.Text -match "^&\s*\(Join-Path \`$PSScriptRoot 'verify-injected-registers\.ps1'\)") }, $true))
$guardedRuns = @($receiptRuns | Where-Object {
        $inside = $false
        for ($parent = $_.Parent; $null -ne $parent; $parent = $parent.Parent) {
            if ($parent -is [System.Management.Automation.Language.IfStatementAst]) { $inside = $true }
        }
        $inside } | ForEach-Object { $_.Extent.Text })
Assert-True ($receiptReuse.Count -eq 0 -and $receiptRuns.Count -eq 3 -and $guardedRuns.Count -eq 0) `
    ("build-release-receipt.ps1 reads a kept run, or doesn't patch and check every fixture itself: " +
        "$($receiptReuse + $guardedRuns -join '; ') ($($receiptRuns.Count) of 3 runs found)")
# The release stage hands the receipt only parameters it has, so a release doesn't stop at a
# parameter the receipt dropped (-AppliedDir went with the kept-run reuse). Each is named in the
# call, so none can hide in a splatted table.
$receiptParameters = @($receiptAst.ParamBlock.Parameters | ForEach-Object { $_.Name.VariablePath.UserPath })
$releaseAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot 'release/release.ps1'), [ref]$null, [ref]$null)
$receiptCalls = @($releaseAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and
            $node.Extent.Text -match "^&\s*\(Join-Path \`$Root 'scripts/build-release-receipt\.ps1'\)" }, $true))
$unknownToReceipt = @($receiptCalls | ForEach-Object { $_.CommandElements } |
    Where-Object { ($_ -is [System.Management.Automation.Language.CommandParameterAst] -and $receiptParameters -notcontains $_.ParameterName) -or
        ($_ -is [System.Management.Automation.Language.VariableExpressionAst] -and $_.Splatted) } |
    ForEach-Object { $_.Extent.Text })
Assert-True ($receiptCalls.Count -eq 1 -and $unknownToReceipt.Count -eq 0) `
    "release.ps1 doesn't call build-release-receipt.ps1 once with parameters it has: $($unknownToReceipt -join ', ')"
# The verifier holds whatever merge it compares to the APKs that were checked, a merge it was
# handed included, so that check can't sit behind a condition.
$verifierAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot 'verify-injected-registers.ps1'),
    [ref]$null, [ref]$null)
$recordChecks = @($verifierAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and
        $node.GetCommandName() -eq 'Assert-AuthenticMerge' }, $true))
$conditional = @($recordChecks | Where-Object {
        $inside = $false
        for ($parent = $_.Parent; $null -ne $parent; $parent = $parent.Parent) {
            if ($parent -is [System.Management.Automation.Language.IfStatementAst] -or
                    $parent -is [System.Management.Automation.Language.LoopStatementAst] -or
                    $parent -is [System.Management.Automation.Language.SwitchStatementAst] -or
                    $parent -is [System.Management.Automation.Language.FunctionDefinitionAst] -or
                    $parent -is [System.Management.Automation.Language.ScriptBlockExpressionAst]) { $inside = $true }
        }
        $inside })
Assert-True ($recordChecks.Count -eq 1 -and $conditional.Count -eq 0) `
    'verify-injected-registers.ps1 does not hold the merge it compares to the APKs whose signer was checked on every run.'

# Every script that patches holds the APK it made to what a device with 16 KB pages needs
# (Assert-PageAlignment), against the stock APK the CLI was handed, once the CLI has patched. The
# device script also signs a kept APK itself, and zipalign can't put a signed APK right, so there
# the kept APK is held to it before apksigner signs and the signed one after. The release root
# section below runs all three against a zipalign that fails.
$isPageCheck = { param($node) $node.GetCommandName() -eq 'Assert-PageAlignment' }
foreach ($name in @('patch-for-device.ps1', 'build-release-receipt.ps1', 'verify-all-patches.ps1')) {
    $scriptAst = [System.Management.Automation.Language.Parser]::ParseFile((Join-Path $PSScriptRoot $name), [ref]$null, [ref]$null)
    $pageChecks = @($scriptAst.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and
            (& $isPageCheck $node) }, $true) | Sort-Object { $_.Extent.StartOffset })
    Assert-True ($pageChecks.Count -gt 0 -and $pageChecks[-1].Extent.StartOffset -gt (Get-FirstCommandOffset $scriptAst $isCliPatch) -and
        $pageChecks[-1].Extent.Text -match '-Apk \$out -Stock \$patchInput -Aapt2 \$Aapt2$') `
        "$name does not hold the APK it patched to the 16 KB page check, against the stock APK the CLI was handed."
    if ($name -eq 'patch-for-device.ps1') {
        $signAt = Get-FirstCommandOffset $scriptAst $isKeptSign
        Assert-True ($pageChecks.Count -eq 2 -and $pageChecks[0].Extent.StartOffset -lt $signAt -and
            $pageChecks[0].Extent.Text -match '-Apk \$recorded\.PatchedApk -Stock \$patchInput ' -and $pageChecks[1].Extent.StartOffset -gt $signAt) `
            'patch-for-device.ps1 does not hold a kept APK to the 16 KB page check before it signs it, and the signed APK after.'
    }
}
# patch-for-device.ps1 holds the APK it hands on to the certificate of -KeyAlias in -Keystore: once,
# by the path its handle is at, after the report check and before the copy to -OutputApk and the
# install. The certificate is read off the keystore by the path it's held at, before apksigner or
# the CLI signs with it. Each cut copy has to fail the rule.
$checksDeviceSigner = {
    param([string]$Text)
    $ast = [System.Management.Automation.Language.Parser]::ParseInput($Text, [ref]$null, [ref]$null)
    $named = { param([string]$Name) @($ast.FindAll({ param($node) $node -is [System.Management.Automation.Language.CommandAst] -and
                    $node.GetCommandName() -eq $Name }, $true)) }
    $signerReads = & $named 'Get-ApkSigners'
    $certificateReads = & $named 'Get-KeystoreCertificate'
    $assigned = { param([string]$Left, [string]$Right) @($ast.FindAll({ param($node) $node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
                    $node.Left.Extent.Text -ceq $Left -and $node.Right.Extent.Text -ceq $Right }, $true)) }
    $held = & $assigned '$out' 'Get-HeldPath -Stream $outHandle'
    $keystoreHeld = & $assigned '$Keystore' 'Get-HeldPath -Stream $keystoreHeld'
    $earlyRead = $Text.IndexOf('if (Test-Path -LiteralPath $Keystore -PathType Leaf) { . $readKeystore }')
    $signs = @($Text.IndexOf('& $apksigner sign '), $Text.IndexOf("'--keystore', `$Keystore"))
    $reportCheck = Get-FirstCommandOffset $ast { param($node) $node.GetCommandName() -eq 'Test-PatchingReport' }
    $install = Get-FirstCommandOffset $ast { param($node) $node.GetCommandName() -eq 'Install-HushAndroidApk' }
    $copy = $Text.IndexOf('$outputReservation.Write(')
    $keystoreHeld.Count -eq 1 -and $earlyRead -ge 0 -and @($signs | Where-Object { $_ -le $earlyRead }).Count -eq 0 -and
    $signerReads.Count -eq 1 -and $certificateReads.Count -eq 1 -and $held.Count -eq 1 -and $reportCheck -ge 0 -and $install -ge 0 -and $copy -ge 0 -and
        $signerReads[0].Extent.Text -cmatch '^Get-ApkSigners -Apk \$out -Apksigner ' -and
        $certificateReads[0].Extent.Text -cmatch '^Get-KeystoreCertificate -Keystore \$Keystore -Alias \$KeyAlias ' -and
        $signerReads[0].Extent.StartOffset -gt $held[0].Extent.EndOffset -and $signerReads[0].Extent.StartOffset -gt $reportCheck -and
        $signerReads[0].Extent.EndOffset -lt $copy -and $signerReads[0].Extent.EndOffset -lt $install
}
$deviceText = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'patch-for-device.ps1'))
Assert-True (& $checksDeviceSigner $deviceText) `
    "patch-for-device.ps1 doesn't hold the APK it hands on to the keystore alias's certificate, by its held path, before the copy and the install."
foreach ($cut in @(@{ From = 'Get-ApkSigners -Apk $out '; To = 'Get-ApkSigners -Apk $recorded.PatchedApk ' },
        @{ From = '$keyCertificate = Get-KeystoreCertificate '; To = '$keyCertificate = Get-Item ' },
        @{ From = 'if (Test-Path -LiteralPath $Keystore -PathType Leaf) { . $readKeystore }'; To = '' },
        @{ From = '$Keystore = Get-HeldPath -Stream $keystoreHeld'; To = '$Keystore = $Keystore' })) {
    Assert-True ($deviceText.Contains($cut.From) -and -not (& $checksDeviceSigner $deviceText.Replace($cut.From, $cut.To))) `
        "The device signer rule passed a copy of patch-for-device.ps1 with '$($cut.From)' made '$($cut.To)'."
}

Write-Host '[scripts] split bundle contracts passed'

# --- relative paths ------------------------------------------------------------------------------
#
# .NET reads a relative path against the process directory, which Set-Location doesn't move, while
# Test-Path and native commands use PowerShell's location. A path a script had just found could then
# open as a file somewhere else, or not at all: a relative -DesktopJar reached DexDiff as a jar that
# wasn't there. Every reader that hands a caller's path to .NET is asked here from a location the
# process directory isn't. The scripts that take such paths are run the same way in the release
# root below.

$relativeRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-relative-" + [guid]::NewGuid().ToString('N'))
$savedProcessDirectory = [Environment]::CurrentDirectory
$savedDesktopJar = $env:HUSHTUMBLR_DESKTOP_JAR
try {
    $here = Join-Path $relativeRoot 'here'
    $elsewhere = Join-Path $relativeRoot 'elsewhere'
    New-Item -ItemType Directory -Path (Join-Path $here 'tools'), $elsewhere -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $here 'tools\morphe-desktop.jar') -Value 'jar' -Encoding ASCII
    Set-Content -LiteralPath (Join-Path $here 'tools\d8.bat') -Value '@echo off' -Encoding ASCII
    New-TestBundleArchive -Path (Join-Path $here 'patches.mpp') -Entries ([ordered]@{
        'META-INF/MANIFEST.MF' = "Manifest-Version: 1.0`nVersion: 9.9.9`nTimestamp: 1000`nPatcher-Version: 1.14.1`n`n" })
    New-TestBundleArchive -Path (Join-Path $here 'app.apk') -Entries ([ordered]@{
        'AndroidManifest.xml' = 'manifest'; 'classes.dex' = "dex`n035" })
    New-TestBundleArchive -Path (Join-Path $here 'app.apkm') -Entries ([ordered]@{ 'base.apk' = 'base' })

    Push-Location -LiteralPath $here
    try {
        [Environment]::CurrentDirectory = $elsewhere
        $jar = Resolve-DesktopCli -Explicit 'tools\morphe-desktop.jar'
        Assert-True (Test-SamePath $jar (Join-Path $here 'tools\morphe-desktop.jar')) "A relative -DesktopJar came back as $jar."
        $env:HUSHTUMBLR_DESKTOP_JAR = 'tools\morphe-desktop.jar'
        $jar = Resolve-DesktopCli
        Assert-True (Test-SamePath $jar (Join-Path $here 'tools\morphe-desktop.jar')) "A relative HUSHTUMBLR_DESKTOP_JAR came back as $jar."
        $d8 = Resolve-D8 -Explicit 'tools\d8.bat' -Root $here
        Assert-True (Test-SamePath $d8 (Join-Path $here 'tools\d8.bat')) "A relative -D8 came back as $d8."
        $facts = Get-BundleManifestFacts -BundlePath 'patches.mpp'
        Assert-True ($facts.patcherVersion -eq '1.14.1') "A relative bundle was read as $($facts.patcherVersion)."
        Assert-True (Test-ApkFile -Path 'app.apk') 'A relative APK was not read as one.'
        $base = Get-BaseApk -Apk 'app.apkm' -Destination 'out\base.apk'
        Assert-True ((Test-SamePath $base (Join-Path $here 'out\base.apk')) -and (Test-Path -LiteralPath $base)) `
            "A relative bundle's base APK went to $base."
        Assert-True (@(Get-ChildItem -LiteralPath $elsewhere -Recurse -Force).Count -eq 0) `
            'A relative path was written in the process directory instead.'
    } finally {
        [Environment]::CurrentDirectory = $savedProcessDirectory
        Pop-Location
    }
} finally {
    [Environment]::CurrentDirectory = $savedProcessDirectory
    $env:HUSHTUMBLR_DESKTOP_JAR = $savedDesktopJar
    Remove-Item -LiteralPath $relativeRoot -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host '[scripts] relative path contracts passed'

# --- a release root ------------------------------------------------------------------------------
#
# The release files of this checkout, copied into a fixture repository and committed, the way the
# tree looks at a release commit. The release check reads the commit a receipt names out of git,
# so a copied tree that is not a repository never reaches the receipt, and the facts fixture above
# holds none: every case there took the "no receipt" exit, and the receipt half was covered only
# by a pattern over the script's text, which also matched a mutation that held the receipt to the
# newest build alone. The receipt builder runs here too, on stand-ins for the tools it starts,
# since patterns over its text passed with the merged APK ignored and with forced runs decided
# against the newest build, and so does the device build, on the same stand-ins.

$releaseRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-release-" + [guid]::NewGuid().ToString('N'))
$savedQueueScript = $env:BUILD_QUEUE_SCRIPT
$savedQueuePriority = $env:BUILD_QUEUE_PRIORITY
$savedApplyRecords = $env:HUSHTUMBLR_APPLY_RECORDS
try {
    # No run below keeps or reads an applied record unless its case names a store: a kept pass
    # would answer the failure cases without the CLI, and the machine's own store isn't theirs.
    $env:HUSHTUMBLR_APPLY_RECORDS = $null
    # The stand-in runs below go through a stand-in build queue, never the machine's, and it
    # writes down which jobs took a slot and at which priority.
    $releaseQueueLog = Join-Path $releaseRoot 'queue.log'
    New-Item -ItemType Directory -Path $releaseRoot -Force | Out-Null
    New-FakeBuildQueue -Path (Join-Path $releaseRoot 'build-queue.ps1') -Log $releaseQueueLog
    $env:BUILD_QUEUE_SCRIPT = Join-Path $releaseRoot 'build-queue.ps1'
    $env:BUILD_QUEUE_PRIORITY = $null
    $releaseRepo = Join-Path $releaseRoot 'repo'
    # The source ledger and the two files its rules hold an adopted source to go in as well: a
    # release is held to the census, and .gitignore has to let the ledger be committed.
    $releaseFiles = @('patches-list.json', 'patches-bundle.json', 'gradle.properties', 'README.md', 'CHANGELOG.md',
        'gradle/libs.versions.toml', '.github/ISSUE_TEMPLATE/bug_report.yml', '.gitignore',
        'sources/tumblr-sources.json', 'NOTICE', 'provenance.json')
    foreach ($relative in $releaseFiles) {
        $destination = Join-Path $releaseRepo $relative
        New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
        Copy-ReleaseFile $relative $destination
    }
    # The cases below need a declared build older than the newest, one a receipt can leave out.
    # When this checkout's catalog declares a single build, the fixture's copy declares the one
    # before it too, on every patch at a version code of its own, the way the catalog keeps the
    # previous build when Tumblr moves on.
    $releaseCatalogPath = Join-Path $releaseRepo 'patches-list.json'
    $releaseCatalogCopy = Get-Content -LiteralPath $releaseCatalogPath -Raw | ConvertFrom-Json
    $copiedTarget = Get-PatchTarget -PatchList $releaseCatalogCopy
    if (@($copiedTarget.PackageVersions).Count -lt 2) {
        $previousBuild = '46.3.0.110'
        foreach ($patch in @($releaseCatalogCopy.patches)) {
            $patch.compatiblePackages.($copiedTarget.PackageName) = @(@($patch.compatiblePackages.($copiedTarget.PackageName)) + $previousBuild)
            foreach ($compatibility in @($patch.compatibility | Where-Object { $_.packageName -eq $copiedTarget.PackageName })) {
                $compatibility.targets = @(@($compatibility.targets) + [pscustomobject]@{ version = $previousBuild
                        experimental = $false; versionCodes = [pscustomobject]@{ ARM64_V8A = 511808302 } })
            }
        }
        [System.IO.File]::WriteAllText($releaseCatalogPath, ($releaseCatalogCopy | ConvertTo-Json -Depth 20),
            (New-Object System.Text.UTF8Encoding($false)))
    }
    # The ledger, dated today and listed on every index, so the census a release is held to passes
    # and each published-asset case below is refused for its own fact. The checked-in ledger's date
    # moves with every audit and its listings wait on submissions, and neither is what those cases
    # are about. The census cases further down move one fact at a time.
    $releaseLedgerPath = Join-Path $releaseRepo 'sources/tumblr-sources.json'
    $releaseLedgerSource = [System.IO.File]::ReadAllText($releaseLedgerPath)
    function Save-ReleaseLedger([int]$AgeDays = 0, [switch]$Pending) {
        $document = $releaseLedgerSource | ConvertFrom-Json
        $checked = [datetime]::UtcNow.Date.AddDays(-$AgeDays).ToString('yyyy-MM-dd')
        $document.census.checkedAt = $checked
        foreach ($index in $document.indexes) {
            $index.hushtumblr = if ($Pending) { [pscustomobject]@{ status = 'not-listed'; checked = $checked } } else {
                [pscustomobject]@{ status = 'listed'; url = 'https://example.com/listing'; checked = $checked } }
        }
        foreach ($record in @(@($document.entries) + @($document.outOfScope))) { if ($record) { $record.lastChecked = $checked } }
        [System.IO.File]::WriteAllText($releaseLedgerPath, ($document | ConvertTo-Json -Depth 20),
            (New-Object System.Text.UTF8Encoding($false)))
    }
    Save-ReleaseLedger
    # The copied source can be one commit ahead of the published index while a release is being
    # prepared. Here the copied tree is the release, so the index is written up to the catalog
    # before any strict index-push case runs.
    $releaseVersionForIndex = Get-BundleVersion -Root $releaseRepo
    $releaseCatalogForIndex = Get-Content -LiteralPath (Join-Path $releaseRepo 'patches-list.json') -Raw |
        ConvertFrom-Json
    $releaseTargetForIndex = Get-PatchTarget -PatchList $releaseCatalogForIndex
    $releasePatchCountForIndex = @($releaseCatalogForIndex.patches).Count
    $releaseFloor = (Read-CatalogToolchain -Source 'the copied catalog' `
        -Text (Get-Content -LiteralPath (Join-Path $releaseRepo 'gradle/libs.versions.toml') -Raw)).ManagerFloor
    $releaseIndexPath = Join-Path $releaseRepo 'patches-bundle.json'
    $releaseIndexText = Get-Content -LiteralPath $releaseIndexPath -Raw
    $releaseIndex = $releaseIndexText | ConvertFrom-Json
    $copiedIndexVersion = [string]$releaseIndex.version
    if ($copiedIndexVersion -ne $releaseVersionForIndex) {
        $releaseIndexText = $releaseIndexText -replace
            ('(?<![\d.])' + [regex]::Escape($copiedIndexVersion) + '(?!\d)'), $releaseVersionForIndex
    }
    $releaseIndexText = $releaseIndexText -replace
        '(?<!\d)\d+ patches\b', "$releasePatchCountForIndex patches"
    $describedBuild = [regex]::Match([string]$releaseIndex.description, 'Tumblr\s+(\d+(?:\.\d+)+)')
    if ($describedBuild.Success -and $describedBuild.Groups[1].Value -ne $releaseTargetForIndex.PackageVersion) {
        $releaseIndexText = $releaseIndexText -replace
            ('(?<![\d.])' + [regex]::Escape($describedBuild.Groups[1].Value) + '(?!\d)'),
            $releaseTargetForIndex.PackageVersion
    }
    $releaseIndexText = $releaseIndexText -replace
        '(Morphe Manager )\d+(?:\.\d+)+( or newer)', "`${1}$releaseFloor`${2}"
    Set-Content -LiteralPath $releaseIndexPath -Encoding UTF8 -NoNewline -Value $releaseIndexText
    $releaseBugFormPath = Join-Path $releaseRepo '.github/ISSUE_TEMPLATE/bug_report.yml'
    $releaseBugFormText = Get-Content -LiteralPath $releaseBugFormPath -Raw
    $releaseBugFormText = $releaseBugFormText -replace
        '(placeholder:\s*HushTumblr )\S+( on Tumblr)', "`${1}$releaseVersionForIndex`${2}"
    $releaseBugFormText = $releaseBugFormText -replace
        '(placeholder:\s*HushTumblr \S+ on Tumblr )\d+(?:\.\d+)+',
        "`${1}$($releaseTargetForIndex.PackageVersion)"
    Set-Content -LiteralPath $releaseBugFormPath -Encoding UTF8 -NoNewline -Value $releaseBugFormText
    # And the README's version badge and the sentence naming the latest release, which the release
    # moves with the index.
    $releaseReadmePath = Join-Path $releaseRepo 'README.md'
    $releaseReadmeText = (Get-Content -LiteralPath $releaseReadmePath -Raw) -replace
        'badge/version-\d+(?:\.\d+)+-', "badge/version-$releaseVersionForIndex-" -replace
        'alt="Version \d+(?:\.\d+)+"', "alt=`"Version $releaseVersionForIndex`"" -replace
        '(latest (?:published )?release is (?:still )?\[?v)\d+(?:\.\d+)+', "`${1}$releaseVersionForIndex" -replace
        '(latest release is \[v[^\]]*\]\([^)\s]*/tag/v)\d+(?:\.\d+)+', "`${1}$releaseVersionForIndex" -replace
        '(latest release is \[v[^\]]*\]\([^)\s]*\), with )\d+( patches)', "`${1}$releasePatchCountForIndex`${2}" -replace
        "(\bThe v)\d+(?:\.\d+)+( bundle's line:)", "`${1}$releaseVersionForIndex`${2}" -replace
        '(?m)^([0-9a-f]{64}  patches-)\d+(?:\.\d+)+(\.mpp)', "`${1}$releaseVersionForIndex`${2}"
    Set-Content -LiteralPath $releaseReadmePath -Encoding UTF8 -NoNewline -Value $releaseReadmeText
    # Through Invoke-FixtureGit, with the git directory proved before anything is written, for
    # the reason the toolchain fixture above gives.
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('init', '--quiet') | Out-Null
    $releaseGitDir = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('rev-parse', '--absolute-git-dir') |
        Select-Object -First 1)".Trim()
    Assert-True ($releaseGitDir -and ([IO.Path]::GetFullPath($releaseGitDir).TrimEnd('\', '/') -ieq
            [IO.Path]::GetFullPath((Join-Path $releaseRepo '.git')).TrimEnd('\', '/'))) `
        "The release fixture resolved to $releaseGitDir, not its own repository. Refusing to write."
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('config', 'user.email', 'contracts@example.invalid') | Out-Null
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('config', 'user.name', 'Contracts') | Out-Null
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('add', '-A') | Out-Null
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('commit', '-m', 'release', '--quiet') | Out-Null
    $releaseCommitted = @(Invoke-FixtureGit -Root $releaseRepo -Arguments @('show', '--name-only', '--format=', 'HEAD') |
        Where-Object { "$_".Trim() })
    Assert-True ($releaseCommitted.Count -eq $releaseFiles.Count) `
        ("The release fixture's commit touched $($releaseCommitted.Count) files, not the $($releaseFiles.Count) " +
            'copied: ' + (($releaseCommitted | Select-Object -First 5) -join ', '))
    $releaseCommit = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('rev-parse', 'HEAD') | Select-Object -First 1)".Trim()
    $releaseSeconds = [long]"$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('log', '-1', '--format=%ct') |
        Select-Object -First 1)".Trim()

    $releaseVersionHere = Get-BundleVersion -Root $releaseRepo
    $releaseCatalog = Get-Content -LiteralPath (Join-Path $releaseRepo 'patches-list.json') -Raw | ConvertFrom-Json
    $releaseTarget = Get-PatchTarget -PatchList $releaseCatalog
    $releaseNames = @($releaseCatalog.patches | ForEach-Object { [string]$_.name })
    $releaseToolchain = Read-CatalogToolchain -Source 'the release fixture catalog' `
        -Text (Get-Content -LiteralPath (Join-Path $releaseRepo 'gradle/libs.versions.toml') -Raw)
    $releaseReceipt = Join-Path $releaseRepo "release-receipt-$releaseVersionHere.json"
    # The tag the check reads the index's floor through, named for the version the index publishes.
    $indexVersionHere = [string]($releaseIndexText | ConvertFrom-Json).version
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('tag', "v$indexVersionHere", $releaseCommit) | Out-Null

    $androidName = 'http://schemas.android.com/apk/res/android:name(0x01010003)='
    $androidExported = '          A: http://schemas.android.com/apk/res/android:exported(0x01010010)=true'
    function Get-FixtureManifest([string]$Build, [string]$Code, [switch]$WithSplit, [switch]$Patched,
            [string]$Package = $releaseTarget.PackageName, [int]$MinSdk = 21) {
        $binaryMinSdk = if ($Patched) { [Math]::Max($MinSdk, 26) } else { $MinSdk }
        $lines = @(
            'N: android=http://schemas.android.com/apk/res/android (line=1)',
            '  E: manifest (line=1)',
            "    A: http://schemas.android.com/apk/res/android:versionCode(0x0101021b)=$Code",
            "    A: http://schemas.android.com/apk/res/android:versionName(0x0101021c)=`"$Build`" (Raw: `"$Build`")",
            "    A: package=`"$Package`" (Raw: `"$Package`")",
            '      E: uses-sdk (line=8)',
            "        A: http://schemas.android.com/apk/res/android:minSdkVersion(0x0101020c)=$binaryMinSdk",
            '      E: uses-permission (line=10)',
            "        A: $androidName`"android.permission.INTERNET`" (Raw: `"android.permission.INTERNET`")")
        # Tumblr asks for the ad ID and Android's ad services, which Remove ad tracking
        # permissions takes out with the application's ad services property.
        $adTracking = $releaseNames -ccontains 'Remove ad tracking permissions'
        if ($adTracking -and -not $Patched) {
            foreach ($permission in @('com.google.android.gms.permission.AD_ID',
                    'android.permission.ACCESS_ADSERVICES_AD_ID', 'android.permission.ACCESS_ADSERVICES_ATTRIBUTION',
                    'android.permission.ACCESS_ADSERVICES_TOPICS')) {
                $lines += @('      E: uses-permission (line=11)', "        A: $androidName`"$permission`" (Raw: `"$permission`")")
            }
        }
        $lines += '      E: application (line=20)'
        if ($adTracking) {
            # Another application property stays where the ad services one goes.
            $resizable = 'android.window.PROPERTY_COMPAT_ALLOW_RESTRICTED_RESIZABILITY'
            $lines += @('        E: property (line=22)', "          A: $androidName`"$resizable`" (Raw: `"$resizable`")",
                '          A: http://schemas.android.com/apk/res/android:value(0x01010024)=true')
            if (-not $Patched) {
                $lines += @('        E: property (line=23)',
                    "          A: $androidName`"android.adservices.AD_SERVICES_CONFIG`" (Raw: `"android.adservices.AD_SERVICES_CONFIG`")",
                    '          A: http://schemas.android.com/apk/res/android:resource(0x01010025)=@0x7f170005')
            }
        }
        $lines += @('        E: activity (line=21)',
            "          A: $androidName`"com.tumblr.ui.activity.JumpoffActivity`" (Raw: `"com.tumblr.ui.activity.JumpoffActivity`")",
            $androidExported)
        if ($WithSplit) {
            $lines += @('        E: activity (line=40)',
                "          A: $androidName`"com.tumblr.split.FeatureActivity`" (Raw: `"com.tumblr.split.FeatureActivity`")",
                $androidExported)
        }
        if ($Patched -and $releaseNames -ccontains 'Disable analytics') {
            # The fixture declares none of the collection switches, so the patch adds each one.
            $flags = [ordered]@{ firebase_analytics_collection_deactivated = 'true'
                firebase_crashlytics_collection_enabled = 'false'; firebase_performance_collection_deactivated = 'true'
                google_analytics_adid_collection_enabled = 'false'; google_analytics_default_allow_analytics_storage = 'false'
                google_analytics_default_allow_ad_storage = 'false'; google_analytics_default_allow_ad_user_data = 'false'
                google_analytics_default_allow_ad_personalization_signals = 'false' }
            foreach ($flag in $flags.Keys) {
                $lines += @('        E: meta-data (line=45)', "          A: $androidName`"$flag`" (Raw: `"$flag`")",
                    "          A: http://schemas.android.com/apk/res/android:value(0x01010024)=$($flags[$flag])")
            }
        }
        if ($Patched -and $releaseNames -ccontains 'Spoof signature for Google sign-in') {
            # The two signature metadata entries, as the allowlist approves them.
            foreach ($template in @(Read-ManifestDeltaAllowlist -Path (Join-Path $PSScriptRoot 'manifest-delta-allowlist.txt') `
                    -SelectedPatchNames @('Spoof signature for Google sign-in'))) {
                $attributes = ($template.Substring('metadata-added '.Length) | ConvertFrom-Json).declaration.attributes
                $lines += @('        E: meta-data (line=46)', "          A: $androidName`"$($attributes.'android:name')`" (Raw: `"$($attributes.'android:name')`")",
                    "          A: http://schemas.android.com/apk/res/android:value(0x01010024)=`"$($attributes.'android:value')`" (Raw: `"$($attributes.'android:value')`")")
            }
        }
        if ($Patched -and $releaseNames -ccontains 'HushTumblr settings') {
            $lines += @('        E: activity-alias (line=60)',
                "          A: $androidName`"app.hushtumblr.extension.tumblr.settings.OpenSettings`" (Raw: `"app.hushtumblr.extension.tumblr.settings.OpenSettings`")",
                $androidExported,
                '          A: http://schemas.android.com/apk/res/android:targetActivity(0x01010202)="com.tumblr.ui.activity.JumpoffActivity" (Raw: "com.tumblr.ui.activity.JumpoffActivity")',
                '          E: intent-filter (line=61)', '            E: action (line=62)',
                "              A: $androidName`"android.intent.action.APPLICATION_PREFERENCES`" (Raw: `"android.intent.action.APPLICATION_PREFERENCES`")",
                '            E: category (line=63)',
                "              A: $androidName`"android.intent.category.DEFAULT`" (Raw: `"android.intent.category.DEFAULT`")")
        }
        return ($lines -join "`n") + "`n"
    }
    # A config split's manifest, as aapt2 prints one: the package, the build's version code and the
    # split's name. -Marker adds a line the apksigner stand-in reads (see it below).
    function Get-FixtureSplitManifest([string]$Code, [string]$Split, [string]$Package = $releaseTarget.PackageName, [string]$Marker) {
        $lines = @(
            'N: android=http://schemas.android.com/apk/res/android (line=1)',
            '  E: manifest (line=1)',
            "    A: http://schemas.android.com/apk/res/android:versionCode(0x0101021b)=$Code",
            "    A: package=`"$Package`" (Raw: `"$Package`")",
            "    A: split=`"$Split`" (Raw: `"$Split`")",
            '      E: application (line=4)')
        if ($Marker) { $lines = @("N: $Marker") + $lines }
        return ($lines -join "`n") + "`n"
    }
    $releaseSelectedAllowlist = @(Read-ManifestDeltaAllowlist -Path (Join-Path $PSScriptRoot 'manifest-delta-allowlist.txt') `
        -SelectedPatchNames $releaseNames)

    # A receipt for this commit with a run of each build given, every patch applied and the
    # manifest change the checked-in allowlist approves, the settings alias, written where the
    # release check looks for it. A schema 1 receipt names no SBOM, as the ones cut before it
    # existed don't.
    $approvedDelta = [ordered]@{ permissionsAdded = @(); permissionsRemoved = @()
        exportedComponentsAdded = @(); exportedComponentsRemoved = @() }
    foreach ($entry in $checkedInAllowlist) {
        $kind, $value = $entry -split ' ', 2
        switch ($kind) {
            'permission-added' { $approvedDelta.permissionsAdded += $value }
            'permission-removed' { $approvedDelta.permissionsRemoved += $value }
            'exported-added' { $approvedDelta.exportedComponentsAdded += $value }
            'exported-removed' { $approvedDelta.exportedComponentsRemoved += $value }
        }
    }
    function Save-ReleaseReceipt([string[]]$Builds, [string]$Commit = $releaseCommit, [long]$Seconds = $releaseSeconds,
            [int]$Schema = (Get-ReleaseReceiptSchemaVersion)) {
        $targets = @(for ($i = 0; $i -lt $Builds.Count; $i++) {
            # Each build at the version code the catalog pins it to, as a run of the declared build.
            $code = @(@($releaseTarget.PackageVersionCodes[$Builds[$i]]) + @("51200000$i") | Where-Object { $_ })[0]
            $stockFacts = ConvertFrom-ManifestXmlTree -Source 'receipt stock fixture' -Lines (
                (Get-FixtureManifest -Build $Builds[$i] -Code $code) -split '\r?\n')
            $patchedFacts = ConvertFrom-ManifestXmlTree -Source 'receipt patched fixture' -Lines (
                (Get-FixtureManifest -Build $Builds[$i] -Code $code -Patched) -split '\r?\n')
            $targetHere = [ordered]@{
                source        = [ordered]@{ file = "tumblr-$($Builds[$i])-arm64-v8a.apk"
                    package = $releaseTarget.PackageName; versionName = $Builds[$i]; versionCode = $code
                    sha256 = ([string]'ABCDEF'[$i % 6] * 64); forced = $false }
                patches       = @($releaseNames | ForEach-Object { [ordered]@{ name = $_; applied = $true; reason = $null } })
                sdk           = [ordered]@{ stockMinSdk = 21; patchedMinSdk = 26 }
                manifestDelta = $approvedDelta
            }
            if ($Schema -ge 4) {
                $targetHere.manifest = [ordered]@{ stock = $stockFacts; patched = $patchedFacts }
                $targetHere.manifestDelta = Get-ManifestDelta -Stock $stockFacts -Patched $patchedFacts
            }
            $targetHere
        })
        $document = [ordered]@{
            schemaVersion = $Schema
            release   = [ordered]@{ version = $releaseVersionHere; tag = "v$releaseVersionHere"; commit = $Commit
                commitTimestamp = $Seconds; patchCount = $releaseNames.Count }
            bundle    = [ordered]@{ file = "patches-$releaseVersionHere.mpp"; sizeBytes = 10; sha256 = ('E' * 64)
                timestamp = $Seconds * 1000 }
            sbom      = [ordered]@{ file = "patches-$releaseVersionHere.cdx.json"; sha256 = ('D' * 64); components = 3 }
            toolchain = [ordered]@{ patcherVersion = $releaseToolchain.PatcherVersion; managerFloor = $releaseToolchain.ManagerFloor }
            extension = [ordered]@{ dexPayloads = @([ordered]@{ name = 'extensions/tumblr.mpe'; sizeBytes = 10; sha256 = ('F' * 64) }) }
            targets   = $targets
        }
        if ($Schema -lt 2) { $document.Remove('sbom') }
        if ($Schema -lt 3) { foreach ($target in $targets) { $target.Remove('sdk') } }
        Set-Content -LiteralPath $releaseReceipt -Encoding UTF8 -Value ($document | ConvertTo-Json -Depth 12)
    }
    # The run the hook makes for a push that carries a receipt: lenient, since the index may lag
    # the source, and with no network. What it says is kept, to tell a receipt it compared from
    # one it never found.
    function Invoke-ReleaseCheck {
        $global:LASTEXITCODE = 0
        $said = @(& $factsScript -Root $releaseRepo -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipUrlCheck 6>&1 |
            ForEach-Object { "$_" }) -join "`n"
        if ($LASTEXITCODE -ne 0) { throw "The release check exited $LASTEXITCODE on the release root: $said" }
        return $said
    }

    # A run of every declared build, which is what a release needs, compared rather than skipped.
    Save-ReleaseReceipt -Builds $releaseTarget.PackageVersions
    try {
        $said = Invoke-ReleaseCheck
    } catch {
        throw "The release check refused a receipt with a run of every declared build: $($_.Exception.Message)"
    }
    $proved = "the receipt proves $($releaseNames.Count) patches on $($releaseTarget.PackageVersions -join ', ') " +
        "from commit $($releaseCommit.Substring(0, 8))"
    Assert-True ($said -like "*$proved*") "The release check did not compare the receipt it was given: $said"
    Assert-True ($said -like "*the index asks for Morphe Manager $releaseFloor or newer, as tag v$indexVersionHere pins*") `
        "The release check did not hold the index's Manager floor to the release tag: $said"

    # An index still naming the floor of the release before it, which is what reusing its text
    # does. Nothing read the description's floor until 2026-09-25.
    Set-Content -LiteralPath $releaseIndexPath -Encoding UTF8 -NoNewline -Value (
        $releaseIndexText -replace '(Morphe Manager )\d+(?:\.\d+)+( or newer)', '${1}1.20.0${2}')
    try {
        Assert-Throws { Invoke-ReleaseCheck } '*Morphe Manager 1.20.0 or newer*' `
            'An index naming another Manager floor than its release tag pins was accepted.'
    } finally {
        Set-Content -LiteralPath $releaseIndexPath -Encoding UTF8 -NoNewline -Value $releaseIndexText
    }

    # A run of the newest build alone, the receipt a release that skipped the older fixture would
    # write. Refused, naming the build it never ran.
    Save-ReleaseReceipt -Builds @($releaseTarget.PackageVersions[0])
    $unproved = @($releaseTarget.PackageVersions | Select-Object -Skip 1)
    Assert-True ($unproved.Count -gt 0) 'The catalog declares one build, so the case below would prove nothing.'
    Assert-Throws { Invoke-ReleaseCheck } ("*No target in the receipt is the declared $($releaseTarget.PackageName) " +
            "$($unproved -join ', ') patched without -f*") `
        'The release check accepted a receipt with no run of an older declared build.'

    # build-release-receipt.ps1 itself, on the same root. Stand-ins take the tools' places: a JDK
    # that answers -version, plays MergeSplits.java (the merged APK, and a note beside it naming
    # the bundle it came from), and does what the desktop CLI leaves behind for each input (the
    # result report and the patched APK), and an aapt2 that prints the manifest lines written for
    # each APK. One .xapk per declared build, laid out the way APKPure lays out Tumblr, and a
    # bundle stamped with the commit's time where
    # buildAndroid leaves it, carrying the classes.dex the published asset check at the end of
    # this section looks for. The merge carries a component the base APK's manifest lacks, so a
    # delta taken against the base instead of the merge records it as the patches' own, and the
    # allowlist, which approves only the settings alias, refuses the receipt. The JDK also plays
    # ResourceTableCheck.java, keeping a copy of the stock APK it was handed, and DexDiff.java, and
    # an apksigner beside aapt2 names Tumblr's signer, so verify-all-patches.ps1 runs on the
    # same stand-ins.
    $tools = Join-Path $releaseRoot 'tools'
    $fixtures = Join-Path $releaseRoot 'fixtures'
    New-Item -ItemType Directory -Path $tools, $fixtures -Force | Out-Null
    $stubJava = Join-Path $tools 'java.cmd'
    $stubAapt2 = Join-Path $tools 'aapt2.cmd'
    $stubJar = Join-Path $tools 'morphe-desktop.jar'
    $javaLog = Join-Path $tools 'java.log'
    $mergeLog = Join-Path $tools 'merge.log'
    $resourceStock = Join-Path $tools 'resource-stock.txt'
    $stubAndroidJar = Join-Path $tools 'android.jar'
    $stubApiVersions = Join-Path $tools 'api-versions.xml'
    [IO.File]::WriteAllText($stubAndroidJar, 'stub SDK read by the Java stand-in')
    [IO.File]::WriteAllText($stubApiVersions, '<api/>')
    [System.IO.File]::WriteAllText($stubJava, ((@(
        '@echo off',
        'setlocal EnableExtensions EnableDelayedExpansion',
        'if "%~1"=="-version" (',
        '    echo openjdk version "21.0.5" 2024-10-15',
        '    exit /b 0',
        ')',
        'rem Its own folder, read before shift moves %0 along with the arguments.',
        'set "HERE=%~dp0"',
        'rem -Xmx -cp <jar> <tool>.java and the tool''s arguments.',
        'if /i "%~nx4"=="MergeSplits.java" goto merge',
        'if /i "%~nx4"=="ResourceTableCheck.java" goto resources',
        'if /i "%~nx4"=="DexDiff.java" goto dexdiff',
        'if /i "%~nx4"=="HostReferences.java" goto references',
        'rem -cp <apksigner.jar;CLI jar> ApkSignerTool sign: patch-for-device.ps1 signing a BKS keystore.',
        'rem cmd splits an unquoted class path at its ";", so the class can be the fourth argument.',
        'if "%~3"=="com.android.apksigner.ApkSignerTool" goto bkssign',
        'if "%~4"=="com.android.apksigner.ApkSignerTool" goto bkssign',
        'set "OUT=" & set "RESULT=" & set "LAST=" & set "PREV=" & set "FORCED=0" & set "ENABLED=" & set "SIGNS=0"',
        'shift',
        'shift',
        'rem patch-for-device.ps1 hands the CLI one argument file, a quoted value a line with',
        'rem backslashes doubled; the receipt builder passes the arguments themselves.',
        'set "FIRST=%~1"',
        'if not "!FIRST:~0,1!"=="@" goto next',
        'set "ARGUMENTS=!FIRST:~1!"',
        'for /f "usebackq delims=" %%L in ("%ARGUMENTS%") do (',
        '    set "V=%%~L"',
        '    set "V=!V:\\=\!"',
        '    call :take',
        ')',
        'goto run',
        ':next',
        'if "%~1"=="" goto run',
        'set "V=%~1"',
        'call :take',
        'shift',
        'goto next',
        ':take',
        'if "!PREV!"=="-o" set "OUT=!V!"',
        'if "!PREV!"=="-r" set "RESULT=!V!"',
        'rem An option value is logged with the patch enabled before it, the one the CLI gives it to.',
        'if "!PREV!"=="-e" set "ENABLED=!V!"',
        'if "!PREV!"=="-O" >>"!HERE!options.log" echo !ENABLED!: !V!',
        'if "!V!"=="-f" set "FORCED=1"',
        'if "!V!"=="--keystore" set "SIGNS=1"',
        'set "PREV=!V!"',
        'set "LAST=!V!"',
        'exit /b 0',
        ':run',
        'rem A merged APK names the bundle it came from, whose report and patched manifest these are,',
        'rem and the checked copy of a plain APK carries the name of the fixture it was copied from.',
        'set "SRC=!LAST!"',
        'set "VIA="',
        'if exist "!LAST!.source" (',
        '    set /p SRC=<"!LAST!.source"',
        '    set "VIA= merged"',
        ') else (',
        '    for /f "tokens=1,* delims==" %%A in (''findstr /b /l /c:"N: stand-in-bundle=" "!LAST!"'') do set "SRC=%%B"',
        ')',
        '>>"!HERE!java.log" echo patch !SRC!!VIA! forced=!FORCED!',
        'rem The CLI logs WARNING and SEVERE on standard error, which Windows PowerShell 5.1 makes a',
        'rem terminating error under Stop unless the caller steps down to Continue for the call.',
        'echo WARNING: a patch named a target this build lacks, and still applied 1>&2',
        'rem A case that needs something to change while a fixture is patched leaves this behind.',
        'if exist "!HERE!during-patch.cmd" call "!HERE!during-patch.cmd"',
        'copy /y "!SRC!.result.json" "!RESULT!" >nul || exit /b 3',
        'rem A case that leaves cli-leaves-no-apk.txt behind gets a clean exit with the report and no APK.',
        'if exist "!HERE!cli-leaves-no-apk.txt" exit /b 0',
        'copy /y "!HERE!patched.apk" "!OUT!" >nul || exit /b 4',
        'copy /y "!SRC!.patched.txt" "!OUT!.xmltree" >nul || exit /b 5',
        'rem Given a keystore it signs with that alias, which the stand-in apksigner reads off a .signer file.',
        'del "!OUT!.signer" >nul 2>&1',
        'if "!SIGNS!"=="1" >"!OUT!.signer" echo stand-in alias',
        'exit /b 0',
        'rem MergeSplits.java <split directory> <merged.apk>. The base APK the scripts unpacked into that',
        'rem directory names the fixture it came from. It prints the digest of what it wrote on standard',
        'rem output, as the merger does. A case can make it fail, leave no APK behind, or print no digest,',
        'rem two, one on standard error alone, or one of other bytes.',
        ':merge',
        'set "BUNDLE="',
        'for %%F in ("%~5\*.apk") do for /f "tokens=1,* delims==" %%A in (''findstr /b /l /c:"N: stand-in-bundle=" "%%~F"'') do set "BUNDLE=%%B"',
        '>>"!HERE!merge.log" echo merge !BUNDLE!',
        'if exist "!HERE!merge-fails.txt" (',
        '    echo [merge] could not read the bundle 1>&2',
        '    exit /b 9',
        ')',
        'if exist "!HERE!merge-writes-nothing.txt" exit /b 0',
        'if not defined BUNDLE exit /b 6',
        'copy /y "!BUNDLE!.merged.txt" "%~6" >nul || exit /b 7',
        '>"%~6.source" echo !BUNDLE!',
        'set "DIGEST="',
        'for /f "skip=1 delims=" %%H in (''certutil -hashfile "%~6" SHA256'') do if not defined DIGEST set "DIGEST=%%H"',
        'if exist "!HERE!merge-prints-no-digest.txt" exit /b 0',
        'if exist "!HERE!merge-prints-digest-on-stderr.txt" (',
        '    echo [merge] sha256 !DIGEST! 1>&2',
        '    exit /b 0',
        ')',
        'if exist "!HERE!merge-prints-other-digest.txt" set "DIGEST=0000000000000000000000000000000000000000000000000000000000000000"',
        'echo [merge] sha256 !DIGEST!',
        'if exist "!HERE!merge-prints-two-digests.txt" echo [merge] sha256 !DIGEST!',
        'exit /b 0',
        ('rem ResourceTableCheck.java <stock> <patched> <report> <allowlist>: keeps what it was handed as the stock side, ' +
            'and stops on a run that hands it no allowlist or no patch selection.'),
        ':resources',
        'if not exist "%~8" exit /b 9',
        'if not defined HUSHTUMBLR_PATCH_SELECTION exit /b 10',
        'copy /y "%~5" "!HERE!resource-stock.txt" >nul || exit /b 8',
        'echo Note: the source launcher compiled with a warning 1>&2',
        'echo [resources] stand-in: every stock resource resolves in the patched table',
        'exit /b 0',
        ':dexdiff',
        'shift',
        'shift',
        'shift',
        'shift',
        'if not "%~7"=="-" copy /y "%~7" "!HERE!selected-patches.txt" >nul || exit /b 8',
        'if exist "!HERE!dexdiff-fails.txt" (',
        '    echo [diff] FAIL: contract: feature required hook missing',
        '    echo [diff] structural findings: 1',
        '    exit /b 9',
        ')',
        'echo [diff] structural findings: 0',
        'exit /b 0',
        ':references',
        'shift',
        'shift',
        'shift',
        'shift',
        'if exist "!HERE!references-fails.txt" (',
        '    >"%~3" echo missing method Lmaterial/Widget;-^>removed^(^)V',
        '    echo [references] missing method Lmaterial/Widget;-^>removed^(^)V',
        '    exit /b 9',
        ')',
        '>"%~3" echo findings=0',
        'echo [references] findings=0',
        'exit /b 0',
        'rem Signs like the stand-in apksigner.bat and logs to its apksigner.log, unless a case leaves',
        'rem apksigner-java-fails.txt behind.',
        ':bkssign',
        'set "OUT=" & set "LAST=" & set "PREV=" & set "ALIAS=" & set "TYPE=" & set "PROVIDER="',
        ':bksnext',
        'shift',
        'if "%~1"=="" goto bkssigned',
        'if "!PREV!"=="--out" set "OUT=%~1"',
        'if "!PREV!"=="--ks-key-alias" set "ALIAS=%~1"',
        'if "!PREV!"=="--ks-type" set "TYPE=%~1"',
        'if "!PREV!"=="--ks-provider-name" set "PROVIDER=%~1"',
        'set "PREV=%~1"',
        'set "LAST=%~1"',
        'goto bksnext',
        ':bkssigned',
        '>>"!HERE!apksigner.log" echo bks-sign type=!TYPE! provider=!PROVIDER! alias=!ALIAS! in=!LAST! out=!OUT!',
        'if exist "!HERE!apksigner-java-fails.txt" (echo java.security.KeyStoreException: BKS not found& exit /b 5)',
        'copy /y "!LAST!" "!OUT!" >nul || exit /b 3',
        'if exist "!LAST!.xmltree" copy /y "!LAST!.xmltree" "!OUT!.xmltree" >nul',
        'del "!OUT!.signer" >nul 2>&1',
        '>"!OUT!.signer" echo stand-in alias',
        'exit /b 0') -join "`r`n") + "`r`n"), [System.Text.Encoding]::ASCII)
    [System.IO.File]::WriteAllText($stubAapt2, ((@(
        '@echo off',
        'setlocal EnableExtensions DisableDelayedExpansion',
        'set "APK="',
        ':next',
        'if "%~1"=="" goto run',
        'set "APK=%~1"',
        'shift',
        'goto next',
        ':run',
        'if exist "%APK%.xmltree" (type "%APK%.xmltree") else (type "%APK%")',
        'exit /b %errorlevel%') -join "`r`n") + "`r`n"), [System.Text.Encoding]::ASCII)
    Set-Content -LiteralPath $stubJar -Value 'not a jar' -Encoding ASCII
    # The receipt builder and verify-all-patches.ps1 both hold the clean fixture to Tumblr's signer.
    $releaseSigner = @($releaseCatalog.patches | ForEach-Object { $_.compatibility } |
        Where-Object { $_.packageName -eq $releaseTarget.PackageName } | ForEach-Object { $_.signatures } |
        Sort-Object -Unique | Select-Object -First 1)
    Assert-True ($releaseSigner.Count -eq 1) 'The release catalog names no signer for the stand-in apksigner.'
    # Every APK is checked before it is merged or patched (Get-MergedApk), and a marker in the APK
    # says how this one is signed: stand-in-unsigned and stand-in-tampered don't verify,
    # stand-in-foreign is signed by another certificate alone, stand-in-second-signer by another
    # one beside Tumblr's, and stand-in-stamp carries a Source Stamp beside Tumblr's, which is the
    # store's certificate and doesn't count. stand-in-late-signer adds one that sorts after the
    # alias's, and stand-in-unverified names the alias's signer but doesn't verify. Without a
    # marker the answer is the alias's certificate for an APK with a .signer file beside it, which
    # the stand-in signers leave, and Tumblr's otherwise.
    # It signs too: patch-for-device.ps1 signs a kept gate run with it. "sign ... --out <apk> <in>"
    # copies the input (or apksigner-swap.apk, when a case leaves one beside it) and the manifest
    # beside the input, notes the call in apksigner.log and leaves the .signer file, unless a case
    # leaves apksigner-unmarked.txt behind. A case that leaves apksigner-swaps-keystore.txt has it
    # try to copy that over the keystore it was handed first, and log whether it could. One that
    # leaves apksigner-bks-only.txt has it refuse the keystore the way apksigner.bat refuses a BKS one.
    $foreignSigner = '0123456789abcdef' * 4
    $aliasSigner = '89abcdef01234567' * 4
    $lateSigner = 'fedcba9876543210' * 4
    Set-Content -LiteralPath (Join-Path $tools 'apksigner.bat') -Encoding ASCII -Value @(
        '@echo off',
        'setlocal EnableExtensions EnableDelayedExpansion',
        'set "HERE=%~dp0"',
        'if /i "%~1"=="sign" goto sign',
        'set "APK="',
        ':arg',
        'if "%~1"=="" goto verify',
        'set "APK=%~1"',
        'shift',
        'goto arg',
        ':verify',
        'findstr /l /c:"stand-in-unsigned" "!APK!" >nul 2>&1 && (echo DOES NOT VERIFY& echo ERROR: Missing META-INF/MANIFEST.MF& exit /b 1)',
        ('findstr /l /c:"stand-in-tampered" "!APK!" >nul 2>&1 && (echo DOES NOT VERIFY& echo ERROR: APK Signature Scheme v2 ' +
            'signer #1: APK integrity check failed. CHUNKED_SHA256 digest mismatch.& exit /b 1)'),
        ("findstr /l /c:`"stand-in-unverified`" `"!APK!`" >nul 2>&1 && (echo Signer #1 certificate SHA-256 digest: $aliasSigner& " +
            'echo DOES NOT VERIFY& echo ERROR: APK Signature Scheme v2 signer #1: malformed additional attribute& exit /b 1)'),
        "findstr /l /c:`"stand-in-foreign`" `"!APK!`" >nul 2>&1 && (echo Signer #1 certificate SHA-256 digest: $foreignSigner& exit /b 0)",
        'if exist "!APK!.signer" goto alias',
        "echo Signer #1 certificate SHA-256 digest: $($releaseSigner[0])",
        'goto more',
        ':alias',
        "echo Signer #1 certificate SHA-256 digest: $aliasSigner",
        ':more',
        "findstr /l /c:`"stand-in-second-signer`" `"!APK!`" >nul 2>&1 && echo Signer #2 certificate SHA-256 digest: $foreignSigner",
        "findstr /l /c:`"stand-in-late-signer`" `"!APK!`" >nul 2>&1 && echo Signer #2 certificate SHA-256 digest: $lateSigner",
        "findstr /l /c:`"stand-in-stamp`" `"!APK!`" >nul 2>&1 && echo Source Stamp Signer certificate SHA-256 digest: $foreignSigner",
        'exit /b 0',
        ':sign',
        'set "OUT=" & set "LAST=" & set "PREV=" & set "ALIAS=" & set "KS="',
        ':next',
        'shift',
        'if "%~1"=="" goto signed',
        'if "!PREV!"=="--out" set "OUT=%~1"',
        'if "!PREV!"=="--ks-key-alias" set "ALIAS=%~1"',
        'if "!PREV!"=="--ks" set "KS=%~1"',
        'set "PREV=%~1"',
        'set "LAST=%~1"',
        'goto next',
        ':signed',
        '>>"!HERE!apksigner.log" echo sign alias=!ALIAS! in=!LAST! out=!OUT!',
        'if exist "!HERE!apksigner-bks-only.txt" (echo Failed to load signer "signer #1"& echo java.io.IOException: toDerInputStream rejects tag type 0& exit /b 2)',
        'if not exist "!HERE!apksigner-swaps-keystore.txt" goto copied',
        'copy /y "!HERE!apksigner-swaps-keystore.txt" "!KS!" >nul 2>&1 && (>>"!HERE!apksigner.log" echo keystore swapped) || (>>"!HERE!apksigner.log" echo keystore held)',
        ':copied',
        'set "FROM=!LAST!"',
        'if exist "!HERE!apksigner-swap.apk" set "FROM=!HERE!apksigner-swap.apk"',
        'copy /y "!FROM!" "!OUT!" >nul || exit /b 3',
        'if exist "!LAST!.xmltree" copy /y "!LAST!.xmltree" "!OUT!.xmltree" >nul',
        'del "!OUT!.signer" >nul 2>&1',
        'if not exist "!HERE!apksigner-unmarked.txt" >"!OUT!.signer" echo stand-in alias',
        'exit /b 0')
    # A keytool beside the stand-in java, which patch-for-device.ps1 reads the signing alias's
    # certificate with (Get-KeystoreCertificate). It prints the alias's own certificate, which isn't
    # Tumblr's, the way keytool -list -v prints a fingerprint, and notes what it was handed, with the
    # password it found in the environment, in keytool.log. A case that leaves keytool-fails.txt
    # behind gets the error a wrong password brings, and one that leaves keytool-bks-only.txt has a
    # keystore it reads only as BKS through the BouncyCastle provider.
    $keytoolLog = Join-Path $tools 'keytool.log'
    $keytoolFlag = Join-Path $tools 'keytool-fails.txt'
    $keytoolBksFlag = Join-Path $tools 'keytool-bks-only.txt'
    Set-Content -LiteralPath (Join-Path $tools 'keytool.cmd') -Encoding ASCII -Value @(
        '@echo off',
        '>>"%~dp0keytool.log" echo %* pass=%HUSHTUMBLR_KEYTOOL_STOREPASS%',
        'if exist "%~dp0keytool-fails.txt" (echo keytool error: java.io.IOException: keystore password was incorrect& exit /b 1)',
        'if not exist "%~dp0keytool-bks-only.txt" goto read',
        'echo %* | findstr /l /c:"-storetype BKS -providerclass org.bouncycastle.jce.provider.BouncyCastleProvider -providerpath " >nul && goto read',
        'echo keytool error: java.io.IOException: Invalid keystore format',
        'exit /b 1',
        ':read',
        'echo Alias name: sideload',
        'echo Certificate chain length: 1',
        'echo Certificate[1]:',
        'echo Owner: CN=Stand-in',
        'echo Certificate fingerprints:',
        "echo 	 SHA1: $(@('00') * 20 -join ':')",
        "echo 	 SHA256: $([regex]::Replace($aliasSigner.ToUpperInvariant(), '(..)(?!$)', '$1:'))",
        'exit /b 0')
    $standInKeystore = Join-Path $tools 'sideload.jks'
    Set-Content -LiteralPath $standInKeystore -Value 'stand-in keystore' -Encoding ASCII
    # A java launcher with no keytool beside it, such as Oracle's javapath shim: the keytool read is
    # the one in the bin folder of the runtime it names, and with none named there's no keytool.
    $shimHome = Join-Path $tools 'shim-runtime'
    New-Item -ItemType Directory -Force -Path (Join-Path $shimHome 'bin'), (Join-Path $tools 'shim'), (Join-Path $tools 'bare') | Out-Null
    Copy-Item -LiteralPath (Join-Path $tools 'keytool.cmd') -Destination (Join-Path $shimHome 'bin\keytool.cmd')
    Set-Content -LiteralPath (Join-Path $tools 'shim\java.cmd') -Encoding ASCII -Value @(
        '@echo off',
        "if /i `"%~1`"==`"-XshowSettings:properties`" (echo Property settings:& echo     java.home = $shimHome& echo     java.version = 21) 1>&2",
        'exit /b 0')
    Set-Content -LiteralPath (Join-Path $tools 'bare\java.cmd') -Encoding ASCII -Value @('@echo off', 'exit /b 0')
    $shimCertificate = Get-KeystoreCertificate -Keystore $standInKeystore -Alias 'sideload' -Password 'shim-password' -Java (Join-Path $tools 'shim\java.cmd') -DesktopJar $stubJar
    Assert-True ($shimCertificate -ceq $aliasSigner -and
        (Get-Content -LiteralPath (Join-Path $shimHome 'bin\keytool.log') -Raw) -like '*-alias sideload -storepass:env HUSHTUMBLR_KEYTOOL_STOREPASS pass=shim-password*') `
        "The alias's certificate wasn't read with the keytool of the runtime a java launcher shim starts: '$shimCertificate'"
    # A store with no password, like the morphe.keystore Morphe makes: keytool gets an empty line at
    # its prompt, and no password variable is named or set.
    $emptyCertificate = Get-KeystoreCertificate -Keystore $standInKeystore -Alias 'sideload' -Password '' -Java (Join-Path $tools 'shim\java.cmd') -DesktopJar $stubJar
    $emptyCall = @(Get-Content -LiteralPath (Join-Path $shimHome 'bin\keytool.log'))[-1]
    Assert-True ($emptyCertificate -ceq $aliasSigner -and $emptyCall -clike '*-alias sideload pass=*' -and $emptyCall -notlike '*storepass*') `
        "A keystore with no password wasn't read without one: '$emptyCertificate' $emptyCall"
    Assert-Throws { Get-KeystoreCertificate -Keystore $standInKeystore -Alias 'sideload' -Password 'p' -Java (Join-Path $tools 'bare\java.cmd') -DesktopJar $stubJar } `
        '*No keytool beside *bare\java.cmd or in the bin folder of the runtime it starts*' 'A java with no keytool beside it or in its runtime found one.'
    # And a zipalign beside them, which every patched APK is held to for devices with 16 KB pages
    # (Assert-PageAlignment). It notes what it was asked in zipalign.log and passes the APK, unless
    # a case leaves zipalign-fails.txt behind. The real one is run against real archives in
    # test-resource-table-check.ps1.
    $zipalignLog = Join-Path $tools 'zipalign.log'
    Set-Content -LiteralPath (Join-Path $tools 'zipalign.bat') -Encoding ASCII -Value @(
        '@echo off',
        '>>"%~dp0zipalign.log" echo %*',
        'if exist "%~dp0zipalign-fails.txt" (echo Verification FAILED& exit /b 1)',
        'echo Verification successful',
        'exit /b 0')
    # With the Source Stamp's certificate digest a Play build carries, which apksigner drops.
    New-TestBundleArchive -Path (Join-Path $tools 'patched.apk') -Entries ([ordered]@{
        'AndroidManifest.xml' = 'binary manifest'; 'classes.dex' = "dex`n035"; 'stamp-cert-sha256' = 'stamp' })

    $dependencyNamesHere = @(Get-PatchDependencyNames -PatchList $releaseCatalog -RequestedNames $releaseNames)
    $fixturePaths = @{}
    # Beside the declared builds, a newer one the catalog doesn't declare, the kind a release run
    # patches under -f to see what still applies on it. Each declared build carries the version code
    # the catalog pins it to; the fixtures used to count down from a code of their own, which only
    # the version name made declared.
    $newerBuild = "$([int]($releaseTarget.PackageVersion -split '\.')[0] + 1).0.0.1.1"
    $newerCode = 512008382
    foreach ($build in @($newerBuild) + @($releaseTarget.PackageVersions)) {
        $stockMinSdk = if ($build -eq $newerBuild) { 36 } else { 21 }
        $versionCode = if ($build -eq $newerBuild) { $newerCode } else { [long]@($releaseTarget.PackageVersionCodes[$build])[0] }
        $apkm = Join-Path $fixtures "tumblr-$build-$versionCode.xapk"
        # The base names the fixture it was packed into, which the JDK stand-in reads back as it
        # merges: the merger is handed the directory the APKs were unpacked into, not the bundle.
        New-TestBundleArchive -Path $apkm -Entries ([ordered]@{
            'com.tumblr.apk' = "N: stand-in-bundle=$apkm`n" + (Get-FixtureManifest -Build $build -Code "$versionCode" -MinSdk $stockMinSdk)
            'icon.png' = 'icon'
            'config.arm64_v8a.apk' = Get-FixtureSplitManifest -Code "$versionCode" -Split 'config.arm64_v8a'
            'manifest.json' = ("{`"package_name`":`"com.tumblr`",`"version_code`":`"$versionCode`",`"split_apks`":[" +
                '{"file":"com.tumblr.apk","id":"base"},{"file":"config.arm64_v8a.apk","id":"config.arm64_v8a"}]}') })
        Set-Content -LiteralPath "$apkm.merged.txt" -Encoding ASCII -NoNewline `
            -Value (Get-FixtureManifest -Build $build -Code "$versionCode" -WithSplit -MinSdk $stockMinSdk)
        Set-Content -LiteralPath "$apkm.patched.txt" -Encoding ASCII -NoNewline `
            -Value (Get-FixtureManifest -Build $build -Code "$versionCode" -WithSplit -Patched -MinSdk $stockMinSdk)
        # The report the CLI writes: every patch and the internal dependencies applied, one step,
        # and the input's own version, which is what the CLI reports.
        Set-Content -LiteralPath "$apkm.result.json" -Encoding ASCII -Value ([ordered]@{
            patchingSteps = @([ordered]@{ success = $true })
            appliedPatches = @(@($releaseNames) + @($dependencyNamesHere) | ForEach-Object { [ordered]@{ name = $_ } })
            failedPatches = @()
            packageName = $releaseTarget.PackageName
            packageVersion = $build } | ConvertTo-Json -Depth 6)
        $fixturePaths[$build] = $apkm
    }
    # And another build of the oldest declared version, as one Tumblr release can come as several
    # arm64 builds: the declared name at a code the catalog doesn't pin, as an APKMirror .apkm. Only
    # its base manifest, since every script has to refuse it before anything is merged or patched.
    $variantBuild = @($releaseTarget.PackageVersions)[-1]
    $variantCode = [long]@($releaseTarget.PackageVersionCodes[$variantBuild])[0] - 61
    $variantApkm = Join-Path $fixtures "tumblr-$variantBuild-variant-arm64-v8a.apkm"
    New-TestBundleArchive -Path $variantApkm -Entries ([ordered]@{
        'info.json' = "{`"versioncode`":`"$variantCode`"}"
        'base.apk' = Get-FixtureManifest -Build $variantBuild -Code "$variantCode" })

    # Every APK a merge is made from has to carry Tumblr's declared signer, and only it, and belong
    # to one build of the package, before the merger reads it (Get-MergedApk). Each refusal comes
    # before the JDK is started (no merge.log), names the APK and the reason, and leaves no merge,
    # no record of one and no unpacked folder behind.
    $authRoot = Join-Path $releaseRoot 'split-auth'
    New-Item -ItemType Directory -Path $authRoot -Force | Out-Null
    $authMerge = Join-Path $authRoot 'merged.apk'
    $authCode = [string]@($releaseTarget.PackageVersionCodes[$releaseTarget.PackageVersion])[0]
    $authBase = Get-FixtureManifest -Build $releaseTarget.PackageVersion -Code $authCode
    function Invoke-AuthMerge([string]$Apk) {
        Remove-Item -LiteralPath $mergeLog -Force -ErrorAction SilentlyContinue
        Get-MergedApk -Apk $Apk -Destination $authMerge -Java $stubJava -DesktopJar $stubJar `
            -Aapt2 $stubAapt2 -PackageName $releaseTarget.PackageName -Signers @($releaseSigner)
    }
    function Get-TextSha256([string]$Text) {
        $sha = [System.Security.Cryptography.SHA256]::Create()
        try { return ([BitConverter]::ToString($sha.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($Text))) -replace '-', '').ToLowerInvariant() }
        finally { $sha.Dispose() }
    }
    $authCases = @(
        @{ Case = 'an unsigned split'; Marker = 'stand-in-unsigned'; Says = 'config.arm64_v8a.apk does not verify (*DOES NOT VERIFY*' }
        @{ Case = 'a split whose bytes changed after signing'; Marker = 'stand-in-tampered'; Says = 'config.arm64_v8a.apk does not verify (*integrity check failed*' }
        @{ Case = 'a split signed by somebody else'; Marker = 'stand-in-foreign'
            Says = "config.arm64_v8a.apk is signed by $foreignSigner, which isn't a certificate patches-list.json declares for $($releaseTarget.PackageName)" }
        @{ Case = 'a split signed by somebody else beside Tumblr'; Marker = 'stand-in-second-signer'
            Says = "config.arm64_v8a.apk is signed by $foreignSigner, which isn't a certificate*" }
        @{ Case = 'an unsigned base'; BaseMarker = 'stand-in-unsigned'; Says = 'com.tumblr.apk does not verify*' }
        @{ Case = 'a split of another app'; Package = 'com.example.nottumblr'
            Says = "config.arm64_v8a.apk is com.example.nottumblr, not $($releaseTarget.PackageName)" }
        @{ Case = 'a split of another build'; Code = '1'; Says = 'its APKs carry more than one version code*' }
        @{ Case = 'a second base'; Extra = $authBase; Says = 'it holds 2 base APKs*' }
        @{ Case = 'no base'; NoBase = $true; Says = 'it holds 0 base APKs*' }
        @{ Case = 'one split name twice'; Extra = (Get-FixtureSplitManifest -Code $authCode -Split 'config.arm64_v8a')
            Says = 'config.arm64_v8a.apk and config.extra.apk are both split config.arm64_v8a*' }
    )
    foreach ($case in $authCases) {
        $entries = [ordered]@{}
        if (-not $case.NoBase) {
            $entries['com.tumblr.apk'] = $(if ($case.BaseMarker) { "N: $($case.BaseMarker)`n" } else { '' }) + $authBase
        }
        $splitCode = if ($case.Code) { $case.Code } else { $authCode }
        $splitPackage = if ($case.Package) { $case.Package } else { $releaseTarget.PackageName }
        $entries['config.arm64_v8a.apk'] = Get-FixtureSplitManifest -Code $splitCode -Split 'config.arm64_v8a' -Package $splitPackage -Marker $case.Marker
        if ($case.Extra) { $entries['config.extra.apk'] = $case.Extra }
        $authBundle = Join-Path $authRoot 'auth.xapk'
        Remove-Item -LiteralPath $authBundle -Force -ErrorAction SilentlyContinue
        New-TestBundleArchive -Path $authBundle -Entries $entries
        Assert-Throws { Invoke-AuthMerge $authBundle } "*Refusing auth.xapk: $($case.Says)*Nothing was merged or patched.*" `
            "Get-MergedApk took a bundle with $($case.Case)."
        Assert-True (-not (Test-Path -LiteralPath $mergeLog) -and -not (Test-Path -LiteralPath $authMerge) -and
            -not (Test-Path -LiteralPath "$authMerge.authentic.json") -and
            @(Get-ChildItem -LiteralPath $authRoot -Force -Filter '.splits-*').Count -eq 0) `
            "Refusing a bundle with $($case.Case) started the merge or left something behind."
    }
    # The control: a Source Stamp beside Tumblr's signer is the store's and passes, the merger is
    # handed the checked APKs, and the record beside the merge names them and the base.
    $stampedBundle = Join-Path $authRoot 'stamped.xapk'
    $stampedBase = "N: stand-in-bundle=$stampedBundle`n" + $authBase
    $stampedSplit = Get-FixtureSplitManifest -Code $authCode -Split 'config.arm64_v8a' -Marker 'stand-in-stamp'
    New-TestBundleArchive -Path $stampedBundle -Entries ([ordered]@{ 'com.tumblr.apk' = $stampedBase; 'config.arm64_v8a.apk' = $stampedSplit })
    Set-Content -LiteralPath "$stampedBundle.merged.txt" -Encoding ASCII -NoNewline -Value $authBase
    $stampedMerge = Invoke-AuthMerge $stampedBundle
    $stampedRecord = Get-Content -LiteralPath "$authMerge.authentic.json" -Raw | ConvertFrom-Json
    Assert-True ($stampedMerge -eq $authMerge -and (@(Get-Content -LiteralPath $mergeLog) -join ';') -eq "merge $stampedBundle" -and
        $stampedRecord.package -ceq $releaseTarget.PackageName -and [string]$stampedRecord.versionCode -ceq $authCode -and
        (@($stampedRecord.signers) -join ',') -ceq $releaseSigner[0] -and
        $stampedRecord.baseSha256 -ceq (Get-TextSha256 $stampedBase) -and
        $stampedRecord.mergedSha256 -ceq (Get-Sha256Hex -Path $authMerge).ToLowerInvariant() -and
        $stampedRecord.sourceSha256 -ceq (Get-Sha256Hex -Path $stampedBundle).ToLowerInvariant() -and
        (Get-HeldSourceSha256 -Merged $authMerge) -ceq $stampedRecord.sourceSha256 -and
        ((@($stampedRecord.apks | ForEach-Object { "$($_.name)=$($_.sha256)=$($_.split)" }) | Sort-Object) -join ';') -ceq
            ((@("com.tumblr.apk=$(Get-TextSha256 $stampedBase)=", "config.arm64_v8a.apk=$(Get-TextSha256 $stampedSplit)=config.arm64_v8a") |
                Sort-Object) -join ';') -and
        @(Get-ChildItem -LiteralPath $authRoot -Force -Filter '.splits-*').Count -eq 0) `
        "A bundle whose split carries a Source Stamp beside Tumblr's signer was not merged and recorded: $($stampedRecord | ConvertTo-Json -Compress -Depth 4)"
    # A plain APK is checked the same way and handed on as a copy of the bytes that were checked,
    # with no merge. A refusal after it leaves that copy and its record as they were.
    $plainAuth = Join-Path $authRoot 'plain.apk'
    [System.IO.File]::WriteAllText($plainAuth, $authBase)
    $plainCopy = Invoke-AuthMerge $plainAuth
    $plainRecord = Get-Content -LiteralPath "$authMerge.authentic.json" -Raw | ConvertFrom-Json
    Assert-True ($plainCopy -eq $authMerge -and [System.IO.File]::ReadAllText($authMerge) -ceq $authBase -and
        -not (Test-Path -LiteralPath $mergeLog) -and $plainRecord.baseSha256 -ceq (Get-TextSha256 $authBase) -and
        $plainRecord.mergedSha256 -ceq $plainRecord.baseSha256 -and -not $plainRecord.signedForm -and
        $plainRecord.sourceSha256 -ceq (Get-TextSha256 $authBase) -and (Get-HeldSourceSha256 -Merged $authMerge) -ceq $plainRecord.sourceSha256) `
        'A plain APK signed by Tumblr was not handed on as a checked copy with its record, named by its own digest.'
    $keptCopy = Get-Sha256Hex -Path $authMerge
    $keptRecord = Get-Sha256Hex -Path "$authMerge.authentic.json"
    foreach ($plainCase in @(
            @{ Case = 'signed by somebody else'; Text = "N: stand-in-foreign`n$authBase"; Says = "it is signed by $foreignSigner*" },
            @{ Case = 'signed by somebody else beside Tumblr'; Text = "N: stand-in-second-signer`n$authBase"; Says = "it is signed by $foreignSigner*" },
            @{ Case = 'unsigned with no bundle beside it'; Text = "N: stand-in-unsigned`n$authBase"
                Says = 'it does not verify (*no .apkm, .xapk or .apks of the same name beside it*' },
            @{ Case = 'a split'; Text = (Get-FixtureSplitManifest -Code $authCode -Split 'config.arm64_v8a'); Says = 'it is the split config.arm64_v8a, not a whole app' },
            @{ Case = 'another app'; Text = (Get-FixtureManifest -Build $releaseTarget.PackageVersion -Code $authCode -Package 'com.example.nottumblr')
                Says = "it is com.example.nottumblr, not $($releaseTarget.PackageName)" })) {
        [System.IO.File]::WriteAllText($plainAuth, $plainCase.Text)
        Assert-Throws { Invoke-AuthMerge $plainAuth } "*Refusing plain.apk: $($plainCase.Says)*Nothing was merged or patched.*" `
            "Get-MergedApk took a plain APK $($plainCase.Case)."
        Assert-True ((Get-Sha256Hex -Path $authMerge) -ceq $keptCopy -and (Get-Sha256Hex -Path "$authMerge.authentic.json") -ceq $keptRecord -and
            @(Get-ChildItem -LiteralPath $authRoot -Force -Filter '.splits-*').Count -eq 0) `
            "Refusing a plain APK $($plainCase.Case) changed the last checked copy or left something behind."
    }
    # What Get-MergedApk hands back is held, in this process, from that moment until Close-MergedApk:
    # no handle that could write to it opens (a sharing violation, 0x80070020), so the CLI, the
    # signer and every check read the bytes that were checked. Let go, it is an ordinary file again.
    # A second process is tried against the real merger in test-resource-table-check.ps1.
    $openToWrite = { [System.IO.File]::Open($authMerge, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Write,
            [System.IO.FileShare]'ReadWrite, Delete').Dispose() }
    $turnedAway = $null
    try { & $openToWrite } catch { $turnedAway = $_.Exception.GetBaseException() }
    Assert-True ((Get-HeldMerges).ContainsKey($authMerge) -and $turnedAway -is [System.IO.IOException] -and
        $turnedAway.HResult -eq -2147024864) "A checked copy that Get-MergedApk still holds could be opened to write: $turnedAway"
    Close-MergedApk -Merged $authMerge
    & $openToWrite
    Assert-True (-not (Get-HeldMerges).ContainsKey($authMerge)) 'Close-MergedApk left the checked copy held.'
    $releaseBundle = Get-ReleaseBundlePath -Root $releaseRepo
    New-Item -ItemType Directory -Path (Split-Path -Parent $releaseBundle) -Force | Out-Null
    New-TestBundleArchive -Path $releaseBundle -Entries ([ordered]@{
        'META-INF/MANIFEST.MF' = ("Manifest-Version: 1.0`nVersion: $releaseVersionHere`nTimestamp: $($releaseSeconds * 1000)`n" +
            "Patcher-Version: $($releaseToolchain.PatcherVersion)`n`n")
        'classes.dex' = "dex`n035" + ('patches' * 8)
        'extensions/tumblr.mpe' = "dex`n035" + ('payload' * 8) })
    # And the SBOM buildAndroid writes beside it, listing a library OSV has nothing against.
    $releaseSbom = [System.IO.Path]::ChangeExtension($releaseBundle, '.cdx.json')
    New-TestSbom -Path $releaseSbom -Bundle $releaseBundle

    # The builder reads git with a plain `git -C`, which a GIT_DIR inherited from a hook would
    # override, so every GIT_* variable is cleared for the length of a run. OSV is the stand-in
    # above, and what the builder says is kept in $builderSaid, warnings included.
    $builderSaid = ''
    function Invoke-ReceiptBuilder([string[]]$Fixtures, [string]$Bundle,
            [string]$WorkDir = (Join-Path $releaseRoot 'work'), [string]$DesktopJar = $stubJar, [switch]$SkipAdvisoryCheck) {
        Remove-Item -LiteralPath $javaLog, $mergeLog -Force -ErrorAction SilentlyContinue
        $saved = @{}
        foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
            $saved[$variable.Name] = $variable.Value
            Remove-Item -LiteralPath ('Env:\' + $variable.Name)
        }
        try {
            . $osvStandIn
            $global:LASTEXITCODE = 0
            $arguments = @{ Root = $releaseRepo; Fixture = $Fixtures; WorkDir = $WorkDir; DesktopJar = $DesktopJar
                Java = $stubJava; Aapt2 = $stubAapt2; AndroidJar = $stubAndroidJar; ApiVersions = $stubApiVersions }
            if ($Bundle) { $arguments['Bundle'] = $Bundle }
            if ($SkipAdvisoryCheck) { $arguments['SkipAdvisoryCheck'] = $true }
            $script:builderSaid = @(& (Join-Path $PSScriptRoot 'build-release-receipt.ps1') @arguments 3>&1 6>&1 |
                ForEach-Object { "$_" }) -join "`n"
            if ($LASTEXITCODE -ne 0) { throw "build-release-receipt.ps1 exited $LASTEXITCODE." }
        } finally {
            foreach ($name in $saved.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $saved[$name] }
        }
    }

    # A fixture for every declared build and the newer one: one target each, only the newer build
    # forced, every patch applied, and no manifest change but the approved ones, because the patched
    # manifest is held to the merge and not to the base.
    # The allowlist names the ad services property alone. Taking it out of the application changes
    # the application's declaration, which the delta records as that declaration replaced.
    $propertyTemplate = @($releaseSelectedAllowlist |
        Where-Object { $_ -clike 'component-removed {"owner":"application","declaration":{"tag":"property",*' })
    Assert-True ($propertyTemplate.Count -eq 1) "The allowlist has no single ad services property template: $($propertyTemplate -join ', ')"
    $applications = @(foreach ($patchedSide in @($false, $true)) {
        @((ConvertFrom-ManifestXmlTree -Source 'application fixture' -Lines (
            (Get-FixtureManifest -Build $releaseTarget.PackageVersion -Code '1' -Patched:$patchedSide) -split '\r?\n')).components |
            Where-Object { ($_ | ConvertFrom-Json).tag -ceq 'application' })
    })
    Assert-True ($applications.Count -eq 2 -and $applications[0] -cne $applications[1] -and
            $applications[0] -clike '*android.adservices.AD_SERVICES_CONFIG*' -and $applications[1] -cnotlike '*AD_SERVICES_CONFIG*' -and
            $applications[1] -clike '*PROPERTY_COMPAT_ALLOW_RESTRICTED_RESIZABILITY*') `
        "The fixture application does not lose its ad services property alone: $($applications -join ' -> ')"
    $expectedChanges = @(@($releaseSelectedAllowlist | Where-Object { $_ -cne $propertyTemplate[0] }) +
        @("component-removed $($applications[0])", "component-added $($applications[1])") | Sort-Object -Unique -CaseSensitive)
    $builtBuilds = @($releaseTarget.PackageVersions) + @($newerBuild)
    $allFixtures = @($builtBuilds | ForEach-Object { $fixturePaths[$_] })
    Remove-Item -LiteralPath $releaseQueueLog -Force -ErrorAction SilentlyContinue
    try {
        Invoke-ReceiptBuilder -Fixtures $allFixtures
    } catch {
        throw "build-release-receipt.ps1 refused a run of every declared build: $($_.Exception.Message)"
    }
    $built = Get-Content -LiteralPath $releaseReceipt -Raw | ConvertFrom-Json
    $builtTargets = @($built.targets)
    $builtVersions = @($builtTargets | ForEach-Object { [string]$_.source.versionName })
    Assert-True (($builtVersions -join ',') -eq ($builtBuilds -join ',')) `
        "The receipt does not hold one run of each fixture: $($builtVersions -join ', ')"
    foreach ($builtTarget in $builtTargets) {
        $label = [string]$builtTarget.source.versionName
        $declared = $releaseTarget.PackageVersions -contains $label
        Assert-True ($builtTarget.source.forced -eq (-not $declared)) `
            "The receipt says $label was $(if ($builtTarget.source.forced) { 'forced' } else { 'not forced' })."
        Assert-True ($builtTarget.source.sha256 -eq (Get-Sha256Hex -Path $fixturePaths[$label])) `
            "The receipt does not hash the $label fixture it was given."
        # These fixtures are bundles, which vouch for themselves: the field is there, and null.
        Assert-True ($null -ne $builtTarget.source.PSObject.Properties['signedFormSha256'] -and $null -eq $builtTarget.source.signedFormSha256) `
            "The receipt names a bundle that vouched for the $label bundle: $($builtTarget.source.signedFormSha256)"
        Assert-True (@($builtTarget.patches | Where-Object { $_.applied }).Count -eq $releaseNames.Count) `
            "The receipt does not record every patch applied to $label."
        $stockMinSdk = if ($label -eq $newerBuild) { 36 } else { 21 }
        Assert-True ($builtTarget.sdk.stockMinSdk -eq $stockMinSdk -and
                $builtTarget.sdk.patchedMinSdk -eq [Math]::Max($stockMinSdk, 26)) `
            "The receipt does not record the binary SDK floor measured for $label."
        # The alias, the collection switches and the ad declarations are the patches' changes. The
        # split's activity the merge brings in is the merge's.
        $changes = @(ConvertTo-ManifestDeltaEntries -Delta $builtTarget.manifestDelta)
        Assert-True (($changes -join "`n") -ceq ($expectedChanges -join "`n")) `
            "The receipt records other manifest changes for $label than the patches' own: $($changes -join ', ')"
    }
    # Each fixture merged once, and the CLI handed that merge rather than the bundle: the CLI deletes
    # its own merge, and the manifest delta above is taken against this one.
    $mergeRuns = @(Get-Content -LiteralPath $mergeLog)
    Assert-True (($mergeRuns -join "`n") -eq (@($builtBuilds | ForEach-Object { "merge $($fixturePaths[$_])" }) -join "`n")) `
        "Each fixture was not merged once, before it was patched: $($mergeRuns -join '; ')"
    $patchRuns = @(Get-Content -LiteralPath $javaLog)
    $expectedRuns = @($builtBuilds | ForEach-Object {
        "patch $($fixturePaths[$_]) merged forced=$(if ($releaseTarget.PackageVersions -contains $_) { 0 } else { 1 })" })
    Assert-True (($patchRuns -join "`n") -eq ($expectedRuns -join "`n")) `
        "The CLI was not run once per fixture, on its merge, with -f for the undeclared build only: $($patchRuns -join '; ')"
    # A receipt is a release's, so every job it ran took a slot in the build queue at release
    # priority and gave it back, one CLI patch run per fixture, and the run left
    # BUILD_QUEUE_PRIORITY the way it found it.
    $queueLines = @(Get-Content -LiteralPath $releaseQueueLog)
    $queueEntries = @($queueLines | Where-Object { $_ -like 'enter *' })
    Assert-True ($queueEntries.Count -gt 0 -and
        @($queueEntries | Where-Object { $_ -notlike 'enter release hushtumblr *' }).Count -eq 0 -and
        @($queueLines | Where-Object { $_ -like 'exit *' }).Count -eq $queueEntries.Count -and
        @($queueEntries | Where-Object { $_ -ceq 'enter release hushtumblr receipt patch' }).Count -eq $builtBuilds.Count -and
        $null -eq $env:BUILD_QUEUE_PRIORITY) `
        "The receipt's jobs did not each take and give back a release slot in the build queue: $($queueLines -join '; ')"
    # The SBOM beside the bundle, recorded by name, hash and count, once OSV had been asked about it.
    Assert-True ($built.sbom.file -eq "patches-$releaseVersionHere.cdx.json" -and
        $built.sbom.sha256 -ceq (Get-Sha256Hex -Path $releaseSbom) -and [int]$built.sbom.components -eq 3) `
        "The receipt does not record the SBOM beside the bundle: $($built.sbom | ConvertTo-Json -Compress)"
    Assert-True ($builderSaid -like "*OSV has no advisory for the libraries patches-$releaseVersionHere.cdx.json lists: gson 2.14.0*") `
        "The receipt builder did not put the SBOM's libraries to OSV: $builderSaid"
    # And the receipt the builder writes is one the release check accepts.
    $said = Invoke-ReleaseCheck
    $builtProved = "the receipt proves $($releaseNames.Count) patches on $($builtVersions -join ', ') " +
        "from commit $($releaseCommit.Substring(0, 8))"
    Assert-True ($said -like "*$builtProved*") "The release check did not accept the receipt the builder wrote: $said"

    # The builder must read and reject a wrong binary minimum, not merely write SDK facts that
    # agree with themselves. Both sides of API 26 and a higher stock floor are exercised.
    foreach ($wrongSdk in @(
            @{ Build = $releaseTarget.PackageVersion; Stock = 21; Patched = 25; Expected = 26 },
            @{ Build = $releaseTarget.PackageVersion; Stock = 21; Patched = 27; Expected = 26 },
            @{ Build = $newerBuild; Stock = 36; Patched = 26; Expected = 36 })) {
        $manifestPath = "$($fixturePaths[$wrongSdk.Build]).patched.txt"
        $manifestBytes = [System.IO.File]::ReadAllBytes($manifestPath)
        try {
            $text = [System.IO.File]::ReadAllText($manifestPath)
            $text = $text -replace '(minSdkVersion\(0x0101020c\)=)\d+', "`${1}$($wrongSdk.Patched)"
            [System.IO.File]::WriteAllText($manifestPath, $text, [System.Text.Encoding]::ASCII)
            Assert-Throws { Invoke-ReceiptBuilder -Fixtures $allFixtures } `
                "*patched binary minSdk is $($wrongSdk.Patched); stock is $($wrongSdk.Stock), so it must be $($wrongSdk.Expected)*" `
                'The receipt builder accepted an APK with the wrong binary minimum SDK.'
        } finally {
            [System.IO.File]::WriteAllBytes($manifestPath, $manifestBytes)
        }
    }

    # A patched fixture whose injected code fails the structural check, or calls a class or member
    # the build lacks, stops the run with no receipt. HushPinterest 0.0.3 shipped a System share sheet
    # call into a class from another Pinterest build because the builder read only the CLI's verdicts.
    # So does one zipalign -c -P 16 -v 4 doesn't pass, which a device with 16 KB pages can't load.
    $builtReceiptBeforeChecks = [System.IO.File]::ReadAllBytes($releaseReceipt)
    foreach ($broken in @(
            @{ Flag = 'dexdiff-fails.txt'; Pattern = '*failed its structural or host reference checks (exit 1)*' },
            @{ Flag = 'references-fails.txt'; Pattern = '*failed its structural or host reference checks (exit 1)*' },
            @{ Flag = 'zipalign-fails.txt'; Pattern = "*zipalign -c -P 16 -v 4 didn't pass *.apk (exit 1)*Verification FAILED*" })) {
        $flag = Join-Path $tools $broken.Flag
        Set-Content -LiteralPath $flag -Value 'on' -Encoding ASCII
        Remove-Item -LiteralPath $releaseReceipt -Force
        try {
            Assert-Throws { Invoke-ReceiptBuilder -Fixtures $allFixtures } $broken.Pattern `
                "build-release-receipt.ps1 went ahead when $($broken.Flag -replace '\.txt$', '')."
            Assert-True (-not (Test-Path -LiteralPath $releaseReceipt)) `
                "build-release-receipt.ps1 wrote a receipt when $($broken.Flag -replace '\.txt$', '')."
            Assert-True (@(Get-ChildItem -LiteralPath (Join-Path $releaseRoot 'work') -Directory -Filter 'receipt-*').Count -eq 0) `
                "build-release-receipt.ps1 left its run folder behind when $($broken.Flag -replace '\.txt$', '')."
        } finally {
            Remove-Item -LiteralPath $flag -Force -ErrorAction SilentlyContinue
            [System.IO.File]::WriteAllBytes($releaseReceipt, $builtReceiptBeforeChecks)
        }
    }

    # A merge that fails, and one that exits 0 and writes nothing, stop the run before the CLI
    # patches anything. base.apk is not what the CLI patches, so there's no receipt to fall back to.
    # So does a merger that doesn't say what it wrote: the scripts take the merged APK only as the
    # bytes whose digest the merger printed on its standard output, one line of it, and a merger
    # that prints none, two, or one on standard error alone leaves nothing to hold the file to.
    # One that prints the digest of other bytes is the same to them as a file swapped after it.
    $builtReceiptBeforeMerge = [System.IO.File]::ReadAllBytes($releaseReceipt)
    $brokenMerges = @(
        @{ Flag = 'merge-fails.txt'; Pattern = '*Could not merge tumblr-*.xapk into one APK (exit 9)*could not read the bundle*' },
        @{ Flag = 'merge-writes-nothing.txt'; Pattern = '*The merge of tumblr-*.xapk wrote no APK at *stock-merged.apk*' },
        @{ Flag = 'merge-prints-no-digest.txt'; Pattern = '*The merge of tumblr-*.xapk printed 0 digests of what it wrote on its standard output, where it prints one*' },
        @{ Flag = 'merge-prints-digest-on-stderr.txt'; Pattern = '*The merge of tumblr-*.xapk printed 0 digests of what it wrote on its standard output, where it prints one*' },
        @{ Flag = 'merge-prints-two-digests.txt'; Pattern = '*The merge of tumblr-*.xapk printed 2 digests of what it wrote on its standard output, where it prints one*' },
        @{ Flag = 'merge-prints-other-digest.txt'
            Pattern = ("*The merge of tumblr-*.xapk at *stock-merged.apk isn't what was written there: read through a handle nothing else can " +
                "write past, it hashes to *, and what was written hashed to $('0' * 64).*") })
    foreach ($broken in $brokenMerges) {
        $flag = Join-Path $tools $broken.Flag
        Set-Content -LiteralPath $flag -Value 'on' -Encoding ASCII
        Remove-Item -LiteralPath $releaseReceipt -Force
        try {
            Assert-Throws { Invoke-ReceiptBuilder -Fixtures $allFixtures } $broken.Pattern `
                "build-release-receipt.ps1 went ahead when $($broken.Flag -replace '\.txt$', '')."
            Assert-True (-not (Test-Path -LiteralPath $javaLog) -and -not (Test-Path -LiteralPath $releaseReceipt)) `
                "build-release-receipt.ps1 patched or wrote a receipt when $($broken.Flag -replace '\.txt$', '')."
            Assert-True (@(Get-ChildItem -LiteralPath (Join-Path $releaseRoot 'work') -Directory -Filter 'receipt-*').Count -eq 0) `
                "build-release-receipt.ps1 left its run folder behind when $($broken.Flag -replace '\.txt$', '')."
        } finally {
            Remove-Item -LiteralPath $flag -Force -ErrorAction SilentlyContinue
            [System.IO.File]::WriteAllBytes($releaseReceipt, $builtReceiptBeforeMerge)
        }
    }

    # verify-all-patches.ps1 on the same stand-ins, with the apksigner beside aapt2 that names
    # Tumblr's signer. Once the CLI stopped leaving its merge behind (1.17.0) it held the
    # patched table to base.apk, so the resources a split bundle's other slices carry were never
    # compared. It merges first now:
    # the CLI is handed the merge, the resource check's stock side is that merge, and a bundle that
    # yields no merged APK stops the run before anything is patched. A plain APK goes to the CLI as
    # it is and is its own stock side.
    $verifyAllScript = Join-Path $PSScriptRoot 'verify-all-patches.ps1'
    function Invoke-VerifyAll([string]$Apk, [switch]$Force, [string]$KeepIn, [string]$Bundle = $releaseBundle, [switch]$NoReuse) {
        Remove-Item -LiteralPath $javaLog, $mergeLog, $resourceStock -Force -ErrorAction SilentlyContinue
        $global:LASTEXITCODE = 0
        $kept = if ($KeepIn) { @{ KeepIn = $KeepIn } } else { @{} }
        $said = @(& $verifyAllScript -Apk $Apk -DesktopJar $stubJar -WorkDir (Join-Path $releaseRoot 'verify-work') `
            -Bundle $Bundle -PatchList (Join-Path $releaseRepo 'patches-list.json') -Java $stubJava `
            -Aapt2 $stubAapt2 -AndroidJar $stubAndroidJar -ApiVersions $stubApiVersions -Force:$Force -NoReuse:$NoReuse @kept 3>&1 6>&1 |
            ForEach-Object { "$_" }) -join "`n"
        if ($LASTEXITCODE -ne 0) { throw "verify-all-patches.ps1 exited $LASTEXITCODE`: $said" }
        return $said
    }
    $newestFixture = $fixturePaths[$releaseTarget.PackageVersion]
    Remove-Item -LiteralPath $releaseQueueLog -Force -ErrorAction SilentlyContinue
    $said = Invoke-VerifyAll -Apk $newestFixture
    # An everyday verification: each of its five heavy jobs takes an ordinary slot in turn and
    # gives it back before the next one starts.
    $expectedQueue = @('merge', 'verify patch', 'verify resources', 'dex diff', 'host references' |
        ForEach-Object { "enter normal hushtumblr $_"; "exit hushtumblr $_" })
    Assert-True ((@(Get-Content -LiteralPath $releaseQueueLog) -join '|') -ceq ($expectedQueue -join '|')) `
        "verify-all-patches.ps1 did not run each heavy job in its own build queue slot: $(@(Get-Content -LiteralPath $releaseQueueLog) -join '; ')"
    Assert-True ($said -like "*merged $(Split-Path -Leaf $newestFixture) into one APK for the CLI*" -and
        $said -like '*success: every requested patch applied*') "verify-all-patches.ps1 did not merge the bundle and pass: $said"
    Assert-True ((@(Get-Content -LiteralPath $mergeLog) -join "`n") -eq "merge $newestFixture" -and
        (@(Get-Content -LiteralPath $javaLog) -join "`n") -eq "patch $newestFixture merged forced=0") `
        ("verify-all-patches.ps1 did not merge the bundle once and hand the CLI that merge: " +
            "$(@(Get-Content -LiteralPath $javaLog) -join '; ')")
    Assert-True ((Get-Content -LiteralPath $resourceStock -Raw) -ceq (Get-Content -LiteralPath "$newestFixture.merged.txt" -Raw)) `
        'The resource check was not handed the merge as its stock side.'
    Assert-True ($said -like '*binary minSdk: 21 -> 26 (max(stock, 26))*') `
        "The verification run did not check the binary API 26 floor: $said"
    $higher = Invoke-VerifyAll -Apk $fixturePaths[$newerBuild] -Force
    Assert-True ($higher -like '*binary minSdk: 36 -> 36 (max(stock, 26))*' -and
            $higher -like '*success: every requested patch applied*') `
        "The verification run did not preserve a higher stock SDK floor: $higher"
    foreach ($wrongSdk in @(
            @{ Build = $releaseTarget.PackageVersion; Stock = 21; Patched = 28; Expected = 26 },
            @{ Build = $newerBuild; Stock = 36; Patched = 29; Expected = 36 })) {
        $manifestPath = "$($fixturePaths[$wrongSdk.Build]).patched.txt"
        $manifestBytes = [System.IO.File]::ReadAllBytes($manifestPath)
        try {
            $text = [System.IO.File]::ReadAllText($manifestPath)
            $text = $text -replace '(minSdkVersion\(0x0101020c\)=)\d+', "`${1}$($wrongSdk.Patched)"
            [System.IO.File]::WriteAllText($manifestPath, $text, [System.Text.Encoding]::ASCII)
            Assert-Throws { Invoke-VerifyAll -Apk $fixturePaths[$wrongSdk.Build] -Force:($wrongSdk.Build -eq $newerBuild) } `
                "*patched binary minSdk is $($wrongSdk.Patched); stock is $($wrongSdk.Stock), so it must be $($wrongSdk.Expected)*" `
                'The verification run accepted an APK with the wrong binary minimum SDK.'
            Assert-True (-not (Test-Path -LiteralPath $resourceStock)) `
                'SDK floor validation did not stop before the resource comparison.'
        } finally {
            [System.IO.File]::WriteAllBytes($manifestPath, $manifestBytes)
        }
    }
    foreach ($broken in $brokenMerges) {
        $flag = Join-Path $tools $broken.Flag
        Set-Content -LiteralPath $flag -Value 'on' -Encoding ASCII
        try {
            Assert-Throws { Invoke-VerifyAll -Apk $newestFixture } $broken.Pattern `
                "verify-all-patches.ps1 went ahead when $($broken.Flag -replace '\.txt$', '')."
            Assert-True (-not (Test-Path -LiteralPath $javaLog) -and -not (Test-Path -LiteralPath $resourceStock)) `
                "verify-all-patches.ps1 patched or compared a table when $($broken.Flag -replace '\.txt$', '')."
        } finally {
            Remove-Item -LiteralPath $flag -Force -ErrorAction SilentlyContinue
        }
    }
    $plainFixture = Join-Path $fixtures "tumblr-$($releaseTarget.PackageVersion)-arm64-v8a.apk"
    $newestCode = [regex]::Match((Get-Content -LiteralPath "$newestFixture.merged.txt" -Raw),
        'versionCode\(0x0101021b\)=(\d+)').Groups[1].Value
    # The CLI is handed the copy of it that was checked against Tumblr's signer, which names the
    # fixture it was copied from for the JDK stand-in.
    $plainManifest = "N: stand-in-bundle=$plainFixture`n" + (Get-FixtureManifest -Build $releaseTarget.PackageVersion -Code $newestCode)
    Set-Content -LiteralPath $plainFixture -Encoding ASCII -NoNewline -Value $plainManifest
    Copy-Item -LiteralPath "$newestFixture.result.json" -Destination "$plainFixture.result.json"
    # Patched from the plain APK itself: its manifest with the patches' change and no split's
    # component, which verify-all-patches.ps1 would refuse as a change nobody approved.
    Set-Content -LiteralPath "$plainFixture.patched.txt" -Encoding ASCII -NoNewline `
        -Value (Get-FixtureManifest -Build $releaseTarget.PackageVersion -Code $newestCode -Patched)
    try {
        $said = Invoke-VerifyAll -Apk $plainFixture
        Assert-True ($said -like '*success: every requested patch applied*' -and $said -notlike '*into one APK for the CLI*' -and
            -not (Test-Path -LiteralPath $mergeLog) -and
            (@(Get-Content -LiteralPath $javaLog) -join "`n") -eq "patch $plainFixture forced=0" -and
            (Get-Content -LiteralPath $resourceStock -Raw) -ceq (Get-Content -LiteralPath $plainFixture -Raw)) `
            "verify-all-patches.ps1 did not patch a plain APK as it is and hold the table to it: $said"
        # One that isn't signed by Tumblr alone, or doesn't verify and has no bundle beside it to be
        # the merge of, is refused before the CLI starts.
        foreach ($plainCase in @(
                @{ Marker = 'stand-in-foreign'; Says = "it is signed by $foreignSigner*" },
                @{ Marker = 'stand-in-second-signer'; Says = "it is signed by $foreignSigner*" },
                @{ Marker = 'stand-in-unsigned'; Says = 'it does not verify (*no .apkm, .xapk or .apks of the same name beside it*' })) {
            Set-Content -LiteralPath $plainFixture -Encoding ASCII -NoNewline -Value "N: $($plainCase.Marker)`n$plainManifest"
            Assert-Throws { Invoke-VerifyAll -Apk $plainFixture } `
                "*Refusing $(Split-Path -Leaf $plainFixture): $($plainCase.Says)*Nothing was merged or patched.*" `
                "verify-all-patches.ps1 took a plain APK marked $($plainCase.Marker)."
            Assert-True (-not (Test-Path -LiteralPath $javaLog) -and -not (Test-Path -LiteralPath $resourceStock)) `
                "verify-all-patches.ps1 patched a plain APK marked $($plainCase.Marker)."
        }
    } finally {
        Remove-Item -LiteralPath $plainFixture, "$plainFixture.result.json", "$plainFixture.patched.txt" -Force -ErrorAction SilentlyContinue
    }
    Assert-True (@(Get-ChildItem -LiteralPath (Join-Path $releaseRoot 'verify-work') -Directory -Filter 'verify-*').Count -eq 0) `
        'verify-all-patches.ps1 left a run folder behind.'

    # Kept runs (ROADMAP "Don't verify the same bundle twice"). A run that passes every check is
    # kept under its key, and the next run with the same key says so and doesn't start the CLI.
    # -NoReuse, a changed bundle and a kept APK that changed afterwards all patch again. A run
    # that fails a check is never kept, and nothing half-written is left in the store.
    $recordStore = Join-Path $releaseRoot 'applied-records'
    function Get-StoreEntries([string]$Store) { @(Get-ChildItem -LiteralPath $Store -Directory -Force -ErrorAction SilentlyContinue) }
    $said = Invoke-VerifyAll -Apk $newestFixture -KeepIn $recordStore
    $keptKey = [regex]::Match($said, 'kept this run as ([0-9a-f]{64})').Groups[1].Value
    $keptRecord = Join-Path $recordStore $keptKey
    Assert-True ($keptKey -and (@(Get-StoreEntries $recordStore).Name -join ',') -ceq $keptKey -and
        (Test-Path -LiteralPath (Join-Path $keptRecord 'record.json')) -and (Test-Path -LiteralPath (Join-Path $keptRecord 'patched.apk')) -and
        (Test-Path -LiteralPath (Join-Path $keptRecord 'result.json')) -and (Test-Path -LiteralPath $javaLog)) `
        "A passing run with -KeepIn did not patch once and keep exactly one record: $said"
    $keptFacts = Get-Content -LiteralPath (Join-Path $keptRecord 'record.json') -Raw | ConvertFrom-Json
    # The fixture is named by what its merge was made from: the APKs in it, each by the name it
    # unpacks to (its file name, the extension in lower case) and its digest.
    $fixtureZip = [System.IO.Compression.ZipFile]::OpenRead($newestFixture)
    try {
        $memberApks = @($fixtureZip.Entries | Where-Object { $_.FullName -like '*.apk' } | ForEach-Object {
                $memberStream = $_.Open()
                $memberSha = [System.Security.Cryptography.SHA256]::Create()
                try {
                    [pscustomobject]@{ Name = $_.Name.Substring(0, $_.Name.Length - 4) + '.apk'
                        Sha256 = -join @($memberSha.ComputeHash($memberStream) | ForEach-Object { $_.ToString('x2') }) }
                } finally { $memberSha.Dispose(); $memberStream.Dispose() } })
    } finally { $fixtureZip.Dispose() }
    # Get-Sha256Hex writes upper case and the record lower case.
    Assert-True ($keptFacts.key -ceq $keptKey -and $keptFacts.inputs.bundle -eq (Get-Sha256Hex -Path $releaseBundle) -and
        $memberApks.Count -eq 2 -and $keptFacts.inputs.input -ceq (Get-InputIdentity -Apks $memberApks) -and
        $null -eq $keptFacts.inputs.fixture -and
        $keptFacts.inputs.files.'DexDiff.java' -eq (Get-Sha256Hex -Path (Join-Path $PSScriptRoot 'DexDiff.java')) -and
        $keptFacts.patchedSha256 -eq (Get-Sha256Hex -Path (Join-Path $keptRecord 'patched.apk')) -and
        $keptFacts.resultSha256 -eq (Get-Sha256Hex -Path (Join-Path $keptRecord 'result.json'))) `
        "The kept record doesn't name the bundle, fixture and verifier hashes it was made from: $($keptFacts | ConvertTo-Json -Depth 6 -Compress)"
    # The second run merges the fixture as any run does, since the key names what the held merge
    # was made from, and stops there: no patch and no resource check.
    $said = Invoke-VerifyAll -Apk $newestFixture -KeepIn $recordStore
    Assert-True ($said -like "*reusing the run kept as $keptKey*" -and -not (Test-Path -LiteralPath $javaLog) -and
        (Test-Path -LiteralPath $mergeLog) -and -not (Test-Path -LiteralPath $resourceStock)) `
        "A second run with the same key patched again, didn't merge to key on what it holds, or didn't say it reused the kept run: $said"
    # The machine-wide store variable stands in for -KeepIn.
    $env:HUSHTUMBLR_APPLY_RECORDS = $recordStore
    try {
        $said = Invoke-VerifyAll -Apk $newestFixture
        Assert-True ($said -like "*reusing the run kept as $keptKey*" -and -not (Test-Path -LiteralPath $javaLog)) `
            "HUSHTUMBLR_APPLY_RECORDS did not stand in for -KeepIn: $said"
    } finally { $env:HUSHTUMBLR_APPLY_RECORDS = $null }
    $said = Invoke-VerifyAll -Apk $newestFixture -KeepIn $recordStore -NoReuse
    Assert-True ($said -like '*-NoReuse: patching in full*' -and (Test-Path -LiteralPath $javaLog) -and
        $said -like "*kept this run as $keptKey*" -and (@(Get-StoreEntries $recordStore).Name -join ',') -ceq $keptKey) `
        "-NoReuse did not patch in full and keep the new run in the old one's place: $said"
    # Any input that moves gives another key: here the bundle, one entry longer.
    $otherBundle = Join-Path $releaseRoot 'other-bundle.mpp'
    New-TestBundleArchive -Path $otherBundle -Entries ([ordered]@{
        'META-INF/MANIFEST.MF' = "Manifest-Version: 1.0`nVersion: $releaseVersionHere`n`n"
        'classes.dex' = "dex`n035" + ('patches' * 9) })
    $said = Invoke-VerifyAll -Apk $newestFixture -KeepIn $recordStore -Bundle $otherBundle
    $otherKey = [regex]::Match($said, 'kept this run as ([0-9a-f]{64})').Groups[1].Value
    Assert-True ($said -like '*no run kept as * so this one patches in full*' -and (Test-Path -LiteralPath $javaLog) -and
        $otherKey -and $otherKey -cne $keptKey -and @(Get-StoreEntries $recordStore).Count -eq 2) `
        "Another bundle reused the first bundle's run instead of patching: $said"
    Remove-GeneratedPath -Path (Join-Path $recordStore $otherKey) -Root $recordStore
    Remove-Item -LiteralPath $otherBundle -Force
    # A kept APK whose bytes changed after it was kept isn't trusted: the run says so and patches.
    $keptApk = Join-Path $keptRecord 'patched.apk'
    $keptBytes = [IO.File]::ReadAllBytes($keptApk)
    [IO.File]::WriteAllBytes($keptApk, [byte[]]($keptBytes + [byte[]](0x0A)))
    $said = Invoke-VerifyAll -Apk $newestFixture -KeepIn $recordStore
    Assert-True ($said -like '*patched APK changed after it was kept*' -and (Test-Path -LiteralPath $javaLog) -and
        $said -like "*kept this run as $keptKey*" -and
        (Get-Sha256Hex -Path $keptApk) -eq (Get-Content -LiteralPath (Join-Path $keptRecord 'record.json') -Raw | ConvertFrom-Json).patchedSha256) `
        "A record whose APK changed was reused, or the passing run didn't replace it: $said"
    # A kept run whose report doesn't pass the report check, here one forged along with its digest
    # so the record still holds together, is let go before the run patches again: a held file's
    # folder can't be moved aside, so the passing run couldn't take its place otherwise.
    $keptResult = Join-Path $keptRecord 'result.json'
    $keptRecordFile = Join-Path $keptRecord 'record.json'
    [IO.File]::WriteAllText($keptResult, '{"forged":true}')
    $forged = Get-Content -LiteralPath $keptRecordFile -Raw | ConvertFrom-Json
    $forged.resultSha256 = (Get-Sha256Hex -Path $keptResult).ToLowerInvariant()
    [IO.File]::WriteAllText($keptRecordFile, ($forged | ConvertTo-Json -Depth 8))
    $said = Invoke-VerifyAll -Apk $newestFixture -KeepIn $recordStore
    $replaced = Get-Content -LiteralPath $keptRecordFile -Raw | ConvertFrom-Json
    Assert-True ($said -like "*kept run $keptKey doesn't pass the report check*" -and (Test-Path -LiteralPath $javaLog) -and
        $said -like "*kept this run as $keptKey*" -and (Get-Content -LiteralPath $keptResult -Raw) -notlike '*forged*' -and
        $replaced.resultSha256 -eq (Get-Sha256Hex -Path $keptResult)) `
        "A kept run whose report failed wasn't let go and replaced by the run that patched again: $said"
    # A run that fails a check, in a store of its own, leaves the store empty: no record and no
    # staging folder.
    $failedStore = Join-Path $releaseRoot 'applied-records-failed'
    foreach ($flagName in @('dexdiff-fails.txt', 'references-fails.txt')) {
        $flag = Join-Path $tools $flagName
        Set-Content -LiteralPath $flag -Value 'on' -Encoding ASCII
        try {
            Assert-Throws { Invoke-VerifyAll -Apk $newestFixture -KeepIn $failedStore } '*verify-all-patches.ps1 exited 1*' `
                "verify-all-patches.ps1 passed when $($flagName -replace '\.txt$', '')."
        } finally { Remove-Item -LiteralPath $flag -Force -ErrorAction SilentlyContinue }
        Assert-True (@(Get-StoreEntries $failedStore).Count -eq 0) `
            "A run that failed when $($flagName -replace '\.txt$', '') left something in the record store: $(@(Get-StoreEntries $failedStore).Name -join ', ')"
    }
    # A patched APK zipalign -c -P 16 -v 4 doesn't pass is refused by name, before the resource
    # table is compared, and isn't kept either. A passing run asked zipalign exactly that.
    $zipalignFlag = Join-Path $tools 'zipalign-fails.txt'
    Set-Content -LiteralPath $zipalignFlag -Value 'on' -Encoding ASCII
    try {
        Assert-Throws { Invoke-VerifyAll -Apk $newestFixture -KeepIn $failedStore } `
            "*zipalign -c -P 16 -v 4 didn't pass verify-all.apk (exit 1)*Verification FAILED*" `
            'verify-all-patches.ps1 passed an APK that failed the 16 KB layout check.'
    } finally { Remove-Item -LiteralPath $zipalignFlag -Force -ErrorAction SilentlyContinue }
    Assert-True (-not (Test-Path -LiteralPath $resourceStock) -and @(Get-StoreEntries $failedStore).Count -eq 0) `
        'A run that failed the 16 KB layout check went on to the resource table or left something in the record store.'
    Remove-Item -LiteralPath $zipalignLog -Force -ErrorAction SilentlyContinue
    $said = Invoke-VerifyAll -Apk $newestFixture
    Assert-True ($said -like '*16 KB pages: zipalign -c -P 16 -v 4 passes, with 0 target limitation(s)*' -and
        (@(Get-Content -LiteralPath $zipalignLog) -join '|') -like '-c -P 16 -v 4 *verify-all.apk*' -and
        @(Get-Content -LiteralPath $zipalignLog).Count -eq 1) `
        "verify-all-patches.ps1 did not hold the patched APK to zipalign -c -P 16 -v 4 once: $(@(Get-Content -LiteralPath $zipalignLog -ErrorAction SilentlyContinue) -join '; ')"

    # The receipt never reads a kept run, though the release gate keeps one of each fixture: a kept
    # run is a record and an APK any program of the same user can write together, so it can't show
    # which bundle made the APK. With a run of every fixture kept in the store
    # HUSHTUMBLR_APPLY_RECORDS names, the receipt still patches each one, and the release check
    # takes what it writes. The stand-in aapt2 reads a manifest written beside an APK and a record
    # keeps the APK alone, so the manifest the CLI stand-in wrote goes beside each kept APK here for
    # patch-for-device.ps1 below. A real aapt2 reads the APK itself. Nor can the receipt be handed
    # a store: the parent of the commit that dropped reuse read kept runs only from -AppliedDir.
    $storeParameters = @((Get-Command (Join-Path $PSScriptRoot 'build-release-receipt.ps1')).Parameters.Keys |
        Where-Object { $_ -match 'Applied|Record|Kept|Keep|Reuse|Store' })
    Assert-True ($storeParameters.Count -eq 0) "build-release-receipt.ps1 takes a store of kept runs: -$($storeParameters -join ', -')"
    $receiptStore = Join-Path $releaseRoot 'applied-records-receipt'
    foreach ($build in $builtBuilds) {
        $said = Invoke-VerifyAll -Apk $fixturePaths[$build] -KeepIn $receiptStore -Force:($build -eq $newerBuild)
        $buildKey = [regex]::Match($said, 'kept this run as ([0-9a-f]{64})').Groups[1].Value
        Assert-True ([bool]$buildKey) "verify-all-patches.ps1 -KeepIn kept no run of ${build}: $said"
        Copy-Item -LiteralPath "$($fixturePaths[$build]).patched.txt" -Destination (Join-Path $receiptStore "$buildKey/patched.apk.xmltree")
    }
    Assert-True (@(Get-AppliedRecords -Store $receiptStore).Count -eq $builtBuilds.Count) `
        "The store doesn't hold one kept run per fixture: $(@(Get-StoreEntries $receiptStore).Name -join ', ')"
    $receiptBeforeKept = [IO.File]::ReadAllBytes($releaseReceipt)
    $recordsBefore = $env:HUSHTUMBLR_APPLY_RECORDS
    try {
        $env:HUSHTUMBLR_APPLY_RECORDS = $receiptStore
        Invoke-ReceiptBuilder -Fixtures $allFixtures
        $keptPatchRuns = @(Get-Content -LiteralPath $javaLog -ErrorAction SilentlyContinue)
        Assert-True (($keptPatchRuns -join "`n") -eq ($expectedRuns -join "`n")) `
            "The receipt didn't patch every fixture while a kept run of each was in the store: $($keptPatchRuns -join '; ')"
        Assert-True ($builderSaid -notlike '*run kept as*') "The receipt said it read a kept run: $builderSaid"
        $keptReceipt = Get-Content -LiteralPath $releaseReceipt -Raw | ConvertFrom-Json
        Assert-True ((@($keptReceipt.targets | ForEach-Object { [string]$_.source.versionName }) -join ',') -eq ($builtBuilds -join ',')) `
            "The receipt written beside kept runs does not hold one target per fixture: $($keptReceipt.targets.source.versionName -join ', ')"
        $said = Invoke-ReleaseCheck
        Assert-True ($said -like "*$builtProved*") "The release check did not accept the receipt written beside kept runs: $said"
    } finally {
        $env:HUSHTUMBLR_APPLY_RECORDS = $recordsBefore
        [IO.File]::WriteAllBytes($releaseReceipt, $receiptBeforeKept)
    }

    # patch-for-device.ps1 signs the kept APK for a phone instead of patching, says so, and still
    # holds the report and the manifest to the build. -NoReuse patches with the CLI as before.
    $apksignerLog = Join-Path $tools 'apksigner.log'
    $keptDevice = @{ Root = $releaseRepo; DesktopJar = $stubJar; Java = $stubJava; Aapt2 = $stubAapt2
        OutDir = (Join-Path $releaseRoot 'device-kept'); AndroidJar = $stubAndroidJar; ApiVersions = $stubApiVersions
        Apk = $newestFixture; AppliedDir = $receiptStore; Keystore = $standInKeystore }
    Remove-Item -LiteralPath $javaLog, $apksignerLog, $zipalignLog, $resourceStock, $keytoolLog -Force -ErrorAction SilentlyContinue
    # The signing password, of its own here, goes to keytool in the environment and never on its
    # command line, and the variable is gone again afterwards.
    $passwordBefore = $env:HUSHTUMBLR_SIDELOAD_KEYSTORE_PASSWORD
    try {
        $env:HUSHTUMBLR_SIDELOAD_KEYSTORE_PASSWORD = 'stand-in-password'
        $said = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6>&1 | ForEach-Object { "$_" })
    } finally { $env:HUSHTUMBLR_SIDELOAD_KEYSTORE_PASSWORD = $passwordBefore }
    $handed = [string]$said[-1]
    Assert-True (-not (Test-Path -LiteralPath $javaLog) -and -not (Test-Path -LiteralPath $resourceStock) -and
        (Test-Path -LiteralPath $handed -PathType Leaf) -and
        ($said -join "`n") -like '*passed every check in the gate run kept as*' -and
        (Get-Content -LiteralPath $apksignerLog -Raw) -like '*sign alias=sideload in=*patched.apk out=*') `
        "patch-for-device.ps1 did not sign the kept run instead of patching: $($said -join ' | ')"
    $keytoolCalls = @(Get-Content -LiteralPath $keytoolLog -ErrorAction SilentlyContinue)
    Assert-True ($keytoolCalls.Count -eq 1 -and
        $keytoolCalls[0] -clike '-list -v -keystore *\sideload.jks* -alias sideload -storepass:env HUSHTUMBLR_KEYTOOL_STOREPASS pass=stand-in-password' -and
        $keytoolCalls[0].Substring(0, $keytoolCalls[0].LastIndexOf(' pass=')) -cnotlike '*stand-in-password*' -and
        $null -eq [Environment]::GetEnvironmentVariable('HUSHTUMBLR_KEYTOOL_STOREPASS', [EnvironmentVariableTarget]::Process)) `
        "patch-for-device.ps1 didn't read the alias's certificate with the password in the environment alone: $($keytoolCalls -join ' | ')"
    # zipalign can't put a signed APK right, so the kept APK is held to the 16 KB layout before it's
    # signed and the signed one after. A kept APK that fails is never signed, and nothing is left.
    Assert-True ((@(Get-Content -LiteralPath $zipalignLog) -join '|') -like '-c -P 16 -v 4 *patched.apk*|-c -P 16 -v 4 *-signed.apk*' -and
        @(Get-Content -LiteralPath $zipalignLog).Count -eq 2) `
        "patch-for-device.ps1 did not hold the kept APK and then the signed one to zipalign -c -P 16 -v 4: $(@(Get-Content -LiteralPath $zipalignLog) -join '; ')"
    $keptRunsBefore = @(Get-ChildItem -LiteralPath $keptDevice.OutDir -Directory).Count
    Remove-Item -LiteralPath $apksignerLog -Force -ErrorAction SilentlyContinue
    Set-Content -LiteralPath $zipalignFlag -Value 'on' -Encoding ASCII
    try {
        Assert-Throws { & (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6> $null } `
            "*zipalign -c -P 16 -v 4 didn't pass patched.apk (exit 1)*Verification FAILED*" `
            'patch-for-device.ps1 took a kept APK that failed the 16 KB layout check.'
    } finally { Remove-Item -LiteralPath $zipalignFlag -Force -ErrorAction SilentlyContinue }
    Assert-True (-not (Test-Path -LiteralPath $apksignerLog) -and
        @(Get-ChildItem -LiteralPath $keptDevice.OutDir -Directory).Count -eq $keptRunsBefore) `
        'patch-for-device.ps1 signed a kept APK that failed the 16 KB layout check, or left its run folder behind.'
    # apksigner.bat can't read the BKS keystore the desktop CLI makes, so the kept APK is then signed
    # by the same signer from lib/apksigner.jar beside aapt2, with the CLI's BouncyCastle as the
    # keystore provider. When that fails too, both errors come back.
    $bksOnly = Join-Path $tools 'apksigner-bks-only.txt'
    $bksFails = Join-Path $tools 'apksigner-java-fails.txt'
    $signerJar = Join-Path (Join-Path $tools 'lib') 'apksigner.jar'
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $signerJar) | Out-Null
    [IO.File]::WriteAllText($signerJar, 'stand-in apksigner jar')
    Set-Content -LiteralPath $bksOnly -Value 'on' -Encoding ASCII
    try {
        Remove-Item -LiteralPath $javaLog, $apksignerLog -Force -ErrorAction SilentlyContinue
        $said = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6>&1 | ForEach-Object { "$_" })
        $signCalls = @(Get-Content -LiteralPath $apksignerLog)
        Assert-True ((Test-Path -LiteralPath ([string]$said[-1]) -PathType Leaf) -and -not (Test-Path -LiteralPath $javaLog) -and
            $signCalls.Count -eq 2 -and $signCalls[0] -like 'sign alias=sideload in=*patched.apk out=*' -and
            $signCalls[1] -like 'bks-sign type=BKS provider=BC alias=sideload in=*patched.apk out=*') `
            "patch-for-device.ps1 did not sign the kept APK as a BKS keystore after apksigner.bat refused it: $($signCalls -join ' | ') / $($said -join ' | ')"
        Set-Content -LiteralPath $bksFails -Value 'on' -Encoding ASCII
        Assert-Throws { & (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6> $null } `
            '*apksigner could not sign the kept APK (exit 2)*toDerInputStream rejects tag type 0*then as a BKS keystore (exit 5)*BKS not found*' `
            'patch-for-device.ps1 did not report both signers when neither could sign the kept APK.'
    } finally {
        Remove-Item -LiteralPath $bksOnly, $bksFails, $signerJar -Force -ErrorAction SilentlyContinue
    }
    # apksigner writes the signed APK to a path nothing held, so it's held to the kept APK entry by
    # entry: signing adds signature files, drops the Source Stamp's certificate digest as real
    # apksigner does, and changes nothing else. A signed APK with an entry of its own, an entry
    # that isn't the kept one's bytes, a stamp digest of other bytes or a name only a case fold
    # makes a signature file is refused before anything reads it.
    $signSwap = Join-Path $tools 'apksigner-swap.apk'
    $keptEntries = [ordered]@{ 'AndroidManifest.xml' = 'binary manifest'; 'classes.dex' = "dex`n035"; 'stamp-cert-sha256' = 'stamp' }
    try {
        $signedEntries = [ordered]@{}
        foreach ($name in $keptEntries.Keys) { if ($name -cne 'stamp-cert-sha256') { $signedEntries[$name] = $keptEntries[$name] } }
        foreach ($name in 'META-INF/MANIFEST.MF', 'META-INF/SIDELOAD.SF', 'META-INF/SIDELOAD.RSA') { $signedEntries[$name] = "signature $name" }
        New-TestBundleArchive -Path $signSwap -Entries $signedEntries
        $said = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6>&1 | ForEach-Object { "$_" })
        Assert-True (Test-Path -LiteralPath ([string]$said[-1]) -PathType Leaf) `
            "patch-for-device.ps1 refused a kept APK signed with signature files added and the stamp digest dropped: $($said -join ' | ')"
        foreach ($swapped in @(
                @{ What = 'an entry of its own'; Name = 'assets/extra.bin'; Value = 'extra' },
                @{ What = 'other bytes'; Name = 'classes.dex'; Value = "dex`n036" },
                @{ What = 'a stamp digest of other bytes'; Name = 'stamp-cert-sha256'; Value = 'other stamp' },
                @{ What = 'a case-folded signature name'; Name = "META-INF/PAYLOAD.$([char]0x17F)F"; Value = 'payload' })) {
            $entries = [ordered]@{}
            foreach ($name in $keptEntries.Keys) { $entries[$name] = $keptEntries[$name] }
            $entries[$swapped.Name] = $swapped.Value
            Remove-Item -LiteralPath $signSwap -Force
            New-TestBundleArchive -Path $signSwap -Entries $entries
            Assert-Throws { & (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6> $null } `
                '*The signed APK holds other entries than the kept APK it was signed from, beyond the signature files.*' `
                "patch-for-device.ps1 took a signed APK with $($swapped.What)."
        }
        # Whatever its entries, the signed APK has to be the alias's key's alone: signed by another
        # key, by another one beside it (sorting before the alias's or after), not at all, or by the
        # alias's key without verifying, it's refused, while a Source Stamp beside the alias's
        # signature doesn't count. The stand-in apksigner reads the marker in an entry name.
        $notAlone = "*The signed APK isn't signed by the sideload key of sideload.jks ($aliasSigner) alone: apksigner says"
        foreach ($signed in @(
                @{ Marker = 'stand-in-foreign.RSA'; Says = "$notAlone Signer #1 certificate SHA-256 digest: $foreignSigner*" },
                @{ Marker = 'stand-in-second-signer.RSA'; Says = "$notAlone*Signer #2 certificate SHA-256 digest: $foreignSigner*" },
                @{ Marker = 'stand-in-late-signer.RSA'; Says = "$notAlone*Signer #2 certificate SHA-256 digest: $lateSigner*" },
                @{ Marker = 'stand-in-unsigned.SF'; Says = "$notAlone DOES NOT VERIFY*" },
                @{ Marker = 'stand-in-unverified.RSA'; Says = "$notAlone Signer #1 certificate SHA-256 digest: $aliasSigner DOES NOT VERIFY*" },
                @{ Marker = 'stand-in-stamp.RSA'; Says = '' })) {
            $entries = [ordered]@{}
            foreach ($name in $keptEntries.Keys) { if ($name -cne 'stamp-cert-sha256') { $entries[$name] = $keptEntries[$name] } }
            $entries["META-INF/$($signed.Marker)"] = 'signature'
            Remove-Item -LiteralPath $signSwap -Force
            New-TestBundleArchive -Path $signSwap -Entries $entries
            if ($signed.Says) {
                Assert-Throws { & (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6> $null } $signed.Says `
                    "patch-for-device.ps1 took a kept APK signed as $($signed.Marker) marks it."
            } else {
                $said = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6>&1 | ForEach-Object { "$_" })
                Assert-True (Test-Path -LiteralPath ([string]$said[-1]) -PathType Leaf) `
                    "patch-for-device.ps1 counted a Source Stamp as a second signer: $($said -join ' | ')"
                # Signing the kept APK put the password in the environment for apksigner and left
                # the variable as it was, unset included (not set to nothing).
                $passwordAfter = [Environment]::GetEnvironmentVariable('HUSHTUMBLR_SIDELOAD_KEYSTORE_PASSWORD', [EnvironmentVariableTarget]::Process)
                Assert-True (($null -eq $passwordBefore -and $null -eq $passwordAfter) -or ($null -ne $passwordBefore -and $passwordAfter -ceq $passwordBefore)) `
                    "Signing a kept APK left HUSHTUMBLR_SIDELOAD_KEYSTORE_PASSWORD otherwise than it was: '$passwordAfter'"
            }
        }
    } finally { Remove-Item -LiteralPath $signSwap -Force -ErrorAction SilentlyContinue }
    # An APK still signed as Tumblr's, which the stand-in apksigner hands back when it leaves no
    # .signer file, isn't the alias's.
    $unmarkedFlag = Join-Path $tools 'apksigner-unmarked.txt'
    Set-Content -LiteralPath $unmarkedFlag -Value 'on' -Encoding ASCII
    try {
        Assert-Throws { & (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6> $null } `
            "$notAlone Signer #1 certificate SHA-256 digest: $($releaseSigner[0])*" 'patch-for-device.ps1 took a kept APK still signed by Tumblr''s key.'
    } finally { Remove-Item -LiteralPath $unmarkedFlag -Force -ErrorAction SilentlyContinue }
    # The keystore is held from the certificate read, before anything signs, to the end of the run:
    # signing can't write another one over it. A keystore keytool reads only as BKS is read through
    # the desktop jar's BouncyCastle provider, with the password in the environment for both tries,
    # and a variable set before the run is put back.
    $keystoreSwap = Join-Path $tools 'apksigner-swaps-keystore.txt'
    Set-Content -LiteralPath $keystoreSwap -Value 'another keystore' -Encoding ASCII
    Set-Content -LiteralPath $keytoolBksFlag -Value 'on' -Encoding ASCII
    Remove-Item -LiteralPath $apksignerLog, $keytoolLog -Force -ErrorAction SilentlyContinue
    $storepassBefore = $env:HUSHTUMBLR_KEYTOOL_STOREPASS
    try {
        $env:HUSHTUMBLR_KEYTOOL_STOREPASS = 'set before the run'
        $env:HUSHTUMBLR_SIDELOAD_KEYSTORE_PASSWORD = 'stand-in-password'
        $said = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6>&1 | ForEach-Object { "$_" })
        $storepassAfter = $env:HUSHTUMBLR_KEYTOOL_STOREPASS
    } finally {
        $env:HUSHTUMBLR_KEYTOOL_STOREPASS = $storepassBefore
        $env:HUSHTUMBLR_SIDELOAD_KEYSTORE_PASSWORD = $passwordBefore
        Remove-Item -LiteralPath $keystoreSwap, $keytoolBksFlag -Force -ErrorAction SilentlyContinue
    }
    $keytoolCalls = @(Get-Content -LiteralPath $keytoolLog -ErrorAction SilentlyContinue)
    Assert-True ((Test-Path -LiteralPath ([string]$said[-1]) -PathType Leaf) -and
        @(Get-Content -LiteralPath $apksignerLog) -ccontains 'keystore held' -and
        (Get-Content -LiteralPath $standInKeystore -Raw).Trim() -ceq 'stand-in keystore') `
        "Signing a kept APK could write over the keystore its certificate was read from: $(@(Get-Content -LiteralPath $apksignerLog -ErrorAction SilentlyContinue) -join ' | ')"
    # The control: handed a keystore nothing holds, the same stand-in does write over it, so the
    # "keystore held" above is the hold and not a copy that could never land.
    $looseKeystore = Join-Path $tools 'loose.jks'
    $looseIn = Join-Path $tools 'loose-in.apk'
    Set-Content -LiteralPath $looseKeystore -Value 'stand-in keystore' -Encoding ASCII
    Set-Content -LiteralPath $looseIn -Value 'loose' -Encoding ASCII
    Set-Content -LiteralPath $keystoreSwap -Value 'another keystore' -Encoding ASCII
    Remove-Item -LiteralPath $apksignerLog -Force -ErrorAction SilentlyContinue
    try {
        & (Join-Path $tools 'apksigner.bat') sign --ks $looseKeystore --ks-key-alias sideload --out (Join-Path $tools 'loose-out.apk') $looseIn | Out-Null
    } finally { Remove-Item -LiteralPath $keystoreSwap -Force -ErrorAction SilentlyContinue }
    Assert-True (@(Get-Content -LiteralPath $apksignerLog) -ccontains 'keystore swapped' -and
        (Get-Content -LiteralPath $looseKeystore -Raw).Trim() -ceq 'another keystore') `
        "The stand-in apksigner couldn't write over a keystore nothing held: $(@(Get-Content -LiteralPath $apksignerLog -ErrorAction SilentlyContinue) -join ' | ')"
    Remove-Item -LiteralPath $looseKeystore, $looseIn, (Join-Path $tools 'loose-out.apk'), (Join-Path $tools 'loose-out.apk.signer') -Force -ErrorAction SilentlyContinue
    Assert-True ($keytoolCalls.Count -eq 2 -and $keytoolCalls[0] -cnotlike '*-storetype*' -and
        $keytoolCalls[1] -clike ('-list -v -keystore *\sideload.jks* -alias sideload -storepass:env HUSHTUMBLR_KEYTOOL_STOREPASS -storetype BKS ' +
            "-providerclass org.bouncycastle.jce.provider.BouncyCastleProvider -providerpath *$(Split-Path -Leaf $stubJar)* pass=stand-in-password") -and
        $storepassAfter -ceq 'set before the run') `
        "A keystore keytool reads only as BKS wasn't read through the provider, or the password variable wasn't put back: '$storepassAfter' $($keytoolCalls -join ' | ')"
    $keptDevice['NoReuse'] = $true
    Remove-Item -LiteralPath $javaLog, $apksignerLog, $resourceStock -Force -ErrorAction SilentlyContinue
    $said = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6>&1 | ForEach-Object { "$_" })
    Assert-True ((@(Get-Content -LiteralPath $javaLog) -join '; ') -eq "patch $newestFixture merged forced=0" -and
        -not (Test-Path -LiteralPath $apksignerLog)) `
        "patch-for-device.ps1 -NoReuse did not patch with the CLI: $(@(Get-Content -LiteralPath $javaLog -ErrorAction SilentlyContinue) -join '; ')"
    # What it patched is held to the merge's resource table and archive, as verify-all's runs are,
    # and the check's report lines are shown. The kept run above was checked when it was kept.
    Assert-True ((Test-Path -LiteralPath $resourceStock) -and
        (Get-Content -LiteralPath $resourceStock -Raw) -ceq (Get-Content -LiteralPath "$newestFixture.merged.txt" -Raw) -and
        ($said -join "`n") -like '*`[device`] `[resources`] stand-in: every stock resource resolves*') `
        "patch-for-device.ps1 -NoReuse didn't check what it patched against the merge's resource table and archive: $($said -join ' | ')"
    # What the CLI signed is held to the alias's certificate too: here it hands back a build another
    # key signed. A certificate keytool can't read stops the run, as does a keystore that isn't there.
    $cliOutput = Join-Path $tools 'patched.apk'
    $cliBytes = [IO.File]::ReadAllBytes($cliOutput)
    try {
        Remove-Item -LiteralPath $cliOutput -Force
        New-TestBundleArchive -Path $cliOutput -Entries ([ordered]@{ 'AndroidManifest.xml' = 'binary manifest'; 'classes.dex' = "dex`n035"
            'stamp-cert-sha256' = 'stamp'; 'META-INF/stand-in-foreign.RSA' = 'signature' })
        Assert-Throws { & (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6> $null } `
            "$notAlone Signer #1 certificate SHA-256 digest: $foreignSigner*" 'patch-for-device.ps1 -NoReuse took a build the CLI handed back signed by another key.'
    } finally { [IO.File]::WriteAllBytes($cliOutput, $cliBytes) }
    # A CLI that exits cleanly with its report and no APK leaves nothing to hold, so the report is
    # turned down for the APK: the report check is handed no path, whatever turns up there later.
    $noApkFlag = Join-Path $tools 'cli-leaves-no-apk.txt'
    Set-Content -LiteralPath $noApkFlag -Value 'on' -Encoding ASCII
    try {
        Assert-Throws { & (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6> $null } `
            '*Patching did not produce a complete APK: saved APK is missing or invalid*' 'patch-for-device.ps1 went on when the CLI left no APK.'
    } finally { Remove-Item -LiteralPath $noApkFlag -Force -ErrorAction SilentlyContinue }
    Set-Content -LiteralPath $keytoolFlag -Value 'on' -Encoding ASCII
    try {
        Assert-Throws { & (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6> $null } `
            ('*keytool could not read the sideload certificate of sideload.jks: as it is, keytool error: java.io.IOException: keystore password ' +
                'was incorrect; as BKS, keytool error:*') "patch-for-device.ps1 went on without the alias's certificate."
    } finally { Remove-Item -LiteralPath $keytoolFlag -Force -ErrorAction SilentlyContinue }
    Assert-True ([Environment]::GetEnvironmentVariable('HUSHTUMBLR_KEYTOOL_STOREPASS', [EnvironmentVariableTarget]::Process) -ceq $storepassBefore) `
        'A keytool that failed left the keystore password in HUSHTUMBLR_KEYTOOL_STOREPASS.'
    $noKeystore = @{} + $keptDevice
    $noKeystore['Keystore'] = Join-Path $tools 'no-such.jks'
    Assert-Throws { & (Join-Path $PSScriptRoot 'patch-for-device.ps1') @noKeystore 6> $null } '*No keystore at *no-such.jks to read the sideload certificate from.*' `
        'patch-for-device.ps1 read a certificate out of a keystore that is not there.'

    # -Option hands a named patch an option value: the CLI's -O, right after that patch's -e. The
    # kept run above was patched with the options as the bundle ships them, so a run with one
    # patches with the CLI without -NoReuse too. Anything that isn't 'Patch name:key=value', a patch
    # that isn't in the build and a key the patch doesn't declare stop the run before the CLI starts.
    $optionsLog = Join-Path $tools 'options.log'
    $keptDevice.Remove('NoReuse')
    $keptDevice['Option'] = @('Dark background color:backgroundColor=#121212')
    Remove-Item -LiteralPath $javaLog, $apksignerLog, $optionsLog -Force -ErrorAction SilentlyContinue
    $said = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6>&1 | ForEach-Object { "$_" })
    Assert-True ((@(Get-Content -LiteralPath $javaLog) -join '; ') -eq "patch $newestFixture merged forced=0" -and
        -not (Test-Path -LiteralPath $apksignerLog) -and
        (@(Get-Content -LiteralPath $optionsLog) -join '; ') -ceq 'Dark background color: backgroundColor=#121212' -and
        ($said -join "`n") -like '*option for Dark background color: backgroundColor=#121212*') `
        ("patch-for-device.ps1 -Option did not patch with the CLI and hand the value over after its patch's -e: " +
            "$(@(Get-Content -LiteralPath $optionsLog -ErrorAction SilentlyContinue) -join '; ') | $($said -join ' | ')")
    foreach ($refused in @(
            @{ Option = 'backgroundColor=#121212'; Says = "*-Option takes 'Patch name:key=value', not 'backgroundColor=#121212'*" },
            @{ Option = 'No such patch:backgroundColor=#121212'; Says = "*No patch named 'No such patch' in this build*" },
            @{ Option = 'Dark background color:foregroundColor=#121212'
                Says = "*Dark background color has no option 'foregroundColor'. It declares: backgroundColor*" })) {
        $keptDevice['Option'] = @($refused.Option)
        Remove-Item -LiteralPath $javaLog, $apksignerLog, $optionsLog -Force -ErrorAction SilentlyContinue
        Assert-Throws { & (Join-Path $PSScriptRoot 'patch-for-device.ps1') @keptDevice 6> $null } $refused.Says `
            "patch-for-device.ps1 took -Option '$($refused.Option)'."
        Assert-True (-not (Test-Path -LiteralPath $javaLog) -and -not (Test-Path -LiteralPath $apksignerLog)) `
            "patch-for-device.ps1 patched or signed after refusing -Option '$($refused.Option)'."
    }
    $keptDevice.Remove('Option')

    # The newest build alone, or beside the undeclared one, is not enough for a receipt: the older
    # declared build has no run. The builder says so before it patches anything. It used to patch
    # every fixture first, which unpacks a whole Tumblr build each time, and then refuse its own receipt.
    foreach ($partial in @(@($releaseTarget.PackageVersion), @($releaseTarget.PackageVersion, $newerBuild))) {
        Assert-Throws { Invoke-ReceiptBuilder -Fixtures @($partial | ForEach-Object { $fixturePaths[$_] }) } `
            "*No fixture is the declared $($releaseTarget.PackageName) $($unproved -join ', ')*Nothing was patched*" `
            "build-release-receipt.ps1 went ahead with fixtures of $($partial -join ', ') only."
        if (Test-Path -LiteralPath $javaLog) {
            throw ("build-release-receipt.ps1 patched before it found a declared build missing: " +
                (@(Get-Content -LiteralPath $javaLog) -join '; '))
        }
    }
    # Another build of the older declared version in its place is no run of it either. The builder
    # took it by its name, patched it without -f and wrote a receipt proving a build nobody ran.
    $variantRefusal = "*No fixture is the declared $($releaseTarget.PackageName) $variantBuild*" +
        "$variantBuild ($(@($releaseTarget.PackageVersionCodes[$variantBuild]) -join ' or '))*" +
        "$variantBuild ($variantCode)*Nothing was patched*"
    Assert-Throws { Invoke-ReceiptBuilder -Fixtures @(@($releaseTarget.PackageVersions | Select-Object -SkipLast 1 |
                ForEach-Object { $fixturePaths[$_] }) + @($variantApkm)) } $variantRefusal `
        'build-release-receipt.ps1 took another build of a declared version for the declared one.'
    Assert-True (-not (Test-Path -LiteralPath $javaLog)) 'build-release-receipt.ps1 patched another build of a declared version.'
    # verify-all-patches.ps1 would patch it as a declared build too, without -f; it needs -Force now.
    Assert-Throws { Invoke-VerifyAll -Apk $variantApkm } "*$variantBuild, which the bundle does not declare, at version code $variantCode*-Force*" `
        'verify-all-patches.ps1 patched another build of a declared version as the declared one.'
    Assert-True (-not (Test-Path -LiteralPath $javaLog)) 'verify-all-patches.ps1 started the CLI on another build of a declared version.'

    # The SBOM and what OSV says about it come before anything is patched. The deliberately
    # vulnerable fixture is this bundle with an SBOM listing gson 2.8.8, and no receipt comes of it.
    # Offline, -SkipAdvisoryCheck gets a receipt with a warning, and the index push below asks OSV
    # again. An OSV out of reach stops the run, and so does an SBOM of another build or none at all.
    $cleanSbomBytes = [System.IO.File]::ReadAllBytes($releaseSbom)
    $cleanReceiptBytes = [System.IO.File]::ReadAllBytes($releaseReceipt)
    try {
        New-TestSbom -Path $releaseSbom -Bundle $releaseBundle -Libraries @($gsonPurl)
        Assert-Throws { Invoke-ReceiptBuilder -Fixtures $allFixtures } `
            '*high or critical*GHSA-4jrv-ppp4-jm57 (HIGH, CVE-2022-25647) in com.google.code.gson:gson 2.8.8*' `
            'build-release-receipt.ps1 wrote a receipt for a bundle carrying gson 2.8.8.'
        Assert-True (-not (Test-Path -LiteralPath $javaLog)) 'build-release-receipt.ps1 patched before it asked OSV about the SBOM.'
        Invoke-ReceiptBuilder -Fixtures $allFixtures -SkipAdvisoryCheck
        Assert-True ($builderSaid -like '*-SkipAdvisoryCheck: OSV was not asked about the libraries*' -and
            (Get-Content -LiteralPath $releaseReceipt -Raw | ConvertFrom-Json).sbom.sha256 -ceq (Get-Sha256Hex -Path $releaseSbom)) `
            "An offline receipt run did not say the advisory check was skipped, or did not record the SBOM: $builderSaid"
        foreach ($refused in @(
                @{ Name = 'an OSV out of reach'; Sbom = { New-TestSbom -Path $releaseSbom -Bundle $releaseBundle -Libraries @('pkg:maven/com.example/unknown@1.0') }
                    Pattern = '*could not be asked about pkg:maven/com.example/unknown@1.0*fails closed*' },
                @{ Name = 'an SBOM of another build'; Pattern = '*The SBOM does not describe the bundle*written for another build*'
                    Sbom = { New-TestSbom -Path $releaseSbom -Bundle $releaseBundle -Mutate { param($d) $d.metadata.component.hashes[0].content = ('0' * 64) } } },
                @{ Name = 'no SBOM'; Sbom = { Remove-Item -LiteralPath $releaseSbom }; Pattern = "*No SBOM for the bundle: $releaseSbom*" })) {
            & $refused.Sbom
            Assert-Throws { Invoke-ReceiptBuilder -Fixtures $allFixtures } $refused.Pattern "build-release-receipt.ps1 went ahead with $($refused.Name)."
            Assert-True (-not (Test-Path -LiteralPath $javaLog)) "build-release-receipt.ps1 patched with $($refused.Name)."
        }
        # The receipt names the SBOM still beside the bundle when it's written: another buildAndroid
        # during the patch runs, which take long enough for one, replaces it.
        [System.IO.File]::WriteAllBytes($releaseSbom, $cleanSbomBytes)
        $replacement = Join-Path $releaseRoot 'replacement.cdx.json'
        New-TestSbom -Path $replacement -Bundle $releaseBundle
        $duringPatch = Join-Path $tools 'during-patch.cmd'
        [System.IO.File]::WriteAllText($duringPatch, "@copy /y `"$replacement`" `"$releaseSbom`" >nul`r`n", [System.Text.Encoding]::ASCII)
        try {
            Assert-Throws { Invoke-ReceiptBuilder -Fixtures $allFixtures } `
                "*does not pass validation: The receipt says patches-$releaseVersionHere.cdx.json hashes to*" `
                'build-release-receipt.ps1 wrote a receipt naming an SBOM that was replaced while it patched.'
        } finally {
            Remove-Item -LiteralPath $duringPatch -Force -ErrorAction SilentlyContinue
        }
    } finally {
        [System.IO.File]::WriteAllBytes($releaseSbom, $cleanSbomBytes)
        [System.IO.File]::WriteAllBytes($releaseReceipt, $cleanReceiptBytes)
    }

    # A bundle that isn't a build of the commit, from a tree that is clean by the time the receipt
    # is cut. The build stamps a bundle 0 when the tree had uncommitted changes as it started, and
    # another commit's bundle carries that commit's time. The receipt check at the end refused
    # both, but only after every fixture had been patched; they're refused before anything is now.
    # And a source written after the bundle, which is what an edit put back since leaves: the tree
    # is clean and the stamp right, yet the bundle may have been built from the edit. Nothing
    # refused that one at all, so a bundle built from someone else's edits in a shared tree could
    # ship as the tag once the edits were gone.
    $builtBundleBytes = [System.IO.File]::ReadAllBytes($releaseBundle)
    $builtSbomBytes = [System.IO.File]::ReadAllBytes($releaseSbom)
    $builtReceiptBytes = [System.IO.File]::ReadAllBytes($releaseReceipt)
    try {
        foreach ($stamped in @(
                @{ Name = 'a bundle built from a tree with uncommitted changes'; Stamp = 0L
                    Pattern = "*stamped 0*uncommitted changes*isn't a build of commit $releaseCommit*Nothing was patched*" },
                @{ Name = 'a bundle built from another commit'; Stamp = ($releaseSeconds - 60) * 1000
                    Pattern = "*stamped $(($releaseSeconds - 60) * 1000), but commit $releaseCommit was made at $($releaseSeconds * 1000)*Nothing was patched*" })) {
            Remove-Item -LiteralPath $releaseBundle -Force
            New-TestBundleArchive -Path $releaseBundle -Entries ([ordered]@{
                'META-INF/MANIFEST.MF' = ("Manifest-Version: 1.0`nVersion: $releaseVersionHere`nTimestamp: $($stamped.Stamp)`n" +
                    "Patcher-Version: $($releaseToolchain.PatcherVersion)`n`n")
                'classes.dex' = "dex`n035" + ('patches' * 8)
                'extensions/tumblr.mpe' = "dex`n035" + ('payload' * 8) })
            # The SBOM that build writes beside it, so nothing but the stamp is out of place.
            New-TestSbom -Path $releaseSbom -Bundle $releaseBundle
            Assert-Throws { Invoke-ReceiptBuilder -Fixtures $allFixtures } $stamped.Pattern `
                "build-release-receipt.ps1 went ahead with $($stamped.Name)."
            Assert-True (-not (Test-Path -LiteralPath $javaLog)) "build-release-receipt.ps1 patched with $($stamped.Name)."
        }
    } finally {
        [System.IO.File]::WriteAllBytes($releaseBundle, $builtBundleBytes)
        [System.IO.File]::WriteAllBytes($releaseSbom, $builtSbomBytes)
        [System.IO.File]::WriteAllBytes($releaseReceipt, $builtReceiptBytes)
    }
    # The catalog touched after the build: git sees no change in it, and it's newer than the bundle.
    $touchedCatalog = Join-Path $releaseRepo 'gradle/libs.versions.toml'
    $catalogWritten = [System.IO.File]::GetLastWriteTimeUtc($touchedCatalog)
    try {
        [System.IO.File]::SetLastWriteTimeUtc($touchedCatalog, [System.IO.File]::GetLastWriteTimeUtc($releaseBundle).AddMinutes(1))
        Assert-Throws { Invoke-ReceiptBuilder -Fixtures $allFixtures } `
            "*1 source file(s) changed after the bundle was built, the newest *libs.versions.toml*Nothing was patched*" `
            'build-release-receipt.ps1 went ahead with a bundle older than a source it was built from.'
        Assert-True (-not (Test-Path -LiteralPath $javaLog)) 'build-release-receipt.ps1 patched with a bundle older than its sources.'
    } finally {
        [System.IO.File]::SetLastWriteTimeUtc($touchedCatalog, $catalogWritten)
        [System.IO.File]::WriteAllBytes($releaseReceipt, $builtReceiptBytes)
    }
    # The control: with the catalog as old as it was, the same run writes its receipt.
    try {
        Invoke-ReceiptBuilder -Fixtures $allFixtures
    } catch {
        throw "build-release-receipt.ps1 refused the built bundle once its sources were older again: $($_.Exception.Message)"
    } finally {
        [System.IO.File]::WriteAllBytes($releaseReceipt, $builtReceiptBytes)
    }

    # patch-for-device.ps1 on the same root and stand-ins. It held every run's report to the
    # newest declared build, so an older declared build (README: 577 works too) was patched and
    # then refused with "unexpected package or version". Each declared build is held to its own
    # version now, the default fixture is still the newest build, and an undeclared build is
    # refused before the CLI starts. No -Serial, so nothing goes near adb.
    $deviceOut = Join-Path $releaseRoot 'device'
    function Invoke-DeviceBuild([string]$Apk, [string]$OutDir = $deviceOut, [string]$DesktopJar = $stubJar,
            [string]$OutputApk, [string]$Keystore = $standInKeystore) {
        Remove-Item -LiteralPath $javaLog, $mergeLog -Force -ErrorAction SilentlyContinue
        # An empty record store of its own, so no kept run, the machine's included, answers for the CLI.
        $arguments = @{ Root = $releaseRepo; DesktopJar = $DesktopJar; Java = $stubJava; Aapt2 = $stubAapt2; OutDir = $OutDir
            AndroidJar = $stubAndroidJar; ApiVersions = $stubApiVersions; AppliedDir = (Join-Path $releaseRoot 'applied-records-none')
            Keystore = $Keystore }
        if ($Apk) { $arguments['Apk'] = $Apk }
        if ($OutputApk) { $arguments['OutputApk'] = $OutputApk }
        $paths = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') @arguments 6> $null)
        Assert-True ($paths.Count -eq 1) 'The device builder did not return exactly one verified APK path.'
        $script:deviceApk = [string]$paths[0]
    }
    foreach ($build in $releaseTarget.PackageVersions) {
        try {
            Invoke-DeviceBuild -Apk $fixturePaths[$build]
        } catch {
            throw "patch-for-device.ps1 refused the declared build ${build}: $($_.Exception.Message)"
        }
        $deviceRuns = @(Get-Content -LiteralPath $javaLog)
        Assert-True ($deviceRuns.Count -eq 1 -and $deviceRuns[0] -eq "patch $($fixturePaths[$build]) merged forced=0" -and
            (@(Get-Content -LiteralPath $mergeLog) -join '; ') -eq "merge $($fixturePaths[$build])" -and
            (Test-Path -LiteralPath $deviceApk -PathType Leaf)) `
            "patch-for-device.ps1 did not build $build once, without -f: $($deviceRuns -join '; ')"
        Assert-True (-not (Test-Path -LiteralPath (Join-Path (Split-Path -Parent $deviceApk) 'stock-base.apk'))) `
            "patch-for-device.ps1 left the base APK it read for $build behind."
        $checkedSelection = @([IO.File]::ReadAllLines((Join-Path $tools 'selected-patches.txt')))
        $expectedSelection = @($releaseNames) + @($dependencyNamesHere)
        Assert-True (($checkedSelection -join "`n") -ceq ($expectedSelection -join "`n")) `
            'The device builder did not pass its exact selected patches and dependencies to the bytecode check.'
    }
    $savedFixtureDir = $env:HUSHTUMBLR_FIXTURE_DIR
    try {
        $env:HUSHTUMBLR_FIXTURE_DIR = $fixtures
        Invoke-DeviceBuild
        Assert-True ((@(Get-Content -LiteralPath $javaLog) -join '; ') -eq
            "patch $($fixturePaths[$releaseTarget.PackageVersion]) merged forced=0") `
            "With no -Apk, patch-for-device.ps1 did not take the newest declared build from the fixture folder."
    } finally {
        $env:HUSHTUMBLR_FIXTURE_DIR = $savedFixtureDir
    }
    # A report that leaves out its failed patch list, as kotlinx leaves out a field equal to its
    # default, prints no failure: @($null) holds one item, which verify-all-patches.ps1 printed as
    # FAILED unknown patch and patch-for-device.ps1 counted as one failure, of a report the check
    # had passed.
    $newestReport = "$newestFixture.result.json"
    $fullReport = [IO.File]::ReadAllText($newestReport)
    try {
        $failless = $fullReport | ConvertFrom-Json
        $failless.PSObject.Properties.Remove('failedPatches')
        Set-Content -LiteralPath $newestReport -Encoding ASCII -Value ($failless | ConvertTo-Json -Depth 6)
        $said = Invoke-VerifyAll -Apk $newestFixture
        Assert-True ($said -like '*: applied *, failed 0, CLI exit 0*' -and $said -cnotlike '*FAILED*' -and
            $said -like '*success: every requested patch applied*') `
            "verify-all-patches.ps1 printed a failure for a report with no failed patch list: $said"
        $deviceSaid = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') -Root $releaseRepo -DesktopJar $stubJar -Java $stubJava `
            -Aapt2 $stubAapt2 -OutDir (Join-Path $releaseRoot 'device-failless') -AndroidJar $stubAndroidJar `
            -ApiVersions $stubApiVersions -AppliedDir (Join-Path $releaseRoot 'applied-records-none') -Apk $newestFixture -Keystore $standInKeystore 6>&1 |
            ForEach-Object { "$_" }) -join "`n"
        Assert-True ($deviceSaid -like '*`[device`] applied *, failed 0, target *') `
            "patch-for-device.ps1 counted a failure in a report with no failed patch list: $deviceSaid"
    } finally {
        [IO.File]::WriteAllText($newestReport, $fullReport)
    }
    # The build a run is let through on is read off the base APK before any APK has been checked:
    # by path, of a copy another process of the same user could change while aapt2 read it, or of
    # an input replaced before Get-MergedApk came to it. So each script reads the same facts again
    # off the merge it holds, and stops before the CLI starts when they aren't the ones it decided
    # on (Assert-SameBuild). A merge of another version code stands in for either here.
    $sameBuildFixture = $fixturePaths[$releaseTarget.PackageVersion]
    $sameBuildMerge = "$sameBuildFixture.merged.txt"
    $sameBuildBytes = [System.IO.File]::ReadAllBytes($sameBuildMerge)
    $sameBuildCode = [regex]::Match([System.IO.File]::ReadAllText($sameBuildMerge), 'versionCode\(0x0101021b\)=(\d+)').Groups[1].Value
    $sameBuildReceipt = if (Test-Path -LiteralPath $releaseReceipt -PathType Leaf) { [System.IO.File]::ReadAllBytes($releaseReceipt) } else { $null }
    $sameBuildSays = ("*$(Split-Path -Leaf $sameBuildFixture) read as com.tumblr $($releaseTarget.PackageVersion) ($sameBuildCode) before its APKs " +
        "were checked, and the APK made from the checked ones is com.tumblr $($releaseTarget.PackageVersion) (7). What was read first is " +
        'not what was checked, so nothing was patched.*')
    try {
        [System.IO.File]::WriteAllText($sameBuildMerge, ([System.IO.File]::ReadAllText($sameBuildMerge) -replace
                '(versionCode\(0x0101021b\)=)\d+', '${1}7'), [System.Text.Encoding]::ASCII)
        foreach ($run in @(
                @{ Script = 'verify-all-patches.ps1'; Do = { Invoke-VerifyAll -Apk $sameBuildFixture } },
                @{ Script = 'build-release-receipt.ps1'
                    Do = { Invoke-ReceiptBuilder -Fixtures (@($sameBuildFixture) + @($allFixtures | Where-Object { $_ -ne $sameBuildFixture })) } },
                @{ Script = 'patch-for-device.ps1'
                    Do = { Invoke-DeviceBuild -Apk $sameBuildFixture -OutDir (Join-Path $releaseRoot 'same-build-device') } })) {
            Assert-Throws $run.Do $sameBuildSays "$($run.Script) went ahead on a build that isn't the one it read first."
            Assert-True (-not (Test-Path -LiteralPath $javaLog)) "$($run.Script) started the CLI on a build that isn't the one it read first."
        }
    } finally {
        [System.IO.File]::WriteAllBytes($sameBuildMerge, $sameBuildBytes)
        if ($null -ne $sameBuildReceipt) { [System.IO.File]::WriteAllBytes($releaseReceipt, $sameBuildReceipt) }
    }
    # A consumer may compile an APK while reporting a failed patch. Neither local runner may
    # deliver that retained output. Each failed run must clean only its own workspace.
    $goodPath = $deviceApk
    $goodHash = Get-Sha256Hex -Path $goodPath
    # A successful patch report is insufficient when the compiled hooks violate their contracts.
    $compiledFailureOut = Join-Path $releaseRoot 'compiled-failure-device'
    $compiledFailureMarker = Join-Path $tools 'dexdiff-fails.txt'
    [IO.File]::WriteAllText($compiledFailureMarker, 'required call absent')
    try {
        Assert-Throws { Invoke-DeviceBuild -Apk $fixturePaths[$releaseTarget.PackageVersion] -OutDir $compiledFailureOut } `
            '*compiled mutation or structural checks*' 'The device runner delivered an unsafe compiled APK.'
        Assert-True (@(Get-ChildItem -LiteralPath $compiledFailureOut -Directory).Count -eq 0 -and
            (Get-Sha256Hex -Path $goodPath) -ceq $goodHash) `
            'A compiled failure retained its output or changed a previously verified APK.'
        Assert-Throws { Invoke-VerifyAll -Apk $fixturePaths[$releaseTarget.PackageVersion] } `
            '*verify-all-patches.ps1 exited 1*' 'The throwaway runner accepted missing compiled hooks.'
        Assert-True (@(Get-ChildItem -LiteralPath (Join-Path $releaseRoot 'verify-work') -Directory -Filter 'verify-*').Count -eq 0) `
            'The throwaway runner retained an unsafe compiled APK.'
    } finally { Remove-Item -LiteralPath $compiledFailureMarker -Force }
    $referenceFailureOut = Join-Path $releaseRoot 'reference-failure-device'
    $referenceFailureMarker = Join-Path $tools 'references-fails.txt'
    [IO.File]::WriteAllText($referenceFailureMarker, 'inserted host method missing')
    try {
        Assert-Throws { Invoke-DeviceBuild -Apk $fixturePaths[$releaseTarget.PackageVersion] -OutDir $referenceFailureOut } `
            '*compiled mutation or structural checks*' 'The device runner delivered an APK with an unresolved inserted host call.'
        Assert-True (@(Get-ChildItem -LiteralPath $referenceFailureOut -Directory).Count -eq 0 -and
            (Get-Sha256Hex -Path $goodPath) -ceq $goodHash) `
            'A reference failure retained its output or changed a previously verified APK.'
        Assert-Throws { Invoke-VerifyAll -Apk $fixturePaths[$releaseTarget.PackageVersion] } `
            '*verify-all-patches.ps1 exited 1*' 'The throwaway runner accepted an unresolved inserted host call.'
        Assert-True (@(Get-ChildItem -LiteralPath (Join-Path $releaseRoot 'verify-work') -Directory -Filter 'verify-*').Count -eq 0) `
            'The throwaway runner retained an APK with an unresolved inserted host call.'
    } finally { Remove-Item -LiteralPath $referenceFailureMarker -Force }
    $failureFixture = $fixturePaths[$releaseTarget.PackageVersions[-1]]
    $failureReportPath = "$failureFixture.result.json"
    $savedReport = [IO.File]::ReadAllBytes($failureReportPath)
    try {
        $failedReport = Get-Content -LiteralPath $failureReportPath -Raw | ConvertFrom-Json
        $failedReport.failedPatches = @([pscustomobject]@{ name = $releaseNames[0]; message = 'late preflight failed' })
        Set-Content -LiteralPath $failureReportPath -Value ($failedReport | ConvertTo-Json -Depth 8) -Encoding UTF8
        $concurrentOut = Join-Path $releaseRoot 'concurrent-device'
        $patchScript = Join-Path $PSScriptRoot 'patch-for-device.ps1'
        $jobs = @()
        try {
            foreach ($inputApk in @($fixturePaths[$releaseTarget.PackageVersion], $failureFixture)) {
                $jobArgs = @{ Root = $releaseRepo; DesktopJar = $stubJar; Java = $stubJava; Aapt2 = $stubAapt2;
                    AndroidJar = $stubAndroidJar; ApiVersions = $stubApiVersions;
                    OutDir = $concurrentOut; Apk = $inputApk; AppliedDir = (Join-Path $releaseRoot 'applied-records-none') }
                $jobs += Start-Job -ScriptBlock {
                    param($Script, $Arguments)
                    $ErrorActionPreference = 'Stop'
                    try {
                        $output = @(& $Script @Arguments 6> $null)
                        [pscustomobject]@{ Success = $true; Paths = $output; Reason = '' }
                    } catch { [pscustomobject]@{ Success = $false; Paths = @(); Reason = $_.Exception.Message } }
                } -ArgumentList $patchScript, $jobArgs
            }
            $answers = @($jobs | Wait-Job | Receive-Job)
            $passed = @($answers | Where-Object Success)
            $refused = @($answers | Where-Object { -not $_.Success })
            Assert-True ($passed.Count -eq 1 -and $refused.Count -eq 1 -and
                $refused[0].Reason -like '*Patching did not produce a complete APK*') `
                "Concurrent builders didn't independently accept/refuse their own reports: $($answers | ConvertTo-Json -Depth 4 -Compress)"
            $concurrentApk = [string]@($passed[0].Paths)[0]
            Assert-True ((Test-Path -LiteralPath $concurrentApk -PathType Leaf) -and
                (Get-Sha256Hex -Path $concurrentApk) -ceq (Get-Sha256Hex -Path (Join-Path $tools 'patched.apk')) -and
                (Get-Sha256Hex -Path $goodPath) -ceq $goodHash) "One patch run overwrote another run's APK."
            $remainingRuns = @(Get-ChildItem -LiteralPath $concurrentOut -Directory)
            Assert-True ($remainingRuns.Count -eq 1 -and
                $remainingRuns[0].FullName -eq (Split-Path -Parent $concurrentApk)) `
                'The failed run retained its APK or removed the successful workspace.'
            Assert-True (-not (Test-Path -LiteralPath (Join-Path $remainingRuns[0].FullName 'morphe-patch.args')) -and
                -not (Test-Path -LiteralPath (Join-Path $remainingRuns[0].FullName 'tmp'))) `
                'The successful run retained its private arguments or temporary files.'
        } finally {
            $jobs | Remove-Job -Force -ErrorAction SilentlyContinue
        }
        Assert-Throws { Invoke-VerifyAll -Apk $failureFixture } '*verify-all-patches.ps1 exited 1*' `
            'The throwaway verifier accepted an APK from a failed patch report.'
        Assert-True (@(Get-ChildItem -LiteralPath (Join-Path $releaseRoot 'verify-work') -Directory -Filter 'verify-*').Count -eq 0) `
            'The throwaway verifier retained a failed compiled APK.'
        Set-Content -LiteralPath $failureReportPath -Value '{broken-json' -Encoding ASCII
        $malformedOut = Join-Path $releaseRoot 'malformed-device'
        Assert-Throws { Invoke-DeviceBuild -Apk $failureFixture -OutDir $malformedOut } '*JSON*' `
            'The device runner accepted a malformed result beside a compiled APK.'
        Assert-True (@(Get-ChildItem -LiteralPath $malformedOut -Directory).Count -eq 0) `
            'A malformed result left a deliverable APK behind.'
        Assert-Throws { Invoke-VerifyAll -Apk $failureFixture } '*verify-all-patches.ps1 exited 1*' `
            'The throwaway verifier accepted a malformed report beside a compiled APK.'
        Assert-True (@(Get-ChildItem -LiteralPath (Join-Path $releaseRoot 'verify-work') -Directory -Filter 'verify-*').Count -eq 0) `
            'The throwaway verifier retained a malformed-report APK.'
        $forbiddenDeviceLog = Join-Path $tools 'forbidden-device.log'
        [IO.File]::WriteAllText((Join-Path $tools 'adb.cmd'), "@echo off`r`necho called >`"$forbiddenDeviceLog`"`r`nexit /b 7`r`n")
        $savedPath = $env:PATH
        try {
            $env:PATH = $tools + [IO.Path]::PathSeparator + $savedPath
            Assert-Throws {
                & $patchScript -Root $releaseRepo -Apk $failureFixture -DesktopJar $stubJar -Java $stubJava `
                    -Aapt2 $stubAapt2 -OutDir $malformedOut -Serial emulator-5999 -AppliedDir (Join-Path $releaseRoot 'applied-records-none') `
                    -LeaseDirectory (Join-Path $releaseRoot 'forbidden-leases') 6> $null
            } '*JSON*' 'The device runner reached installation after a malformed report.'
            Assert-True (-not (Test-Path -LiteralPath $forbiddenDeviceLog) -and
                -not (Test-Path -LiteralPath (Join-Path $releaseRoot 'forbidden-leases'))) `
                'A malformed report reached ADB or device lease acquisition.'
        } finally { $env:PATH = $savedPath }
    } finally { [IO.File]::WriteAllBytes($failureReportPath, $savedReport) }
    # Explicit destinations use atomic creation. A collision must fail before invoking tools.
    $explicitApk = Join-Path $releaseRoot 'explicit.apk'
    Invoke-DeviceBuild -Apk $fixturePaths[$releaseTarget.PackageVersion] -OutputApk $explicitApk
    Assert-True ($deviceApk -ceq $explicitApk -and (Test-Path -LiteralPath $explicitApk)) `
        'An explicit destination wasn't returned after successful validation.'
    $explicitHash = Get-Sha256Hex -Path $explicitApk
    Assert-Throws { Invoke-DeviceBuild -Apk $fixturePaths[$releaseTarget.PackageVersion] -OutputApk $explicitApk } `
        '*explicit APK destination already exists*' 'A colliding explicit output was overwritten.'
    Assert-True (-not (Test-Path -LiteralPath $javaLog) -and (Get-Sha256Hex -Path $explicitApk) -ceq $explicitHash) `
        'An explicit collision invoked the patcher or changed the previously verified APK.'
    Assert-Throws { Invoke-DeviceBuild -Apk $fixturePaths[$newerBuild] } "*$newerBuild, which the bundle does not declare*" `
        'patch-for-device.ps1 took a build the catalog does not declare.'
    Assert-True (-not (Test-Path -LiteralPath $javaLog)) 'patch-for-device.ps1 started the CLI on an undeclared build.'
    Assert-Throws { Invoke-DeviceBuild -Apk $variantApkm } "*$variantBuild, which the bundle does not declare, at version code $variantCode*" `
        'patch-for-device.ps1 took another build of a declared version.'
    Assert-True (-not (Test-Path -LiteralPath $javaLog)) 'patch-for-device.ps1 started the CLI on another build of a declared version.'

    # Another app's bundle, at a version the catalog declares for Tumblr. Neither script may
    # hand it to the CLI: each refuses it by name before anything
    # is patched. The builder gets it beside the newest declared build, so every declared build has
    # a fixture and only the package check stands in the way.
    $otherPackage = 'com.example.nottumblr'
    $otherApkm = Join-Path $fixtures "other-app-$($unproved[0])-arm64-v8a.apkm"
    New-TestBundleArchive -Path $otherApkm -Entries ([ordered]@{
        'info.json' = "{`"versioncode`":`"$versionCode`"}"
        'base.apk' = Get-FixtureManifest -Build $unproved[0] -Code "$versionCode" -Package $otherPackage })
    $otherRefusal = "*$(Split-Path -Leaf $otherApkm) is $otherPackage, not the catalog's target $($releaseTarget.PackageName)*"
    Assert-Throws { Invoke-ReceiptBuilder -Fixtures @($fixturePaths[$releaseTarget.PackageVersion], $otherApkm) } $otherRefusal `
        'build-release-receipt.ps1 took a fixture of another package.'
    Assert-True (-not (Test-Path -LiteralPath $javaLog)) 'build-release-receipt.ps1 started the CLI on another package.'
    Assert-Throws { Invoke-DeviceBuild -Apk $otherApkm } $otherRefusal 'patch-for-device.ps1 took another package.'
    Assert-True (-not (Test-Path -LiteralPath $javaLog)) 'patch-for-device.ps1 started the CLI on another package.'

    # A declared build whose base APK is Tumblr's and one of whose splits isn't: unsigned, changed
    # after signing, signed by somebody else, or signed by somebody else beside Tumblr. Every script
    # that takes a fixture straight refuses it, naming the split, before anything is merged, signed,
    # installed or written into a receipt. The fixture is the first the receipt builder patches, so
    # nothing of the run gets that far. A Source Stamp beside Tumblr's signer is the control: the
    # same fixture with it passes.
    $splitFixture = $fixturePaths[$builtBuilds[0]]
    $splitCode = [string]@($releaseTarget.PackageVersionCodes[$builtBuilds[0]])[0]
    $splitFixtureBytes = [System.IO.File]::ReadAllBytes($splitFixture)
    $splitReceiptBytes = [System.IO.File]::ReadAllBytes($releaseReceipt)
    $splitDeviceOut = Join-Path $releaseRoot 'device-refused-split'
    function Set-FixtureSplit([string]$Marker) {
        Remove-Item -LiteralPath $splitFixture -Force
        New-TestBundleArchive -Path $splitFixture -Entries ([ordered]@{
            'com.tumblr.apk' = "N: stand-in-bundle=$splitFixture`n" + (Get-FixtureManifest -Build $builtBuilds[0] -Code $splitCode)
            'icon.png' = 'icon'
            'config.arm64_v8a.apk' = Get-FixtureSplitManifest -Code $splitCode -Split 'config.arm64_v8a' -Marker $Marker
            'manifest.json' = ("{`"package_name`":`"com.tumblr`",`"version_code`":`"$splitCode`",`"split_apks`":[" +
                '{"file":"com.tumblr.apk","id":"base"},{"file":"config.arm64_v8a.apk","id":"config.arm64_v8a"}]}') })
    }
    try {
        foreach ($bad in @(
                @{ Marker = 'stand-in-unsigned'; Says = 'config.arm64_v8a.apk does not verify (*DOES NOT VERIFY*' },
                @{ Marker = 'stand-in-tampered'; Says = 'config.arm64_v8a.apk does not verify (*integrity check failed*' },
                @{ Marker = 'stand-in-foreign'; Says = "config.arm64_v8a.apk is signed by $foreignSigner, which isn't*" },
                @{ Marker = 'stand-in-second-signer'; Says = "config.arm64_v8a.apk is signed by $foreignSigner, which isn't*" })) {
            Set-FixtureSplit -Marker $bad.Marker
            $splitRefusal = "*Refusing $(Split-Path -Leaf $splitFixture): $($bad.Says)*Nothing was merged or patched.*"
            Remove-Item -LiteralPath $releaseReceipt -Force -ErrorAction SilentlyContinue
            Assert-Throws { Invoke-ReceiptBuilder -Fixtures $allFixtures } $splitRefusal `
                "build-release-receipt.ps1 took a fixture whose split is marked $($bad.Marker)."
            Assert-True (-not (Test-Path -LiteralPath $mergeLog) -and -not (Test-Path -LiteralPath $javaLog) -and
                -not (Test-Path -LiteralPath $releaseReceipt) -and
                @(Get-ChildItem -LiteralPath (Join-Path $releaseRoot 'work') -Directory -Filter 'receipt-*').Count -eq 0) `
                "build-release-receipt.ps1 merged, patched or wrote a receipt with a split marked $($bad.Marker)."
            Assert-Throws { Invoke-VerifyAll -Apk $splitFixture } $splitRefusal `
                "verify-all-patches.ps1 took a fixture whose split is marked $($bad.Marker)."
            Assert-True (-not (Test-Path -LiteralPath $mergeLog) -and -not (Test-Path -LiteralPath $javaLog) -and
                -not (Test-Path -LiteralPath $resourceStock) -and
                @(Get-ChildItem -LiteralPath (Join-Path $releaseRoot 'verify-work') -Directory -Filter 'verify-*').Count -eq 0) `
                "verify-all-patches.ps1 merged or patched with a split marked $($bad.Marker)."
            Remove-Item -LiteralPath $apksignerLog -Force -ErrorAction SilentlyContinue
            Assert-Throws { Invoke-DeviceBuild -Apk $splitFixture -OutDir $splitDeviceOut } $splitRefusal `
                "patch-for-device.ps1 took a fixture whose split is marked $($bad.Marker)."
            Assert-True (-not (Test-Path -LiteralPath $mergeLog) -and -not (Test-Path -LiteralPath $javaLog) -and
                -not (Test-Path -LiteralPath $apksignerLog) -and
                @(Get-ChildItem -LiteralPath $splitDeviceOut -Directory -ErrorAction SilentlyContinue).Count -eq 0) `
                "patch-for-device.ps1 merged, patched, signed or kept a run with a split marked $($bad.Marker)."
        }
        Set-FixtureSplit -Marker 'stand-in-stamp'
        $said = Invoke-VerifyAll -Apk $splitFixture
        Assert-True ($said -like '*success: every requested patch applied*' -and
            (@(Get-Content -LiteralPath $mergeLog) -join ';') -eq "merge $splitFixture") `
            "A fixture whose split carries a Source Stamp beside Tumblr's signer was refused: $said"
    } finally {
        [System.IO.File]::WriteAllBytes($splitFixture, $splitFixtureBytes)
        [System.IO.File]::WriteAllBytes($releaseReceipt, $splitReceiptBytes)
    }

    # The same unsigned split in the last fixture the receipt builder is given, the undeclared build
    # it patches under -f. Every fixture is checked before the first is merged, so the declared
    # builds ahead of it are neither merged nor patched, and the check leaves no folder behind.
    # Checked only as each was reached, the run merged and patched them first.
    $lastFixture = $fixturePaths[$newerBuild]
    $lastFixtureBytes = [System.IO.File]::ReadAllBytes($lastFixture)
    $lastReceiptBytes = [System.IO.File]::ReadAllBytes($releaseReceipt)
    try {
        Assert-True ($allFixtures.Count -gt 1 -and $allFixtures[-1] -ceq $lastFixture) `
            'The receipt builder is not given the undeclared build last, after the declared ones.'
        Remove-Item -LiteralPath $lastFixture -Force
        New-TestBundleArchive -Path $lastFixture -Entries ([ordered]@{
            'com.tumblr.apk' = "N: stand-in-bundle=$lastFixture`n" + (Get-FixtureManifest -Build $newerBuild -Code "$newerCode" -MinSdk 36)
            'icon.png' = 'icon'
            'config.arm64_v8a.apk' = Get-FixtureSplitManifest -Code "$newerCode" -Split 'config.arm64_v8a' -Marker 'stand-in-unsigned'
            'manifest.json' = ("{`"package_name`":`"com.tumblr`",`"version_code`":`"$newerCode`",`"split_apks`":[" +
                '{"file":"com.tumblr.apk","id":"base"},{"file":"config.arm64_v8a.apk","id":"config.arm64_v8a"}]}') })
        Remove-Item -LiteralPath $releaseReceipt -Force -ErrorAction SilentlyContinue
        Assert-Throws { Invoke-ReceiptBuilder -Fixtures $allFixtures } `
            "*Refusing $(Split-Path -Leaf $lastFixture): config.arm64_v8a.apk does not verify (*Nothing was merged or patched.*" `
            'build-release-receipt.ps1 took a last fixture whose split is unsigned.'
        Assert-True (-not (Test-Path -LiteralPath $mergeLog) -and -not (Test-Path -LiteralPath $javaLog) -and
            -not (Test-Path -LiteralPath $releaseReceipt) -and
            @(Get-ChildItem -LiteralPath (Join-Path $releaseRoot 'work') -Directory |
                Where-Object { $_.Name -like 'receipt-*' -or $_.Name -like 'check-*' }).Count -eq 0) `
            'build-release-receipt.ps1 merged or patched the fixtures ahead of one with an unsigned split, or left a folder behind.'
    } finally {
        [System.IO.File]::WriteAllBytes($lastFixture, $lastFixtureBytes)
        [System.IO.File]::WriteAllBytes($releaseReceipt, $lastReceiptBytes)
    }

    # The builder, the release check and the device build given relative paths, from a location
    # the process directory isn't. Each found its file with Test-Path, in PowerShell's location,
    # and then opened or wrote it with .NET, which reads the process directory: the builder died
    # on a relative -Bundle with "Could not find file", and the release check on -ArtifactPath.
    $elsewhere = Join-Path $releaseRoot 'elsewhere'
    New-Item -ItemType Directory -Path $elsewhere -Force | Out-Null
    $inRoot = { param([string]$Path) $Path.Substring($releaseRoot.TrimEnd('\').Length + 1) }
    $savedProcessDirectory = [Environment]::CurrentDirectory
    Push-Location -LiteralPath $releaseRoot
    try {
        [Environment]::CurrentDirectory = $elsewhere
        try {
            Invoke-ReceiptBuilder -Fixtures @($allFixtures | ForEach-Object { & $inRoot $_ }) `
                -Bundle (& $inRoot $releaseBundle) -WorkDir 'work-relative' -DesktopJar (& $inRoot $stubJar)
        } catch {
            throw "build-release-receipt.ps1 refused relative paths: $($_.Exception.Message)"
        }
        $global:LASTEXITCODE = 0
        & $factsScript -Root $releaseRepo -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipUrlCheck `
            -ArtifactPath (& $inRoot $releaseBundle) 6> $null
        Assert-True ($LASTEXITCODE -eq 0) "The release check exited $LASTEXITCODE on a relative -ArtifactPath."
        try {
            Invoke-DeviceBuild -Apk (& $inRoot $fixturePaths[$releaseTarget.PackageVersion]) -OutDir 'device-relative' `
                -DesktopJar (& $inRoot $stubJar) -Keystore (& $inRoot $standInKeystore)
        } catch {
            throw "patch-for-device.ps1 refused relative paths: $($_.Exception.Message)"
        }
        Assert-True ((Test-Path -LiteralPath $deviceApk) -and
            $deviceApk.StartsWith((Join-Path $releaseRoot 'device-relative') + '\', [StringComparison]::OrdinalIgnoreCase)) `
            'patch-for-device.ps1 given a relative -OutDir left no APK there.'
        Assert-True (@(Get-ChildItem -LiteralPath $elsewhere -Recurse -Force).Count -eq 0) `
            ("A relative path was written in the process directory instead: " +
                ((Get-ChildItem -LiteralPath $elsewhere -Recurse -Force | Select-Object -First 3 | ForEach-Object { $_.Name }) -join ', '))
    } finally {
        [Environment]::CurrentDirectory = $savedProcessDirectory
        Pop-Location
    }

    # The index push. `gh release create` makes the release tag on GitHub only, so the clone that
    # pushes the new description doesn't have it, and the floor check printed that it hadn't run
    # and let the push through. The hook's published asset run reads the tag's commit off the
    # remote and holds the bundle to it, so the floor is read at that commit as well; a run with no
    # bundle asks the repository the index names. A bare repository answers for GitHub through the
    # fixture's url.insteadOf, and stand-ins serve the download, its checksum list, the repository
    # description and the CLI's patch listing, so nothing leaves the machine.
    $indexUrl = [Uri]($releaseIndexText | ConvertFrom-Json).download_url
    $indexRepository = 'https://github.com/' + ((@($indexUrl.AbsolutePath.Trim('/') -split '/') | Select-Object -First 2) -join '/') + '.git'
    $publishedRepo = (Join-Path $releaseRoot 'published.git').Replace('\', '/')
    Invoke-FixtureGit -Root $releaseRoot -Arguments @('init', '--bare', '--quiet', $publishedRepo) | Out-Null
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('config', "url.$publishedRepo.insteadOf", $indexRepository) | Out-Null
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('push', '--quiet', $publishedRepo, "refs/tags/v$indexVersionHere") | Out-Null
    Set-Content -LiteralPath (Join-Path $tools 'patch-names.txt') -Encoding ASCII -Value @($releaseNames | ForEach-Object { "Name: $_" })
    $listJava = Join-Path $tools 'list-java.cmd'
    [System.IO.File]::WriteAllText($listJava, ((@(
        '@echo off',
        'setlocal EnableExtensions',
        'rem The release check runs -jar <cli> list-patches ... --out=<file>, and cmd splits that at the',
        'rem equals sign unless the path has a space in it.',
        'set "HERE=%~dp0"',
        'set "LISTING="',
        'if "%~1"=="-version" (',
        '    echo openjdk version "21.0.5" 2024-10-15',
        '    exit /b 0',
        ')',
        ':next',
        'if "%~1"=="" exit /b 2',
        'set "ARG=%~1"',
        'if "%ARG%"=="--out" set "LISTING=%~2"',
        'if "%ARG:~0,6%"=="--out=" set "LISTING=%ARG:~6%"',
        'if defined LISTING goto list',
        'shift',
        'goto next',
        ':list',
        'echo WARNING: a stand-in warning on standard error 1>&2',
        'copy /y "%HERE%patch-names.txt" "%LISTING%" >nul || exit /b 3',
        'exit /b 0') -join "`r`n") + "`r`n"), [System.Text.Encoding]::ASCII)
    # What GitHub answers: the served bundle, SBOM and receipt, a checksum list naming all three (or
    # $servedSums, when a case wants a wrong one), and the repository description. Dot-sourced into
    # each runner, so the check it starts finds them first. The SBOM served is a copy of the one
    # beside the bundle, which the cases below take away along with the bundle, and the receipt
    # served is the release's own, as the release uploads it, unless a case serves another.
    $servedBundle = $releaseBundle
    $cleanServedSbom = Join-Path $releaseRoot "served\patches-$releaseVersionHere.cdx.json"
    New-Item -ItemType Directory -Path (Split-Path -Parent $cleanServedSbom) -Force | Out-Null
    Copy-Item -LiteralPath $releaseSbom -Destination $cleanServedSbom
    $servedSbom = $cleanServedSbom
    $servedSums = $null
    $servedReceipt = $null
    . (Join-Path $PSScriptRoot 'release-checksums.ps1')
    $signerFixture = Join-Path $releaseRoot 'checksum-signer'
    [void][IO.Directory]::CreateDirectory($signerFixture)
    $signerHome = Join-Path $signerFixture 'private'
    [void][IO.Directory]::CreateDirectory($signerHome)
    $generated = Invoke-ReleaseChecksumGpg 'gpg' (@(Get-ReleaseChecksumGpgArguments $signerHome) + @(
        '--pinentry-mode','loopback','--passphrase=','--quick-generate-key',
        'Release fixture <release-fixture@example.invalid>','ed25519','sign','1d'))
    Assert-True ($generated.ExitCode -eq 0) "Could not create the isolated checksum test signer: $($generated.Output -join ' ')"
    $listedSigner = Invoke-ReleaseChecksumGpg 'gpg' (@(Get-ReleaseChecksumGpgArguments $signerHome) + @('--with-colons','--with-fingerprint','--list-keys'))
    $signerFingerprint = (@($listedSigner.Output | Where-Object { $_ -like 'fpr:*' })[0].Split(':')[9]).ToUpperInvariant()
    $signerPublicKey = Join-Path $signerFixture 'public.asc'
    $exportedSigner = Invoke-ReleaseChecksumGpg 'gpg' (@(Get-ReleaseChecksumGpgArguments $signerHome) + @(
        '--armor','--output',$signerPublicKey,'--export',$signerFingerprint))
    Assert-True ($exportedSigner.ExitCode -eq 0) 'Could not export the isolated checksum public key.'
    $servedSignatureMode = 'valid'
    $publishedStandIns = {
        function Invoke-WebRequest {
            param($Uri, $Method, $OutFile, $MaximumRedirection, $TimeoutSec, [switch]$PassThru, [switch]$UseBasicParsing)
            # Windows PowerShell 5.1, the hook's shell wherever pwsh is off the PATH, hands a reply
            # without -UseBasicParsing to the IE parser, and since its 2025 security update it asks
            # first. A hook can't answer, so every index push through it stopped at the download.
            if (-not $UseBasicParsing) { throw "Invoke-WebRequest $Uri without -UseBasicParsing" }
            $receiptServed = if ($servedReceipt) { $servedReceipt } else { $releaseReceipt }
            if ($OutFile) {
                $served = if ("$Uri" -like '*.cdx.json') { $servedSbom } elseif ("$Uri" -like '*/release-receipt-*.json') {
                    $receiptServed } else { $servedBundle }
                Copy-Item -LiteralPath $served -Destination $OutFile -Force
            }
            $sums = if ($servedSums) { $servedSums } else {
                "$((Get-FileHash -LiteralPath $servedBundle -Algorithm SHA256).Hash.ToLowerInvariant())  patches-$indexVersionHere.mpp`n" +
                    "$((Get-FileHash -LiteralPath $servedSbom -Algorithm SHA256).Hash.ToLowerInvariant())  patches-$indexVersionHere.cdx.json`n" +
                    "$((Get-FileHash -LiteralPath $receiptServed -Algorithm SHA256).Hash.ToLowerInvariant())  release-receipt-$releaseVersionHere.json`n"
            }
            if ("$Uri" -like '*/SHA256SUMS.txt' -or "$Uri" -like '*/SHA256SUMS.txt.asc') {
                $lines = @($sums.TrimEnd([char]10).Split([char]10) | Sort-Object { $_.Substring(66) })
                $sums = ($lines -join "`n") + "`n"
                $payloadPath = Join-Path $signerFixture 'SHA256SUMS.txt'
                $signaturePath = "$payloadPath.asc"
                if ("$Uri" -like '*/SHA256SUMS.txt') {
                    [IO.File]::WriteAllText($payloadPath, $sums, [Text.Encoding]::ASCII)
                    Remove-Item -LiteralPath $signaturePath -Force -ErrorAction SilentlyContinue
                    $signedFixture = Invoke-ReleaseChecksumGpg 'gpg' (@(Get-ReleaseChecksumGpgArguments $signerHome) + @(
                        '--armor','--digest-algo','SHA256','--local-user',$signerFingerprint,'--output',$signaturePath,
                        '--detach-sign',$payloadPath))
                    if ($signedFixture.ExitCode -ne 0) { throw 'Could not sign the hosted checksum fixture.' }
                    if ($servedSignatureMode -eq 'tampered-hash') {
                        $first = if ($sums[0] -eq '0') { '1' } else { '0' }
                        $sums = $first + $sums.Substring(1)
                    }
                } else {
                    if ($servedSignatureMode -eq 'missing') { throw 'Detached signature fixture is missing.' }
                    $signatureBytes = [IO.File]::ReadAllBytes($signaturePath)
                    if ($servedSignatureMode -eq 'tampered-signature') { $signatureBytes = [Text.Encoding]::ASCII.GetBytes('not a signature') }
                    return [pscustomobject]@{ StatusCode = 200; Content = $signatureBytes }
                }
            }
            [pscustomobject]@{ StatusCode = 200; Content = [Text.Encoding]::UTF8.GetBytes($sums) }
        }
        function gh {
            $global:LASTEXITCODE = 0
            "HushTumblr v${indexVersionHere}: $($releaseNames.Count) patches for Tumblr $($releaseTarget.PackageVersion)."
        }
    }
    function Invoke-IndexPushCheck([hashtable]$Arguments) {
        $saved = @{}
        foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
            $saved[$variable.Name] = $variable.Value
            Remove-Item -LiteralPath ('Env:\' + $variable.Name)
        }
        # The asset check asks git for the published tag from where it runs, not through -Root.
        Push-Location -LiteralPath $releaseRepo
        try {
            . $publishedStandIns
            . $osvStandIn
            $global:LASTEXITCODE = 0
            $said = @(& $factsScript -Root $releaseRepo @Arguments 3>&1 6>&1 | ForEach-Object { "$_" }) -join "`n"
            if ($LASTEXITCODE -ne 0) { throw "The release check exited $LASTEXITCODE on the index push: $said" }
            return $said
        } finally {
            Pop-Location
            foreach ($name in $saved.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $saved[$name] }
        }
    }
    $publishedRun = @{ VerifyPublishedAsset = $true; ArtifactPath = $releaseBundle; SkipDescriptionTestCount = $true
        SkipUrlCheck = $true; DesktopJar = $stubJar; Java = $listJava;
        TrustedPublicKeyPath = $signerPublicKey; TrustedFingerprint = $signerFingerprint }
    # The index step writes the signed bundle's digest into the README before this check runs and
    # commits it after, so the README here quotes the stub bundle, uncommitted, until the cases end.
    $releaseReadmeCommitted = [System.IO.File]::ReadAllBytes($releaseReadmePath)
    $releaseBundleHash = (Get-FileHash -LiteralPath $releaseBundle -Algorithm SHA256).Hash.ToLowerInvariant()
    function Set-ReleaseReadmeChecksum([string]$Digest) {
        $text = [System.Text.Encoding]::UTF8.GetString($releaseReadmeCommitted) -replace
            '(?m)^[0-9a-f]{64}(  patches-\d+(?:\.\d+)+\.mpp)', "$Digest`${1}"
        [System.IO.File]::WriteAllText($releaseReadmePath, $text, (New-Object System.Text.UTF8Encoding($false)))
    }
    Set-ReleaseReadmeChecksum $releaseBundleHash
    try {
        $missingPin = $publishedRun.Clone()
        $missingPin['TrustedPublicKeyPath'] = ''; $missingPin['TrustedFingerprint'] = ''
        Assert-Throws { Invoke-IndexPushCheck $missingPin } '*requires an independently pinned*' 'An asset was accepted without an independent signer pin.'
        $wrongPin = $publishedRun.Clone()
        $wrongPin['TrustedFingerprint'] = '0' * 40
        Assert-Throws { Invoke-IndexPushCheck $wrongPin } '*pinned fingerprint*' 'An asset was accepted under a mismatched pinned key.'
        foreach ($mode in @('tampered-hash','tampered-signature','missing')) {
            $servedSignatureMode = $mode
            $pattern = if ($mode -eq 'missing') { '*Could not download the detached checksum signature*' } else { '*signature authentication failed*' }
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } $pattern "The asset runner accepted $mode checksum authentication."
        }
        $servedSignatureMode = 'valid'
        Invoke-FixtureGit -Root $releaseRepo -Arguments @('tag', '-d', "v$indexVersionHere") | Out-Null
        $said = Invoke-IndexPushCheck $publishedRun
        Assert-True ($said -like "*published bundle is pinned to v$indexVersionHere ($releaseCommit)*" -and
            $said -like "*the index asks for Morphe Manager $releaseFloor or newer, as tag v$indexVersionHere pins*") `
            "The index push was not held to the Manager floor its published tag pins: $said"
        Assert-True ($said -like "*README's checksum example quotes the hosted patches-$indexVersionHere.mpp*") `
            "The index push did not hold the README's checksum example to the hosted bundle: $said"
        # A README still quoting the bundle before this one, which is what a hand-edited release left behind.
        Set-ReleaseReadmeChecksum ('3' * 64)
        try {
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } `
                "*README's checksum example quotes $('3' * 64) for patches-$indexVersionHere.mpp, but the hosted bundle is $releaseBundleHash*" `
                'An index push went through with a README quoting another bundle''s digest.'
        } finally {
            Set-ReleaseReadmeChecksum $releaseBundleHash
        }
        # The SBOM the receipt names, as the release hosts it, and OSV asked about it again.
        Assert-True ($said -like ("*the hosted patches-$indexVersionHere.cdx.json is the SBOM the receipt names and " +
                "SHA256SUMS.txt lists, and it describes patches-$indexVersionHere.mpp, payloads and all*") -and
            $said -like "*OSV has no advisory for the libraries patches-$indexVersionHere.cdx.json lists: gson 2.14.0*") `
            "The index push did not hold the hosted SBOM to the receipt, or did not ask OSV about it: $said"
        Assert-True ($said -like '*the Tumblr source census is 0 day(s) old*every index lists HushTumblr or has its submission*') `
            "The index push was not held to the Tumblr source census: $said"
        # The receipt the release hosts, held to SHA256SUMS.txt and to the receipt checked here.
        Assert-True ($said -like "*the hosted release-receipt-$releaseVersionHere.json is the receipt checked here, as SHA256SUMS.txt lists it*") `
            "The index push did not hold the hosted receipt to the one it checked: $said"
        # And each way it can fail: SHA256SUMS.txt not listing it, listing another hash, or the
        # release hosting another receipt, one cut again after the upload. That one differs in its
        # last byte alone, and the push stops all the same.
        $recutReceipt = Join-Path $releaseRoot "served\recut\release-receipt-$releaseVersionHere.json"
        New-Item -ItemType Directory -Path (Split-Path -Parent $recutReceipt) -Force | Out-Null
        $recutBytes = New-Object System.Collections.Generic.List[byte] (, [System.IO.File]::ReadAllBytes($releaseReceipt))
        $recutBytes.Add(10)
        [System.IO.File]::WriteAllBytes($recutReceipt, $recutBytes.ToArray())
        $bundleAndSbomSums = "$((Get-FileHash -LiteralPath $releaseBundle -Algorithm SHA256).Hash.ToLowerInvariant())  patches-$indexVersionHere.mpp`n" +
            "$((Get-FileHash -LiteralPath $cleanServedSbom -Algorithm SHA256).Hash.ToLowerInvariant())  patches-$indexVersionHere.cdx.json`n"
        try {
            $servedSums = $bundleAndSbomSums
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } "*SHA256SUMS.txt has no entry for release-receipt-$releaseVersionHere.json*" `
                'An index push went through with a receipt SHA256SUMS does not list.'
            $servedSums = $bundleAndSbomSums + "$('2' * 64)  release-receipt-$releaseVersionHere.json`n"
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } `
                "*SHA256SUMS.txt lists $('2' * 64) for release-receipt-$releaseVersionHere.json, but the hosted receipt is*" `
                'An index push went through with a receipt SHA256SUMS lists under another hash.'
            $servedSums = $null
            $servedReceipt = $recutReceipt
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } `
                "*The hosted release-receipt-$releaseVersionHere.json is not the receipt checked here*" `
                'An index push went through with a hosted receipt that is not the one it checked.'
        } finally {
            $servedSums = $null
            $servedReceipt = $null
        }

        # The census, one fact at a time. Fourteen days old is still a release; fifteen isn't. An
        # index that doesn't list HushTumblr yet is named in what the release says, not a refusal:
        # a submission is a public request on someone else's project. The lenient check every other
        # push runs reads none of it, so a README fix never waits on an audit.
        try {
            Save-ReleaseLedger -AgeDays 14
            $said = Invoke-IndexPushCheck $publishedRun
            Assert-True ($said -like '*the Tumblr source census is 14 day(s) old*') `
                "A release on a census 14 days old did not say so: $said"
            Save-ReleaseLedger -AgeDays 15
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } '*source census*the census is 15 days old*audit-tumblr-sources.ps1*' `
                'A release went out on a census 15 days old.'
            try {
                Invoke-ReleaseCheck | Out-Null
            } catch {
                throw "The lenient check an ordinary push runs refused a census 15 days old: $($_.Exception.Message)"
            }
            Save-ReleaseLedger -Pending
            $said = Invoke-IndexPushCheck $publishedRun
            Assert-True ($said -like '*HushTumblr is not listed on *yet and has no submission recorded there*') `
                "A release with an index that doesn't list HushTumblr didn't name it: $said"
        } finally {
            Save-ReleaseLedger
        }

        # Each way the hosted SBOM can fail it. A receipt that names the SBOM served has its hash
        # and count written in, so that what refuses the push is the case's own difference. The
        # deliberately vulnerable fixture goes out here too: the receipt for it was built offline,
        # and this is the check that asks OSV again.
        $cleanReceiptBytes = [System.IO.File]::ReadAllBytes($releaseReceipt)
        function Use-ServedSbom([string[]]$Libraries, [switch]$KeepReceipt) {
            $script:servedSbom = Join-Path $releaseRoot "served\case\patches-$releaseVersionHere.cdx.json"
            New-Item -ItemType Directory -Path (Split-Path -Parent $script:servedSbom) -Force | Out-Null
            New-TestSbom -Path $script:servedSbom -Bundle $releaseBundle -Libraries $Libraries
            if (-not $KeepReceipt) {
                $document = Get-Content -LiteralPath $releaseReceipt -Raw | ConvertFrom-Json
                $document.sbom.sha256 = Get-Sha256Hex -Path $script:servedSbom
                $document.sbom.components = @($Libraries).Count + 2
                Set-Content -LiteralPath $releaseReceipt -Encoding UTF8 -Value ($document | ConvertTo-Json -Depth 12)
            }
        }
        try {
            $servedSums = "$((Get-FileHash -LiteralPath $releaseBundle -Algorithm SHA256).Hash.ToLowerInvariant())  patches-$indexVersionHere.mpp`n"
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } "*SHA256SUMS.txt has no entry for patches-$indexVersionHere.cdx.json*" `
                'An index push went through with an SBOM SHA256SUMS does not list.'
            $servedSums += "$('1' * 64)  patches-$indexVersionHere.cdx.json`n"
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } "*SHA256SUMS.txt lists $('1' * 64) for patches-$indexVersionHere.cdx.json, but the hosted SBOM is*" `
                'An index push went through with an SBOM SHA256SUMS lists under another hash.'
            $servedSums = $null
            # Another SBOM of the same bundle: its serial number alone makes it another file.
            Use-ServedSbom @($cleanPurl) -KeepReceipt
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } "*The receipt says patches-$indexVersionHere.cdx.json hashes to*" `
                'An index push went through with a hosted SBOM the receipt does not name.'
            Use-ServedSbom @($gsonPurl)
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } '*high or critical*GHSA-4jrv-ppp4-jm57 (HIGH, CVE-2022-25647) in com.google.code.gson:gson 2.8.8*' `
                'An index push went through with a bundle carrying gson 2.8.8.'
            # The offline way through is explicit, and it says so.
            $offlineRun = $publishedRun.Clone()
            $offlineRun['SkipAdvisoryCheck'] = $true
            $said = Invoke-IndexPushCheck $offlineRun
            Assert-True ($said -like '*-SkipAdvisoryCheck: OSV was not asked about the libraries*') `
                "An index push with the advisory check skipped did not say so: $said"
            Use-ServedSbom @('pkg:maven/com.example/unknown@1.0')
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } '*could not be asked about pkg:maven/com.example/unknown@1.0*fails closed*' `
                'An index push went through without OSV answering.'
            $document = Get-Content -LiteralPath $releaseReceipt -Raw | ConvertFrom-Json
            $document.sbom.file = 'patches-9.9.8.cdx.json'
            Set-Content -LiteralPath $releaseReceipt -Encoding UTF8 -Value ($document | ConvertTo-Json -Depth 12)
            Assert-Throws { Invoke-IndexPushCheck $publishedRun } "*receipt names the SBOM patches-9.9.8.cdx.json; the one for $releaseVersionHere is patches-$releaseVersionHere.cdx.json*" `
                'An index push fetched an SBOM the receipt names under another version.'
        } finally {
            $servedSbom = $cleanServedSbom
            $servedSums = $null
            $osvAnswers = $osvRecorded
            [System.IO.File]::WriteAllBytes($releaseReceipt, $cleanReceiptBytes)
        }
        $said = Invoke-IndexPushCheck @{ SkipDescriptionTestCount = $true }
        Assert-True ($said -like "*the index asks for Morphe Manager $releaseFloor or newer, as tag v$indexVersionHere on $indexRepository pins*") `
            "A run with no bundle did not read the floor at the tag the index's repository has: $said"
        Set-Content -LiteralPath $releaseIndexPath -Encoding UTF8 -NoNewline -Value (
            $releaseIndexText -replace '(Morphe Manager )\d+(?:\.\d+)+( or newer)', '${1}1.20.0${2}')
        Assert-Throws { Invoke-IndexPushCheck @{ SkipDescriptionTestCount = $true } } '*Morphe Manager 1.20.0 or newer*' `
            'An index push from a clone without the release tag named a Manager floor the tag does not pin, and went through.'
        Set-Content -LiteralPath $releaseIndexPath -Encoding UTF8 -NoNewline -Value $releaseIndexText

        # The index push through the hook, which decides what the hosted asset is held to. A bundle
        # built here is compared with it byte for byte when there's one for the version the index
        # publishes: the only bundle, whatever its name, or among several the one named for that
        # version. With none of those the check downloads the asset and holds it to everything else
        # a local build gets. The hook runs the check the pushed tree carries, strict, so the scripts
        # are copied beside the release files and the test results the description quotes are
        # written. The CLI, its JDK and GitHub are stand-ins, and the temporary folder is the
        # fixture's own, so a download left behind shows.
        $hookTemp = Join-Path $releaseRoot 'hook-temp'
        $releaseBuilds = Split-Path -Parent $releaseBundle
        $parkedBundle = Join-Path $releaseRoot "parked\patches-$releaseVersionHere.mpp"
        $parkedSbom = [System.IO.Path]::ChangeExtension($parkedBundle, '.cdx.json')
        $otherBuilds = @('patches-9.9.8.mpp', 'patches-9.9.9.mpp' | ForEach-Object { Join-Path $releaseBuilds $_ })
        $releaseDescription = [string]($releaseIndexText | ConvertFrom-Json).description
        function Invoke-IndexPushHook {
            $saved = @{}
            foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' -or $_.Name -in @('TMP', 'TEMP',
                    'HUSHTUMBLR_DESKTOP_JAR', 'HUSHTUMBLR_JAVA', 'HUSHTUMBLR_SKIP_PRE_PUSH',
                    'HUSHTUMBLR_RELEASE_PUBLIC_KEY', 'HUSHTUMBLR_RELEASE_FINGERPRINT') })) {
                $saved[$variable.Name] = $variable.Value
                Remove-Item -LiteralPath ('Env:\' + $variable.Name) -ErrorAction SilentlyContinue
            }
            $env:TMP = $hookTemp
            $env:TEMP = $hookTemp
            $env:HUSHTUMBLR_DESKTOP_JAR = $stubJar
            $env:HUSHTUMBLR_JAVA = $listJava
            $env:HUSHTUMBLR_RELEASE_PUBLIC_KEY = $signerPublicKey
            $env:HUSHTUMBLR_RELEASE_FINGERPRINT = $signerFingerprint
            try {
                . $publishedStandIns
                . $osvStandIn
                $global:LASTEXITCODE = 0
                $said = @(& $prePushScript -Root $releaseRepo -ChangedPaths @('patches-bundle.json') 3>&1 6>&1 |
                    ForEach-Object { "$_" }) -join "`n"
                if ($LASTEXITCODE -ne 0) { throw "The index push exited $LASTEXITCODE`: $said" }
                return $said
            } finally {
                foreach ($name in @('TMP', 'TEMP', 'HUSHTUMBLR_DESKTOP_JAR', 'HUSHTUMBLR_JAVA',
                        'HUSHTUMBLR_RELEASE_PUBLIC_KEY', 'HUSHTUMBLR_RELEASE_FINGERPRINT')) {
                    Remove-Item -LiteralPath ('Env:\' + $name) -ErrorAction SilentlyContinue
                }
                foreach ($name in $saved.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $saved[$name] }
            }
        }
        # Pass or fail, the downloads are gone afterwards and build/release holds what it held.
        function Assert-LeftAlone([string]$Case, [string[]]$Builds) {
            $left = @(Get-ChildItem -LiteralPath $hookTemp -File -Recurse | Where-Object { $_.Name -like '*.mpp' -or $_.Name -like '*.cdx.json' } |
                ForEach-Object { $_.Name })
            Assert-True ($left.Count -eq 0) "The $Case left its download behind: $($left -join ', ')"
            $now = @(Get-ChildItem -LiteralPath $releaseBuilds -File | ForEach-Object { $_.Name } | Sort-Object) -join ', '
            Assert-True ($now -eq (@($Builds | Sort-Object) -join ', ')) "The $Case changed patches/build/release: $now"
        }
        Copy-Item -LiteralPath $PSScriptRoot -Destination (Join-Path $releaseRepo 'scripts') -Recurse
        # The patch count is :patches:test's folder and :patches:fixtureTest's together: one fixture
        # test, and the rest in the quick task.
        foreach ($results in @(
                @{ Folder = 'extensions/tumblr/build/test-results/testDebugUnitTest'; Suite = 'RuntimeTest'; Quote = '\b(\d+) runtime tests passed\b'; Less = 0 },
                @{ Folder = 'patches/build/test-results/test'; Suite = 'PatchTest'; Quote = '\b(\d+) patch tests passed\b'; Less = 1 },
                @{ Folder = 'patches/build/test-results/fixtureTest'; Suite = 'FixtureTest'; Quote = '\b(\d+) patch tests passed\b'; Only = 1 })) {
            $quoted = [regex]::Match($releaseDescription, $results.Quote).Groups[1].Value
            Assert-True ($quoted -match '^[1-9]\d*$' -and [int]$quoted -gt 1) "The copied description quotes no $($results.Suite) count: $releaseDescription"
            $resultCount = if ($results.Only) { $results.Only } else { [int]$quoted - $results.Less }
            $directory = Join-Path $releaseRepo $results.Folder
            New-Item -ItemType Directory -Path $directory -Force | Out-Null
            $cases = (1..$resultCount | ForEach-Object { "<testcase name=`"t$_`" classname=`"fixture.$($results.Suite)`"/>" }) -join ''
            Set-Content -LiteralPath (Join-Path $directory "TEST-fixture.$($results.Suite).xml") -Encoding UTF8 -Value (
                "<?xml version=`"1.0`" encoding=`"UTF-8`"?><testsuite name=`"fixture.$($results.Suite)`" tests=`"$resultCount`" " +
                "skipped=`"0`" failures=`"0`" errors=`"0`">$cases</testsuite>")
        }
        New-Item -ItemType Directory -Path $hookTemp, (Split-Path -Parent $parkedBundle) -Force | Out-Null
        try {
            # No bundle built here, nor the SBOM beside it. The hosted one passes every check a local
            # build gets, and the check says the byte-for-byte comparison had nothing to compare with.
            Move-Item -LiteralPath $releaseBundle -Destination $parkedBundle
            Move-Item -LiteralPath $releaseSbom -Destination $parkedSbom
            $servedBundle = $parkedBundle
            $said = Invoke-IndexPushHook
            foreach ($line in @('no local bundle here, so the hosted asset is downloaded and checked on its own',
                    "no bundle built here is compared with the hosted patches-$indexVersionHere.mpp byte for byte",
                    "published bundle is pinned to v$indexVersionHere ($releaseCommit)",
                    'the published bundle carries classes.dex',
                    "the published bundle carries $($releaseNames.Count) patches, as described",
                    "the bundle stamps patcher $($releaseToolchain.PatcherVersion), as the catalog pins",
                    "the receipt proves $($releaseNames.Count) patches on",
                    "the hosted patches-$indexVersionHere.cdx.json is the SBOM the receipt names",
                    "OSV has no advisory for the libraries patches-$indexVersionHere.cdx.json lists")) {
                Assert-True ($said -like "*$line*") "An index push with no bundle built here left the hosted one unchecked ($line): $said"
            }
            Assert-LeftAlone 'hosted check' @()
            # And a hosted file SHA256SUMS doesn't list, or one without the classes.dex Manager
            # loads, is refused, with nothing left behind.
            $servedSums = "$('0' * 64)  patches-$indexVersionHere.mpp`n"
            Assert-Throws { Invoke-IndexPushHook } "*SHA256SUMS.txt lists $('0' * 64) for patches-$indexVersionHere.mpp*" `
                'An index push went through with a hosted bundle SHA256SUMS does not list.'
            Assert-LeftAlone 'refused hosted check' @()
            $servedSums = $null
            $servedBundle = Join-Path $releaseRoot "dexless\patches-$releaseVersionHere.mpp"
            New-Item -ItemType Directory -Path (Split-Path -Parent $servedBundle) -Force | Out-Null
            New-TestBundleArchive -Path $servedBundle -Entries ([ordered]@{
                'META-INF/MANIFEST.MF' = ("Manifest-Version: 1.0`nVersion: $releaseVersionHere`nTimestamp: $($releaseSeconds * 1000)`n" +
                    "Patcher-Version: $($releaseToolchain.PatcherVersion)`n`n")
                'extensions/tumblr.mpe' = "dex`n035" + ('payload' * 8) })
            Assert-Throws { Invoke-IndexPushHook } '*The published bundle has no classes.dex*' `
                'An index push went through with a hosted bundle Manager would load no patches from.'
            Assert-LeftAlone 'refused hosted check' @()

            # Several bundles. The one named for the index version is compared byte for byte, and
            # the other is left alone; with neither named for it, the hosted one is checked on its own.
            Move-Item -LiteralPath $parkedBundle -Destination $releaseBundle
            Move-Item -LiteralPath $parkedSbom -Destination $releaseSbom
            $servedBundle = $releaseBundle
            New-TestBundleArchive -Path $otherBuilds[0] -Entries ([ordered]@{ 'META-INF/MANIFEST.MF' = "Manifest-Version: 1.0`nVersion: 9.9.8`n`n" })
            $said = Invoke-IndexPushHook
            Assert-True ($said -like "*found 2 bundles, so the hosted asset is compared with patches-$indexVersionHere.mpp, built here*" -and
                $said -like "*the hosted patches-$indexVersionHere.mpp matches the bundle built here byte for byte*" -and
                $said -like "*the receipt proves $($releaseNames.Count) patches on*") `
                "An index push with several bundles did not compare the hosted one with the bundle for its version: $said"
            Assert-LeftAlone 'comparison with the bundle built here' @("patches-$releaseVersionHere.mpp", "patches-$releaseVersionHere.cdx.json",
                'patches-9.9.8.mpp')
            Move-Item -LiteralPath $releaseBundle -Destination $parkedBundle
            Move-Item -LiteralPath $releaseSbom -Destination $parkedSbom
            $servedBundle = $parkedBundle
            New-TestBundleArchive -Path $otherBuilds[1] -Entries ([ordered]@{ 'META-INF/MANIFEST.MF' = "Manifest-Version: 1.0`nVersion: 9.9.9`n`n" })
            $said = Invoke-IndexPushHook
            Assert-True ($said -like "*found 2 bundles and none is patches-$indexVersionHere.mpp, so the hosted asset is downloaded and checked on its own*" -and
                $said -like "*no bundle built here is compared with the hosted patches-$indexVersionHere.mpp byte for byte*" -and
                $said -like "*the receipt proves $($releaseNames.Count) patches on*") `
                "An index push with several bundles, none for its version, left the hosted one unchecked: $said"
            Assert-LeftAlone 'hosted check' @('patches-9.9.8.mpp', 'patches-9.9.9.mpp')
        } finally {
            $servedBundle = $releaseBundle
            $servedSums = $null
            Remove-Item -LiteralPath $otherBuilds -Force -ErrorAction SilentlyContinue
            if (-not (Test-Path -LiteralPath $releaseBundle) -and (Test-Path -LiteralPath $parkedBundle)) {
                Move-Item -LiteralPath $parkedBundle -Destination $releaseBundle
            }
            if (-not (Test-Path -LiteralPath $releaseSbom) -and (Test-Path -LiteralPath $parkedSbom)) {
                Move-Item -LiteralPath $parkedSbom -Destination $releaseSbom
            }
            foreach ($folder in @('scripts', 'extensions', 'patches/build/test-results')) {
                Remove-Item -LiteralPath (Join-Path $releaseRepo $folder) -Recurse -Force -ErrorAction SilentlyContinue
            }
        }

        # A release re-cut on GitHub onto another commit, here one with no catalog, while the clone
        # keeps its tag on the first: the floor is read where the published tag points, and a
        # published asset run refuses a floor it can't read rather than noting it.
        Invoke-FixtureGit -Root $releaseRepo -Arguments @('rm', '--cached', '--quiet', '--', 'gradle/libs.versions.toml') | Out-Null
        $recutTree = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('write-tree') | Select-Object -First 1)".Trim()
        Invoke-FixtureGit -Root $releaseRepo -Arguments @('reset', '--quiet') | Out-Null
        $recut = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('commit-tree', $recutTree, '-p', $releaseCommit,
            '-m', 're-cut') | Select-Object -First 1)".Trim()
        $recutSeconds = [long]"$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('log', '-1', '--format=%ct', $recut) |
            Select-Object -First 1)".Trim()
        $servedBundle = Join-Path $releaseRoot "recut\patches-$releaseVersionHere.mpp"
        New-Item -ItemType Directory -Path (Split-Path -Parent $servedBundle) -Force | Out-Null
        New-TestBundleArchive -Path $servedBundle -Entries ([ordered]@{
            'META-INF/MANIFEST.MF' = ("Manifest-Version: 1.0`nVersion: $releaseVersionHere`nTimestamp: $($recutSeconds * 1000)`n" +
                "Patcher-Version: $($releaseToolchain.PatcherVersion)`n`n")
            'classes.dex' = "dex`n035" + ('patches' * 8)
            'extensions/tumblr.mpe' = "dex`n035" + ('payload' * 8) })
        Invoke-FixtureGit -Root $releaseRepo -Arguments @('push', '--quiet', '--force', $publishedRepo,
            "${recut}:refs/tags/v$indexVersionHere") | Out-Null
        Invoke-FixtureGit -Root $releaseRepo -Arguments @('tag', "v$indexVersionHere", $releaseCommit) | Out-Null
        $recutRun = $publishedRun.Clone()
        $recutRun['ArtifactPath'] = $servedBundle
        Assert-Throws { Invoke-IndexPushCheck $recutRun } `
            "*published release's Manager floor couldn't be read*tag v$indexVersionHere has no version catalog*" `
            'An index push was checked against the clone''s tag, or went through with its release floor unread.'
    } finally {
        Set-Content -LiteralPath $releaseIndexPath -Encoding UTF8 -NoNewline -Value $releaseIndexText
        [System.IO.File]::WriteAllBytes($releaseReadmePath, $releaseReadmeCommitted)
        Invoke-FixtureGit -Root $releaseRepo -Arguments @('tag', '--force', "v$indexVersionHere", $releaseCommit) | Out-Null
        Invoke-FixtureGit -Root $releaseRepo -Arguments @('config', '--unset', "url.$publishedRepo.insteadOf") | Out-Null
    }

    # A release cut before the receipt named an SBOM, which is where the checkout that cut 0.1.1
    # stands until the next release: its commit's receipt script writes schema 1, and its receipt
    # names no SBOM. An ordinary push holds that receipt to schema 1 and says so, and a schema 2
    # receipt for the same commit is refused. The commit sits beside the branch, made with
    # commit-tree, so nothing after this sees it.
    $schemaOneScript = Join-Path $releaseRoot 'schema-one-release-receipt.ps1'
    Set-Content -LiteralPath $schemaOneScript -Encoding ASCII -Value @('function Get-ReleaseReceiptSchemaVersion {', '    <#',
        '    .SYNOPSIS', '        Bumped when the shape changes.', '    #>', '    return 1', '}')
    $schemaOneBlob = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('hash-object', '-w', $schemaOneScript) | Select-Object -First 1)".Trim()
    # Historical schemas used only the legacy exported-alias declaration. Their synthetic
    # commits must retain that allowlist instead of inheriting schema 4's structured templates.
    $legacyAllowlistPath = Join-Path $releaseRoot 'legacy-manifest-allowlist.txt'
    [System.IO.File]::WriteAllLines($legacyAllowlistPath, $checkedInAllowlist, [System.Text.Encoding]::ASCII)
    $legacyAllowlistBlob = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('hash-object', '-w', $legacyAllowlistPath) | Select-Object -First 1)".Trim()
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('update-index', '--add', '--cacheinfo',
        "100644,$schemaOneBlob,scripts/release-receipt.ps1") | Out-Null
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('update-index', '--add', '--cacheinfo',
        "100644,$legacyAllowlistBlob,scripts/manifest-delta-allowlist.txt") | Out-Null
    $schemaOneTree = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('write-tree') | Select-Object -First 1)".Trim()
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('reset', '--quiet') | Out-Null
    $schemaOneCommit = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('commit-tree', $schemaOneTree, '-p', $releaseCommit,
        '-m', 'cut before the SBOM') | Select-Object -First 1)".Trim()
    $schemaOneSeconds = [long]"$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('log', '-1', '--format=%ct', $schemaOneCommit) |
        Select-Object -First 1)".Trim()
    $receiptBytes = [System.IO.File]::ReadAllBytes($releaseReceipt)
    try {
        Save-ReleaseReceipt -Builds $releaseTarget.PackageVersions -Commit $schemaOneCommit -Seconds $schemaOneSeconds -Schema 1
        $said = Invoke-ReleaseCheck
        Assert-True ($said -like "*the receipt is held to schema 1, which its own commit $($schemaOneCommit.Substring(0, 8)) wrote*" -and
            $said -like "*the receipt proves $($releaseNames.Count) patches on*from commit $($schemaOneCommit.Substring(0, 8))*") `
            "A receipt cut before the SBOM was not read as its own commit wrote it: $said"
        Save-ReleaseReceipt -Builds $releaseTarget.PackageVersions -Commit $schemaOneCommit -Seconds $schemaOneSeconds -Schema 2
        Assert-Throws { Invoke-ReleaseCheck } '*schema version 2; its release is read at version 1*' `
            'A schema 2 receipt was accepted for a commit whose builder wrote schema 1.'
    } finally {
        [System.IO.File]::WriteAllBytes($releaseReceipt, $receiptBytes)
    }

    # v0.0.4 shipped schema 2. Its receipt still proves the SBOM at its own commit, and lacks the
    # binary SDK facts introduced since. A new schema 3 receipt cannot pose as that old release.
    $schemaTwoScript = Join-Path $releaseRoot 'schema-two-release-receipt.ps1'
    [System.IO.File]::WriteAllText($schemaTwoScript,
        [System.IO.File]::ReadAllText($schemaOneScript).Replace('return 1', 'return 2'), [System.Text.Encoding]::ASCII)
    $schemaTwoBlob = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('hash-object', '-w', $schemaTwoScript) | Select-Object -First 1)".Trim()
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('update-index', '--add', '--cacheinfo',
        "100644,$schemaTwoBlob,scripts/release-receipt.ps1") | Out-Null
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('update-index', '--add', '--cacheinfo',
        "100644,$legacyAllowlistBlob,scripts/manifest-delta-allowlist.txt") | Out-Null
    $schemaTwoTree = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('write-tree') | Select-Object -First 1)".Trim()
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('reset', '--quiet') | Out-Null
    $schemaTwoCommit = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('commit-tree', $schemaTwoTree, '-p', $releaseCommit,
        '-m', 'cut before binary SDK facts') | Select-Object -First 1)".Trim()
    $schemaTwoSeconds = [long]"$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('log', '-1', '--format=%ct', $schemaTwoCommit) |
        Select-Object -First 1)".Trim()
    try {
        Save-ReleaseReceipt -Builds $releaseTarget.PackageVersions -Commit $schemaTwoCommit -Seconds $schemaTwoSeconds -Schema 2
        $said = Invoke-ReleaseCheck
        Assert-True ($said -like "*the receipt is held to schema 2, which its own commit $($schemaTwoCommit.Substring(0, 8)) wrote*" -and
                $said -like '*it names no binary SDK or compiled declaration facts*' -and
                $said -like "*the receipt proves $($releaseNames.Count) patches on*from commit $($schemaTwoCommit.Substring(0, 8))*") `
            "A shipped receipt with no binary SDK facts was not read at its own schema: $said"
        Save-ReleaseReceipt -Builds $releaseTarget.PackageVersions -Commit $schemaTwoCommit -Seconds $schemaTwoSeconds -Schema 3
        Assert-Throws { Invoke-ReleaseCheck } '*schema version 3; its release is read at version 2*' `
            'A schema 3 receipt was accepted for a commit whose builder wrote schema 2.'
    } finally {
        [System.IO.File]::WriteAllBytes($releaseReceipt, $receiptBytes)
    }

    # A lag window: the source has moved on to the next version and pins the next Manager floor,
    # the clone already has that version's tag, and the index still describes the release before
    # it. The description is held to the floor the index version's tag pins, not the source
    # version's; the two tags pin different floors here, so reading the wrong one refuses the tree.
    # Then the same window in a clone without the index version's tag, which says the floor
    # wasn't checked.
    function Edit-ReleaseFile([string]$Name, [scriptblock]$Edit) {
        $path = Join-Path $releaseRepo $Name
        $text = [System.IO.File]::ReadAllText($path)
        $edited = & $Edit $text
        if ($edited -ceq $text) { throw "The lag window left $Name as it was, so the case below would prove nothing." }
        [System.IO.File]::WriteAllText($path, $edited, (New-Object System.Text.UTF8Encoding($false)))
    }
    $releasedAs = [version]$releaseVersionHere
    $laterVersion = "$($releasedAs.Major).$($releasedAs.Minor).$($releasedAs.Build + 1)"
    $releasedFloor = [version]$releaseFloor
    $laterFloor = "$($releasedFloor.Major).$($releasedFloor.Minor + 1).0"
    Edit-ReleaseFile 'gradle.properties' { param($text) $text -replace '(?m)^(\s*version\s*=\s*)\S+', "`${1}$laterVersion" }
    Edit-ReleaseFile 'patches-list.json' { param($text) $text.Replace('"v' + $releaseVersionHere + '"', '"v' + $laterVersion + '"') }
    Edit-ReleaseFile 'CHANGELOG.md' {
        param($text) ([regex]'(?m)^## ').Replace($text,
            "## $laterVersion (2026-09-26)`n`n* **Tumblr:** Needs Morphe Manager $laterFloor or newer.`n`n## ", 1)
    }
    Edit-ReleaseFile 'gradle/libs.versions.toml' {
        param($text) $text -replace '(?m)^(\s*manager-floor\s*=\s*")[^"]+', "`${1}$laterFloor"
    }
    Edit-ReleaseFile 'README.md' { param($text) $text.Replace($releaseFloor, $laterFloor) }
    Edit-ReleaseFile '.github/ISSUE_TEMPLATE/bug_report.yml' {
        param($text) $text.Replace("Morphe Manager $releaseFloor", "Morphe Manager $laterFloor")
    }
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('add', '--', 'gradle.properties', 'patches-list.json', 'CHANGELOG.md',
        'gradle/libs.versions.toml', 'README.md', '.github/ISSUE_TEMPLATE/bug_report.yml') | Out-Null
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('commit', '-m', 'next release', '--quiet') | Out-Null
    $laterCommit = "$(Invoke-FixtureGit -Root $releaseRepo -Arguments @('rev-parse', 'HEAD') | Select-Object -First 1)".Trim()
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('tag', "v$laterVersion", $laterCommit) | Out-Null
    $said = Invoke-ReleaseCheck
    Assert-True ($said -like "*source $laterVersion is being prepared while the working index remains on $indexVersionHere*" -and
        $said -like "*the index asks for Morphe Manager $releaseFloor or newer, as tag v$indexVersionHere pins*") `
        "In a lag window the index was not held to the floor its own version's tag pins: $said"
    Invoke-FixtureGit -Root $releaseRepo -Arguments @('tag', '-d', "v$indexVersionHere") | Out-Null
    $said = Invoke-ReleaseCheck
    Assert-True ($said -like "*tag v$indexVersionHere isn't in this clone, so the Manager floor the index names wasn't checked*") `
        "A lag window without the index version's tag did not say the floor went unchecked: $said"
} finally {
    $env:BUILD_QUEUE_SCRIPT = $savedQueueScript
    $env:BUILD_QUEUE_PRIORITY = $savedQueuePriority
    $env:HUSHTUMBLR_APPLY_RECORDS = $savedApplyRecords
    if ($signerHome -and (Test-Path -LiteralPath $signerHome)) {
        Invoke-ReleaseChecksumGpg 'gpgconf' @('--homedir', $signerHome, '--kill', 'gpg-agent') | Out-Null
    }
    Remove-Item -LiteralPath $releaseRoot -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host '[scripts] release root contracts passed'

# --- release bundle path ---------------------------------------------------------------------
#
# Every release step reads the bundle from patches/build/release. The plugin's buildAndroid
# finishes the bundle inside the jar task's own output, so a task run after it that reruns
# :patches:jar put the plain jar back under the same name in build/libs: v0.43.0 shipped with no
# classes.dex that way. buildAndroid copies the finished bundle to build/release, where nothing
# else writes, and the Gradle file and this helper have to agree on that directory.

$bundlePathRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtumblr-bundle-path-" + [guid]::NewGuid().ToString('N'))
try {
    New-Item -ItemType Directory -Path $bundlePathRoot -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $bundlePathRoot 'gradle.properties') -Value 'version = 9.9.9' -Encoding ASCII
    $expectedRelease = Join-Path $bundlePathRoot 'patches/build/release/patches-9.9.9.mpp'
    Assert-True ((Get-ReleaseBundlePath -Root $bundlePathRoot) -eq $expectedRelease) `
        'The release bundle path did not follow gradle.properties into patches/build/release.'
    Assert-True ((Get-ReleaseBundlePath -Root $bundlePathRoot -Version '1.2.3') -eq
        (Join-Path $bundlePathRoot 'patches/build/release/patches-1.2.3.mpp')) `
        'An explicit version was not used for the release bundle path.'
} finally {
    Remove-Item -LiteralPath $bundlePathRoot -Recurse -Force -ErrorAction SilentlyContinue
}

$gradleFile = Get-Content -LiteralPath (Join-Path $Root 'patches/build.gradle.kts') -Raw
Assert-True ($gradleFile -match 'buildDirectory\.dir\("release"\)' -and
    $gradleFile -match 'buildDirectory\.file\("release/\$releaseBundleName"\)' -and
    $gradleFile -match 'buildDirectory\.file\("release/bundle\.sha256"\)') `
    'patches/build.gradle.kts no longer writes and verifies the bundle in build/release, where the scripts read it.'
# The receipt builder looks for the SBOM beside the bundle, under the bundle's name with .cdx.json
# for its extension, and the release check fetches it from the release under that name.
Assert-True ($gradleFile -match 'val releaseBundleName = "patches-\$\{project\.version\}\.mpp"' -and
    $gradleFile -match 'val releaseSbomName = "patches-\$\{project\.version\}\.cdx\.json"' -and
    $gradleFile -match 'output\.set\(layout\.buildDirectory\.file\("release/\$releaseSbomName"\)\)' -and
    $gradleFile -match 'finalizedBy\(releaseSbom\)') `
    'patches/build.gradle.kts no longer writes the SBOM beside the bundle in build/release after each buildAndroid.'
# The stamp names a commit only when the tree is that commit. A tree with uncommitted changes is
# stamped 0, which the receipt refuses; stamped with HEAD's time, it passed for a clean build.
# Asked before the commit time is read, and git status is asked with no optional locks.
Assert-True ($gradleFile -match 'commandLine\("git", "--no-optional-locks", "status", "--porcelain"\)' -and
    $gradleFile -match '(?s)val sourceDateEpoch: Long = run \{.*?if \(uncommittedChanges\?\.isEmpty\(\) != true\) return@run 0L.*?"log", "-1", "--format=%ct"') `
    'patches/build.gradle.kts stamps the bundle with the commit time without asking git whether the tree has uncommitted changes.'
# :patches:test leaves the vendor APKs to :patches:fixtureTest. Both tasks name the one category,
# the quick task refuses a fixture read, and every test source that opens a fixture carries it.
Assert-True ($gradleFile -match 'val fixtureCategory = "app\.morphe\.FixtureTests"' -and
    $gradleFile -match 'excludeCategories\(fixtureCategory\)' -and
    $gradleFile -match 'systemProperty\("hushtumblr\.fixtures", "refuse"\)' -and
    $gradleFile -match '(?s)register<Test>\("fixtureTest"\).*?includeCategories\(fixtureCategory\).*?maxParallelForks = 1') `
    'patches/build.gradle.kts no longer splits the fixture tests into :patches:fixtureTest.'
$fixturesSource = [IO.File]::ReadAllText((Join-Path $Root 'patches/src/test/kotlin/app/morphe/Fixtures.kt'))
Assert-True ($fixturesSource -match '(?m)^interface FixtureTests\b' -and
    $fixturesSource -match 'const val TASK_PROPERTY = "hushtumblr\.fixtures"') `
    'Fixtures.kt no longer declares the FixtureTests category or the property :patches:test refuses fixtures by.'
$uncategorized = @(Get-ChildItem -LiteralPath (Join-Path $Root 'patches/src/test/kotlin') -Recurse -Filter '*.kt' -File |
    Where-Object { $_.Name -notin @('Fixtures.kt', 'FixtureDex.kt') } |
    Where-Object {
        $text = [IO.File]::ReadAllText($_.FullName)
        $text -match '\bFixtures\.\w+\s*[({]' -and $text -notmatch '@Category\(FixtureTests::class\)'
    } | ForEach-Object { $_.Name })
Assert-True ($uncategorized.Count -eq 0) `
    "Test sources open the vendor APKs without the FixtureTests category: $($uncategorized -join ', ')"

# Code only: a comment may say where the bundle used to be read from.
$libsReaders = New-Object System.Collections.Generic.List[string]
foreach ($script in @(Get-ChildItem -LiteralPath $PSScriptRoot -Filter '*.ps1' -File)) {
    if ($script.Name -eq 'test-script-contracts.ps1') { continue }
    $inBlockComment = $false
    $number = 0
    foreach ($line in @(Get-Content -LiteralPath $script.FullName)) {
        $number++
        $trimmed = $line.Trim()
        if ($inBlockComment) {
            if ($trimmed -like '*#>*') { $inBlockComment = $false }
            continue
        }
        if ($trimmed.StartsWith('<#')) {
            if ($trimmed -notlike '*#>*') { $inBlockComment = $true }
            continue
        }
        if ($trimmed.StartsWith('#')) { continue }
        if ($trimmed -match 'build[\\/]+libs') { $libsReaders.Add("$($script.Name):$number") }
    }
}
Assert-True ($libsReaders.Count -eq 0) `
    ("These script lines read patches/build/libs, which :patches:jar rewrites with the plain jar: " +
        ($libsReaders -join ', '))

Write-Host '[scripts] release bundle path contracts passed'

# Every tracked PowerShell file parses. The release stages, the device helpers and the receipt run
# only on a release or with a phone, so a syntax slip in one of them would otherwise first show
# there. Read as UTF-8 (Get-ScriptAst), so both editions parse the same text.
$unparsed = New-Object System.Collections.Generic.List[string]
$trackedScripts = @(& git -C $Root ls-files -- '*.ps1')
Assert-True ($LASTEXITCODE -eq 0 -and $trackedScripts.Count -gt 0) 'git could not list the tracked PowerShell files.'
foreach ($tracked in $trackedScripts) {
    try { [void](Get-ScriptAst -Path (Join-Path $Root $tracked)) } catch { $unparsed.Add($_.Exception.Message) }
}
Assert-True ($unparsed.Count -eq 0) ("These tracked scripts don't parse: " + ($unparsed -join '; '))
Write-Host "[scripts] all $($trackedScripts.Count) tracked PowerShell files parse"

# --- release stages refuse to run out of order ------------------------------------------------
#
# scripts/release/release.ps1 runs one stage a call, and each reads what the stage before it left
# before it does anything. Each case runs a stage on a scratch repository in a shell of its own, so
# what the stage puts in its environment stays there. No case reaches the network, Gradle, Python
# or a key: every refusal here comes before the first of them.
$stageRoot = Join-Path ([System.IO.Path]::GetTempPath()) ('hushtumblr-stages-' + [guid]::NewGuid().ToString('N'))
$stageOrigin = Join-Path ([System.IO.Path]::GetTempPath()) ('hushtumblr-stages-origin-' + [guid]::NewGuid().ToString('N'))
$stageRunner = Join-Path ([System.IO.Path]::GetTempPath()) ('hushtumblr-stage-runner-' + [guid]::NewGuid().ToString('N') + '.ps1')
$factsRunner = Join-Path ([System.IO.Path]::GetTempPath()) ('hushtumblr-facts-runner-' + [guid]::NewGuid().ToString('N') + '.ps1')
$factsRoot = Join-Path ([System.IO.Path]::GetTempPath()) ('hushtumblr-facts-' + [guid]::NewGuid().ToString('N'))
$factsOrigin = Join-Path ([System.IO.Path]::GetTempPath()) ('hushtumblr-facts-origin-' + [guid]::NewGuid().ToString('N'))
$stageShell = (Get-Process -Id $PID).Path
$stageUtf8 = New-Object System.Text.UTF8Encoding $false
function Invoke-ReleaseStageCase {
    param([string]$Stage, [string]$Version = '0.0.7', [switch]$Signing)
    $ErrorActionPreference = 'Continue'
    # @(...) around the if: an if hands back its one item, and splatting a lone string passes its characters.
    $extra = @(if ($Signing) { '-Signing' })
    $lines = @(& $stageShell -NoProfile -ExecutionPolicy Bypass -File $stageRunner -Script (Join-Path $PSScriptRoot 'release/release.ps1') `
        -Root $stageRoot -Stage $Stage -Version $Version @extra 2>&1 | ForEach-Object { "$_" })
    return [pscustomobject]@{ Code = $LASTEXITCODE; Text = ($lines -join "`n") }
}
function Set-StageFile([string]$Name, [string]$Text) {
    $path = Join-Path $stageRoot $Name
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $path) | Out-Null
    [System.IO.File]::WriteAllText($path, $Text, $stageUtf8)
}
function Invoke-StageGit([string[]]$Arguments) {
    $ErrorActionPreference = 'Continue'
    & git -C $stageRoot @Arguments 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "git $($Arguments -join ' ') failed in the stage scratch repository." }
}
function Assert-StageRefused($Result, [string]$Pattern, [string]$Message) {
    Assert-True ($Result.Code -ne 0 -and $Result.Text -like "*REFUSED: *$Pattern*") "$Message It said: $($Result.Text)"
}
try {
    [System.IO.File]::WriteAllText($stageRunner, @'
param([string]$Script, [string]$Root, [string]$Stage, [string]$Version, [switch]$Signing)
$forward = @{ Root = $Root; Stage = $Stage; Version = $Version }
if ($Signing) {
    $key = Join-Path $Root 'build/pinned-key.asc'
    $forward['SigningFingerprint'] = 'A' * 40
    $forward['TrustedPublicKeyPath'] = $key
}
try { & $Script @forward; exit 0 } catch { Write-Output ('REFUSED: ' + $_.Exception.Message); exit 1 }
'@, $stageUtf8)
    New-Item -ItemType Directory -Path $stageRoot | Out-Null
    Invoke-StageGit @('init', '--quiet')
    Invoke-StageGit @('symbolic-ref', 'HEAD', 'refs/heads/main')
    Invoke-StageGit @('config', 'user.name', 'Release stage contract')
    Invoke-StageGit @('config', 'user.email', 'stages@example.invalid')
    Invoke-StageGit @('config', 'commit.gpgsign', 'false')
    Set-StageFile '.gitignore' "build/`n"
    Set-StageFile 'gradle.properties' "version = 0.0.6`n"
    Invoke-StageGit @('add', '--all')
    Invoke-StageGit @('commit', '--quiet', '-m', 'chore: the last release')
    # origin is a bare repository beside it, so asking it for tags needs no network.
    & git init --quiet --bare $stageOrigin 2>&1 | Out-Null
    Invoke-StageGit @('remote', 'add', 'origin', $stageOrigin)

    Set-StageFile 'stray.txt' "left over`n"
    Assert-StageRefused (Invoke-ReleaseStageCase prepare) 'clean checkout*stray.txt' 'prepare ran on a tree with changes.'
    Remove-Item -LiteralPath (Join-Path $stageRoot 'stray.txt')

    # Before the first release (no patches-bundle.json, no v* tag here or on origin) prepare takes
    # the version gradle.properties already holds. A Python that isn't there stops it at the first
    # step past the version and tag checks, so the case reaches no Python and no Gradle.
    $pythonBefore = $env:HUSHTUMBLR_PYTHON
    $env:HUSHTUMBLR_PYTHON = Join-Path $stageRoot 'no-python-here.exe'
    try {
        $first = Invoke-ReleaseStageCase prepare -Version 0.0.6
    } finally {
        $env:HUSHTUMBLR_PYTHON = $pythonBefore
    }
    Assert-StageRefused $first 'HUSHTUMBLR_PYTHON names*which is not there' `
        "The first release's prepare stopped before the step after its version checks."
    Assert-True ($first.Text -like '*already says 0.0.6 and nothing has been released yet*keeps the version*' -and
        $first.Text -notlike "*isn't its prepare commit*") "The first release's prepare refused the version it starts at: $($first.Text)"

    # Once a release exists the same version is refused again: a tag only on origin, as in a
    # clone that never fetched its tags, then a tag here.
    Invoke-StageGit @('tag', 'v0.0.6')
    Invoke-StageGit @('push', '--quiet', 'origin', 'refs/tags/v0.0.6')
    Invoke-StageGit @('tag', '-d', 'v0.0.6')
    Assert-StageRefused (Invoke-ReleaseStageCase prepare -Version 0.0.6) "already says 0.0.6, but HEAD*isn't its prepare commit" `
        'prepare took the version gradle.properties holds while origin had a release tag.'
    Invoke-StageGit @('tag', 'v0.0.6')
    Assert-StageRefused (Invoke-ReleaseStageCase prepare -Version 0.0.6) "already says 0.0.6, but HEAD*isn't its prepare commit" `
        'prepare took a version gradle.properties already holds.'
    Assert-StageRefused (Invoke-ReleaseStageCase prepare -Version 0.0.5) "0.0.5 isn't newer than 0.0.6" 'prepare went back a version.'
    foreach ($stage in 'preflight', 'gate', 'build') {
        Assert-StageRefused (Invoke-ReleaseStageCase $stage) 'Run -Stage prepare first.' "$stage ran before the release was prepared."
    }
    Assert-StageRefused (Invoke-ReleaseStageCase publish) 'Run release.ps1 -Stage prepare, preflight, gate and build first.' `
        'publish ran before the release was prepared.'

    # A commit that only borrows the subject, leaving gradle.properties behind, isn't a prepare commit.
    Invoke-StageGit @('commit', '--quiet', '--allow-empty', '-m', 'release: prepare 0.0.7')
    Assert-StageRefused (Invoke-ReleaseStageCase preflight) 'Run -Stage prepare first.' 'A commit named like a prepare commit passed for one.'
    Invoke-StageGit @('reset', '--quiet', '--hard', 'HEAD~1')

    Set-StageFile 'gradle.properties' "version = 0.0.7`n"
    Invoke-StageGit @('commit', '--quiet', '--all', '-m', 'release: prepare 0.0.7')
    $prepared = (& git -C $stageRoot rev-parse HEAD).Trim()
    $again = Invoke-ReleaseStageCase prepare
    Assert-True ($again.Code -eq 0 -and $again.Text -like "*0.0.7 is already prepared at $prepared*") `
        "prepare didn't say a prepared release was prepared already: $($again.Text)"
    Assert-StageRefused (Invoke-ReleaseStageCase gate) "The preflight hasn't passed for $prepared. Run -Stage preflight first." `
        'gate ran before the preflight passed.'
    Assert-StageRefused (Invoke-ReleaseStageCase build) "$prepared hasn't gone out through the release gate. Run -Stage gate first." `
        'build ran before the release gate.'
    # A stage marker counts only for the commit it names.
    Set-StageFile 'build/release-stages/0.0.7/gate.json' ('{"stage":"gate","version":"0.0.7","commit":"' + ('0' * 40) + '"}')
    Assert-StageRefused (Invoke-ReleaseStageCase build) 'Run -Stage gate first.' "build took another commit's gate marker."
    Set-StageFile 'build/release-stages/0.0.7/preflight.json' ('{"stage":"preflight","version":"0.0.7","commit":"' + $prepared + '","finishedAt":"2026-10-10T00:00:00Z","minutes":4.2}')
    $again = Invoke-ReleaseStageCase preflight
    Assert-True ($again.Code -eq 0 -and $again.Text -like "*preflight already passed for $prepared*4.2 min*") `
        "preflight ran again for a commit it had passed: $($again.Text)"
    Set-StageFile 'build/pinned-key.asc' "not a key`n"
    Assert-StageRefused (Invoke-ReleaseStageCase publish -Signing) "there is no patches-0.0.7.mpp*Run release.ps1 -Stage build first." `
        'publish ran with no built assets.'

    # The release facts check that prepare and preflight run is skipped only before the first
    # release. A checkout of its own, whose validate-release-facts.ps1 only says it ran, and the
    # two functions called in a shell of their own, as the stages call them.
    [System.IO.File]::WriteAllText($factsRunner, @'
param([string]$Common, [string]$Root, [string]$Call, [string]$Except)
. $Common
try {
    if ($Call -eq 'first') { Write-Output ('FIRST: ' + (Test-FirstRelease -Root $Root -Except $Except)) } else { Invoke-ReleaseFactsPrecheck -Root $Root }
    exit 0
} catch { Write-Output ('REFUSED: ' + $_.Exception.Message); exit 1 }
'@, $stageUtf8)
    function Invoke-FactsCase([string]$Call, [string]$Except) {
        $ErrorActionPreference = 'Continue'
        $extra = @(if ($Except) { '-Except', $Except })
        $lines = @(& $stageShell -NoProfile -ExecutionPolicy Bypass -File $factsRunner -Common (Join-Path $PSScriptRoot 'release/release-common.ps1') `
            -Root $factsRoot -Call $Call @extra 2>&1 | ForEach-Object { "$_" })
        return [pscustomobject]@{ Code = $LASTEXITCODE; Text = ($lines -join "`n") }
    }
    function Invoke-FactsGit([string[]]$Arguments) {
        $ErrorActionPreference = 'Continue'
        & git -C $factsRoot @Arguments 2>&1 | Out-Null
        if ($LASTEXITCODE -ne 0) { throw "git $($Arguments -join ' ') failed in the facts scratch repository." }
    }
    function Assert-FactsRan($Result, [bool]$Ran, [string]$Message) {
        $skipped = $Result.Text -like '*release facts check is skipped: nothing has been released yet*'
        $didRun = $Result.Text -like '*FACTS RAN*'
        Assert-True ($Result.Code -eq 0 -and $didRun -eq $Ran -and $skipped -ne $Ran) "$Message It said: $($Result.Text)"
    }
    New-Item -ItemType Directory -Path (Join-Path $factsRoot 'scripts') -Force | Out-Null
    [System.IO.File]::WriteAllText((Join-Path $factsRoot 'scripts/validate-release-facts.ps1'), "Write-Host 'FACTS RAN'`nexit 0`n", $stageUtf8)
    [System.IO.File]::WriteAllText((Join-Path $factsRoot 'gradle.properties'), "version = 0.0.1`n", $stageUtf8)
    Invoke-FactsGit @('init', '--quiet')
    Invoke-FactsGit @('config', 'user.name', 'Release facts contract')
    Invoke-FactsGit @('config', 'user.email', 'facts@example.invalid')
    Invoke-FactsGit @('config', 'commit.gpgsign', 'false')
    Invoke-FactsGit @('add', '--all')
    Invoke-FactsGit @('commit', '--quiet', '-m', 'chore: start')
    & git init --quiet --bare $factsOrigin 2>&1 | Out-Null
    Invoke-FactsGit @('remote', 'add', 'origin', $factsOrigin)

    Assert-FactsRan (Invoke-FactsCase facts) $false 'The facts check ran before the first release, which has no index for it to read.'
    Assert-True ((Invoke-FactsCase first).Text -like '*FIRST: True*') 'A checkout with no index and no tags was not a first release.'
    [System.IO.File]::WriteAllText((Join-Path $factsRoot 'patches-bundle.json'), "{}`n", $stageUtf8)
    Assert-FactsRan (Invoke-FactsCase facts) $true 'The facts check was skipped with a patches-bundle.json in place.'
    Remove-Item -LiteralPath (Join-Path $factsRoot 'patches-bundle.json')
    Invoke-FactsGit @('tag', 'v0.0.1')
    Invoke-FactsGit @('push', '--quiet', 'origin', 'refs/tags/v0.0.1')
    Invoke-FactsGit @('tag', '-d', 'v0.0.1')
    Assert-FactsRan (Invoke-FactsCase facts) $true 'The facts check was skipped while origin held a release tag.'
    # publish leaves out the tag of the release it's publishing, and no other.
    Assert-True ((Invoke-FactsCase first -Except v0.0.1).Text -like '*FIRST: True*') `
        "publish didn't take its own new tag for the first release's."
    Assert-True ((Invoke-FactsCase first -Except v0.0.2).Text -like '*FIRST: False*') `
        'An earlier release tag on origin still left a first release.'
    Invoke-FactsGit @('tag', 'v0.0.1')
    Assert-FactsRan (Invoke-FactsCase facts) $true 'The facts check was skipped with a release tag here.'
    Remove-Item -LiteralPath $factsOrigin -Recurse -Force
    Assert-True ((Invoke-FactsCase first).Text -like '*FIRST: False*') 'A local release tag still left a first release.'
    Invoke-FactsGit @('tag', '-d', 'v0.0.1')
    Assert-True ((Invoke-FactsCase first).Text -like "*REFUSED: *couldn't ask origin for its tags*") `
        "A first release was decided without origin's answer."
} finally {
    foreach ($path in $stageRoot, $stageOrigin, $stageRunner, $factsRoot, $factsOrigin, $factsRunner) {
        if (Test-Path -LiteralPath $path) { Remove-Item -LiteralPath $path -Recurse -Force -ErrorAction SilentlyContinue }
    }
}
Write-Host '[scripts] release stage order and first release contracts passed'

# --- tracked files name no machine -----------------------------------------------------------
#
# No tracked file names the working-notes folder .gitignore keeps out, the backup folders on the
# maintainer's machine that share its name, or a phone's adb serial. Four fixture tests fell back
# to one of those folders, which skipped quietly on every other machine and published this one's
# layout, and five scripts carried the test phone's serial. .gitignore is the one exception: it
# has to name what it keeps out. Find-MachineNames in common.ps1 holds both patterns, built from
# parts so neither file can match itself, and the pre-push hook runs the same scan on every
# commit a push publishes, whatever the push touches; the routing section above plants hits for it.

$machineNames = @(Find-MachineNames -Root $Root)
Assert-True ($machineNames.Count -eq 0) `
    ("Tracked files name the maintainer's machine or phone: " + ($machineNames -join '; '))
# A search that does not run must not read as a clean tree.
Assert-Throws { Find-MachineNames -Root (Join-Path ([System.IO.Path]::GetTempPath()) ('hushtumblr-absent-' + [guid]::NewGuid().ToString('N'))) } `
    '*could not search*' 'A machine-name scan that could not run read as a clean tree.'

Write-Host '[scripts] tracked-file machine name contracts passed'

# --- README artwork --------------------------------------------------------------------------
$artworkReadme = Get-Content -LiteralPath (Join-Path $Root 'README.md') -Raw
Assert-True ($artworkReadme.StartsWith('![HushTumblr. Tumblr, on your terms.](assets/readme-hero.png)') -and
    ([regex]::Matches($artworkReadme, 'assets/readme-hero\.png')).Count -eq 1 -and
    ([regex]::Matches($artworkReadme, 'assets/icon\.png')).Count -eq 1) `
    'The README must show one HushTumblr hero at the top and one logo in the heading.'

$logoBytes = [System.IO.File]::ReadAllBytes((Join-Path $Root 'assets/icon.png'))
$heroBytes = [System.IO.File]::ReadAllBytes((Join-Path $Root 'assets/readme-hero.png'))
Assert-True ($logoBytes.Length -ge 26 -and $heroBytes.Length -ge 26 -and
    [System.Text.Encoding]::ASCII.GetString($logoBytes, 1, 3) -eq 'PNG' -and
    [System.Text.Encoding]::ASCII.GetString($heroBytes, 1, 3) -eq 'PNG') `
    'The README artwork must be PNG files.'
$logoWidth = [System.Net.IPAddress]::NetworkToHostOrder([BitConverter]::ToInt32($logoBytes, 16))
$logoHeight = [System.Net.IPAddress]::NetworkToHostOrder([BitConverter]::ToInt32($logoBytes, 20))
$heroWidth = [System.Net.IPAddress]::NetworkToHostOrder([BitConverter]::ToInt32($heroBytes, 16))
$heroHeight = [System.Net.IPAddress]::NetworkToHostOrder([BitConverter]::ToInt32($heroBytes, 20))
Assert-True ($logoWidth -eq 1254 -and $logoHeight -eq 1254 -and $logoBytes[25] -eq 6 -and
    $heroWidth -eq 1672 -and $heroHeight -eq 941 -and $heroBytes[25] -eq 2) `
    'The logo must be a transparent square and the hero must keep its wide RGB layout.'
Assert-True ((Get-FileHash -LiteralPath (Join-Path $Root 'assets/icon.png') -Algorithm SHA256).Hash -eq
    (Get-FileHash -LiteralPath (Join-Path $Root 'concepts/marketing/2026-10-11/selected/logo-master.png') -Algorithm SHA256).Hash -and
    (Get-FileHash -LiteralPath (Join-Path $Root 'assets/readme-hero.png') -Algorithm SHA256).Hash -eq
    (Get-FileHash -LiteralPath (Join-Path $Root 'concepts/marketing/2026-10-11/selected/hero-master.png') -Algorithm SHA256).Hash) `
    'The selected artwork masters must match the images used by the README.'
$artworkBrief = Get-Content -LiteralPath (Join-Path $Root 'concepts/marketing/2026-10-11/artwork-brief.txt') -Raw
Assert-True ($artworkBrief -match 'Tumblr, on your terms\.' -and
    $artworkBrief -match 'No real posts, accounts or version number' -and
    $artworkBrief -notmatch '(?i)\bv?\d+\.\d+\.\d+\b') `
    'The artwork brief must keep the logo and hero free of release-specific text.'
Write-Host '[scripts] README artwork contracts passed'

$global:LASTEXITCODE = 0
Write-Host '[scripts] report, target, Java and guarded replacement contracts passed'

& (Join-Path $PSScriptRoot 'test-manifest-contracts.ps1') -Root $Root
if ($LASTEXITCODE -ne 0) { throw 'The compiled manifest contracts did not pass.' }
& (Join-Path $PSScriptRoot 'test-release-checksums.ps1')
if ($LASTEXITCODE -ne 0) { throw 'The offline release signature contracts did not pass.' }
& (Join-Path $PSScriptRoot 'test-published-index.ps1')
if ($LASTEXITCODE -ne 0) { throw 'The offline published index contracts did not pass.' }
& (Join-Path $PSScriptRoot 'test-walk-receipt.ps1')
if ($LASTEXITCODE -ne 0) { throw 'The whole-app walk receipt contracts did not pass.' }
& (Join-Path $PSScriptRoot 'test-app-inventory.ps1')
if ($LASTEXITCODE -ne 0) { throw 'The app inventory contracts did not pass.' }
