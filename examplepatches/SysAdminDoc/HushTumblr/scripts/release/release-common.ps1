<#
.SYNOPSIS
    What the release stages share: the checkout's state, Python, Gradle, markers and test counts.

.DESCRIPTION
    Dot-sourced by release.ps1 and publish-release.ps1, which run the stages. Defines functions
    only, and loads common.ps1 for the build queue and the bundle path.
#>

. (Join-Path (Split-Path -Parent $PSScriptRoot) 'common.ps1')

$script:PrepareSubject = 'release: prepare {0}'
$script:IndexSubject = 'release: publish the {0} index to Morphe Manager'
# What a commit between a release's prepare commit and its index commit may change: the source
# census, which has to be fresh on the day the release goes out, and the release scripts. Neither
# goes into the bundle, which is built and tagged at the prepare commit. 0.0.10's census went
# stale between the cut and the publish and was refreshed this way.
$script:AfterPreparePaths = @('sources/tumblr-sources.json', 'scripts/audit-tumblr-sources.ps1',
    'scripts/tumblr-sources.ps1', 'scripts/test-tumblr-sources.ps1')
$script:AfterPrepareFolders = @('scripts/release/')

function Write-ReleaseStep([string]$Text) { Write-Host "[release] $Text" }

function Import-ReleaseEnvironment {
    <#
    .SYNOPSIS
        Takes the user-scope variables the stages read into this process, as the pre-push hook does,
        and puts every heavy job this run starts ahead of everyday builds in the queue.
    .DESCRIPTION
        A shell started before one of them was set has an environment without it. The three signing
        variables only stand in for parameters left out: a key or fingerprint is never written in a
        tracked file.
    #>
    foreach ($name in @('HUSHTUMBLR_DESKTOP_JAR', 'HUSHTUMBLR_FIXTURE_DIR', 'HUSHTUMBLR_APPLY_RECORDS',
            'HUSHTUMBLR_BUILD_WRAPPER', 'HUSHTUMBLR_PYTHON', 'BUILD_QUEUE_SCRIPT',
            'HUSHTUMBLR_RELEASE_GNUPGHOME', 'HUSHTUMBLR_RELEASE_FINGERPRINT', 'HUSHTUMBLR_RELEASE_PUBLIC_KEY')) {
        if (-not (Test-Path "Env:\$name")) {
            $value = [Environment]::GetEnvironmentVariable($name, [EnvironmentVariableTarget]::User)
            if ($value) { Set-Item -LiteralPath "Env:\$name" -Value $value }
        }
    }
    $env:BUILD_QUEUE_PRIORITY = 'release'
}

function Resolve-ReleaseRoot([string]$Root) {
    if (-not $Root) { $Root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot) }
    $resolved = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Root)
    if (-not (Test-Path -LiteralPath (Join-Path $resolved 'gradle.properties') -PathType Leaf)) {
        throw "$resolved has no gradle.properties, so it isn't a HushTumblr checkout."
    }
    return $resolved
}

function Invoke-ReleaseNative {
    <#
    .SYNOPSIS
        Runs a native command or a script that reports through its exit code, and throws naming
        $What when it fails. Its output goes to the host, never to the caller's pipeline.
    #>
    param([Parameter(Mandatory = $true)][string]$What, [Parameter(Mandatory = $true)][scriptblock]$Command)

    $global:LASTEXITCODE = 0
    & $Command | Out-Host
    if ($LASTEXITCODE -ne 0) { throw "$What failed (exit $LASTEXITCODE). Read the output above." }
}

function Invoke-ReleaseQuiet {
    <#
    .SYNOPSIS
        A native command's output with its stderr dropped, and its exit code in $LASTEXITCODE.
    .DESCRIPTION
        Under Stop, Windows PowerShell throws at the first stderr line of a native command whose
        stderr is redirected, so a "release not found" from gh ended the stage that asked.
    #>
    param([Parameter(Mandatory = $true)][scriptblock]$Command)

    $ErrorActionPreference = 'Continue'
    $global:LASTEXITCODE = 0
    & $Command 2>$null
}

function Get-ReleaseGitText {
    <# git's answer as trimmed text, or a throw naming the command. #>
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string[]]$Arguments)

    $global:LASTEXITCODE = 0
    $text = @(& git -C $Root @Arguments)
    if ($LASTEXITCODE -ne 0) { throw "git $($Arguments -join ' ') failed (exit $LASTEXITCODE)." }
    return (($text -join "`n").Trim())
}

function Assert-ReleaseClean([string]$Root) {
    $status = @(& git -C $Root status --porcelain --untracked-files=all)
    if ($LASTEXITCODE -ne 0) { throw "$Root is not a git checkout." }
    if ($status.Count -gt 0) {
        throw ('A release is cut from a clean checkout, and this one has changes: ' +
            (($status | Select-Object -First 6) -join '; ') + '. Commit or move them first.')
    }
}

function Get-ReleaseSubject([string]$Root, [string]$Commit) {
    return Get-ReleaseGitText -Root $Root -Arguments @('log', '-1', '--format=%s', $Commit)
}

function Test-AfterPrepareCommit {
    <# Whether a commit with one parent changes only files $script:AfterPreparePaths and $script:AfterPrepareFolders name. #>
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string]$Commit)

    $parents = @((Get-ReleaseGitText -Root $Root -Arguments @('rev-list', '--parents', '-n', '1', $Commit)) -split ' ' | Where-Object { $_ })
    if ($parents.Count -ne 2) { return $false }
    $changed = @((Get-ReleaseGitText -Root $Root -Arguments @('diff', '--name-only', "$Commit^", $Commit)) -split "`n" | Where-Object { $_ })
    foreach ($path in $changed) {
        $inFolder = @($script:AfterPrepareFolders | Where-Object { $path.StartsWith($_, [StringComparison]::Ordinal) }).Count -gt 0
        if (-not $inFolder -and $script:AfterPreparePaths -cnotcontains $path) { return $false }
    }
    return $true
}

function Get-PrepareCommit {
    <#
    .SYNOPSIS
        The release's prepare commit: HEAD when HEAD is "release: prepare <version>", HEAD's parent
        when HEAD is that release's index commit and -AllowIndex is given, else $null.
    .DESCRIPTION
        A prepare commit also has to leave gradle.properties at the version, so a commit that only
        borrowed the subject isn't taken for one. With -AllowAfterPrepare the prepare commit can
        also sit below commits that change only the source census and the release scripts
        (Test-AfterPrepareCommit), under the index commit when there is one.
    #>
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string]$Version, [switch]$AllowIndex,
        [switch]$AllowAfterPrepare)

    $prepare = $script:PrepareSubject -f $Version
    $candidate = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', 'HEAD')
    $subject = Get-ReleaseSubject -Root $Root -Commit $candidate
    if ($AllowIndex -and $subject -ceq ($script:IndexSubject -f $Version)) {
        $candidate = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', "$candidate^")
        $subject = Get-ReleaseSubject -Root $Root -Commit $candidate
    }
    # Twenty is far more commits than a census refresh and a release script fix take.
    for ($step = 0; $AllowAfterPrepare -and $subject -cne $prepare -and $step -lt 20; $step++) {
        if (-not (Test-AfterPrepareCommit -Root $Root -Commit $candidate)) { return $null }
        $candidate = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', "$candidate^")
        $subject = Get-ReleaseSubject -Root $Root -Commit $candidate
    }
    if ($subject -cne $prepare) { return $null }
    $properties = Get-ReleaseGitText -Root $Root -Arguments @('show', "${candidate}:gradle.properties")
    if ($properties -notmatch "(?m)^version\s*=\s*$([regex]::Escape($Version))\s*$") { return $null }
    return $candidate
}

function Get-RemoteMain([string]$Root) {
    <# The commit origin's main is at now, asked of the remote rather than read from a fetch. #>
    $global:LASTEXITCODE = 0
    $lines = @(& git -C $Root ls-remote origin refs/heads/main)
    if ($LASTEXITCODE -ne 0) { throw "git couldn't ask origin for main (exit $LASTEXITCODE). Check the network and the remote." }
    if ($lines.Count -eq 0) { return $null }
    return (($lines[0] -split '\s+')[0])
}

function Test-FirstRelease {
    <#
    .SYNOPSIS
        True only before any release exists: no patches-bundle.json, and no v* tag here or on origin.
    .DESCRIPTION
        The rule pre-push.ps1 uses to leave the release facts alone, with origin's tags asked too, so
        a clone that never fetched its tags can't pass for a first release. -Except leaves out the
        tag of the release being published, which GitHub made a moment before its index is written.
        Once any other v* tag exists, here or on origin, this is false for good: deleting the index
        later can't make a release look like the first.
    #>
    param([Parameter(Mandatory = $true)][string]$Root, [string]$Except)

    if (Test-Path -LiteralPath (Join-Path $Root 'patches-bundle.json') -PathType Leaf) { return $false }
    $global:LASTEXITCODE = 0
    $local = @(& git -C $Root tag --list 'v*')
    if ($LASTEXITCODE -ne 0) { throw "git couldn't list the tags here (exit $LASTEXITCODE)." }
    if (@($local | Where-Object { $_ -cne $Except }).Count -gt 0) { return $false }
    $global:LASTEXITCODE = 0
    $remote = @(& git -C $Root ls-remote --tags origin 'refs/tags/v*')
    if ($LASTEXITCODE -ne 0) {
        throw "git couldn't ask origin for its tags (exit $LASTEXITCODE), and a first release is only decided with origin's answer."
    }
    $names = @($remote | ForEach-Object { ((($_ -split '\s+')[1]) -replace '^refs/tags/', '') -replace '\^\{\}$', '' })
    return @($names | Where-Object { $_ -cne $Except }).Count -eq 0
}

function Invoke-ReleaseFactsPrecheck {
    <#
    .SYNOPSIS
        The release facts check prepare and preflight run, skipped only before the first release.
    .DESCRIPTION
        validate-release-facts.ps1 starts by reading patches-bundle.json, which only a published
        release writes, so before the first one it can't pass. pre-push.ps1 skips the check then
        too. publish writes the first index and checks it with -VerifyPublishedAsset, so nothing
        goes out unchecked. Test-FirstRelease decides, and never again once a v* tag exists.
    #>
    param([Parameter(Mandatory = $true)][string]$Root)

    if (Test-FirstRelease -Root $Root) {
        Write-ReleaseStep ('the release facts check is skipped: nothing has been released yet (no patches-bundle.json ' +
            'and no v* tag here or on origin), so there are no release facts to check. publish writes the first index and checks it')
        return
    }
    Invoke-ReleaseNative 'The release facts check' {
        & (Join-Path $Root 'scripts/validate-release-facts.ps1') -Root $Root -SkipDescriptionTestCount -AllowPublishedIndexLag -SkipTestResults
    }
}

function Get-ReleaseStagePath([string]$Root, [string]$Version, [string]$Stage) {
    return Join-Path $Root "build/release-stages/$Version/$Stage.json"
}

function Get-ReleaseStageMarker {
    <# What a finished stage wrote, or $null when it didn't finish for -Commit. #>
    param([string]$Root, [string]$Version, [string]$Stage, [string]$Commit)

    $path = Get-ReleaseStagePath $Root $Version $Stage
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { return $null }
    try { $marker = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json } catch { return $null }
    if ([string]$marker.commit -cne $Commit -or [string]$marker.version -cne $Version) { return $null }
    return $marker
}

function Set-ReleaseStageMarker {
    <# Written last, so a stage that stopped part way leaves none and runs again in full. #>
    param([string]$Root, [string]$Version, [string]$Stage, [string]$Commit, [double]$Minutes)

    $path = Get-ReleaseStagePath $Root $Version $Stage
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $path) | Out-Null
    $marker = [ordered]@{
        stage      = $Stage
        version    = $Version
        commit     = $Commit
        finishedAt = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
        minutes    = [math]::Round($Minutes, 1)
    }
    [IO.File]::WriteAllText($path, (($marker | ConvertTo-Json) + "`n"), (New-Object Text.UTF8Encoding $false))
}

function Resolve-ReleasePython {
    <#
    .SYNOPSIS
        The Python 3.10 or newer the release text runs on, as the command and its leading arguments.
    .DESCRIPTION
        HUSHTUMBLR_PYTHON first, then the py launcher (on PATH, or where its installer puts it,
        since a shell started before the install has a PATH without it), then python. The Microsoft
        Store's python stub is skipped: it opens the Store instead of running anything.
    #>
    $candidates = New-Object System.Collections.Generic.List[object]
    if ($env:HUSHTUMBLR_PYTHON) {
        if (-not (Test-Path -LiteralPath $env:HUSHTUMBLR_PYTHON -PathType Leaf)) {
            throw "HUSHTUMBLR_PYTHON names $env:HUSHTUMBLR_PYTHON, which is not there."
        }
        $candidates.Add(@($env:HUSHTUMBLR_PYTHON))
    } else {
        $launcher = Get-Command py -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($launcher) {
            $candidates.Add(@($launcher.Source, '-3'))
        } elseif ($env:LOCALAPPDATA) {
            $installed = Join-Path $env:LOCALAPPDATA 'Programs\Python\Launcher\py.exe'
            if (Test-Path -LiteralPath $installed -PathType Leaf) { $candidates.Add(@($installed, '-3')) }
        }
        foreach ($python in @(Get-Command python -CommandType Application -ErrorAction SilentlyContinue)) {
            if ($python.Source -notmatch '\\WindowsApps\\') { $candidates.Add(@($python.Source)) }
        }
    }
    foreach ($candidate in $candidates) {
        $prefix = @($candidate | Select-Object -Skip 1)
        $answer = @(Invoke-ReleaseQuiet { & $candidate[0] @prefix -c 'import sys; print(sys.version_info >= (3, 10))' })
        if ($LASTEXITCODE -eq 0 -and ($answer -join '').Trim() -eq 'True') { return , $candidate }
    }
    throw ('No Python 3.10 or newer was found for the release text. Install one, or set HUSHTUMBLR_PYTHON ' +
        'to its python.exe.')
}

function Invoke-ReleaseText {
    <# scripts/release/release_text.py with these arguments, on -Root. #>
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string]$What,
        [Parameter(Mandatory = $true)][string[]]$Arguments)

    $python = Resolve-ReleasePython
    $prefix = @($python | Select-Object -Skip 1)
    $script = Join-Path $PSScriptRoot 'release_text.py'
    Invoke-ReleaseNative $What { & $python[0] @prefix $script --root $Root @Arguments }
}

function Invoke-ReleaseGradle {
    <#
    .SYNOPSIS
        Gradle as the pre-push gate runs it: through HUSHTUMBLR_BUILD_WRAPPER when it names the
        machine's governor, else the repository's wrapper after a slot in the build queue.
    #>
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string[]]$Tasks,
        [string]$Job = 'release gradle')

    . (Join-Path (Split-Path -Parent $PSScriptRoot) 'build-advisories.ps1') -Root $Root
    Assert-ReviewedGradleWrapper -Root $Root | Out-Null
    if (-not $env:JAVA_HOME) { throw 'Set JAVA_HOME to a JDK 21 first. Gradle and the push gate both read it.' }
    if (-not $env:GITHUB_ACTOR -or -not $env:GITHUB_TOKEN) {
        # The Morphe settings plugin resolves from GitHub Packages, which needs a reader token.
        $login = (Invoke-ReleaseQuiet { & gh api user --jq .login })
        $token = (Invoke-ReleaseQuiet { & gh auth token })
        if ([string]::IsNullOrWhiteSpace($login) -or [string]::IsNullOrWhiteSpace($token)) {
            throw 'gh is not signed in, so the patches plugin cannot be resolved. Run gh auth login.'
        }
        $env:GITHUB_ACTOR = $login
        $env:GITHUB_TOKEN = $token
    }
    $wrapper = $env:HUSHTUMBLR_BUILD_WRAPPER
    if ($wrapper -and -not (Test-Path -LiteralPath $wrapper -PathType Leaf)) {
        throw "HUSHTUMBLR_BUILD_WRAPPER names $wrapper, which is not there."
    }
    Write-ReleaseStep "gradle $($Tasks -join ' ')"
    $global:LASTEXITCODE = 0
    if ($wrapper) {
        & $wrapper -ProjectDir $Root -Tasks $Tasks | Out-Host
    } else {
        $queued = Enter-HushTumblrQueue -Job $Job
        try {
            & (Join-Path $Root 'gradlew.bat') -p $Root @Tasks | Out-Host
        } finally {
            Exit-HushTumblrQueue $queued
        }
    }
    if ($LASTEXITCODE -ne 0) { throw "Gradle $($Tasks -join ' ') failed (exit $LASTEXITCODE). Read the output above." }
}

function Get-ReleaseTestCount {
    <#
    .SYNOPSIS
        The tests in these result folders, counted the way validate-release-facts.ps1 holds the
        description to them: every testcase of every XML file.
    #>
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string[]]$Folders)

    $count = 0
    foreach ($folder in $Folders) {
        $files = @(Get-ChildItem -LiteralPath (Join-Path $Root $folder) -Filter '*.xml' -File -ErrorAction SilentlyContinue)
        if ($files.Count -eq 0) {
            throw "No test results in $folder. The release push gate writes them in this checkout, so run -Stage gate here."
        }
        foreach ($file in $files) { $count += @(([xml](Get-Content -LiteralPath $file.FullName -Raw)).testsuite.testcase).Count }
    }
    return $count
}

function Get-DeclaredFixtures {
    <#
    .SYNOPSIS
        The vendor APK of every build patches-list.json declares, named as the pre-push gate names
        them (tumblr-<version>-<code>.apk in HUSHTUMBLR_FIXTURE_DIR), or a throw naming the
        ones missing.
    #>
    param([Parameter(Mandatory = $true)][string]$Root)

    $directory = $env:HUSHTUMBLR_FIXTURE_DIR
    if (-not $directory -or -not (Test-Path -LiteralPath $directory -PathType Container)) {
        throw 'Set HUSHTUMBLR_FIXTURE_DIR to the folder holding every declared Tumblr APK. The gate and the receipt patch each one.'
    }
    . (Join-Path $Root 'scripts/patch-target.ps1')
    $target = Get-PatchTarget -PatchList (Get-Content -LiteralPath (Join-Path $Root 'patches-list.json') -Raw | ConvertFrom-Json)
    $found = New-Object System.Collections.Generic.List[string]
    $missing = New-Object System.Collections.Generic.List[string]
    foreach ($version in @($target.PackageVersions)) {
        foreach ($code in @($target.PackageVersionCodes[$version] | Where-Object { $_ })) {
            $file = Join-Path $directory "tumblr-$version-$code.apk"
            if ((Test-Path -LiteralPath $file -PathType Leaf) -and (Get-Item -LiteralPath $file).Length -gt 0) {
                $found.Add($file)
            } else {
                $missing.Add((Split-Path -Leaf $file))
            }
        }
    }
    if ($missing.Count -gt 0) { throw "HUSHTUMBLR_FIXTURE_DIR has no $($missing -join ', '). Put the vendor APKs there first." }
    if ($found.Count -eq 0) { throw 'patches-list.json declares no Tumblr build, so there is nothing to patch.' }
    return $found.ToArray()
}

function Get-ReleaseUploadNames([string]$Version) {
    <# What goes on the GitHub release beside the signed checksum pair. #>
    return @("patches-$Version.mpp", "patches-$Version.cdx.json", "release-receipt-$Version.json")
}

function Test-ReleaseAssets {
    <#
    .SYNOPSIS
        Whether build/release-assets/<version> holds the release's assets, signed, with a receipt
        for -Commit: $true, or the reason it doesn't.
    #>
    param([string]$Root, [string]$Version, [string]$Commit, [string]$TrustedPublicKeyPath,
        [string]$TrustedFingerprint, [string]$Gpg = 'gpg')

    $assets = Join-Path $Root "build/release-assets/$Version"
    $names = Get-ReleaseUploadNames $Version
    foreach ($name in @($names) + @('SHA256SUMS.txt', 'SHA256SUMS.txt.asc')) {
        if (-not (Test-Path -LiteralPath (Join-Path $assets $name) -PathType Leaf)) { return "there is no $name in $assets" }
    }
    $receipt = Get-Content -LiteralPath (Join-Path $assets "release-receipt-$Version.json") -Raw | ConvertFrom-Json
    if ([string]$receipt.release.commit -cne $Commit) { return "the receipt there is for $($receipt.release.commit), not $Commit" }
    try {
        & (Join-Path (Split-Path -Parent $PSScriptRoot) 'verify-release-checksums.ps1') -AssetDirectory $assets `
            -ChecksumsPath (Join-Path $assets 'SHA256SUMS.txt') -SignaturePath (Join-Path $assets 'SHA256SUMS.txt.asc') `
            -TrustedPublicKeyPath $TrustedPublicKeyPath -TrustedFingerprint $TrustedFingerprint `
            -ExpectedAssetNames $names -Gpg $Gpg | Out-Host
    } catch {
        return "its checksums don't verify: $($_.Exception.Message)"
    }
    return $true
}

function Complete-ReleaseDraft {
    <#
    .SYNOPSIS
        Finishes the draft an interrupted gh release create left for -Tag, then publishes it.
    .DESCRIPTION
        gh release create makes a draft, uploads the assets one by one and publishes it last, so a
        run cut off part way leaves a draft holding some of them. The draft has to target -Source
        under the tag's own title, no published release may share its tag, a tag origin already
        has has to point at -Source, and every asset already up has to be one of -Uploads and
        match the file built here byte for byte. Anything else is refused before GitHub is
        changed. Nothing hosted is replaced, except an upload GitHub never finished and nothing
        has touched for 15 minutes, which holds no file and goes up again. It's published with
        -Notes as its notes and as a full release, the way gh release create would have.
    #>
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string]$Repository,
        [Parameter(Mandatory = $true)][string]$Tag, [Parameter(Mandatory = $true)][string]$Source,
        [Parameter(Mandatory = $true)][string]$Assets, [Parameter(Mandatory = $true)][string[]]$Uploads,
        [Parameter(Mandatory = $true)][string]$Notes)

    # No double quote in the filter: Windows PowerShell passes one to a native command unescaped.
    $lines = @(Invoke-ReleaseQuiet {
        & gh release view $Tag -R $Repository --json isDraft,targetCommitish,name,assets --jq '(.isDraft | tostring), .targetCommitish, .name, (.assets[] | .state, .name, .updatedAt)'
    })
    if ($LASTEXITCODE -ne 0 -or $lines.Count -lt 3 -or ($lines.Count - 3) % 3 -ne 0) { throw "gh couldn't read the $Tag draft on GitHub." }
    if ($lines[0] -cne 'true') { throw "$Tag on GitHub isn't a draft, so there's nothing to finish." }
    if ($lines[1] -cne $Source) { throw "The $Tag draft on GitHub targets $($lines[1]), not the prepare commit $Source. Delete that draft and run this again." }
    if ($lines[2] -cne $Tag) { throw "The $Tag draft on GitHub is titled '$($lines[2])', so this script didn't make it. Delete that draft and run this again." }
    # A list, not a hashtable: two names that differ only in case stay two assets.
    $hosted = @(for ($k = 3; $k -lt $lines.Count; $k += 3) {
        [pscustomobject]@{ State = [string]$lines[$k]; Name = [string]$lines[$k + 1]; Updated = [string]$lines[$k + 2] }
    })
    $foreign = @($hosted | Where-Object { $Uploads -cnotcontains $_.Name } | ForEach-Object { $_.Name })
    if ($foreign.Count -gt 0) { throw "The $Tag draft holds $($foreign -join ', '), which this release doesn't ship. Delete that draft and run this again." }
    # gh looks a release up by its tag for each command, so a published twin could take the changes.
    $twin = @(Invoke-ReleaseQuiet { & gh api "repos/$Repository/releases/tags/$Tag" --jq '.id' })
    if ($LASTEXITCODE -eq 0 -and $twin.Count -gt 0) {
        throw "GitHub also has a published $Tag next to the draft, so the draft is left as it is. Delete the draft and run this again."
    }
    $cutoff = [DateTimeOffset]::UtcNow.AddMinutes(-15)
    foreach ($asset in @($hosted | Where-Object { $_.State -cne 'uploaded' })) {
        $touched = [DateTimeOffset]::MinValue
        $read = [DateTimeOffset]::TryParse($asset.Updated, [Globalization.CultureInfo]::InvariantCulture,
            [Globalization.DateTimeStyles]::AssumeUniversal, [ref]$touched)
        if (-not $read -or $touched -gt $cutoff) {
            throw "The $Tag draft's $($asset.Name) is still uploading, maybe from another run. Let that run finish, or run this again in 15 minutes."
        }
    }
    $global:LASTEXITCODE = 0
    $tagLines = @(& git -C $Root ls-remote origin "refs/tags/$Tag" "refs/tags/$Tag^{}")
    if ($LASTEXITCODE -ne 0) { throw "git couldn't ask origin for $Tag (exit $LASTEXITCODE). Check the network and the remote." }
    if ($tagLines.Count -gt 0) {
        # An annotated tag's commit is on its peeled line.
        $tagged = ((@($tagLines | Where-Object { $_ -match '\^\{\}$' }) + @($tagLines))[0] -split '\s+')[0]
        if ($tagged -cne $Source) { throw "origin's $Tag already points at $tagged, not the prepare commit $Source." }
    }
    $done = @($hosted | Where-Object { $_.State -ceq 'uploaded' } | ForEach-Object { $_.Name })
    if ($done.Count -gt 0) {
        $check = Join-Path ([IO.Path]::GetTempPath()) ('hushtumblr-draft-' + [guid]::NewGuid().ToString('N'))
        try {
            $patterns = @($done | ForEach-Object { '-p'; $_ })
            Invoke-ReleaseNative 'gh release download' { & gh release download $Tag -R $Repository -D $check @patterns }
            foreach ($name in $done) {
                $local = (Get-FileHash -LiteralPath (Join-Path $Assets $name) -Algorithm SHA256).Hash
                $up = (Get-FileHash -LiteralPath (Join-Path $check $name) -Algorithm SHA256).Hash
                if ($local -cne $up) {
                    throw "The $Tag draft's $name isn't the one built here ($up, local $local), so it's left as it is. Delete that draft and run this again."
                }
            }
        } finally {
            if (Test-Path -LiteralPath $check) { Remove-Item -LiteralPath $check -Recurse -Force -ErrorAction SilentlyContinue }
        }
    }
    foreach ($name in @($hosted | Where-Object { $_.State -cne 'uploaded' } | ForEach-Object { $_.Name })) {
        Write-ReleaseStep "$name never finished uploading to the $Tag draft, so it goes up again"
        Invoke-ReleaseNative "Removing the unfinished $name" { & gh release delete-asset $Tag $name -R $Repository --yes }
    }
    $missing = @($Uploads | Where-Object { $done -cnotcontains $_ })
    if ($missing.Count -gt 0) {
        Write-ReleaseStep "uploading $($missing -join ', ') to the $Tag draft"
        $files = @($missing | ForEach-Object { Join-Path $Assets $_ })
        Invoke-ReleaseNative 'gh release upload' { & gh release upload $Tag -R $Repository @files }
    }
    Write-ReleaseStep "the $Tag draft holds the $($Uploads.Count) assets built here, so it's published"
    Invoke-ReleaseNative 'gh release edit' { & gh release edit $Tag -R $Repository --notes-file $Notes --prerelease=false --draft=false }
}

function Get-SigningInputs {
    <#
    .SYNOPSIS
        The keyring folder, fingerprint and pinned public key the checksums are signed and checked
        with: the parameters given, else HUSHTUMBLR_RELEASE_GNUPGHOME,
        HUSHTUMBLR_RELEASE_FINGERPRINT and HUSHTUMBLR_RELEASE_PUBLIC_KEY.
    #>
    param([string]$GpgHome, [string]$Fingerprint, [string]$PublicKey, [switch]$NoKeyring)

    if (-not $GpgHome) { $GpgHome = $env:HUSHTUMBLR_RELEASE_GNUPGHOME }
    if (-not $Fingerprint) { $Fingerprint = $env:HUSHTUMBLR_RELEASE_FINGERPRINT }
    if (-not $PublicKey) { $PublicKey = $env:HUSHTUMBLR_RELEASE_PUBLIC_KEY }
    $missing = @()
    if (-not $NoKeyring -and (-not $GpgHome -or -not (Test-Path -LiteralPath $GpgHome -PathType Container))) { $missing += '-GpgHome (the signing keyring folder)' }
    if ($Fingerprint -notmatch '^[0-9A-Fa-f]{40}$') { $missing += '-SigningFingerprint (the full 40 hex fingerprint)' }
    if (-not $PublicKey -or -not (Test-Path -LiteralPath $PublicKey -PathType Leaf)) { $missing += '-TrustedPublicKeyPath (the pinned public key file)' }
    if ($missing.Count -gt 0) {
        throw ('The release checksums are signed and checked against a pinned key, and these are missing: ' +
            ($missing -join ', ') + '. Pass them, or set the matching HUSHTUMBLR_RELEASE_* variables.')
    }
    return [pscustomobject]@{ GpgHome = $GpgHome; Fingerprint = $Fingerprint.ToUpperInvariant(); PublicKey = $PublicKey }
}

function Invoke-ReleasePush {
    <#
    .SYNOPSIS
        Pushes HEAD to origin's main through the pre-push hook, never past it.
    .DESCRIPTION
        HUSHTUMBLR_SKIP_PRE_PUSH is taken out for the push and put back after it. -ReleaseGate
        sets HUSHTUMBLR_RELEASE_GATE=1, which makes the gate build the bundle and patch every
        declared fixture with it. -Environment adds variables the hook reads for this push only.
    #>
    param([Parameter(Mandatory = $true)][string]$Root, [switch]$ReleaseGate, [hashtable]$Environment = @{})

    $hookPath = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', '--git-path', 'hooks/pre-push')
    if (-not [IO.Path]::IsPathRooted($hookPath)) { $hookPath = Join-Path $Root $hookPath }
    if (-not (Test-Path -LiteralPath $hookPath -PathType Leaf) -or
        (Get-Content -LiteralPath $hookPath -Raw) -notmatch '# hushtumblr-pre-push') {
        throw "There is no HushTumblr pre-push hook at $hookPath, and a release push never goes out ungated. Run scripts/install-hooks.ps1 first."
    }
    $names = @('HUSHTUMBLR_SKIP_PRE_PUSH', 'HUSHTUMBLR_RELEASE_GATE') + @($Environment.Keys)
    $saved = @{}
    foreach ($name in $names) { $saved[$name] = [Environment]::GetEnvironmentVariable($name, [EnvironmentVariableTarget]::Process) }
    try {
        [Environment]::SetEnvironmentVariable('HUSHTUMBLR_SKIP_PRE_PUSH', $null, [EnvironmentVariableTarget]::Process)
        $gate = if ($ReleaseGate) { '1' } else { $null }
        [Environment]::SetEnvironmentVariable('HUSHTUMBLR_RELEASE_GATE', $gate, [EnvironmentVariableTarget]::Process)
        foreach ($name in $Environment.Keys) {
            [Environment]::SetEnvironmentVariable($name, [string]$Environment[$name], [EnvironmentVariableTarget]::Process)
        }
        Invoke-ReleaseNative 'The push (its gate output is above)' { & git -C $Root push origin HEAD:refs/heads/main }
    } finally {
        foreach ($name in $names) { [Environment]::SetEnvironmentVariable($name, $saved[$name], [EnvironmentVariableTarget]::Process) }
    }
}
