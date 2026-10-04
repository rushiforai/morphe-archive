<#
.SYNOPSIS
    Exercise the resolved build advisory policy and push routing with recorded OSV responses.
#>
[CmdletBinding()]
param([string]$Root, [string]$ResolvedReportPath)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $Root 'scripts/build-advisories.ps1') -Root $Root
$temp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\', '/')
$testRoot = [IO.Path]::GetFullPath((Join-Path $temp ('hushtelegram-build-advisories-' + [guid]::NewGuid().ToString('N'))))
if ([IO.Path]::GetDirectoryName($testRoot) -ine $temp) { throw 'The advisory fixture is outside the temporary directory.' }
$reportPath = Join-Path $testRoot 'build-dependencies.json'
$exceptionPath = Join-Path $testRoot 'exceptions.txt'
$today = [datetime]'2026-10-01'
$purl = 'pkg:maven/com.example/build-only-tool@1.2.3'
$cases = 0
$asked = New-Object Collections.Generic.List[string]
$answers = @{}
$saved = @{}
foreach ($name in @('HUSHTELEGRAM_SKIP_PRE_PUSH', 'HUSHTELEGRAM_FIXTURE_DIR', 'HUSHTELEGRAM_REQUIRE_FIXTURES',
        'HUSHTELEGRAM_BUILD_WRAPPER', 'GITHUB_ACTOR', 'GITHUB_TOKEN')) {
    $saved[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
}
$savedGit = @{}
foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
    $savedGit[$variable.Name] = $variable.Value
    Remove-Item -LiteralPath ('Env:\' + $variable.Name)
}
function Assert-True([bool]$Condition, [string]$Message) { if (-not $Condition) { throw $Message } }
function Assert-Fails([scriptblock]$Action, [string]$Pattern) {
    $failure = $null
    try { & $Action } catch { $failure = $_.Exception.Message }
    Assert-True ($failure -like $Pattern) "Expected [$Pattern], got [$failure]."
    $script:cases++
}
function New-Report {
    return [ordered]@{
        schemaVersion = 1; gradleVersion = '9.7.1'
        configurations = @('settings:classpath', ':patches:patcherProvidedClasspath', ':patches:testRuntimeClasspath')
        components = @([ordered]@{
            group = 'com.example'; name = 'build-only-tool'; version = '1.2.3'; purl = $purl
            configurations = @('settings:classpath', ':patches:patcherProvidedClasspath', ':patches:testRuntimeClasspath')
        })
    }
}
function Write-Report($Report) { $Report | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $reportPath -Encoding UTF8 }
function Invoke-Gate { Invoke-BuildAdvisoryGate -Report (Read-BuildDependencyReport $reportPath) -ExceptionsPath $exceptionPath -Today $today }
function Invoke-RestMethod {
    param($Uri, $Method, $ContentType, $Body, $TimeoutSec)
    $query = $Body | ConvertFrom-Json
    $key = [string]$query.package.purl
    if ($query.page_token) { $key += " page $($query.page_token)" }
    $asked.Add($key)
    if (-not $answers.ContainsKey($key)) { throw 'Recorded OSV query failure.' }
    return ($answers[$key] | ConvertFrom-Json)
}
function Set-Advisory([string]$Severity) {
    $advisory = [ordered]@{
        id = 'GHSA-aaaa-bbbb-cccc'; aliases = @('CVE-2026-12345'); summary = 'Build-only parser fixture.'
    }
    if ($Severity) { $advisory.database_specific = @{ severity = $Severity } }
    $script:answers = @{ $purl = (@{ vulns = @($advisory) } | ConvertTo-Json -Depth 6) }
}
function Assert-ReviewedBuildGraph($Report) {
    $utpNames = @('_internal-unified-test-platform-core',
        '_internal-unified-test-platform-android-test-plugin-host-emulator-control')
    foreach ($name in $utpNames) {
        if (@($Report.Configurations | Where-Object { $_.EndsWith(':' + $name) }).Count -eq 0) {
            throw "The resolved build graph is missing the Android host test configuration $name."
        }
    }
    $netty = @($Report.Libraries | Where-Object {
        $_.Group -eq 'io.netty' -and @($_.Configurations | Where-Object {
            $origin = $_
            @($utpNames | Where-Object { $origin.EndsWith(':' + $_) }).Count -gt 0
        }).Count -gt 0
    })
    foreach ($name in @('netty-common', 'netty-handler', 'netty-codec-http2')) {
        if (@($netty | Where-Object { $_.Name -eq $name }).Count -eq 0) {
            throw "The resolved Android host test graph is missing $name."
        }
    }
    foreach ($library in $netty) {
        if ($library.Version -cne '4.1.138.Final') {
            throw "Android host test Netty is not aligned at 4.1.138.Final: $($library.Purl)"
        }
    }
    $settingsVersions = @{
        'org.bitbucket.b_c:jose4j' = '0.9.7'; 'org.jdom:jdom2' = '2.0.6.1'
        'org.jetbrains.kotlin:kotlin-gradle-plugin' = '2.4.20'
        'org.bouncycastle:bcprov-jdk18on' = '1.86'; 'org.bouncycastle:bcpkix-jdk18on' = '1.86'
        'org.bouncycastle:bcutil-jdk18on' = '1.86'
    }
    foreach ($package in $settingsVersions.Keys) {
        $parts = $package.Split(':')
        $libraries = @($Report.Libraries | Where-Object {
            $_.Group -ceq $parts[0] -and $_.Name -ceq $parts[1] -and
                $_.Configurations -contains 'settings:classpath'
        })
        if ($libraries.Count -ne 1 -or $libraries[0].Version -cne $settingsVersions[$package]) {
            throw "Settings $package did not resolve exactly at $($settingsVersions[$package])."
        }
    }
}
function New-ReviewedBuildReport {
    $core = ':extensions:telegram:_internal-unified-test-platform-core'
    $emulator = ':extensions:telegram:_internal-unified-test-platform-android-test-plugin-host-emulator-control'
    $modules = [ordered]@{
        'io.netty:netty-common' = '4.1.138.Final'; 'io.netty:netty-handler' = '4.1.138.Final'
        'io.netty:netty-codec-http2' = '4.1.138.Final'; 'org.bitbucket.b_c:jose4j' = '0.9.7'
        'org.jdom:jdom2' = '2.0.6.1'; 'org.jetbrains.kotlin:kotlin-gradle-plugin' = '2.4.20'
        'org.bouncycastle:bcprov-jdk18on' = '1.86'; 'org.bouncycastle:bcpkix-jdk18on' = '1.86'
        'org.bouncycastle:bcutil-jdk18on' = '1.86'
    }
    return [ordered]@{
        schemaVersion = 1; gradleVersion = '9.7.1'; configurations = @('settings:classpath', $core, $emulator)
        components = @(foreach ($package in $modules.Keys) {
            $parts = $package.Split(':')
            [ordered]@{
                group = $parts[0]; name = $parts[1]; version = $modules[$package]
                purl = ('pkg:maven/' + $parts[0] + '/' + $parts[1] + '@' + $modules[$package])
                configurations = @(if ($parts[0] -eq 'io.netty') { $core; $emulator } else { 'settings:classpath' })
            }
        })
    }
}
try {
    New-Item -ItemType Directory -Path $testRoot -Force | Out-Null
    Write-Report (New-Report)
    Set-Content -LiteralPath $exceptionPath -Value '# no accepted advisories' -Encoding ASCII
    $answers = @{ $purl = '{}' }
    $report = Read-BuildDependencyReport $reportPath
    Assert-True ($report.Libraries.Count -eq 1 -and $report.Libraries[0].Configurations.Count -eq 3) 'One resolved module was not deduplicated across graph origins.'
    Invoke-Gate 6> $null
    Assert-True ($asked.Count -eq 1 -and $asked[0] -ceq $purl) 'OSV did not receive exactly the resolved module package URL.'
    $cases++

    foreach ($origin in @('settings:classpath', ':patches:patcherProvidedClasspath', ':patches:testRuntimeClasspath')) {
        $fixture = New-Report
        $fixture.components[0].configurations = @($origin)
        Write-Report $fixture
        Set-Advisory 'HIGH'
        Assert-Fails { Invoke-Gate } '*HIGH*com.example:build-only-tool 1.2.3*build-advisory-exceptions.txt*'
    }
    Write-Report (New-Report)
    Set-Advisory 'CRITICAL'
    Assert-Fails { Invoke-Gate } '*CRITICAL*com.example:build-only-tool 1.2.3*'
    Set-Advisory ''
    Assert-Fails { Invoke-Gate } '*unrated*com.example:build-only-tool 1.2.3*'
    foreach ($severity in @('LOW', 'MODERATE')) {
        Set-Advisory $severity
        $output = @(& { Invoke-Gate } 6>&1) -join ' '
        Assert-True ($output -like '*below high, let through*') "A $severity advisory did not follow the existing reporting policy."
        $cases++
    }
    Set-Advisory 'HIGH'
    Set-Content -LiteralPath $exceptionPath -Encoding ASCII -Value 'CVE-2026-12345 com.example:build-only-tool 2026-10-01 Build input is trusted.'
    $output = @(& { Invoke-Gate } 6>&1) -join ' '
    Assert-True ($output -like '*accepted until 2026-10-01*') 'A current alias exception was not accepted on its last day.'
    $cases++
    Set-Content -LiteralPath $exceptionPath -Encoding ASCII -Value 'CVE-2026-12345 com.example:build-only-tool 2026-09-30 Build input is trusted.'
    Assert-Fails { Invoke-Gate } '*exception ran out on 2026-09-30*'
    Set-Content -LiteralPath $exceptionPath -Encoding ASCII -Value 'CVE-2026-12345 com.example:build-only-tool 2026-12-31 Build input is trusted.'
    Assert-Fails { Invoke-Gate } '*more than 90 days out*'
    Set-Content -LiteralPath $exceptionPath -Encoding ASCII -Value 'CVE-2026-12345 com.example:build-only-tool 2026-12-30 Build input is trusted.'
    Invoke-Gate 6> $null
    $cases++
    $answers = @{ $purl = '{}' }
    Assert-Fails { Invoke-Gate } '*accepts advisories OSV no longer reports*Take them out*'
    Set-Content -LiteralPath $exceptionPath -Value '# no accepted advisories' -Encoding ASCII
    $answers = @{}
    Assert-Fails { Invoke-Gate } '*OSV*Recorded OSV query failure*'
    $answers = @{ $purl = '{"vulns":[{"summary":"missing advisory identity"}]}' }
    Assert-Fails { Invoke-Gate } '*OSV*has no id*'
    Remove-Item -LiteralPath $exceptionPath
    Assert-Fails { Invoke-Gate } '*exception list is missing*'

    $badReports = @(
        @{ Change = { param($r) $r.schemaVersion = 2 }; Pattern = '*schemaVersion 1*' },
        @{ Change = { param($r) $r.gradleVersion = '' }; Pattern = '*resolved Gradle version*' },
        @{ Change = { param($r) $r.configurations = @() }; Pattern = '*nonempty configuration and component arrays*' },
        @{ Change = { param($r) $r.components = @() }; Pattern = '*nonempty configuration and component arrays*' },
        @{ Change = { param($r) $r.configurations += 'settings:classpath' }; Pattern = '*duplicate or invalid configuration*' },
        @{ Change = { param($r) $r.components[0].version = '' }; Pattern = '*without a resolved version*' },
        @{ Change = { param($r) $r.components[0].purl = 'pkg:maven/com.example/build-only-tool@9.9.9' }; Pattern = '*mismatched or duplicate package URL*' },
        @{ Change = { param($r) $r.components += $r.components[0] }; Pattern = '*mismatched or duplicate package URL*' },
        @{ Change = { param($r) $r.components[0].configurations = @() }; Pattern = '*no configuration origin*' },
        @{ Change = { param($r) $r.components[0].configurations = @('unresolved:graph') }; Pattern = '*unknown or duplicate configuration origin*' },
        @{ Change = { param($r) $r.components[0].configurations = @('settings:classpath', 'settings:classpath') }; Pattern = '*unknown or duplicate configuration origin*' }
    )
    foreach ($case in $badReports) {
        $fixture = New-Report
        & $case.Change $fixture
        Write-Report $fixture
        Assert-Fails { Read-BuildDependencyReport $reportPath | Out-Null } $case.Pattern
    }
    Set-Content -LiteralPath $reportPath -Value 'not JSON' -Encoding ASCII
    Assert-Fails { Read-BuildDependencyReport $reportPath | Out-Null } '*not valid JSON*'
    Remove-Item -LiteralPath $reportPath
    Assert-Fails { Read-BuildDependencyReport $reportPath | Out-Null } '*report is missing*buildDependencyReport*'

    # Exercise the resolved values, including mixed Netty versions and the previous settings
    # dependencies. -ResolvedReportPath runs these same checks against Gradle's real output.
    Write-Report (New-ReviewedBuildReport)
    Assert-ReviewedBuildGraph (Read-BuildDependencyReport $reportPath)
    $cases++
    foreach ($oldVersion in @('4.1.93.Final', '4.1.110.Final')) {
        $fixture = New-ReviewedBuildReport
        $fixture.components[1].version = $oldVersion
        $fixture.components[1].purl = 'pkg:maven/io.netty/netty-handler@' + $oldVersion
        Write-Report $fixture
        Assert-Fails { Assert-ReviewedBuildGraph (Read-BuildDependencyReport $reportPath) } '*Netty is not aligned*'
    }
    foreach ($package in @('org.bitbucket.b_c:jose4j', 'org.jdom:jdom2')) {
        $fixture = New-ReviewedBuildReport
        $parts = $package.Split(':')
        $component = $fixture.components | Where-Object { $_.group -eq $parts[0] -and $_.name -eq $parts[1] }
        $component.version = $(if ($component.name -eq 'jose4j') { '0.9.5' } else { '2.0.6' })
        $component.purl = 'pkg:maven/' + $component.group + '/' + $component.name + '@' + $component.version
        Write-Report $fixture
        Assert-Fails { Assert-ReviewedBuildGraph (Read-BuildDependencyReport $reportPath) } "*Settings $package did not resolve exactly*"
    }
    $fixture = New-ReviewedBuildReport
    $fixture.configurations = @('settings:classpath')
    foreach ($component in $fixture.components) { $component.configurations = @('settings:classpath') }
    Write-Report $fixture
    Assert-Fails { Assert-ReviewedBuildGraph (Read-BuildDependencyReport $reportPath) } '*missing the Android host test configuration*'

    # Script-only policy changes resolve and scan dependencies without requiring vendor APKs.
    $repo = Join-Path $testRoot 'repo'
    $buildMarker = Join-Path $testRoot 'build-ran.json'
    $scanMarker = Join-Path $testRoot 'scan-ran.txt'
    New-Item -ItemType Directory -Path (Join-Path $repo 'scripts') -Force | Out-Null
    & git -C $repo init --quiet --initial-branch=main
    if ($LASTEXITCODE -ne 0) { throw 'The policy routing repository could not be initialized.' }
    Set-Content -LiteralPath (Join-Path $repo 'scripts/test-script-contracts.ps1') -Value 'param([string]$Root)' -Encoding ASCII
    $scanner = @('param([string]$Root)',
        "if (-not (Test-Path -LiteralPath '$buildMarker')) { throw 'Scanner ran before report generation.' }",
        "Set-Content -LiteralPath '$scanMarker' -Value `$Root -Encoding ASCII", 'exit 0')
    Set-Content -LiteralPath (Join-Path $repo 'scripts/build-advisories.ps1') -Value $scanner -Encoding ASCII
    $wrapper = Join-Path $testRoot 'record-build.ps1'
    $build = @('param([string]$ProjectDir, [string[]]$Tasks)',
        "@{ ProjectDir = `$ProjectDir; Tasks = `$Tasks; Required = `$env:HUSHTELEGRAM_REQUIRE_FIXTURES } | ConvertTo-Json | Set-Content -LiteralPath '$buildMarker' -Encoding ASCII", 'exit 0')
    Set-Content -LiteralPath $wrapper -Value $build -Encoding ASCII
    $env:HUSHTELEGRAM_SKIP_PRE_PUSH = $null
    $env:HUSHTELEGRAM_FIXTURE_DIR = ' '
    $env:HUSHTELEGRAM_REQUIRE_FIXTURES = 'prior-value'
    $env:HUSHTELEGRAM_BUILD_WRAPPER = $wrapper
    $env:GITHUB_ACTOR = 'contract'
    $env:GITHUB_TOKEN = 'contract'
    $hook = Join-Path $Root 'scripts/pre-push.ps1'
    function Invoke-Hook {
        Remove-Item -LiteralPath $buildMarker, $scanMarker -Force -ErrorAction SilentlyContinue
        $global:LASTEXITCODE = 0
        & $hook -Root $repo -ChangedPaths @('scripts/build-advisory-exceptions.txt') 6> $null
        if ($LASTEXITCODE -ne 0) { throw "The policy push hook exited $LASTEXITCODE." }
    }
    Invoke-Hook
    $built = Get-Content -LiteralPath $buildMarker -Raw | ConvertFrom-Json
    Assert-True (@($built.Tasks).Count -eq 1 -and $built.Tasks[0] -eq ':patches:buildDependencyReport') 'A policy-only push did not request exactly the dependency report.'
    Assert-True ($built.Required -eq 'prior-value' -and $env:HUSHTELEGRAM_REQUIRE_FIXTURES -eq 'prior-value') 'A policy-only push changed fixture enforcement.'
    Assert-True ((Get-Content -LiteralPath $scanMarker -Raw).Trim() -eq $built.ProjectDir -and $built.ProjectDir -ne $repo) 'The scanner was not given the isolated tree that generated its report.'
    Assert-True (-not (Test-Path -LiteralPath $built.ProjectDir) -and
        -not (Test-Path -LiteralPath (Split-Path -Parent $built.ProjectDir))) 'The policy gate left its owned scratch checkout or parent behind.'
    $cases++
    Set-Content -LiteralPath $wrapper -Value ($build[0..1] + 'exit 1') -Encoding ASCII
    Assert-Fails { Invoke-Hook } '*report could not be generated*'
    Assert-True (-not (Test-Path -LiteralPath $scanMarker)) 'A failed build still ran the advisory scanner.'
    Set-Content -LiteralPath $wrapper -Value $build -Encoding ASCII
    Set-Content -LiteralPath (Join-Path $repo 'scripts/build-advisories.ps1') -Value ($scanner[0..2] + 'exit 1') -Encoding ASCII
    Assert-Fails { Invoke-Hook } '*resolved build advisory scan did not pass*'
    Assert-True (Test-Path -LiteralPath $scanMarker) 'The failed-scan case never exercised the scanner.'
    Remove-Item -LiteralPath (Join-Path $repo 'scripts/build-advisories.ps1')
    Assert-Fails { Invoke-Hook } '*build advisory checker is missing*'
} finally {
    foreach ($name in $saved.Keys) { [Environment]::SetEnvironmentVariable($name, $saved[$name], 'Process') }
    foreach ($name in $savedGit.Keys) { [Environment]::SetEnvironmentVariable($name, $savedGit[$name], 'Process') }
    if (Test-Path -LiteralPath $testRoot) { Remove-Item -LiteralPath $testRoot -Recurse -Force }
}
if ($ResolvedReportPath) {
    Assert-ReviewedBuildGraph (Read-BuildDependencyReport $ResolvedReportPath)
    Write-Host '[scripts] resolved Android host/settings dependency remediation graph passed'
}
Write-Host "[scripts] resolved build advisory and push routing contracts passed ($cases cases)"
