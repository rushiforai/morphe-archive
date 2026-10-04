<#
.SYNOPSIS
    Exercise concurrent local pushes and manual gates through the real hook.
.DESCRIPTION
    Temporary commits, a local bare remote and recording checks prove isolation without
    starting Gradle or using a device. Both builds must enter before either may finish.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'patch-target.ps1')
$hook = Join-Path $Root 'scripts/pre-push.ps1'
$shell = (Get-Process -Id $PID).Path
$temp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\', '/')
$testRoot = [IO.Path]::GetFullPath((Join-Path $temp ('hushtelegram-concurrency-' + [guid]::NewGuid().ToString('N'))))
if ([IO.Path]::GetDirectoryName($testRoot) -ine $temp) { throw 'The concurrency fixture is outside the temporary directory.' }
$repo = Join-Path $testRoot 'repo'
$remote = Join-Path $testRoot 'remote.git'
$other = Join-Path $testRoot 'unrelated'
$fixtures = Join-Path $testRoot 'fixtures'
$records = Join-Path $testRoot 'records'
$processes = New-Object System.Collections.Generic.List[object]
$savedGit = @{}
foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
    $savedGit[$variable.Name] = $variable.Value
    Remove-Item -LiteralPath ('Env:\' + $variable.Name)
}

function Assert-True([bool]$Condition, [string]$Message) { if (-not $Condition) { throw $Message } }
function Invoke-TestGit([string[]]$Arguments) {
    $preference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try { $output = @(& git @Arguments 2>&1) } finally { $ErrorActionPreference = $preference }
    if ($LASTEXITCODE -ne 0) { throw "Fixture git failed: $($output -join ' ')" }
    return $output
}
function Start-Gate([string]$Case, [string[]]$Arguments, [string]$Failure = '') {
    $info = New-Object System.Diagnostics.ProcessStartInfo
    $info.FileName = if ($Arguments[0] -eq '-C') { (Get-Command git -CommandType Application | Select-Object -First 1).Source } else { $shell }
    $info.Arguments = (@($Arguments | ForEach-Object { '"' + $_.Replace('"', '\"') + '"' }) -join ' ')
    $info.UseShellExecute = $false
    $info.CreateNoWindow = $true
    $info.RedirectStandardOutput = $true
    $info.RedirectStandardError = $true
    $info.EnvironmentVariables['HUSHTELEGRAM_SKIP_PRE_PUSH'] = ''
    $info.EnvironmentVariables['HUSHTELEGRAM_BUILD_WRAPPER'] = $wrapper
    $info.EnvironmentVariables['HUSHTELEGRAM_FIXTURE_DIR'] = $fixtures
    $info.EnvironmentVariables['HUSHTELEGRAM_REQUIRE_FIXTURES'] = 'prior-value'
    $info.EnvironmentVariables['GITHUB_ACTOR'] = 'fixture-test'
    $info.EnvironmentVariables['GITHUB_TOKEN'] = 'fixture-test'
    $info.EnvironmentVariables['HUSHTELEGRAM_GATE_RECORDS'] = $records
    $info.EnvironmentVariables['HUSHTELEGRAM_GATE_UNRELATED'] = $other
    $info.EnvironmentVariables['HUSHTELEGRAM_GATE_CASE'] = $Case
    $info.EnvironmentVariables['HUSHTELEGRAM_GATE_FAILURE'] = $Failure
    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $info
    Assert-True ($process.Start()) 'A gate fixture process did not start.'
    $job = [pscustomobject]@{ Process = $process; Output = $process.StandardOutput.ReadToEndAsync();
        Error = $process.StandardError.ReadToEndAsync(); Case = $Case }
    $processes.Add($job)
    return $job
}
function Wait-Starts([string]$Case, [int]$Count = 1) {
    $clock = [Diagnostics.Stopwatch]::StartNew()
    do {
        $files = @(Get-ChildItem -LiteralPath $records -Filter "start-$Case-*.json" -File)
        if ($files.Count -eq $Count) { return @($files | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw | ConvertFrom-Json }) }
        $job = $processes | Where-Object { $_.Case -eq $Case } | Select-Object -Last 1
        if ($job -and $job.Process.HasExited) {
            throw "Gate $Case exited before entering its build: $($job.Output.Result)$($job.Error.Result)"
        }
        Start-Sleep -Milliseconds 25
    } while ($clock.Elapsed.TotalSeconds -lt 30)
    throw "Both independent builds did not enter concurrently. Missing start record for $Case."
}
function Finish-Gate($Job, [int]$ExpectedExit) {
    Assert-True ($Job.Process.WaitForExit(45000)) "Gate $($Job.Case) did not finish within 45 seconds."
    $message = $Job.Output.Result + $Job.Error.Result
    if ($ExpectedExit -eq 0) {
        Assert-True ($Job.Process.ExitCode -eq 0) "Gate $($Job.Case) failed: $message"
    } else {
        Assert-True ($Job.Process.ExitCode -ne 0 -and $message -like '*release facts do not agree*') "Gate $($Job.Case) did not refuse failed facts: $message"
    }
}
function Assert-Cleaned([object[]]$Starts, [string[]]$ActiveRoots = @()) {
    foreach ($start in $Starts) {
        Assert-True (-not (Test-Path -LiteralPath $start.Root)) "An owned checkout survived its gate: $($start.Root)"
        Assert-True (-not (Test-Path -LiteralPath (Split-Path -Parent $start.Root))) 'An owned scratch parent survived its gate.'
        Assert-True ($start.Root -ne $repo -and $start.Required -eq '1' -and $start.FixtureDir -eq $fixtures) 'A build used the source checkout or lost its required fixtures.'
        foreach ($task in @(':patches:buildDependencyReport', ':patches:test', ':extensions:telegram:test',
                ':extensions:shared:library:lint', ':extensions:telegram:lint')) {
            Assert-True (@($start.Tasks) -contains $task) "A concurrent gate dropped $task."
        }
        foreach ($stage in @('contracts', 'advisories', 'facts')) {
            $record = Join-Path $records "$stage-$($start.Case)-$($start.Commit).json"
            Assert-True (Test-Path -LiteralPath $record) "Gate $($start.Case) skipped $stage for $($start.Commit)."
            $checked = Get-Content -LiteralPath $record -Raw | ConvertFrom-Json
            Assert-True ($checked.Root -eq $start.Root -and $checked.Location -eq $start.Root -and $checked.State -eq $start.State) "Gate $($start.Case) checked $stage in another checkout."
        }
        $done = Get-Content -LiteralPath (Join-Path $records "done-$($start.Case)-$($start.Commit).json") -Raw | ConvertFrom-Json
        Assert-True ($done.State -eq $start.State -and $done.Proof -eq $start.State -and -not $start.GitDir -and $start.Location -eq $start.Root) 'Concurrent source or output writes contaminated a build.'
    }
    $listed = @(Invoke-TestGit @('-C', $repo, 'worktree', 'list', '--porcelain') | Where-Object { $_ -like 'worktree *' })
    Assert-True ($listed.Count -eq 2 + $ActiveRoots.Count) "Owned worktree registrations survived cleanup: $($listed -join ', ')"
    foreach ($active in $ActiveRoots) { Assert-True (Test-Path -LiteralPath $active -PathType Container) 'Cleanup removed another active gate checkout.' }
    Assert-True ((Get-Content -LiteralPath (Join-Path $other 'keep.txt') -Raw).Trim() -eq 'another checkout') 'Cleanup touched an unrelated checkout.'
}

try {
    New-Item -ItemType Directory -Path (Join-Path $repo 'scripts'), (Join-Path $repo 'patches/src'), $fixtures, $records -Force | Out-Null
    Invoke-TestGit @('-C', $repo, 'init', '--quiet', '--initial-branch=main') | Out-Null
    Invoke-TestGit @('-C', $repo, 'config', 'user.name', 'SysAdminDoc') | Out-Null
    Invoke-TestGit @('-C', $repo, 'config', 'user.email', 'matt_parker@outlook.com') | Out-Null
    Invoke-TestGit @('-C', $repo, 'config', 'core.autocrlf', 'false') | Out-Null
    Invoke-TestGit @('init', '--bare', '--quiet', $remote) | Out-Null
    Copy-Item -LiteralPath (Join-Path $Root 'patches-list.json') -Destination (Join-Path $repo 'patches-list.json')
    Copy-Item -LiteralPath (Join-Path $Root 'scripts/patch-target.ps1') -Destination (Join-Path $repo 'scripts/patch-target.ps1')
    foreach ($target in @(Get-PatchTargets -PatchList (Get-Content -LiteralPath (Join-Path $repo 'patches-list.json') -Raw | ConvertFrom-Json))) {
        foreach ($version in $target.PackageVersions) {
            foreach ($code in @($target.PackageVersionCodes[$version])) {
                Set-Content -LiteralPath (Join-Path $fixtures (Get-VendorFixtureName -Target $target -VersionName $version -VersionCode $code)) -Value 'vendor APK stand-in' -Encoding ASCII
            }
        }
    }
    Set-Content -LiteralPath (Join-Path $repo '.gitignore') -Value @('**/build/', 'local-edit.txt') -Encoding ASCII
    Set-Content -LiteralPath (Join-Path $repo 'patches-bundle.json') -Value '{}' -Encoding ASCII
    $recordStub = @(
        '$ErrorActionPreference = ''Stop''',
        '$state = (Get-Content -LiteralPath (Join-Path $Root ''patches/src/marker.txt'') -Raw).Trim()',
        '$commit = (& git rev-parse HEAD).Trim()',
        '@{ Root = $Root; Location = (Get-Location).ProviderPath; State = $state } | ConvertTo-Json |',
        '    Set-Content -LiteralPath (Join-Path $env:HUSHTELEGRAM_GATE_RECORDS "$stage-$env:HUSHTELEGRAM_GATE_CASE-$commit.json") -Encoding ASCII')
    foreach ($suite in @('test-script-contracts', 'test-telegram-sources', 'build-advisories')) {
        $stage = if ($suite -eq 'build-advisories') { 'advisories' } elseif ($suite -eq 'test-telegram-sources') { 'ledger' } else { 'contracts' }
        Set-Content -LiteralPath (Join-Path $repo "scripts/$suite.ps1") -Value (@('param([string]$Root)', "`$stage = '$stage'") + $recordStub + @('exit 0')) -Encoding UTF8
    }
    Set-Content -LiteralPath (Join-Path $repo 'scripts/validate-release-facts.ps1') -Value (@(
        'param([string]$Root, [switch]$SkipDescriptionTestCount, [switch]$AllowPublishedIndexLag, [switch]$SkipTestResults)',
        '$stage = ''facts''') + $recordStub + @(
        'if ($SkipTestResults) { throw ''This gate just built its own test results.'' }',
        'if ($env:HUSHTELEGRAM_GATE_FAILURE -eq ''facts'') { exit 1 }', 'exit 0')) -Encoding UTF8
    $wrapper = Join-Path $testRoot 'record-build.ps1'
    Set-Content -LiteralPath $wrapper -Encoding UTF8 -Value @(
        'param([string]$ProjectDir, [string[]]$Tasks)', '$ErrorActionPreference = ''Stop''',
        '$source = Join-Path $ProjectDir ''patches/src/marker.txt''',
        '$state = (Get-Content -LiteralPath $source -Raw).Trim()',
        '$commit = (& git rev-parse HEAD).Trim()',
        '$case = $env:HUSHTELEGRAM_GATE_CASE', '$records = $env:HUSHTELEGRAM_GATE_RECORDS',
        '$proof = Join-Path $ProjectDir ''build/proof.txt''',
        'New-Item -ItemType Directory -Force -Path (Split-Path -Parent $proof) | Out-Null',
        'New-Item -ItemType Junction -Path (Join-Path $ProjectDir ''build/unrelated-alias'') -Target $env:HUSHTELEGRAM_GATE_UNRELATED | Out-Null',
        'Set-Content -LiteralPath $proof -Value $state -Encoding ASCII',
        '$startRecord = @{ Root = $ProjectDir; Case = $case; Commit = $commit; State = $state; Tasks = $Tasks;',
        '    Required = $env:HUSHTELEGRAM_REQUIRE_FIXTURES; FixtureDir = $env:HUSHTELEGRAM_FIXTURE_DIR;',
        '    GitDir = $env:GIT_DIR; Location = (Get-Location).ProviderPath } | ConvertTo-Json',
        '$startPath = Join-Path $records "start-$case-$commit.json"',
        '[IO.File]::WriteAllText("$startPath.pending", $startRecord)',
        '[IO.File]::Move("$startPath.pending", $startPath)',
        '$clock = [Diagnostics.Stopwatch]::StartNew()',
        'while (-not (Test-Path -LiteralPath (Join-Path $records ''release'')) -and -not (Test-Path -LiteralPath (Join-Path $records "release-$case"))) {',
        '    if ($clock.Elapsed.TotalSeconds -gt 40) { throw ''Independent build barrier timed out.'' }',
        '    Start-Sleep -Milliseconds 25', '}',
        '@{ State = (Get-Content -LiteralPath $source -Raw).Trim(); Proof = (Get-Content -LiteralPath $proof -Raw).Trim() } |',
        '    ConvertTo-Json | Set-Content -LiteralPath (Join-Path $records "done-$case-$commit.json") -Encoding ASCII', 'exit 0')
    function Save-State([string]$State) {
        Set-Content -LiteralPath (Join-Path $repo 'patches/src/marker.txt') -Value $State -Encoding ASCII
        Set-Content -LiteralPath (Join-Path $repo 'README.md') -Value $State -Encoding ASCII
        Set-Content -LiteralPath (Join-Path $repo 'scripts/changed.txt') -Value $State -Encoding ASCII
        Invoke-TestGit @('-C', $repo, 'add', '--all') | Out-Null
        Invoke-TestGit @('-C', $repo, 'commit', '--quiet', '-m', "fixture $State") | Out-Null
        return ([string](Invoke-TestGit @('-C', $repo, 'rev-parse', 'HEAD'))).Trim()
    }
    $base = Save-State 'base'
    Invoke-TestGit @('-C', $repo, 'push', '--quiet', $remote, "${base}:refs/heads/main") | Out-Null
    $one = Save-State 'one'
    $two = Save-State 'two'
    Invoke-TestGit @('-C', $repo, 'worktree', 'add', '--detach', '--quiet', $other, $base) | Out-Null
    Set-Content -LiteralPath (Join-Path $other 'keep.txt') -Value 'another checkout' -Encoding ASCII
    $quote = { param([string]$Value) "'" + $Value.Replace("'", "'\''") + "'" }
    [IO.File]::WriteAllText((Join-Path $repo '.git/hooks/pre-push'),
        "#!/bin/sh`nexec $(& $quote ($shell.Replace('\', '/'))) -NoProfile -NonInteractive -ExecutionPolicy Bypass -File $(& $quote ($hook.Replace('\', '/'))) -Root $(& $quote ($repo.Replace('\', '/'))) `"`$@`"`n",
        (New-Object Text.UTF8Encoding($false)))

    foreach ($failure in @('', 'facts')) {
        $prefix = if ($failure) { 'failed' } else { 'passed' }
        Remove-Item -LiteralPath (Join-Path $records 'release') -Force -ErrorAction SilentlyContinue
        # Cover both clean HEAD and dirty source. Dirty source made both old gates share a lock.
        if ($failure) {
            Set-Content -LiteralPath (Join-Path $repo 'patches/src/marker.txt') -Value 'uncommitted' -Encoding ASCII
        } else {
            Invoke-TestGit @('-C', $repo, 'checkout', '--', 'patches/src/marker.txt') | Out-Null
        }
        $first = Start-Gate "$prefix-one" @('-C', $repo, 'push', '--quiet', $remote, "${one}:refs/heads/$prefix-one")
        $second = Start-Gate "$prefix-two" @('-C', $repo, 'push', '--quiet', $remote, "${two}:refs/heads/$prefix-two") -Failure $failure
        $starts = @(Wait-Starts "$prefix-one") + @(Wait-Starts "$prefix-two")
        Assert-True ($starts[0].Root -ne $starts[1].Root -and $starts[0].Commit -eq $one -and $starts[1].Commit -eq $two -and
            $starts[0].State -eq 'one' -and $starts[1].State -eq 'two') 'Concurrent pushes did not build separate exact commits.'
        Set-Content -LiteralPath (Join-Path $repo 'local-edit.txt') -Value 'keep my edit' -Encoding ASCII
        if ($failure) {
            Set-Content -LiteralPath (Join-Path $records "release-$prefix-two") -Value 'go' -Encoding ASCII
            Finish-Gate $second 1
            Assert-Cleaned @($starts[1]) @($starts[0].Root)
            Assert-True ((Get-Content -LiteralPath (Join-Path $starts[0].Root 'build/proof.txt') -Raw).Trim() -eq 'one') 'Failure cleanup changed a still-running peer output.'
        }
        Set-Content -LiteralPath (Join-Path $records 'release') -Value 'go' -Encoding ASCII
        Finish-Gate $first 0
        if (-not $failure) { Finish-Gate $second 0 }
        Assert-Cleaned $starts
        $remoteOne = @(Invoke-TestGit @('ls-remote', $remote, "refs/heads/$prefix-one"))
        $remoteTwo = @(Invoke-TestGit @('ls-remote', $remote, "refs/heads/$prefix-two"))
        Assert-True ($remoteOne -like "$one*" -and $(if ($failure) { $remoteTwo.Count -eq 0 } else { $remoteTwo -like "$two*" })) 'A local remote received the wrong verdict or commit.'
        Assert-True ((Get-Content -LiteralPath (Join-Path $repo 'local-edit.txt') -Raw).Trim() -eq 'keep my edit') 'Cleanup removed source-checkout edits.'
    }

    Remove-Item -LiteralPath (Join-Path $records 'release') -Force
    Set-Content -LiteralPath (Join-Path $repo 'patches/src/marker.txt') -Value 'manual-edit' -Encoding ASCII
    $manualArgs = @('-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'Bypass', '-File', $hook, '-Root', $repo, '-ChangedPaths', 'README.md')
    $first = Start-Gate 'manual-one' $manualArgs
    $second = Start-Gate 'manual-two' $manualArgs
    $starts = @(Wait-Starts 'manual-one') + @(Wait-Starts 'manual-two')
    Assert-True ($starts[0].Root -ne $starts[1].Root -and $starts[0].State -eq 'manual-edit' -and $starts[1].State -eq 'manual-edit') 'Manual builds shared outputs or dropped current edits.'
    Set-Content -LiteralPath (Join-Path $repo 'patches/src/marker.txt') -Value 'later-edit' -Encoding ASCII
    Set-Content -LiteralPath (Join-Path $records 'release') -Value 'go' -Encoding ASCII
    Finish-Gate $first 0
    Finish-Gate $second 0
    Assert-Cleaned $starts
    Assert-True ((Get-Content -LiteralPath (Join-Path $repo 'patches/src/marker.txt') -Raw).Trim() -eq 'later-edit') 'A manual gate overwrote later source edits.'

    # One actual push carrying two tips still checks both, with two separate output trees.
    $multi = Start-Gate 'multi' @('-C', $repo, 'push', '--quiet', $remote, "${one}:refs/heads/multi-one", "${two}:refs/heads/multi-two")
    Finish-Gate $multi 0
    $starts = @(Wait-Starts 'multi' 2)
    Assert-True ($starts[0].Root -ne $starts[1].Root -and (@($starts.Commit | Sort-Object) -join ',') -eq (@($one, $two | Sort-Object) -join ',')) 'A push carrying multiple tips reused an output tree or skipped a tip.'
    Assert-Cleaned $starts
    Write-Host '[pre-push] concurrent lifecycle contracts passed (four pushes, two manual gates, one two-tip push)'
} finally {
    foreach ($job in $processes) {
        if (-not $job.Process.HasExited) {
            # Git owns a shell and hook process. Stop that owned process tree on a failed case,
            # including Windows PowerShell 5.1, whose Process.Kill has no tree overload.
            $stopInfo = New-Object System.Diagnostics.ProcessStartInfo
            $stopInfo.FileName = 'taskkill.exe'
            $stopInfo.Arguments = "/PID $($job.Process.Id) /T /F"
            $stopInfo.UseShellExecute = $false
            $stopInfo.CreateNoWindow = $true
            $stopInfo.RedirectStandardOutput = $true
            $stopInfo.RedirectStandardError = $true
            $stopper = [Diagnostics.Process]::Start($stopInfo)
            $stopper.WaitForExit(5000) | Out-Null
            $stopper.Dispose()
            $job.Process.WaitForExit(5000) | Out-Null
        }
        $job.Process.Dispose()
    }
    if (Test-Path -LiteralPath (Join-Path $repo '.git') -PathType Container) {
        # A failed test reports leaked gates above. Reclaim only this fixture repository's
        # registered gates with a matching owner marker, after its processes have stopped.
        $parentsToClean = New-Object 'System.Collections.Generic.HashSet[string]'
        foreach ($line in @(Invoke-TestGit @('-C', $repo, 'worktree', 'list', '--porcelain'))) {
            if ($line -notlike 'worktree *') { continue }
            $tree = [IO.Path]::GetFullPath($line.Substring(9))
            if ($tree -ieq $repo) { continue }
            if ($tree -ieq $other) {
                Invoke-TestGit @('-C', $repo, 'worktree', 'remove', '--force', $tree) | Out-Null
                continue
            }
            $parent = [IO.Path]::GetDirectoryName($tree)
            $parentName = [IO.Path]::GetFileName($parent)
            if ([IO.Path]::GetDirectoryName($parent) -ine $temp -or $parentName -notmatch '^hushtelegram-pre-push-([a-f0-9]{32})$' -or
                    [IO.File]::ReadAllText((Join-Path $parent 'owner')) -ne $Matches[1]) {
                throw "Refusing to reclaim an unexpected fixture checkout $tree"
            }
            $build = Join-Path $tree 'build'
            $alias = Join-Path $build 'unrelated-alias'
            if ([IO.Directory]::Exists($build) -and [IO.Directory]::GetFileSystemEntries($build) -contains $alias -and
                    [IO.File]::GetAttributes($alias) -band [IO.FileAttributes]::ReparsePoint) {
                [IO.Directory]::Delete($alias)
            }
            Invoke-TestGit @('-C', $repo, 'worktree', 'remove', '--force', $tree) | Out-Null
            [void]$parentsToClean.Add($parent)
        }
        foreach ($parent in $parentsToClean) {
            Remove-Item -LiteralPath (Join-Path $parent 'owner') -Force
            [IO.Directory]::Delete($parent)
        }
    }
    foreach ($name in $savedGit.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $savedGit[$name] }
    if (Test-Path -LiteralPath $testRoot) { Remove-Item -LiteralPath $testRoot -Recurse -Force }
}
