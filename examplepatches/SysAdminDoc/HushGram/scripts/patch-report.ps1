<#
.SYNOPSIS
    The checks that say whether a morphe-desktop run actually patched anything.

.DESCRIPTION
    Dot-sourced by verify-all-patches.ps1, patch-for-device.ps1 and measure-patch-heap.ps1. They
    ask the same question of the same CLI, and two used to carry their own copy of these functions. The
    copies drifted: the verification script learned on 2026-09-08 that morphe-desktop 1.15.0
    omits the top-level success field when it is true, and the heap script did not, so every
    successful run it measured came back invalid. One copy is why that cannot happen again.

    The CLI writes its result file from a finally block, so a file exists even after a failed
    compile or save. Nothing here treats the file's existence as the answer.

.NOTES
    Taken from Hushfacebook's scripts/patch-report.ps1
    (https://github.com/SysAdminDoc/Hushfacebook, commit c15d4f7930505824789684d35039d3c78c8b0903).
    GPL-3.0-only. Modified for HushGram (Instagram), 2026.
#>

function Get-ApkTargetCoverage {
    param([string]$Apk, [string]$Java, [string]$DesktopJar, [string[]]$Names)
    if (@($Names | Where-Object { $_ -cin @('Disable analytics', 'Sanitize sharing links', 'Start on x86 devices') }).Count -eq 0) {
        return @()
    }
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $lines = @(& $Java '-Xmx4g' '-cp' $DesktopJar (Join-Path $PSScriptRoot 'PatchCoverage.java') $Apk 2>&1)
        $code = $LASTEXITCODE
    } finally { $ErrorActionPreference = $preference }
    if ($code -ne 0) { throw "Could not read target coverage from the patched APK: $($lines -join ' ')" }
    foreach ($line in $lines) {
        $match = [regex]::Match([string]$line, '^(disableAnalytics|sanitizeSharingLinks|translatedStart)=(.+)$')
        if (-not $match.Success) { throw 'Unexpected output from the target coverage reader.' }
        $parts = $match.Groups[2].Value.Split('|')
        if ($parts.Count -ne 5 -or $parts[0] -cne '1' -or
            $parts[1] -notmatch '^[0-9]{1,3}$' -or $parts[2] -notmatch '^[0-9]{1,3}$') {
            throw 'Invalid target coverage encoding in the patched APK.'
        }
        [pscustomobject]@{ family = $match.Groups[1].Value; matched = [int]$parts[1]; expected = [int]$parts[2]
            targets = @($parts[3].Split(',')); missing = @(if ($parts[4]) { $parts[4].Split(',') }) }
    }
}

function Test-TargetCoverage {
    param([object[]]$Coverage, [string[]]$Names, [string]$Package, [string]$VersionName, [string]$VersionCode,
        [object]$Policy)
    function Bad([string]$Reason) { return [pscustomobject]@{ Valid = $false; Reviewed = $false; Reason = $Reason } }
    $families = [ordered]@{ disableAnalytics = 'Disable analytics'; sanitizeSharingLinks = 'Sanitize sharing links'
        translatedStart = 'Start on x86 devices' }
    $wanted = @($families.Keys | Where-Object { $families[$_] -cin $Names })
    $entries = @($Coverage)
    if ($entries.Count -ne $wanted.Count) { return Bad 'The APK/receipt does not record every selected coverage family exactly once.' }
    $seen = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($entry in $entries) {
        if ($null -eq $entry -or [string]$entry.family -cnotin $wanted -or -not $seen.Add([string]$entry.family)) {
            return Bad 'Unexpected or duplicated coverage family.'
        }
        if (($entry.matched -isnot [int] -and $entry.matched -isnot [long]) -or
            ($entry.expected -isnot [int] -and $entry.expected -isnot [long]) -or
            $entry.matched -lt 1 -or $entry.expected -lt $entry.matched -or $entry.expected -gt 256 -or
            $entry.targets -isnot [array] -or $entry.missing -isnot [array]) {
            return Bad 'Invalid target coverage counts or arrays.'
        }
        $targets = @($entry.targets)
        $missing = @($entry.missing)
        if ($targets.Count -ne $entry.expected -or $missing.Count -ne $entry.expected - $entry.matched -or
            @($targets | Sort-Object -CaseSensitive -Unique).Count -ne $targets.Count -or
            @($missing | Sort-Object -CaseSensitive -Unique).Count -ne $missing.Count -or
            @($targets | Where-Object { $_ -isnot [string] -or $_ -cnotmatch '^[a-z][a-z0-9 -]{0,63}$' }).Count -or
            @($missing | Where-Object { $_ -isnot [string] -or $_ -cnotin $targets }).Count) {
            return Bad 'Target coverage labels disagree with the counts or contain non-fixed data.'
        }
    }
    if ($wanted.Count -eq 0) { return [pscustomobject]@{ Valid = $true; Reviewed = $true; Reason = $null } }
    if ($null -eq $Policy) {
        $path = Join-Path $PSScriptRoot 'patch-coverage-expectations.json'
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { return Bad 'The reviewed coverage policy is missing.' }
        try { $Policy = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json }
        catch { return Bad 'The reviewed coverage policy is not JSON.' }
    }
    if (($Policy.schemaVersion -isnot [int] -and $Policy.schemaVersion -isnot [long]) -or
        $Policy.schemaVersion -ne 1) { return Bad 'Unknown coverage policy schema.' }
    $fixtures = @($Policy.fixtures | Where-Object {
        $_.package -ceq $Package -and $_.versionName -ceq $VersionName -and $_.versionCode -ceq $VersionCode
    })
    if ($fixtures.Count -gt 1) { return Bad 'Duplicated reviewed coverage fixture.' }
    if ($fixtures.Count -eq 0) {
        return [pscustomobject]@{ Valid = $true; Reviewed = $false
            Reason = 'No reviewed coverage expectations for this exact APK. Counts are recorded, not certified.' }
    }
    foreach ($entry in $entries) {
        $rules = @($fixtures[0].families | Where-Object { $_.family -ceq $entry.family })
        if ($rules.Count -ne 1) { return Bad "No unique reviewed expectation for $($entry.family)." }
        $rule = $rules[0]
        $required = @($rule.targets | Where-Object { $_ -cnotin @($rule.optional) })
        if ($rule.patch -cne $families[$entry.family] -or $rule.targets -isnot [array] -or
            $rule.optional -isnot [array] -or @($rule.optional | Where-Object { $_ -cnotin @($rule.targets) }).Count -or
            @($rule.targets | Sort-Object -CaseSensitive -Unique).Count -ne @($rule.targets).Count -or
            @($rule.targets | Where-Object { $_ -cnotin @($entry.targets) }).Count -or
            @($entry.targets | Where-Object { $_ -cnotin @($rule.targets) }).Count) {
            return Bad "Coverage targets do not match the reviewed $($entry.family) census."
        }
        $lost = @($entry.missing | Where-Object { $_ -cin $required })
        if ($lost.Count) { return Bad "Required $($entry.family) targets are missing: $($lost -join ', ')." }
    }
    return [pscustomobject]@{ Valid = $true; Reviewed = $true; Reason = $null }
}

function Test-ApkFile {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { return $false }
    # ZipFile reads a relative path against the process directory, not the location Test-Path used.
    $Path = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)
    try {
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $archive = [System.IO.Compression.ZipFile]::OpenRead($Path)
        try {
            $dex = @($archive.Entries | Where-Object { $_.FullName -match '(^|/)classes\d*\.dex$' })
            $manifest = @($archive.Entries | Where-Object { $_.FullName -eq 'AndroidManifest.xml' })
            return $dex.Count -gt 0 -and $manifest.Count -gt 0
        } finally {
            $archive.Dispose()
        }
    } catch {
        return $false
    }
}

function Get-ReportPatchNames {
    param([object]$Entries)
    $names = New-Object System.Collections.Generic.List[string]
    foreach ($entry in @($Entries)) {
        if ($null -eq $entry) { continue }
        if ($entry -is [string]) {
            $names.Add([string]$entry)
            continue
        }
        $name = $entry.PSObject.Properties['name']
        if ($null -ne $name -and $null -ne $name.Value) {
            $names.Add([string]$name.Value)
        }
    }
    return $names.ToArray()
}

function Get-PatchDependencyNames {
    param([object]$PatchList, [string[]]$RequestedNames)

    $patchesProperty = $PatchList.PSObject.Properties['patches']
    if ($null -eq $patchesProperty) { throw 'The patch list has no patches.' }

    $patchesByName = [System.Collections.Generic.Dictionary[string, object]]::new(
        [System.StringComparer]::Ordinal)
    foreach ($patch in @($patchesProperty.Value)) {
        if ($null -eq $patch) { throw 'The patch list contains a null patch.' }
        $nameProperty = $patch.PSObject.Properties['name']
        if ($null -eq $nameProperty -or [string]::IsNullOrWhiteSpace([string]$nameProperty.Value)) {
            throw 'The patch list contains a patch without a name.'
        }
        $name = [string]$nameProperty.Value
        if ($patchesByName.ContainsKey($name)) { throw "The patch list repeats patch name $name." }
        $patchesByName.Add($name, $patch)
    }

    $requested = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
    $pending = [System.Collections.Generic.Queue[string]]::new()
    foreach ($name in @($RequestedNames)) {
        if ([string]::IsNullOrWhiteSpace($name)) { throw 'A requested patch has no name.' }
        if (-not $patchesByName.ContainsKey($name)) { throw "Requested patch $name is not in the patch list." }
        if ($requested.Add($name)) { $pending.Enqueue($name) }
    }

    $visited = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
    $dependencySet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
    $dependencies = New-Object System.Collections.Generic.List[string]
    while ($pending.Count -gt 0) {
        $name = $pending.Dequeue()
        if (-not $visited.Add($name) -or -not $patchesByName.ContainsKey($name)) { continue }
        $patch = $patchesByName[$name]
        $dependencyProperty = $patch.PSObject.Properties['dependencies']
        if ($null -eq $dependencyProperty) { continue }
        foreach ($value in @($dependencyProperty.Value)) {
            $dependency = [string]$value
            if ([string]::IsNullOrWhiteSpace($dependency)) {
                throw "Patch $name contains a dependency without a name."
            }
            if (-not $requested.Contains($dependency) -and $dependencySet.Add($dependency)) {
                $dependencies.Add($dependency)
            }
            if ($patchesByName.ContainsKey($dependency)) { $pending.Enqueue($dependency) }
        }
    }
    return $dependencies.ToArray()
}

function Test-ReportedPatchNames {
    param(
        [string[]]$Expected,
        [string[]]$Actual,
        [string[]]$AllowedDependencies = @()
    )
    $expectedCounts = [System.Collections.Generic.Dictionary[string, int]]::new([System.StringComparer]::Ordinal)
    foreach ($name in @($Expected)) {
        if ([string]::IsNullOrWhiteSpace($name)) { return $false }
        if (-not $expectedCounts.ContainsKey($name)) { $expectedCounts[$name] = 0 }
        $expectedCounts[$name]++
    }
    $allowed = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
    foreach ($name in @($AllowedDependencies)) {
        if ([string]::IsNullOrWhiteSpace($name)) { return $false }
        [void]$allowed.Add($name)
    }
    $actualCounts = [System.Collections.Generic.Dictionary[string, int]]::new([System.StringComparer]::Ordinal)
    foreach ($name in @($Actual)) {
        if ([string]::IsNullOrWhiteSpace($name)) { return $false }
        if (-not $actualCounts.ContainsKey($name)) { $actualCounts[$name] = 0 }
        $actualCounts[$name]++
    }
    foreach ($name in $expectedCounts.Keys) {
        if (-not $actualCounts.ContainsKey($name) -or $actualCounts[$name] -ne $expectedCounts[$name]) {
            return $false
        }
    }
    foreach ($name in $actualCounts.Keys) {
        if ($expectedCounts.ContainsKey($name)) { continue }
        if (-not $allowed.Contains($name) -or $actualCounts[$name] -ne 1) { return $false }
    }
    return $true
}

function Test-TrueBoolean {
    param([object]$Value)
    return $Value -is [bool] -and [bool]$Value
}

function Test-PatchingReport {
    param(
        [object]$Report,
        [string[]]$ExpectedNames,
        [string[]]$AllowedDependencyNames = @(),
        [string]$OutputPath,
        [string]$ExpectedPackageName,
        [string]$ExpectedPackageVersion
    )
    if ($null -eq $Report) { return [pscustomobject]@{ Valid = $false; Reason = 'missing or invalid result JSON' } }

    # The top-level success field defaults to true in morphe-desktop 1.15.0, and kotlinx
    # serialization omits a field that equals its default, so a successful run has no such field
    # while a failed one writes "success": false. It is therefore checked when present and not
    # demanded when absent. If a later CLI changes that default, absence stops meaning success:
    # read PatchingResult before relying on this. The step check below is the independent one,
    # and it is what catches the case these scripts exist for, a result file written from a
    # finally block after a failed compile, because the step that failed reports success false.
    $success = $Report.PSObject.Properties['success']
    $steps = @($Report.patchingSteps)
    $stepsOk = $steps.Count -gt 0 -and @($steps | Where-Object {
        $property = $_.PSObject.Properties['success']
        $null -eq $property -or -not (Test-TrueBoolean $property.Value)
    }).Count -eq 0
    $failed = @($Report.failedPatches)
    $applied = Get-ReportPatchNames $Report.appliedPatches
    $namesOk = Test-ReportedPatchNames -Expected $ExpectedNames -Actual $applied `
        -AllowedDependencies $AllowedDependencyNames
    $targetOk = $null -ne $Report.PSObject.Properties['packageName'] -and
        $null -ne $Report.PSObject.Properties['packageVersion'] -and
        [string]::Equals([string]$Report.packageName, $ExpectedPackageName, [System.StringComparison]::Ordinal) -and
        [string]::Equals([string]$Report.packageVersion, $ExpectedPackageVersion, [System.StringComparison]::Ordinal)
    $outputOk = Test-ApkFile $OutputPath
    $successOk = $null -eq $success -or (Test-TrueBoolean $success.Value)
    $valid = $successOk -and $stepsOk -and
        $failed.Count -eq 0 -and $namesOk -and $targetOk -and $outputOk
    $reason = if ($valid) { 'ok' } else {
        $parts = New-Object System.Collections.Generic.List[string]
        if (-not $successOk) { $parts.Add('report.success is present and is not true') }
        if (-not $stepsOk) { $parts.Add('a patching step failed or is missing') }
        if ($failed.Count -ne 0) { $parts.Add("$($failed.Count) failed patches") }
        if (-not $namesOk) {
            $parts.Add('an expected patch is missing, duplicated, or joined by an undeclared dependency')
        }
        if (-not $targetOk) { $parts.Add('unexpected package or version') }
        if (-not $outputOk) { $parts.Add('saved APK is missing or invalid') }
        $parts -join '; '
    }
    return [pscustomobject]@{
        Valid = $valid
        Reason = $reason
        Applied = $applied.Count
        Failed = $failed.Count
    }
}
