<#
.SYNOPSIS
Removes generated build residue for this repository, keeping decoded inputs,
stock APKs and evidence.

.DESCRIPTION
Deletes only:
  * generated *.apk files under the external build root;
  * rebuildable scratch directories (isolated checkouts, compiled classes,
    scratch, node_modules);
  * repository-local build residue (build/, patches/build/, .gradle/,
    .kotlin/, nested builds/, the lowercase-drive d/ tree, __pycache__).

Never deletes:
  * decoded APK trees and decoded fixture sources;
  * canonical stock APKs (decoded-fixture-apks and the exact 4XVR original);
  * tooling, verification reports, live-hitch captures, validation inputs;
  * markdown, JSON, text, log, PowerShell, Python or Java evidence.

Preview is the default. Deletion requires -Apply.

.PARAMETER Apply
Delete the planned targets. Without this switch the script only reports.

.PARAMETER Repository
Repository root. Defaults to the parent of tools/.

.PARAMETER BuildRoot
External build root. Defaults to ../builds/steamlink-patches.

.PARAMETER SkipProcessCheck
Skip the active-compiler guard. Tests use this; normal runs should not.

.EXAMPLE
.\tools\Clean-BuildResidue.ps1
Preview the cleanup.

.EXAMPLE
.\tools\Clean-BuildResidue.ps1 -Apply
Delete the previewed targets and write a receipt.
#>
[CmdletBinding()]
param(
    [switch]$Apply,
    [string]$Repository,
    [string]$BuildRoot,
    [switch]$SkipProcessCheck
)
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2

$cmp = [StringComparison]::OrdinalIgnoreCase
$repo = if ($Repository) {
    [IO.Path]::GetFullPath($Repository)
} else {
    [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
}
$repo = $repo.TrimEnd('\', '/')
$buildRoot = if ($BuildRoot) {
    [IO.Path]::GetFullPath($BuildRoot)
} else {
    [IO.Path]::GetFullPath((Join-Path (Split-Path -Parent $repo) 'builds/steamlink-patches'))
}
$buildRoot = $buildRoot.TrimEnd('\', '/')
$buildDir = Join-Path $buildRoot 'build'
$utcNow = [DateTime]::UtcNow
$receiptDir = Join-Path $buildRoot '_cleanup'
$canonicalFourXvr = [IO.Path]::GetFullPath((Join-Path $buildDir '4xvr-2.0.22/cn.vr4p.oculus4xvrplayerov_2.0.22_original.apk'))

# ------------------------------------------------------------------ guards --

function Test-Within([string]$Path, [string]$Parent) {
    $p = [IO.Path]::GetFullPath($Path).TrimEnd('\', '/')
    $q = [IO.Path]::GetFullPath($Parent).TrimEnd('\', '/')
    return ($p.Equals($q, $cmp) -or $p.StartsWith($q + '\', $cmp))
}

function Assert-Owned([string]$Path, [string]$Parent, [string]$Label) {
    if (!(Test-Within $Path $Parent)) {
        throw "Refusing $Label outside its owned root: $Path"
    }
    $full = [IO.Path]::GetFullPath($Path).TrimEnd('\', '/')
    $root = [IO.Path]::GetFullPath($Parent).TrimEnd('\', '/')
    if ($full.Equals($root, $cmp)) {
        throw "Refusing to delete the owned root itself: $Path"
    }
}

function Assert-NoReparse([string]$Path, [string]$Boundary) {
    $current = [IO.Path]::GetFullPath($Path)
    $stop = [IO.Path]::GetFullPath($Boundary).TrimEnd('\', '/')
    while ($current) {
        if (Test-Path -LiteralPath $current) {
            $item = Get-Item -LiteralPath $current -Force
            if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
                throw "Refusing a reparse point in the cleanup path: $current"
            }
        }
        if ($current.TrimEnd('\', '/').Equals($stop, $cmp)) { break }
        $next = Split-Path $current -Parent
        if (!$next -or $next -eq $current) { break }
        $current = $next
    }
}

function Get-SafeTree([string]$Root) {
    $items = New-Object 'System.Collections.Generic.List[object]'
    if (!(Test-Path -LiteralPath $Root -PathType Container)) { return $items }
    $pending = New-Object 'System.Collections.Generic.Stack[string]'
    $pending.Push($Root)
    while ($pending.Count) {
        $dir = $pending.Pop()
        try {
            $entries = @([IO.Directory]::EnumerateFileSystemEntries($dir))
        } catch [System.IO.DirectoryNotFoundException] {
            continue
        }
        foreach ($entry in $entries) {
            try {
                $item = Get-Item -LiteralPath $entry -Force -ErrorAction Stop
            } catch [System.Management.Automation.ItemNotFoundException] {
                continue
            } catch [System.IO.FileNotFoundException] {
                continue
            } catch [System.IO.DirectoryNotFoundException] {
                continue
            }
            if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
                throw "Refusing a reparse point in the build tree: $entry"
            }
            $items.Add($item)
            if ($item.PSIsContainer) { $pending.Push($item.FullName) }
        }
    }
    return $items
}

function Get-TreeStat([string]$Path) {
    if (!(Test-Path -LiteralPath $Path)) {
        return [pscustomobject]@{ Bytes = [long]0; Files = 0 }
    }
    if (Test-Path -LiteralPath $Path -PathType Leaf) {
        $fi = [IO.FileInfo]::new($Path)
        return [pscustomobject]@{ Bytes = [long]$fi.Length; Files = 1 }
    }
    $bytes = [long]0
    $files = 0
    try {
        foreach ($file in [IO.Directory]::EnumerateFiles($Path, '*', [IO.SearchOption]::AllDirectories)) {
            $fi = [IO.FileInfo]::new($file)
            $bytes += $fi.Length
            $files++
        }
    } catch [System.IO.DirectoryNotFoundException] {
        # A concurrent process removed part of the tree; report what was counted.
    }
    return [pscustomobject]@{ Bytes = $bytes; Files = $files }
}

function Assert-NoReparseDescendants([string]$Path) {
    if (!(Test-Path -LiteralPath $Path -PathType Container)) { return }
    $pending = New-Object 'System.Collections.Generic.Stack[string]'
    $pending.Push($Path)
    while ($pending.Count) {
        $dir = $pending.Pop()
        foreach ($entry in [IO.Directory]::EnumerateFileSystemEntries($dir)) {
            $item = Get-Item -LiteralPath $entry -Force
            if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
                throw "Refusing a reparse point in a repository target: $entry"
            }
            if ($item.PSIsContainer) { $pending.Push($item.FullName) }
        }
    }
}

function Format-Bytes([long]$Bytes) {
    if ($Bytes -ge 1GB) { return ('{0:N2} GB' -f ($Bytes / 1GB)) }
    if ($Bytes -ge 1MB) { return ('{0:N2} MB' -f ($Bytes / 1MB)) }
    if ($Bytes -ge 1KB) { return ('{0:N1} KB' -f ($Bytes / 1KB)) }
    return "$Bytes B"
}

function Test-ProtectedTree([string]$Relative) {
    $prefixes = @(
        'decoded-fixture-apks\',
        'decoded-fixture-sources\',
        'tooling\',
        'verification\',
        'live-hitch-20260915\',
        'live-hitch-20261011-a\',
        'analysis\',
        'reports\',
        'startup-boundary-tools\',
        'audit-5002363\',
        '4xvr-2.0.22\'
    )
    foreach ($prefix in $prefixes) {
        if ($Relative.StartsWith($prefix, $cmp)) { return $true }
    }
    return $false
}

function Test-KeepApk([string]$FullPath, [string]$Relative) {
    if ($Relative.StartsWith('decoded-fixture-apks\', $cmp)) { return $true }
    if ($FullPath.Equals($canonicalFourXvr, $cmp)) { return $true }
    if ($Relative -match '(^|\\)app_original-apks(\\|$)') { return $true }
    if ($Relative -match '(^|\\)pristine-input\\decoded-apk-[^\\]+$') { return $true }
    return $false
}

# A caller-supplied root must still be this repository, not the workspace parent.
if (!(Test-Path -LiteralPath (Join-Path $repo 'AGENTS.md') -PathType Leaf) -or
    !(Test-Path -LiteralPath (Join-Path $repo 'patches/src/main') -PathType Container)) {
    throw "Repository does not look like this checkout (missing AGENTS.md or patches/src/main): $repo"
}
if (Test-Within $buildRoot $repo) {
    throw "BuildRoot must be outside the repository: $buildRoot"
}
if (Test-Within $repo $buildRoot) {
    throw "Repository must not be inside BuildRoot: $repo"
}

# --------------------------------------------------------------- inventory --

if (!$SkipProcessCheck) {
    # Idle Gradle/Kotlin daemons are normal after a build; refuse only an active
    # wrapper invocation or a native compiler that can still be writing output.
    try {
        $processes = @(Get-CimInstance Win32_Process -ErrorAction Stop)
    } catch {
        throw "Cannot verify that no build is active; refusing to clean: $($_.Exception.Message)"
    }
    $busy = @($processes | Where-Object {
        $name = $_.Name -replace '\.exe$', ''
        if ($name -match '^(gradle|cl|link|msbuild|rustc|cargo|cmake|ninja|clang|clang\+\+|gcc|g\+\+|d8|smali)$') { return $true }
        if ($_.CommandLine -and ($_.CommandLine -match 'gradlew(\.bat)?|GradleWrapperMain')) { return $true }
        return $false
    })
    if ($busy.Count) {
        throw ("Refusing to clean while a build is active: " + (($busy | Select-Object -First 5 -ExpandProperty Name) -join ', '))
    }
}

$plan = New-Object 'System.Collections.Generic.List[object]'
$kept = New-Object 'System.Collections.Generic.List[object]'
$entries = Get-SafeTree $buildDir

function Add-Target([string]$Path, [string]$Kind, [string]$Reason, [string]$OwnedRoot, [bool]$IsContainer) {
    $stat = Get-TreeStat $Path
    $plan.Add([pscustomobject]@{
        Path = [IO.Path]::GetFullPath($Path)
        Kind = $Kind
        Reason = $Reason
        OwnedRoot = $OwnedRoot
        IsContainer = $IsContainer
        Bytes = [long]$stat.Bytes
        Files = [int]$stat.Files
    })
}

function Add-Kept([string]$Path, [string]$Reason) {
    $stat = Get-TreeStat $Path
    $kept.Add([pscustomobject]@{
        Path = [IO.Path]::GetFullPath($Path)
        Reason = $Reason
        Bytes = [long]$stat.Bytes
        Files = [int]$stat.Files
    })
}

foreach ($item in $entries) {
    if ($item.PSIsContainer) { continue }
    if ($item.Extension -ne '.apk') { continue }
    $relative = $item.FullName.Substring($buildDir.Length + 1)
    if (Test-KeepApk $item.FullName $relative) {
        Add-Kept $item.FullName 'Stock or decoded APK input.'
        continue
    }
    Add-Target $item.FullName 'generated-apk' 'Generated APK; not used by Morphe Manager.' $buildRoot $false
}

$scratchNames = @('isolated-checkout', 'isolated-out', 'isolated-out-cwd', 'compiled', 'compiled2',
    'compiled3', 'compiled-final', 'classes', 'test-classes', 'node_modules', 'scratch')
foreach ($item in $entries) {
    if (!$item.PSIsContainer) { continue }
    $name = $item.Name
    $match = ($scratchNames -contains $name) -or ($name -like 'compiled-*') -or ($name -like 'scratch-*')
    if (!$match) { continue }
    $relative = $item.FullName.Substring($buildDir.Length + 1)
    if ($relative -match '(^|\\)(temporary|decoded[^\\]*)(\\|$)') { continue }
    if (Test-ProtectedTree $relative) { continue }
    Add-Target $item.FullName 'build-scratch' 'Rebuildable compiler, checkout or dependency scratch.' $buildRoot $true
}

# Repository-local residue. These paths are never source, only accidental output.
foreach ($relative in @('build', 'patches\build', '.gradle', '.kotlin', 'patches\bin')) {
    $path = Join-Path $repo $relative
    if (Test-Path -LiteralPath $path) {
        Add-Target $path 'repo-residue' 'Project-local generated output; the external build root is canonical.' $repo $true
    }
}
$nestedBuilds = Join-Path $repo 'builds'
if (Test-Path -LiteralPath $nestedBuilds) {
    Add-Target $nestedBuilds 'repo-residue' 'Nested build root created by a relocated checkout; the sibling root is canonical.' $repo $true
}
$driveTree = Join-Path $repo 'd'
if (Test-Path -LiteralPath $driveTree) {
    $bugShape = (Test-Path -LiteralPath (Join-Path $driveTree 'Angelo\Desktop')) -or
        @(Get-ChildItem -LiteralPath $driveTree -Recurse -Directory -Force -Filter '.gradle' -ErrorAction SilentlyContinue).Count -gt 0
    if ($bugShape) {
        Add-Target $driveTree 'repo-residue' 'Lowercase-drive path tree created by a native tool argument.' $repo $true
    } else {
        Add-Kept $driveTree 'Unexpected d/ directory; not the known lowercase-drive tree.'
    }
}
foreach ($relative in @('diagnostics', 'tools', '.github', 'patches', 'extensions')) {
    $root = Join-Path $repo $relative
    if (!(Test-Path -LiteralPath $root -PathType Container)) { continue }
    foreach ($dir in @(Get-ChildItem -LiteralPath $root -Recurse -Directory -Force -Filter '__pycache__' -ErrorAction SilentlyContinue)) {
        Add-Target $dir.FullName 'repo-residue' 'Python bytecode cache.' $repo $true
    }
}
$extensionsRoot = Join-Path $repo 'extensions'
if (Test-Path -LiteralPath $extensionsRoot -PathType Container) {
    foreach ($extension in @(Get-ChildItem -LiteralPath $extensionsRoot -Directory -Force -ErrorAction SilentlyContinue)) {
        foreach ($dir in @(Get-ChildItem -LiteralPath $extension.FullName -Directory -Force -ErrorAction SilentlyContinue | Where-Object { $_.Name -like 'build-*' })) {
            Add-Target $dir.FullName 'repo-residue' 'Project-local native build tree.' $repo $true
        }
    }
}

# Compact nested targets: delete the outer target only.
$compacted = New-Object 'System.Collections.Generic.List[object]'
foreach ($item in ($plan | Sort-Object { $_.Path.Length })) {
    $nested = $false
    foreach ($keptItem in $compacted) {
        if (Test-Within $item.Path $keptItem.Path) { $nested = $true; break }
    }
    if (!$nested) { $compacted.Add($item) }
}
$plan = $compacted

# Hash the protected inputs before touching anything.
$protectedBefore = New-Object 'System.Collections.Generic.List[object]'
foreach ($item in $kept) {
    if (!$item.Path.EndsWith('.apk', $cmp)) { continue }
    $hash = (Get-FileHash -LiteralPath $item.Path -Algorithm SHA256).Hash.ToLowerInvariant()
    $protectedBefore.Add([pscustomobject]@{ Path = $item.Path; Sha256 = $hash; Bytes = $item.Bytes })
}
foreach ($relative in @('tooling\bin\cmake.exe', 'tooling\bin\glslang.exe', 'tooling\bin\ninja.exe')) {
    $path = Join-Path $buildDir $relative
    if (Test-Path -LiteralPath $path -PathType Leaf) {
        $hash = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
        $protectedBefore.Add([pscustomobject]@{ Path = $path; Sha256 = $hash; Bytes = (Get-Item -LiteralPath $path).Length })
    }
}

# ------------------------------------------------------------------ report --

$totalBytes = [long]0
$totalFiles = 0
foreach ($item in $plan) {
    $totalBytes += $item.Bytes
    $totalFiles += $item.Files
}
Write-Output ''
Write-Output "Repository : $repo"
Write-Output "Build root : $buildRoot"
Write-Output ("Mode       : {0}" -f $(if ($Apply) { 'apply' } else { 'preview; nothing is deleted' }))
Write-Output ("Plan       : {0} targets, {1} files, {2}" -f $plan.Count, $totalFiles, (Format-Bytes $totalBytes))
Write-Output ''
if ($plan.Count) {
    Write-Output 'DELETE'
    foreach ($item in ($plan | Sort-Object Bytes -Descending)) {
        $rel = if (Test-Within $item.Path $buildRoot) {
            $item.Path.Substring($buildRoot.Length + 1)
        } else {
            $item.Path.Substring($repo.Length + 1)
        }
        Write-Output ("  [{0}] {1,10}  {2}" -f $item.Kind, (Format-Bytes $item.Bytes), $rel)
        Write-Output ("         {0}" -f $item.Reason)
    }
    Write-Output ''
}
if ($kept.Count) {
    Write-Output 'KEEP (protected)'
    foreach ($item in $kept) {
        $rel = if (Test-Within $item.Path $buildRoot) {
            $item.Path.Substring($buildRoot.Length + 1)
        } else {
            $item.Path.Substring($repo.Length + 1)
        }
        Write-Output ("  {0,10}  {1}  -- {2}" -f (Format-Bytes $item.Bytes), $rel, $item.Reason)
    }
    Write-Output ''
}

# ------------------------------------------------------------------- apply --

$removed = New-Object 'System.Collections.Generic.List[object]'
$errors = New-Object 'System.Collections.Generic.List[string]'
$removedBytes = [long]0
$removedFiles = 0
if ($Apply) {
    foreach ($item in $plan) {
        if (!(Test-Path -LiteralPath $item.Path)) { continue }
        try {
            Assert-Owned $item.Path $item.OwnedRoot $item.Kind
            Assert-NoReparse $item.Path $item.OwnedRoot
            if ($item.IsContainer) {
                if ($item.OwnedRoot -eq $repo) { Assert-NoReparseDescendants $item.Path }
                Remove-Item -LiteralPath $item.Path -Recurse -Force -ErrorAction Stop
            } else {
                [IO.File]::SetAttributes($item.Path, [IO.FileAttributes]::Normal)
                [IO.File]::Delete($item.Path)
            }
            $removed.Add([pscustomobject]@{ Path = $item.Path; Kind = $item.Kind; Bytes = $item.Bytes; Files = $item.Files })
            $removedBytes += $item.Bytes
            $removedFiles += $item.Files
        } catch {
            $errors.Add(("{0}: {1}" -f $item.Path, $_.Exception.Message))
        }
    }
}

$protectedAfter = New-Object 'System.Collections.Generic.List[object]'
foreach ($before in $protectedBefore) {
    if (!(Test-Path -LiteralPath $before.Path -PathType Leaf)) {
        $errors.Add("Protected file disappeared: $($before.Path)")
        continue
    }
    $hash = (Get-FileHash -LiteralPath $before.Path -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($hash -ne $before.Sha256) {
        $errors.Add("Protected file changed: $($before.Path)")
    }
    $protectedAfter.Add([pscustomobject]@{ Path = $before.Path; Sha256 = $hash; Bytes = $before.Bytes })
}

$null = New-Item -ItemType Directory -Force -Path $receiptDir
$receiptPath = Join-Path $receiptDir ('steamlink-residue-{0}.json' -f $utcNow.ToString('yyyyMMdd-HHmmss'))
$summary = [ordered]@{
    status = if ($errors.Count) { 'failed' } else { 'passed' }
    mode = if ($Apply) { 'apply' } else { 'preview' }
    utc = $utcNow.ToString('o')
    repository = $repo
    buildRoot = $buildRoot
    plannedTargets = $plan.Count
    plannedFiles = $totalFiles
    plannedBytes = $totalBytes
    removedTargets = $removed.Count
    removedFiles = $removedFiles
    reclaimedBytes = $removedBytes
    targets = @($plan | ForEach-Object {
        [ordered]@{ path = $_.Path; kind = $_.Kind; files = $_.Files; bytes = $_.Bytes; reason = $_.Reason }
    })
    kept = @($kept | ForEach-Object {
        [ordered]@{ path = $_.Path; files = $_.Files; bytes = $_.Bytes; reason = $_.Reason }
    })
    protected = @($protectedAfter | ForEach-Object {
        [ordered]@{ path = $_.Path; sha256 = $_.Sha256; bytes = $_.Bytes }
    })
    errors = @($errors)
}
$summary | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $receiptPath -Encoding utf8

Write-Output ''
if ($Apply) {
    Write-Output ("Removed    : {0} targets, {1} files, {2}" -f $removed.Count, $removedFiles, (Format-Bytes $removedBytes))
} else {
    Write-Output 'Preview only. Add -Apply to delete the listed targets.'
}
if ($errors.Count) {
    Write-Output 'ERRORS'
    foreach ($line in $errors) { Write-Output ("  {0}" -f $line) }
}
Write-Output "Receipt    : $receiptPath"

if ($errors.Count) {
    throw ("Cleanup completed with {0} error(s). See {1}" -f $errors.Count, $receiptPath)
}
