<#
.SYNOPSIS
    Check real test cache reuse and invalidation in isolated copies of the project.
#>
[CmdletBinding()]
param([string]$Root, [string]$Java, [string]$FixtureDir)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
$Root = (Resolve-Path -LiteralPath $Root).Path
if (-not $FixtureDir) { $FixtureDir = $env:HUSHTELEGRAM_FIXTURE_DIR }
if (-not $FixtureDir) { $FixtureDir = Join-Path $Root 'fixtures' }
$FixtureDir = (Resolve-Path -LiteralPath $FixtureDir).Path
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
$Java = Resolve-Java -Explicit $Java
$env:JAVA_HOME = Split-Path -Parent (Split-Path -Parent $Java)
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
[System.Diagnostics.Process]::GetCurrentProcess().PriorityClass = 'BelowNormal'
if (-not $env:GITHUB_ACTOR) { $env:GITHUB_ACTOR = 'SysAdminDoc' }
if (-not $env:GITHUB_TOKEN) {
    $env:GITHUB_TOKEN = (& gh auth token 2>$null)
    if ($LASTEXITCODE -ne 0 -or -not $env:GITHUB_TOKEN) { throw 'GitHub package authentication is unavailable.' }
}

$taskTemp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$work = Join-Path $taskTemp ('hushtelegram-test-cache-' + [guid]::NewGuid().ToString('N'))
$cases = @('first', 'relocated')
$tasks = @(':patches:test', '--tests', 'app.morphe.FixtureDexCensusTest',
    ':extensions:telegram:testDebugUnitTest', '--tests', 'app.hushtelegram.extension.shared.settings.SettingsJsonPropertyTest',
    '--build-cache', '--max-workers=2', '--console=plain')

function Invoke-CacheStep {
    param([string]$Case, [string]$Label, [string[]]$States = @('', ''))
    $project = Join-Path $work $Case
    $previousError = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $PSNativeCommandUseErrorActionPreference = $false
        $output = @(& (Join-Path $project 'gradlew.bat') -p $project @tasks 2>&1 | ForEach-Object { "$_" })
        $code = $LASTEXITCODE
    } finally { $ErrorActionPreference = $previousError }
    $text = $output -join "`n"
    if ($code -ne 0) { throw "$Label failed (exit $code).`n$text" }
    $testTasks = @(':patches:test', ':extensions:telegram:testDebugUnitTest')
    for ($index = 0; $index -lt $testTasks.Count; $index++) {
        $task = $testTasks[$index]
        $line = [regex]::Match($text, '(?m)^> Task ' + [regex]::Escape($task) + '(?: ([A-Z-]+))?\r?$')
        if (-not $line.Success) { throw "$Label did not report $task.`n$text" }
        if ($line.Groups[1].Value -ne $States[$index]) { throw "$Label reported an unexpected state for $task.`n$text" }
    }
    foreach ($results in @('patches/build/test-results/test', 'extensions/telegram/build/test-results/testDebugUnitTest')) {
        $count = 0
        foreach ($file in Get-ChildItem -LiteralPath (Join-Path $project $results) -Filter 'TEST-*.xml' -File) {
            [xml]$xml = Get-Content -LiteralPath $file.FullName -Raw
            $suite = $xml.testsuite
            if ([int]$suite.failures -or [int]$suite.errors -or [int]$suite.skipped) { throw "$Label has failed or skipped tests." }
            $count += [int]$suite.tests
        }
        $expected = if ($results.StartsWith('patches/')) { 7 } else { 4 }
        if ($count -ne $expected) { throw "$Label reported $count tests in $results, expected $expected." }
    }
    Write-Host "[cache] $Label passed (7 patch and 4 parser tests; states=$($States -join ','))."
}

try {
    New-Item -ItemType Directory -Path $work | Out-Null
    $names = @(& git -C $Root ls-files)
    if ($LASTEXITCODE -ne 0 -or -not $names) { throw 'Could not enumerate tracked project inputs.' }
    foreach ($case in $cases) {
        foreach ($name in ($names + 'local.properties')) {
            $source = Join-Path $Root $name
            if (-not (Test-Path -LiteralPath $source -PathType Leaf)) { continue }
            $destination = Join-Path (Join-Path $work $case) $name
            [void][IO.Directory]::CreateDirectory((Split-Path -Parent $destination))
            [IO.File]::Copy($source, $destination)
        }
    }
    $fixtures = Join-Path $work 'fixtures'
    [void][IO.Directory]::CreateDirectory($fixtures)
    $apks = @(Get-ChildItem -LiteralPath $FixtureDir -File -Filter '*.apk')
    if (-not $apks) { throw 'The cache probe requires the retained APK fixtures.' }
    foreach ($apk in $apks) { [IO.File]::Copy($apk.FullName, (Join-Path $fixtures $apk.Name)) }
    $env:HUSHTELEGRAM_FIXTURE_DIR = $fixtures
    $control = Join-Path $fixtures 'cache-control.bin'
    [IO.File]::WriteAllBytes($control, [byte[]](0, 13, 10, 255, 1))
    # Unique declared inputs prevent a result from a prior probe satisfying either first run.
    $marker = "`nCache input control $([guid]::NewGuid().ToString('N')).`n"
    foreach ($case in $cases) {
        $project = Join-Path $work $case
        [IO.File]::AppendAllText((Join-Path $project 'README.md'), $marker)
        $patch = Join-Path $project 'patches/src/main/kotlin/app/morphe/patches/telegram/misc/firebase/RepairFirebasePushPatch.kt'
        [IO.File]::AppendAllText($patch, "`n// $($marker.Trim())`n")
    }
    Invoke-CacheStep -Case first -Label 'initial inputs'
    $relocated = Join-Path $work 'relocated'
    foreach ($name in $names) {
        if ($name -notin @('README.md', 'NOTICE', 'patches-list.json', 'provenance.json', 'scripts/injected-mutation-contracts.txt') -and $name -notmatch '/src/main/.*\.(java|kt|tsv|xml)$') { continue }
        $path = Join-Path $relocated $name
        $text = [IO.File]::ReadAllText($path).Replace("`r`n", "`n").Replace("`n", "`r`n")
        [IO.File]::WriteAllText($path, $text, [Text.UTF8Encoding]::new($false))
    }
    Invoke-CacheStep -Case relocated -Label 'relocated LF/CRLF equivalents' -States @('FROM-CACHE', 'FROM-CACHE')
    $source = Join-Path $relocated 'patches/src/main/kotlin/app/morphe/patches/telegram/misc/firebase/RepairFirebasePushPatch.kt'
    $text = [IO.File]::ReadAllText($source)
    $changed = $text.Replace('enableStatus("repairFirebasePush")', 'enableStatus("repairFirebasePushCacheControl")')
    if ($changed -eq $text) { throw 'The source invalidation control did not change its target.' }
    [IO.File]::WriteAllText($source, $changed)
    Invoke-CacheStep -Case relocated -Label 'changed semantic source'
    [IO.File]::WriteAllBytes($control, [byte[]](0, 10, 255, 1))
    # Only patch tests consume the APK directory. Parser tests should keep their valid result.
    Invoke-CacheStep -Case relocated -Label 'changed binary fixture bytes' -States @('', 'UP-TO-DATE')
} finally {
    $safe = [IO.Path]::GetFullPath($work)
    if (-not $safe.StartsWith($taskTemp, [StringComparison]::OrdinalIgnoreCase) -or $safe -eq $taskTemp) {
        throw 'Refusing cache-probe cleanup outside its unique temporary directory.'
    }
    if (Test-Path -LiteralPath $safe) { Remove-Item -LiteralPath $safe -Recurse -Force }
}
