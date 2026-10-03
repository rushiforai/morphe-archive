<#
.SYNOPSIS
    List the files HushThreads ported from Hushfacebook that Hushfacebook has changed since the
    commit their provenance.json rule records.

.DESCRIPTION
    Most of the shared extension library, the settings screen and the trust patch came from
    Hushfacebook, each at the commit its ported rule records. A fix that lands there later doesn't reach HushThreads unless
    someone notices, and this is the noticing.

    Every tracked file under a ported rule that names the upstream is mapped to its path in the
    upstream tree: Threads' package and patch directories become Facebook's, and a file named for
    HushThreads or Threads takes Hushfacebook's or Facebook's name. A rule naming a single file wins
    over the directory rule around it, as in ProvenanceTest. Every mapped path has to exist
    upstream at the recorded commit, so a wrong mapping stops the check instead of reading as no
    change. A file written here that sits in a ported directory needs its own original rule, which
    takes it out of this check.

    The upstream comes from -UpstreamRepo, a local checkout read at -Ref, or, without one, from a
    temporary blob-less clone of the rule's upstream URL read at its default branch. Only trees are
    read, so no upstream file content is downloaded or copied. Porting a listed change is still a
    reviewed change with its own provenance.

    Exits 0 when nothing changed and 1 when an upstream file changed or was deleted. A provenance
    file, upstream or mapping that can't be read exits 2, so it never reads as either answer.

.EXAMPLE
    pwsh -File scripts/upstream-drift.ps1
.EXAMPLE
    pwsh -File scripts/upstream-drift.ps1 -UpstreamRepo ../Hushfacebook -Ref origin/main
#>
[CmdletBinding()]
param(
    [string]$Root,
    [string]$Provenance,
    [string]$Upstream = 'https://github.com/SysAdminDoc/Hushfacebook',
    [string]$UpstreamRepo,
    [string]$Ref
)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
if (-not $Provenance) { $Provenance = Join-Path $Root 'provenance.json' }
# Run from a hook, GIT_DIR alone would point both repositories' git calls at the pushing tree.
# Removed through Env:, since [Environment]::SetEnvironmentVariable($name, $null) still hands git
# an empty GIT_DIR in pwsh.
foreach ($name in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' } | ForEach-Object Name)) {
    Remove-Item -LiteralPath "Env:$name"
}

function Invoke-Git {
    param([string]$Repository, [string[]]$Arguments)
    $output = & git -C $Repository @Arguments 2>&1
    if ($LASTEXITCODE -ne 0) { throw "git $($Arguments -join ' ') failed in ${Repository}: $($output -join ' ')" }
    return @($output | ForEach-Object { "$_" })
}

function ConvertTo-UpstreamPath {
    # The renames Hushfacebook's files took on the way here, undone.
    param([string]$Path)
    $mapped = $Path.Replace('extensions/threads/src/main/java/app/morphe/extension/hushthreads/',
        'extensions/facebook/src/main/java/app/morphe/extension/facebook/')
    $mapped = $mapped.Replace('patches/src/main/kotlin/app/morphe/patches/threads/',
        'patches/src/main/kotlin/app/morphe/patches/facebook/')
    $slash = $mapped.LastIndexOf('/')
    $name = $mapped.Substring($slash + 1).Replace('HushThreads', 'Hushfacebook').Replace('Threads', 'Facebook')
    return $mapped.Substring(0, $slash + 1) + $name
}

function Test-RulePath {
    param([string]$Pattern, [string]$File)
    if ($Pattern.EndsWith('/**')) { return $File.StartsWith($Pattern.Substring(0, $Pattern.Length - 2)) }
    if ($Pattern.Contains('*')) { throw "provenance.json uses a pattern this check doesn't read: $Pattern" }
    return $File -eq $Pattern
}

$clone = $null
try {
    $rules = @((Get-Content -LiteralPath $Provenance -Raw | ConvertFrom-Json).rules)
    $ported = @($rules | Where-Object { $_.origin -eq 'ported' -and $_.upstream -eq $Upstream })
    if ($ported.Count -eq 0) { throw "provenance.json has no ported rule from $Upstream." }
    foreach ($rule in $ported) {
        if ("$($rule.commit)" -notmatch '^[0-9a-f]{40}$') {
            throw "A rule from $Upstream doesn't record a full commit: $($rule.paths -join ', ')"
        }
    }

    # Which rule each tracked file falls under: a single-file rule first, then a directory rule.
    # Each file is compared from the commit its own rule records.
    $files = New-Object System.Collections.Generic.List[object]
    foreach ($file in @(Invoke-Git $Root @('ls-files', '--', 'patches', 'extensions'))) {
        $literal = @($rules | Where-Object { $_.paths -contains $file })
        $owner = if ($literal.Count -gt 0) { $literal } else {
            @($rules | Where-Object { $rule = $_; @($rule.paths | Where-Object { Test-RulePath $_ $file }).Count -gt 0 })
        }
        if ($owner.Count -gt 0 -and $ported -contains $owner[0]) { $files.Add([pscustomobject]@{ File = $file; Commit = $owner[0].commit }) }
    }
    if ($files.Count -eq 0) { throw "No tracked file falls under a rule from $Upstream." }

    if ($UpstreamRepo) {
        if (-not $Ref) { $Ref = 'origin/main' }
        $repository = $UpstreamRepo
    } else {
        $clone = Join-Path ([System.IO.Path]::GetTempPath()) ('hushthreads-upstream-' + [guid]::NewGuid().ToString('N'))
        Invoke-Git ([System.IO.Path]::GetTempPath()) @('clone', '--quiet', '--bare', '--filter=blob:none', "$Upstream.git", $clone) | Out-Null
        if (-not $Ref) { $Ref = 'HEAD' }
        $repository = $clone
    }
    $head = @(Invoke-Git $repository @('rev-parse', '--verify', "$Ref^{commit}"))[0]

    $checked = 0
    $drift = New-Object System.Collections.Generic.List[object]
    $groups = @($files | Group-Object Commit | Sort-Object Name)
    foreach ($group in $groups) {
        $commit = $group.Name
        Invoke-Git $repository @('merge-base', '--is-ancestor', $commit, $head) | Out-Null
        $atCommit = [System.Collections.Generic.HashSet[string]]::new([string[]]@(Invoke-Git $repository @('ls-tree', '-r', '--name-only', $commit)))

        # A miss is a wrong mapping or a file written here without its own original rule. Either
        # way the file would never be compared, so the check can't answer.
        $mapped = [ordered]@{}
        $missing = New-Object System.Collections.Generic.List[string]
        foreach ($entry in $group.Group) {
            $upstreamPath = ConvertTo-UpstreamPath $entry.File
            if ($atCommit.Contains($upstreamPath)) { $mapped[$upstreamPath] = $entry.File } else { $missing.Add("$($entry.File) (looked for $upstreamPath)") }
        }
        if ($missing.Count -gt 0) {
            throw "These files fall under a rule ported from $Upstream, but nothing is at their upstream path at ${commit}: " +
                ($missing -join '; ') + '. Fix the mapping, or give a file written here its own original rule.'
        }
        $checked += $mapped.Count

        $changes = @(Invoke-Git $repository (@('diff', '--no-renames', '--name-status', $commit, $head, '--') +
            @($mapped.Keys | ForEach-Object { ":(literal)$_" })))
        foreach ($line in $changes) {
            $status, $path = $line -split "`t", 2
            $drift.Add([pscustomobject]@{ Status = $(if ($status -eq 'D') { 'deleted' } else { 'changed' }); Upstream = $path; Local = $mapped[$path]; Since = $commit })
        }
    }

    Write-Host ("Checked {0} ported files against {1} from {2} up to {3}." -f $checked, $Upstream,
        (($groups | ForEach-Object { $_.Name.Substring(0, 8) }) -join ', '), $head.Substring(0, 8))
    foreach ($item in $drift) { Write-Host ("  {0} upstream since {1}: {2} (here: {3})" -f $item.Status, $item.Since.Substring(0, 8), $item.Upstream, $item.Local) }
    if ($drift.Count -gt 0) {
        Write-Host "$($drift.Count) ported file(s) changed upstream since the recorded commit."
        exit 1
    }
    Write-Host 'No ported file changed upstream since the recorded commit.'
    exit 0
} catch {
    [Console]::Error.WriteLine("upstream-drift: $($_.Exception.Message)")
    exit 2
} finally {
    if ($clone) { Remove-Item -LiteralPath $clone -Recurse -Force -ErrorAction SilentlyContinue }
}
