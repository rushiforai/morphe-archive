<#
.SYNOPSIS
    Exercise canonical production identity boundaries using independent repositories.
.NOTES
    Copyright 2026 HushGram contributors. https://github.com/SysAdminDoc/HushGram
#>
[CmdletBinding()]
param([string]$Root)
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
function Assert-True([bool]$Condition, [string]$Message) { if (-not $Condition) { throw $Message } }
function Assert-Throws([scriptblock]$Action, [string]$Pattern) {
    try { & $Action | Out-Null } catch {
        if ($_.Exception.Message -like $Pattern) { return }
        throw "Unexpected refusal: $($_.Exception.Message)"
    }
    throw "Expected refusal: $Pattern"
}
$scratch = Join-Path ([IO.Path]::GetTempPath()) ('hushgram-identity-' + [guid]::NewGuid().ToString('N'))
try {
    $policy = [IO.File]::ReadAllText((Join-Path $Root 'scripts/canonical-build-inputs.txt'))
    $minimal = [ordered]@{}
    foreach ($line in $policy -split '\r?\n' | Where-Object { $_ -notmatch '^\s*(#|$)' }) {
        $category, $kind, $path = $line -split ' ', 3
        $name = switch ($kind) { file { $path }; tree { "$path/input.txt" }; production { "$path/component/src/main/input.txt" }; module { "$path/component/build.gradle.kts" } }
        $minimal[$name] = "$category $path`n"
    }
    $minimal['scripts/canonical-build-inputs.txt'] = $policy
    $releaseInputs = @('extensions/instagram/src/release/java/ReleaseIdentity.java',
        'extensions/instagram/src/release/kotlin/ReleaseIdentity.kt',
        'extensions/instagram/src/release/res/values/identity.xml',
        'extensions/shared/library/src/release/resources/identity.txt',
        'extensions/future/library/src/release/java/FutureIdentity.java')
    foreach ($name in $releaseInputs) { $minimal[$name] = "release compiler input $name`n" }
    $minimal['gradle.properties'] = "version=0.0.4`n"
    $minimal['README.md'] = "documentation`n"
    $minimal['patches/src/test/example.kt'] = "test only`n"
    $minimal['.gitignore'] = "build/`n.gradle/`nlocal.properties`nignored-input/`n" +
        "extensions/instagram/src/release/AndroidManifest.xml`n" +
        "extensions/shared/library/src/main/l10n/ignored.tsv`n"
    $roots = @((Join-Path $scratch 'first'), (Join-Path $scratch 'different location'))
    foreach ($repo in $roots) {
        New-Item -ItemType Directory -Path $repo -Force | Out-Null
        foreach ($name in $minimal.Keys) {
            $file = Join-Path $repo $name
            New-Item -ItemType Directory -Path (Split-Path -Parent $file) -Force | Out-Null
            [IO.File]::WriteAllText($file, $minimal[$name], [Text.UTF8Encoding]::new($false))
        }
        Invoke-RepoGit -Root $repo -Arguments @('init', '--quiet') | Out-Null
        Invoke-RepoGit -Root $repo -Arguments @('config', 'core.autocrlf', 'false') | Out-Null
        Invoke-RepoGit -Root $repo -Arguments @('add', '-A') | Out-Null
    }
    $before = Get-CanonicalBuildIdentity -Root $roots[0]
    Assert-True ($before.id -ceq (Get-CanonicalBuildIdentity -Root $roots[1]).id) 'Machine paths changed the production identity.'
    $excludedInputs = @('README.md', 'patches/src/test/example.kt', 'scripts/dependency-graphs.init.gradle',
            'patches/src/test/fixture/build.gradle.kts', 'extensions/instagram/src/test/fixture.pro',
            'extensions/instagram/src/debug/java/DebugOnly.java',
            'extensions/instagram/src/androidTest/java/DeviceTest.java',
            'extensions/instagram/src/releaseUnitTest/java/ReleaseTest.java',
            'extensions/future/library/src/test/fixture/src/release/java/TestFixture.java',
            'local.properties', 'build/generated/identity.json')
    foreach ($name in $excludedInputs) {
        $file = Join-Path $roots[0] $name
        New-Item -ItemType Directory -Path (Split-Path -Parent $file) -Force | Out-Null
        [IO.File]::WriteAllText($file, 'different output or unrelated input')
        if ($name -notin @('local.properties', 'build/generated/identity.json')) {
            Invoke-RepoGit -Root $roots[0] -Arguments @('add', $name) | Out-Null
        }
        Assert-True ((Get-CanonicalBuildIdentity -Root $roots[0]).id -ceq $before.id) "Unrelated $name changed the production identity."
    }
    $ignoredExcludedInputs = @('extensions/instagram/src/debug/java/ignored-input/DebugOnly.java',
        'extensions/instagram/src/test/java/ignored-input/TestOnly.java',
        'extensions/instagram/src/androidTest/java/ignored-input/DeviceOnly.java',
        'extensions/future/library/src/test/fixture/src/release/java/ignored-input/TestFixture.java',
        'extensions/instagram/build/generated/src/main/java/Generated.java',
        'extensions/instagram/.gradle/src/release/kotlin/Generated.kt',
        'patches/build/generated/src/main/kotlin/Generated.kt',
        'ignored-input/helper.gradle', 'extensions/instagram/src/release/java/ignored-input/notes.txt')
    foreach ($name in $ignoredExcludedInputs) {
        $file = Join-Path $roots[0] $name
        New-Item -ItemType Directory -Path (Split-Path -Parent $file) -Force | Out-Null
        [IO.File]::WriteAllText($file, 'ignored output or nonproduction file')
    }
    Assert-True ((Get-CanonicalBuildIdentity -Root $roots[0]).id -ceq $before.id) 'Ignored debug, test, generated or machine files changed the reader identity.'
    $ignoredProductionInputs = @('patches/src/main/java/ignored-input/Hidden.java',
        'patches/stub/src/main/kotlin/ignored-input/Hidden.kt',
        'extensions/instagram/src/main/java/ignored-input/Main.java',
        'extensions/instagram/src/release/java/ignored-input/Release.java',
        'extensions/instagram/src/release/java/build/Hidden.java',
        'extensions/instagram/src/release/kotlin/ignored-input/Release.kt',
        'extensions/instagram/src/release/res/ignored-input/value.xml',
        'extensions/shared/library/src/release/resources/ignored-input/notes.md',
        'extensions/instagram/src/main/assets/ignored-input/value.bin',
        'extensions/instagram/src/release/AndroidManifest.xml',
        'extensions/shared/library/src/main/l10n/ignored.tsv',
        'extensions/future/library/src/release/java/ignored-input/Future.java')
    foreach ($name in $ignoredProductionInputs) {
        $file = Join-Path $roots[0] $name
        New-Item -ItemType Directory -Path (Split-Path -Parent $file) -Force | Out-Null
        try {
            [IO.File]::WriteAllText($file, 'ignored compiler or packaging input')
            Assert-True (@(Invoke-RepoGit -Root $roots[0] -Arguments @('check-ignore', $name)).Count -eq 1) "The reader regression input is not ignored: $name"
            Assert-Throws { Get-CanonicalBuildIdentity -Root $roots[0] } '*ignored canonical production input must be tracked*'
        } finally { Remove-Item -LiteralPath $file -Force }
    }
    $forceStagedInput = $ignoredProductionInputs[0]
    $forceStagedFile = Join-Path $roots[0] $forceStagedInput
    [IO.File]::WriteAllText($forceStagedFile, 'explicitly tracked production input')
    Invoke-RepoGit -Root $roots[0] -Arguments @('add', '--force', $forceStagedInput) | Out-Null
    $forceStaged = Get-CanonicalBuildIdentity -Root $roots[0]
    Assert-True ($forceStaged.id -cne $before.id) 'Explicitly staged input inside an ignored directory disappeared from the reader.'
    [IO.File]::AppendAllText($forceStagedFile, 'new working bytes')
    Assert-True ((Get-CanonicalBuildIdentity -Root $roots[0]).id -cne $forceStaged.id) 'Explicitly staged ignored-directory input used old index bytes.'
    [IO.File]::WriteAllText($forceStagedFile, 'explicitly tracked production input')
    Invoke-RepoGit -Root $roots[0] -Arguments @('rm', '--cached', $forceStagedInput) | Out-Null
    Remove-Item -LiteralPath $forceStagedFile -Force
    foreach ($category in @('source', 'catalog', 'toolchain')) {
        $name = switch ($category) {
            source { 'patches/src/main/input.txt' }; catalog { 'patches-list.json' }; toolchain { 'gradle.properties' }
        }
        $file = Join-Path $roots[0] $name
        $bytes = [IO.File]::ReadAllBytes($file)
        try {
            [IO.File]::AppendAllText($file, 'same-version change')
            $after = Get-CanonicalBuildIdentity -Root $roots[0]
            Assert-True ($after.id -cne $before.id -and $after.($category + 'Sha256') -cne $before.($category + 'Sha256')) "$category bytes did not change the identity."
            Remove-Item -LiteralPath $file -Force
            Assert-Throws { Get-CanonicalBuildIdentity -Root $roots[0] } '*missing or linked*'
        } finally { [IO.File]::WriteAllBytes($file, $bytes) }
    }
    foreach ($name in $releaseInputs) {
        $file = Join-Path $roots[0] $name
        $bytes = [IO.File]::ReadAllBytes($file)
        try {
            [IO.File]::AppendAllText($file, 'release-only working-byte change')
            $after = Get-CanonicalBuildIdentity -Root $roots[0]
            Assert-True ($after.id -cne $before.id -and $after.sourceSha256 -cne $before.sourceSha256 -and
                $after.catalogSha256 -ceq $before.catalogSha256 -and $after.toolchainSha256 -ceq $before.toolchainSha256) "Release production input $name disappeared from the reader."
            Remove-Item -LiteralPath $file -Force
            Assert-Throws { Get-CanonicalBuildIdentity -Root $roots[0] } '*missing or linked*'
        } finally { [IO.File]::WriteAllBytes($file, $bytes) }
    }
    $addedRelease = 'extensions/future/library/src/release/res/values/second.xml'
    $releaseFile = Join-Path $roots[0] $addedRelease
    New-Item -ItemType Directory -Path (Split-Path -Parent $releaseFile) -Force | Out-Null
    [IO.File]::WriteAllText($releaseFile, 'first release resource')
    Assert-Throws { Get-CanonicalBuildIdentity -Root $roots[0] } '*untracked canonical*'
    Invoke-RepoGit -Root $roots[0] -Arguments @('add', $addedRelease) | Out-Null
    $firstRelease = Get-CanonicalBuildIdentity -Root $roots[0]
    Assert-True ($firstRelease.id -cne $before.id) 'A newly staged release resource disappeared from the reader.'
    [IO.File]::WriteAllText($releaseFile, 'changed without updating the index')
    Assert-True ((Get-CanonicalBuildIdentity -Root $roots[0]).id -cne $firstRelease.id) 'Release working bytes were replaced by the older staged bytes.'
    [IO.File]::WriteAllText($releaseFile, 'first release resource')
    Invoke-RepoGit -Root $roots[0] -Arguments @('rm', '--cached', $addedRelease) | Out-Null
    Remove-Item -LiteralPath $releaseFile -Force
    $production = Join-Path $roots[0] 'extensions/instagram/src/main/second.java'
    [IO.File]::WriteAllText($production, 'new production input')
    Assert-Throws { Get-CanonicalBuildIdentity -Root $roots[0] } '*untracked canonical*'
    Invoke-RepoGit -Root $roots[0] -Arguments @('add', $production) | Out-Null
    Assert-True ((Get-CanonicalBuildIdentity -Root $roots[0]).id -cne $before.id) 'A newly tracked production input disappeared.'
    Invoke-RepoGit -Root $roots[0] -Arguments @('rm', '--cached', $production) | Out-Null
    Remove-Item -LiteralPath $production -Force
    $fixturePolicy = Join-Path $roots[0] 'scripts/canonical-build-inputs.txt'
    foreach ($bad in @('source tree ../outside', 'toolchain tree build', 'unknown file NOTICE', 'source main extensions')) {
        [IO.File]::WriteAllText($fixturePolicy, $policy + "`n$bad`n")
        Assert-Throws { Get-CanonicalBuildIdentity -Root $roots[0] } '*canonical input boundary*'
    }
    [IO.File]::WriteAllText($fixturePolicy, ($policy -replace '(?m)^catalog file patches-list.json\r?\n', ''))
    Assert-Throws { Get-CanonicalBuildIdentity -Root $roots[0] } '*omits catalog*'
    [IO.File]::WriteAllText($fixturePolicy, $policy)
    foreach ($field in @('sourceSha256', 'catalogSha256', 'toolchainSha256', 'id', 'schemaVersion')) {
        $copy = $before | ConvertTo-Json | ConvertFrom-Json
        $copy.PSObject.Properties.Remove($field)
        Assert-Throws { Assert-CanonicalBuildIdentity $copy } '*canonical build identity*'
    }
    $changed = $before | ConvertTo-Json | ConvertFrom-Json
    $changed.sourceSha256 = '0' * 64
    Assert-Throws { Assert-CanonicalBuildIdentity $changed } '*does not match*'
    $changed = $before | ConvertTo-Json | ConvertFrom-Json
    Add-Member -InputObject $changed -NotePropertyName account_id -NotePropertyValue 'not a build input'
    Assert-Throws { Assert-CanonicalBuildIdentity $changed } '*unsupported fields*'

    # Exercise the real Gradle producer, not a stand-in that can agree with a broken reader.
    $producerRoot = $roots[1]
    $fixtureBuild = @'
apply from: 'scripts/build-inputs.gradle'
tasks.register('mutateCanonicalInput') {
    doLast {
        def target = project.findProperty('mutateInput')
        if (!target) throw new GradleException('No fixture mutation selected.')
        file(target).append('changed during the build\n', 'UTF-8')
    }
}
tasks.named('writeDependencyAuditInputs') { mustRunAfter('mutateCanonicalInput') }
tasks.named('writeCanonicalBuildIdentity') { mustRunAfter('mutateCanonicalInput') }
tasks.register('assembleFixture') {
    dependsOn('writeCanonicalBuildIdentity')
    doLast {
        file(project.findProperty('mutateAfterIdentity')).append('changed after snapshot\n', 'UTF-8')
        rootProject.ext.verifyCanonicalBuildIdentity.call()
    }
}
'@
    $fixturePatches = @'
tasks.register('generatePatchesList') {
    doLast {
        if (project.hasProperty('regenerateCatalog')) rootProject.file('patches-list.json').append('new catalog\n', 'UTF-8')
    }
}
'@
    [IO.File]::WriteAllText((Join-Path $producerRoot 'build.gradle'), $fixtureBuild, [Text.UTF8Encoding]::new($false))
    [IO.File]::WriteAllText((Join-Path $producerRoot 'settings.gradle'), "include ':patches'`n", [Text.UTF8Encoding]::new($false))
    [IO.File]::WriteAllText((Join-Path $producerRoot 'patches/build.gradle'), $fixturePatches, [Text.UTF8Encoding]::new($false))
    [IO.File]::WriteAllText((Join-Path $producerRoot 'scripts/canonical-build-inputs.txt'), $policy + "`ntoolchain file build.gradle`n", [Text.UTF8Encoding]::new($false))
    Copy-Item -LiteralPath (Join-Path $Root 'scripts/build-inputs.gradle') -Destination (Join-Path $producerRoot 'scripts/build-inputs.gradle')
    Invoke-RepoGit -Root $producerRoot -Arguments @('add', '-A') | Out-Null
    $launcher = Join-Path $Root $(if ([Environment]::OSVersion.Platform -eq [PlatformID]::Win32NT) { 'gradlew.bat' } else { 'gradlew' })
    function Invoke-IdentityProducer([string[]]$Arguments, [string]$Refusal) {
        $priorErrorAction = $ErrorActionPreference
        try {
            $ErrorActionPreference = 'Continue'
            $said = @(& $launcher '-p' $producerRoot '--console=plain' '--no-configuration-cache' @Arguments 2>&1)
            $exitCode = $LASTEXITCODE
        } finally { $ErrorActionPreference = $priorErrorAction }
        if ($Refusal) {
            Assert-True ($exitCode -ne 0 -and ($said -join "`n") -like $Refusal) "The real producer accepted a mid-build mutation or refused it for the wrong reason: $($said -join "`n")"
        } else {
            Assert-True ($exitCode -eq 0) "The real identity producer failed: $($said -join "`n")"
            $produced = Get-Content -LiteralPath (Join-Path $producerRoot 'build/reports/build-identity/canonical-inputs.json') -Raw | ConvertFrom-Json
            Assert-CanonicalBuildIdentity $produced
            Assert-True ($produced.id -ceq (Get-CanonicalBuildIdentity -Root $producerRoot).id) 'The independent reader disagreed with the real Gradle producer.'
            return $produced
        }
    }
    $produced = Invoke-IdentityProducer -Arguments @('writeCanonicalBuildIdentity')
    foreach ($name in $excludedInputs) {
        $file = Join-Path $producerRoot $name
        New-Item -ItemType Directory -Path (Split-Path -Parent $file) -Force | Out-Null
        [IO.File]::WriteAllText($file, 'different output or unrelated input')
        if ($name -notin @('local.properties', 'build/generated/identity.json')) {
            Invoke-RepoGit -Root $producerRoot -Arguments @('add', $name) | Out-Null
        }
    }
    $excluded = Invoke-IdentityProducer -Arguments @('writeCanonicalBuildIdentity')
    Assert-True ($excluded.id -ceq $produced.id) 'Docs, debug or test inputs changed the real production identity.'
    foreach ($name in $ignoredExcludedInputs) {
        $file = Join-Path $producerRoot $name
        New-Item -ItemType Directory -Path (Split-Path -Parent $file) -Force | Out-Null
        [IO.File]::WriteAllText($file, 'ignored output or nonproduction file')
    }
    $ignoredExcluded = Invoke-IdentityProducer -Arguments @('writeCanonicalBuildIdentity')
    Assert-True ($ignoredExcluded.id -ceq $produced.id) 'Ignored debug, test, generated or machine files changed the producer identity.'
    foreach ($name in $ignoredProductionInputs) {
        $file = Join-Path $producerRoot $name
        New-Item -ItemType Directory -Path (Split-Path -Parent $file) -Force | Out-Null
        try {
            [IO.File]::WriteAllText($file, 'ignored compiler or packaging input')
            Assert-True (@(Invoke-RepoGit -Root $producerRoot -Arguments @('check-ignore', $name)).Count -eq 1) "The producer regression input is not ignored: $name"
            Invoke-IdentityProducer -Arguments @('writeCanonicalBuildIdentity') -Refusal '*ignored canonical production input must be tracked*'
        } finally { Remove-Item -LiteralPath $file -Force }
    }
    $forceStagedFile = Join-Path $producerRoot $forceStagedInput
    [IO.File]::WriteAllText($forceStagedFile, 'explicitly tracked production input')
    Invoke-RepoGit -Root $producerRoot -Arguments @('add', '--force', $forceStagedInput) | Out-Null
    $forceStaged = Invoke-IdentityProducer -Arguments @('writeCanonicalBuildIdentity')
    Assert-True ($forceStaged.id -cne $produced.id) 'Explicitly staged ignored-directory input disappeared from the producer.'
    [IO.File]::AppendAllText($forceStagedFile, 'new working bytes')
    $forceWorking = Invoke-IdentityProducer -Arguments @('writeCanonicalBuildIdentity')
    Assert-True ($forceWorking.id -cne $forceStaged.id) 'The producer used old index bytes for a staged ignored-directory input.'
    [IO.File]::WriteAllText($forceStagedFile, 'explicitly tracked production input')
    Invoke-RepoGit -Root $producerRoot -Arguments @('rm', '--cached', $forceStagedInput) | Out-Null
    Remove-Item -LiteralPath $forceStagedFile -Force
    foreach ($task in @('mutateCanonicalInput', 'assembleFixture')) {
        try {
            $argument = if ($task -eq 'mutateCanonicalInput') { "-PmutateInput=$forceStagedInput" } else { "-PmutateAfterIdentity=$forceStagedInput" }
            $tasks = if ($task -eq 'mutateCanonicalInput') { @($task, 'writeCanonicalBuildIdentity', $argument) } else { @($task, $argument) }
            Invoke-IdentityProducer -Arguments $tasks -Refusal '*ignored canonical production input must be tracked*'
        } finally { Remove-Item -LiteralPath $forceStagedFile -Force }
    }
    foreach ($name in $releaseInputs) {
        $file = Join-Path $producerRoot $name
        $bytes = [IO.File]::ReadAllBytes($file)
        try {
            [IO.File]::AppendAllText($file, 'release-only producer change')
            $changedRelease = Invoke-IdentityProducer -Arguments @('writeCanonicalBuildIdentity')
            Assert-True ($changedRelease.id -cne $produced.id -and $changedRelease.sourceSha256 -cne $produced.sourceSha256 -and
                $changedRelease.catalogSha256 -ceq $produced.catalogSha256 -and $changedRelease.toolchainSha256 -ceq $produced.toolchainSha256) "Release production input $name disappeared from the real producer."
        } finally { [IO.File]::WriteAllBytes($file, $bytes) }
    }
    $releaseFile = Join-Path $producerRoot $addedRelease
    New-Item -ItemType Directory -Path (Split-Path -Parent $releaseFile) -Force | Out-Null
    [IO.File]::WriteAllText($releaseFile, 'first release resource')
    Invoke-IdentityProducer -Arguments @('writeCanonicalBuildIdentity') -Refusal '*Stage new repository inputs before building an input-bound artifact*'
    Invoke-RepoGit -Root $producerRoot -Arguments @('add', $addedRelease) | Out-Null
    $stagedRelease = Invoke-IdentityProducer -Arguments @('writeCanonicalBuildIdentity')
    Assert-True ($stagedRelease.id -cne $produced.id) 'A newly staged release resource disappeared from the real producer.'
    [IO.File]::WriteAllText($releaseFile, 'changed without updating the index')
    $workingRelease = Invoke-IdentityProducer -Arguments @('writeCanonicalBuildIdentity')
    Assert-True ($workingRelease.id -cne $stagedRelease.id) 'The real producer hashed the older index instead of release working bytes.'
    Remove-Item -LiteralPath $releaseFile -Force
    Invoke-IdentityProducer -Arguments @('writeCanonicalBuildIdentity') -Refusal '*canonical build input is missing or linked*'
    [IO.File]::WriteAllText($releaseFile, 'first release resource')
    Invoke-RepoGit -Root $producerRoot -Arguments @('rm', '--cached', $addedRelease) | Out-Null
    Remove-Item -LiteralPath $releaseFile -Force
    foreach ($name in @('patches/src/main/input.txt', 'gradle.properties', $releaseInputs[0])) {
        $file = Join-Path $producerRoot $name
        $bytes = [IO.File]::ReadAllBytes($file)
        try {
            Invoke-IdentityProducer -Arguments @('mutateCanonicalInput', 'writeCanonicalBuildIdentity', "-PmutateInput=$name") -Refusal '*Canonical production source or toolchain inputs changed during the build*'
        } finally { [IO.File]::WriteAllBytes($file, $bytes) }
    }
    foreach ($name in @('patches/src/main/input.txt', 'gradle.properties', 'patches-list.json', $releaseInputs[0])) {
        $file = Join-Path $producerRoot $name
        $bytes = [IO.File]::ReadAllBytes($file)
        try {
            Invoke-IdentityProducer -Arguments @('assembleFixture', "-PmutateAfterIdentity=$name") -Refusal '*Canonical production inputs changed after the identity snapshot*'
        } finally { [IO.File]::WriteAllBytes($file, $bytes) }
    }
    $regenerated = Invoke-IdentityProducer -Arguments @(':patches:generatePatchesList', 'writeCanonicalBuildIdentity', '-PregenerateCatalog=true')
    Assert-True ($regenerated.id -cne $produced.id -and $regenerated.catalogSha256 -cne $produced.catalogSha256 -and
        $regenerated.sourceSha256 -ceq $produced.sourceSha256 -and $regenerated.toolchainSha256 -ceq $produced.toolchainSha256) 'Catalog regeneration was omitted or changed unrelated canonical categories.'
    Write-Host '[build-identity] canonical input, exclusion, substitution and missing-input contracts passed'
} finally {
    Remove-GeneratedPath -Path $scratch -Root ([IO.Path]::GetTempPath())
}
