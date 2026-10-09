<#
.SYNOPSIS
    Verify a bounded selection and synthetic-options matrix on a declared official APK.
.DESCRIPTION
    Original CLI reports, options files and configured APKs belong in a private WorkDir.
    Console output uses fixed case identifiers and failure codes. Public patch summaries
    use the existing catalog allowlist. No APK is installed and no app is launched.
#>
[CmdletBinding()]
param(
    [string]$Apk,
    [string]$DesktopJar,
    [string]$WorkDir,
    [string]$Bundle,
    [string]$PatchList,
    [string]$Java,
    [string]$Aapt2,
    [string[]]$Case = @()
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'patch-report.ps1')
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
. (Join-Path $PSScriptRoot 'native-packaging.ps1')

function Get-SelectionStatusModel {
    param([string]$Root)
    $source = Join-Path $Root 'extensions/telegram/src/main/java/app/hushtelegram/extension/telegram/settings'
    $names = @{}
    foreach ($match in [regex]::Matches((Get-Content (Join-Path $source 'FamilyNames.java') -Raw),
        'public static final String ([A-Z_]+) = "([^"]+)";')) {
        $names[$match.Groups[1].Value] = $match.Groups[2].Value
    }
    $familyText = Get-Content (Join-Path $source 'PatchFamily.java') -Raw
    $families = @(foreach ($match in [regex]::Matches($familyText,
        '(?m)^\s+([A-Z_]+)\(FamilyNames\.([A-Z_]+), "([^"]+)"')) {
        if ($match.Groups[1].Value -cne $match.Groups[2].Value -or -not $names.ContainsKey($match.Groups[1].Value)) {
            throw 'STATUS_MODEL_INVALID'
        }
        [pscustomobject]@{ Enum = $match.Groups[1].Value; Name = $names[$match.Groups[1].Value]; Status = $match.Groups[3].Value }
    })
    $capabilities = @(foreach ($match in [regex]::Matches($familyText,
        '(?m)^\s+([A-Z_]+)\(([A-Z_]+), "([^"]+)", "')) {
        [pscustomobject]@{ Enum = $match.Groups[1].Value; Family = $match.Groups[2].Value; Status = $match.Groups[3].Value }
    })
    $all = @($families.Status) + @($capabilities.Status)
    $declared = @([regex]::Matches((Get-Content (Join-Path $source 'SettingsStatus.java') -Raw),
        'public static boolean ([A-Za-z]+)\(\)') | ForEach-Object { $_.Groups[1].Value })
    if ($families.Count -ne 52 -or $all.Count -ne @($all | Sort-Object -Unique).Count -or
        (Compare-Object ($all | Sort-Object) ($declared | Sort-Object))) { throw 'STATUS_MODEL_INVALID' }
    [pscustomobject]@{ Families = $families; Capabilities = $capabilities; StatusNames = $all }
}

function Get-PatchSelectionCases {
    param([object]$Catalog, [object]$StatusModel)
    $api = 'Use registered Telegram API credentials'
    $maps = 'Use registered Maps API key'
    $all = @($Catalog.patches.name)
    $defaults = @($Catalog.patches | Where-Object { $_.use -is [bool] -and $_.use } | ForEach-Object { $_.name })
    $required = @($StatusModel.Families.Name) + @('HushTelegram settings', $api, $maps)
    if ($all.Count -ne 55 -or $defaults.Count -ne 53 -or $defaults -ccontains $api -or $defaults -ccontains $maps -or
        @($Catalog.patches | Where-Object { $_.use -isnot [bool] }).Count -or
        (Compare-Object ($all | Sort-Object) ($required | Sort-Object) -CaseSensitive)) { throw 'CATALOG_INVALID' }
    $syntheticApiId = '19077001'
    $hash = 'd0c0d0c0d0c0d0c0d0c0d0c0d0c0d0c0'
    $key = 'AIza' + 'SelectionCanary' + ('0123456789' * 2)
    $sentinel = 'private_credential_canary_742901'
    $configured = @{ $api = @{ apiId = $syntheticApiId; apiHash = $hash }; $maps = @{ apiKey = $key } }
    function New-SelectionCase([string]$Id, [string[]]$Names, [object]$Options = @{},
        [bool]$Failure = $false, [bool]$ApiConfigured = $false, [bool]$MapsConfigured = $false,
        [bool]$Default = $false, [bool]$Malformed = $false) {
        [pscustomobject]@{ Id = $Id; Names = $Names; Options = $Options; Failure = $Failure
            ApiConfigured = $ApiConfigured; MapsConfigured = $MapsConfigured; Default = $Default; Malformed = $Malformed
            ApiId = $syntheticApiId; ApiHash = $hash; MapsKey = $key; Canaries = @($syntheticApiId, $hash, $key, $sentinel) }
    }
    New-SelectionCase 'default53' $defaults -Default $true
    New-SelectionCase 'full55' $all
    New-SelectionCase 'settings-only' @('HushTelegram settings')
    foreach ($family in $StatusModel.Families) {
        New-SelectionCase ('single-' + $family.Enum.ToLowerInvariant().Replace('_', '-')) @($family.Name)
    }
    New-SelectionCase 'links-pair' @('Open links externally', 'Strip link tracking')
    New-SelectionCase 'previews-camera-pair' @('Disable draft link previews', 'Gallery camera on tap')
    New-SelectionCase 'credentials-unset' @($api, $maps)
    New-SelectionCase 'credentials-null' @($api, $maps) @{ $api = @{ apiId = $null; apiHash = $null }; $maps = @{ apiKey = $null } }
    New-SelectionCase 'credentials-configured' @($api, $maps) $configured -ApiConfigured $true -MapsConfigured $true
    # The upstream loader accepts a numeric primitive. This ID collided with the configured ID in the old marker.
    $numeric = New-SelectionCase 'api-number-id' @($api) @{ $api = @{ apiId = 19077129; apiHash = $hash } } -ApiConfigured $true
    $numeric.ApiId = '19077129'
    $numeric.Canaries += $numeric.ApiId
    $numeric
    New-SelectionCase 'maps-configured-only' @($maps) @{ $maps = $configured[$maps] } -MapsConfigured $true
    New-SelectionCase 'full-configured' $all $configured -ApiConfigured $true -MapsConfigured $true
    New-SelectionCase 'api-incomplete-id' @($api) @{ $api = @{ apiId = $syntheticApiId } } -Failure $true
    New-SelectionCase 'api-incomplete-hash' @($api) @{ $api = @{ apiHash = $hash } } -Failure $true
    New-SelectionCase 'api-invalid-id' @($api) @{ $api = @{ apiId = $sentinel; apiHash = $hash } } -Failure $true
    New-SelectionCase 'api-invalid-hash' @($api) @{ $api = @{ apiId = $syntheticApiId; apiHash = $sentinel } } -Failure $true
    New-SelectionCase 'api-array-id' @($api) @{ $api = @{ apiId = @($sentinel); apiHash = $hash } } -Failure $true
    New-SelectionCase 'api-object-hash' @($api) @{ $api = @{ apiId = $syntheticApiId; apiHash = @{ private = $sentinel } } } -Failure $true
    New-SelectionCase 'api-boolean-id' @($api) @{ $api = @{ apiId = $true; apiHash = $hash } } -Failure $true
    New-SelectionCase 'maps-invalid' @($maps) @{ $maps = @{ apiKey = $sentinel } } -Failure $true
    # CLI 1.18 rejects assigning a list to a string option and leaves the optional value unset.
    New-SelectionCase 'maps-array-noop' @($maps) @{ $maps = @{ apiKey = @($sentinel) } }
    New-SelectionCase 'maps-boolean' @($maps) @{ $maps = @{ apiKey = $true } } -Failure $true
    New-SelectionCase 'options-malformed' @($api, $maps) -Failure $true -Malformed $true
}

function Get-SelectionExpectation {
    param([object]$Catalog, [object]$StatusModel, [object]$Selection)
    $dependencies = @(Get-PatchDependencyNames -PatchList $Catalog -RequestedNames $Selection.Names)
    $closure = @($Selection.Names) + @($dependencies | Where-Object { $Catalog.patches.name -ccontains $_ })
    $flags = [ordered]@{}
    foreach ($family in $StatusModel.Families) { $flags[$family.Status] = $closure -ccontains $family.Name }
    foreach ($capability in $StatusModel.Capabilities) {
        $family = $StatusModel.Families | Where-Object { $_.Enum -ceq $capability.Family }
        if (@($family).Count -ne 1) { throw 'STATUS_MODEL_INVALID' }
        $flags[$capability.Status] = $closure -ccontains $family.Name
    }
    [pscustomobject]@{ settings = $closure -ccontains 'HushTelegram settings'; links = $closure -ccontains 'Open links externally'
        api = $Selection.ApiConfigured; maps = $Selection.MapsConfigured
        apiId = [int]$Selection.ApiId; apiHash = $Selection.ApiHash; mapsKey = $Selection.MapsKey
        flags = $flags; closure = $closure; dependencies = $dependencies }
}

function New-SelectionOptionsDocument {
    param([object]$Catalog, [object]$Selection, [string]$BundleName, [string]$BundleHash)
    $entries = [ordered]@{}
    foreach ($name in $Catalog.patches.name) {
        $options = if ($Selection.Options.ContainsKey($name)) { $Selection.Options[$name] } else { @{} }
        $entries[$name] = [ordered]@{ enabled = $Selection.Names -ccontains $name; options = $options }
    }
    # The CLI 1.18 loader reads an array of PatchBundle objects, identified by SHA256 or basename.
    ConvertTo-Json -InputObject @([ordered]@{ meta = [ordered]@{ source = $BundleName; sha256 = $BundleHash }; patches = $entries }) -Depth 12
}

function Test-SelectionPublicText {
    param([string]$Text, [string[]]$Canaries)
    foreach ($canary in $Canaries) {
        if ($Text.IndexOf($canary, [StringComparison]::OrdinalIgnoreCase) -ge 0) { return $false }
    }
    return $true
}

function Test-SelectionRefusal {
    param([object]$Selection, [object]$Report, [string]$PrivateLog, [object]$Stock)
    if ($null -eq $Report -or $Report.appliedPatches -isnot [array] -or $Report.failedPatches -isnot [array] -or
        $Report.patchingSteps -isnot [array] -or $Report.appliedPatches.Count) { return $false }
    $exceptions = @([regex]::Matches($PrivateLog,
        '(?m)^[ \t]*(?:(?:Caused by|Suppressed):[ \t]*|Exception in thread "[^"\r\n]+" )?([\w.$]+(?:Exception|Error))(?::|[ \t]*\r?$)') | ForEach-Object { $_.Groups[1].Value })
    if ($Selection.Malformed) {
        return $Report.failedPatches.Count -eq 0 -and $Report.patchingSteps.Count -eq 0 -and
            $null -eq $Report.PSObject.Properties['success'] -and
            $null -eq $Report.PSObject.Properties['packageName'] -and
            $null -eq $Report.PSObject.Properties['packageVersion'] -and
            $exceptions.Count -eq 1 -and $exceptions[0] -ceq 'kotlinx.serialization.json.JsonDecodingException' -and
            $PrivateLog -cmatch '(?m)^\s+at app\.morphe\.desktop\.command\.model\.PatchBundle\$\$serializer\.deserialize\(PatchOptionsFile\.kt:\d+\)' -and
            $PrivateLog -cmatch '(?m)^\s+at app\.morphe\.desktop\.command\.PatchCommand\.call\('
    }
    $suffix = switch -CaseSensitive ($Selection.Id) {
        { $_ -cin @('api-incomplete-id', 'api-incomplete-hash', 'api-array-id') } { 'supply both apiId and apiHash.' }
        { $_ -cin @('api-invalid-id', 'api-boolean-id') } { 'apiId must be a positive 32-bit decimal integer.' }
        { $_ -cin @('api-invalid-hash', 'api-object-hash') } { 'apiHash must contain exactly 32 hexadecimal characters.' }
        { $_ -cin @('maps-invalid', 'maps-boolean') } { 'apiKey must be a 39-character Google API key.' }
        default { $null }
    }
    if (-not $suffix -or $Selection.Names.Count -ne 1) { return $false }
    $patchName = $Selection.Names[0]
    $reason = 'app.morphe.patcher.patch.PatchException: ' + $patchName + ': ' + $suffix
    if ($Report.success -isnot [bool] -or $Report.success -or $Report.failedPatches.Count -ne 1 -or
        $Report.patchingSteps.Count -ne 1 -or $Report.packageName -cne $Stock.package -or
        $Report.packageVersion -cne $Stock.versionName) { return $false }
    $failure = $Report.failedPatches[0]
    $step = $Report.patchingSteps[0]
    return $failure.patch.name -ceq $patchName -and ([string]$failure.reason -split '\r?\n')[0] -ceq $reason -and
        $step.step -ceq 'PATCHING' -and $step.success -is [bool] -and -not $step.success -and
        $step.message -ceq ('app.morphe.desktop.command.PatchFailedException: FAILED: ' + $patchName) -and
        $exceptions.Count -eq 1 -and $exceptions[0] -ceq 'app.morphe.patcher.patch.PatchException' -and
        $PrivateLog -cmatch ('(?m)^' + [regex]::Escape($reason) + '\r?$')
}

function Invoke-SelectionTool {
    param([string]$Program, [string[]]$Arguments, [string]$PrivateOutput)
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $lines = @(& $Program @Arguments 2>&1 | ForEach-Object { "$_" })
        $code = $LASTEXITCODE
    } finally { $ErrorActionPreference = $preference }
    [IO.File]::WriteAllText($PrivateOutput, ($lines -join "`n") + "`n", [Text.UTF8Encoding]::new($false))
    return $code
}

function Invoke-PatchSelectionMatrix {
    param([string]$Apk, [string]$DesktopJar, [string]$WorkDir, [string]$Bundle,
        [string]$PatchList, [string]$Java, [string]$Aapt2, [string[]]$Case)
    $root = Split-Path -Parent $PSScriptRoot
    $Java = Resolve-Java -Explicit $Java
    $DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $root -Required
    $compiler = Join-Path (Split-Path -Parent $Java) 'javac.exe'
    $Aapt2 = Resolve-Aapt2 -Explicit $Aapt2 -Root $root
    if (-not $PatchList) { $PatchList = Join-Path $root 'patches-list.json' }
    $version = Get-BundleVersion -Root $root
    if (-not $Bundle) { $Bundle = Get-ReleaseBundlePath -Root $root -Version $version }
    foreach ($path in @($Apk, $DesktopJar, $Bundle, $PatchList, $compiler)) {
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw 'INPUT_INVALID' }
    }
    $catalog = Get-Content -LiteralPath $PatchList -Raw | ConvertFrom-Json
    $model = Get-SelectionStatusModel -Root $root
    $plans = @(Get-PatchSelectionCases -Catalog $catalog -StatusModel $model)
    if ($Case.Count) {
        if (@($Case | Where-Object { $plans.Id -cnotcontains $_ }).Count) { throw 'CASE_INVALID' }
        if ($Case -ccontains 'full-configured' -and $Case -cnotcontains 'full55') { $Case += 'full55' }
        $plans = @($plans | Where-Object { $Case -ccontains $_.Id })
    }
    $stock = Get-ApkManifestFacts -Apk $Apk -Aapt2 $Aapt2
    $target = Get-PatchTarget -PatchList $catalog -PackageName $stock.package
    if (-not (Test-DeclaredBuild -Target $target -VersionName $stock.versionName -VersionCode $stock.versionCode)) {
        throw 'TARGET_UNSUPPORTED'
    }
    New-Item -ItemType Directory -Force -Path $WorkDir | Out-Null
    $workRoot = (Resolve-Path -LiteralPath $WorkDir).Path
    $run = Resolve-WithinRoot -Path (Join-Path $workRoot ('selections-' + [guid]::NewGuid().ToString('N'))) -Root $workRoot
    New-Item -ItemType Directory -Path $run | Out-Null
    $classes = Join-Path $run 'classes'
    New-Item -ItemType Directory -Path $classes | Out-Null
    $compiled = Invoke-SelectionTool -Program $compiler -Arguments @('-cp', $DesktopJar, '-d', $classes,
        (Join-Path $PSScriptRoot 'DexDiff.java'), (Join-Path $PSScriptRoot 'SelectionCheck.java'),
        (Join-Path $PSScriptRoot 'ResourceTableCheck.java')) -PrivateOutput (Join-Path $run 'compiler-private.txt')
    if ($compiled -ne 0) { throw 'CHECKER_COMPILE_FAILED' }
    $classPath = $classes + [IO.Path]::PathSeparator + $DesktopJar
    $sourceHash = Get-Sha256Hex -Path $Apk
    $bundleHash = (Get-Sha256Hex -Path $Bundle).ToLowerInvariant()
    $evidence = [Collections.Generic.List[object]]::new()
    $elapsed = [Diagnostics.Stopwatch]::StartNew()
    foreach ($selection in $plans) {
        $caseDir = Join-Path $run $selection.Id
        New-Item -ItemType Directory -Path $caseDir | Out-Null
        $output = Join-Path $caseDir 'configured-private.apk'
        $reportPath = Join-Path $caseDir 'cli-private.json'
        $summaryPath = Join-Path $caseDir 'public-summary.json'
        $temporary = Join-Path $caseDir 'temporary-private'
        $optionPath = Join-Path $caseDir 'options-private.json'
        $expected = Get-SelectionExpectation -Catalog $catalog -StatusModel $model -Selection $selection
        $expectationPath = Join-Path $caseDir 'expectation-private.json'
        [IO.File]::WriteAllText($expectationPath, ($expected | ConvertTo-Json -Depth 8), [Text.UTF8Encoding]::new($false))
        $arguments = @('-Xmx2g', '-XX:ActiveProcessorCount=2', '-jar', $DesktopJar, 'patch', '--unsigned', '-p', $Bundle,
            '-o', $output, '-t', $temporary, '-r', $reportPath)
        if (-not $selection.Default) {
            $arguments += '--exclusive'
            foreach ($name in $selection.Names) { $arguments += @('-e', $name) }
        }
        if ($selection.Options.Count -or $selection.Malformed) {
            $document = if ($selection.Malformed) { '[{"private":"' + $selection.Canaries[-1] + '"' }
                else { New-SelectionOptionsDocument -Catalog $catalog -Selection $selection -BundleName (Split-Path -Leaf $Bundle) -BundleHash $bundleHash }
            [IO.File]::WriteAllText($optionPath, $document, [Text.UTF8Encoding]::new($false))
            $optionHash = Get-Sha256Hex -Path $optionPath
            $arguments += @('--options-file', $optionPath)
        }
        $arguments += $Apk
        $casePassed = $false
        try {
            $cliCode = Invoke-SelectionTool -Program $Java -Arguments $arguments -PrivateOutput (Join-Path $caseDir 'cli-private.txt')
            $public = Export-PublicPatchSummary -ReportPath $reportPath -SummaryPath $summaryPath -PatchList $catalog `
                -RequestedNames $selection.Names -BundleVersion $version -OutputPath $output -CliExitCode $cliCode `
                -ExpectedPackageName $stock.package -ExpectedPackageVersion $stock.versionName
            if (-not $public.Written -or -not (Test-SelectionPublicText -Text (Get-Content $summaryPath -Raw) -Canaries $selection.Canaries)) {
                throw 'PUBLIC_SUMMARY_FAILED'
            }
            if ((Get-Sha256Hex -Path $Apk) -cne $sourceHash -or
                ((Test-Path $optionPath) -and (Get-Sha256Hex -Path $optionPath) -cne $optionHash)) { throw 'INPUT_MUTATED' }
            if ($selection.Failure) {
                if ($cliCode -eq 0 -or (Test-Path -LiteralPath $output)) { throw 'REFUSAL_NOT_ATOMIC' }
                $failedReport = if (Test-Path $reportPath) { Get-Content $reportPath -Raw | ConvertFrom-Json } else { $null }
                if ($null -ne $failedReport -and @(Get-ReportPatchNames $failedReport.appliedPatches).Count) { throw 'REFUSAL_NOT_ATOMIC' }
                if (-not (Test-SelectionRefusal -Selection $selection -Report $failedReport -Stock $stock `
                    -PrivateLog (Get-Content -LiteralPath (Join-Path $caseDir 'cli-private.txt') -Raw))) { throw 'REFUSAL_REASON_FAILED' }
                $evidence.Add([pscustomobject]@{ case = $selection.Id; packageName = $stock.package; refused = $true; passed = $true })
                $casePassed = $true
                Write-Host "[selections] $($selection.Id) REFUSAL_PASSED"
                continue
            }
            $report = Get-Content $reportPath -Raw | ConvertFrom-Json
            $valid = Test-PatchingReport -Report $report -ExpectedNames $selection.Names -AllowedDependencyNames $expected.dependencies `
                -OutputPath $output -ExpectedPackageName $stock.package -ExpectedPackageVersion $stock.versionName
            if ($cliCode -ne 0 -or -not $valid.Valid) { throw 'PATCH_REPORT_FAILED' }
            # The CLI report lists selected named patches, not implicitly executed dependencies.
            # SelectionCheck proves the settings closure through its actual entry hooks and classes.
            $patched = Get-ApkManifestFacts -Apk $output -Aapt2 $Aapt2
            $floor = if ($expected.settings) { [Math]::Max(28, [int]$stock.minSdk) } else { [int]$stock.minSdk }
            if ($patched.package -cne $stock.package -or $patched.versionName -cne $stock.versionName -or
                $patched.versionCode -cne $stock.versionCode -or [int]$patched.minSdk -ne $floor) { throw 'MANIFEST_FACTS_FAILED' }
            $delta = @(ConvertTo-ManifestDeltaEntries -Delta (Get-ManifestDelta -Stock $stock -Patched $patched))
            $allowed = if ($expected.settings) { @('exported-added activity-alias:app.hushtelegram.extension.telegram.settings.OpenSettings') } else { @() }
            if (Compare-Object @($delta | Sort-Object) @($allowed | Sort-Object)) { throw 'MANIFEST_DELTA_FAILED' }
            $compiledPath = Join-Path $caseDir 'compiled-private.json'
            $checkerArguments = @('-Xmx2g', '-XX:ActiveProcessorCount=2', '-cp', $classPath,
                'SelectionCheck', $Apk, $output, $expectationPath, $compiledPath)
            if ($selection.Id -ceq 'full-configured') {
                $baseline = Join-Path $run 'full55-private.apk'
                if (-not (Test-Path -LiteralPath $baseline -PathType Leaf)) { throw 'FULL_BASELINE_MISSING' }
                $checkerArguments += $baseline
            }
            $checkCode = Invoke-SelectionTool -Program $Java -Arguments $checkerArguments -PrivateOutput (Join-Path $caseDir 'compiled-private.txt')
            if ($checkCode -ne 0) { throw 'COMPILED_SELECTION_FAILED' }
            $facts = Get-Content $compiledPath -Raw | ConvertFrom-Json
            $resourcePath = Join-Path $caseDir 'resources-private.txt'
            $resourceCode = Invoke-SelectionTool -Program $Java -Arguments @('-Xmx2g', '-XX:ActiveProcessorCount=2', '-cp', $classPath,
                'ResourceTableCheck', $Apk, $output, $resourcePath) -PrivateOutput (Join-Path $caseDir 'resources-console-private.txt')
            $resourceText = Get-Content $resourcePath -Raw
            if ($resourceCode -ne 0 -or $resourceText -cnotmatch '\[resources\] rewritten values: 0' -or
                $resourceText -cnotmatch '\[resources\] renamed by the rebuild[^\r\n]*: 0' -or
                $resourceText -cnotmatch '\[resources\] added resources: 0') { throw 'RESOURCE_PRESERVATION_FAILED' }
            $native = Get-NativePackagingEvidence -StockApk $Apk -PatchedApk $output -Java $Java -Aapt2 $Aapt2 `
                -ReportPath (Join-Path $caseDir 'native-private.json')
            if ($expected.settings) {
                # Preserve the full validator's nonempty-extension premises and all mutation contracts.
                $dexCode = Invoke-SelectionTool -Program $Java -Arguments @('-Xmx2g', '-XX:ActiveProcessorCount=2', '-cp', $classPath, 'DexDiff',
                    $Apk, $output, (Join-Path $caseDir 'registers-private.txt'),
                    (Join-Path $PSScriptRoot 'injected-register-removal-allowlist.txt'),
                    (Join-Path $PSScriptRoot 'injected-mutation-contracts.txt'), $Apk) -PrivateOutput (Join-Path $caseDir 'registers-console-private.txt')
                if ($dexCode -ne 0) { throw 'STRUCTURAL_CONTRACT_FAILED' }
            }
            $evidence.Add([pscustomobject]@{ case = $selection.Id; packageName = $stock.package; refused = $false; passed = $true
                settings = $facts.settings; flags = $facts.flags; minSdk = $floor; closure = $expected.closure
                apiLiteralChanges = $facts.apiLiteralChanges; nativeVersionChanges = $facts.nativeVersionChanges; mapsValueChanges = $facts.mapsValueChanges
                changedMethods = $facts.changedMethods; addedMethods = $facts.addedMethods; structuralFindings = $facts.structuralFindings
                nativeEntries = $native.NativeLibraries.stock.nativeEntryCount; zipalignPassed = $native.ZipAlignment.passed })
            $casePassed = $true
            if ($selection.Id -ceq 'full55') { Copy-Item -LiteralPath $output -Destination (Join-Path $run 'full55-private.apk') }
            Write-Host "[selections] $($selection.Id) SELECTION_PASSED"
        } catch {
            # CLI and Java failures can contain option values. Only this fixed code reaches the console.
            [IO.File]::WriteAllText((Join-Path $caseDir 'failure-private.txt'), $_.Exception.ToString(), [Text.UTF8Encoding]::new($false))
            Write-Host "[selections] $($selection.Id) CASE_FAILED"
            throw 'MATRIX_FAILED'
        } finally {
            Remove-GeneratedPath -Path $temporary -Root $workRoot
            if ($casePassed -and (Test-Path -LiteralPath $output)) { Remove-GeneratedPath -Path $output -Root $workRoot }
            [IO.File]::WriteAllText((Join-Path $run 'matrix-private.json'), (ConvertTo-Json -InputObject $evidence.ToArray() -Depth 8) + "`n", [Text.UTF8Encoding]::new($false))
        }
    }
    $elapsed.Stop()
    [IO.File]::WriteAllText((Join-Path $run 'matrix-private.json'), (ConvertTo-Json -InputObject $evidence.ToArray() -Depth 8) + "`n", [Text.UTF8Encoding]::new($false))
    Write-Host "[selections] MATRIX_PASSED cases=$($plans.Count) seconds=$([int]$elapsed.Elapsed.TotalSeconds)"
}

if ($MyInvocation.InvocationName -ne '.') {
    try { Invoke-PatchSelectionMatrix @PSBoundParameters; exit 0 } catch { Write-Host '[selections] MATRIX_FAILED'; exit 1 }
}
