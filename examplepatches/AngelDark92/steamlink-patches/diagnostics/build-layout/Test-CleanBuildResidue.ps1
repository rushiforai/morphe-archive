# Regression tests for tools/Clean-BuildResidue.ps1.
# Uses a synthetic external build root; never touches real project inputs.
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$repo = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../..'))
$external = [IO.Path]::GetFullPath((Join-Path $repo '../builds/steamlink-patches'))
$sandbox = Join-Path $external ('build/residue-tests-' + [guid]::NewGuid().ToString('N'))
$checks = 0
function Assert($Condition, [string]$Message) {
    if (!$Condition) { throw $Message }
    $script:checks++
}
function Write-FixtureFile([string]$Root, [string]$Relative, [string]$Text = 'fixture') {
    $path = Join-Path $Root $Relative
    $null = New-Item -ItemType Directory -Force -Path (Split-Path -Parent $path)
    [IO.File]::WriteAllText($path, $Text)
    return $path
}
function New-Fixture([string]$Name) {
    $root = Join-Path $sandbox $Name
    $fixtureRepo = Join-Path $root 'checkout/steamlink-patches'
    $fixtureBuild = Join-Path $root 'output'
    $null = New-Item -ItemType Directory -Force -Path $fixtureRepo, $fixtureBuild
    $null = Write-FixtureFile $fixtureRepo 'AGENTS.md' '# fixture contract'
    $null = Write-FixtureFile $fixtureRepo 'patches/src/main/.keep' 'source'

    # Repository-local residue that must be removed.
    $null = Write-FixtureFile $fixtureRepo 'build/reports/problems.html'
    $null = Write-FixtureFile $fixtureRepo 'patches/build/libs/bundle.mpp'
    $null = Write-FixtureFile $fixtureRepo '.gradle/9.6.1/cache.bin'
    $null = Write-FixtureFile $fixtureRepo 'builds/steamlink-patches/build/nested.txt'
    $null = Write-FixtureFile $fixtureRepo 'd/Angelo/Desktop/SteamLink/builds/steamlink-patches/.gradle/9.6.1/cache.bin'
    $null = Write-FixtureFile $fixtureRepo 'diagnostics/example/__pycache__/helper.pyc'
    $null = Write-FixtureFile $fixtureRepo 'extensions/example/build-android/output.so'

    # Source inputs that must survive.
    $null = Write-FixtureFile $fixtureRepo 'patches/src/main/resources/keep.so'
    $null = Write-FixtureFile $fixtureRepo 'diagnostics/example/README.md'

    # Protected build inputs.
    $null = Write-FixtureFile $fixtureBuild 'build/decoded-fixture-apks/stock.apk' 'decoded-fixture'
    $null = Write-FixtureFile $fixtureBuild 'build/4xvr-2.0.22/cn.vr4p.oculus4xvrplayerov_2.0.22_original.apk' 'canonical-original'
    $null = Write-FixtureFile $fixtureBuild 'build/tooling/bin/cmake.exe' 'tooling'
    $null = Write-FixtureFile $fixtureBuild 'build/tooling/bin/glslang.exe' 'tooling'
    $null = Write-FixtureFile $fixtureBuild 'build/tooling/bin/ninja.exe' 'tooling'
    $null = Write-FixtureFile $fixtureBuild 'build/verification/run/summary.json' '{"status":"passed"}'
    $null = Write-FixtureFile $fixtureBuild 'build/decoded-fixture-sources/5002363/source.txt' 'decoded-source'

    # Generated APKs and scratch that must be removed.
    $null = Write-FixtureFile $fixtureBuild 'build/4xvr-2.0.22/cn.vr4p.oculus4xvrplayerov_2.0.22_patched.apk' 'generated-patched'
    $null = Write-FixtureFile $fixtureBuild 'build/experiment/result-unsigned.apk' 'generated-result'
    $null = Write-FixtureFile $fixtureBuild 'build/experiment/report.md' 'evidence'
    $null = Write-FixtureFile $fixtureBuild 'build/experiment/isolated-checkout/classes/App.class' 'compiled'
    $null = Write-FixtureFile $fixtureBuild 'build/experiment/compiled/classes/App.class' 'compiled'
    $null = Write-FixtureFile $fixtureBuild 'build/experiment/node_modules/pkg/index.js' 'dependency'
    $null = Write-FixtureFile $fixtureBuild 'build/experiment/scratch/temp.bin' 'scratch'
    $null = Write-FixtureFile $fixtureBuild 'build/live-hitch-20260915/run-1/installed.apk' 'generated-installed'
    $null = Write-FixtureFile $fixtureBuild 'build/live-hitch-20260915/run-1/capture.txt' 'capture'

    # Tool compile trees are retained even though their directory names look like scratch.
    $null = Write-FixtureFile $fixtureBuild 'build/startup-boundary-tools/classes/App.class' 'tool-classes'
    $null = Write-FixtureFile $fixtureBuild 'build/startup-boundary-tools/test-classes/AppTest.class' 'tool-tests'
    $null = Write-FixtureFile $fixtureBuild 'build/audit-5002363/compiled-abc/App.class' 'audit-classes'

    # Decoded tree contents are retained, but an APK inside one is still generated.
    $null = Write-FixtureFile $fixtureBuild 'build/experiment/temporary/apk/root/classes.dex' 'decoded'
    $null = Write-FixtureFile $fixtureBuild 'build/experiment/temporary/apk/stock.apk' 'generated-copy'
    $null = Write-FixtureFile $fixtureBuild 'build/audit-5002363/pristine-input/decoded-apk-fixture.apk' 'pristine-copy'

    return @{ Root = $root; Repo = $fixtureRepo; Build = $fixtureBuild }
}

function Invoke-Cleaner([hashtable]$Fixture, [switch]$Apply) {
    $arguments = @{
        Repository = $Fixture.Repo
        BuildRoot = $Fixture.Build
        SkipProcessCheck = $true
    }
    if ($Apply) { $arguments.Apply = $true }
    & (Join-Path $repo 'tools/Clean-BuildResidue.ps1') @arguments | Out-Null
    $receipt = @(Get-ChildItem -LiteralPath (Join-Path $Fixture.Build '_cleanup') -Filter 'steamlink-residue-*.json' -File |
        Sort-Object LastWriteTimeUtc -Descending | Select-Object -First 1)
    if (!$receipt.Count) { throw 'Cleaner wrote no receipt.' }
    return (Get-Content -LiteralPath $receipt[0].FullName -Raw | ConvertFrom-Json)
}

try {
    $fixture = New-Fixture 'normal'
    $preview = Invoke-Cleaner $fixture
    Assert ($preview.status -eq 'passed') 'Preview reported errors'
    Assert ($preview.mode -eq 'preview') 'Preview mode not recorded'
    Assert ($preview.plannedTargets -gt 0) 'Preview planned no targets'
    Assert (Test-Path -LiteralPath (Join-Path $fixture.Build 'build/experiment/result-unsigned.apk')) 'Preview deleted an APK'
    Assert (Test-Path -LiteralPath (Join-Path $fixture.Repo 'build/reports/problems.html')) 'Preview deleted repo residue'

    $apply = Invoke-Cleaner $fixture -Apply
    Assert ($apply.status -eq 'passed') 'Apply reported errors'
    Assert ($apply.mode -eq 'apply') 'Apply mode not recorded'
    Assert ($apply.reclaimedBytes -gt 0) 'Apply reclaimed no bytes'
    Assert ($apply.removedTargets -gt 0) 'Apply removed no targets'

    foreach ($relative in @(
        'build/4xvr-2.0.22/cn.vr4p.oculus4xvrplayerov_2.0.22_patched.apk',
        'build/experiment/result-unsigned.apk',
        'build/experiment/isolated-checkout',
        'build/experiment/compiled',
        'build/experiment/node_modules',
        'build/experiment/scratch',
        'build/live-hitch-20260915/run-1/installed.apk',
        'build/experiment/temporary/apk/stock.apk')) {
        Assert (!(Test-Path -LiteralPath (Join-Path $fixture.Build $relative))) "Generated residue survived: $relative"
    }
    foreach ($relative in @(
        'build/decoded-fixture-apks/stock.apk',
        'build/4xvr-2.0.22/cn.vr4p.oculus4xvrplayerov_2.0.22_original.apk',
        'build/tooling/bin/cmake.exe',
        'build/verification/run/summary.json',
        'build/decoded-fixture-sources/5002363/source.txt',
        'build/experiment/report.md',
        'build/live-hitch-20260915/run-1/capture.txt',
        'build/startup-boundary-tools/classes/App.class',
        'build/startup-boundary-tools/test-classes/AppTest.class',
        'build/audit-5002363/compiled-abc/App.class',
        'build/experiment/temporary/apk/root/classes.dex',
        'build/audit-5002363/pristine-input/decoded-apk-fixture.apk')) {
        Assert (Test-Path -LiteralPath (Join-Path $fixture.Build $relative)) "Protected input deleted: $relative"
    }
    foreach ($relative in @('build', 'patches/build', '.gradle', 'builds', 'd', 'diagnostics/example/__pycache__', 'extensions/example/build-android')) {
        Assert (!(Test-Path -LiteralPath (Join-Path $fixture.Repo $relative))) "Repo residue survived: $relative"
    }
    Assert (Test-Path -LiteralPath (Join-Path $fixture.Repo 'patches/src/main/resources/keep.so')) 'Source input deleted'
    Assert (Test-Path -LiteralPath (Join-Path $fixture.Repo 'diagnostics/example/README.md')) 'Evidence deleted'
    Assert ($apply.protected.Count -ge 6) 'Protected hashes missing from receipt'
    foreach ($row in $apply.protected) {
        if (!(Test-Path -LiteralPath $row.path)) { throw "Protected file missing after apply: $($row.path)" }
        Assert (((Get-FileHash -LiteralPath $row.path -Algorithm SHA256).Hash.ToLowerInvariant()) -eq $row.sha256) "Protected hash changed: $($row.path)"
    }

    $second = Invoke-Cleaner $fixture -Apply
    Assert ($second.status -eq 'passed') 'Second apply reported errors'
    Assert ($second.plannedTargets -eq 0) 'Second apply planned targets'
    Assert ($second.reclaimedBytes -eq 0) 'Second apply reclaimed bytes'

    $junctionFixture = New-Fixture 'junction'
    $outside = Join-Path $junctionFixture.Root 'outside'
    $null = New-Item -ItemType Directory -Force -Path $outside
    $null = Write-FixtureFile $outside 'escape.txt' 'outside'
    $null = New-Item -ItemType Junction -Path (Join-Path $junctionFixture.Build 'build/experiment/escape') -Target $outside
    $rejected = $false
    try { Invoke-Cleaner $junctionFixture -Apply | Out-Null } catch { $rejected = $true }
    Assert $rejected 'Junction was not rejected'
    Assert (Test-Path -LiteralPath (Join-Path $junctionFixture.Build 'build/experiment/result-unsigned.apk')) 'Junction run deleted an APK'
    Assert (Test-Path -LiteralPath (Join-Path $outside 'escape.txt')) 'Junction target changed'
    [IO.Directory]::Delete((Join-Path $junctionFixture.Build 'build/experiment/escape'))

    $repoJunctionFixture = New-Fixture 'repo-junction'
    $repoOutside = Join-Path $repoJunctionFixture.Root 'repo-outside'
    $null = New-Item -ItemType Directory -Force -Path $repoOutside
    $null = Write-FixtureFile $repoOutside 'escape.txt' 'outside'
    $null = New-Item -ItemType Junction -Path (Join-Path $repoJunctionFixture.Repo 'build/reports/junction') -Target $repoOutside
    $rejected = $false
    try { Invoke-Cleaner $repoJunctionFixture -Apply | Out-Null } catch { $rejected = $true }
    Assert $rejected 'Repository junction was not rejected'
    Assert (Test-Path -LiteralPath (Join-Path $repoJunctionFixture.Repo 'build/reports/problems.html')) 'Repository junction run deleted the parent tree'
    Assert (Test-Path -LiteralPath (Join-Path $repoOutside 'escape.txt')) 'Repository junction target changed'
    [IO.Directory]::Delete((Join-Path $repoJunctionFixture.Repo 'build/reports/junction'))

    $nestedBuildFixture = New-Fixture 'nested-build'
    $rejected = $false
    try {
        & (Join-Path $repo 'tools/Clean-BuildResidue.ps1') -Repository $nestedBuildFixture.Repo -BuildRoot (Join-Path $nestedBuildFixture.Repo 'nested-output') -SkipProcessCheck | Out-Null
    } catch { $rejected = $true }
    Assert $rejected 'BuildRoot inside Repository was accepted'

    Write-Host "PASS: $checks residue-cleaner assertions."
} finally {
    $full = [IO.Path]::GetFullPath($sandbox)
    if (!$full.StartsWith($external + '\build\residue-tests-', [StringComparison]::OrdinalIgnoreCase)) {
        throw "Unsafe fixture cleanup path: $full"
    }
    if (Test-Path -LiteralPath $full) {
        $links = @(Get-ChildItem -LiteralPath $full -Recurse -Force -ErrorAction SilentlyContinue | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint })
        if ($links.Count) { throw "Test fixtures retained because links remain: $full" }
        Remove-Item -LiteralPath $full -Recurse -Force
    }
}
