<#
.SYNOPSIS
Runs Gradle verification in a fresh directory and removes its intermediate files.
.DESCRIPTION
Final libraries, reports, test results, gradle.log and summary.json remain under
build/verification/<run>. Existing build folders, fixtures and caches are untouched.
Use -KeepBuildOutputs to retain intermediate files for investigation.
.EXAMPLE
.\Verify-Build.ps1 -Tasks ':patches:test',':patches:buildAndroid' -GradleArguments '--offline'
#>
[CmdletBinding()]
param(
    [string[]]$Tasks = @(':patches:test', ':patches:buildAndroid'),
    [string[]]$GradleArguments = @(),
    [switch]$KeepBuildOutputs
)
$ErrorActionPreference = 'Stop'
$repo = [IO.Path]::GetFullPath($PSScriptRoot).TrimEnd('\', '/')
$protectedNames = @('.git', '.github', '.codex', '.agents')

function Assert-SafePath([string]$Path, [string]$Boundary) {
    $full = [IO.Path]::GetFullPath($Path)
    $prefix = [IO.Path]::GetFullPath($Boundary).TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar
    if (!$full.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Path is outside the owned directory: $full"
    }
    $cursor = $full
    while ($cursor) {
        if (Test-Path -LiteralPath $cursor) {
            $item = Get-Item -LiteralPath $cursor -Force
            if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
                throw "Refusing a reparse point: $cursor"
            }
        }
        if ($protectedNames -contains [IO.Path]::GetFileName($cursor)) {
            throw "Refusing a protected path: $cursor"
        }
        $cursor = [IO.Path]::GetDirectoryName($cursor)
    }
    return $full
}

function Assert-SafeTree([string]$Path, [string]$Boundary) {
    $null = Assert-SafePath $Path $Boundary
    $pending = [Collections.Generic.Stack[string]]::new()
    $pending.Push($Path)
    while ($pending.Count) {
        $current = $pending.Pop()
        foreach ($item in Get-ChildItem -LiteralPath $current -Force) {
            if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -or
                ($protectedNames -contains $item.Name)) {
                throw "Refusing unsafe generated content: $($item.FullName)"
            }
            if ($item.PSIsContainer) { $pending.Push($item.FullName) }
        }
    }
}

$allowedTasks = @('build', 'buildAndroid', 'test', 'check', 'assemble',
    'auditOledDecodedCompatibility', 'auditSdr10ShaderAssemble',
    'auditDecodedSteamLinkPatches', 'auditSteamLink2363Native')
if (!$Tasks.Count) { throw 'Specify at least 1 verification task.' }
$qualifiedTasks = foreach ($task in $Tasks) {
    $name = $task -creplace '^:patches:', ''
    if ($allowedTasks -cnotcontains $name) { throw "Unsupported verification task: $task" }
    ":patches:$name"
}
# Restrict extra arguments to diagnostic/build flags. Project paths, init scripts,
# extra tasks and property overrides could defeat ownership of scratch outputs.
$allowedArguments = @('--offline', '--stacktrace', '--full-stacktrace', '--info',
    '--debug', '--warn', '--quiet', '--rerun-tasks', '--no-build-cache',
    '--no-configuration-cache', '--refresh-dependencies', '--continue',
    '--console=plain', '--warning-mode=all', '--warning-mode=fail')
foreach ($argument in $GradleArguments) {
    if ($allowedArguments -cnotcontains $argument) {
        throw "Unsupported Gradle argument: $argument. Only diagnostic/build flags are accepted."
    }
}
$gradlew = Join-Path $repo 'gradlew.bat'
if (!(Test-Path -LiteralPath $gradlew -PathType Leaf)) { throw "Gradle wrapper missing: $gradlew" }
$run = Assert-SafePath (Join-Path $repo ('build/verification/' + [guid]::NewGuid().ToString('N'))) $repo
if (Test-Path -LiteralPath $run) { throw "Verification directory already exists: $run" }
$null = New-Item -ItemType Directory -Path $run
$scratch = Assert-SafePath (Join-Path $run 'scratch') $run
$null = New-Item -ItemType Directory -Path $scratch
$log = Join-Path $run 'gradle.log'
$null = New-Item -ItemType File -Path $log
$started = [DateTime]::UtcNow
$buildFailure = $null
$cleanupFailure = $null
$gradleExitCode = $null
$removedBytes = [long]0
$preserved = @()
$cleanupStatus = 'retained'
Write-Host "Verification output: $run"
try {
    $arguments = @($qualifiedTasks) + @("-PverificationWorkDirectory=$scratch", '--no-daemon', '--console=plain') + $GradleArguments
    Push-Location -LiteralPath $repo
    $previousPreference = $ErrorActionPreference
    try {
        # Windows PowerShell surfaces native stderr as ErrorRecord. Convert it to
        # text without treating normal Gradle progress as a terminating failure.
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = $null
        & $gradlew @arguments 2>&1 | ForEach-Object {
            $line = "$_"
            $line | Out-File -LiteralPath $log -Append -Encoding utf8 -ErrorAction Stop
            Write-Output $line
        }
        $gradleExitCode = $global:LASTEXITCODE
    } finally {
        $ErrorActionPreference = $previousPreference
        Pop-Location
    }
    if ($gradleExitCode -ne 0) { throw "Gradle failed with exit code $gradleExitCode. Log: $log" }
} catch {
    $buildFailure = $_
} finally {
    try {
        Assert-SafeTree $scratch $run
        foreach ($category in @('libs', 'reports', 'test-results')) {
            $source = Assert-SafePath (Join-Path $scratch "patches/$category") $scratch
            if (!(Test-Path -LiteralPath $source)) { continue }
            if (!(Test-Path -LiteralPath $source -PathType Container)) {
                throw "Expected an output directory: $source"
            }
            $destination = Assert-SafePath (Join-Path $run "artifacts/patches/$category") $run
            if (Test-Path -LiteralPath $destination) { throw "Artifact destination already exists: $destination" }
            $null = New-Item -ItemType Directory -Force -Path (Split-Path -Parent $destination)
            # Preserve without moving outputs when the caller requested inspection.
            if ($KeepBuildOutputs) {
                Copy-Item -LiteralPath $source -Destination $destination -Recurse -ErrorAction Stop
            } else {
                Move-Item -LiteralPath $source -Destination $destination -ErrorAction Stop
            }
            $preserved += $destination
        }
        # GLSL sources and their report are compact evidence used by the subsequent
        # strict syntax check, so retain complete shader-audit directories.
        foreach ($audit in Get-ChildItem -LiteralPath $scratch -Directory -Force -Filter 'sdr10-shader-assemble-*') {
            if ($audit.Name -cnotmatch '^sdr10-shader-assemble-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$') {
                throw "Unexpected shader audit directory: $($audit.FullName)"
            }
            $source = Assert-SafePath $audit.FullName $scratch
            $destination = Assert-SafePath (Join-Path $run "artifacts/audits/$($audit.Name)") $run
            if (Test-Path -LiteralPath $destination) { throw "Artifact destination already exists: $destination" }
            $null = New-Item -ItemType Directory -Force -Path (Split-Path -Parent $destination)
            if ($KeepBuildOutputs) {
                Copy-Item -LiteralPath $source -Destination $destination -Recurse -ErrorAction Stop
            } else {
                Move-Item -LiteralPath $source -Destination $destination -ErrorAction Stop
            }
            $preserved += $destination
        }
        if (!$KeepBuildOutputs) {
            Assert-SafeTree $scratch $run
            $files = Get-ChildItem -LiteralPath $scratch -File -Recurse -Force
            $bytes = ($files | Measure-Object -Property Length -Sum).Sum
            Remove-Item -LiteralPath $scratch -Recurse -Force -ErrorAction Stop
            if (Test-Path -LiteralPath $scratch) { throw "Scratch directory remains: $scratch" }
            $removedBytes = [long]$bytes
            $cleanupStatus = 'removed'
        }
    } catch {
        $cleanupFailure = $_
        $cleanupStatus = 'retained-after-error'
        Write-Warning "Intermediate output retained or cleanup incomplete: $($_.Exception.Message)"
    }
    try {
        $null = Assert-SafePath (Join-Path $run 'summary.json') $run
        [ordered]@{
            startedUtc = $started.ToString('o')
            finishedUtc = [DateTime]::UtcNow.ToString('o')
            tasks = @($qualifiedTasks)
            gradleArguments = @($GradleArguments)
            gradleExitCode = $gradleExitCode
            buildSucceeded = ($null -eq $buildFailure)
            buildFailure = if ($buildFailure) { $buildFailure.Exception.Message } else { $null }
            cleanup = $cleanupStatus
            cleanupFailure = if ($cleanupFailure) { $cleanupFailure.Exception.Message } else { $null }
            removedBytes = $removedBytes
            preservedOutputs = @($preserved)
            log = $log
            scratch = $scratch
            validation = 'Gradle build/audit only; no APK installation or device runtime validation.'
        } | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $run 'summary.json') -Encoding utf8
    } catch {
        if (!$cleanupFailure) { $cleanupFailure = $_ }
        Write-Warning "Could not write verification summary: $($_.Exception.Message)"
    }
}
if ($buildFailure) { throw $buildFailure }
if ($cleanupFailure) { throw $cleanupFailure }
Write-Host "Verification succeeded. Cleanup: $cleanupStatus; removed $removedBytes bytes. Results: $run"
