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
    # A Gradle outside every recorded advisory, so the library cases below are about the libraries.
    return [ordered]@{
        schemaVersion = 1; gradleVersion = '9.8.1'
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
        if ($library.Version -cne '4.1.140.Final') {
            throw "Android host test Netty is not aligned at 4.1.140.Final: $($library.Purl)"
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
    # Guava up to 33.7.1 has CVE-2026-102554. Every graph this build owns resolves the fixed
    # release. The patcher's own Guava is the Morphe patcher's contract, the one Manager and the
    # CLI run with, so its provided classpath keeps what the patcher asks for and is never rewritten.
    $provided = ':patches:patcherProvidedClasspath'
    $guava = @($Report.Libraries | Where-Object { $_.Group -ceq 'com.google.guava' -and $_.Name -ceq 'guava' })
    if (@($guava | Where-Object { $_.Configurations -contains 'settings:classpath' }).Count -eq 0) {
        throw 'The resolved settings classpath is missing Guava.'
    }
    foreach ($library in $guava) {
        $owned = @($library.Configurations | Where-Object { $_ -cne $provided })
        if ($owned.Count -and $library.Version -notin @('33.7.2-jre', '33.7.2-android')) {
            throw "Guava is not at the reviewed 33.7.2 on $($owned[0]): $($library.Purl)"
        }
    }
}
function New-ReviewedBuildReport {
    $core = ':extensions:telegram:_internal-unified-test-platform-core'
    $emulator = ':extensions:telegram:_internal-unified-test-platform-android-test-plugin-host-emulator-control'
    $modules = [ordered]@{
        'io.netty:netty-common' = '4.1.140.Final'; 'io.netty:netty-handler' = '4.1.140.Final'
        'io.netty:netty-codec-http2' = '4.1.140.Final'; 'org.bitbucket.b_c:jose4j' = '0.9.7'
        'org.jdom:jdom2' = '2.0.6.1'; 'org.jetbrains.kotlin:kotlin-gradle-plugin' = '2.4.20'
        'org.bouncycastle:bcprov-jdk18on' = '1.86'; 'org.bouncycastle:bcpkix-jdk18on' = '1.86'
        'org.bouncycastle:bcutil-jdk18on' = '1.86'
        'com.google.guava:guava' = '33.7.2-jre'
    }
    # The Gradle this repo builds with, outside every recorded advisory, so these cases are about the libraries.
    return [ordered]@{
        schemaVersion = 1; gradleVersion = '9.8.1'; configurations = @('settings:classpath', $core, $emulator)
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

    # An answer that is an object and still no query result is not a clean one. An error object used
    # to read as a library with no advisory and passed the gate. Each shape is refused, with the
    # word to run the check again where OSV is the one in trouble, and never after the line that
    # says OSV has nothing for the resolved libraries.
    function Assert-Refuses([string]$Answer, [string]$Pattern) {
        $script:answers = @{ $purl = $Answer }
        $said = New-Object Collections.Generic.List[string]
        Assert-Fails { Invoke-Gate 6>&1 | ForEach-Object { $said.Add("$_") } } $Pattern
        Assert-True (@($said | Where-Object { $_ -like '*OSV has*' }).Count -eq 0) "The gate reported a result before it refused $Answer."
    }
    foreach ($envelope in @('{"error":"temporarily unavailable"}', '{"code":14,"message":"unavailable","details":[]}',
            '{"results":[]}', '{"vulns":[],"error":"temporarily unavailable"}')) {
        Assert-Refuses $envelope "*$purl*fields a query result does not have*fails closed*run the check again*"
    }
    foreach ($list in @('{"vulns":{}}', '{"vulns":"none"}', '{"vulns":null}', '{"vulns":0}')) {
        Assert-Refuses $list '*vulns that is not a list*fails closed*run the check again*'
    }
    foreach ($token in @('{"vulns":[],"next_page_token":7}', '{"next_page_token":{"page":2}}',
            '{"next_page_token":null}', '{"next_page_token":["p2"]}')) {
        Assert-Refuses $token '*next_page_token that is not text*fails closed*run the check again*'
    }
    foreach ($record in @('{"vulns":["GHSA-aaaa-bbbb-cccc"]}', '{"vulns":[null]}', '{"vulns":[[]]}',
            '{"vulns":[{"id":7}]}', '{"vulns":[{"id":" "}]}')) {
        Assert-Refuses $record '*OSV*advisory that is not a record or has no id*'
    }
    Assert-Refuses '{"vulns":[{"id":"GHSA-aaaa-bbbb-cccc","withdrawn":true}]}' '*GHSA-aaaa-bbbb-cccc withdrawn on something that is not a date*'
    # The script the push gate runs stops on the same answer, so its process ends nonzero.
    $answers = @{ $purl = '{"error":"temporarily unavailable"}' }
    $scannerSaid = New-Object Collections.Generic.List[string]
    Assert-Fails { & (Join-Path $Root 'scripts/build-advisories.ps1') -Root $Root -ReportPath $reportPath `
            -ExceptionsPath $exceptionPath 6>&1 | ForEach-Object { $scannerSaid.Add("$_") } } '*fields a query result does not have*'
    Assert-True ($scannerSaid.Count -eq 0) "The build advisory script reported a result on an error object: $($scannerSaid -join ' / ')"

    # What OSV does send still reads: an empty list, a second page, an advisory its publisher took
    # back, and an answer that never stops paging, which is cut off at twenty pages.
    $answers = @{ $purl = '{"vulns":[]}' }
    $output = @(& { Invoke-Gate } 6>&1) -join ' '
    Assert-True ($output -like '*OSV has no advisory for 1 resolved libraries*') "An empty advisory list was not a clean answer: $output"
    $cases++
    $lowAdvisory = '{"id":"GHSA-aaaa-bbbb-cccc","summary":"Second page fixture.","database_specific":{"severity":"LOW"}}'
    $answers = @{ $purl = '{"vulns":[],"next_page_token":"p2"}'; "$purl page p2" = "{`"vulns`":[$lowAdvisory]}" }
    $asked.Clear()
    $output = @(& { Invoke-Gate } 6>&1) -join ' '
    Assert-True ($output -like '*below high, let through: GHSA-aaaa-bbbb-cccc*' -and ($asked -join ', ') -ceq "$purl, $purl page p2") `
        "The second page of an answer was not read: $output; asked $($asked -join ', ')"
    $cases++
    $answers = @{ $purl = "{`"vulns`":[$($lowAdvisory.Replace('{"id"', '{"withdrawn":"2026-09-01T00:00:00Z","id"'))]}" }
    $output = @(& { Invoke-Gate } 6>&1) -join ' '
    Assert-True ($output -like '*OSV has no advisory for 1 resolved libraries*') "A withdrawn advisory was counted: $output"
    $cases++
    $answers = @{ $purl = '{"next_page_token":"again"}'; "$purl page again" = '{"next_page_token":"again"}' }
    Assert-Fails { Invoke-Gate } '*still paging*after 20 pages*'

    # The build tool. The report names the Gradle that resolved the graph, which no library scan
    # covers: it was read, checked for being there and dropped, and OSV answered {} for Gradle's own
    # advisories. The gate holds it to scripts/build-tool-advisories.txt, the three high records
    # read from Gradle's advisory pages on 2026-10-13 (below 8.14.6, and 9.0.0 through 9.8.0, fixed
    # in 8.14.6 and 9.8.1). An affected Gradle is refused while OSV has nothing against any library,
    # before OSV is asked at all, and with no line saying anything was clear.
    $recorded = @(Read-BuildToolAdvisories -Path (Join-Path $Root 'scripts/build-tool-advisories.txt'))
    $known = @('GHSA-mvvg-497x-hmj8', 'GHSA-xwqc-3h47-hg64', 'GHSA-j5m7-59rp-24f5')
    Assert-True (@($recorded | Where-Object { $_.Advisory -cin $known -and $_.Tool -ceq 'gradle' -and $_.Severity -ceq 'HIGH' -and
            ($_.Fixed -join ',') -ceq '8.14.6,9.8.1' -and (@($_.Affected | ForEach-Object { $_.Text }) -join ',') -ceq '<8.14.6,9.0.0..9.8.0' }).Count -eq 3) `
        'The checked-in build tool list does not hold the three Gradle advisories as their maintainer gives them.'
    $cases++
    function Set-Gradle([string]$Version) {
        $fixture = New-Report
        $fixture.gradleVersion = $Version
        Write-Report $fixture
    }
    function Assert-ToolRefuses([scriptblock]$Gate, [string]$Pattern) {
        $said = New-Object Collections.Generic.List[string]
        $asked.Clear()
        Assert-Fails { & $Gate 6>&1 | ForEach-Object { $said.Add("$_") } } $Pattern
        Assert-True ($said.Count -eq 0 -and $asked.Count -eq 0) "A refused build tool still reported a result or asked OSV: $($said -join ' / '); $($asked -join ', ')"
    }
    $answers = @{ $purl = '{}' }
    foreach ($affected in @('9.7.1', '9.8.0', '9.8', '9.0.0', '9.0', '8.14.5', '8.14', '7.6.4')) {
        Set-Gradle $affected
        Assert-ToolRefuses { Invoke-Gate } ("*ran on gradle $affected,*GHSA-mvvg-497x-hmj8 (HIGH)*GHSA-xwqc-3h47-hg64 (HIGH)*" +
            'GHSA-j5m7-59rp-24f5 (HIGH) covers gradle <8.14.6, 9.0.0..9.8.0 and is fixed in 8.14.6 and 9.8.1*not a library it resolves*')
    }
    # The recorded fixed releases and what follows them pass, on a line of their own that says how
    # much was looked at. The line about the libraries is still only about the libraries, and OSV is
    # asked about the one resolved module and nothing made up for Gradle.
    foreach ($fixed in @('9.8.1', '8.14.6', '8.14.7', '8.15', '9.8.2', '9.9', '10.0.0')) {
        Set-Gradle $fixed
        $asked.Clear()
        $output = @(& { Invoke-Gate } 6>&1 | ForEach-Object { "$_" })
        Assert-True (@($output | Where-Object { $_ -like '*OSV has no advisory for 1 resolved libraries' }).Count -eq 1 -and
            @($output | Where-Object { $_ -like ("*build tool gradle $fixed is outside the high and critical ranges of the " +
                "$($recorded.Count) maintainer advisories recorded for it, last read ????-??-??. Nothing newer was asked about.") }).Count -eq 1) `
            "Gradle $fixed was not passed on a line of its own: $($output -join ' / ')"
        Assert-True (($asked -join ', ') -ceq $purl) "OSV was asked about something other than the resolved module: $($asked -join ', ')"
        $cases++
    }
    # A version that can't be placed in a range is not one known to be outside them all.
    foreach ($unplaced in @('9.9.0-rc-1', '9.9.0-milestone-2', '9.8.1-20261001000000+0000', 'nine', '9', '9.8.1.2', 'v9.8.1')) {
        Set-Gradle $unplaced
        Assert-ToolRefuses { Invoke-Gate } "*gradle '$unplaced', which is not a released version*"
    }
    # A report read some other way that names no tool has nothing to hold to the list.
    Set-Gradle '9.8.1'
    $toolless = Read-BuildDependencyReport $reportPath
    $toolless.Tools = @()
    Assert-ToolRefuses { Invoke-BuildAdvisoryGate -Report $toolless -ExceptionsPath $exceptionPath -Today $today } '*names no build tool*'

    # The list itself, read as strictly as the exception lists. Each of these stops the gate on a
    # Gradle the checked-in list passes.
    $toolList = Join-Path $testRoot 'build-tool-advisories.txt'
    $goodLine = 'GHSA-mvvg-497x-hmj8 gradle HIGH <8.14.6,9.0.0..9.8.0 8.14.6,9.8.1 2026-10-13'
    function Invoke-ToolGate([string[]]$Lines) {
        if ($null -eq $Lines) { Remove-Item -LiteralPath $toolList -Force -ErrorAction SilentlyContinue }
        else { Set-Content -LiteralPath $toolList -Encoding ASCII -Value (@('# build tool fixture') + $Lines) }
        Invoke-BuildAdvisoryGate -Report (Read-BuildDependencyReport $reportPath) -ExceptionsPath $exceptionPath `
            -ToolAdvisoriesPath $toolList -Today $today
    }
    $badLists = @(
        @{ Lines = $null; Pattern = '*build tool advisory list is missing*' },
        @{ Lines = @(); Pattern = '*records nothing for gradle*' },
        @{ Lines = @($goodLine.Replace('GHSA-mvvg-497x-hmj8', 'CVE-2026-12345')); Pattern = '*Line 2*is not "<advisory> <tool>*GHSA id*' },
        @{ Lines = @($goodLine.Replace('GHSA-mvvg-497x-hmj8', 'GHSA-aaaa-bbbb-cccc')); Pattern = '*Line 2*GHSA id*' },
        @{ Lines = @($goodLine.Replace('GHSA-mvvg-497x-hmj8', 'ghsa-mvvg-497x-hmj8')); Pattern = '*Line 2*GHSA id*' },
        @{ Lines = @($goodLine.Replace(' 2026-10-13', '')); Pattern = '*Line 2*is not "<advisory> <tool>*' },
        @{ Lines = @("$goodLine extra"); Pattern = '*Line 2*is not "<advisory> <tool>*' },
        @{ Lines = @($goodLine.Replace(' gradle ', ' maven ')); Pattern = '*names the tool maven*' },
        @{ Lines = @($goodLine.Replace(' HIGH ', ' SEVERE ')); Pattern = '*rates GHSA-mvvg-497x-hmj8 SEVERE*' },
        @{ Lines = @($goodLine.Replace(' HIGH ', ' high ')); Pattern = '*rates GHSA-mvvg-497x-hmj8 high*' },
        @{ Lines = @($goodLine.Replace('<8.14.6,', '8.14.6,')); Pattern = '*affected range 8.14.6, which is neither*' },
        @{ Lines = @($goodLine.Replace('<8.14.6,', '<=8.14.6,')); Pattern = '*affected range <=8.14.6*' },
        @{ Lines = @($goodLine.Replace('<8.14.6,', '<8.x,')); Pattern = '*affected range <8.x*' },
        @{ Lines = @($goodLine.Replace('<8.14.6,', '>=7.0,')); Pattern = '*affected range >=7.0*' },
        @{ Lines = @($goodLine.Replace('9.0.0..9.8.0', '9.8.0..9.0.0')); Pattern = '*affected range 9.8.0..9.0.0*' },
        @{ Lines = @($goodLine.Replace('9.0.0..9.8.0', '9.0.0..')); Pattern = '*affected range 9.0.0..,*' },
        @{ Lines = @($goodLine.Replace('9.0.0..9.8.0', '9.0.0..9.8.0-rc-1')); Pattern = '*affected range 9.0.0..9.8.0-rc-1*' },
        @{ Lines = @($goodLine.Replace('<8.14.6,9.0.0..9.8.0', '<8.14.6,,9.0.0..9.8.0')); Pattern = '*affected range , which is neither*' },
        @{ Lines = @($goodLine.Replace(' 8.14.6,9.8.1 ', ' 8.14.5,9.8.1 ')); Pattern = '*calls 8.14.5 fixed for GHSA-mvvg-497x-hmj8, inside the range*' },
        @{ Lines = @($goodLine.Replace(' 8.14.6,9.8.1 ', ' 8.14.6,9.8.0 ')); Pattern = '*calls 9.8.0 fixed*' },
        @{ Lines = @($goodLine.Replace(' 8.14.6,9.8.1 ', ' 8.14.6,later ')); Pattern = '*fixed version later, which is not a released version*' },
        @{ Lines = @($goodLine.Replace('2026-10-13', '2026-13-40')); Pattern = '*read on 2026-13-40, which isn''t a yyyy-MM-dd date*' },
        @{ Lines = @($goodLine.Replace('2026-10-13', 'yesterday')); Pattern = '*read on yesterday*' },
        @{ Lines = @($goodLine, $goodLine); Pattern = '*Line 3*records GHSA-mvvg-497x-hmj8 for gradle a second time*' },
        @{ Lines = @($goodLine, ('# ' + ('x' * 70000))); Pattern = '*over 64 KB*' })
    foreach ($bad in $badLists) {
        $lines = $bad.Lines
        Assert-ToolRefuses { Invoke-ToolGate $lines } $bad.Pattern
    }
    # A list of another shape still decides by its own records: a moderate one is let through and
    # said so, a critical one refuses, and a range that stops short of the build leaves it alone.
    $output = @(& { Invoke-ToolGate @('GHSA-2222-3333-4444 gradle MODERATE 9.8.1..9.8.1 9.8.2 2026-10-01',
        'GHSA-5555-6666-7777 gradle CRITICAL <9.8.1 9.8.1 2026-10-02') } 6>&1 | ForEach-Object { "$_" }) -join "`n"
    Assert-True ($output -like ('*build tool, below high, let through: GHSA-2222-3333-4444 (MODERATE) covers gradle 9.8.1..9.8.1*' +
        'of the 2 maintainer advisories recorded for it, last read 2026-10-01.*')) "A moderate build tool advisory was not let through and said: $output"
    $cases++
    Assert-ToolRefuses { Invoke-ToolGate @('GHSA-5555-6666-7777 gradle CRITICAL 9.8.1..9.8.1 9.8.2 2026-10-02') } `
        '*ran on gradle 9.8.1,*GHSA-5555-6666-7777 (CRITICAL)*fixed in 9.8.2*'

    # The script the push gate starts, on its own default list: refused on 9.7.1 and passed on 9.8.1.
    $answers = @{ $purl = '{}' }
    Set-Gradle '9.7.1'
    Assert-ToolRefuses { & (Join-Path $Root 'scripts/build-advisories.ps1') -Root $Root -ReportPath $reportPath -ExceptionsPath $exceptionPath } `
        '*ran on gradle 9.7.1,*GHSA-mvvg-497x-hmj8*GHSA-xwqc-3h47-hg64*GHSA-j5m7-59rp-24f5*'
    Set-Gradle '9.8.1'
    $output = @(& (Join-Path $Root 'scripts/build-advisories.ps1') -Root $Root -ReportPath $reportPath -ExceptionsPath $exceptionPath 6>&1 |
        ForEach-Object { "$_" }) -join "`n"
    Assert-True ($output -like '*OSV has no advisory for 1 resolved libraries*build tool gradle 9.8.1 is outside the high and critical ranges*') `
        "The build advisory script did not pass Gradle 9.8.1: $output"
    $cases++
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

    # Guava: the patcher's provided copy keeps the patcher's version, every owned graph the fixed one.
    function Add-Guava($Fixture, [string]$Version, [string[]]$Configurations) {
        $Fixture.components += [ordered]@{ group = 'com.google.guava'; name = 'guava'; version = $Version
            purl = "pkg:maven/com.google.guava/guava@$Version"; configurations = $Configurations }
        $Fixture.configurations = @($Fixture.configurations + $Configurations | Select-Object -Unique)
    }
    $fixture = New-ReviewedBuildReport
    Add-Guava $fixture '33.5.0-jre' @(':patches:patcherProvidedClasspath')
    Add-Guava $fixture '33.7.2-android' @(':extensions:telegram:debugUnitTestRuntimeClasspath')
    Write-Report $fixture
    Assert-ReviewedBuildGraph (Read-BuildDependencyReport $reportPath)
    $cases++
    foreach ($owned in @('settings:classpath', ':extensions:telegram:debugUnitTestRuntimeClasspath', ':patches:testRuntimeClasspath',
            ':extensions:telegram:_internal-unified-test-platform-core')) {
        $fixture = New-ReviewedBuildReport
        Add-Guava $fixture '33.7.1-jre' @($owned)
        Write-Report $fixture
        Assert-Fails { Assert-ReviewedBuildGraph (Read-BuildDependencyReport $reportPath) } "*Guava is not at the reviewed 33.7.2 on $owned*"
    }
    # A version shared by the provided classpath and an owned one is still the owned graph's.
    $fixture = New-ReviewedBuildReport
    Add-Guava $fixture '33.5.0-jre' @(':patches:patcherProvidedClasspath', 'settings:classpath')
    Write-Report $fixture
    Assert-Fails { Assert-ReviewedBuildGraph (Read-BuildDependencyReport $reportPath) } '*Guava is not at the reviewed 33.7.2 on settings:classpath*'
    $fixture = New-ReviewedBuildReport
    $fixture.components = @($fixture.components | Where-Object { $_.name -ne 'guava' })
    Write-Report $fixture
    Assert-Fails { Assert-ReviewedBuildGraph (Read-BuildDependencyReport $reportPath) } '*settings classpath is missing Guava*'

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

    # The push gate with the real scanner in the pushed tree. A push that moves only the build tool
    # list is one that resolves the report and scans it, and a report naming Gradle 9.7.1 ends the
    # scanner's own process nonzero before OSV is asked, so the case needs no network. What the
    # scanner said comes back through the hook, wrapped however that shell wraps an error.
    foreach ($name in @('build-advisories.ps1', 'release-advisories.ps1', 'build-tool-advisories.txt', 'build-advisory-exceptions.txt')) {
        Copy-Item -LiteralPath (Join-Path $Root "scripts/$name") -Destination (Join-Path $repo "scripts/$name") -Force
    }
    Set-Content -LiteralPath $wrapper -Encoding ASCII -Value @('param([string]$ProjectDir, [string[]]$Tasks)',
        '$reports = Join-Path $ProjectDir ''patches/build/dependency-reports''',
        'New-Item -ItemType Directory -Path $reports -Force | Out-Null',
        "Copy-Item -LiteralPath '$reportPath' -Destination (Join-Path `$reports 'build-dependencies.json')", 'exit 0')
    Set-Gradle '9.7.1'
    $hookSaid = New-Object Collections.Generic.List[string]
    Assert-Fails { & $hook -Root $repo -ChangedPaths @('scripts/build-tool-advisories.txt') 6>&1 |
            ForEach-Object { $hookSaid.Add("$_") } } '*resolved build advisory scan did not pass*'
    $hookText = ($hookSaid -join '') -replace '\s', ''
    foreach ($named in @('9.7.1') + $known) {
        Assert-True ($hookText.Contains($named)) "The push gate's scanner did not refuse Gradle 9.7.1 by $named`: $($hookSaid -join ' / ')"
    }
    Assert-True (-not $hookText.Contains('OSVhas') -and -not $hookText.Contains('isoutsidethehigh')) `
        "The push gate's scanner reported a clear result for Gradle 9.7.1: $($hookSaid -join ' / ')"
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
