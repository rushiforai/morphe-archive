<#
.SYNOPSIS
    The helpers the release and verification scripts share.

.DESCRIPTION
    Dot-source this beside patch-target.ps1 and patch-report.ps1:

        . (Join-Path $PSScriptRoot 'common.ps1')

    Each of these existed in two to four copies that had already drifted apart. The path guard
    was identical in three scripts; the cleanup helper recursed unconditionally in one and only
    on request in another; the version read appeared four times, twice without -LiteralPath; and
    the desktop CLI was looked up by two functions with different search orders, one returning
    $null and one throwing. Copies of a guard drift in the direction of whichever caller was
    edited last, which is the direction nobody checked.
#>

function Resolve-WithinRoot {
    <#
    .SYNOPSIS
        A generated path, proved to be inside the work directory, or a throw.
    .DESCRIPTION
        Every path these scripts hand to the patcher or delete afterwards goes through this, so
        a run identifier that came out wrong cannot reach outside the directory the caller owns.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Root
    )
    $candidate = [System.IO.Path]::GetFullPath($Path)
    $prefix = $Root.TrimEnd('\') + '\'
    if (-not $candidate.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to use a generated path outside the work directory: $candidate"
    }
    return $candidate
}

function Remove-GeneratedPath {
    <#
    .SYNOPSIS
        Delete something this run generated, inside the work directory, warning rather than
        failing when it will not go.
    .DESCRIPTION
        Recursive by default, because every caller is deleting a run directory and the one copy
        that made it optional had its single caller pass -Recurse anyway. Pass -NoRecurse for a
        single file. A failure here is reported and swallowed on purpose: leaving scratch behind
        is not a reason to fail a run that has already produced its answer.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Root,
        [switch]$NoRecurse
    )
    try {
        $safe = Resolve-WithinRoot -Path $Path -Root $Root
        if (-not (Test-Path -LiteralPath $safe)) { return }
        if ($NoRecurse) { Remove-Item -LiteralPath $safe -Force -ErrorAction Stop }
        else { Remove-Item -LiteralPath $safe -Recurse -Force -ErrorAction Stop }
    } catch {
        Write-Warning "Could not remove generated path: $($_.Exception.Message)"
    }
}

function Get-BundleVersion {
    <#
    .SYNOPSIS
        The version in gradle.properties, which every generated name follows.
    .DESCRIPTION
        -LiteralPath, which two of the four copies of this read were missing: a repository path
        holding a bracket is read as a wildcard otherwise, and the read silently finds nothing.
    #>
    param([Parameter(Mandatory = $true)][string]$Root)

    $path = Join-Path $Root 'gradle.properties'
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        throw "There is no gradle.properties at $path, so the bundle version is unknown."
    }
    $line = @(Get-Content -LiteralPath $path | Where-Object { $_ -match '^\s*version\s*=' }) |
        Select-Object -First 1
    if (-not $line) { throw "gradle.properties names no version: $path" }
    $version = ($line -replace '^\s*version\s*=\s*', '').Trim()
    if (-not $version) { throw "gradle.properties has an empty version: $path" }
    return $version
}

function Get-ReleaseBundlePath {
    <#
    .SYNOPSIS
        Where :patches:buildAndroid leaves the bundle a release publishes.
    .DESCRIPTION
        patches/build/release, never patches/build/libs. The Morphe plugin's buildAndroid adds the
        DEX payload to the jar task's own output in place, so any later task that reruns
        :patches:jar (:patches:test does) wrote the plain jar back over the finished bundle under
        the same name. v0.43.0 shipped that jar, and on 2026-09-21 it happened again between the
        build and the index push. buildAndroid now ends by copying the finished bundle here, where
        no other task writes, with bundle.sha256 beside it.
    #>
    param([Parameter(Mandatory = $true)][string]$Root, [string]$Version)

    if (-not $Version) { $Version = Get-BundleVersion -Root $Root }
    return Join-Path $Root "patches/build/release/patches-$Version.mpp"
}

function Get-SourcesNewerThanBundle {
    <#
    .SYNOPSIS
        The source files written after the bundle was built, newest first.
    .DESCRIPTION
        Only :patches:buildAndroid writes the release bundle, and :patches:test rebuilds
        build/libs without it, so a device build made after a patch change and a test run
        patched with the previous hooks (2026-09-23, Swipe-left controls). Counted: the sources of
        the patches module and its submodules (patches/src/main, patches/<submodule>/src/main,
        the compile-only stubs among them, whose constants can be inlined into patch code), the
        sources of every extension module (extensions/<module>/src/main and
        extensions/<module>/<submodule>/src/main), the Gradle files that shape them, the R8
        rules (*.pro at extensions/ and in each module, extensions/proguard-rules.pro being the
        one every extension's R8 step reads), and NOTICE, which :extensions:telegram compiles
        into the payload for its Licenses row. Build output is never under src/main, so it is not
        walked. build-release-receipt.ps1 refuses a bundle this finds anything newer than.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Root,
        [Parameter(Mandatory = $true)][string]$Bundle
    )

    $built = (Get-Item -LiteralPath $Bundle).LastWriteTimeUtc
    $sourceRoots = @()
    $gradleFiles = @('gradle.properties', 'settings.gradle.kts', 'build.gradle.kts', 'gradle/libs.versions.toml', 'NOTICE') |
        ForEach-Object { Join-Path $Root $_ }
    $ruleDirs = @()
    $patches = Join-Path $Root 'patches'
    $moduleDirs = @()
    if (Test-Path -LiteralPath $patches -PathType Container) {
        $moduleDirs += @(Get-Item -LiteralPath $patches) + @(Get-ChildItem -LiteralPath $patches -Directory |
            Where-Object { $_.Name -notin @('src', 'build') })
    }
    $extensions = Join-Path $Root 'extensions'
    if (Test-Path -LiteralPath $extensions -PathType Container) {
        $ruleDirs += $extensions
        foreach ($module in Get-ChildItem -LiteralPath $extensions -Directory) {
            $moduleDirs += @($module) + @(Get-ChildItem -LiteralPath $module.FullName -Directory |
                Where-Object { $_.Name -notin @('src', 'build') })
        }
    }
    foreach ($dir in $moduleDirs) {
        $sourceRoots += Join-Path $dir.FullName 'src/main'
        $gradleFiles += Join-Path $dir.FullName 'build.gradle.kts'
        $ruleDirs += $dir.FullName
    }
    foreach ($dir in $ruleDirs) {
        $gradleFiles += @(Get-ChildItem -LiteralPath $dir -File -Filter '*.pro' -ErrorAction SilentlyContinue |
            ForEach-Object FullName)
    }
    $newer = New-Object System.Collections.Generic.List[System.IO.FileInfo]
    foreach ($sourceRoot in $sourceRoots) {
        if (-not (Test-Path -LiteralPath $sourceRoot -PathType Container)) { continue }
        foreach ($file in Get-ChildItem -LiteralPath $sourceRoot -File -Recurse) {
            if ($file.LastWriteTimeUtc -gt $built) { $newer.Add($file) }
        }
    }
    foreach ($path in $gradleFiles) {
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { continue }
        $file = Get-Item -LiteralPath $path
        if ($file.LastWriteTimeUtc -gt $built) { $newer.Add($file) }
    }
    return @($newer | Sort-Object LastWriteTimeUtc -Descending)
}

function Resolve-DesktopCli {
    <#
    .SYNOPSIS
        The Morphe desktop CLI jar, or $null, or a throw when the caller cannot do without it.
    .DESCRIPTION
        One search order for both callers: -Explicit, HUSHTELEGRAM_DESKTOP_JAR, HUSHTELEGRAM_WORKDIR,
        then the repository's own build/morphe-tools. Newest by write time rather than by name,
        because the jar ships under its version and sorting those as text puts 1.9.0 above
        1.15.0. -Required turns "nothing found" into a throw naming what to set, which is what
        the second copy of this did and the first did not.
    #>
    param([string]$Explicit, [string]$Root, [switch]$Required)

    # Made absolute through PowerShell's location, the one Test-Path looked in. [IO.Path]::GetFullPath
    # reads the process directory, which Set-Location doesn't move: a relative -DesktopJar that
    # Test-Path found came back as a jar somewhere else, and DexDiff compiled without dexlib2.
    $found = $null
    if ($Explicit -and (Test-Path -LiteralPath $Explicit -PathType Leaf)) {
        $found = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Explicit)
    } elseif ($Explicit) {
        # Named and not there: say so rather than quietly searching somewhere else.
        throw "No Morphe desktop CLI at the path given: $Explicit"
    } elseif ($env:HUSHTELEGRAM_DESKTOP_JAR -and
            (Test-Path -LiteralPath $env:HUSHTELEGRAM_DESKTOP_JAR -PathType Leaf)) {
        $found = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($env:HUSHTELEGRAM_DESKTOP_JAR)
    } else {
        $directories = @($env:HUSHTELEGRAM_WORKDIR)
        if ($Root) { $directories += (Join-Path $Root 'build/morphe-tools') }
        foreach ($directory in $directories) {
            if (-not $directory -or -not (Test-Path -LiteralPath $directory -PathType Container)) { continue }
            $candidate = @(Get-ChildItem -LiteralPath $directory -Filter 'morphe-desktop*.jar' -File `
                -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending |
                Select-Object -First 1)
            if ($candidate.Count -eq 1) { $found = $candidate[0].FullName; break }
        }
    }

    if (-not $found -and $Required) {
        throw ('No Morphe desktop CLI. Pass -DesktopJar, or set HUSHTELEGRAM_DESKTOP_JAR or ' +
            'HUSHTELEGRAM_WORKDIR, or put the jar in build/morphe-tools.')
    }
    return $found
}

function Get-BaseApk {
    <#
    .SYNOPSIS
        The APK whose manifest and resource table describe an app: the file itself, or the base
        APK a split bundle carries, copied out to -Destination.
    .DESCRIPTION
        Telegram ships as a split bundle (APKPure's .xapk, APKMirror's .apkm), not as one APK, and
        aapt2 and the resource check read an APK. The base APK holds the manifest and the app's own
        resource table; the splits hold densities, languages and native code. An .apks or .apkm
        names it base.apk. An .xapk names it after the package and says so in its manifest.json,
        and its config.arm64_v8a split can be the larger file, so size alone can pick the wrong
        one. The largest APK that isn't a config or split_ file is the fallback when nothing names
        the base, and the largest of any is the last resort.

        Both paths are resolved against PowerShell's location before .NET sees them, and the
        answer is a full path. .NET reads a relative path against the process's own directory,
        which a hook, a scheduled task or a session that moved with Set-Location leaves somewhere
        else: `-Apk fixtures\telegram.xapk` then named a file that wasn't there.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Apk,
        [Parameter(Mandatory = $true)][string]$Destination
    )

    $Apk = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Apk)
    $Destination = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination)
    if ([System.IO.Path]::GetExtension($Apk).ToLowerInvariant() -eq '.apk') { return $Apk }
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($Apk)
    try {
        $entry = $zip.Entries | Where-Object { $_.FullName -eq 'base.apk' } | Select-Object -First 1
        $manifestEntry = $zip.Entries | Where-Object { $_.FullName -eq 'manifest.json' } | Select-Object -First 1
        if (-not $entry -and $manifestEntry) {
            # An .xapk's own record of its files: split_apks names the base by id, and the base is
            # <package_name>.apk when that list is missing.
            $reader = New-Object System.IO.StreamReader($manifestEntry.Open())
            try { $manifestText = $reader.ReadToEnd() } finally { $reader.Dispose() }
            $manifest = $null
            try { $manifest = $manifestText | ConvertFrom-Json } catch { $manifest = $null }
            if ($null -ne $manifest) {
                $named = @(@($manifest.PSObject.Properties['split_apks'] | ForEach-Object { $_.Value }) |
                    Where-Object { $null -ne $_ -and "$($_.id)" -eq 'base' } | ForEach-Object { "$($_.file)" }) +
                    @($manifest.PSObject.Properties['package_name'] | Where-Object { $_.Value } | ForEach-Object { "$($_.Value).apk" })
                foreach ($name in $named) {
                    $entry = $zip.Entries | Where-Object { $_.FullName -eq $name } | Select-Object -First 1
                    if ($entry) { break }
                }
            }
        }
        if (-not $entry) {
            $apks = @($zip.Entries | Where-Object { $_.FullName -like '*.apk' } | Sort-Object Length -Descending)
            $entry = @($apks | Where-Object { $_.Name -notmatch '^(?i)(config\.|split_)' }) + $apks | Select-Object -First 1
        }
        if (-not $entry) { throw "$(Split-Path -Leaf $Apk) holds no APK." }
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Destination) | Out-Null
        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $Destination, $true)
    } finally {
        $zip.Dispose()
    }
    return $Destination
}

function Get-MergedApk {
    <#
    .SYNOPSIS
        The one APK the desktop CLI patches: a split bundle merged the way the CLI merges it,
        written to -Destination, or the APK itself when it isn't a bundle.
    .DESCRIPTION
        morphe-desktop merges an .apkm, .apks or .xapk into <name>-merged.apk beside its output,
        patches that, and since 1.17.0 deletes it on the way out. The patched APK's resource table
        and manifest were rebuilt from that merge, so the checks compared them with the base APK
        instead, which lacks every resource the splits carry: on the Facebook sibling's 580 the
        patched table held 7,588 resources base.apk doesn't, and none of them was compared. So the
        scripts merge first,
        with the CLI's own merger and the arguments it passes (MergeSplits.java), and hand the CLI
        the merged APK, which it patches as it is. There is nothing else to fall back to, so a
        merge that fails or writes no APK throws. The extensions are the CLI's own list
        (BundleFormats); anything else goes to the CLI as it is.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Apk,
        [Parameter(Mandatory = $true)][string]$Destination,
        [Parameter(Mandatory = $true)][string]$Java,
        [Parameter(Mandatory = $true)][string]$DesktopJar
    )

    $Apk = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Apk)
    $Destination = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination)
    if ([System.IO.Path]::GetExtension($Apk).TrimStart('.').ToLowerInvariant() -notin @('apkm', 'apks', 'xapk')) {
        return $Apk
    }
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Destination) | Out-Null
    if (Test-Path -LiteralPath $Destination) { Remove-Item -LiteralPath $Destination -Force }
    # Continue for the call alone: Windows PowerShell 5.1 turns a JDK warning on stderr into a
    # terminating error under Stop. The exit code and the file are what decide.
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $output = @(& $Java '-Xmx6g' '-cp' $DesktopJar (Join-Path $PSScriptRoot 'MergeSplits.java') $Apk $Destination 2>&1 |
            ForEach-Object { "$_" })
        $exitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $preference
    }
    # What the merger said, without the stack frames under an exception.
    $said = @($output | Where-Object { $_ -notmatch '^\s+at ' } | Select-Object -Last 3) -join ' '
    if ($exitCode -ne 0) {
        throw "Could not merge $(Split-Path -Leaf $Apk) into one APK (exit $exitCode): $said"
    }
    if (-not (Test-Path -LiteralPath $Destination -PathType Leaf) -or (Get-Item -LiteralPath $Destination).Length -eq 0) {
        throw ("The merge of $(Split-Path -Leaf $Apk) wrote no APK at $Destination, and base.apk is not what " +
            'the CLI patches, so there is nothing to hold the patched APK to.')
    }
    return $Destination
}

function Assert-UrlReachable {
    <#
    .SYNOPSIS
        A HEAD request that has to answer 200, or a throw naming the address and what it said.
    .DESCRIPTION
        validate-release-facts.ps1 fetches the indexed bundle and the Morphe add-source page
        with this on every run. It lives here so the contract tests can call it on its own:
        through the release check, an address has to pass the shape, scheme and host checks
        before it is fetched, and the one case that meant to try a dead link tripped the shape
        check first and never reached the fetch.
    #>
    param(
        [Uri]$Uri,
        [string]$Description,
        [string]$FailureHint
    )
    # -SkipHttpErrorCheck is PowerShell 7 only, and the pre-push hook runs whichever shell it
    # found, so a 404 has to be read out of the thrown response instead. That is the answer this
    # check exists for: the index once named a tag that did not exist yet.
    $status = 0
    try {
        # -UseBasicParsing because Windows PowerShell otherwise hands the reply to the IE
        # parser, which throws a null reference on a HEAD with no body. PowerShell 7 accepts
        # the switch and ignores it.
        $response = Invoke-WebRequest -Uri $Uri -Method Head -MaximumRedirection 5 `
            -TimeoutSec 60 -UseBasicParsing
        $status = [int]$response.StatusCode
    } catch {
        $failed = $_.Exception.Response
        if ($failed -and $failed.StatusCode) {
            $status = [int]$failed.StatusCode
        } else {
            throw ("Could not reach the ${Description} ${Uri}: $($_.Exception.Message). " +
                'If the network is down, push with HUSHTELEGRAM_SKIP_PRE_PUSH=1 and run this again later.')
        }
    }
    if ($status -ne 200) {
        throw ("The ${Description} ${Uri} answered HTTP ${status}. " + $FailureHint)
    }
    Write-Host ("[release] ${Description} answers 200: " + $Uri)
}

function Find-MachineNames {
    <#
    .SYNOPSIS
        The lines of tracked files that name the maintainer's machine or a phone.
    .DESCRIPTION
        The working-notes folder .gitignore keeps out, the backup folders on the maintainer's
        machine that share its name, and an adb serial, a Samsung one being R5C and eight more
        letters or digits. Four fixture tests once fell back to one of those folders, which
        skipped quietly on every other machine and published this one's layout, and five scripts
        carried the test phone's serial. .gitignore is the one file allowed to name what it keeps
        out. Both patterns are built from parts, so the file holding them can't match itself.

        git grep reads bytes, so text in UTF-16 has patterns of its own: every letter followed by a
        NUL for little-endian, the way Windows PowerShell's > writes a file, or preceded by one for
        big-endian. They go through git grep's Perl regexes, which read \x00. A git built without
        them can't search, which throws like any search that doesn't run.

        With -Commit the files are read out of those commits, which is what a push publishes, and
        no worktree is needed: git grep reads them all in one pass and puts the commit in front of
        each hit, <commit>:<path>:<line>:<text>. Without it, the tracked files as they stand in the
        working tree. GIT_* variables are cleared for the search, so it reads the repository -Root
        names, and a search that doesn't run throws rather than reading as a clean tree. Every hit
        comes back as git grep prints it; none at all comes back as nothing, so callers wrap it in @().
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Root,
        [string[]]$Commit,
        # A hundred commits to a git grep keeps its command line inside what Windows allows. The
        # contract tests pass a smaller one, to reach every batch with a handful of commits.
        [int]$BatchSize = 100
    )

    $commits = @($Commit | Where-Object { $_ })
    $batches = New-Object System.Collections.Generic.List[object]
    if ($commits.Count -eq 0) { $batches.Add(@()) }
    for ($i = 0; $i -lt $commits.Count; $i += $BatchSize) {
        $batches.Add(@($commits | Select-Object -Skip $i -First $BatchSize))
    }
    $hits = New-Object System.Collections.Generic.List[string]
    $saved = @{}
    foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
        $saved[$variable.Name] = $variable.Value
        Remove-Item -LiteralPath ('Env:\' + $variable.Name)
    }
    # Windows PowerShell 5.1 turns a native command's stderr into a terminating error under Stop,
    # even redirected, and git grep says why it could not search on stderr.
    $wideLe = { param([string[]]$Parts) ($Parts | ForEach-Object { "$_\x00" }) -join '' }
    $wideBe = { param([string[]]$Parts) ($Parts | ForEach-Object { "\x00$_" }) -join '' }
    $notes = @('c', 'l', 'a', 'u', 'd', 'e')
    $serial = @('R', '5', 'C')
    $scans = @(
        @{ Name = 'the notes folder'; Flags = @('-i', '-P')
            Pattern = @(($notes -join ''), (& $wideLe $notes), (& $wideBe $notes)) -join '|' }
        @{ Name = 'a phone serial'; Flags = @('-P')
            Pattern = @((($serial -join '') + '[A-Z0-9]{8}'), ((& $wideLe $serial) + '(?:[A-Z0-9]\x00){8}'),
                ((& $wideBe $serial) + '(?:\x00[A-Z0-9]){8}')) -join '|' }
    )
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        foreach ($scan in $scans) {
            foreach ($batch in $batches) {
                $arguments = @('-C', $Root, 'grep', '-n', '-a') + $scan.Flags + @('-e', $scan.Pattern) + @($batch) +
                    @('--', '.', ':!.gitignore')
                $found = @(& git @arguments 2>$null)
                # 1 is git grep's "no match". Anything above it means the search did not run.
                if ($LASTEXITCODE -gt 1) {
                    $what = if ($batch.Count -gt 0) { "commit $($batch -join ', ')" } else { 'the tracked files' }
                    throw "git grep could not search $what in $Root for $($scan.Name)."
                }
                foreach ($line in $found) { $hits.Add([string]$line) }
            }
        }
    } finally {
        $ErrorActionPreference = $preference
        foreach ($name in $saved.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $saved[$name] }
    }
    $global:LASTEXITCODE = 0
    return $hits.ToArray()
}

function Invoke-InHushTelegramQueue {
    <#
    .SYNOPSIS
        Runs a heavy job in a slot of the machine-wide build queue, labelled "hushtelegram <Job>",
        and returns its exit code.
    .DESCRIPTION
        Several projects' builds share this machine's cores. BUILD_QUEUE_SCRIPT names the queue's
        script, which defines Invoke-InBuildQueue: the job waits for a free slot, runs at low
        priority on that slot's cores and shows in the script's -Status while it runs. A desktop
        CLI run patches the whole Telegram APK, as heavy as a Gradle build, and used to start
        whenever it was asked. A hook, or a shell started before the variable was set, may lack
        it, so the user's environment is read too. BUILD_QUEUE_PRIORITY=release, which the release
        stages set, puts the job ahead of everyday builds.

        Unset, or naming no file, the job runs straight away with a warning. HUSHTELEGRAM_QUEUED_JOB
        is set for the job's length either way, so a script that queues itself by running itself
        again inside the slot knows it's already there. The queue script is dot-sourced here, in
        this function's scope, so its parameters can't land in the caller's variables.

        The block runs inside the queue's functions and finds the caller's variables by dynamic
        scope, so it mustn't read one named like theirs: Label, Priority, Run, Status, ScriptBlock,
        Job, held or process. Those resolve to the queue's own values first.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Job,
        [Parameter(Mandatory = $true)][scriptblock]$ScriptBlock
    )
    $queueScript = $env:BUILD_QUEUE_SCRIPT
    if ([string]::IsNullOrWhiteSpace($queueScript)) {
        $queueScript = [Environment]::GetEnvironmentVariable('BUILD_QUEUE_SCRIPT', [EnvironmentVariableTarget]::User)
    }
    $queueLabel = "hushtelegram $Job"
    $queuePriority = if ($env:BUILD_QUEUE_PRIORITY -eq 'release') { 'release' } else { 'normal' }
    $savedQueuedJob = $env:HUSHTELEGRAM_QUEUED_JOB
    $env:HUSHTELEGRAM_QUEUED_JOB = $Job
    try {
        if ([string]::IsNullOrWhiteSpace($queueScript) -or -not (Test-Path -LiteralPath $queueScript -PathType Leaf)) {
            Write-Warning ("BUILD_QUEUE_SCRIPT is unset or names no file, so $queueLabel runs now, outside the " +
                'machine-wide build queue. Point it at the queue script to share the cores with other builds.')
            $global:LASTEXITCODE = 0
            & $ScriptBlock | Out-Host
            return $LASTEXITCODE
        }
        . $queueScript
        return (Invoke-InBuildQueue -Label $queueLabel -Priority $queuePriority -ScriptBlock $ScriptBlock)
    } finally {
        $env:HUSHTELEGRAM_QUEUED_JOB = $savedQueuedJob
    }
}

function Import-UserEnvironment {
    <#
    .SYNOPSIS
        Fills each named variable this process has unset or empty from the user's environment.
    .DESCRIPTION
        A git hook runs with git's environment, which can predate a variable set in the user scope
        or leave it out. Empty counts as unset: pwsh keeps a variable set to an empty string, where
        Windows PowerShell removes it, so an empty HUSHTELEGRAM_BUILD_WRAPPER would otherwise win
        over the user's and the gate would run gradlew outside the wrapper. A value of spaces is
        left alone, since the fixture gate tests set one to keep the machine's folder out of a
        case, and so is a user value that's blank too. -ReadUser stands in for the registry in the
        contract tests.
    #>
    param(
        [Parameter(Mandatory = $true)][string[]]$Name,
        [scriptblock]$ReadUser = {
            param([string]$Variable)
            [Environment]::GetEnvironmentVariable($Variable, [EnvironmentVariableTarget]::User)
        }
    )
    foreach ($variable in $Name) {
        if (-not [string]::IsNullOrEmpty([Environment]::GetEnvironmentVariable($variable))) { continue }
        $value = [string](& $ReadUser $variable)
        if (-not [string]::IsNullOrWhiteSpace($value)) { Set-Item -LiteralPath "Env:\$variable" -Value $value }
    }
}
