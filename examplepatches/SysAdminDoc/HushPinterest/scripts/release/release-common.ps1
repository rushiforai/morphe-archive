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

function Write-ReleaseStep([string]$Text) { Write-Host "[release] $Text" }

function Import-ReleaseEnvironment {
    <#
    .SYNOPSIS
        Takes the user-scope variables the stages read into this process, as the pre-push hook does,
        and puts every heavy job this run starts ahead of everyday builds in the queue.
    .DESCRIPTION
        A shell started before one of them was set has an environment without it. The three checksum
        signing variables only stand in for parameters left out, and buildAndroid reads the bundle
        signing key from HUSHPINTEREST_BUNDLE_SIGNING_KEY: a key or fingerprint is never written in a
        tracked file.
    #>
    foreach ($name in @('HUSHPINTEREST_DESKTOP_JAR', 'HUSHPINTEREST_FIXTURE_DIR', 'HUSHPINTEREST_APPLY_RECORDS',
            'HUSHPINTEREST_BUILD_WRAPPER', 'HUSHPINTEREST_PYTHON', 'BUILD_QUEUE_SCRIPT',
            'HUSHPINTEREST_RELEASE_GNUPGHOME', 'HUSHPINTEREST_RELEASE_FINGERPRINT', 'HUSHPINTEREST_RELEASE_PUBLIC_KEY',
            'HUSHPINTEREST_BUNDLE_SIGNING_KEY')) {
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
        throw "$resolved has no gradle.properties, so it isn't a HushPinterest checkout."
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

function Get-PrepareCommit {
    <#
    .SYNOPSIS
        The release's prepare commit: HEAD when HEAD is "release: prepare <version>", HEAD's parent
        when HEAD is that release's index commit and -AllowIndex is given, else $null.
    .DESCRIPTION
        A prepare commit also has to leave gradle.properties at the version, so a commit that only
        borrowed the subject isn't taken for one.
    #>
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string]$Version, [switch]$AllowIndex)

    $head = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', 'HEAD')
    $subject = Get-ReleaseSubject -Root $Root -Commit $head
    $candidate = $null
    if ($subject -ceq ($script:PrepareSubject -f $Version)) {
        $candidate = $head
    } elseif ($AllowIndex -and $subject -ceq ($script:IndexSubject -f $Version)) {
        $parent = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', 'HEAD^')
        if ((Get-ReleaseSubject -Root $Root -Commit $parent) -ceq ($script:PrepareSubject -f $Version)) { $candidate = $parent }
    }
    if (-not $candidate) { return $null }
    $properties = Get-ReleaseGitText -Root $Root -Arguments @('show', "${candidate}:gradle.properties")
    if ($properties -notmatch "(?m)^version\s*=\s*$([regex]::Escape($Version))\s*$") { return $null }
    return $candidate
}

function Get-PublishReleaseState {
    <# Publication may resume after a release-check repair, but never with changed bundle sources or index files. #>
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string]$Version)

    $head = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', 'HEAD')
    $prepared = Get-PrepareCommit -Root $Root -Version $Version
    if ($prepared) { return [pscustomobject]@{ Source = $prepared; Index = $null; Head = $head; Chain = @($prepared) } }

    $subject = $script:IndexSubject -f $Version
    $indexes = @(Get-ReleaseGitText -Root $Root -Arguments @('log', '--first-parent', '--format=%H', '--fixed-strings', "--grep=$subject", 'HEAD') |
        ForEach-Object { $_ -split "`n" } | Where-Object { $_ -and (Get-ReleaseSubject $Root $_) -ceq $subject })
    if ($indexes.Count -eq 0) { return $null }
    if ($indexes.Count -ne 1) { throw "Publication recovery found more than one $Version index commit." }
    $index = $indexes[0]
    $parents = (Get-ReleaseGitText -Root $Root -Arguments @('rev-list', '--parents', '-n', '1', $index)) -split '\s+'
    if ($parents.Count -ne 2) { throw 'Publication recovery requires an index commit with exactly one parent.' }
    $source = $parents[1]
    $properties = Get-ReleaseGitText -Root $Root -Arguments @('show', "${source}:gradle.properties")
    if ((Get-ReleaseSubject $Root $source) -cne ($script:PrepareSubject -f $Version) -or
            $properties -notmatch "(?m)^version\s*=\s*$([regex]::Escape($Version))\s*$") {
        throw "The $Version index isn't directly after its prepared release."
    }
    $indexFiles = @('patches-bundle.json', 'README.md', '.github/ISSUE_TEMPLATE/bug_report.yml')
    $changed = @(Get-ReleaseGitText -Root $Root -Arguments @('diff-tree', '--no-commit-id', '--name-only', '-r', $index) |
        ForEach-Object { $_ -split "`n" } | Where-Object { $_ })
    if ($changed.Count -ne $indexFiles.Count -or @($changed | Where-Object { $indexFiles -cnotcontains $_ }).Count -gt 0) {
        throw 'Publication recovery requires an index commit changing exactly the index, README and bug form.'
    }

    # These files can repair a failed publication check without changing the built release.
    $correctionFiles = @(
        'scripts/pre-push.ps1', 'scripts/validate-release-facts.ps1', 'scripts/verify-published-index.ps1',
        'scripts/release/release-common.ps1', 'scripts/release/publish-release.ps1', 'scripts/release/release.ps1',
        'scripts/walk-receipt.ps1', 'CHANGELOG.md')
    $descendants = @(Get-ReleaseGitText -Root $Root -Arguments @('rev-list', '--parents', "$index..$head") |
        ForEach-Object { $_ -split "`n" } | Where-Object { $_ })
    $chain = @($source, $index)
    foreach ($entry in $descendants) {
        $parts = $entry -split '\s+'
        if ($parts.Count -ne 2) { throw 'Publication recovery refuses merged or unrelated history after the index.' }
        $chain += $parts[0]
        $paths = @(Get-ReleaseGitText -Root $Root -Arguments @('diff-tree', '--no-commit-id', '--name-only', '-r', $parts[0]) |
            ForEach-Object { $_ -split "`n" } | Where-Object { $_ })
        $unexpected = @($paths | Where-Object { $correctionFiles -cnotcontains $_ })
        if ($unexpected.Count -gt 0) {
            throw "Publication recovery refuses changed source or index files: $($unexpected -join ', ')."
        }
    }
    # A repair's release note belongs in Unreleased; the already published notes must stay intact.
    # The release cut removes the Unreleased heading itself, so a repair adds it back: compare both
    # without the whole section, heading included.
    $unreleased = '(?ms)^## Unreleased[^\r\n]*\r?\n.*?(?=^## |\z)'
    $before = Get-ReleaseGitText -Root $Root -Arguments @('show', "${index}:CHANGELOG.md")
    $after = Get-ReleaseGitText -Root $Root -Arguments @('show', "${head}:CHANGELOG.md")
    if ([regex]::Replace($before, $unreleased, '') -cne [regex]::Replace($after, $unreleased, '')) {
        throw 'Publication recovery refuses changes to already released CHANGELOG sections.'
    }
    return [pscustomobject]@{ Source = $source; Index = $index; Head = $head; Chain = $chain }
}

function Get-RemoteMain([string]$Root) {
    <# The commit origin's main is at now, asked of the remote rather than read from a fetch. #>
    $global:LASTEXITCODE = 0
    $lines = @(& git -C $Root ls-remote origin refs/heads/main)
    if ($LASTEXITCODE -ne 0) { throw "git couldn't ask origin for main (exit $LASTEXITCODE). Check the network and the remote." }
    if ($lines.Count -eq 0) { return $null }
    return (($lines[0] -split '\s+')[0])
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
        HUSHPINTEREST_PYTHON first, then the py launcher (on PATH, or where its installer puts it,
        since a shell started before the install has a PATH without it), then python. The Microsoft
        Store's python stub is skipped: it opens the Store instead of running anything.
    #>
    $candidates = New-Object System.Collections.Generic.List[object]
    if ($env:HUSHPINTEREST_PYTHON) {
        if (-not (Test-Path -LiteralPath $env:HUSHPINTEREST_PYTHON -PathType Leaf)) {
            throw "HUSHPINTEREST_PYTHON names $env:HUSHPINTEREST_PYTHON, which is not there."
        }
        $candidates.Add(@($env:HUSHPINTEREST_PYTHON))
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
    throw ('No Python 3.10 or newer was found for the release text. Install one, or set HUSHPINTEREST_PYTHON ' +
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
        Gradle as the pre-push gate runs it: through HUSHPINTEREST_BUILD_WRAPPER when it names the
        machine's governor, else the repository's wrapper after a slot in the build queue.
    #>
    param([Parameter(Mandatory = $true)][string]$Root, [Parameter(Mandatory = $true)][string[]]$Tasks,
        [string]$Job = 'release gradle')

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
    $wrapper = $env:HUSHPINTEREST_BUILD_WRAPPER
    if ($wrapper -and -not (Test-Path -LiteralPath $wrapper -PathType Leaf)) {
        throw "HUSHPINTEREST_BUILD_WRAPPER names $wrapper, which is not there."
    }
    Write-ReleaseStep "gradle $($Tasks -join ' ')"
    $global:LASTEXITCODE = 0
    if ($wrapper) {
        & $wrapper -ProjectDir $Root -Tasks $Tasks | Out-Host
    } else {
        $queued = Enter-HushPinterestQueue -Job $Job
        try {
            & (Join-Path $Root 'gradlew.bat') -p $Root @Tasks | Out-Host
        } finally {
            Exit-HushPinterestQueue $queued
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
        them (pinterest-<version>-<code>.apk, or .apkm for a bundle, in HUSHPINTEREST_FIXTURE_DIR),
        or a throw naming the ones missing.
    #>
    param([Parameter(Mandatory = $true)][string]$Root)

    $directory = $env:HUSHPINTEREST_FIXTURE_DIR
    if (-not $directory -or -not (Test-Path -LiteralPath $directory -PathType Container)) {
        throw 'Set HUSHPINTEREST_FIXTURE_DIR to the folder holding every declared Pinterest APK. The gate and the receipt patch each one.'
    }
    . (Join-Path $Root 'scripts/patch-target.ps1')
    $target = Get-PatchTarget -PatchList (Get-Content -LiteralPath (Join-Path $Root 'patches-list.json') -Raw | ConvertFrom-Json)
    $found = New-Object System.Collections.Generic.List[string]
    $missing = New-Object System.Collections.Generic.List[string]
    foreach ($version in @($target.PackageVersions)) {
        foreach ($code in @($target.PackageVersionCodes[$version] | Where-Object { $_ })) {
            # One universal APK, or APKMirror's bundle when that is all a build ships as.
            $name = "pinterest-$version-$code.apk"
            $file = @("$name", "${name}m" | ForEach-Object { Join-Path $directory $_ } |
                Where-Object { (Test-Path -LiteralPath $_ -PathType Leaf) -and (Get-Item -LiteralPath $_).Length -gt 0 }) |
                Select-Object -First 1
            if ($file) { $found.Add($file) } else { $missing.Add($name) }
        }
    }
    if ($missing.Count -gt 0) {
        throw "HUSHPINTEREST_FIXTURE_DIR has no $($missing -join ', ') (an .apkm bundle of the same name works too). Put the vendor APKs there first."
    }
    if ($found.Count -eq 0) { throw 'patches-list.json declares no Pinterest build, so there is nothing to patch.' }
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
    if ([string]$receipt.release.version -cne $Version -or [string]$receipt.release.tag -cne "v$Version") {
        return "the receipt there doesn't name release v$Version"
    }
    if ([string]$receipt.release.commit -cne $Commit) { return "the receipt there is for $($receipt.release.commit), not $Commit" }
    $bundleName = "patches-$Version.mpp"
    if ([string]$receipt.bundle.file -cne $bundleName -or
            [string]$receipt.bundle.sha256 -ine (Get-FileHash -LiteralPath (Join-Path $assets $bundleName) -Algorithm SHA256).Hash) {
        return "the receipt's bundle name or hash doesn't match $bundleName"
    }
    try {
        & (Join-Path (Split-Path -Parent $PSScriptRoot) 'verify-release-checksums.ps1') -AssetDirectory $assets `
            -ChecksumsPath (Join-Path $assets 'SHA256SUMS.txt') -SignaturePath (Join-Path $assets 'SHA256SUMS.txt.asc') `
            -TrustedPublicKeyPath $TrustedPublicKeyPath -TrustedFingerprint $TrustedFingerprint `
            -ExpectedAssetNames $names -Gpg $Gpg | Out-Host
    } catch {
        return "its checksums don't verify: $($_.Exception.Message)"
    }
    # Manager pins the first key it sees. A checkout that publishes a key holds every copy to it,
    # assets built earlier and assets taken back from GitHub alike, the way the index step does.
    if (Test-Path -LiteralPath (Join-Path $Root 'morphe-signing.pub') -PathType Leaf) {
        try {
            Invoke-ReleaseText -Root $Root -What "The $bundleName signature check" `
                -Arguments @('signed', '--version', $Version, '--bundle', (Join-Path $assets $bundleName))
        } catch {
            return "its bundle isn't signed by morphe-signing.pub's key: $($_.Exception.Message)"
        }
    }
    return $true
}

function Get-SigningInputs {
    <#
    .SYNOPSIS
        The keyring folder, fingerprint and pinned public key the checksums are signed and checked
        with: the parameters given, else HUSHPINTEREST_RELEASE_GNUPGHOME,
        HUSHPINTEREST_RELEASE_FINGERPRINT and HUSHPINTEREST_RELEASE_PUBLIC_KEY.
    #>
    param([string]$GpgHome, [string]$Fingerprint, [string]$PublicKey, [switch]$NoKeyring)

    if (-not $GpgHome) { $GpgHome = $env:HUSHPINTEREST_RELEASE_GNUPGHOME }
    if (-not $Fingerprint) { $Fingerprint = $env:HUSHPINTEREST_RELEASE_FINGERPRINT }
    if (-not $PublicKey) { $PublicKey = $env:HUSHPINTEREST_RELEASE_PUBLIC_KEY }
    $missing = @()
    if (-not $NoKeyring -and (-not $GpgHome -or -not (Test-Path -LiteralPath $GpgHome -PathType Container))) { $missing += '-GpgHome (the signing keyring folder)' }
    if ($Fingerprint -notmatch '^[0-9A-Fa-f]{40}$') { $missing += '-SigningFingerprint (the full 40 hex fingerprint)' }
    if (-not $PublicKey -or -not (Test-Path -LiteralPath $PublicKey -PathType Leaf)) { $missing += '-TrustedPublicKeyPath (the pinned public key file)' }
    if ($missing.Count -gt 0) {
        throw ('The release checksums are signed and checked against a pinned key, and these are missing: ' +
            ($missing -join ', ') + '. Pass them, or set the matching HUSHPINTEREST_RELEASE_* variables.')
    }
    return [pscustomobject]@{ GpgHome = $GpgHome; Fingerprint = $Fingerprint.ToUpperInvariant(); PublicKey = $PublicKey }
}

function Invoke-ReleasePush {
    <#
    .SYNOPSIS
        Pushes HEAD to origin's main through the pre-push hook, never past it.
    .DESCRIPTION
        HUSHPINTEREST_SKIP_PRE_PUSH is taken out for the push and put back after it. -ReleaseGate
        sets HUSHPINTEREST_RELEASE_GATE=1, which makes the gate build the bundle and patch every
        declared fixture with it. -Environment adds variables the hook reads for this push only.
    #>
    param([Parameter(Mandatory = $true)][string]$Root, [switch]$ReleaseGate, [hashtable]$Environment = @{})

    $hookPath = Get-ReleaseGitText -Root $Root -Arguments @('rev-parse', '--git-path', 'hooks/pre-push')
    if (-not [IO.Path]::IsPathRooted($hookPath)) { $hookPath = Join-Path $Root $hookPath }
    if (-not (Test-Path -LiteralPath $hookPath -PathType Leaf) -or
        (Get-Content -LiteralPath $hookPath -Raw) -notmatch '# hushpinterest-pre-push') {
        throw "There is no HushPinterest pre-push hook at $hookPath, and a release push never goes out ungated. Run scripts/install-hooks.ps1 first."
    }
    $names = @('HUSHPINTEREST_SKIP_PRE_PUSH', 'HUSHPINTEREST_RELEASE_GATE') + @($Environment.Keys)
    $saved = @{}
    foreach ($name in $names) { $saved[$name] = [Environment]::GetEnvironmentVariable($name, [EnvironmentVariableTarget]::Process) }
    try {
        [Environment]::SetEnvironmentVariable('HUSHPINTEREST_SKIP_PRE_PUSH', $null, [EnvironmentVariableTarget]::Process)
        $gate = if ($ReleaseGate) { '1' } else { $null }
        [Environment]::SetEnvironmentVariable('HUSHPINTEREST_RELEASE_GATE', $gate, [EnvironmentVariableTarget]::Process)
        foreach ($name in $Environment.Keys) {
            [Environment]::SetEnvironmentVariable($name, [string]$Environment[$name], [EnvironmentVariableTarget]::Process)
        }
        # git reports the push, and the hook its whole gate, on stderr. With the error stream redirected
        # (release.ps1 ... *> run.log), Windows PowerShell under Stop throws at the first such line, so
        # git's exit code decides here.
        Invoke-ReleaseNative 'The push (its gate output is above)' {
            $ErrorActionPreference = 'Continue'
            & git -C $Root push origin HEAD:refs/heads/main
        }
    } finally {
        foreach ($name in $names) { [Environment]::SetEnvironmentVariable($name, $saved[$name], [EnvironmentVariableTarget]::Process) }
    }
}
