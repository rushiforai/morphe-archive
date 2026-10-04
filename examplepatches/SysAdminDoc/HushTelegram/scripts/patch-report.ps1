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
#>

function Test-ApkFile {
    param([string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path)) { return $false }
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
    if ($null -eq $Report) {
        return [pscustomobject]@{
            Valid = $false; Reason = 'missing or invalid result JSON'; FailureCodes = @('REPORT_INVALID')
        }
    }

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
    $failureCodes = New-Object System.Collections.Generic.List[string]
    if (-not $successOk) { $failureCodes.Add('REPORT_FAILED') }
    if (-not $stepsOk) { $failureCodes.Add('PATCHING_STEP_FAILED') }
    if ($failed.Count -ne 0) { $failureCodes.Add('PATCH_FAILED') }
    if (-not $namesOk) { $failureCodes.Add('PATCH_SET_INVALID') }
    if (-not $targetOk) { $failureCodes.Add('TARGET_UNSUPPORTED') }
    if (-not $outputOk) { $failureCodes.Add('APK_INVALID') }
    return [pscustomobject]@{
        Valid = $valid
        Reason = $reason
        Applied = $applied.Count
        Failed = $failed.Count
        FailureCodes = $failureCodes.ToArray()
    }
}

function New-PublicPatchSummary {
    <#
    .SYNOPSIS
        Build a public summary from the private CLI result and the trusted generated catalog.
    .DESCRIPTION
        Only catalog names, declared targets and the matching bundle version can leave this
        function. Options, step messages, failure reasons and other report fields are never copied.
        Dot-source patch-target.ps1 too. ExpectedPackageName/Version hold a result to the native
        APK preflight when supplied. Unsupported forced builds are omitted from this summary.
    #>
    param(
        [object]$Report,
        [object]$PatchList,
        [object]$RequestedNames,
        [object]$BundleVersion,
        [object]$OutputPath,
        [object]$CliExitCode = 0,
        [object]$ExpectedPackageName,
        [object]$ExpectedPackageVersion
    )

    $ErrorActionPreference = 'Stop'
    $summary = [pscustomobject][ordered]@{
        packageName = $null
        packageVersion = $null
        bundleVersion = $null
        requestedPatches = [string[]]@()
        appliedPatches = [string[]]@()
        requestedCount = 0
        appliedCount = 0
        failureCodes = [string[]]@()
    }
    $codes = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
    if (($CliExitCode -isnot [int] -and $CliExitCode -isnot [long]) -or $CliExitCode -ne 0) {
        [void]$codes.Add('CLI_FAILED')
    }

    # The generated catalog is the trust boundary, not any metadata in the CLI result. Finish
    # validating it before publishing even one name. Its helpers can throw detailed private errors.
    try {
        if ($PatchList -isnot [pscustomobject]) { throw 'CATALOG_INVALID' }
        $versionProperty = $PatchList.PSObject.Properties['version']
        if ($null -eq $versionProperty -or $versionProperty.Value -isnot [string] -or
            $versionProperty.Value -cnotmatch '^v?\d+\.\d+\.\d+$') { throw 'CATALOG_INVALID' }
        $catalogVersion = $versionProperty.Value -creplace '^v', ''
        $patchesProperty = $PatchList.PSObject.Properties['patches']
        if ($null -eq $patchesProperty -or $patchesProperty.Value -isnot [System.Collections.IList]) {
            throw 'CATALOG_INVALID'
        }
        $catalogNames = [System.Collections.Generic.Dictionary[string, string]]::new(
            [System.StringComparer]::Ordinal)
        foreach ($patch in @($patchesProperty.Value)) {
            if ($patch -isnot [pscustomobject]) { throw 'CATALOG_INVALID' }
            $nameProperty = $patch.PSObject.Properties['name']
            if ($null -eq $nameProperty -or $nameProperty.Value -isnot [string] -or
                [string]::IsNullOrWhiteSpace($nameProperty.Value) -or
                $catalogNames.ContainsKey($nameProperty.Value)) { throw 'CATALOG_INVALID' }
            $catalogNames.Add($nameProperty.Value, $nameProperty.Value)
            $dependenciesProperty = $patch.PSObject.Properties['dependencies']
            if ($null -ne $dependenciesProperty) {
                if ($dependenciesProperty.Value -isnot [System.Collections.IList]) { throw 'CATALOG_INVALID' }
                foreach ($dependency in @($dependenciesProperty.Value)) {
                    if ($dependency -isnot [string] -or [string]::IsNullOrWhiteSpace($dependency)) {
                        throw 'CATALOG_INVALID'
                    }
                }
            }
        }
        $targets = @(Get-PatchTargets -PatchList $PatchList)
        if ($targets.Count -eq 0 -or @($targets | Where-Object {
            $_.PackageName -cnotmatch '^[a-z][a-z0-9_]*(?:\.[a-z][a-z0-9_]*)+$'
        }).Count -ne 0) { throw 'CATALOG_INVALID' }
    } catch {
        [void]$codes.Add('CATALOG_INVALID')
        $summary.failureCodes = [string[]]@($codes | Sort-Object)
        return $summary
    }

    if ($BundleVersion -is [string] -and $BundleVersion -cmatch '^\d+\.\d+\.\d+$' -and
        $BundleVersion -ceq $catalogVersion) {
        $summary.bundleVersion = $catalogVersion
    } else {
        [void]$codes.Add('BUNDLE_VERSION_INVALID')
    }
    $requested = [System.Collections.Generic.List[string]]::new()
    $requestedSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
    foreach ($name in @($RequestedNames)) {
        if ($name -isnot [string] -or -not $catalogNames.ContainsKey($name) -or -not $requestedSet.Add($name)) {
            [void]$codes.Add('REQUESTED_PATCHES_INVALID')
        } else {
            $requested.Add($catalogNames[$name])
        }
    }
    if ($requested.Count -eq 0) { [void]$codes.Add('REQUESTED_PATCHES_INVALID') }
    $summary.requestedPatches = $requested.ToArray()
    $summary.requestedCount = $requested.Count
    try {
        $dependencies = @(Get-PatchDependencyNames -PatchList $PatchList -RequestedNames $requested.ToArray())
        $allowed = [System.Collections.Generic.Dictionary[string, string]]::new([System.StringComparer]::Ordinal)
        foreach ($name in @($requested.ToArray()) + $dependencies) { $allowed[$name] = $name }
    } catch {
        [void]$codes.Add('CATALOG_INVALID')
        $summary.failureCodes = [string[]]@($codes | Sort-Object)
        return $summary
    }

    try {
        if ($Report -isnot [pscustomobject]) { throw 'REPORT_INVALID' }
        $packageProperty = $Report.PSObject.Properties['packageName']
        $versionProperty = $Report.PSObject.Properties['packageVersion']
        $matching = @(if ($null -ne $packageProperty -and $packageProperty.Value -is [string] -and
            $null -ne $versionProperty -and $versionProperty.Value -is [string]) {
            $targets | Where-Object {
                $_.PackageName -ceq $packageProperty.Value -and $_.PackageVersions -ccontains $versionProperty.Value
            }
        })
        $expectedSupplied = $null -ne $ExpectedPackageName -or $null -ne $ExpectedPackageVersion
        if ($matching.Count -eq 1 -and (-not $expectedSupplied -or
            ($ExpectedPackageName -is [string] -and $ExpectedPackageVersion -is [string] -and
                $ExpectedPackageName -ceq $packageProperty.Value -and $ExpectedPackageVersion -ceq $versionProperty.Value))) {
            $summary.packageName = $matching[0].PackageName
            $summary.packageVersion = @($matching[0].PackageVersions | Where-Object { $_ -ceq $versionProperty.Value })[0]
        } else {
            [void]$codes.Add('TARGET_UNSUPPORTED')
        }
        foreach ($field in @('appliedPatches', 'failedPatches', 'patchingSteps')) {
            $property = $Report.PSObject.Properties[$field]
            if ($null -eq $property -or $property.Value -isnot [System.Collections.IList]) { throw 'REPORT_INVALID' }
        }
        $appliedSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
        $applied = [System.Collections.Generic.List[string]]::new()
        foreach ($row in @($Report.appliedPatches)) {
            $nameProperty = if ($null -ne $row) { $row.PSObject.Properties['name'] } else { $null }
            if ($row -isnot [string] -and ($row -isnot [pscustomobject] -or
                $null -eq $nameProperty -or $nameProperty.Value -isnot [string])) {
                [void]$codes.Add('PATCH_NAMES_INVALID')
            }
        }
        foreach ($name in @(Get-ReportPatchNames -Entries $Report.appliedPatches)) {
            if (-not $allowed.ContainsKey($name)) {
                [void]$codes.Add('PATCH_NAMES_INVALID')
            } elseif ($appliedSet.Add($name)) {
                $applied.Add($allowed[$name])
            }
        }
        $summary.appliedPatches = $applied.ToArray()
        $summary.appliedCount = $applied.Count
        $apkPath = if ($OutputPath -is [string]) { $OutputPath } else { '' }
        $validation = Test-PatchingReport -Report $Report -ExpectedNames $requested.ToArray() `
            -AllowedDependencyNames $dependencies -OutputPath $apkPath `
            -ExpectedPackageName $summary.packageName -ExpectedPackageVersion $summary.packageVersion
        foreach ($code in @($validation.FailureCodes)) { [void]$codes.Add($code) }
    } catch {
        [void]$codes.Add('REPORT_INVALID')
    }
    $summary.failureCodes = [string[]]@($codes | Sort-Object)
    return $summary
}

function Export-PublicPatchSummary {
    <#
    .SYNOPSIS
        Read a private CLI report and write only its allowlisted public summary to a separate file.
    .DESCRIPTION
        Returns Written, FailureCode and Summary. Read errors become REPORT_INVALID in the
        summary. Write/path errors return a fixed FailureCode, without an exception or a path.
        Atomic replacement preserves the private report and APK, including hard-linked aliases.
    #>
    param(
        [object]$ReportPath,
        [object]$SummaryPath,
        [object]$PatchList,
        [object]$RequestedNames,
        [object]$BundleVersion,
        [object]$OutputPath,
        [object]$CliExitCode = 0,
        [object]$ExpectedPackageName,
        [object]$ExpectedPackageVersion
    )
    $ErrorActionPreference = 'Stop'
    $report = $null
    try {
        if ($ReportPath -is [string]) { $report = Get-Content -LiteralPath $ReportPath -Raw | ConvertFrom-Json }
    } catch { }
    $summary = New-PublicPatchSummary -Report $report -PatchList $PatchList -RequestedNames $RequestedNames `
        -BundleVersion $BundleVersion -OutputPath $OutputPath -CliExitCode $CliExitCode `
        -ExpectedPackageName $ExpectedPackageName -ExpectedPackageVersion $ExpectedPackageVersion
    $result = [pscustomobject]@{ Written = $false; FailureCode = $null; Summary = $summary }
    try {
        if ($SummaryPath -isnot [string] -or [string]::IsNullOrWhiteSpace($SummaryPath)) { throw 'SUMMARY_PATH_INVALID' }
        $destination = [System.IO.Path]::GetFullPath(
            $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($SummaryPath))
        if ([System.IO.Path]::GetExtension($destination) -ine '.json' -or
            (Test-Path -LiteralPath $destination -PathType Container)) { throw 'SUMMARY_PATH_INVALID' }
        # Resolve actual entries before comparing or writing. This covers parent junctions,
        # symbolic links and short names without confusing distinct hard-link entries.
        if (-not ('HushTelegram.Tooling.PublicSummaryPath' -as [type])) {
            Add-Type -TypeDefinition @'
using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using Microsoft.Win32.SafeHandles;
namespace HushTelegram.Tooling {
    public static class PublicSummaryPath {
        [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        private static extern SafeFileHandle CreateFileW(string path, uint access, uint share,
            IntPtr security, uint disposition, uint flags, IntPtr template);
        [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
        private static extern uint GetFinalPathNameByHandleW(SafeFileHandle handle,
            StringBuilder path, uint size, uint flags);
        public static string Resolve(string path) {
            var suffix = new Stack<string>();
            while (!File.Exists(path) && !Directory.Exists(path)) {
                suffix.Push(Path.GetFileName(path));
                path = Path.GetDirectoryName(path);
                if (String.IsNullOrEmpty(path)) throw new IOException("Path cannot be resolved.");
            }
            using (var handle = CreateFileW(path, 0, 7, IntPtr.Zero, 3, 0x02000000, IntPtr.Zero)) {
                if (handle.IsInvalid) throw new IOException("Path cannot be resolved.");
                var buffer = new StringBuilder(32768);
                uint length = GetFinalPathNameByHandleW(handle, buffer, (uint)buffer.Capacity, 0);
                if (length == 0 || length >= buffer.Capacity) throw new IOException("Path cannot be resolved.");
                path = buffer.ToString();
            }
            if (path.StartsWith(@"\\?\UNC\", StringComparison.OrdinalIgnoreCase)) path = @"\\" + path.Substring(8);
            else if (path.StartsWith(@"\\?\", StringComparison.Ordinal)) path = path.Substring(4);
            while (suffix.Count > 0) path = Path.Combine(path, suffix.Pop());
            return Path.GetFullPath(path);
        }
    }
}
'@
        }
        $destination = [HushTelegram.Tooling.PublicSummaryPath]::Resolve($destination)
        foreach ($privatePath in @($ReportPath, $OutputPath)) {
            if ($privatePath -isnot [string] -or [string]::IsNullOrWhiteSpace($privatePath)) { continue }
            $privateFullPath = [System.IO.Path]::GetFullPath(
                $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($privatePath))
            $privateFullPath = [HushTelegram.Tooling.PublicSummaryPath]::Resolve($privateFullPath)
            if ([string]::Equals($destination, $privateFullPath, [System.StringComparison]::OrdinalIgnoreCase)) {
                throw 'SUMMARY_PATH_INVALID'
            }
        }
    } catch {
        $result.FailureCode = 'SUMMARY_PATH_INVALID'
        return $result
    }
    $temporary = $null
    try {
        $temporary = Join-Path (Split-Path -Parent $destination) ('.public-patch-summary-' + [guid]::NewGuid().ToString('N') + '.tmp')
        [System.IO.File]::WriteAllText($temporary, ($summary | ConvertTo-Json -Depth 4) + "`n",
            [System.Text.UTF8Encoding]::new($false))
        if ([System.IO.File]::Exists($destination)) {
            [System.IO.File]::Replace($temporary, $destination, [NullString]::Value)
        } else {
            [System.IO.File]::Move($temporary, $destination)
        }
        $result.Written = $true
    } catch {
        $result.FailureCode = 'SUMMARY_WRITE_FAILED'
    } finally {
        if ($null -ne $temporary) { Remove-Item -LiteralPath $temporary -Force -ErrorAction SilentlyContinue }
    }
    return $result
}
