<#
.SYNOPSIS
    Whether the device audit still backs a release of the declared TikTok versions.

.DESCRIPTION
    Dot-sourced by build-release-receipt.ps1, which writes what it finds into the receipt, and by
    release/release.ps1, whose publish stage refuses a release the audit doesn't back.

    audit/results/tiktok-<version>.json is what audit/run-audit.ps1 left for a declared version.
    Its stored qualification was worked out against the run's evidence folder, which stays on the
    machine that ran it, so that half is taken as recorded. What can still go stale after the run
    is the catalog: a check whose steps, settings or patch classification changed has a result for
    a definition that no longer exists. Every catalog check's definition hash is worked out again
    and held to its result's, and a check added or dropped since the run counts as well.

    Verdicts don't refuse. A fail, review or inconclusive result is carried into the receipt's
    counts, and ROADMAP.md holds the work behind it.
#>

. (Join-Path (Split-Path -Parent $PSScriptRoot) 'audit/evidence.ps1')

function Test-AuditResults {
    <#
    .SYNOPSIS
        Answers @{ Valid; Reason; Facts }, with one ordered dictionary of facts per declared
        version for the receipt.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Root,
        [Parameter(Mandatory = $true)][string]$PackageName,
        [Parameter(Mandatory = $true)][string[]]$PackageVersions,
        # The commit being released. With it, the audited build's source commit has to be in its
        # history, and the facts say how many commits came after the audited one.
        [string]$Head,
        # The repository -Head is read from, when it isn't -Root (the contract tests' fixtures).
        [string]$GitRoot
    )
    function Fail([string]$Reason) { return [pscustomobject]@{ Valid = $false; Reason = $Reason; Facts = @() } }
    if (-not $GitRoot) { $GitRoot = $Root }

    $entries = @(Get-Content -LiteralPath (Join-Path $Root 'audit/catalog.json') -Raw -Encoding UTF8 | ConvertFrom-Json)
    $facts = [Collections.Generic.List[object]]::new()
    foreach ($version in $PackageVersions) {
        $relative = "audit/results/tiktok-$version.json"
        $path = Join-Path $Root $relative
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
            return Fail "there's no $relative, so TikTok $version was never audited on a device"
        }
        try { $run = Get-Content -LiteralPath $path -Raw -Encoding UTF8 | ConvertFrom-Json }
        catch { return Fail "$relative doesn't read as JSON: $($_.Exception.Message)" }
        if ([string]$run.app.package -cne $PackageName -or [string]$run.app.version -cne $version) {
            return Fail "$relative is a run on $($run.app.package) $($run.app.version), not $PackageName $version"
        }
        if ([string]$run.qualification.state -cne 'current-bound') {
            $state = if ($run.qualification.state) { [string]$run.qualification.state } else { 'no qualification' }
            return Fail "$relative is $state, not current-bound to its evidence"
        }

        $results = [Collections.Generic.Dictionary[string,object]]::new([StringComparer]::Ordinal)
        foreach ($patch in @($run.patches)) {
            foreach ($result in @($patch.checks)) { $results["$($patch.name)/$($result.id)"] = $result }
        }
        $keys = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
        $changed = [Collections.Generic.List[string]]::new()
        $missing = [Collections.Generic.List[string]]::new()
        foreach ($entry in $entries) {
            foreach ($check in @($entry.checks)) {
                $key = "$($entry.name)/$($check.id)"
                [void]$keys.Add($key)
                if (-not $results.ContainsKey($key)) { $missing.Add($key) }
                elseif ([string]$results[$key].definitionHash -cne (Get-AuditDefinitionHash $entry $check)) { $changed.Add($key) }
            }
        }
        $removed = @($results.Keys | Where-Object { -not $keys.Contains($_) } | Sort-Object)
        if ($changed.Count + $missing.Count + $removed.Count -gt 0) {
            $parts = @()
            if ($changed.Count) { $parts += "changed since the run: $($changed -join ', ')" }
            if ($missing.Count) { $parts += "never run: $($missing -join ', ')" }
            if ($removed.Count) { $parts += "no longer in the catalog: $($removed -join ', ')" }
            return Fail ("$relative no longer matches audit/catalog.json ($($parts -join '; ')). " +
                'Rerun those checks with audit/run-audit.ps1 -Only on the audited APK so they merge into the results.')
        }

        $source = [string]$run.build.source.commit
        $since = $null
        if ($Head) {
            if ($source -notmatch '^[0-9a-f]{40}$') { return Fail "$relative doesn't name the commit its build came from" }
            & git -C $GitRoot merge-base --is-ancestor $source $Head 2>$null
            if ($LASTEXITCODE -ne 0) { return Fail "$relative audited a build of $source, which isn't in the history of $Head" }
            $since = [int](& git -C $GitRoot rev-list --count "$source..$Head")
        }
        $facts.Add([ordered]@{
            results      = $relative
            sha256       = (Get-FileHash -Algorithm SHA256 -LiteralPath $path).Hash.ToLowerInvariant()
            appVersion   = $version
            apkSha256    = [string]$run.apk.sha256
            sourceCommit = $source
            commitsSince = $since
            # PowerShell 7 reads the ISO time as a DateTime and would print it in the local format.
            finished     = if ($run.finishedUtc -is [datetime]) { $run.finishedUtc.ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ') } else { [string]$run.finishedUtc }
            checks       = $keys.Count
            summary      = [ordered]@{
                pass = [int]$run.summary.pass; fail = [int]$run.summary.fail; review = [int]$run.summary.review
                inconclusive = [int]$run.summary.inconclusive; error = [int]$run.summary.error; skipped = [int]$run.summary.skipped
            }
        })
    }
    return [pscustomobject]@{ Valid = $true; Reason = $null; Facts = $facts.ToArray() }
}
