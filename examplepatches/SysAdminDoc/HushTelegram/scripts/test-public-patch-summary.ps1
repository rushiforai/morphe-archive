<#
.SYNOPSIS
    Check public patch summaries against independent CLI-shaped reports and private canaries.
.DESCRIPTION
    Uses the v1.17.0 PatchingResult, SerializablePatch and FailedPatch JSON shapes, not an
    exporter-generated input. No real credential, APK, network or device is used.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'patch-report.ps1')
$catalog = Get-Content -LiteralPath (Join-Path $Root 'patches-list.json') -Raw | ConvertFrom-Json
$bundleVersion = $catalog.version -creplace '^v', ''
$requestedNames = @('Use registered Telegram API credentials', 'Use registered Maps API key')
$canaries = @('987654321', '00112233445566778899aabbccddeeff',
    'AIza_SYNTHETIC_PRIVATE_MAPS_CANARY', 'synthetic-private-keystore-password',
    'synthetic-private-path', 'synthetic-private-command', 'synthetic-private-error')
$allowedCodes = @('REPORT_INVALID', 'REPORT_FAILED', 'PATCHING_STEP_FAILED', 'PATCH_FAILED',
    'PATCH_SET_INVALID', 'TARGET_UNSUPPORTED', 'APK_INVALID', 'CLI_FAILED', 'CATALOG_INVALID',
    'BUNDLE_VERSION_INVALID', 'REQUESTED_PATCHES_INVALID', 'PATCH_NAMES_INVALID')
$checks = 0

function Assert-True([bool]$Condition, [string]$Message) {
    $script:checks++
    if (-not $Condition) { throw $Message }
}
function Assert-NoCanary([object]$Value) {
    $json = $Value | ConvertTo-Json -Depth 30 -Compress
    foreach ($canary in $canaries) {
        Assert-True (-not $json.Contains($canary)) 'Private input appeared in public output.'
    }
}
function Assert-Summary([object]$Summary) {
    Assert-NoCanary $Summary
    $keys = @('packageName', 'packageVersion', 'bundleVersion', 'requestedPatches',
        'appliedPatches', 'requestedCount', 'appliedCount', 'failureCodes')
    Assert-True ((@($Summary.PSObject.Properties.Name | Sort-Object) -join ',') -ceq
        (($keys | Sort-Object) -join ',')) 'The public summary contains an unexpected field.'
    Assert-True ($Summary.requestedCount -eq @($Summary.requestedPatches).Count -and
        $Summary.appliedCount -eq @($Summary.appliedPatches).Count) 'Published counts do not match published names.'
    Assert-True (@($Summary.failureCodes | Where-Object { $allowedCodes -cnotcontains $_ }).Count -eq 0) `
        'An unfixed failure code appeared in the summary.'
}
function Copy-Json([object]$Value) { $Value | ConvertTo-Json -Depth 30 | ConvertFrom-Json }
function Invoke-Summary {
    param([object]$Report, [object]$Names = $requestedNames, [object]$Catalog = $catalog,
        [object]$Version = $bundleVersion, [object]$Apk = $testApk, [object]$ExitCode = 0,
        [object]$ExpectedPackage, [object]$ExpectedVersion)
    $captured = @(New-PublicPatchSummary -Report $Report -PatchList $Catalog -RequestedNames $Names `
        -BundleVersion $Version -OutputPath $Apk -CliExitCode $ExitCode `
        -ExpectedPackageName $ExpectedPackage -ExpectedPackageVersion $ExpectedVersion *>&1)
    Assert-NoCanary $captured
    Assert-True ($captured.Count -eq 1 -and $captured[0] -is [pscustomobject]) `
        'The summary builder emitted extra output or an error.'
    Assert-Summary $captured[0]
    return $captured[0]
}
function Invoke-Export {
    param([object]$ReportPath = $privateReport, [object]$SummaryPath = $publicSummary,
        [object]$Apk = $testApk)
    $captured = @(Export-PublicPatchSummary -ReportPath $ReportPath -SummaryPath $SummaryPath `
        -PatchList $catalog -RequestedNames $requestedNames -BundleVersion $bundleVersion -OutputPath $Apk *>&1)
    Assert-NoCanary $captured
    Assert-True ($captured.Count -eq 1 -and $captured[0] -is [pscustomobject]) `
        'The file exporter emitted extra output or an error.'
    Assert-True ((@($captured[0].PSObject.Properties.Name | Sort-Object) -join ',') -ceq
        'FailureCode,Summary,Written') 'The export result contains an unexpected field.'
    Assert-True ($null -eq $captured[0].FailureCode -or
        @('SUMMARY_PATH_INVALID', 'SUMMARY_WRITE_FAILED') -ccontains $captured[0].FailureCode) `
        'The exporter returned an unfixed failure code.'
    Assert-Summary $captured[0].Summary
    return $captured[0]
}

# Handwritten from the upstream serializers. Options have arbitrary nested values, failed
# patches have a nested patch object, and success is absent when the default true is serialized.
$cliJson = @'
{
  "packageName": "org.telegram.messenger.web",
  "packageVersion": "12.10.6",
  "patchingSteps": [
    {"step": "PATCHING", "success": true},
    {"step": "COMPILING", "success": true, "message": "synthetic-private-error"}
  ],
  "appliedPatches": [
    {"name": "Use registered Telegram API credentials", "options": [
      {"key": "apiId", "value": 987654321},
      {"key": "apiHash", "value": "00112233445566778899aabbccddeeff"},
      {"key": "nested", "value": {"private": ["synthetic-private-keystore-password"]}}
    ]},
    {"name": "Use registered Maps API key", "options": [
      {"key": "apiKey", "value": "AIza_SYNTHETIC_PRIVATE_MAPS_CANARY"}
    ]}
  ],
  "failedPatches": [],
  "bundleVersion": "synthetic-private-error",
  "commandLine": "synthetic-private-command --keystore-password synthetic-private-keystore-password",
  "outputPath": "C:\\synthetic-private-path\\configured.apk",
  "keystore": "C:\\synthetic-private-path\\retained.jks"
}
'@
$baseReport = $cliJson | ConvertFrom-Json
$tempBase = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
$caseRoot = [System.IO.Path]::GetFullPath((Join-Path $tempBase ('hushtelegram-public-summary-' + [guid]::NewGuid().ToString('N'))))
$requiredPrefix = $tempBase.TrimEnd([System.IO.Path]::DirectorySeparatorChar) + [System.IO.Path]::DirectorySeparatorChar
if (-not $caseRoot.StartsWith($requiredPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw 'Refusing a public-summary test directory outside the temporary directory.'
}
try {
    New-Item -ItemType Directory -Path $caseRoot | Out-Null
    $testApk = Join-Path $caseRoot 'synthetic-private-path.apk'
    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::Open($testApk, [System.IO.Compression.ZipArchiveMode]::Create)
    try {
        foreach ($name in @('AndroidManifest.xml', 'classes.dex')) { [void]$archive.CreateEntry($name) }
    } finally { $archive.Dispose() }
    $privateReport = Join-Path $caseRoot 'synthetic-private-path-result.json'
    $publicSummary = Join-Path $caseRoot 'public-summary.json'
    [System.IO.File]::WriteAllText($privateReport, $cliJson)
    $reportHash = (Get-FileHash -LiteralPath $privateReport).Hash
    $apkHash = (Get-FileHash -LiteralPath $testApk).Hash

    $validation = Test-PatchingReport -Report $baseReport -ExpectedNames $requestedNames -OutputPath $testApk `
        -ExpectedPackageName 'org.telegram.messenger.web' -ExpectedPackageVersion '12.10.6'
    Assert-True ($validation.Valid -and @($validation.FailureCodes).Count -eq 0) `
        'The unchanged CLI-shaped success no longer satisfies the existing parser.'
    $summary = Invoke-Summary $baseReport
    Assert-True (@($summary.failureCodes).Count -eq 0 -and $summary.packageName -ceq 'org.telegram.messenger.web' -and
        $summary.packageVersion -ceq '12.10.6' -and $summary.bundleVersion -ceq $bundleVersion) `
        'The valid declared target or bundle version was lost.'
    Assert-True (($summary.requestedPatches -join '|') -ceq ($requestedNames -join '|') -and
        ($summary.appliedPatches -join '|') -ceq ($requestedNames -join '|')) 'The public patch names differ from the independent report.'
    $explicitSuccess = Copy-Json $baseReport
    Add-Member -InputObject $explicitSuccess -NotePropertyName success -NotePropertyValue $true
    Assert-True (@((Invoke-Summary $explicitSuccess).failureCodes).Count -eq 0) 'An explicit true success was rejected.'
    $beta = Copy-Json $baseReport
    $beta.packageName = 'org.telegram.messenger.beta'; $beta.packageVersion = '12.10.7'
    Assert-True (@((Invoke-Summary $beta).failureCodes).Count -eq 0) 'The catalog-declared beta was rejected.'
    $wrongNative = Invoke-Summary $beta -ExpectedPackage 'org.telegram.messenger.web' -ExpectedVersion '12.10.6'
    Assert-True ($wrongNative.failureCodes -ccontains 'TARGET_UNSUPPORTED' -and $null -eq $wrongNative.packageName) `
        'A report claiming the other supported target bypassed the native preflight.'

    $mutations = @(
        @{ Code = 'TARGET_UNSUPPORTED'; Change = { param($r) $r.packageName = 'synthetic-private-error' } },
        @{ Code = 'TARGET_UNSUPPORTED'; Change = { param($r) $r.packageName = @{ private = 'synthetic-private-error' } } },
        @{ Code = 'TARGET_UNSUPPORTED'; Change = { param($r) $r.packageName = 'ORG.TELEGRAM.MESSENGER.WEB' } },
        @{ Code = 'TARGET_UNSUPPORTED'; Change = { param($r) $r.packageVersion = '00112233445566778899aabbccddeeff' } },
        @{ Code = 'TARGET_UNSUPPORTED'; Change = { param($r) $r.packageVersion = '99.99.99' } },
        @{ Code = 'PATCH_NAMES_INVALID'; Change = { param($r) $r.appliedPatches[0].name = 'AIza_SYNTHETIC_PRIVATE_MAPS_CANARY' } },
        @{ Code = 'PATCH_NAMES_INVALID'; Change = { param($r) $r.appliedPatches[0].name = @('synthetic-private-error') } },
        @{ Code = 'PATCH_NAMES_INVALID'; Change = { param($r) $r.appliedPatches[0].name = @{ private = 'synthetic-private-error' } } },
        @{ Code = 'PATCH_NAMES_INVALID'; Change = { param($r) $r.appliedPatches[0].name = 987654321 } },
        @{ Code = 'PATCH_NAMES_INVALID'; Change = { param($r) $r.appliedPatches[0].PSObject.Properties.Remove('name') } },
        @{ Code = 'PATCH_NAMES_INVALID'; Change = { param($r) $r.appliedPatches += $null } },
        @{ Code = 'PATCH_SET_INVALID'; Change = { param($r) $r.appliedPatches += $r.appliedPatches[0] } },
        @{ Code = 'PATCH_SET_INVALID'; Change = { param($r) $r.appliedPatches = @($r.appliedPatches[0]) } },
        @{ Code = 'REPORT_FAILED'; Change = { param($r) Add-Member -InputObject $r -NotePropertyName success -NotePropertyValue $false } },
        @{ Code = 'REPORT_FAILED'; Change = { param($r) Add-Member -InputObject $r -NotePropertyName success -NotePropertyValue 'true' } },
        @{ Code = 'PATCHING_STEP_FAILED'; Change = { param($r) $r.patchingSteps[1].success = $false } },
        @{ Code = 'PATCHING_STEP_FAILED'; Change = { param($r) $r.patchingSteps[0].PSObject.Properties.Remove('success') } },
        @{ Code = 'PATCHING_STEP_FAILED'; Change = { param($r) $r.patchingSteps = @() } },
        @{ Code = 'REPORT_INVALID'; Change = { param($r) $r.patchingSteps = 'synthetic-private-error' } },
        @{ Code = 'REPORT_INVALID'; Change = { param($r) $r.failedPatches = @{ reason = 'synthetic-private-error' } } },
        @{ Code = 'REPORT_INVALID'; Change = { param($r) $r.appliedPatches = 'synthetic-private-error' } },
        @{ Code = 'REPORT_INVALID'; Change = { param($r) $r.PSObject.Properties.Remove('failedPatches') } }
    )
    foreach ($case in $mutations) {
        $report = Copy-Json $baseReport
        & $case.Change $report
        $answer = Invoke-Summary $report
        Assert-True ($answer.failureCodes -ccontains $case.Code) 'A malformed or failed report had no fixed failure code.'
        if ($case.Code -ceq 'TARGET_UNSUPPORTED') {
            Assert-True ($null -eq $answer.packageName -and $null -eq $answer.packageVersion) 'An invalid target was published.'
        }
    }
    foreach ($invalid in @($null, 'synthetic-private-error', @('synthetic-private-error'), [pscustomobject]@{})) {
        Assert-True ((Invoke-Summary $invalid).failureCodes -ccontains 'REPORT_INVALID') 'A non-report was accepted.'
    }
    foreach ($canary in $canaries) {
        foreach ($field in @('packageName', 'packageVersion', 'name')) {
            $report = Copy-Json $baseReport
            if ($field -ceq 'name') { $report.appliedPatches[0].name = $canary } else { $report.$field = $canary }
            $answer = Invoke-Summary $report
            $code = if ($field -ceq 'name') { 'PATCH_NAMES_INVALID' } else { 'TARGET_UNSUPPORTED' }
            Assert-True ($answer.failureCodes -ccontains $code) 'A credential in a purported public field was accepted.'
        }
    }
    $failed = Copy-Json $baseReport
    $failed.failedPatches = @([pscustomobject]@{
        patch = [pscustomobject]@{ name = 'synthetic-private-error'; options = @(@{ key = 'apiId'; value = 987654321 }) }
        reason = ($canaries -join ' ') + ' C:\synthetic-private-path\retained.jks'
    })
    Assert-True ((Invoke-Summary $failed).failureCodes -ccontains 'PATCH_FAILED') 'A nested CLI failed patch was accepted.'
    Assert-True ((Invoke-Summary $baseReport -Names @($requestedNames[0], 'synthetic-private-error')).failureCodes `
        -ccontains 'REQUESTED_PATCHES_INVALID') 'An unlisted requested name was published.'
    Assert-True ((Invoke-Summary $baseReport -Names @($requestedNames[0], $requestedNames[0])).failureCodes `
        -ccontains 'REQUESTED_PATCHES_INVALID') 'A repeated requested name was accepted.'
    Assert-True ((Invoke-Summary $baseReport -Names @{ private = 'synthetic-private-error' }).failureCodes `
        -ccontains 'REQUESTED_PATCHES_INVALID') 'A malformed requested name was coerced.'
    foreach ($badVersion in @('synthetic-private-error', '9.9.9', @{ private = 'synthetic-private-error' })) {
        $answer = Invoke-Summary $baseReport -Version $badVersion
        Assert-True ($answer.failureCodes -ccontains 'BUNDLE_VERSION_INVALID' -and $null -eq $answer.bundleVersion) `
            'An arbitrary or stale bundle version was published.'
    }
    Assert-True ((Invoke-Summary $baseReport -Apk (Join-Path $caseRoot 'missing-synthetic-private-path.apk')).failureCodes `
        -ccontains 'APK_INVALID') 'A missing saved APK was accepted.'
    Assert-True ((Invoke-Summary $baseReport -ExitCode 'synthetic-private-error').failureCodes -ccontains 'CLI_FAILED') `
        'An arbitrary exit-code value was accepted.'
    Assert-True ((Invoke-Summary $baseReport -ExitCode 7).failureCodes -ccontains 'CLI_FAILED') 'A failed CLI run was accepted.'
    $damagedCatalog = Copy-Json $catalog
    $damagedCatalog.patches[0].name = 'synthetic-private-error'
    $damagedCatalog.patches[0].PSObject.Properties.Remove('compatiblePackages')
    Assert-True ((Invoke-Summary $baseReport -Catalog $damagedCatalog).failureCodes -ccontains 'CATALOG_INVALID') `
        'A detailed catalog parser error escaped its fixed failure code.'

    # The parser allows omitted dependency rows, transitive named/anonymous dependencies and
    # cycles. It rejects unrelated catalog rows and duplicates. Exercise those same interfaces.
    $dependencyCatalog = @'
{"version":"v9.9.9","patches":[
 {"name":"Root","dependencies":["Helper"],"compatiblePackages":{"com.example.summary":["1.0.0"]}},
 {"name":"Helper","dependencies":["Root","Internal"],"compatiblePackages":{"com.example.summary":["1.0.0"]}},
 {"name":"Unrelated","dependencies":[],"compatiblePackages":{"com.example.summary":["1.0.0"]}}
]}
'@ | ConvertFrom-Json
    $dependencyReport = @'
{"packageName":"com.example.summary","packageVersion":"1.0.0",
 "patchingSteps":[{"step":"PATCHING","success":true}],"failedPatches":[],
 "appliedPatches":[{"name":"Internal"},{"name":"Root"},{"name":"Helper"}]}
'@ | ConvertFrom-Json
    $closure = @(Get-PatchDependencyNames -PatchList $dependencyCatalog -RequestedNames @('Root'))
    Assert-True (Test-ReportedPatchNames -Expected @('Root') -Actual @('Internal', 'Root', 'Helper') `
        -AllowedDependencies $closure) 'The existing dependency interface rejected its positive control.'
    $answer = Invoke-Summary $dependencyReport -Catalog $dependencyCatalog -Names @('Root') -Version '9.9.9'
    Assert-True (@($answer.failureCodes).Count -eq 0 -and ($answer.appliedPatches -join ',') -ceq 'Internal,Root,Helper') `
        'The declared transitive dependency names were lost.'
    $dependencyReport.appliedPatches = @([pscustomobject]@{ name = 'Root' })
    Assert-True (@((Invoke-Summary $dependencyReport -Catalog $dependencyCatalog -Names @('Root') -Version '9.9.9').failureCodes).Count `
        -eq 0) 'Optional dependency rows were demanded.'
    foreach ($extra in @('Helper', 'Unrelated', 'synthetic-private-error')) {
        $dependencyReport.appliedPatches = @([pscustomobject]@{ name = 'Root' }, [pscustomobject]@{ name = $extra },
            [pscustomobject]@{ name = $extra })
        $answer = Invoke-Summary $dependencyReport -Catalog $dependencyCatalog -Names @('Root') -Version '9.9.9'
        Assert-True ($answer.failureCodes -ccontains 'PATCH_SET_INVALID') 'A repeated or unrequested dependency row was accepted.'
        if ($extra -cne 'Helper') { Assert-True ($answer.appliedPatches -cnotcontains $extra) 'An unallowed row was published.' }
    }
    $allNames = @($catalog.patches | ForEach-Object { $_.name })
    $allDependencies = @(Get-PatchDependencyNames -PatchList $catalog -RequestedNames $allNames)
    $full = Copy-Json $baseReport
    $full.appliedPatches = @($allNames + $allDependencies | ForEach-Object { [pscustomobject]@{ name = $_ } })
    $answer = Invoke-Summary $full -Names $allNames
    Assert-True (@($answer.failureCodes).Count -eq 0 -and $answer.appliedCount -eq ($allNames.Count + $allDependencies.Count)) `
        'The real catalog internal dependencies were rejected.'

    $export = Invoke-Export
    Assert-True $export.Written 'The separate public summary was not written.'
    Assert-Summary (Get-Content -LiteralPath $publicSummary -Raw | ConvertFrom-Json)
    Assert-True ((Get-FileHash -LiteralPath $privateReport).Hash -ceq $reportHash -and
        (Get-FileHash -LiteralPath $testApk).Hash -ceq $apkHash) 'Export changed a private input.'
    Assert-True (-not (Invoke-Export -SummaryPath $privateReport).Written -and
        -not (Invoke-Export -SummaryPath $testApk).Written) 'Export overwrote a configured report or APK.'
    Assert-True ((Get-FileHash -LiteralPath $privateReport).Hash -ceq $reportHash -and
        (Get-FileHash -LiteralPath $testApk).Hash -ceq $apkHash) 'A refused export changed a private input.'
    Assert-True ((Invoke-Export -SummaryPath (Join-Path $caseRoot 'missing-synthetic-private-path/public.json')).FailureCode `
        -ceq 'SUMMARY_WRITE_FAILED') 'An unwritable output did not return a fixed error.'
    $hardLink = Join-Path $caseRoot 'hard-linked-summary.json'
    New-Item -ItemType HardLink -Path $hardLink -Target $privateReport | Out-Null
    Assert-True (Invoke-Export -SummaryPath $hardLink).Written 'Atomic replacement could not replace a hard-linked summary.'
    Assert-Summary (Get-Content -LiteralPath $hardLink -Raw | ConvertFrom-Json)
    Assert-True ((Get-FileHash -LiteralPath $privateReport).Hash -ceq $reportHash) 'Export through a hard link changed the private report.'
    # Directory aliases name the same directory entry, unlike a separate hard link.
    # Check both path directions, a nested alias and an ordinary separate output through it.
    $directoryAlias = Join-Path $caseRoot 'directory-alias'
    $nestedAlias = Join-Path $caseRoot 'nested-alias'
    try {
        New-Item -ItemType Junction -Path $directoryAlias -Target $caseRoot | Out-Null
        New-Item -ItemType Junction -Path $nestedAlias -Target $directoryAlias | Out-Null
        foreach ($alias in @($directoryAlias, $nestedAlias)) {
            $aliasedReport = Join-Path $alias (Split-Path -Leaf $privateReport)
            foreach ($paths in @(
                @{ ReportPath = $privateReport; SummaryPath = $aliasedReport },
                @{ ReportPath = $aliasedReport; SummaryPath = $privateReport }
            )) {
                $export = Invoke-Export @paths
                Assert-True (-not $export.Written -and $export.FailureCode -ceq 'SUMMARY_PATH_INVALID') `
                    'A directory alias allowed the public summary to replace its private report.'
                Assert-True ((Get-FileHash -LiteralPath $privateReport).Hash -ceq $reportHash) `
                    'A directory alias changed the private report.'
            }
            $export = Invoke-Export -ReportPath (Join-Path $alias (Split-Path -Leaf $privateReport)) `
                -SummaryPath (Join-Path $alias 'separate-summary.json')
            Assert-True $export.Written 'A separate public summary through a directory alias was refused.'
            Assert-Summary (Get-Content -LiteralPath (Join-Path $caseRoot 'separate-summary.json') -Raw | ConvertFrom-Json)
            Assert-True ((Get-FileHash -LiteralPath $privateReport).Hash -ceq $reportHash) `
                'A separate alias export changed its private report.'
        }
    } finally {
        foreach ($alias in @($nestedAlias, $directoryAlias)) {
            if ([System.IO.Directory]::Exists($alias)) { [System.IO.Directory]::Delete($alias) }
        }
    }
    $locked = [System.IO.File]::Open($privateReport, [System.IO.FileMode]::Open,
        [System.IO.FileAccess]::Read, [System.IO.FileShare]::None)
    try {
        $export = Invoke-Export
        Assert-True ($export.Written -and $export.Summary.failureCodes -ccontains 'REPORT_INVALID') `
            'An unreadable private report did not produce a safe failed summary.'
    } finally { $locked.Dispose() }
    $locked = [System.IO.File]::Open($publicSummary, [System.IO.FileMode]::Open,
        [System.IO.FileAccess]::Read, [System.IO.FileShare]::None)
    try {
        Assert-True ((Invoke-Export).FailureCode -ceq 'SUMMARY_WRITE_FAILED') 'A locked public file did not return a fixed write error.'
    } finally { $locked.Dispose() }
    Assert-True (@(Get-ChildItem -LiteralPath $caseRoot -Filter '.public-patch-summary-*.tmp').Count -eq 0) `
        'The exporter left a temporary file behind.'
    [System.IO.File]::WriteAllText($privateReport, '{"private":"synthetic-private-error", malformed')
    $export = Invoke-Export
    Assert-True ($export.Written -and $export.Summary.failureCodes -ccontains 'REPORT_INVALID') `
        'Malformed JSON did not produce a safe failed summary.'
    $export = Invoke-Export -ReportPath (Join-Path $caseRoot 'missing-synthetic-private-path.json')
    Assert-True ($export.Written -and $export.Summary.failureCodes -ccontains 'REPORT_INVALID') `
        'A missing private report did not produce a safe failed summary.'

    # Run the exporter in a fresh CLI process and inspect every output stream, including failure
    # output from malformed JSON and a bad destination. Command/path canaries stay on the input side.
    $harness = Join-Path $caseRoot 'export-cli.ps1'
    [System.IO.File]::WriteAllText($harness, @'
param($Tools, $CatalogPath, $ReportPath, $SummaryPath, $Apk)
$ErrorActionPreference = 'Stop'
. (Join-Path $Tools 'patch-target.ps1')
. (Join-Path $Tools 'patch-report.ps1')
$catalog = Get-Content -LiteralPath $CatalogPath -Raw | ConvertFrom-Json
$result = Export-PublicPatchSummary -ReportPath $ReportPath -SummaryPath $SummaryPath -PatchList $catalog `
    -RequestedNames @('Use registered Telegram API credentials', 'Use registered Maps API key') `
    -BundleVersion ($catalog.version -creplace '^v', '') -OutputPath $Apk
if (-not $result.Written) { Write-Output $result.FailureCode; exit 1 }
$result.Summary | ConvertTo-Json -Depth 4
'@)
    foreach ($cliCase in @(
        @{ Json = $cliJson; Destination = $publicSummary; Valid = $true },
        @{ Json = '{"private":"synthetic-private-error", malformed'; Destination = $publicSummary; Valid = $false },
        @{ Json = $cliJson; Destination = (Join-Path $caseRoot 'missing-synthetic-private-path/public.json'); Valid = $false }
    )) {
        [System.IO.File]::WriteAllText($privateReport, $cliCase.Json)
        $destination = $cliCase.Destination
        $savedPreference = $ErrorActionPreference
        try {
            $ErrorActionPreference = 'Continue'
            $shellName = if ($PSEdition -ceq 'Desktop') { 'powershell.exe' } else { 'pwsh.exe' }
            $output = @(& (Join-Path $PSHOME $shellName) -NoLogo -NoProfile -File $harness `
                -Tools $PSScriptRoot -CatalogPath (Join-Path $Root 'patches-list.json') `
                -ReportPath $privateReport -SummaryPath $destination -Apk $testApk *>&1)
            $childExit = $LASTEXITCODE
        } finally { $ErrorActionPreference = $savedPreference }
        $text = @($output | ForEach-Object { [string]$_ }) -join "`n"
        Assert-NoCanary $text
        if ($destination -ceq $publicSummary) {
            $childSummary = $text | ConvertFrom-Json
            Assert-Summary $childSummary
            Assert-True ($childExit -eq 0) 'The standalone report export failed unsafely.'
            if ($cliCase.Valid) {
                Assert-True (@($childSummary.failureCodes).Count -eq 0) 'The standalone configured success was rejected.'
            } else {
                Assert-True ($childSummary.failureCodes -ccontains 'REPORT_INVALID') 'The standalone malformed report was accepted.'
            }
        } else {
            Assert-True ($childExit -eq 1 -and $text.Trim() -ceq 'SUMMARY_WRITE_FAILED') `
                'Standalone write failure emitted anything besides its fixed code.'
        }
    }
} finally {
    $resolvedCaseRoot = [System.IO.Path]::GetFullPath($caseRoot)
    if (-not $resolvedCaseRoot.StartsWith($requiredPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw 'Refusing to remove a public-summary test directory outside the temporary directory.'
    }
    if (Test-Path -LiteralPath $resolvedCaseRoot) { Remove-Item -LiteralPath $resolvedCaseRoot -Recurse -Force }
}
Write-Host "[scripts] public patch summary passed $checks assertions"
