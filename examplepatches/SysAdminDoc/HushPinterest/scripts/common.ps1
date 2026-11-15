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
        one every extension's R8 step reads), and NOTICE, which :extensions:pinterest compiles
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
        One search order for both callers: -Explicit, HUSHPINTEREST_DESKTOP_JAR, HUSHPINTEREST_WORKDIR,
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
    } elseif ($env:HUSHPINTEREST_DESKTOP_JAR -and
            (Test-Path -LiteralPath $env:HUSHPINTEREST_DESKTOP_JAR -PathType Leaf)) {
        $found = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($env:HUSHPINTEREST_DESKTOP_JAR)
    } else {
        $directories = @($env:HUSHPINTEREST_WORKDIR)
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
        throw ('No Morphe desktop CLI. Pass -DesktopJar, or set HUSHPINTEREST_DESKTOP_JAR or ' +
            'HUSHPINTEREST_WORKDIR, or put the jar in build/morphe-tools.')
    }
    return $found
}

function Enter-HushPinterestQueue {
    <#
    .SYNOPSIS
        Waits for a slot in the machine's build queue for one heavy job, or returns $null at once
        when BUILD_QUEUE_SCRIPT names no queue. Hand what it returns to Exit-HushPinterestQueue in
        a finally block.
    .DESCRIPTION
        A CLI patch run, a split bundle merge and the resource table and dex checks each start a
        JVM with a heap of 4 to 8 GB. Started beside the Gradle builds the queue already holds,
        they ran on the same cores, and build-queue.ps1 -Status never showed them. The script
        BUILD_QUEUE_SCRIPT names defines Enter-BuildQueue, Exit-BuildQueue and
        Get-BuildQueueMask. The job waits there as "hushpinterest <Job>", then runs on its slot's
        cores at below normal priority, which the JVM it starts inherits. A release run sets
        BUILD_QUEUE_PRIORITY=release, which the queue reads to put it ahead of everyday builds,
        and a job started inside a slot (BUILD_QUEUE_TICKET) goes straight through.

        The queue's Invoke-InBuildQueue takes a script block and sends its output to the host.
        The callers here keep each job's output and read its exit code where they make the call,
        so the queue is entered and left around that call instead.
    #>
    param([Parameter(Mandatory = $true)][string]$Job)

    $queueScript = $env:BUILD_QUEUE_SCRIPT
    if ([string]::IsNullOrWhiteSpace($queueScript)) { return $null }
    if (-not (Test-Path -LiteralPath $queueScript -PathType Leaf)) {
        throw ("BUILD_QUEUE_SCRIPT names $queueScript, which is not there. Correct it, or clear it " +
            'to run without the build queue.')
    }
    $queueLabel = "hushpinterest $Job"
    $exitCode = $global:LASTEXITCODE
    # In a scope of its own: the queue script's parameters, -Label among them, bind wherever it's
    # dot-sourced, and here they would replace this function's variables.
    $entered = @(& {
        . $queueScript
        $ticket = Enter-BuildQueue -Label $queueLabel
        $mask = if ($ticket) { Get-BuildQueueMask -Slot $ticket.slot } else { $null }
        [pscustomobject]@{ Ticket = $ticket; Mask = $mask }
    })[-1]
    $process = [System.Diagnostics.Process]::GetCurrentProcess()
    $held = [pscustomobject]@{
        Script        = $queueScript
        Ticket        = $entered.Ticket
        Affinity      = $process.ProcessorAffinity
        PriorityClass = $process.PriorityClass
    }
    try {
        if ($null -ne $entered.Mask) { $process.ProcessorAffinity = $entered.Mask }
        $process.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::BelowNormal
    } catch {
        Exit-HushPinterestQueue -Held $held
        throw
    }
    $global:LASTEXITCODE = $exitCode
    return $held
}

function Exit-HushPinterestQueue {
    <#
    .SYNOPSIS
        Gives back what Enter-HushPinterestQueue took: the cores, the priority and the slot. Keeps
        $LASTEXITCODE, the job's exit code, for the caller to read.
    #>
    param($Held)

    if ($null -eq $Held) { return }
    $exitCode = $global:LASTEXITCODE
    try {
        $process = [System.Diagnostics.Process]::GetCurrentProcess()
        $process.ProcessorAffinity = $Held.Affinity
        $process.PriorityClass = $Held.PriorityClass
    } finally {
        if ($null -ne $Held.Ticket) {
            $queueScript = $Held.Script
            $queueTicket = $Held.Ticket
            & {
                . $queueScript
                Exit-BuildQueue -Ticket $queueTicket
            }
        }
        $global:LASTEXITCODE = $exitCode
    }
}

function Get-BaseApk {
    <#
    .SYNOPSIS
        The APK whose manifest and resource table describe an app: the file itself, or the base
        APK a split bundle carries, copied out to -Destination.
    .DESCRIPTION
        Pinterest ships as a split bundle (APKPure's .xapk, APKMirror's .apkm), not as one APK, and
        aapt2 and the resource check read an APK. The base APK holds the manifest and the app's own
        resource table; the splits hold densities, languages and native code. An .apks or .apkm
        names it base.apk. An .xapk names it after the package and says so in its manifest.json,
        and its config.arm64_v8a split can be the larger file, so size alone can pick the wrong
        one. The largest APK that isn't a config or split_ file is the fallback when nothing names
        the base, and the largest of any is the last resort.

        Both paths are resolved against PowerShell's location before .NET sees them, and the
        answer is a full path. .NET reads a relative path against the process's own directory,
        which a hook, a scheduled task or a session that moved with Set-Location leaves somewhere
        else: `-Apk fixtures\pinterest.xapk` then named a file that wasn't there.
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
    # terminating error under Stop. The exit code and the file are what decide. The merge waits
    # for a slot in the machine's build queue first, as the patch run after it does.
    $preference = $ErrorActionPreference
    $queued = Enter-HushPinterestQueue -Job 'merge'
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $output = @(& $Java '-Xmx6g' '-cp' $DesktopJar (Join-Path $PSScriptRoot 'MergeSplits.java') $Apk $Destination 2>&1 |
            ForEach-Object { "$_" })
        $exitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $preference
        Exit-HushPinterestQueue $queued
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
        with this on every run.
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
                'If the network is down, push with HUSHPINTEREST_SKIP_PRE_PUSH=1 and run this again later.')
        }
    }
    if ($status -ne 200) {
        throw ("The ${Description} ${Uri} answered HTTP ${status}. " + $FailureHint)
    }
    Write-Host ("[release] ${Description} answers 200: " + $Uri)
}

function Test-RepoDescriptionNamesFacts {
    <#
    .SYNOPSIS
        Whether the repository description names a release version, a patch count or a Pinterest
        build. One that names none of them has nothing a release can leave stale, so a release
        neither holds it to the catalog nor rewrites it.
    #>
    param([Parameter(Mandatory = $true)][AllowEmptyString()][string]$Description)
    # Matched with case, the way the release facts check reads them, and the build has to follow
    # Pinterest itself, not the end of HushPinterest.
    return ($Description -cmatch '\bv\d+\.\d+\.\d+\b' -or $Description -cmatch '(?<![\d.])\d+ patches\b' -or
        $Description -cmatch '(?<![A-Za-z])Pinterest\s+\d+(?:\.\d+)+(?!\d)')
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
        # A hundred commits to a git grep keeps its command line inside what Windows allows.
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

function Resolve-HostReferenceStubs {
    <#
    .SYNOPSIS
        The Android SDK public stubs and API history the host reference check reads, or a throw
        saying how to get them.
    .DESCRIPTION
        Taken from -AndroidJar and -ApiVersions when given. Otherwise platform 36 of the SDK aapt2
        sits in, then ANDROID_HOME, ANDROID_SDK_ROOT and the default SDK folder, with the API
        history beside it in data/. verify-injected-registers.ps1 runs the check with these, and
        an applied record's key hashes the same two files, so the record and the run can't name
        different stubs.
    #>
    param([string]$AndroidJar, [string]$ApiVersions, [string]$Aapt2)

    if (-not $AndroidJar) {
        $sdkRoots = @()
        if ($Aapt2) { $sdkRoots += Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $Aapt2)) }
        $sdkRoots += @($env:ANDROID_HOME, $env:ANDROID_SDK_ROOT)
        if ($env:LOCALAPPDATA) { $sdkRoots += Join-Path $env:LOCALAPPDATA 'Android/Sdk' }
        foreach ($sdk in $sdkRoots | Where-Object { $_ }) {
            $candidate = Join-Path $sdk 'platforms/android-36/android.jar'
            if (Test-Path -LiteralPath $candidate -PathType Leaf) { $AndroidJar = $candidate; break }
        }
    }
    if (-not $AndroidJar -or -not (Test-Path -LiteralPath $AndroidJar -PathType Leaf)) {
        throw 'Android SDK public stubs are required for host reference verification. Pass -AndroidJar and -ApiVersions, or install Android SDK Platform 36.'
    }
    if (-not $ApiVersions) { $ApiVersions = Join-Path (Split-Path -Parent $AndroidJar) 'data/api-versions.xml' }
    if (-not (Test-Path -LiteralPath $ApiVersions -PathType Leaf)) { throw "SDK API history is missing: $ApiVersions" }
    return [pscustomobject]@{ AndroidJar = $AndroidJar; ApiVersions = $ApiVersions }
}

function Get-AppliedRecordVerifierFiles {
    <#
    .SYNOPSIS
        The files under scripts/ whose content decides whether a fixture apply passes.
    .DESCRIPTION
        The scripts that patch and check (verify-all-patches.ps1 and everything it dot-sources or
        runs), the Java checks they start, DexDiff.java among them, and the contract and allowlist
        files those read. An applied record's key hashes every one, so an edit to any of them
        makes a kept result useless and the next run patches again. Keep this list in step with
        what verify-all-patches.ps1 and verify-injected-registers.ps1 actually load.
    #>
    return @(
        'verify-all-patches.ps1', 'verify-injected-registers.ps1', 'injected-register-contracts.ps1',
        'injected-register-device.ps1', 'device-lease.ps1', 'release-receipt.ps1', 'patch-report.ps1',
        'patch-target.ps1', 'common.ps1', 'Resolve-Java.ps1',
        'DexDiff.java', 'HostReferences.java', 'ResourceTableCheck.java', 'MergeSplits.java',
        'injected-mutation-contracts.txt', 'injected-register-removal-allowlist.txt',
        'host-reference-contracts.txt', 'manifest-delta-allowlist.txt'
    )
}

function Get-AppliedRecordStore {
    <#
    .SYNOPSIS
        The folder applied records are kept in: -Path, else HUSHPINTEREST_APPLY_RECORDS, else
        hushpinterest-fixture-apply in the temp folder. Not created here.
    .DESCRIPTION
        One folder for every checkout and gate worktree. A record's name is its key, which hashes
        what it was made from, so two checkouts can't read each other's record unless they patched
        the same bytes with the same verifier.
    #>
    param([string]$Path)

    if (-not $Path) { $Path = $env:HUSHPINTEREST_APPLY_RECORDS }
    if (-not $Path) { $Path = Join-Path ([System.IO.Path]::GetTempPath()) 'hushpinterest-fixture-apply' }
    return [System.IO.Path]::GetFullPath($ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path))
}

function Get-AppliedRecordKey {
    <#
    .SYNOPSIS
        The key a fixture apply is kept under, and the inputs it was made from.
    .DESCRIPTION
        SHA-256 over one line per input: the bundle, the fixture, the catalog, the selected patch
        names in ordinal order, whether the run was forced, the desktop CLI, the SDK stubs the host
        reference check reads, and every file Get-AppliedRecordVerifierFiles names. A change to
        any one of them gives another key, so nothing kept before it can be found.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Bundle,
        [Parameter(Mandatory = $true)][string]$Fixture,
        [Parameter(Mandatory = $true)][string]$PatchList,
        [Parameter(Mandatory = $true)][string[]]$PatchNames,
        [Parameter(Mandatory = $true)][bool]$Forced,
        [Parameter(Mandatory = $true)][string]$DesktopJar,
        [Parameter(Mandatory = $true)][string]$AndroidJar,
        [Parameter(Mandatory = $true)][string]$ApiVersions,
        # The folder the verifier files are read from: the scripts folder this file is in.
        [string]$ScriptRoot = $PSScriptRoot
    )

    $hash = {
        param([string]$Path, [string]$What)
        if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { throw "Cannot key an applied record without the ${What}: $Path" }
        (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
    }
    $names = [string[]]@($PatchNames | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
    if ($names.Count -eq 0) { throw 'Cannot key an applied record without a patch selection.' }
    [System.Array]::Sort($names, [System.StringComparer]::Ordinal)
    $files = [ordered]@{}
    foreach ($name in Get-AppliedRecordVerifierFiles) {
        $files[$name] = & $hash (Join-Path $ScriptRoot $name) "verifier file $name"
    }
    $inputs = [ordered]@{
        bundle      = & $hash $Bundle 'bundle'
        fixture     = & $hash $Fixture 'fixture'
        patchList   = & $hash $PatchList 'patch list'
        patches     = $names
        forced      = [bool]$Forced
        desktopCli  = & $hash $DesktopJar 'desktop CLI'
        androidJar  = & $hash $AndroidJar 'SDK public stubs'
        apiVersions = & $hash $ApiVersions 'SDK API history'
        files       = $files
    }
    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add('hushpinterest applied record 1')
    foreach ($field in @('bundle', 'fixture', 'patchList')) { $lines.Add("$field $($inputs[$field])") }
    foreach ($name in $names) { $lines.Add("patch $name") }
    $lines.Add("forced $($inputs.forced.ToString().ToLowerInvariant())")
    foreach ($field in @('desktopCli', 'androidJar', 'apiVersions')) { $lines.Add("$field $($inputs[$field])") }
    foreach ($name in $files.Keys) { $lines.Add("file $name $($files[$name])") }
    $sha = [System.Security.Cryptography.SHA256]::Create()
    try {
        $digest = $sha.ComputeHash([System.Text.Encoding]::UTF8.GetBytes(($lines -join "`n") + "`n"))
    } finally { $sha.Dispose() }
    $key = -join @($digest | ForEach-Object { $_.ToString('x2') })
    return [pscustomobject]@{ Key = $key; Inputs = $inputs }
}

function Get-AppliedRecords {
    <#
    .SYNOPSIS
        The record folders a store holds, newest first. Staging folders (named from a dot) aren't
        records and never come back from here.
    #>
    param([Parameter(Mandatory = $true)][string]$Store)

    if (-not (Test-Path -LiteralPath $Store -PathType Container)) { return @() }
    return @(Get-ChildItem -LiteralPath $Store -Directory -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -match '^[0-9a-f]{64}$' } |
        Sort-Object @{ Expression = {
                $recordFile = Join-Path $_.FullName 'record.json'
                if (Test-Path -LiteralPath $recordFile -PathType Leaf) { (Get-Item -LiteralPath $recordFile).LastWriteTimeUtc } else { [datetime]::MinValue }
            } } -Descending)
}

function Find-AppliedRecord {
    <#
    .SYNOPSIS
        The record kept under -Key, or $null when there is none or it doesn't hold together.
    .DESCRIPTION
        A record counts only when its record.json names this key, and its patched APK and result
        report are there with the APK hashing to what was recorded. Anything less is said and
        passed over, so the caller patches in full.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Store,
        [Parameter(Mandatory = $true)][string]$Key
    )

    if ($Key -notmatch '^[0-9a-f]{64}$') { throw "Not an applied record key: $Key" }
    $directory = Join-Path $Store $Key
    $recordFile = Join-Path $directory 'record.json'
    if (-not (Test-Path -LiteralPath $recordFile -PathType Leaf)) { return $null }
    $problem = $null
    try {
        $record = Get-Content -LiteralPath $recordFile -Raw | ConvertFrom-Json
    } catch {
        $record = $null
        $problem = "record.json can't be read: $($_.Exception.Message)"
    }
    $patched = Join-Path $directory 'patched.apk'
    $result = Join-Path $directory 'result.json'
    if (-not $problem) {
        if ([int]$record.schema -ne 1 -or [string]$record.key -cne $Key) {
            $problem = 'record.json names another key'
        } elseif (-not (Test-Path -LiteralPath $patched -PathType Leaf) -or -not (Test-Path -LiteralPath $result -PathType Leaf)) {
            $problem = 'its patched APK or result report is missing'
        } elseif ((Get-FileHash -LiteralPath $patched -Algorithm SHA256).Hash.ToLowerInvariant() -cne [string]$record.patchedSha256) {
            $problem = 'its patched APK changed after it was kept'
        }
    }
    if ($problem) {
        Write-Warning "The applied record $Key in $Store doesn't hold together ($problem), so it isn't used."
        return $null
    }
    # PowerShell 7 reads an ISO time in JSON as a date, Windows PowerShell as the text.
    $recordedAt = if ($record.recordedAt -is [datetime]) {
        $record.recordedAt.ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
    } else { [string]$record.recordedAt }
    return [pscustomobject]@{
        Directory  = $directory
        Key        = $Key
        PatchedApk = $patched
        Result     = $result
        RecordedAt = $recordedAt
        Record     = $record
    }
}

function Save-AppliedRecord {
    <#
    .SYNOPSIS
        Keeps a fixture apply that passed every check, under its key, and returns its folder.
    .DESCRIPTION
        Call it only once the run has passed: the report, the manifest delta, the resource table,
        DexDiff and the host references. Everything is copied into a staging folder named from a
        dot, record.json last, and the folder is renamed to the key in one step, so a run that
        stops halfway leaves nothing under a key (Find-AppliedRecord and Get-AppliedRecords never
        read a staging folder). The newest -Keep records stay and older ones go, as do staging
        folders a killed run left more than a day ago.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Store,
        [Parameter(Mandatory = $true)]$Identity,
        [Parameter(Mandatory = $true)][string]$PatchedApk,
        [Parameter(Mandatory = $true)][string]$Result,
        # Name in the record to the report it copies. A report the run didn't write is left out.
        [System.Collections.IDictionary]$Reports = @{},
        $Target,
        # Each record holds a patched Pinterest, about 130 MB, and one release needs one per
        # declared fixture.
        [int]$Keep = 3
    )

    $key = [string]$Identity.Key
    if ($key -notmatch '^[0-9a-f]{64}$') { throw "Not an applied record key: $key" }
    foreach ($required in @($PatchedApk, $Result)) {
        if (-not (Test-Path -LiteralPath $required -PathType Leaf)) { throw "Nothing to keep: $required is missing." }
    }
    New-Item -ItemType Directory -Force -Path $Store | Out-Null
    $storeRoot = (Resolve-Path -LiteralPath $Store).Path
    $final = Resolve-WithinRoot -Path (Join-Path $storeRoot $key) -Root $storeRoot
    $staging = Resolve-WithinRoot -Path (Join-Path $storeRoot ('.partial-' + [guid]::NewGuid().ToString('N'))) -Root $storeRoot
    New-Item -ItemType Directory -Path $staging | Out-Null
    try {
        Copy-Item -LiteralPath $PatchedApk -Destination (Join-Path $staging 'patched.apk')
        Copy-Item -LiteralPath $Result -Destination (Join-Path $staging 'result.json')
        $kept = @()
        foreach ($name in @($Reports.Keys)) {
            if ([string]$name -notmatch '^[A-Za-z0-9][A-Za-z0-9._-]*$' -or $name -in @('patched.apk', 'result.json', 'record.json')) {
                throw "Not a report name a record can hold: $name"
            }
            $source = [string]$Reports[$name]
            if ($source -and (Test-Path -LiteralPath $source -PathType Leaf)) {
                Copy-Item -LiteralPath $source -Destination (Join-Path $staging $name)
                $kept += [string]$name
            }
        }
        $targetFacts = $null
        if ($null -ne $Target) {
            $targetFacts = [ordered]@{ package = [string]$Target.package; versionName = [string]$Target.versionName
                versionCode = [string]$Target.versionCode }
        }
        $record = [ordered]@{
            schema        = 1
            key           = $key
            recordedAt    = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
            inputs        = $Identity.Inputs
            target        = $targetFacts
            patchedSha256 = (Get-FileHash -LiteralPath (Join-Path $staging 'patched.apk') -Algorithm SHA256).Hash.ToLowerInvariant()
            reports       = $kept
        }
        [System.IO.File]::WriteAllText((Join-Path $staging 'record.json'), ($record | ConvertTo-Json -Depth 8),
            (New-Object System.Text.UTF8Encoding($false)))

        if (Test-Path -LiteralPath $final) {
            # A record under this key that Find-AppliedRecord passed over. Moved aside first, so the
            # key never names a folder that's half deleted.
            $stale = Resolve-WithinRoot -Path (Join-Path $storeRoot ('.stale-' + [guid]::NewGuid().ToString('N'))) -Root $storeRoot
            [System.IO.Directory]::Move($final, $stale)
            Remove-Item -LiteralPath $stale -Recurse -Force -ErrorAction SilentlyContinue
        }
        try {
            [System.IO.Directory]::Move($staging, $final)
        } catch [System.IO.IOException] {
            # Another run kept the same key first. Its record is the same result.
            if (-not (Find-AppliedRecord -Store $storeRoot -Key $key)) { throw }
        }
    } finally {
        if (Test-Path -LiteralPath $staging) { Remove-Item -LiteralPath $staging -Recurse -Force -ErrorAction SilentlyContinue }
    }

    foreach ($old in @(Get-AppliedRecords -Store $storeRoot | Select-Object -Skip $Keep)) {
        if ($old.Name -ne $key) { Remove-GeneratedPath -Path $old.FullName -Root $storeRoot }
    }
    $abandoned = (Get-Date).ToUniversalTime().AddDays(-1)
    foreach ($left in @(Get-ChildItem -LiteralPath $storeRoot -Directory -Force -ErrorAction SilentlyContinue |
            Where-Object { $_.Name -match '^\.(partial|stale)-[0-9a-f]{32}$' -and $_.LastWriteTimeUtc -lt $abandoned })) {
        Remove-GeneratedPath -Path $left.FullName -Root $storeRoot
    }
    return $final
}
