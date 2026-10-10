<#
.SYNOPSIS
    Verify that patch verification cannot skip the retained vendor fixtures.
.DESCRIPTION
    Drive the real push hook against temporary repositories and a recording build wrapper.
    No APK is patched, no Gradle task runs, and no network request is made. The files here
    stand in only for the hook's presence check; the Kotlin fixture tests verify their contents.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
$hook = Join-Path $Root 'scripts/pre-push.ps1'
$temp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\', '/')
$testRoot = [IO.Path]::GetFullPath((Join-Path $temp ('hushpinterest-fixture-gate-' + [guid]::NewGuid().ToString('N'))))
if ([IO.Path]::GetDirectoryName($testRoot) -ine $temp) { throw 'The fixture root is outside the temporary directory.' }
$repo = Join-Path $testRoot 'repo'
$fixtures = Join-Path $testRoot 'fixtures'
$marker = Join-Path $testRoot 'build-ran.json'
$releaseMarker = Join-Path $testRoot 'release-ran.txt'
$source = 'patches/src/main/kotlin/FixturePatch.kt'
$cases = 0
$saved = @{}
foreach ($name in @('HUSHPINTEREST_SKIP_PRE_PUSH', 'HUSHPINTEREST_FIXTURE_DIR', 'HUSHPINTEREST_REQUIRE_FIXTURES',
        'HUSHPINTEREST_BUILD_WRAPPER', 'GITHUB_ACTOR', 'GITHUB_TOKEN')) {
    $saved[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
}
$savedGit = @{}
foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
    $savedGit[$variable.Name] = $variable.Value
    Remove-Item -LiteralPath ('Env:\' + $variable.Name)
}

function Assert-True([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}
function Invoke-FixtureGit([string[]]$Arguments) {
    $result = @(& git -C $repo @Arguments 2>&1)
    if ($LASTEXITCODE -ne 0) { throw "Fixture git failed: $($result -join ' ')" }
    return $result
}
function Write-Catalog([string]$Package = 'com.pinterest', [switch]$NewestOnly,
        [switch]$MultipleCodes, [switch]$Unpinned) {
    $targets = @([ordered]@{ version = '14.38.0'; versionCodes = [ordered]@{ UNIVERSAL = 14388010 } })
    if ($MultipleCodes) { $targets[0].versionCodes['ARMEABI_V7A'] = 14388000 }
    if ($Unpinned) { $targets[0].Remove('versionCodes') }
    if (-not $NewestOnly) { $targets += [ordered]@{ version = '14.37.0'; versionCodes = [ordered]@{ UNIVERSAL = 14378010 } } }
    $packages = [ordered]@{}
    $packages[$Package] = @($targets | ForEach-Object { $_.version })
    [ordered]@{ patches = @([ordered]@{
            name = 'Fixture patch'; compatiblePackages = $packages
            compatibility = @([ordered]@{ packageName = $Package; targets = $targets })
        }) } | ConvertTo-Json -Depth 12 | Set-Content -LiteralPath (Join-Path $repo 'patches-list.json') -Encoding UTF8
}
function Write-Fixture([string]$Name) {
    Set-Content -LiteralPath (Join-Path $fixtures $Name) -Value 'vendor APK stand-in' -Encoding ASCII
}
function Invoke-FixtureHook([string[]]$Paths = @($source), [string]$Refs) {
    Remove-Item -LiteralPath $marker, $releaseMarker -Force -ErrorAction SilentlyContinue
    $global:LASTEXITCODE = 0
    if ($Refs) {
        & $hook -Root $repo -PushedRefs $Refs 6> $null
    } else {
        & $hook -Root $repo -ChangedPaths $Paths 6> $null
    }
    if ($LASTEXITCODE -ne 0) { throw "The fixture hook exited $LASTEXITCODE." }
}
function Assert-HookFails([string]$Pattern, [string]$Refs) {
    $failure = $null
    try { Invoke-FixtureHook -Refs $Refs } catch { $failure = $_.Exception.Message }
    Assert-True ($failure -like $Pattern) "Expected [$Pattern], got [$failure]."
    Assert-True (-not (Test-Path -LiteralPath $marker)) 'The build started before its fixture setup was refused.'
    Assert-True ($env:HUSHPINTEREST_REQUIRE_FIXTURES -eq 'prior-value') 'A failed gate did not restore the strict fixture environment.'
    $script:cases++
}

try {
    New-Item -ItemType Directory -Path (Join-Path $repo 'scripts'), (Join-Path $repo 'patches/src/main/kotlin'), $fixtures -Force | Out-Null
    Invoke-FixtureGit @('init', '--quiet', '--initial-branch=main') | Out-Null
    $actualGitDir = [IO.Path]::GetFullPath(([string](Invoke-FixtureGit @('rev-parse', '--absolute-git-dir'))).Trim())
    Assert-True ($actualGitDir -ieq (Join-Path $repo '.git')) 'Fixture git resolved outside its temporary repository.'
    Invoke-FixtureGit @('config', 'user.name', 'SysAdminDoc') | Out-Null
    Invoke-FixtureGit @('config', 'user.email', 'matt_parker@outlook.com') | Out-Null
    Copy-Item -LiteralPath (Join-Path $Root 'scripts/patch-target.ps1') -Destination (Join-Path $repo 'scripts/patch-target.ps1')
    Set-Content -LiteralPath (Join-Path $repo 'scripts/build-advisories.ps1') -Encoding ASCII -Value @(
        'param([string]$Root)', 'exit 0')
    Set-Content -LiteralPath (Join-Path $repo $source) -Value 'first source' -Encoding ASCII
    Set-Content -LiteralPath (Join-Path $repo 'scripts/validate-release-facts.ps1') -Encoding ASCII -Value @(
        'param([string]$Root, [switch]$VerifyPublishedAsset, [switch]$ArtifactIsHosted)',
        "Set-Content -LiteralPath '$releaseMarker' -Value `"verify=`$VerifyPublishedAsset hosted=`$ArtifactIsHosted`"", 'exit 0')
    $wrapper = Join-Path $testRoot 'record-build.ps1'
    Set-Content -LiteralPath $wrapper -Encoding ASCII -Value @(
        'param([string]$ProjectDir, [string[]]$Tasks)',
        '$catalog = Get-Content -LiteralPath (Join-Path $ProjectDir ''patches-list.json'') -Raw | ConvertFrom-Json',
        '@{ ProjectDir = $ProjectDir; Tasks = $Tasks; FixtureDir = $env:HUSHPINTEREST_FIXTURE_DIR;',
        '    Required = $env:HUSHPINTEREST_REQUIRE_FIXTURES; Versions = $catalog.patches[0].compatiblePackages.''com.pinterest'' } |',
        "    ConvertTo-Json | Set-Content -LiteralPath '$marker' -Encoding ASCII", 'exit 0')
    $env:HUSHPINTEREST_SKIP_PRE_PUSH = $null
    $env:HUSHPINTEREST_BUILD_WRAPPER = $wrapper
    $env:GITHUB_ACTOR = 'fixture-test'
    $env:GITHUB_TOKEN = 'fixture-test'
    $env:HUSHPINTEREST_REQUIRE_FIXTURES = 'prior-value'
    Write-Catalog

    # A blank process value prevents importing the machine's configured directory into this case.
    $env:HUSHPINTEREST_FIXTURE_DIR = ' '
    Assert-HookFails '*requires HUSHPINTEREST_FIXTURE_DIR*'
    $env:HUSHPINTEREST_FIXTURE_DIR = Join-Path $testRoot 'absent'
    Assert-HookFails '*which is not a folder*correct the path*'
    $env:HUSHPINTEREST_FIXTURE_DIR = $fixtures
    Assert-HookFails '*pinterest-14.38.0-14388010.apk, pinterest-14.37.0-14378010.apk*'
    Write-Fixture 'pinterest-14.38.0-14388010.apk'
    Assert-HookFails '*missing retained com.pinterest build(s): pinterest-14.37.0-14378010.apk*'
    Write-Fixture 'pinterest-14.37.0-14378000.apk'
    Assert-HookFails '*pinterest-14.37.0-14378010.apk*'
    $retained = Join-Path $fixtures 'pinterest-14.37.0-14378010.apk'
    New-Item -ItemType Directory -Path $retained | Out-Null
    Assert-HookFails '*pinterest-14.37.0-14378010.apk*'
    Remove-Item -LiteralPath $retained -Force
    [IO.File]::WriteAllBytes($retained, [byte[]]@())
    Assert-HookFails '*pinterest-14.37.0-14378010.apk*'
    Write-Fixture 'pinterest-14.37.0-14378010.apk'
    Invoke-FixtureHook
    $ran = Get-Content -LiteralPath $marker -Raw | ConvertFrom-Json
    Assert-True ($ran.Required -eq '1' -and $ran.FixtureDir -eq $fixtures) 'The build did not receive strict fixture mode and an absolute fixture directory.'
    Assert-True (@($ran.Tasks) -contains ':patches:test' -and @($ran.Tasks) -contains ':extensions:pinterest:lint') 'The fixture gate dropped existing Gradle checks.'
    # The APK tests are a task of their own and run after every quick check, so a quick failure
    # stops the build before any fixture is opened.
    $ranTasks = @($ran.Tasks)
    Assert-True ($ranTasks.Count -gt 1 -and $ranTasks[-1] -eq ':patches:fixtureTest' -and
        @($ranTasks | Where-Object { $_ -eq ':patches:fixtureTest' }).Count -eq 1) `
        "The fixture gate did not run :patches:fixtureTest once, after the quick checks: $($ranTasks -join ', ')"
    Assert-True ($env:HUSHPINTEREST_REQUIRE_FIXTURES -eq 'prior-value') 'A successful gate did not restore the strict fixture environment.'
    $cases++

    Write-Catalog -MultipleCodes
    Assert-HookFails '*pinterest-14.38.0-14388000.apk*'
    Write-Fixture 'pinterest-14.38.0-14388000.apk'
    Invoke-FixtureHook
    Assert-True (Test-Path -LiteralPath $marker) 'All declared version codes did not allow the build to start.'
    $cases++
    Write-Catalog -Unpinned
    Assert-HookFails '*requires exact version codes*14.38.0*'
    Write-Catalog -Package 'com.example.notpinterest'
    Assert-HookFails '*no retained fixture naming rule for com.example.notpinterest*'
    Write-Catalog
    $catalogPath = Join-Path $repo 'patches-list.json'
    Move-Item -LiteralPath $catalogPath -Destination "$catalogPath.saved"
    Assert-HookFails '*requires the pushed tree''s patches-list.json*'
    Move-Item -LiteralPath "$catalogPath.saved" -Destination $catalogPath
    $helperPath = Join-Path $repo 'scripts/patch-target.ps1'
    Move-Item -LiteralPath $helperPath -Destination "$helperPath.saved"
    Assert-HookFails '*requires the pushed tree''s scripts/patch-target.ps1*'
    Move-Item -LiteralPath "$helperPath.saved" -Destination $helperPath

    $env:HUSHPINTEREST_FIXTURE_DIR = ' '
    Invoke-FixtureHook -Paths @('CONTRIBUTING.md')
    Assert-True (-not (Test-Path -LiteralPath $marker)) 'A documentation-only push started fixture verification.'
    $cases++
    Set-Content -LiteralPath (Join-Path $repo 'patches-bundle.json') -Value '{}' -Encoding ASCII
    Invoke-FixtureHook -Paths @('patches-bundle.json')
    Assert-True ((Get-Content -LiteralPath $releaseMarker -Raw) -like 'verify=True hosted=True*') 'The fixture gate changed published-asset verification.'
    $cases++
    Remove-Item -LiteralPath (Join-Path $repo 'patches-bundle.json') -Force

    # The pushed commit retains an older target that HEAD no longer declares. Its missing fixture
    # must fail before the wrapper starts, then restoring it must build that commit's catalog.
    $env:HUSHPINTEREST_FIXTURE_DIR = $fixtures
    Invoke-FixtureGit @('add', '--all') | Out-Null
    Invoke-FixtureGit @('commit', '--quiet', '-m', 'fixture baseline') | Out-Null
    $base = ([string](Invoke-FixtureGit @('rev-parse', 'HEAD'))).Trim()
    Set-Content -LiteralPath (Join-Path $repo $source) -Value 'pushed source' -Encoding ASCII
    Invoke-FixtureGit @('add', '--', $source) | Out-Null
    Invoke-FixtureGit @('commit', '--quiet', '-m', 'fixture pushed source') | Out-Null
    $pushed = ([string](Invoke-FixtureGit @('rev-parse', 'HEAD'))).Trim()
    Write-Catalog -NewestOnly
    Invoke-FixtureGit @('add', '--', 'patches-list.json') | Out-Null
    Invoke-FixtureGit @('commit', '--quiet', '-m', 'fixture current catalog') | Out-Null
    Remove-Item -LiteralPath $retained -Force
    $refs = "refs/heads/main $pushed refs/heads/main $base"
    Assert-HookFails '*pinterest-14.37.0-14378010.apk*' -Refs $refs
    Write-Fixture 'pinterest-14.37.0-14378010.apk'
    Invoke-FixtureHook -Refs $refs
    $ran = Get-Content -LiteralPath $marker -Raw | ConvertFrom-Json
    Assert-True ($ran.ProjectDir -ne $repo -and @($ran.Versions) -contains '14.37.0') 'The gate checked HEAD instead of the pushed commit''s fixture catalog.'
    $cases++
    Write-Host "[fixtures] pre-push fixture contracts passed ($cases cases)"
} finally {
    # A pushed-commit case creates the hook's own worktree outside this test directory. Confirm its
    # resolved path is the hook's temporary path before asking git to remove it.
    if (Test-Path -LiteralPath (Join-Path $repo '.git') -PathType Container) {
        foreach ($line in @(Invoke-FixtureGit @('worktree', 'list', '--porcelain'))) {
            if ($line -notlike 'worktree *') { continue }
            $tree = [IO.Path]::GetFullPath($line.Substring(9))
            if ($tree -eq $repo) { continue }
            if ([IO.Path]::GetDirectoryName($tree) -ine $temp -or
                    [IO.Path]::GetFileName($tree) -notmatch '^hushpinterest-pre-push-[a-f0-9]{12}$') {
                throw "Refusing to remove unexpected fixture worktree $tree."
            }
            Invoke-FixtureGit @('worktree', 'remove', '--force', $tree) | Out-Null
        }
    }
    foreach ($name in $saved.Keys) { [Environment]::SetEnvironmentVariable($name, $saved[$name], 'Process') }
    foreach ($name in $savedGit.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $savedGit[$name] }
    if (Test-Path -LiteralPath $testRoot) { Remove-Item -LiteralPath $testRoot -Recurse -Force }
}
