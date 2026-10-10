<#
.SYNOPSIS
    Checks a push before it leaves the machine.

.DESCRIPTION
    This project builds nothing on GitHub, so a push is the last point at which anything can
    be checked. Its only reported failure so far was a source index that advertised a bundle
    the release did not carry, which the release check catches when it is actually run.

    Called by .git/hooks/pre-push with the remote name and URL, reading the pushed refs from
    standard input the way git supplies them. Run scripts/install-hooks.ps1 once to wire it up.

    Only what changed is checked: runtime tests when extension or patch sources, or the root files
    those tests read, move, and the release facts when a published file moves. A move counts at
    both ends, the path it left and the one it took. The one check every push gets is a scan of
    every commit it publishes for tracked files that name the maintainer's machine or a phone.
    Set HUSHTELEGRAM_SKIP_PRE_PUSH=1 to push anyway.
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0)][string]$RemoteName,
    [Parameter(Position = 1)][string]$RemoteUrl,
    [string]$Root,
    [string[]]$ChangedPaths,
    [string]$PushedRefs
)

$ErrorActionPreference = 'Stop'

# Not a parameter default. Windows PowerShell leaves $PSScriptRoot empty while it evaluates the
# defaults of an advanced script started with -File, and any [CmdletBinding()] or [Parameter(...)]
# attribute makes a script advanced, so the default threw and the hook failed before it checked
# anything. The hook prefers pwsh, which does not have this, and falls back to Windows PowerShell
# wherever pwsh is off the PATH: a git hook runs with git's environment, so that is the ordinary
# case rather than the rare one.
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
# Read before anything that can fail to load. The switch is the way through the hook's own messages
# offer, and common.ps1 is the working tree's copy: mid-rebase it can hold conflict markers, or a
# half-made edit, and loading it first stopped the push with a parse error while the switch was set.
if ($env:HUSHTELEGRAM_SKIP_PRE_PUSH -eq '1') {
    Write-Host '[pre-push] skipped by HUSHTELEGRAM_SKIP_PRE_PUSH'
    exit 0
}
. (Join-Path $PSScriptRoot 'common.ps1')
$Root = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Root)

# A hook runs with git's own environment. User environment variables set after the shell
# launched, or set in the user scope only, may be absent. Import the four this script and
# its suites need from the registry so a gate worktree can find the desktop CLI, the
# fixture folder, the build wrapper and the device serial. An empty one counts as absent.
Import-UserEnvironment -Name @('HUSHTELEGRAM_DESKTOP_JAR', 'HUSHTELEGRAM_FIXTURE_DIR',
    'HUSHTELEGRAM_BUILD_WRAPPER', 'HUSHTELEGRAM_DEVICE_SERIAL')

$zeroObject = '0' * 40
# The tip of each pushed ref, peeled, filled in by Get-PushedPaths. The build gate builds each of
# these, and never whatever else the working tree holds.
$script:pushedCommits = New-Object System.Collections.Generic.List[string]
# Every commit the push publishes, also filled in by Get-PushedPaths, for the machine-name scan.
$script:publishedCommits = New-Object System.Collections.Generic.List[string]
# What the remote advertises, read once by Get-RemoteHeld.
$script:remoteHeld = $null
$script:gateWorktrees = @{}
$script:gateOwner = [guid]::NewGuid().ToString('N')
$script:gateScratch = $null
$script:gateTemp = $null
# Whether a ref to main or a tag changes patches-bundle.json, the index Manager reads: an index
# push. Decided ref by ref in Get-PushedPaths, since a new branch's whole tree always holds the
# file, and pooled with main's paths it made a push of both an index push. -ChangedPaths is used
# by the routing contracts to stand in for a published-file push.
$script:rewritesIndex = $PSBoundParameters.ContainsKey('ChangedPaths') -and @($ChangedPaths) -contains 'patches-bundle.json'

function Write-Step {
    param([string]$Message)
    Write-Host "[pre-push] $Message"
}

function Assert-PatchFixtures {
    # Read the catalog and its helper from the tree being built, which may be a pushed commit's
    # worktree rather than this checkout. A newer or uncommitted catalog cannot satisfy its gate.
    param([Parameter(Mandatory = $true)][string]$ProjectRoot)

    $configured = $env:HUSHTELEGRAM_FIXTURE_DIR
    if ([string]::IsNullOrWhiteSpace($configured)) {
        throw ('Patch verification requires HUSHTELEGRAM_FIXTURE_DIR. Set it to the folder ' +
            'holding every declared vendor Telegram APK, then push again. Run unit-only tests ' +
            'directly with Gradle when the fixtures are unavailable.')
    }
    $directory = [IO.Path]::GetFullPath($configured)
    if (-not (Test-Path -LiteralPath $directory -PathType Container)) {
        throw "HUSHTELEGRAM_FIXTURE_DIR names $directory, which is not a folder. Restore the vendor APKs or correct the path, then push again."
    }
    $catalogPath = Join-Path $ProjectRoot 'patches-list.json'
    if (-not (Test-Path -LiteralPath $catalogPath -PathType Leaf)) {
        throw "Patch verification requires the pushed tree's patches-list.json at $catalogPath. Restore its generated catalog, then push again."
    }
    $helper = Join-Path $ProjectRoot 'scripts/patch-target.ps1'
    if (-not (Test-Path -LiteralPath $helper -PathType Leaf)) {
        throw "Patch verification requires the pushed tree's scripts/patch-target.ps1 at $helper. Restore it, then push again."
    }
    . $helper
    $targets = @(Get-PatchTargets -PatchList (Get-Content -LiteralPath $catalogPath -Raw | ConvertFrom-Json))
    $missing = @()
    $count = 0
    foreach ($target in $targets) {
    foreach ($version in @($target.PackageVersions)) {
        $codes = @($target.PackageVersionCodes[$version] | Where-Object { $_ })
        if ($codes.Count -eq 0) {
            throw "Patch verification requires exact version codes for $($target.PackageName) $version in patches-list.json. Generate the pinned catalog, then push again."
        }
        foreach ($code in $codes) {
            if ($code -notmatch '^\d+$') {
                throw "patches-list.json declares the invalid version code $code for $($target.PackageName) $version. Correct it, then push again."
            }
            $name = Get-VendorFixtureName -Target $target -VersionName $version -VersionCode $code
            $file = Join-Path $directory $name
            if (-not (Test-Path -LiteralPath $file -PathType Leaf) -or (Get-Item -LiteralPath $file).Length -eq 0) {
                $missing += $name
            }
            $count++
        }
    }
    }
    if ($missing.Count -gt 0) {
        throw ('HUSHTELEGRAM_FIXTURE_DIR is missing retained Telegram build(s): ' +
            ($missing -join ', ') + ". Restore those vendor APKs in $directory, then push again.")
    }
    Write-Step "$count declared Telegram fixture(s) found"
    return $directory
}

function Get-PushedPaths {
    <#
        Git writes "<local ref> <local sha> <remote ref> <remote sha>" per ref on stdin. A remote
        sha of all zeroes means the branch is new there. A new branch is checked conservatively
        from its complete resulting tree, so a stale local tracking ref cannot hide a code path.

        Read from the console rather than $input: a script started with -File binds stdin to its
        parameters, so piping into it fails to bind and leaves $input empty, which made the hook
        report that a push changed nothing.
    #>
    param([string]$Text)

    $paths = New-Object System.Collections.Generic.HashSet[string]
    foreach ($line in ($Text -split "`r?`n")) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        $parts = $line.Trim() -split '\s+'
        if ($parts.Count -lt 4) { continue }
        $localSha = $parts[1]
        $remoteSha = $parts[3]
        if ($localSha -eq $zeroObject) { continue }
        $publishesIndex = $parts[2] -eq 'refs/heads/main' -or $parts[2] -like 'refs/tags/*'

        if ($remoteSha -eq $zeroObject) {
            # A new tag of an already hosted branch adds no files. In particular it does not
            # rewrite the source index, which must keep naming the previous working bundle
            # until the new release asset exists. Trust a live advertisement, not tracking refs.
            if ($parts[2] -like 'refs/tags/*' -and $RemoteUrl) {
                $target = Invoke-GitQuietly @('rev-parse', '--verify', "$localSha^{commit}")
                if ($LASTEXITCODE -ne 0) { throw "Could not resolve tag target $localSha." }
                $advertised = @(Invoke-GitQuietly @('ls-remote', '--heads', $RemoteUrl))
                if ($LASTEXITCODE -ne 0) { throw 'Could not read remote branches to verify the tag target.' }
                $targetPattern = '^' + [regex]::Escape(([string]$target).Trim()) + '\s+refs/heads/'
                if (@($advertised | Where-Object { $_ -match $targetPattern }).Count -gt 0) {
                    Write-Step 'new tag names an advertised remote branch commit; no file changes'
                    continue
                }
            }
            # This intentionally runs the relevant gate for any matching path in the tree, even
            # when the branch changed only documentation. A first push is rare, and a complete
            # tree cannot be made incomplete by a deleted or force-updated remote-tracking ref.
            $range = "$localSha complete branch tree"
            $names = Invoke-GitQuietly @('ls-tree', '-r', '--name-only', '-z', $localSha)
        } else {
            $range = "$remoteSha..$localSha"
            # Both ends of a move. Taken for a rename, a moved file is listed under its new path
            # alone: patches-bundle.json moved away ran no release check, a source moved out of
            # extensions/ no runtime tests, and a gate suite renamed was never looked for.
            $names = Invoke-GitQuietly @('diff', '--name-only', '--no-renames', '-z', $remoteSha, $localSha)
        }
        if ($LASTEXITCODE -ne 0) {
            throw "Could not read what $range changes. Fetch the remote and try again."
        }
        # Separated by NULs, so git prints each path as it is. Line by line it quotes a path with a
        # byte outside ASCII, "extensions/.../\303\234ber.java" in quotes, which matched no route.
        foreach ($name in ((@($names) -join "`n") -split "`0")) {
            if (-not [string]::IsNullOrEmpty($name)) { [void]$paths.Add($name) }
            if ($publishesIndex -and $name -eq 'patches-bundle.json') { $script:rewritesIndex = $true }
        }
        $commit = Invoke-GitQuietly @('rev-parse', '--verify', "$localSha^{commit}")
        if ($LASTEXITCODE -eq 0 -and $commit -and -not $script:pushedCommits.Contains(([string]$commit).Trim())) {
            $script:pushedCommits.Add(([string]$commit).Trim())
        }
        # Every commit the ref publishes, not only its tip: a file one commit adds and the next
        # deletes still goes out in the first. A new branch publishes what the remote doesn't
        # hold, as the remote itself says: a remote-tracking ref can outlive its branch there,
        # deleted and never pruned here, and a commit only it held went out unscanned. The
        # remote's commits go on the command line two hundred at a time, a commit is published
        # when no batch reaches it, and the ones this clone never fetched are skipped. Not on
        # standard input: Windows PowerShell puts a byte order mark in front of the first line it
        # pipes to a program, so that line named no commit and nothing it held was left out.
        $published = if ($remoteSha -eq $zeroObject) {
            $held = @(Get-RemoteHeld)
            $kept = $null
            for ($i = 0; $i -eq 0 -or $i -lt $held.Count; $i += 200) {
                $batch = @($held | Select-Object -Skip $i -First 200)
                $reached = @(Invoke-GitQuietly (@('rev-list', '--ignore-missing', $localSha, '--not') + $batch))
                if ($LASTEXITCODE -ne 0) { break }
                if ($null -eq $kept) {
                    $kept = $reached
                } else {
                    $inBatch = New-Object 'System.Collections.Generic.HashSet[string]' (, [string[]]$reached)
                    $kept = @($kept | Where-Object { $inBatch.Contains($_) })
                }
            }
            $kept
        } else {
            Invoke-GitQuietly @('rev-list', "$remoteSha..$localSha")
        }
        if ($LASTEXITCODE -ne 0) {
            throw "Could not list the commits a push of $($parts[0]) publishes. Fetch the remote and try again."
        }
        foreach ($sha in @($published)) {
            $sha = ([string]$sha).Trim()
            if ($sha -and -not $script:publishedCommits.Contains($sha)) { $script:publishedCommits.Add($sha) }
        }
    }
    return $paths
}

function Invoke-GitQuietly {
    <#
        git in this repository with its standard error dropped, returning standard output and
        leaving $LASTEXITCODE for the caller to read. Windows PowerShell 5.1 turns a native
        command's standard error into a terminating error under Stop even when it is redirected,
        so a warning, or the "fatal:" a missing object prints, stopped the hook with a
        NativeCommandError before the caller could say what went wrong.
    #>
    param([string[]]$Arguments)
    $preference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        & git @Arguments 2>$null
    } finally {
        $ErrorActionPreference = $preference
    }
}

function Get-RemoteHeld {
    <#
        The commits the remote advertises, its branches' and its tags', read once per push. What
        a new branch publishes is what none of them reaches. A run by hand that names no remote
        gets none, so every commit the branch reaches is scanned. A remote that can't be read
        stops the push, rather than letting a guess decide what goes out unscanned.
    #>
    if ($null -ne $script:remoteHeld) { return $script:remoteHeld }
    $held = @()
    if ($RemoteUrl) {
        $advertised = @(Invoke-GitQuietly @('ls-remote', '--heads', '--tags', $RemoteUrl))
        if ($LASTEXITCODE -ne 0) {
            throw ("Could not read what $RemoteUrl holds, so the commits a new branch publishes can't " +
                'be told from the ones already there. Check the connection and push again.')
        }
        $held = @($advertised | ForEach-Object { if ("$_" -match '^([0-9a-f]{40})\s') { $Matches[1] } } |
            Select-Object -Unique)
    }
    $script:remoteHeld = $held
    return $held
}

function Invoke-WithoutGitEnvironment {
    <#
        Runs $Action with every GIT_* variable removed, and puts them back after. Git exports
        GIT_DIR and its relatives to a hook, and git -C does not override them, so a worktree
        command run with them set would act on this repository's own working tree rather than the
        one it names. A build started with them set would read this checkout's git state too.
    #>
    param([Parameter(Mandatory = $true)][scriptblock]$Action)
    $saved = @{}
    foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
        $saved[$variable.Name] = $variable.Value
        Remove-Item -LiteralPath ('Env:\' + $variable.Name)
    }
    try {
        & $Action
    } finally {
        foreach ($name in $saved.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $saved[$name] }
    }
}

function Invoke-HookGit {
    <#
        git without the hook's own GIT_* environment, returning standard output and throwing on
        failure. Windows PowerShell 5.1 turns a native command's standard error into a terminating
        error under Stop, so that preference is relaxed here.
    #>
    param([string[]]$Arguments)
    Invoke-WithoutGitEnvironment {
        $preference = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        try {
            $errors = New-Object System.Collections.Generic.List[string]
            $output = @(& git @Arguments 2>&1 | ForEach-Object {
                if ($_ -is [System.Management.Automation.ErrorRecord]) { $errors.Add($_.ToString()) } else { $_ }
            })
            if ($LASTEXITCODE -ne 0) { throw "git $($Arguments -join ' ') failed: $($errors -join ' ')" }
            return $output
        } finally {
            $ErrorActionPreference = $preference
        }
    }
}

function Invoke-CommitScript {
    <#
        A pushed commit's script, run from its gate worktree in a PowerShell process of its own and
        with no GIT_* variables. Run in this one, it saw every function this hook and the working
        tree's common.ps1 had defined, so a suite calling a helper the working tree holds uncommitted
        passed here and failed for anyone who checked the commit out. -Arguments are its named
        parameters; a switch goes as its name alone when it's on. Its output goes where this hook's
        does, and its exit code is left in $LASTEXITCODE.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Script,
        [hashtable]$Arguments = @{}
    )
    $argv = @()
    foreach ($name in $Arguments.Keys) {
        $value = $Arguments[$name]
        if ($value -is [bool] -or $value -is [System.Management.Automation.SwitchParameter]) {
            if ($value) { $argv += "-$name" }
        } else {
            $argv += "-$name"
            $argv += [string]$value
        }
    }
    # The shell this hook runs in, so a suite that has to pass under Windows PowerShell 5.1 gets it.
    $shell = (Get-Process -Id $PID).Path
    Invoke-WithoutGitEnvironment {
        # Windows PowerShell 5.1 turns a native command's standard error into a terminating error
        # under Stop, and a failing suite says why on it.
        $preference = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        Push-Location -LiteralPath $Arguments['Root']
        try {
            & $shell -NoProfile -NonInteractive -ExecutionPolicy Bypass -File $Script @argv 2>&1 |
                ForEach-Object { Write-Host "$_" }
        } finally {
            Pop-Location
            $ErrorActionPreference = $preference
        }
    }
}

function Copy-GateFile {
    param([string]$Tree, [string]$RelativePath)
    $source = Join-Path $Root $RelativePath
    if (-not (Test-Path -LiteralPath $source -PathType Leaf)) { return }
    $destination = Resolve-WithinRoot -Path (Join-Path $Tree $RelativePath) -Root $Tree
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $destination) | Out-Null
    Copy-Item -LiteralPath $source -Destination $destination -Force
}

function Assert-IndexSource {
    param([string]$Commit)
    if (-not $Commit) { return }
    $at = ([string](Invoke-HookGit @('-C', $Root, 'rev-parse', 'HEAD') | Select-Object -Last 1)).Trim()
    $dirty = @(Invoke-HookGit @('-C', $Root, 'status', '--porcelain', '--untracked-files=all'))
    if ($at -ne $Commit -or $dirty.Count -gt 0) {
        throw ('An index push checks the bundle and test results this checkout built, so it ' +
            'has to come from a clean checkout of the commit it pushes. Commit or stash the ' +
            'rest, check out ' + $Commit + ' and push again.')
    }
}

function Copy-IndexEvidence {
    # Preserve the source dates used to reject stale results. A new checkout's dates describe
    # the checkout, not the source used by the original build. Check its identity on both sides
    # of the copy, and compare copied evidence hashes so a concurrent writer cannot mix a run.
    param([string]$Tree, [string]$Commit)
    Assert-IndexSource $Commit
    if ($Commit) {
        $files = Invoke-HookGit @('-C', $Root, 'ls-tree', '-r', '--name-only', '-z', $Commit)
        foreach ($name in ((@($files) -join "`n") -split "`0")) {
            if (-not $name) { continue }
            $source = Join-Path $Root $name
            $destination = Join-Path $Tree $name
            if ((Test-Path -LiteralPath $source -PathType Leaf) -and (Test-Path -LiteralPath $destination -PathType Leaf)) {
                [IO.File]::SetLastWriteTimeUtc($destination, [IO.File]::GetLastWriteTimeUtc($source))
            }
        }
    }
    # Receipts are deliberately ignored by git and published beside the release. They are
    # still required evidence for the strict index check, including a run without a local bundle.
    foreach ($receipt in @(Get-ChildItem -LiteralPath $Root -Filter 'release-receipt-*.json' -File)) {
        $before = (Get-FileHash -LiteralPath $receipt.FullName -Algorithm SHA256).Hash
        Copy-GateFile -Tree $Tree -RelativePath $receipt.Name
        $copied = (Get-FileHash -LiteralPath (Join-Path $Tree $receipt.Name) -Algorithm SHA256).Hash
        $after = (Get-FileHash -LiteralPath $receipt.FullName -Algorithm SHA256).Hash
        if ($before -ne $copied -or $before -ne $after) { throw "Index build evidence changed while it was copied: $($receipt.Name)" }
    }
    foreach ($directory in @('patches/build/release', 'patches/build/test-results/test',
            'patches/build/test-results/fixtureTest', 'extensions/telegram/build/test-results/testDebugUnitTest')) {
        $path = Join-Path $Root $directory
        if (-not (Test-Path -LiteralPath $path -PathType Container)) { continue }
        $pattern = if ($directory -eq 'patches/build/release') { '*.mpp' } else { '*.xml' }
        foreach ($file in @(Get-ChildItem -LiteralPath $path -Filter $pattern -File)) {
            $relative = "$directory/$($file.Name)"
            $before = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
            Copy-GateFile -Tree $Tree -RelativePath $relative
            $copied = (Get-FileHash -LiteralPath (Join-Path $Tree $relative) -Algorithm SHA256).Hash
            $after = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
            if ($before -ne $copied -or $before -ne $after) { throw "Index build evidence changed while it was copied: $relative" }
        }
    }
    Assert-IndexSource $Commit
}

function Get-GateWorktree {
    # Each invocation owns a fresh parent, and each pushed tip owns one checkout beneath it.
    # No other invocation checks out or cleans these sources, or writes these build outputs.
    param([string]$Commit)
    $key = if ($Commit) { $Commit } else { 'working' }
    if ($script:gateWorktrees.ContainsKey($key)) { return $script:gateWorktrees[$key] }
    if (-not $script:gateScratch) {
        $temp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\', '/')
        $scratch = [IO.Path]::GetFullPath((Join-Path $temp "hushtelegram-pre-push-$($script:gateOwner)"))
        if ([IO.Path]::GetDirectoryName($scratch) -ine $temp) { throw 'The gate scratch directory is outside the temporary directory.' }
        New-Item -ItemType Directory -Path $scratch | Out-Null
        [IO.File]::WriteAllText((Join-Path $scratch 'owner'), $script:gateOwner)
        $script:gateScratch = $scratch
        $script:gateTemp = $temp
    }
    $tree = Join-Path $script:gateScratch $key
    $script:gateWorktrees[$key] = $tree
    $base = $Commit
    if (-not $base) {
        $base = Invoke-WithoutGitEnvironment { Invoke-GitQuietly @('-C', $Root, 'rev-parse', '--verify', 'HEAD') }
        if ($LASTEXITCODE -ne 0) { $base = $null }
    }
    if ($base) {
        Invoke-HookGit @('-C', $Root, 'worktree', 'add', '--detach', '--quiet', $tree, ([string]$base).Trim()) | Out-Null
    } else {
        New-Item -ItemType Directory -Path $tree | Out-Null
    }
    if (-not $Commit) {
        # A run by hand checks current edits too. Overlay the tracked and ordinary untracked
        # sources, omitting build folders, and retain deletions from the current working tree.
        $files = Invoke-HookGit @('-C', $Root, 'ls-files', '--cached', '--others', '--exclude-standard', '-z')
        $names = @(((@($files) -join "`n") -split "`0") | Where-Object {
            $_ -and $_ -notmatch '(^|/)(\.git|\.gradle|build)(/|$)' })
        if ($base) {
            $baseline = Invoke-HookGit @('-C', $tree, 'ls-files', '-z')
            foreach ($name in ((@($baseline) -join "`n") -split "`0")) {
                if ($name -and -not (Test-Path -LiteralPath (Join-Path $Root $name) -PathType Leaf)) {
                    Remove-Item -LiteralPath (Join-Path $tree $name) -Force -ErrorAction SilentlyContinue
                }
            }
        }
        foreach ($name in $names) { Copy-GateFile -Tree $tree -RelativePath $name }
    }
    $properties = Join-Path $Root 'local.properties'
    if (Test-Path -LiteralPath $properties -PathType Leaf) {
        Copy-GateFile -Tree $tree -RelativePath 'local.properties'
    }
    # docs/sources.md is local and ignored, so a clean copy of the commit lacks it. The ledger's
    # suite holds the page to the ledger, so the gate checks the same page an in-place run would.
    $sourcesPage = Join-Path $Root 'docs/sources.md'
    if (Test-Path -LiteralPath $sourcesPage -PathType Leaf) {
        Copy-GateFile -Tree $tree -RelativePath 'docs/sources.md'
    }
    Assert-GateUnchanged -Tree $tree -Commit $Commit -Step 'checkout'
    if ($script:rewritesIndex) { Copy-IndexEvidence -Tree $tree -Commit $Commit }
    return $tree
}

function Assert-GateUnchanged {
    param([string]$Tree, [string]$Commit, [string]$Step)
    if (-not $Commit) { return }
    $at = ([string](Invoke-HookGit @('-C', $Tree, 'rev-parse', 'HEAD') | Select-Object -Last 1)).Trim()
    $dirty = @(Invoke-HookGit @('-C', $Tree, 'status', '--porcelain', '--untracked-files=all'))
    if ($at -ne $Commit -or $dirty.Count -gt 0) {
        throw "The owned gate worktree changed during $Step, so its result no longer describes $Commit."
    }
}

function Remove-GateReparsePoints {
    # Git can leave an ignored NTFS junction behind while reporting worktree removal success.
    # Unlink entries inside the owned checkout without ever enumerating their targets.
    param([string]$Tree)
    if (-not (Test-Path -LiteralPath $Tree -PathType Container)) { return }
    $pending = New-Object 'System.Collections.Generic.Stack[string]'
    $pending.Push($Tree)
    while ($pending.Count -gt 0) {
        foreach ($entry in [IO.Directory]::GetFileSystemEntries($pending.Pop())) {
            $attributes = [IO.File]::GetAttributes($entry)
            if ($attributes -band [IO.FileAttributes]::ReparsePoint) {
                if ($attributes -band [IO.FileAttributes]::Directory) { [IO.Directory]::Delete($entry) }
                else { [IO.File]::Delete($entry) }
            } elseif ($attributes -band [IO.FileAttributes]::Directory) { $pending.Push($entry) }
        }
    }
}

function Remove-GateWorktrees {
    if (-not $script:gateScratch) { return }
    $scratch = [IO.Path]::GetFullPath($script:gateScratch)
    if ([IO.Path]::GetDirectoryName($scratch) -ine $script:gateTemp -or
            (Get-Item -LiteralPath $scratch -Force).Attributes -band [IO.FileAttributes]::ReparsePoint -or
            [IO.File]::ReadAllText((Join-Path $scratch 'owner')) -ne $script:gateOwner) {
        throw "Refusing to clean a gate scratch directory without this invocation's ownership: $scratch"
    }
    $registered = @(Invoke-HookGit @('-C', $Root, 'worktree', 'list', '--porcelain') |
        Where-Object { $_ -like 'worktree *' } | ForEach-Object { [IO.Path]::GetFullPath($_.Substring(9)) })
    foreach ($tree in $script:gateWorktrees.Values) {
        $resolved = [IO.Path]::GetFullPath($tree)
        if ([IO.Path]::GetDirectoryName($resolved) -ine $scratch) { throw "Refusing to clean unexpected gate checkout $resolved" }
        if ((Test-Path -LiteralPath $resolved) -and
                (Get-Item -LiteralPath $resolved -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) {
            throw "Refusing to clean a redirected gate checkout $resolved"
        }
        Remove-GateReparsePoints -Tree $resolved
        if ($registered -contains $resolved) {
            Invoke-HookGit @('-C', $Root, 'worktree', 'remove', '--force', $resolved) | Out-Null
        } elseif (Test-Path -LiteralPath $resolved) {
            Remove-Item -LiteralPath $resolved -Recurse -Force
        }
    }
    $owner = Join-Path $scratch 'owner'
    if (@([IO.Directory]::GetFileSystemEntries($scratch) | Where-Object { $_ -ine $owner }).Count -gt 0) {
        throw "Refusing to remove unexpected entries beside the owned gate checkouts in $scratch"
    }
    Remove-Item -LiteralPath $owner -Force
    # No recursive parent delete. Any unexpected sibling is left alone and reported.
    [IO.Directory]::Delete($scratch)
}

Push-Location $Root
try {
    if ($PSBoundParameters.ContainsKey('ChangedPaths')) {
        $paths = New-Object System.Collections.Generic.HashSet[string]
        foreach ($name in @($ChangedPaths)) { [void]$paths.Add($name) }
    } else {
        $refs = ''
        if ($PSBoundParameters.ContainsKey('PushedRefs')) {
            $refs = $PushedRefs
        } elseif (-not [Console]::IsInputRedirected) {
            throw 'No pushed refs on standard input. Run this from the pre-push hook, or pass -ChangedPaths.'
        } else {
            $refs = [Console]::In.ReadToEnd()
        }
        $paths = Get-PushedPaths -Text $refs
    }

    # Every push, whatever it moves: no tracked file may name the maintainer's working-notes folder
    # or a phone's serial. The contract tests hold the working tree to that, but they run for
    # script changes, and the files that once fell back to that folder were tests under patches/
    # and extensions/, which route to the Gradle gates alone. Every commit the push publishes is
    # read straight out of the object store, not only each ref's tip, since a serial one commit
    # adds and the next removes still goes out in the first. That needs no worktree and takes a
    # moment. It runs before the changed paths decide anything: commits that cancel each other out
    # change no file and still go out. A push that publishes no commit, a deletion or a tag of a
    # commit the remote has, has nothing to scan. A run by hand reads the tracked files of this
    # working tree.
    if ($PSBoundParameters.ContainsKey('ChangedPaths')) {
        $scanned = @()
        $scope = 'the working tree'
    } else {
        $scanned = @(@($script:pushedCommits) + @($script:publishedCommits) | Select-Object -Unique)
        $scope = "the $($scanned.Count) commit(s) this push publishes"
    }
    $named = @()
    if ($PSBoundParameters.ContainsKey('ChangedPaths') -or $scanned.Count -gt 0) {
        $named = @(Find-MachineNames -Root $Root -Commit $scanned)
    }
    if ($named.Count -gt 0) {
        # Each hit is a line git grep printed, <commit>:<path>:<line>:<text> when read out of a
        # commit. A hit in a binary file prints that file's bytes, and a carriage return among them
        # splits the line into pieces that don't open with a commit, so the commits are taken only
        # from lines that do, and control characters are shown as ?.
        $hits = @($named | Where-Object { ([string]$_) -match '^[0-9a-f]{40}:' })
        if ($hits.Count -eq 0) { $hits = $named }
        $shown = @($hits | Select-Object -First 5 | ForEach-Object { ([string]$_) -replace '\p{Cc}', '?' }) -join '; '
        if ($scanned.Count -eq 0) {
            throw ("Tracked files in the working tree name the maintainer's machine or phone, and a push " +
                "would publish them: $shown")
        }
        $carriers = @($hits | ForEach-Object { ([string]$_).Split(':')[0] } | Select-Object -Unique)
        throw ("Tracked files in commit $($carriers -join ', ') name the maintainer's machine or phone, " +
            'and this push would publish them. A commit on top leaves them in the history it publishes, ' +
            "so rewrite the commit that added them: $shown")
    }
    if ($PSBoundParameters.ContainsKey('ChangedPaths') -or $scanned.Count -gt 0) {
        Write-Step "no tracked file in $scope names a machine or phone"
    } else {
        Write-Step 'the push publishes no commit, so there is nothing to scan'
    }

    # Nor may a text file the push changes hold an unresolved merge conflict: a line that opens one,
    # sets off its base or closes it, the way git writes them. A CHANGELOG reached main with a whole
    # conflict in it and every gate passed it. ======= alone is left out, since Markdown underlines
    # a heading with it, and a conflict always carries the lines around it. Read from each pushed
    # tip, which is what the ref will hold, or from the working tree by hand.
    $conflicts = New-Object System.Collections.Generic.List[string]
    $sources = if ($PSBoundParameters.ContainsKey('ChangedPaths')) { @('') } else { @($script:pushedCommits) }
    foreach ($tip in $sources) {
        $found = @(Invoke-GitQuietly (@('grep', '-n', '-I', '-E', '-e', '^(<<<<<<<|\|\|\|\|\|\|\||>>>>>>>)( |$)') +
            @($tip | Where-Object { $_ }) + @('--', '.')))
        # 1 is git grep's "no match". Anything above it means the search did not run.
        if ($LASTEXITCODE -gt 1) {
            throw "git grep could not search $(if ($tip) { "commit $tip" } else { 'the tracked files' }) for merge conflicts."
        }
        foreach ($line in $found) {
            $hit = [regex]::Match([string]$line, '^(?:[0-9a-f]{40}:)?(?<path>.+?):\d+:')
            if ($hit.Success -and $paths.Contains($hit.Groups['path'].Value)) { $conflicts.Add((([string]$line) -replace '\p{Cc}', '?')) }
        }
    }
    if ($conflicts.Count -gt 0) {
        throw ('A file this push changes holds an unresolved merge conflict. Resolve it and commit again: ' +
            (@($conflicts | Select-Object -First 5) -join '; '))
    }

    if ($paths.Count -eq 0) {
        Write-Step 'nothing to check'
        exit 0
    }

    # The files outside the source trees that the runtime tests read. ReadmePatchNamesTest holds the
    # README's patch rows to the catalog, ProvenanceTest holds NOTICE and every source's header to
    # provenance.json, PatchFamilyTest and LicenseNoticeTest read the catalog and NOTICE, and
    # ShortcutCallsTest holds the settings patch's shortcut rewrite to the no-call rules in the
    # mutation contracts. The Gradle files declare them as test inputs, so the tests rerun when one
    # moves, but a push of one alone never started them: a README patch row went out with
    # ReadmePatchNamesTest never run on it.
    $runtimeTestInputs = @('README.md', 'NOTICE', 'provenance.json', 'patches-list.json',
        'scripts/injected-mutation-contracts.txt')
    $touchesCode = @($paths | Where-Object {
        $_ -like 'extensions/*' -or $_ -like 'patches/*' -or
        # The pins and the reviewed checksums. Two Gradle tasks hold the Bouncy Castle graphs to
        # the reviewed release, and they only run on the way to a test task; a push that moved
        # the pin alone ran the release facts check, which knows nothing about them.
        $_ -eq 'gradle/libs.versions.toml' -or $_ -eq 'gradle/verification-metadata.xml' -or
        $_ -eq 'settings.gradle.kts' -or $_ -eq 'build.gradle.kts' -or
        $_ -in $runtimeTestInputs
    }).Count -gt 0
    $buildAdvisoryInputs = @('scripts/build-advisories.ps1', 'scripts/build-advisory-exceptions.txt',
        'scripts/test-build-advisories.ps1', 'scripts/release-advisories.ps1',
        'gradle.properties', 'gradle/wrapper/gradle-wrapper.properties', 'gradle/wrapper/gradle-wrapper.jar')
    $touchesBuildAdvisories = $touchesCode -or @($paths | Where-Object { $_ -in $buildAdvisoryInputs }).Count -gt 0
    $touchesScripts = @($paths | Where-Object { $_ -like 'scripts/*' }).Count -gt 0
    # The contract tests read two files outside scripts/ that nothing else checks: the catalog,
    # held to the builds, signers and dependencies the release scripts expect, and the Gradle file
    # that writes the release bundle where common.ps1 reads it. A push that moved only one of them
    # never ran the tests, and the break surfaced on the next unrelated script push instead.
    # They also copy the README into the release facts fixture and hold it to the catalog, so a
    # push of only the README runs them too.
    $touchesContracts = $touchesScripts -or @($paths | Where-Object {
        $_ -eq 'patches-list.json' -or $_ -eq 'patches/build.gradle.kts' -or $_ -in @(
            'README.md', 'assets/icon.png', 'assets/readme-hero.png',
            'concepts/marketing/2026-10-01/artwork-brief.txt',
            'concepts/marketing/2026-10-01/selected/logo-master.png',
            'concepts/marketing/2026-10-01/selected/hero-master.png')
    }).Count -gt 0
    $injectedRegisterVerifierPaths = @(
        'scripts/BadDexFixture.java',
        'scripts/DexDiff.java',
        'scripts/injected-mutation-contracts.txt',
        'scripts/injected-register-contracts.ps1',
        'scripts/injected-register-removal-allowlist.txt',
        'scripts/script-wiring.ps1',
        'scripts/test-injected-registers.ps1',
        'scripts/verify-all-patches.ps1',
        'scripts/verify-injected-registers.ps1'
    )
    $touchesInjectedRegisterVerifier = @($paths | Where-Object {
        $_ -in $injectedRegisterVerifierPaths
    }).Count -gt 0
    $resourceTableCheckPaths = @(
        'scripts/MergeSplits.java',
        'scripts/ResourceTableCheck.java',
        'scripts/test-resource-table-check.ps1',
        'scripts/verify-all-patches.ps1'
    )
    $touchesResourceTableCheck = @($paths | Where-Object {
        $_ -in $resourceTableCheckPaths
    }).Count -gt 0
    $injectedRegisterDevicePaths = @(
        'scripts/injected-register-device.ps1',
        'scripts/script-wiring.ps1',
        'scripts/test-injected-register-device.ps1',
        'scripts/verify-injected-registers.ps1'
    )
    $touchesInjectedRegisterDevice = @($paths | Where-Object {
        $_ -in $injectedRegisterDevicePaths
    }).Count -gt 0
    $fingerprintCandidatePaths = @(
        'scripts/FingerprintCandidates.java',
        'scripts/FingerprintFixture.java',
        'scripts/fingerprint-calibration.txt',
        'scripts/fingerprint-candidates.ps1',
        'scripts/fingerprint-signature.schema.json',
        'scripts/test-fingerprint-candidates.ps1'
    )
    $touchesFingerprintCandidates = @($paths | Where-Object {
        $_ -in $fingerprintCandidatePaths
    }).Count -gt 0
    # The source ledger's rules read NOTICE, provenance.json and the catalog's declared builds, and
    # hold docs/sources.md to the ledger, so a push of any of them runs the ledger's suite too.
    $telegramSourcePaths = @(
        'NOTICE',
        'docs/sources.md',
        'patches-list.json',
        'provenance.json',
        'scripts/audit-telegram-sources.ps1',
        'scripts/telegram-sources.ps1',
        'scripts/patch-target.ps1',
        'scripts/test-telegram-sources.ps1',
        'sources/telegram-sources.json'
    )
    $touchesTelegramSources = @($paths | Where-Object {
        $_ -in $telegramSourcePaths
    }).Count -gt 0
    $touchesRelease = @($paths | Where-Object {
        $_ -eq 'patches-bundle.json' -or $_ -eq 'patches-list.json' -or
        $_ -eq 'gradle.properties' -or $_ -eq 'README.md' -or
        # The pins the release check holds the bundle and the README to. A push that moved
        # only one of these ran no gate at all.
        $_ -eq 'gradle/libs.versions.toml' -or $_ -eq 'settings.gradle.kts' -or
        $_ -eq 'gradle/verification-metadata.xml' -or
        $_ -eq 'gradle/wrapper/gradle-wrapper.properties' -or
        # The receipt is the file the release check holds a release to, and the allowlist is
        # what decides which manifest changes it accepts. A push that moved only one of those
        # ran the script contract tests at most, and never the check that reads them.
        $_ -like 'release-receipt-*.json' -or
        $_ -eq 'scripts/manifest-delta-allowlist.txt' -or
        # A released version's heading is the only record a reader has that it shipped, and one
        # was renamed away by a post-release commit that no gate read.
        $_ -eq 'CHANGELOG.md' -or
        # Its version placeholders are held to the target and the published index.
        $_ -eq '.github/ISSUE_TEMPLATE/bug_report.yml'
    }).Count -gt 0

    # Before the first release there are no release facts to hold a push to: no patches-bundle.json
    # for Manager to read and no release tag, and the check starts by requiring the index. Without
    # this every README or CHANGELOG push stopped until the release that creates them, and that
    # push carries the index, so it gets the full check. Once a v* tag exists this never applies
    # again, so deleting the index later can't switch the check off.
    if ($touchesRelease -and -not $script:rewritesIndex) {
        $released = @(Invoke-HookGit @('-C', $Root, 'tag', '--list', 'v*')).Count -gt 0
        $indexed = if ($PSBoundParameters.ContainsKey('ChangedPaths') -or $script:pushedCommits.Count -eq 0) {
            Test-Path -LiteralPath (Join-Path $Root 'patches-bundle.json') -PathType Leaf
        } else {
            @($script:pushedCommits | Where-Object {
                @(Invoke-HookGit @('-C', $Root, 'ls-tree', '--name-only', $_, '--', 'patches-bundle.json')).Count -gt 0
            }).Count -gt 0
        }
        if (-not $released -and -not $indexed) {
            Write-Step ('a published file changed, but nothing has been released yet (no patches-bundle.json ' +
                'and no release tag), so there are no release facts to check')
            $touchesRelease = $false
        }
    }

    # Every gate checks each pushed tip in its own checkout, even clean HEAD. Independent pushes
    # therefore share neither sources nor outputs. Runs by hand snapshot current edits instead.
    if ($PSBoundParameters.ContainsKey('ChangedPaths')) {
        $gateCommits = @($null)
    } else {
        $gateCommits = @($script:pushedCommits)
        if ($gateCommits.Count -eq 0) {
            $gateCommits = @(([string](Invoke-HookGit @('-C', $Root, 'rev-parse', 'HEAD') | Select-Object -Last 1)).Trim())
        }
    }

    # Script, notice, failure message. The contract tests run for every script change and for the
    # other files above; the two injected-register suites and the resource table check's run only
    # when their own files moved, and the source ledger's when the ledger or a file its rules read
    # did. Each one is the pushed commit's copy, run against that commit.
    $suites = @()
    if ($touchesContracts) {
        $contractsNotice = if ($touchesScripts) { 'scripts changed, running their contract tests' } else {
            'the catalog, the release bundle''s Gradle file, the README or the artwork changed, running the script contract tests'
        }
        $suites += , @('scripts/test-script-contracts.ps1', $contractsNotice,
            'The script contract tests did not pass.')
    }
    if ($touchesInjectedRegisterVerifier) {
        $suites += , @('scripts/test-injected-registers.ps1', 'injected-register verifier changed, running its fixture tests',
            'The injected-register verifier fixture tests did not pass.')
    }
    if ($touchesResourceTableCheck) {
        $suites += , @('scripts/test-resource-table-check.ps1', 'resource table check changed, running its fixture tests',
            'The resource table check fixture tests did not pass.')
    }
    if ($touchesInjectedRegisterDevice) {
        $suites += , @('scripts/test-injected-register-device.ps1', 'injected-register device helper changed, running its cleanup fixtures',
            'The injected-register device cleanup fixtures did not pass.')
    }
    if ($touchesFingerprintCandidates) {
        $suites += , @('scripts/test-fingerprint-candidates.ps1', 'fingerprint ranking changed, running its calibration',
            'The fingerprint ranking calibration did not pass.')
    }
    if ($touchesTelegramSources) {
        $suites += , @('scripts/test-telegram-sources.ps1', 'the Telegram source ledger or what it reads changed, running its rules',
            'The Telegram source ledger does not keep its rules.')
    }
    $tasks = @(':patches:buildDependencyReport')
    if ($touchesCode) { $tasks += @(
        ':extensions:telegram:test',
        ':patches:test',
        ':extensions:shared:library:lint',
        ':extensions:telegram:lint'
    ) }
    $wrapper = $env:HUSHTELEGRAM_BUILD_WRAPPER
    if ($touchesBuildAdvisories -and $wrapper -and -not (Test-Path -LiteralPath $wrapper -PathType Leaf)) {
        throw "HUSHTELEGRAM_BUILD_WRAPPER names $wrapper, which is not there."
    }

    # Gradle on a gate checkout: through the wrapper HUSHTELEGRAM_BUILD_WRAPPER names, which queues
    # its builds itself, or gradlew.bat, which waits for a slot here. The exit code is left in
    # $LASTEXITCODE.
    function Invoke-GateGradle {
        param([string]$Tree, [string[]]$Tasks)
        $global:LASTEXITCODE = 0
        Invoke-WithoutGitEnvironment {
            Push-Location -LiteralPath $Tree
            try {
                if ($wrapper) {
                    & $wrapper -ProjectDir $Tree -Tasks $Tasks
                } else {
                    $gradlew = Join-Path $Tree 'gradlew.bat'
                    $global:LASTEXITCODE = Invoke-InHushTelegramQueue -Job 'gate' -ScriptBlock { & $gradlew -p $Tree @Tasks }
                }
            } finally { Pop-Location }
        }
    }

    # Whether a gate checkout's Gradle file has :patches:fixtureTest. An older commit's doesn't,
    # and Gradle stops on -x for a task it doesn't know.
    function Test-RegistersFixtureTest {
        param([string]$Tree)
        $gradleFile = Join-Path $Tree 'patches/build.gradle.kts'
        return (Test-Path -LiteralPath $gradleFile -PathType Leaf) -and
            ([IO.File]::ReadAllText($gradleFile) -match 'tasks\.register<Test>\("fixtureTest"\)')
    }

    function Invoke-GateFacts {
        param([string]$Tree, [string]$Commit, [string]$Where)
        Write-Step ('a published file changed, checking the release facts' + $Where)
        $factsFailed = 'The release facts do not agree. Fix them or push with HUSHTELEGRAM_SKIP_PRE_PUSH=1.'
        $validate = Join-Path $Tree 'scripts/validate-release-facts.ps1'
        $arguments = @{ Root = $Tree }
        if ($script:rewritesIndex) {
            # The local evidence was copied from clean pushed HEAD before any gate ran.
            # Validation reads only this invocation's copy, including the release bundle.
            $arguments['VerifyPublishedAsset'] = $true
            $artifacts = @(Get-ChildItem -LiteralPath (Join-Path $Tree 'patches/build/release') `
                -Filter '*.mpp' -File -ErrorAction SilentlyContinue)
            $indexPath = Join-Path $Tree 'patches-bundle.json'
            $indexVersion = $null
            if (Test-Path -LiteralPath $indexPath -PathType Leaf) {
                try {
                    $indexVersion = [string](Get-Content -LiteralPath $indexPath -Raw | ConvertFrom-Json).version
                } catch {
                    throw "patches-bundle.json is not JSON the release check can read: $($_.Exception.Message)"
                }
            }
            $forIndex = @($artifacts | Where-Object { $_.Name -eq "patches-$indexVersion.mpp" })
            $builtHere = if ($artifacts.Count -eq 1) { $artifacts[0] } elseif ($forIndex.Count -eq 1) { $forIndex[0] }
            if ($builtHere) {
                $arguments['ArtifactPath'] = $builtHere.FullName
                $among = if ($artifacts.Count -gt 1) { "found $($artifacts.Count) bundles, so " } else { '' }
                Write-Step "${among}the hosted asset is compared with the owned copy of $($builtHere.Name)"
            } else {
                $arguments['ArtifactIsHosted'] = $true
                $found = if ($artifacts.Count -gt 1) { "found $($artifacts.Count) bundles and none is patches-$indexVersion.mpp" } else { 'no local bundle here' }
                Write-Step "$found, so the hosted asset is downloaded and checked on its own"
            }
        } else {
            $arguments['SkipDescriptionTestCount'] = $true
            $arguments['AllowPublishedIndexLag'] = $true
            # A source-changing gate just built this exact checkout. Any other gate has no
            # test results belonging to its tip and must not import another run's results.
            if (-not $touchesCode -and (Get-Command $validate).Parameters.ContainsKey('SkipTestResults')) {
                $arguments['SkipTestResults'] = $true
            }
        }
        $global:LASTEXITCODE = 0
        Invoke-CommitScript -Script $validate -Arguments $arguments
        if ($LASTEXITCODE -ne 0) { throw $factsFailed }
        Assert-GateUnchanged -Tree $Tree -Commit $Commit -Step 'the release facts check'
    }

    # Cheap checks first, so a broken script or a stale fact stops the push in minutes rather than
    # after the fixture suite: the script suites, then the release facts when they read nothing a
    # build here makes, then Gradle without the fixture tests, the advisory scan and the facts that
    # read the runtime results, and only then the fixture tests.
    if ($suites.Count -gt 0 -or $touchesBuildAdvisories -or $touchesRelease) {
    foreach ($gateCommit in $gateCommits) {
        $gateRoot = Get-GateWorktree -Commit $gateCommit
        $where = if ($gateCommit) { " for $gateCommit in $gateRoot" } else { " in $gateRoot" }
        foreach ($suite in $suites) {
            $suiteScript = Join-Path $gateRoot $suite[0]
            if (-not (Test-Path -LiteralPath $suiteScript -PathType Leaf)) {
                if ($paths.Contains($suite[0])) {
                    throw "$($suite[0]) was deleted in this push. The gate scripts must not lose their tests."
                }
                $inCommit = if ($gateCommit) { $gateCommit } else { 'the working tree' }
                throw "$($suite[0]) is missing from $inCommit. The gate expects it, so the push stops."
            }
            Write-Step ($suite[1] + $where)
            $global:LASTEXITCODE = 0
            Invoke-CommitScript -Script $suiteScript -Arguments @{ Root = $gateRoot }
            if ($LASTEXITCODE -ne 0) { throw $suite[2] }
            Assert-GateUnchanged -Tree $gateRoot -Commit $gateCommit -Step 'the script tests'
        }

        # With no code changed the facts read no test results here (-SkipTestResults), and an
        # index push reads the evidence copied before any gate ran, so nothing below feeds them.
        $factsChecked = $false
        if ($touchesRelease -and -not $touchesCode) {
            Invoke-GateFacts -Tree $gateRoot -Commit $gateCommit -Where $where
            $factsChecked = $true
        }

        if ($touchesBuildAdvisories) {
            if ($touchesCode) {
                Write-Step ('extension or patch sources, or a root file their tests read, changed, ' +
                    'running the runtime tests and the API level check' + $where)
            }
            Write-Step ('checking advisories for the resolved build, test and provided dependencies' + $where)
            $savedFixtureDir = $env:HUSHTELEGRAM_FIXTURE_DIR
            $savedRequiredFixtures = $env:HUSHTELEGRAM_REQUIRE_FIXTURES
            try {
                if ($touchesCode) {
                    $env:HUSHTELEGRAM_FIXTURE_DIR = Assert-PatchFixtures -ProjectRoot $gateRoot
                    $env:HUSHTELEGRAM_REQUIRE_FIXTURES = '1'
                }
                # Require the pushed catalog's fixtures before authenticating or starting Gradle.
                if (-not $env:GITHUB_ACTOR -or -not $env:GITHUB_TOKEN) {
                    if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
                        throw ('Set GITHUB_ACTOR and GITHUB_TOKEN, or install the gh CLI: the patches ' +
                            'plugin resolves from GitHub Packages and cannot be applied without them.')
                    }
                    $login = (& gh api user --jq .login 2>$null)
                    $token = (& gh auth token 2>$null)
                    if ([string]::IsNullOrWhiteSpace($login) -or [string]::IsNullOrWhiteSpace($token)) {
                        throw 'gh is not signed in, so the patches plugin cannot be resolved. Run gh auth login.'
                    }
                    $env:GITHUB_ACTOR = $login
                    $env:GITHUB_TOKEN = $token
                }
                # The quick pass: every task but the fixture tests, which a second run of the same
                # tasks then adds while the rest come back up to date.
                $quickPass = $touchesCode -and (Test-RegistersFixtureTest -Tree $gateRoot)
                $firstTasks = $tasks
                if ($quickPass) {
                    $firstTasks = $tasks + @('-x', ':patches:fixtureTest')
                    Write-Step ('running everything but the fixture tests first' + $where)
                }
                Invoke-GateGradle -Tree $gateRoot -Tasks $firstTasks
                if ($LASTEXITCODE -ne 0) {
                    if (-not $touchesCode) {
                        throw 'The resolved build dependency report could not be generated. Read the dependency resolution or checksum verification failure above.'
                    }
                    throw ('The runtime test build did not pass. Read the output above: it says whether a ' +
                        'test failed, an API level above the payload floor was reached, or the build could ' +
                        'not start. Push anyway with HUSHTELEGRAM_SKIP_PRE_PUSH=1.')
                }
                Assert-GateUnchanged -Tree $gateRoot -Commit $gateCommit -Step 'the runtime test build'
                $buildAdvisories = Join-Path $gateRoot 'scripts/build-advisories.ps1'
                if (-not (Test-Path -LiteralPath $buildAdvisories -PathType Leaf)) {
                    throw "The resolved build advisory checker is missing: $buildAdvisories"
                }
                $global:LASTEXITCODE = 0
                Invoke-CommitScript -Script $buildAdvisories -Arguments @{ Root = $gateRoot }
                if ($LASTEXITCODE -ne 0) { throw 'The resolved build advisory scan did not pass.' }
                Assert-GateUnchanged -Tree $gateRoot -Commit $gateCommit -Step 'the build advisory scan'
                if ($quickPass) {
                    # Off the index, the facts read only the runtime results, which the quick pass
                    # just wrote. An index push quotes the patch test count, so it waits for them all.
                    if ($touchesRelease -and -not $script:rewritesIndex) {
                        Invoke-GateFacts -Tree $gateRoot -Commit $gateCommit -Where $where
                        $factsChecked = $true
                    }
                    Write-Step ('running the fixture tests' + $where)
                    Invoke-GateGradle -Tree $gateRoot -Tasks $tasks
                    if ($LASTEXITCODE -ne 0) {
                        throw ('The fixture tests did not pass. Read the output above for the patch that ' +
                            'failed on a vendor Telegram build. Push anyway with HUSHTELEGRAM_SKIP_PRE_PUSH=1.')
                    }
                    Assert-GateUnchanged -Tree $gateRoot -Commit $gateCommit -Step 'the runtime test build'
                }
            } finally {
                $env:HUSHTELEGRAM_FIXTURE_DIR = $savedFixtureDir
                $env:HUSHTELEGRAM_REQUIRE_FIXTURES = $savedRequiredFixtures
            }
        }

        if ($touchesRelease -and -not $factsChecked) {
            Invoke-GateFacts -Tree $gateRoot -Commit $gateCommit -Where $where
        }
    }
    }

    if (-not $touchesScripts -and -not $touchesCode -and -not $touchesRelease -and -not $touchesContracts -and
            -not $touchesTelegramSources) {
        Write-Step 'no code or published file changed'
    }
    Write-Step 'ok'
    exit 0
} finally {
    try { Remove-GateWorktrees } finally { Pop-Location }
}
