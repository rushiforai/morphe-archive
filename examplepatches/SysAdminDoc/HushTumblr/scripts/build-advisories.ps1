<#
.SYNOPSIS
    Scan the resolved build, test and provided dependency report with the release advisory policy.
.DESCRIPTION
    Generate the report with :patches:buildDependencyReport. This report includes the toolchain
    classpaths that the shipped SBOM deliberately excludes. Check the reviewed wrapper before
    starting Gradle, then compare the report's resolved version with it. Query failures stop the gate, and
    high, critical and unrated findings need a current exception specific to the build graph.
#>
[CmdletBinding()]
param([string]$Root, [string]$ReportPath, [string]$ExceptionsPath)

. (Join-Path $PSScriptRoot 'release-advisories.ps1')

function Assert-ReviewedGradleWrapper {
    param([Parameter(Mandatory = $true)][string]$Root)

    $path = Join-Path $Root 'gradle/wrapper/gradle-wrapper.properties'
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        throw "The Gradle wrapper properties are missing: $path"
    }
    $properties = [Collections.Generic.Dictionary[string, string]]::new([StringComparer]::Ordinal)
    foreach ($line in @(Get-Content -LiteralPath $path)) {
        if ($line -match '^\s*(?:[#!]|$)') { continue }
        # Keep one unambiguous key=value per line. Java property continuations, escaped keys and
        # alternate separators must not let this reader check a different URL than Gradle uses.
        if ($line.EndsWith('\') -or $line -cnotmatch '^([A-Za-z][A-Za-z0-9.]*)=(.*)$') {
            throw "The Gradle wrapper properties must use one key=value per line: $path"
        }
        $key = $Matches[1]
        $value = $Matches[2]
        if ($properties.ContainsKey($key)) { throw "The Gradle wrapper repeats property ${key}: $path" }
        $properties.Add($key, $value)
    }
    $url = $properties['distributionUrl']
    if (-not $url -or $url.Replace('\:', ':') -cnotmatch
            '^https://services[.]gradle[.]org/distributions/gradle-(\d+[.]\d+[.]\d+)-bin[.]zip$') {
        throw "The Gradle wrapper must pin an official binary distribution and its resolved version: $path"
    }
    $version = $Matches[1]
    # Reviewed against Gradle's own advisories on 2026-11-06 (the newest three were fixed in 9.8.1).
    # These affect the build tool, not the extension runtime. A newer distribution needs a review
    # and its official checksums too.
    if ($version -cne '9.8.2') {
        throw ("Unreviewed Gradle wrapper $version. Use the reviewed 9.8.2 distribution before starting Gradle " +
            '(GHSA-mvvg-497x-hmj8, GHSA-xwqc-3h47-hg64, GHSA-j5m7-59rp-24f5).')
    }
    # https://services.gradle.org/distributions/gradle-9.8.2-bin.zip.sha256
    if ($properties['distributionSha256Sum'] -cne '21bd5da2de49b642904077f38c0efdc7778e92b3ed0889392dca61b97e389607') {
        throw "The Gradle 9.8.2 distribution checksum is missing or differs from the reviewed official checksum: $path"
    }
    if ($properties['validateDistributionUrl'] -cne 'true') {
        throw "The Gradle wrapper must keep validateDistributionUrl=true: $path"
    }
    $jar = Join-Path $Root 'gradle/wrapper/gradle-wrapper.jar'
    if (-not (Test-Path -LiteralPath $jar -PathType Leaf)) { throw "The Gradle wrapper JAR is missing: $jar" }
    # https://services.gradle.org/distributions/gradle-9.8.2-wrapper.jar.sha256 (the same JAR as 9.8.1's)
    if ((Get-FileHash -LiteralPath $jar -Algorithm SHA256).Hash -ine
            '3b8a25775a69158b5ad2b1d17a80a88dc7b40a352a73eb27d06c612a7ce68e98') {
        throw "The Gradle wrapper JAR differs from the reviewed official 9.8.2 checksum: $jar"
    }
    return [pscustomobject]@{ Path = $path; GradleVersion = $version }
}

function Read-BuildDependencyReport {
    param([Parameter(Mandatory = $true)][string]$Path)

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "The resolved build dependency report is missing: $Path. Run :patches:buildDependencyReport."
    }
    try { $report = Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json }
    catch { throw "The build dependency report is not valid JSON: $Path. $($_.Exception.Message)" }
    if (($report.schemaVersion -isnot [int] -and $report.schemaVersion -isnot [long]) -or
            $report.schemaVersion -ne 1 -or $report.gradleVersion -isnot [string] -or
            $report.gradleVersion -cnotmatch '^\d+[.]\d+[.]\d+$') {
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
        Path = $Path; GradleVersion = $report.gradleVersion
        Libraries = $libraries.ToArray(); Configurations = @($report.configurations)
    }
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
        [Parameter(Mandatory = $true)][string]$Root,
        [Parameter(Mandatory = $true)]$Report,
        [Parameter(Mandatory = $true)][string]$ExceptionsPath,
        [datetime]$Today = [datetime]::Today
    )
    $wrapper = Assert-ReviewedGradleWrapper -Root $Root
    if ($Report.GradleVersion -isnot [string] -or $Report.GradleVersion -cne $wrapper.GradleVersion) {
        throw "The resolved build report's Gradle version '$($Report.GradleVersion)' does not match the wrapper's $($wrapper.GradleVersion). Regenerate :patches:buildDependencyReport."
    }
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
Invoke-BuildAdvisoryGate -Root $Root -Report $resolvedReport -ExceptionsPath $ExceptionsPath
