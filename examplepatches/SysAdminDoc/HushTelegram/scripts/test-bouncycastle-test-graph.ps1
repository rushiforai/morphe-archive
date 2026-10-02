<#
.SYNOPSIS
    Run the real build-report/unit-test review in both orders and reject unreviewed requests.
.DESCRIPTION
    Requires the normal Gradle SDK, JDK and package-reader environment. Temporary init scripts
    add dependencies only to these test invocations; no project source or dependency pin changes.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
$Root = [IO.Path]::GetFullPath($Root)
$gradle = Join-Path $Root 'gradlew.bat'
if (-not (Test-Path -LiteralPath $gradle -PathType Leaf)) { throw "Gradle wrapper missing: $gradle" }
$temp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\', '/')
$testRoot = [IO.Path]::GetFullPath((Join-Path $temp ('hushtelegram-bc-review-' + [guid]::NewGuid().ToString('N'))))
if ([IO.Path]::GetDirectoryName($testRoot) -ine $temp) { throw 'The review fixture escaped the temporary directory.' }
New-Item -ItemType Directory -Path $testRoot | Out-Null
$reportTask = ':patches:buildDependencyReport'
$reviewTask = ':extensions:telegram:verifyBouncyCastleTestGraph'

function Invoke-ReviewCase([string]$Name, [string[]]$Tasks, [string]$ExpectedFailure) {
    $log = Join-Path $testRoot ($Name + '.log')
    $savedErrorAction = $ErrorActionPreference
    try {
        # Expected native failures must reach the exit-code and exact-error assertions below.
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = 0
        & $gradle -p $Root @Tasks --console=plain --dependency-verification strict *> $log
        $code = $LASTEXITCODE
    } finally { $ErrorActionPreference = $savedErrorAction }
    $output = Get-Content -LiteralPath $log -Raw
    if ($ExpectedFailure) {
        if ($code -eq 0 -or $output -notmatch $ExpectedFailure) {
            throw "${Name}: expected the request-review rejection, got exit ${code}.`n$output"
        }
    } elseif ($code -ne 0 -or $output -notmatch 'Bouncy Castle in debugUnitTestRuntimeClasspath:') {
        throw "${Name}: the resolved unit-test graph did not pass, exit ${code}.`n$output"
    }
    Write-Host "[bc-review] $Name passed"
}

try {
    $versioned = Join-Path $testRoot 'unreviewed-version.init.gradle'
    $versionless = Join-Path $testRoot 'unreviewed-versionless.init.gradle'
    $template = @'
allprojects { candidate ->
    if (candidate.path == ':extensions:telegram') {
        candidate.afterEvaluate {
            candidate.dependencies.add('testImplementation', '__DEPENDENCY__')
        }
    }
}
'@
    [IO.File]::WriteAllText($versioned,
        $template.Replace('__DEPENDENCY__', 'org.bouncycastle:bcprov-jdk18on:1.79'), [Text.UTF8Encoding]::new($false))
    [IO.File]::WriteAllText($versionless,
        $template.Replace('__DEPENDENCY__', 'org.bouncycastle:bcutil-jdk18on'), [Text.UTF8Encoding]::new($false))
    Invoke-ReviewCase 'report-first' @($reportTask, $reviewTask) ''
    Invoke-ReviewCase 'review-first' @($reviewTask, $reportTask) ''
    Invoke-ReviewCase 'unreviewed-unit-version' @($reportTask, $reviewTask, '--init-script', $versioned) `
        'The test graph now asks for Bouncy Castle 1[.]79, which nobody has reviewed'
    Invoke-ReviewCase 'unreviewed-versionless-unit-module' @($reviewTask, $reportTask, '--init-script', $versionless) `
        'bcutil-jdk18on with no version of its own'
    Write-Host '[bc-review] real Gradle request-review contracts passed (4 cases)'
} finally {
    if (Test-Path -LiteralPath $testRoot) {
        $cleanupRoot = [IO.Path]::GetFullPath((Resolve-Path -LiteralPath $testRoot).Path)
        if ([IO.Path]::GetDirectoryName($cleanupRoot) -ine $temp) { throw 'Refusing review-fixture cleanup outside temp.' }
        Remove-Item -LiteralPath $cleanupRoot -Recurse -Force
    }
}
exit 0
