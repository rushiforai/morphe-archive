<# Offline contracts for audit-results.ps1: a release needs a device audit that still matches the catalog. #>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'audit-results.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')

function Assert-AuditContract([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}

$repo = Split-Path -Parent $PSScriptRoot
$head = (& git -C $repo rev-parse HEAD).Trim()
$parent = (& git -C $repo rev-parse 'HEAD~1').Trim()
$package = 'com.zhiliaoapp.musically'
$work = Join-Path ([IO.Path]::GetTempPath()) ('hushfeed-audit-contract-' + [guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory((Join-Path $work 'audit/results'))
$catalogPath = Join-Path $work 'audit/catalog.json'
$resultsPath = Join-Path $work 'audit/results/tiktok-47.5.3.json'
try {
    function New-Catalog {
        return @(
            [ordered]@{
                name = 'Alpha'; category = 'Feed'; kind = 'runtime'; settings = @(); notes = 'Alpha notes.'
                checks = @([ordered]@{ id = 'bound'; what = 'Alpha binds.'; steps = @([ordered]@{ probe = 'report'; expect = 'alpha' }); auto = $true })
            },
            [ordered]@{
                name = 'Beta'; category = 'Comments'; kind = 'runtime'
                settings = @([ordered]@{ key = 'beta'; default = $false; type = 'bool'; row = 'Beta' })
                checks = @(
                    [ordered]@{ id = 'bound'; what = 'Beta binds.'; steps = @([ordered]@{ probe = 'report'; expect = 'beta' }); auto = $true },
                    [ordered]@{ id = 'shot'; what = 'Review: Beta shows.'; steps = @([ordered]@{ shot = 'beta'; review = 'Beta is there.' }); auto = $false }
                )
            }
        )
    }
    function Write-Catalog($Entries) {
        [IO.File]::WriteAllText($catalogPath, (ConvertTo-Json -InputObject @($Entries) -Depth 10))
    }
    # The results a run against the catalog on disk leaves. -Change bends a top-level field and
    # -Skip leaves a check out, as a run made before that check existed would.
    function Write-Results([hashtable]$Change = @{}, [string[]]$Skip = @()) {
        $parsed = @(Get-Content -LiteralPath $catalogPath -Raw -Encoding UTF8 | ConvertFrom-Json)
        $patches = foreach ($entry in $parsed) {
            $checks = foreach ($check in @($entry.checks)) {
                if ("$($entry.name)/$($check.id)" -cin $Skip) { continue }
                [ordered]@{ id = $check.id; status = 'pass'; definitionHash = Get-AuditDefinitionHash $entry $check }
            }
            [ordered]@{ name = $entry.name; checks = @($checks) }
        }
        $run = [ordered]@{
            app = [ordered]@{ package = $package; version = '47.5.3' }
            apk = [ordered]@{ sha256 = ('a' * 64) }
            build = [ordered]@{ source = [ordered]@{ commit = $parent } }
            finishedUtc = '2026-10-23T10:01:58Z'
            summary = [ordered]@{ pass = 2; fail = 0; review = 1; inconclusive = 0; error = 0; skipped = 0 }
            patches = @($patches)
            qualification = [ordered]@{ state = 'current-bound' }
        }
        foreach ($key in $Change.Keys) { $run[$key] = $Change[$key] }
        [IO.File]::WriteAllText($resultsPath, ($run | ConvertTo-Json -Depth 10))
    }
    function Test-Here([string[]]$Versions = @('47.5.3')) {
        return Test-AuditResults -Root $work -PackageName $package -PackageVersions $Versions -Head $head -GitRoot $repo
    }

    Write-Catalog (New-Catalog)
    Write-Results
    $good = Test-Here
    Assert-AuditContract $good.Valid "A run matching every catalog check was refused: $($good.Reason)"
    $fact = $good.Facts[0]
    Assert-AuditContract ($good.Facts.Count -eq 1 -and $fact.checks -eq 3 -and $fact.commitsSince -eq 1 -and
        $fact.sourceCommit -ceq $parent -and $fact.finished -ceq '2026-10-23T10:01:58Z' -and $fact.summary.review -eq 1 -and
        $fact.sha256 -ceq (Get-FileHash -Algorithm SHA256 -LiteralPath $resultsPath).Hash.ToLowerInvariant()) `
        "The audit facts don't describe the results file: $($fact | ConvertTo-Json -Depth 4 -Compress)"

    # Patch notes aren't part of any check, so rewording them leaves the run current.
    $renoted = New-Catalog
    $renoted[0].notes = 'Alpha notes, reworded after the run.'
    Write-Catalog $renoted
    Assert-AuditContract (Test-Here).Valid 'Rewording a patch note made its run stale.'

    # A check edited after the run: its result is for a definition that's gone.
    $edited = New-Catalog
    $edited[1].checks[0].steps[0].expect = 'beta (?-i:[A-Z]{2})'
    Write-Catalog $edited
    $stale = Test-Here
    Assert-AuditContract (-not $stale.Valid -and $stale.Reason -like '*changed since the run: Beta/bound*-Only*') `
        "A check edited after the run passed: $($stale.Reason)"
    # So is a changed setting on the patch, which can change what every one of its checks sets up.
    $resettled = New-Catalog
    $resettled[1].settings[0].default = $true
    Write-Catalog $resettled
    $settled = Test-Here
    Assert-AuditContract (-not $settled.Valid -and $settled.Reason -like '*Beta/bound, Beta/shot*') `
        "A patch setting changed after the run left its checks current: $($settled.Reason)"

    # A check added after the run, and one the catalog dropped.
    Write-Catalog (New-Catalog)
    Write-Results -Skip @('Beta/shot')
    $added = Test-Here
    Assert-AuditContract (-not $added.Valid -and $added.Reason -like '*never run: Beta/shot*') "A check the run never had passed: $($added.Reason)"
    Write-Results
    $dropped = New-Catalog
    $dropped[1].checks = @($dropped[1].checks[0])
    Write-Catalog $dropped
    $removed = Test-Here
    Assert-AuditContract (-not $removed.Valid -and $removed.Reason -like '*no longer in the catalog: Beta/shot*') "A result for a dropped check passed: $($removed.Reason)"

    # A declared version nobody audited, a run on another build, one not bound to its evidence,
    # and one built from a commit outside the release's history.
    Write-Catalog (New-Catalog)
    Write-Results
    $unaudited = Test-Here @('47.5.3', '47.6.0')
    Assert-AuditContract (-not $unaudited.Valid -and $unaudited.Reason -like '*no audit/results/tiktok-47.6.0.json*never audited*') `
        "A declared version with no audit passed: $($unaudited.Reason)"
    Write-Results @{ app = [ordered]@{ package = $package; version = '47.4.3' } }
    $other = Test-Here
    Assert-AuditContract (-not $other.Valid -and $other.Reason -like '*47.4.3, not com.zhiliaoapp.musically 47.5.3*') "A run on another TikTok build passed: $($other.Reason)"
    Write-Results @{ qualification = [ordered]@{ state = 'historical-or-incomplete' } }
    $unbound = Test-Here
    Assert-AuditContract (-not $unbound.Valid -and $unbound.Reason -like '*historical-or-incomplete, not current-bound*') "A run not bound to its evidence passed: $($unbound.Reason)"
    Write-Results @{ build = [ordered]@{ source = [ordered]@{ commit = ('f' * 40) } } }
    $stray = Test-Here
    Assert-AuditContract (-not $stray.Valid -and $stray.Reason -like "*isn't in the history of $head*") "A build from outside the release's history passed: $($stray.Reason)"

    # What the receipt carries.
    Write-Results
    $facts = (Test-Here).Facts | ConvertTo-Json -Depth 4 | ConvertFrom-Json
    Assert-AuditContract ($null -eq (Test-ReceiptAuditFacts -Audit $facts -PackageVersions @('47.5.3'))) 'A receipt audit covering the declared version was refused.'
    Assert-AuditContract ($null -eq (Test-ReceiptAuditFacts -Audit $null -PackageVersions @('47.5.3'))) 'A receipt from before the audit block was refused.'
    Assert-AuditContract ((Test-ReceiptAuditFacts -Audit $facts -PackageVersions @('47.5.3', '47.6.0')) -like '*leaves out TikTok 47.6.0*') 'A receipt audit missing a declared version passed.'
    Assert-AuditContract ((Test-ReceiptAuditFacts -Audit $facts -PackageVersions @('47.6.0')) -like '*audit is of TikTok 47.5.3*') 'A receipt audit of an undeclared version passed.'
    Assert-AuditContract ((Test-ReceiptAuditFacts -Audit @($facts, $facts) -PackageVersions @('47.5.3')) -like '*two audits of TikTok 47.5.3*') 'A receipt with the same audit twice passed.'
    $unhashed = $facts | ConvertTo-Json -Depth 4 | ConvertFrom-Json
    $unhashed.sha256 = 'not a hash'
    Assert-AuditContract ((Test-ReceiptAuditFacts -Audit $unhashed -PackageVersions @('47.5.3')) -like '*no results hash*') 'A receipt audit with no results hash passed.'
} finally {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}

# The builder holds the audit before it patches a fixture, and publish holds it before anything
# goes public.
$builder = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'build-release-receipt.ps1') -Raw
$auditAt = $builder.IndexOf('Test-AuditResults ')
$patchAt = $builder.IndexOf('Get-BundleManifestFacts -BundlePath $Bundle')
Assert-AuditContract ($auditAt -gt 0 -and $patchAt -gt $auditAt -and $builder.Contains('audit         = @($audit.Facts)')) `
    'build-release-receipt.ps1 no longer checks the device audit first or leaves it out of the receipt.'
$release = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'release/release.ps1') -Raw
$publishAt = $release.IndexOf("'publish' {")
$heldAt = $release.IndexOf('Test-AuditResults ', [Math]::Max($publishAt, 0))
$goesOutAt = $release.IndexOf('Invoke-ReleasePublication ', [Math]::Max($publishAt, 0))
Assert-AuditContract ($publishAt -gt 0 -and $heldAt -gt $publishAt -and $goesOutAt -gt $heldAt) `
    'release.ps1 -Stage publish reaches the publication before it holds the release to the device audit.'
Write-Host '[scripts] audit results contracts passed'
