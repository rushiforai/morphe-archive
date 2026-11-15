<#
.SYNOPSIS
    Scan the resolved build, test and provided dependency report with the release advisory policy.
.DESCRIPTION
    Generate the report with :patches:buildDependencyReport. This report includes the toolchain
    classpaths that the shipped SBOM deliberately excludes. Query failures stop the gate, and
    high, critical and unrated findings need a current exception specific to the build graph.
#>
[CmdletBinding()]
param([string]$Root, [string]$ReportPath, [string]$ExceptionsPath)

. (Join-Path $PSScriptRoot 'release-advisories.ps1')

function Read-BuildDependencyReport {
    param([Parameter(Mandatory = $true)][string]$Path)

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "The resolved build dependency report is missing: $Path. Run :patches:buildDependencyReport."
    }
    try { $report = Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json }
    catch { throw "The build dependency report is not valid JSON: $Path. $($_.Exception.Message)" }
    if (($report.schemaVersion -isnot [int] -and $report.schemaVersion -isnot [long]) -or
            $report.schemaVersion -ne 1 -or [string]::IsNullOrWhiteSpace($report.gradleVersion)) {
        throw "The build dependency report must have schemaVersion 1 and its resolved Gradle version: $Path"
    }
    if ($report.configurations -isnot [array] -or $report.configurations.Count -eq 0 -or
            $report.components -isnot [array] -or $report.components.Count -eq 0) {
        throw "The build dependency report must list nonempty configuration and component arrays: $Path"
    }
    $configurations = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($configuration in $report.configurations) {
        if ($configuration -isnot [string] -or [string]::IsNullOrWhiteSpace($configuration) -or
                $configuration -match '[\r\n\t]' -or -not $configurations.Add($configuration)) {
            throw "The build dependency report has a blank, duplicate or invalid configuration: $Path"
        }
    }
    $libraries = New-Object Collections.Generic.List[object]
    $purls = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($component in $report.components) {
        foreach ($field in @('group', 'name', 'version', 'purl')) {
            $value = $component.$field
            if ($value -isnot [string] -or [string]::IsNullOrWhiteSpace($value) -or $value -match '\s') {
                throw "The build dependency report has a component without a resolved ${field}: $Path"
            }
        }
        $expectedPurl = 'pkg:maven/' + [Uri]::EscapeDataString($component.group) + '/' +
            [Uri]::EscapeDataString($component.name) + '@' + [Uri]::EscapeDataString($component.version)
        if ($component.purl -cne $expectedPurl -or -not $purls.Add($component.purl)) {
            throw "The build dependency report has a mismatched or duplicate package URL: $($component.purl)"
        }
        if ($component.configurations -isnot [array] -or $component.configurations.Count -eq 0) {
            throw "The build dependency report gives $($component.purl) no configuration origin."
        }
        $origins = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
        foreach ($configuration in $component.configurations) {
            if ($configuration -isnot [string] -or -not $configurations.Contains($configuration) -or
                    -not $origins.Add($configuration)) {
                throw "The build dependency report gives $($component.purl) an unknown or duplicate configuration origin."
            }
        }
        $libraries.Add([pscustomobject]@{
            Group = $component.group; Name = $component.name; Version = $component.version
            Purl = $component.purl; Configurations = @($component.configurations)
        })
    }
    return [pscustomobject]@{
        Path = $Path; Gradle = $report.gradleVersion; Libraries = $libraries.ToArray(); Configurations = @($report.configurations)
    }
}

function Assert-GradleDistribution {
    param([Parameter(Mandatory = $true)]$Report)
    # The distribution isn't a Maven component, so OSV's component results never cover it. These
    # maintainer records (2026-10-07) cover daemon and worker deserialization and the SSL repository
    # fallback. The public fixes are 8.14.6 and 9.8.1; the table also names subscription backports on
    # 7.6 and 9.1 through 9.7, which must not be mistaken for affected distributions.
    # https://github.com/gradle/gradle/security/advisories/GHSA-xwqc-3h47-hg64
    # https://github.com/gradle/gradle/security/advisories/GHSA-mvvg-497x-hmj8
    # https://github.com/gradle/gradle/security/advisories/GHSA-j5m7-59rp-24f5
    $name = Split-Path -Leaf $Report.Path
    if ($Report.Gradle -isnot [string] -or $Report.Gradle -cnotmatch '^[0-9]{1,4}\.[0-9]{1,4}(\.[0-9]{1,4})?$') {
        throw "$name doesn't name a stable Gradle distribution version. Build again with the supported wrapper."
    }
    $gradle = [version]$Report.Gradle
    $backport = ($gradle.Major -eq 7 -and $gradle.Minor -eq 6 -and $gradle.Build -ge 7) -or
        ($gradle.Major -eq 9 -and $gradle.Minor -ge 1 -and $gradle.Minor -le 7 -and $gradle.Build -ge 2)
    if (-not $backport -and ($gradle -lt [version]'8.14.6' -or
            ($gradle -ge [version]'9.0' -and $gradle -lt [version]'9.8.1'))) {
        throw ("Gradle $($Report.Gradle) is affected by the high distribution advisories GHSA-xwqc-3h47-hg64, " +
            'GHSA-mvvg-497x-hmj8 and GHSA-j5m7-59rp-24f5. Build with the wrapper (Gradle 9.8.1 or later). ' +
            'Component OSV results and dependency checksums do not fix daemon deserialization.')
    }
    # The maintainer records of 2026-11-10: version catalog values running as code in generated
    # accessors (critical) and the client trusting the daemon registry, stale entries included (high).
    # They name 8.14.7 and 9.9.1 as the only fixes, so the October backports above are affected too.
    # https://github.com/gradle/gradle/security/advisories/GHSA-3cfg-jpcr-gfp3
    # https://github.com/gradle/gradle/security/advisories/GHSA-gqrr-4j89-5267
    # https://github.com/gradle/gradle/security/advisories/GHSA-pcp8-98xm-c6pr
    if ($gradle -lt [version]'8.14.7' -or ($gradle -ge [version]'9.0' -and $gradle -lt [version]'9.9.1')) {
        throw ("Gradle $($Report.Gradle) is affected by the critical distribution advisory GHSA-3cfg-jpcr-gfp3 " +
            'and the high GHSA-gqrr-4j89-5267 and GHSA-pcp8-98xm-c6pr. Build with the wrapper (Gradle 9.9.1 or later).')
    }
    Write-Host ("[build advisories] Gradle $($Report.Gradle) is outside the affected versions in the six " +
        'maintainer distribution advisories dated 2026-10-07 and 2026-11-10. Component results are separate.')
}

function Assert-ReviewedToolingResolutions {
    param([Parameter(Mandatory = $true)]$Report)
    foreach ($library in $Report.Libraries) {
        $package = $library.Group + ':' + $library.Name
        $safe = $true
        $required = $null
        switch ($package) {
            'org.apache.commons:commons-lang3' {
                $required = '3.18.0 or later (GHSA-j288-q9x7-2f5v)'
                $safe = $library.Version -match '^\d+\.\d+\.\d+$' -and
                    [version]$library.Version -ge [version]'3.18.0'
            }
            'org.apache.httpcomponents:httpclient' {
                $required = 'the reviewed 4.5.14 build (GHSA-7r82-7xv7-xcpj)'
                $safe = $library.Version -ceq '4.5.14'
            }
            'com.google.guava:guava' {
                # The project advisory may arrive after aggregate advisory services.
                $required = '33.7.2 or later (GHSA-xxph-c9ww-hj94)'
                $safe = $library.Version -match '^(\d+\.\d+\.\d+)-(jre|android)$'
                if ($safe) { $safe = [version]$Matches[1] -ge [version]'33.7.2' }
            }
        }
        if (-not $safe) {
            throw "Unreviewed tooling resolution $($library.Purl) in $($library.Configurations -join ', '). Use $required."
        }
    }
}

function Invoke-BuildAdvisoryGate {
    param(
        [Parameter(Mandatory = $true)]$Report,
        [Parameter(Mandatory = $true)][string]$ExceptionsPath,
        [datetime]$Today = [datetime]::Today
    )
    Assert-GradleDistribution -Report $Report
    Assert-ReviewedToolingResolutions -Report $Report
    $exceptions = @(Read-AdvisoryExceptions -Path $ExceptionsPath -Today $Today)
    $findings = @(Get-SbomAdvisories -Sbom $Report)
    $verdict = Test-AdvisoryFindings -Findings $findings -Exceptions $exceptions
    foreach ($line in @($verdict.Minor)) { Write-Host "[build advisories] below high, let through: $line" }
    foreach ($line in @($verdict.Excused)) { Write-Host "[build advisories] accepted: $line" }
    $reasons = @()
    if (@($verdict.Refused).Count -gt 0) {
        $reasons += ('OSV reports high, critical or unrated advisories on the resolved build/test/provided graph: ' +
            ($verdict.Refused -join '; ') + '. Move to a version without them, or record why the advisory ' +
            'does not apply in scripts/build-advisory-exceptions.txt with a date within 90 days.')
    }
    if (@($verdict.Stale).Count -gt 0) {
        $reasons += ('scripts/build-advisory-exceptions.txt accepts advisories OSV no longer reports on the ' +
            'resolved build graph: ' + ($verdict.Stale -join '; ') + '. Take them out.')
    }
    if ($reasons.Count -gt 0) { throw ($reasons -join ' ') }
    $said = if ($findings.Count -eq 0) { 'no advisory' } else { "$($findings.Count) advisories, none refused" }
    Write-Host "[build advisories] OSV has $said for $(@($Report.Libraries).Count) resolved libraries"
}

# Dot-sourcing exposes the reader and gate for isolated recorded-response contracts.
if ($MyInvocation.InvocationName -eq '.') { return }
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
if (-not $ReportPath) { $ReportPath = Join-Path $Root 'patches/build/dependency-reports/build-dependencies.json' }
if (-not $ExceptionsPath) { $ExceptionsPath = Join-Path $Root 'scripts/build-advisory-exceptions.txt' }
$resolvedReport = Read-BuildDependencyReport -Path $ReportPath
Invoke-BuildAdvisoryGate -Report $resolvedReport -ExceptionsPath $ExceptionsPath
