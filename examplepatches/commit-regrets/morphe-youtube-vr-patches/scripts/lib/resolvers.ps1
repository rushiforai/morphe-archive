# Shared tool resolvers for the scripts that drive the Morphe CLI, adb and the JDK
# (patch-and-install.ps1, patch-probe.ps1, device-log.ps1). Dot-source this file from a
# script; the functions then run in that script's scope, so they read the CALLER's
# `$script:` variables and the CALLER's Fail().
#
# Callers must set these script-scope variables before the first call (a param with an empty
# default is enough -- under Set-StrictMode an unset variable is an error, and these are read
# unconditionally):
#   $script:Java / $script:MorpheCli / $script:OurBundle / $script:Adb
#
# One precedence ladder, defined once: this is where the stale-host trap lives. The bundle
# needs a patcher 2.x Desktop; the unversioned morphe-desktop-all.jar can be a pre-2.x host
# that fails with a misleading NoSuchMethodError (Resolve-MorpheCli's comment), and hardcoding
# any single path (measured in the 1.91.10 re-derivation: a probe script that picked the stale
# jar and died on options-create) is how a tool bypasses that guard.

# The repo root, from this file's own location (scripts/lib): $PSScriptRoot inside a dot-sourced
# function is the file where the function is DEFINED, not where the caller lives.
$script:ResolverRepoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

function Resolve-Java {
    if ($script:Java) { return $script:Java }
    if ($env:JAVA_HOME) {
        $candidate = Join-Path $env:JAVA_HOME 'bin/java.exe'
        if (Test-Path $candidate) { return $candidate }
    }
    $cmd = Get-Command java -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    Fail 'no java found: set -Java, or JAVA_HOME, or put java on PATH'
}

function Resolve-MorpheCli {
    if ($script:MorpheCli) { return $script:MorpheCli }
    if ($env:MORPHE_CLI) { return $env:MORPHE_CLI }
    # Desktop releases ship versioned jar names (morphe-desktop-<v>-all.jar); prefer the
    # highest version found, then the unversioned name, which may be a pre-2.x host.
    $dirs = @(
        (Join-Path $script:ResolverRepoRoot 'apk'),
        (Join-Path $script:ResolverRepoRoot 'tools\morphe'),
        (Join-Path $HOME 'tools\morphe')
    )
    $versioned = @()
    foreach ($dir in $dirs) {
        $full = [System.IO.Path]::GetFullPath($dir)
        if (Test-Path $full) {
            $versioned += @(Get-ChildItem $full -Filter 'morphe-desktop-*-all.jar' -ErrorAction SilentlyContinue)
        }
    }
    $best = $versioned |
        ForEach-Object { if ($_.Name -match 'morphe-desktop-(\d+(\.\d+)*)-all\.jar') {
            [pscustomobject]@{ Jar = $_.FullName; Ver = [version]$Matches[1] }
        } } |
        Sort-Object Ver -Descending |
        Select-Object -First 1
    if ($best) { return $best.Jar }
    foreach ($dir in $dirs) {
        $legacy = Join-Path ([System.IO.Path]::GetFullPath($dir)) 'morphe-desktop-all.jar'
        if (Test-Path $legacy) { return $legacy }
    }
    Fail 'morphe-desktop-all.jar not found: set -MorpheCli or MORPHE_CLI'
}

function Resolve-OurBundle {
    if ($script:OurBundle) {
        if (-not (Test-Path $script:OurBundle)) { Fail "our bundle not found: $script:OurBundle" }
        return (Resolve-Path $script:OurBundle).Path
    }
    $libs = Join-Path $script:ResolverRepoRoot 'patches\build\libs'
    # Exclude the -sources and -javadoc variants: Gradle writes all three with the same
    # timestamp, so ordering by time alone can hand the patcher a sources jar instead of the
    # bundle (the release workflow's asset glob excludes them for the same reason).
    $newest = Get-ChildItem $libs -Filter 'patches-*.mpp' -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -notmatch '-(sources|javadoc)\.mpp$' } |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if (-not $newest) {
        Fail "no bundle in $libs -- run ./gradlew buildAndroid first, or pass -OurBundle"
    }
    return $newest.FullName
}

function Resolve-Adb {
    if ($script:Adb) {
        if (-not (Test-Path $script:Adb) -and -not (Get-Command $script:Adb -ErrorAction SilentlyContinue)) {
            Fail "adb not found: $script:Adb"
        }
        return $script:Adb
    }
    $cmd = Get-Command adb -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    $candidates = @(
        'C:\adb\platform-tools\adb.exe',
        (Join-Path $HOME 'AppData\Local\Android\Sdk\platform-tools\adb.exe'),
        (Join-Path $env:LOCALAPPDATA 'Android\Sdk\platform-tools\adb.exe')
    )
    foreach ($candidate in $candidates) {
        if ($candidate -and (Test-Path $candidate)) { return $candidate }
    }
    Fail 'adb not found: put it on PATH or pass -Adb <path>'
}
