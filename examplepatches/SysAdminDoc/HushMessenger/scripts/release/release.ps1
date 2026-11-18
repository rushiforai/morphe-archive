<#
.SYNOPSIS
    Cuts a HushMessenger release in one command: scripts/release/release.ps1 -Version X -Summary <file>

.DESCRIPTION
    Start it once in the background. It runs prepare (the cut, committed as "chore: release v<version>",
    with the -Summary text above the source index's ### groups), preflight, build (the gate, a bundle that
    matches the README checksum, signed SHA256SUMS.txt, one Desktop patch per build family), walk
    (scripts/walk-app.ps1, only a PASS goes on), publish and index. Every stage but the walk is its own run
    of this script with -Stage, and a rerun resumes at the first one not done for HEAD. -From <stage> redoes
    that stage and the rest, -DryRun checks what the release needs, -NeedsMatt "<what>" parks it, -Abandon
    drops its state. State, assets and release.log are in build/release/<version>/. -BundleKey is
    morphe-signing.pub's private key, which Manager pins.
#>
#Requires -Version 7
[CmdletBinding()]
param(
    [ValidateSet('prepare', 'preflight', 'build', 'publish', 'index')][string]$Stage,
    [Parameter(Mandatory = $true)][ValidatePattern('^\d+\.\d+\.\d+$')][string]$Version,
    [string]$Summary,
    [ValidateSet('prepare', 'preflight', 'build', 'walk', 'publish', 'index')][string]$From,
    [switch]$DryRun, [string]$NeedsMatt, [switch]$Abandon,
    [ValidatePattern('^(\d{4}-\d{2}-\d{2})?$')][string]$Date,
    [string]$SigningKey, [string]$BundleKey, [string]$DesktopJar, [string]$CompatClasspath, [string]$Java,
    # publish: the walk-receipt.json a whole-app walk of this exact bundle left.
    [string]$Walk,
    [string]$Repository = 'SysAdminDoc/HushMessenger'
)

$ErrorActionPreference = 'Stop'
$stageTimer = [Diagnostics.Stopwatch]::StartNew()
# Not a parameter default: Windows PowerShell leaves $PSScriptRoot empty while it evaluates them.
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if (-not $Date) { $Date = (Get-Date).ToString('yyyy-MM-dd') }
if (-not $SigningKey) { $SigningKey = Join-Path $HOME '.ssh/hushmessenger_release_ed25519' }
if (-not $BundleKey) { $BundleKey = Join-Path $HOME '.ssh/hushmessenger_morphe_signing.key' }
$tag = "v$Version"
$bundleName = "patches-$Version.mpp"
$work = Join-Path $root "build/release/$Version"
$assets = Join-Path $work 'assets'
$statePath = Join-Path $work 'state.json'

# Run from a pwsh prompt, this script shares the prompt's process, so it puts back the variables it sets.
$fromUser = 'HUSHMESSENGER_BUILD_WRAPPER', 'BUILD_QUEUE_SCRIPT', 'HUSH_NATIVE_FIXTURES', 'HUSHMESSENGER_DESKTOP_JAR',
    'HUSHMESSENGER_COMPAT_CLASSPATH', 'HUSH_RELEASE_CONFIG', 'HUSH_RELEASE_STATE_DIR'
$savedEnvironment = @{}
foreach ($name in $fromUser + 'BUILD_QUEUE_PRIORITY', 'MORPHE_SIGNING_KEY', 'GITHUB_TOKEN', 'GITHUB_ACTOR') {
    $savedEnvironment[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
}
function Restore-Environment { foreach ($name in $savedEnvironment.Keys) { [Environment]::SetEnvironmentVariable($name, $savedEnvironment[$name], 'Process') } }
trap { Restore-Environment; break }
# A shell started before these were set still finds them.
foreach ($name in $fromUser) {
    if (-not [Environment]::GetEnvironmentVariable($name, 'Process')) {
        [Environment]::SetEnvironmentVariable($name, [Environment]::GetEnvironmentVariable($name, 'User'), 'Process')
    }
}
if (-not $DesktopJar) { $DesktopJar = $env:HUSHMESSENGER_DESKTOP_JAR }
if (-not $CompatClasspath) { $CompatClasspath = $env:HUSHMESSENGER_COMPAT_CLASSPATH }
if (-not $Java) { $Java = if ($env:JAVA_HOME) { Join-Path $env:JAVA_HOME 'bin/java.exe' } else { 'java' } }
$env:BUILD_QUEUE_PRIORITY = 'release'
. (Join-Path $root 'scripts/walk-receipt.ps1')

function Write-Step([string]$Text) { Write-Host "[release $Version] $Text" -ForegroundColor Cyan }
function Invoke-Checked([string]$What, [scriptblock]$Block) { $global:LASTEXITCODE = 0; & $Block; if ($LASTEXITCODE) { throw "$What failed (exit $LASTEXITCODE)." } }
function Invoke-Git { $gitArguments = $args; Invoke-Checked "git $($gitArguments -join ' ')" { & git -C $root @gitArguments } }
function Invoke-Python {
    $pythonArguments = $args
    Invoke-Checked "python $($pythonArguments -join ' ')" { if (Get-Command py -ErrorAction SilentlyContinue) { & py -3.13 @pythonArguments } else { & python @pythonArguments } }
}
function Invoke-Gradle([string[]]$Tasks) {
    $wrapper = $env:HUSHMESSENGER_BUILD_WRAPPER
    Push-Location -LiteralPath $root
    try { Invoke-Checked "Gradle $($Tasks -join ' ')" { if ($wrapper) { & $wrapper -ProjectDir $root -Tasks $Tasks } else { & (Join-Path $root 'gradlew.bat') @Tasks } } }
    finally { Pop-Location }
}
function Invoke-Queued([string]$Label, [scriptblock]$Block) {
    $queue = $env:BUILD_QUEUE_SCRIPT
    if (-not $queue) { Invoke-Checked $Label $Block; return }
    # Dot-sourcing binds the queue's own parameters here, and before 2026-10-09 one of them was $Label.
    $what = $Label
    . $queue
    $code = Invoke-InBuildQueue -Label $what -ScriptBlock $Block
    if ($code) { throw "$what failed (exit $code)." }
}
function Get-Head { (& git -C $root rev-parse HEAD).Trim() }
function Assert-Clean { $dirty = & git -C $root status --porcelain --untracked-files=no; if ($dirty) { throw "The working tree has uncommitted changes:`n$($dirty -join "`n")" } }
function Read-State { if (Test-Path -LiteralPath $statePath) { Get-Content -LiteralPath $statePath -Raw | ConvertFrom-Json -AsHashtable } else { @{} } }
function Save-Stage([string]$Name, [hashtable]$Facts) {
    $state = Read-State
    $seconds = [Math]::Round($stageTimer.Elapsed.TotalSeconds, 3)
    $state[$Name] = $Facts + @{ finished = [DateTimeOffset]::UtcNow.ToString('o'); seconds = $seconds }
    New-Item -ItemType Directory -Force -Path $work | Out-Null
    $state | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $statePath -Encoding utf8
    Write-Step "$Name completed in $seconds seconds, including queue waits."
}
function Assert-Stage([string]$Name, [switch]$SameCommit) {
    $state = Read-State
    if (-not $state.ContainsKey($Name)) { throw "Run -Stage $Name for $Version first." }
    if ($SameCommit -and $state[$Name].commit -ne (Get-Head)) { throw "-Stage $Name ran on $($state[$Name].commit), not on HEAD $(Get-Head). Run it again for this commit." }
    return $state[$Name]
}
function Get-FileSha256([string]$Path) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }
# LF and no BOM, as git stores these files.
function Write-Text([string]$Path, [string]$Text) { [IO.File]::WriteAllText($Path, ($Text -replace "`r`n", "`n"), (New-Object Text.UTF8Encoding $false)) }
function Get-PublicVersion { (Get-Content -LiteralPath (Join-Path $root 'patches-bundle.json') -Raw | ConvertFrom-Json).version }
function Get-BundlePublicKey { (Get-Content -LiteralPath (Join-Path $root 'morphe-signing.pub') -Raw).Trim() }
# The build signs the bundle in :patches:buildAndroid and refuses a key that isn't morphe-signing.pub's.
function Use-BundleKey {
    if (-not (Test-Path -LiteralPath $BundleKey -PathType Leaf)) { throw "Pass -BundleKey, the private key morphe-signing.pub belongs to. $BundleKey is not there." }
    $env:MORPHE_SIGNING_KEY = (Get-Content -LiteralPath $BundleKey -Raw).Trim()
}
# The bundle checksum README.md pins, which prepare wrote and every later stage must reproduce.
function Get-PinnedSha256 {
    $match = [regex]::Match((Get-Content -LiteralPath (Join-Path $root 'README.md') -Raw), "(?m)^([a-f0-9]{64})  $([regex]::Escape($bundleName))\r?$")
    if (-not $match.Success) { throw "README.md has no checksum line for $bundleName." }
    return $match.Groups[1].Value
}
function Assert-Facts {
    $properties = Get-Content -LiteralPath (Join-Path $root 'gradle.properties') -Raw
    if ($properties -notmatch "(?m)^version=$([regex]::Escape($Version))\r?$") { throw "gradle.properties isn't at $Version." }
    $heading = [regex]::Match((Get-Content -LiteralPath (Join-Path $root 'CHANGELOG.md') -Raw), '(?m)^## (.+)$').Groups[1].Value
    if (-not $heading.StartsWith("$Version (")) { throw "The first CHANGELOG heading is '$heading', not $Version." }
    if ((Get-PublicVersion) -ne $Version) { throw "patches-bundle.json isn't at $Version." }
    Get-PinnedSha256 | Out-Null
}
# One code per Messenger build family: records whose hook lines are identical share a mapping.
function Get-FamilyCodes {
    $families = [ordered]@{}
    foreach ($record in Get-ChildItem -LiteralPath (Join-Path $root 'scripts/profiles') -Filter '*.txt' | Sort-Object Name) {
        $hooks = (Get-Content -LiteralPath $record.FullName | Where-Object { $_ -notmatch '^(#|version |code |sha256 )' }) -join "`n"
        if (-not $families.Contains($hooks)) { $families[$hooks] = $record.BaseName }
    }
    return @($families.Values)
}

if (-not $Stage) {
    $steps = 'prepare', 'preflight', 'build', 'walk', 'publish', 'index'
    $statusFile = if ($env:HUSH_RELEASE_STATE_DIR) { Join-Path $env:HUSH_RELEASE_STATE_DIR "HushMessenger-$Version.json" }
    $summaryPath = Join-Path $work 'summary.md'
    $log = Join-Path $work 'release.log'
    function Exit-Release([int]$Code) { Restore-Environment; exit $Code }
    # ~/.claude/hooks/unfinished-release-guard.js reads this file.
    function Set-Status([string]$Step, [string]$Status, [string]$Note = '') {
        if (-not $statusFile) { return }
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $statusFile) | Out-Null
        [ordered]@{ repo = 'HushMessenger'; version = $Version; step = $Step; status = $Status; pid = $PID; log = $log; note = $Note } |
            ConvertTo-Json | Set-Content -LiteralPath $statusFile -Encoding utf8NoBOM
    }
    if ($NeedsMatt) { Set-Status 'hold' 'needs-matt' $NeedsMatt; Write-Step "held: $NeedsMatt"; Exit-Release 0 }
    if ($Abandon) {
        Remove-Item -LiteralPath $work, $statusFile -Recurse -Force -ErrorAction SilentlyContinue
        Write-Step 'dropped its state. A cut that was already committed stays in git.'; Exit-Release 0
    }
    $problems = @()
    if (-not $Summary -and -not (Test-Path -LiteralPath $summaryPath)) { $problems += '-Summary names the file with the release summary' }
    if ($Summary -and -not (Test-Path -LiteralPath $Summary -PathType Leaf)) { $problems += "there's no summary at $Summary" }
    foreach ($key in $BundleKey, $SigningKey) { if (-not (Test-Path -LiteralPath $key -PathType Leaf)) { $problems += "there's no key at $key" } }
    foreach ($path in $env:HUSH_NATIVE_FIXTURES, $DesktopJar) { if (-not $path -or -not (Test-Path -LiteralPath $path)) { $problems += "HUSH_NATIVE_FIXTURES or the Desktop JAR ($path) isn't there" } }
    if (-not $CompatClasspath) { $problems += 'HUSHMESSENGER_COMPAT_CLASSPATH is not set' }
    if (-not $env:HUSH_RELEASE_CONFIG) { $problems += 'HUSH_RELEASE_CONFIG names no walk devices' }
    & gh auth status *> $null
    if ($LASTEXITCODE) { $problems += 'gh is not signed in' }
    if ($problems) { Write-Host "[release $Version] can't start: $($problems -join '; ')." -ForegroundColor Red; Exit-Release 1 }
    if ($DryRun) { Write-Step 'ready'; Exit-Release 0 }

    # The Gradle settings plugin reads GitHub Packages with these.
    if (-not $env:GITHUB_TOKEN) { $env:GITHUB_TOKEN = (& gh auth token) }
    if (-not $env:GITHUB_ACTOR) { $env:GITHUB_ACTOR = 'SysAdminDoc' }
    New-Item -ItemType Directory -Force -Path $work | Out-Null
    if ($Summary) { Copy-Item -LiteralPath $Summary -Destination $summaryPath -Force }
    Start-Transcript -LiteralPath $log -Append | Out-Null
    $pwsh = (Get-Process -Id $PID).Path
    $pass = foreach ($name in 'Version', 'Date', 'SigningKey', 'BundleKey', 'DesktopJar', 'CompatClasspath', 'Java', 'Repository') { "-$name"; Get-Variable -Name $name -ValueOnly }
    # A plain function, so every dash word reaches the script.
    function Invoke-Script {
        $global:LASTEXITCODE = 0
        & $pwsh -NoProfile -File @args 2>&1 | ForEach-Object { Write-Host $_ }
        if ($LASTEXITCODE) { throw "$(Split-Path -Leaf $args[0]) $($args[1..2] -join ' ') stopped (exit $LASTEXITCODE)." }
    }
    # check_release.py --describe keeps the description's text before its ### groups, which is the summary.
    function Set-Summary {
        $indexPath = Join-Path $root 'patches-bundle.json'
        $index = Get-Content -LiteralPath $indexPath -Raw | ConvertFrom-Json
        $groups = $index.description.IndexOf("`n`n### ")
        if ($groups -lt 0) { throw 'The source index description has no ### groups after prepare.' }
        $index.description = ((Get-Content -LiteralPath $summaryPath -Raw) -replace "`r`n", "`n").Trim() + $index.description.Substring($groups)
        Write-Text $indexPath (($index | ConvertTo-Json -Depth 5) + "`n")
    }

    $forced = if ($From) { $steps.IndexOf($From) } else { $steps.Count }
    foreach ($step in $steps) {
        $state = Read-State
        $head = Get-Head
        $done = $steps.IndexOf($step) -lt $forced -and $(switch ($step) {
            'prepare' { $state.pinned.commit -eq $head }
            'walk' { $state.walk.commit -eq $head -and $state.walk.sha256 -eq $state.build.sha256 }
            { $_ -in 'publish', 'index' } { $state.ContainsKey($step) }
            default { $state[$step].commit -eq $head }
        })
        if ($done) { Write-Step "$step already done"; continue }
        Set-Status $step 'running'
        try {
            switch ($step) {
                'prepare' {
                    $cutCommitted = [bool](& git -C $root log -1 --format=%H --fixed-strings --grep "chore: release $tag")
                    # A run stopped between the cut and its commit left the cut in the tree, so that gets committed.
                    $leftOver = (& git -C $root status --porcelain --untracked-files=no) -and $state.prepare.base -eq $head
                    if (-not $leftOver) { Invoke-Script $PSCommandPath -Stage prepare @pass }
                    Set-Summary
                    Invoke-Git add -u
                    & git -C $root diff --cached --quiet
                    if ($LASTEXITCODE) { Invoke-Git commit -q -m $(if ($cutCommitted) { "chore: pin the $tag bundle checksum" } else { "chore: release $tag" }) }
                    Save-Stage 'pinned' @{ commit = (Get-Head) }
                }
                'walk' {
                    $out = Join-Path $work 'walk'
                    Invoke-Script (Join-Path $root 'scripts/walk-app.ps1') -Bundle (Join-Path $assets $bundleName) -OutDir $out
                    Save-Stage 'walk' @{ commit = (Get-Head); sha256 = (Read-State).build.sha256; receipt = (Join-Path $out 'walk-receipt.json') }
                }
                'publish' { Invoke-Script $PSCommandPath -Stage publish @pass -Walk (Read-State).walk.receipt }
                default { Invoke-Script $PSCommandPath -Stage $step @pass }
            }
        } catch {
            Set-Status $step 'failed' $_.Exception.Message
            Write-Host "[release $Version] $step failed: $($_.Exception.Message)`nFix it, commit, and run this again. It resumes here. Log: $log" -ForegroundColor Red
            Stop-Transcript | Out-Null; Exit-Release 1
        }
    }
    if ($statusFile) { Remove-Item -LiteralPath $statusFile -Force -ErrorAction SilentlyContinue }
    Write-Step "$tag is out."
    Stop-Transcript | Out-Null; Exit-Release 0
}

switch ($Stage) {
    'prepare' {
        Assert-Clean
        Use-BundleKey
        $changelogPath = Join-Path $root 'CHANGELOG.md'
        $changelog = Get-Content -LiteralPath $changelogPath -Raw
        $heading = [regex]::Match($changelog, '(?m)^## (.+?)\r?$').Groups[1].Value
        $readmePath = Join-Path $root 'README.md'
        if ($heading -eq 'Unreleased') {
            $previous = Get-PublicVersion
            if ([version]$Version -le [version]$previous) { throw "$Version isn't newer than the published $previous." }
            Write-Step "version, timestamp, CHANGELOG, README and source index ($previous -> $Version)"
            $utc = [DateTime]::UtcNow
            $now = [DateTimeOffset]::new($utc.Ticks - ($utc.Ticks % [TimeSpan]::TicksPerSecond), [TimeSpan]::Zero)
            $propertiesPath = Join-Path $root 'gradle.properties'
            Write-Text $propertiesPath ((Get-Content -LiteralPath $propertiesPath -Raw) -replace '(?m)^version=.*?(\r?)$', "version=$Version`$1" -replace
                '(?m)^bundleTimestampMillis=.*?(\r?)$', "bundleTimestampMillis=$($now.ToUnixTimeMilliseconds())`$1")
            Write-Text $changelogPath (([regex]'(?m)^## Unreleased(\r?)$').Replace($changelog, "## $Version ($Date)`$1", 1))
            $readme = Get-Content -LiteralPath $readmePath -Raw
            $old = [regex]::Escape($previous)
            $readme = $readme -replace "badge/version-$old-", "badge/version-$Version-"
            $readme = $readme -replace "alt=`"Version $old`"", "alt=`"Version $Version`""
            $readme = $readme -replace "\[v$old release\]", "[v$Version release]"
            $readme = $readme -replace "releases/(tag|download)/v$old(?!\.?\d)", "releases/`$1/v$Version"
            $readme = $readme -replace "(?<![\w.-])patches-$old(?!\.?\d)", "patches-$Version"
            $readme = ($readme -split "`n" | Where-Object { $_ -notmatch 'img\.shields\.io/badge/development-' }) -join "`n"
            Write-Text $readmePath $readme
            # The bug form's example line names the release the way the README does; check_release.py reads it.
            $formPath = Join-Path $root '.github/ISSUE_TEMPLATE/bug_report.yml'
            $form = Get-Content -LiteralPath $formPath -Raw
            Write-Text $formPath ($form -replace "placeholder: HushMessenger $old on Messenger ", "placeholder: HushMessenger $Version on Messenger ")
            $indexPath = Join-Path $root 'patches-bundle.json'
            $index = Get-Content -LiteralPath $indexPath -Raw | ConvertFrom-Json
            $index.version = $Version
            $index.download_url = "https://github.com/$Repository/releases/download/$tag/$bundleName"
            $index.created_at = $now.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ss')
            $index | Add-Member -NotePropertyName public_key -NotePropertyValue (Get-BundlePublicKey) -Force
            Write-Text $indexPath (($index | ConvertTo-Json -Depth 5) + "`n")
        } elseif ($heading.StartsWith("$Version (")) {
            # Already cut: rebuild and pin the checksum again after a fix, keeping the timestamp.
            Assert-Facts
            Write-Step 'already cut, pinning the checksum again'
        } else {
            throw "The first CHANGELOG heading is '$heading', neither Unreleased nor $Version."
        }
        try {
            # The section's groups after the description's summary, again on a rerun so a CHANGELOG edit reaches it.
            Invoke-Python (Join-Path $root 'scripts/check_release.py') --describe
            Write-Step 'bundle and catalog (one Gradle run, no daemon left holding the signing key)'
            Invoke-Gradle @(':patches:buildAndroid', ':patches:generatePatchCatalog', '--no-daemon', '--no-configuration-cache')
            $digest = Get-FileSha256 (Join-Path $root "patches/build/libs/$bundleName")
            $readme = Get-Content -LiteralPath $readmePath -Raw
            $line = [regex]"(?m)^[a-f0-9]{64}  $([regex]::Escape($bundleName))(\r?)$"
            if (-not $line.IsMatch($readme)) { throw "README.md has no checksum line for $bundleName to update." }
            Write-Text $readmePath $line.Replace($readme, "$digest  $bundleName`$1", 1)
        } catch {
            # Put the cut back, so prepare starts again from a clean tree after the fix.
            if ($heading -eq 'Unreleased') { & git -C $root checkout -- gradle.properties CHANGELOG.md README.md patches-bundle.json .github/ISSUE_TEMPLATE/bug_report.yml }
            throw
        }
        Save-Stage 'prepare' @{ base = (Get-Head); sha256 = $digest }
        Write-Step "bundle SHA-256 $digest. Run without -Stage, this is committed and the release goes on by itself."
    }

    'preflight' {
        # The tests run once, in the build stage's gate.
        Assert-Stage 'prepare' | Out-Null
        Assert-Clean
        Assert-Facts
        Save-Stage 'preflight' @{ commit = (Get-Head) }
    }

    'build' {
        Assert-Stage 'preflight' -SameCommit | Out-Null
        Assert-Clean
        Assert-Facts
        Use-BundleKey
        if (-not ($env:HUSH_NATIVE_FIXTURES -and $DesktopJar -and $CompatClasspath)) { throw 'Set HUSH_NATIVE_FIXTURES (the exact stock APKs), -DesktopJar (Morphe Desktop 1.20.0+) and -CompatClasspath (dexlib2, Guava, failureaccess).' }
        $commit = Get-Head
        $state = Read-State
        if (-not ($state.ContainsKey('gate') -and $state.gate.commit -eq $commit)) {
            Write-Step 'full gate with the fixture replays'
            Invoke-Gradle @(':patches:clean', ':extensions:messenger:clean', ':patches:test', ':patches:check',
                ':extensions:messenger:testDebugUnitTest', ':extensions:messenger:lintRelease',
                ':extensions:messenger:assembleRelease', '--no-daemon', '--no-configuration-cache', '--no-build-cache')
            # The bundle comes from its own run after the tests, which can leave a Java-only archive behind.
            Write-Step 'bundle and release metadata'
            Invoke-Gradle @(':patches:buildAndroid', ':patches:verifyReleaseMetadata', '--no-daemon', '--no-configuration-cache')
            Save-Stage 'gate' @{ commit = $commit }
        } else {
            Write-Step "gate already passed on $commit"
        }
        $built = Join-Path $root "patches/build/libs/$bundleName"
        $digest = Get-FileSha256 $built
        $pinned = Get-PinnedSha256
        if ($digest -ne $pinned) { throw "The rebuilt bundle is $digest, but README.md pins $pinned. Run -Stage prepare again to re-pin it, or find what made the build differ." }
        New-Item -ItemType Directory -Force -Path $assets | Out-Null
        $bundle = Join-Path $assets $bundleName
        Copy-Item -LiteralPath $built -Destination $bundle -Force
        Copy-Item -LiteralPath (Join-Path $root 'patches/build/reports/catalog-evidence.json') -Destination (Join-Path $assets 'catalog-evidence.json') -Force
        $sums = Join-Path $assets 'SHA256SUMS.txt'
        Write-Text $sums "$digest  $bundleName`n"
        Remove-Item -LiteralPath "$sums.sig" -ErrorAction SilentlyContinue
        Write-Step 'signing SHA256SUMS.txt'
        Invoke-Checked 'ssh-keygen sign' { & ssh-keygen -Y sign -f $SigningKey -n hushmessenger-release $sums }
        Push-Location -LiteralPath $root
        try {
            Invoke-Python scripts/check_release.py --release-tag $tag --bundle $bundle --evidence (Join-Path $assets 'catalog-evidence.json') --checksums $sums --verify-signature
        } finally { Pop-Location }
        $receipts = Join-Path $work 'receipts'
        New-Item -ItemType Directory -Force -Path $receipts | Out-Null
        foreach ($code in Get-FamilyCodes) {
            $receipt = Join-Path $receipts "$code.json"
            $found = @(Get-ChildItem -LiteralPath $env:HUSH_NATIVE_FIXTURES -Filter "messenger-*-$code.apk")
            if ($found.Count -ne 1) { throw "Expected one messenger-<version>-$code.apk in $env:HUSH_NATIVE_FIXTURES, found $($found.Count)." }
            $apk = $found[0].FullName
            $stock = Get-FileSha256 $apk
            # CompatReport writes LF; a checkout can hold the record with CRLF.
            $profileText = (Get-Content -LiteralPath (Join-Path $root "scripts/profiles/$code.txt") -Raw) -replace "`r`n", "`n"
            # Only the stock APK the profile was recorded from proves this bundle patches that build.
            $recordedStock = [regex]::Match($profileText, '(?m)^sha256 ([0-9a-f]{64})$').Groups[1].Value
            if ($stock -ne $recordedStock) { throw "$apk is $stock, but scripts/profiles/$code.txt was recorded from $recordedStock. Put the unmodified APK from APKMirror in HUSH_NATIVE_FIXTURES." }
            $profileHash = [Convert]::ToHexString([Security.Cryptography.SHA256]::HashData([Text.Encoding]::UTF8.GetBytes($profileText))).ToLowerInvariant()
            if (Test-Path -LiteralPath $receipt) {
                $kept = Get-Content -LiteralPath $receipt -Raw | ConvertFrom-Json
                if ($kept.bundle_sha256 -eq $digest -and $kept.stock_sha256 -eq $stock -and $kept.profile_sha256 -eq $profileHash) { Write-Step "$code already patched with this bundle"; continue }
            }
            $scratch = Join-Path $work "profiles-$code"
            Remove-Item -LiteralPath $scratch -Recurse -Force -ErrorAction SilentlyContinue
            New-Item -ItemType Directory -Path $scratch | Out-Null
            Write-Step "patching family $code with Desktop"
            Push-Location -LiteralPath $root
            try { Invoke-Queued "hushmessenger release patch $code" { & $Java -Xmx1024m -XX:ActiveProcessorCount=2 -cp $CompatClasspath scripts/CompatReport.java $apk --save $scratch $DesktopJar $bundle } }
            finally { Pop-Location }
            $fresh = Join-Path $scratch "$code.txt"
            if (-not (Test-Path -LiteralPath $fresh)) { throw "CompatReport wrote no profile for $code." }
            if (((Get-Content -LiteralPath $fresh -Raw) -replace "`r`n", "`n") -ne $profileText) { throw "The $code profile from this bundle differs from scripts/profiles/$code.txt. Compare $fresh." }
            Remove-Item -LiteralPath $scratch -Recurse -Force
            [ordered]@{ code = $code; bundle_sha256 = $digest; stock_sha256 = $stock; profile_sha256 = $profileHash; commit = $commit; profile = 'identical' } |
                ConvertTo-Json | Set-Content -LiteralPath $receipt -Encoding utf8
        }
        Save-Stage 'build' @{ commit = $commit; sha256 = $digest; sums_sha256 = (Get-FileSha256 $sums); sig_sha256 = (Get-FileSha256 "$sums.sig") }
        Write-Step "passed. Assets are in $assets."
    }

    'publish' {
        $build = Assert-Stage 'build' -SameCommit
        Assert-Clean
        $files = @($bundleName, 'SHA256SUMS.txt', 'SHA256SUMS.txt.sig') | ForEach-Object { Join-Path $assets $_ }
        foreach ($file in $files) { if (-not (Test-Path -LiteralPath $file)) { throw "Missing release asset $file." } }
        if ((Get-FileSha256 $files[0]) -ne $build.sha256) { throw 'The bundle in the assets folder changed after the build stage.' }
        # The checksum file and its signature were verified in the build stage, so they must be the same bytes now.
        if ((Get-FileSha256 $files[1]) -ne $build.sums_sha256 -or (Get-FileSha256 $files[2]) -ne $build.sig_sha256) { throw 'SHA256SUMS.txt or its signature changed after the build stage. Run -Stage build again.' }
        # Nothing goes public until the whole app has been walked with this exact bundle.
        if (-not $Walk) { throw "-Walk names the walk-receipt.json that scripts/walk-app.ps1 -Bundle $($files[0]) left." }
        $walked = Test-WalkReceipt -Path $Walk -BundlePath $files[0]
        if (-not $walked.Valid) { throw "The whole-app walk doesn't back $bundleName, so nothing was published: $($walked.Reason)." }
        Write-Step "walked on $($walked.Receipt.device): $($walked.Receipt.screens) screens, no crash"
        $notes = Join-Path $work 'notes.md'
        Invoke-Python -I (Join-Path $root 'scripts/release_notes.py') --root $root --version $Version --walk (Resolve-Path -LiteralPath $Walk).Path --out $notes
        $existing = & git -C $root tag -l $tag
        if (-not $existing) { Write-Step "tag $tag"; Invoke-Git tag -a $tag -m $tag }
        elseif ((& git -C $root rev-list -n 1 $tag).Trim() -ne $build.commit) { throw "$tag already points at another commit." }
        Invoke-Git push origin "refs/tags/$tag"
        # A draft until its assets match the build, so a run that stops halfway leaves nothing public and the rerun uploads the rest.
        $view = & gh release view $tag --repo $Repository --json isDraft 2> $null
        if ($LASTEXITCODE) { Invoke-Checked 'gh release create' { & gh release create $tag @files --repo $Repository --title $tag --notes-file $notes --verify-tag --draft }; $view = '{"isDraft": true}' }
        $draft = [bool](($view | Out-String) | ConvertFrom-Json).isDraft
        Write-Step "release $tag$(if ($draft) { ' (a draft)' }), checking its assets"
        $download = Join-Path $work 'downloaded'
        foreach ($round in 1, 2) {
            Remove-Item -LiteralPath $download -Recurse -Force -ErrorAction SilentlyContinue
            Invoke-Checked 'gh release download' { & gh release download $tag --repo $Repository --dir $download }
            $wrong = @($files | Where-Object { $back = Join-Path $download (Split-Path -Leaf $_); -not (Test-Path -LiteralPath $back) -or (Get-FileSha256 $back) -ne (Get-FileSha256 $_) })
            if ($wrong.Count -and (-not $draft -or $round -eq 2)) { throw ('The released {0} has a missing or different {1}. If the built one is right: gh release upload {0} {2} --repo {3} --clobber' -f $tag, (($wrong | Split-Path -Leaf) -join ', '), (($wrong | ForEach-Object { """$_""" }) -join ' '), $Repository) }
            if ($wrong.Count) { Invoke-Checked 'gh release upload' { & gh release upload $tag @wrong --repo $Repository --clobber } } else { break }
        }
        Remove-Item -LiteralPath $download -Recurse -Force
        if ($draft) { Invoke-Checked 'gh release edit' { & gh release edit $tag --repo $Repository --draft=false } }
        Save-Stage 'publish' @{ commit = $build.commit; sha256 = $build.sha256 }
    }

    'index' {
        $published = Assert-Stage 'publish'
        # main can move between publish and index. HEAD has to carry the published commit, so a merge of
        # origin/main is fine and a rebase isn't: the tag and the release already point at that commit.
        & git -C $root merge-base --is-ancestor $published.commit HEAD
        if ($LASTEXITCODE) { throw "HEAD doesn't contain the published commit $($published.commit). Merge it in, never rebase, then run -Stage index again." }
        Invoke-Git fetch origin main
        & git -C $root merge-base --is-ancestor origin/main HEAD
        if ($LASTEXITCODE) { throw 'origin/main has commits this checkout lacks. Merge origin/main in, never rebase, then run -Stage index again.' }
        Write-Step 'pushing main with the new source index'
        Invoke-Git push origin HEAD:main
        $served = $null
        foreach ($attempt in 1..10) {
            $raw = "https://raw.githubusercontent.com/$Repository/main/patches-bundle.json?release=$Version-$([DateTimeOffset]::UtcNow.ToUnixTimeSeconds())"
            # A 404 or a 5xx right after the push is as transient as stale content, so it gets the same retries.
            try { $served = Invoke-RestMethod -Uri $raw -Headers @{ 'Cache-Control' = 'no-cache' } }
            catch { Write-Step "source index not served yet: $($_.Exception.Message)" }
            if ($served -and $served.version -eq $Version) { break }
            Start-Sleep -Seconds 15
        }
        if (-not $served -or $served.version -ne $Version) { throw "GitHub still serves source index $($served.version)." }
        if ($served.public_key -cne (Get-BundlePublicKey)) { throw "The served source index public_key isn't the key in morphe-signing.pub." }
        $check = Join-Path $work 'index-download.mpp'
        Invoke-WebRequest -Uri $served.download_url -OutFile $check
        if ((Get-FileSha256 $check) -ne $published.sha256) { throw "The index download URL doesn't return the released bundle." }
        Remove-Item -LiteralPath $check
        Save-Stage 'index' @{ commit = $published.commit }
        Write-Step "done. Manager now offers $Version."
    }
}
Restore-Environment
