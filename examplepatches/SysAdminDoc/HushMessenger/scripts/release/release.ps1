<#
.SYNOPSIS
    Cuts a HushMessenger release in stages: prepare, preflight, build, publish, index.

.DESCRIPTION
    One command per stage, in this order. Each stage checks that the one before it finished for
    the same commit and refuses otherwise, so a stage can be re-run after a fix without redoing
    the others. State and assets live in build/release/<version>/.

      prepare    Version and pinned UTC bundle timestamp in gradle.properties, the CHANGELOG cut,
                 README badge, links and checksum, the source index and the catalog. Builds the
                 bundle once to learn its checksum. Then review the README counts and the index
                 description by hand and commit "chore: release v<version>".
      preflight  The quick checks, a few minutes: the script tests, the patch and extension unit
                 tests without the private fixture replays, and the release facts.
      build      From the clean, preflighted commit: the full gate with the fixture replays,
                 the release metadata check, a reproducible bundle that must match the README
                 checksum, SHA256SUMS.txt and its signature, then one Desktop patch run per
                 Messenger build family (CompatReport --save into a scratch folder, which must
                 match scripts/profiles). A family that already passed with this bundle keeps its
                 receipt and isn't patched again.
      publish    The annotated tag, pushed on its own, and the GitHub release with the bundle,
                 SHA256SUMS.txt and the signature. Notes are the whole CHANGELOG section. Each
                 asset is downloaded back and compared.
      index      Pushes main, which carries the new source index, then checks that GitHub serves
                 it and that its download URL returns the released bundle.

    Gradle goes through HUSHMESSENGER_BUILD_WRAPPER when it is set and the Desktop runs through
    the machine queue BUILD_QUEUE_SCRIPT names, both at release priority. Unset, they run directly.

.EXAMPLE
    scripts/release/release.ps1 -Stage prepare -Version 0.23.0
    scripts/release/release.ps1 -Stage build -Version 0.23.0 -DesktopJar C:\tools\morphe-desktop-1.18.1-all.jar -CompatClasspath "<dexlib2>;<guava>;<failureaccess>"
#>
#Requires -Version 7
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][ValidateSet('prepare', 'preflight', 'build', 'publish', 'index')][string]$Stage,
    [Parameter(Mandatory = $true)][ValidatePattern('^\d+\.\d+\.\d+$')][string]$Version,
    [string]$Date,
    [string]$SigningKey,
    [string]$DesktopJar,
    [string]$CompatClasspath,
    [string]$Java,
    [string]$Repository = 'SysAdminDoc/HushMessenger'
)

$ErrorActionPreference = 'Stop'
# Not a parameter default: Windows PowerShell leaves $PSScriptRoot empty while it evaluates them.
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if (-not $Date) { $Date = (Get-Date).ToString('yyyy-MM-dd') }
if (-not $SigningKey) { $SigningKey = Join-Path $HOME '.ssh/hushmessenger_release_ed25519' }
$tag = "v$Version"
$bundleName = "patches-$Version.mpp"
$work = Join-Path $root "build/release/$Version"
$assets = Join-Path $work 'assets'
$statePath = Join-Path $work 'state.json'

# Run from a pwsh prompt, this script shares the prompt's process, so it puts back the variables it sets.
$savedEnvironment = @{}
foreach ($name in 'HUSHMESSENGER_BUILD_WRAPPER', 'BUILD_QUEUE_SCRIPT', 'HUSH_NATIVE_FIXTURES',
        'HUSHMESSENGER_DESKTOP_JAR', 'HUSHMESSENGER_COMPAT_CLASSPATH', 'BUILD_QUEUE_PRIORITY') {
    $savedEnvironment[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
}
function Restore-Environment {
    foreach ($name in $savedEnvironment.Keys) { [Environment]::SetEnvironmentVariable($name, $savedEnvironment[$name], 'Process') }
}
trap { Restore-Environment; break }

foreach ($name in 'HUSHMESSENGER_BUILD_WRAPPER', 'BUILD_QUEUE_SCRIPT', 'HUSH_NATIVE_FIXTURES',
        'HUSHMESSENGER_DESKTOP_JAR', 'HUSHMESSENGER_COMPAT_CLASSPATH') {
    if (-not (Get-Item "env:$name" -ErrorAction SilentlyContinue)) {
        $value = [Environment]::GetEnvironmentVariable($name, 'User')
        if ($value) { Set-Item "env:$name" $value }
    }
}
if (-not $DesktopJar) { $DesktopJar = $env:HUSHMESSENGER_DESKTOP_JAR }
if (-not $CompatClasspath) { $CompatClasspath = $env:HUSHMESSENGER_COMPAT_CLASSPATH }
if (-not $Java) { $Java = if ($env:JAVA_HOME) { Join-Path $env:JAVA_HOME 'bin/java.exe' } else { 'java' } }
$env:BUILD_QUEUE_PRIORITY = 'release'

function Write-Step([string]$Text) { Write-Host "[release $Version] $Text" -ForegroundColor Cyan }

function Invoke-Checked([string]$What, [scriptblock]$Block) {
    $global:LASTEXITCODE = 0
    & $Block
    if ($LASTEXITCODE) { throw "$What failed (exit $LASTEXITCODE)." }
}

function Invoke-Git {
    $gitArguments = $args
    Invoke-Checked "git $($gitArguments -join ' ')" { & git -C $root @gitArguments }
}

function Invoke-Gradle([string[]]$Tasks) {
    $wrapper = $env:HUSHMESSENGER_BUILD_WRAPPER
    if ($wrapper) {
        if (-not (Test-Path -LiteralPath $wrapper)) { throw "HUSHMESSENGER_BUILD_WRAPPER names $wrapper, which is not there." }
        Invoke-Checked "Gradle $($Tasks -join ' ')" { & $wrapper -ProjectDir $root -Tasks $Tasks }
    } else {
        Push-Location -LiteralPath $root
        try { Invoke-Checked "Gradle $($Tasks -join ' ')" { & (Join-Path $root 'gradlew.bat') @Tasks } } finally { Pop-Location }
    }
}

function Invoke-Queued([string]$Label, [scriptblock]$Block) {
    $queue = $env:BUILD_QUEUE_SCRIPT
    if (-not $queue) { Invoke-Checked $Label $Block; return }
    if (-not (Test-Path -LiteralPath $queue)) { throw "BUILD_QUEUE_SCRIPT names $queue, which is not there." }
    # Dot-sourcing binds the queue's own parameters here, and before 2026-10-09 one of them was $Label.
    $what = $Label
    . $queue
    $code = Invoke-InBuildQueue -Label $what -ScriptBlock $Block
    if ($code) { throw "$what failed (exit $code)." }
}

function Invoke-Python {
    $pythonArguments = $args
    $launcher = Get-Command py -ErrorAction SilentlyContinue
    if ($launcher) { Invoke-Checked "py $($pythonArguments -join ' ')" { & $launcher.Source -3.13 @pythonArguments } }
    else { Invoke-Checked "python $($pythonArguments -join ' ')" { & python @pythonArguments } }
}

function Get-Head { (& git -C $root rev-parse HEAD).Trim() }

function Assert-Clean {
    $dirty = & git -C $root status --porcelain --untracked-files=no
    if ($dirty) { throw "The working tree has uncommitted changes:`n$($dirty -join "`n")" }
}

function Read-State {
    if (Test-Path -LiteralPath $statePath) { return Get-Content -LiteralPath $statePath -Raw | ConvertFrom-Json -AsHashtable }
    return @{}
}

function Save-Stage([string]$Name, [hashtable]$Facts) {
    $state = Read-State
    $state[$Name] = $Facts + @{ finished = (Get-Date).ToUniversalTime().ToString('o') }
    New-Item -ItemType Directory -Force -Path $work | Out-Null
    $state | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $statePath -Encoding utf8
}

function Assert-Stage([string]$Name, [switch]$SameCommit) {
    $state = Read-State
    if (-not $state.ContainsKey($Name)) { throw "Run -Stage $Name for $Version first." }
    if ($SameCommit -and $state[$Name].commit -ne (Get-Head)) {
        throw "-Stage $Name ran on $($state[$Name].commit), not on HEAD $(Get-Head). Run it again for this commit."
    }
    return $state[$Name]
}

function Get-FileSha256([string]$Path) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }

function Write-Text([string]$Path, [string]$Text) {
    # LF and no BOM, as git stores these files.
    [System.IO.File]::WriteAllText($Path, ($Text -replace "`r`n", "`n"), (New-Object System.Text.UTF8Encoding $false))
}

function Get-PublicVersion { (Get-Content -LiteralPath (Join-Path $root 'patches-bundle.json') -Raw | ConvertFrom-Json).version }

# The bundle checksum README.md pins, which prepare wrote and every later stage must reproduce.
function Get-PinnedSha256 {
    $readme = Get-Content -LiteralPath (Join-Path $root 'README.md') -Raw
    $match = [regex]::Match($readme, "(?m)^([a-f0-9]{64})  $([regex]::Escape($bundleName))\r?$")
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

function Get-ChangelogSection {
    $text = Get-Content -LiteralPath (Join-Path $root 'CHANGELOG.md') -Raw
    $match = [regex]::Match($text, "(?ms)^## $([regex]::Escape($Version)) \([^)]*\)\r?\n(.*?)(?=^## |\z)")
    if (-not $match.Success -or -not $match.Groups[1].Value.Trim()) { throw "CHANGELOG.md has no section for $Version." }
    return $match.Groups[1].Value.Trim()
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

function Get-StockApk([string]$Code) {
    $found = @(Get-ChildItem -LiteralPath $env:HUSH_NATIVE_FIXTURES -Filter "messenger-*-$Code.apk")
    if ($found.Count -ne 1) { throw "Expected one messenger-<version>-$Code.apk in $env:HUSH_NATIVE_FIXTURES, found $($found.Count)." }
    return $found[0].FullName
}

switch ($Stage) {
    'prepare' {
        Assert-Clean
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
            $properties = Get-Content -LiteralPath $propertiesPath -Raw
            $properties = $properties -replace '(?m)^version=.*?(\r?)$', "version=$Version`$1"
            $properties = $properties -replace '(?m)^bundleTimestampMillis=.*?(\r?)$', "bundleTimestampMillis=$($now.ToUnixTimeMilliseconds())`$1"
            Write-Text $propertiesPath $properties
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

            $indexPath = Join-Path $root 'patches-bundle.json'
            $index = Get-Content -LiteralPath $indexPath -Raw | ConvertFrom-Json
            $index.version = $Version
            $index.download_url = "https://github.com/$Repository/releases/download/$tag/$bundleName"
            $index.created_at = $now.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ss')
            Write-Text $indexPath (($index | ConvertTo-Json -Depth 5) + "`n")
        } elseif ($heading.StartsWith("$Version (")) {
            # Already cut: rebuild and pin the checksum again after a fix, keeping the timestamp.
            Assert-Facts
            Write-Step 'already cut, pinning the checksum again'
        } else {
            throw "The first CHANGELOG heading is '$heading', neither Unreleased nor $Version."
        }

        Write-Step 'bundle and catalog (one Gradle run)'
        try {
            Invoke-Gradle @(':patches:buildAndroid', ':patches:generatePatchCatalog', '--no-configuration-cache')
        } catch {
            # Put the cut back, so prepare starts again from a clean tree after the fix.
            if ($heading -eq 'Unreleased') { & git -C $root checkout -- gradle.properties CHANGELOG.md README.md patches-bundle.json }
            throw
        }
        $digest = Get-FileSha256 (Join-Path $root "patches/build/libs/$bundleName")
        $readme = Get-Content -LiteralPath $readmePath -Raw
        $line = [regex]"(?m)^[a-f0-9]{64}  $([regex]::Escape($bundleName))(\r?)$"
        if (-not $line.IsMatch($readme)) { throw "README.md has no checksum line for $bundleName to update." }
        Write-Text $readmePath $line.Replace($readme, "$digest  $bundleName`$1", 1)
        Save-Stage 'prepare' @{ base = (Get-Head); sha256 = $digest }
        Write-Step "bundle SHA-256 $digest"
        Write-Host 'Next: update the README intro and counts and the index description by hand, review the diff,'
        Write-Host "commit it as 'chore: release $tag', then run -Stage preflight."
    }

    'preflight' {
        Assert-Stage 'prepare' | Out-Null
        Assert-Clean
        Assert-Facts
        Write-Step 'script tests'
        Push-Location -LiteralPath $root
        try { Invoke-Python -m unittest discover -s scripts/tests } finally { Pop-Location }
        Write-Step 'patch and extension unit tests, without the fixture replays'
        $fixtures = $env:HUSH_NATIVE_FIXTURES
        # Unset rather than empty: the replay tests skip only when the variable is missing.
        Remove-Item Env:HUSH_NATIVE_FIXTURES -ErrorAction SilentlyContinue
        try {
            Invoke-Gradle @(':patches:test', ':extensions:messenger:testDebugUnitTest', '--no-configuration-cache')
        } finally {
            if ($fixtures) { $env:HUSH_NATIVE_FIXTURES = $fixtures }
        }
        Save-Stage 'preflight' @{ commit = (Get-Head) }
        Write-Step 'passed. Next: -Stage build.'
    }

    'build' {
        Assert-Stage 'preflight' -SameCommit | Out-Null
        Assert-Clean
        Assert-Facts
        if (-not $env:HUSH_NATIVE_FIXTURES -or -not (Test-Path -LiteralPath $env:HUSH_NATIVE_FIXTURES -PathType Container)) {
            throw 'Set HUSH_NATIVE_FIXTURES to the folder of exact stock APKs.'
        }
        if (-not $DesktopJar -or -not (Test-Path -LiteralPath $DesktopJar)) { throw 'Pass -DesktopJar, or set HUSHMESSENGER_DESKTOP_JAR, to Morphe Desktop 1.18.1 or newer.' }
        if (-not $CompatClasspath) { throw 'Pass -CompatClasspath, or set HUSHMESSENGER_COMPAT_CLASSPATH, to the dexlib2, Guava and failureaccess JARs.' }
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
            $apk = Get-StockApk $code
            $stock = Get-FileSha256 $apk
            $recorded = Join-Path $root "scripts/profiles/$code.txt"
            # CompatReport writes LF; a checkout can hold the record with CRLF.
            $profileText = (Get-Content -LiteralPath $recorded -Raw) -replace "`r`n", "`n"
            $profileHash = [Convert]::ToHexString([Security.Cryptography.SHA256]::HashData([Text.Encoding]::UTF8.GetBytes($profileText))).ToLowerInvariant()
            if (Test-Path -LiteralPath $receipt) {
                $kept = Get-Content -LiteralPath $receipt -Raw | ConvertFrom-Json
                if ($kept.bundle_sha256 -eq $digest -and $kept.stock_sha256 -eq $stock -and $kept.profile_sha256 -eq $profileHash) {
                    Write-Step "$code already patched with this bundle"
                    continue
                }
            }
            $scratch = Join-Path $work "profiles-$code"
            Remove-Item -LiteralPath $scratch -Recurse -Force -ErrorAction SilentlyContinue
            New-Item -ItemType Directory -Path $scratch | Out-Null
            Write-Step "patching family $code with Desktop"
            Push-Location -LiteralPath $root
            try {
                Invoke-Queued "hushmessenger release patch $code" {
                    & $Java -Xmx1024m -XX:ActiveProcessorCount=2 -cp $CompatClasspath scripts/CompatReport.java $apk --save $scratch $DesktopJar $bundle
                }
            } finally { Pop-Location }
            $fresh = Join-Path $scratch "$code.txt"
            if (-not (Test-Path -LiteralPath $fresh)) { throw "CompatReport wrote no profile for $code." }
            if (((Get-Content -LiteralPath $fresh -Raw) -replace "`r`n", "`n") -ne $profileText) {
                throw "The $code profile from this bundle differs from scripts/profiles/$code.txt. Compare $fresh."
            }
            Remove-Item -LiteralPath $scratch -Recurse -Force
            [ordered]@{ code = $code; bundle_sha256 = $digest; stock_sha256 = $stock; profile_sha256 = $profileHash; commit = $commit; profile = 'identical' } |
                ConvertTo-Json | Set-Content -LiteralPath $receipt -Encoding utf8
        }
        Save-Stage 'build' @{ commit = $commit; sha256 = $digest }
        Write-Step "passed. Assets are in $assets. Next: -Stage publish."
    }

    'publish' {
        $build = Assert-Stage 'build' -SameCommit
        Assert-Clean
        $files = @($bundleName, 'SHA256SUMS.txt', 'SHA256SUMS.txt.sig') | ForEach-Object { Join-Path $assets $_ }
        foreach ($file in $files) { if (-not (Test-Path -LiteralPath $file)) { throw "Missing release asset $file." } }
        if ((Get-FileSha256 $files[0]) -ne $build.sha256) { throw 'The bundle in the assets folder changed after the build stage.' }
        $notes = Join-Path $work 'notes.md'
        Write-Text $notes ((Get-ChangelogSection) + "`n")

        $existing = & git -C $root tag -l $tag
        if (-not $existing) {
            Write-Step "tag $tag"
            Invoke-Git tag -a $tag -m $tag
        } elseif ((& git -C $root rev-list -n 1 $tag).Trim() -ne $build.commit) {
            throw "$tag already points at another commit."
        }
        Invoke-Git push origin "refs/tags/$tag"

        & gh release view $tag --repo $Repository *> $null
        if ($LASTEXITCODE) {
            Write-Step 'GitHub release'
            Invoke-Checked 'gh release create' { & gh release create $tag @files --repo $Repository --title $tag --notes-file $notes --verify-tag }
        } else {
            Write-Step "release $tag already exists, checking its assets"
        }
        $download = Join-Path $work 'downloaded'
        Remove-Item -LiteralPath $download -Recurse -Force -ErrorAction SilentlyContinue
        Invoke-Checked 'gh release download' { & gh release download $tag --repo $Repository --dir $download }
        foreach ($file in $files) {
            $name = Split-Path -Leaf $file
            $back = Join-Path $download $name
            if (-not (Test-Path -LiteralPath $back) -or (Get-FileSha256 $back) -ne (Get-FileSha256 $file)) {
                throw "The released $name differs from the built one."
            }
        }
        Remove-Item -LiteralPath $download -Recurse -Force
        Save-Stage 'publish' @{ commit = $build.commit; sha256 = $build.sha256 }
        Write-Step 'published. Next: -Stage index.'
    }

    'index' {
        $published = Assert-Stage 'publish' -SameCommit
        Write-Step 'pushing main with the new source index'
        Invoke-Git push origin HEAD:main
        $raw = "https://raw.githubusercontent.com/$Repository/main/patches-bundle.json?release=$Version-$([DateTimeOffset]::UtcNow.ToUnixTimeSeconds())"
        $served = $null
        foreach ($attempt in 1..10) {
            $served = Invoke-RestMethod -Uri $raw -Headers @{ 'Cache-Control' = 'no-cache' }
            if ($served.version -eq $Version) { break }
            Start-Sleep -Seconds 15
        }
        if ($served.version -ne $Version) { throw "GitHub still serves source index $($served.version)." }
        $check = Join-Path $work 'index-download.mpp'
        Invoke-WebRequest -Uri $served.download_url -OutFile $check
        if ((Get-FileSha256 $check) -ne $published.sha256) { throw "The index download URL doesn't return the released bundle." }
        Remove-Item -LiteralPath $check
        Save-Stage 'index' @{ commit = $published.commit }
        Write-Step "done. Manager now offers $Version."
    }
}
Restore-Environment
