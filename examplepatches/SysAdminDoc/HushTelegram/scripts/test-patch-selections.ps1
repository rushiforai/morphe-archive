[CmdletBinding()]
param([string]$Root)
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $Root 'scripts/verify-patch-selections.ps1')
$assertions = 0
function Assert-Selection([bool]$Condition, [string]$Message) {
    $script:assertions++
    if (-not $Condition) { throw $Message }
}

$catalog = Get-Content (Join-Path $Root 'patches-list.json') -Raw | ConvertFrom-Json
$model = Get-SelectionStatusModel -Root $Root
$plans = @(Get-PatchSelectionCases -Catalog $catalog -StatusModel $model)
Assert-Selection ($plans.Count -eq 64 -and @($plans.Id | Sort-Object -Unique).Count -eq 64) 'The matrix changed its bounded case inventory.'
Assert-Selection (@($plans | Where-Object Failure).Count -eq 10) 'A malformed, incomplete or typed-input refusal is missing.'
Assert-Selection (@($plans | Where-Object Id -CEQ 'maps-array-noop').Count -eq 1) 'The CLI typed-option no-op case is missing.'
Assert-Selection (@($plans | Where-Object Default).Count -eq 1 -and $plans[0].Id -ceq 'default43') 'Defaults must be exercised through the actual CLI defaults.'
Assert-Selection ($plans[0].Names.Count -eq 43 -and ($plans | Where-Object Id -CEQ 'full45').Names.Count -eq 45) 'Default and full catalog counts changed.'
$hostile = $catalog | ConvertTo-Json -Depth 20 | ConvertFrom-Json
($hostile.patches | Where-Object name -CEQ 'Use registered Telegram API credentials').name = 'private_catalog_name_canary_472009'
$refusal = $null
try { Get-PatchSelectionCases -Catalog $hostile -StatusModel $model | Out-Null } catch { $refusal = $_.Exception.Message }
Assert-Selection ($refusal -ceq 'CATALOG_INVALID') 'A credential sentinel substituted for a catalog name was accepted.'
foreach ($family in $model.Families) {
    $single = @($plans | Where-Object { $_.Id -ceq ('single-' + $family.Enum.ToLowerInvariant().Replace('_', '-')) })
    Assert-Selection ($single.Count -eq 1 -and $single[0].Names.Count -eq 1 -and $single[0].Names[0] -ceq $family.Name) 'Every runtime family needs its actual single-selection case.'
}
foreach ($plan in $plans) {
    $expectation = Get-SelectionExpectation -Catalog $catalog -StatusModel $model -Selection $plan
    $settings = $plan.Names -ccontains 'HushTelegram settings' -or
        @($plan.Names | Where-Object { $model.Families.Name -ccontains $_ }).Count -gt 0
    Assert-Selection ($expectation.settings -eq $settings) 'A selection inherited the wrong extension or minSdk premise.'
    Assert-Selection ($expectation.flags.Count -eq $model.StatusNames.Count) 'The compiled checker omitted a status flag.'
    foreach ($capability in $model.Capabilities) {
        $family = $model.Families | Where-Object Enum -CEQ $capability.Family
        Assert-Selection ($expectation.flags[$capability.Status] -eq ($plan.Names -ccontains $family.Name)) 'A capability was credited to an omitted family.'
    }
    Assert-Selection ($plan.ApiId -cmatch '^[1-9][0-9]*$' -and [int]$plan.ApiId -gt 0 -and
        $plan.ApiHash -cmatch '^[0-9a-f]{32}$' -and $plan.MapsKey -cmatch '^AIza[0-9A-Za-z_-]{35}$') 'Synthetic configured values no longer fit the real validators.'
    $document = @(New-SelectionOptionsDocument -Catalog $catalog -Selection $plan -BundleName 'fixture.mpp' -BundleHash ('a' * 64) | ConvertFrom-Json)
    Assert-Selection ($document.Count -eq 1 -and $document[0].meta.source -ceq 'fixture.mpp' -and
        $document[0].meta.sha256 -ceq ('a' * 64)) 'Options no longer follow the CLI 1.18 PatchBundle array grammar.'
    foreach ($patch in $catalog.patches) {
        $entry = $document[0].patches.PSObject.Properties[$patch.name].Value
        Assert-Selection ($entry.enabled -is [bool] -and $entry.enabled -eq ($plan.Names -ccontains $patch.name)) 'Options enabled a patch that the case did not request.'
    }
}
$nulls = $plans | Where-Object Id -CEQ 'credentials-null'
$nullDocument = @(New-SelectionOptionsDocument -Catalog $catalog -Selection $nulls -BundleName 'fixture.mpp' -BundleHash ('a' * 64) | ConvertFrom-Json)[0]
Assert-Selection (@($nullDocument.patches.'Use registered Telegram API credentials'.options.PSObject.Properties).Count -eq 2 -and
    $null -eq $nullDocument.patches.'Use registered Telegram API credentials'.options.apiId -and
    $null -eq $nullDocument.patches.'Use registered Maps API key'.options.apiKey) 'Explicit nulls collapsed into absent or string values.'
$arrays = $plans | Where-Object Id -CEQ 'api-array-id'
$arrayDocument = @(New-SelectionOptionsDocument -Catalog $catalog -Selection $arrays -BundleName 'fixture.mpp' -BundleHash ('a' * 64) | ConvertFrom-Json)[0]
Assert-Selection ($arrayDocument.patches.'Use registered Telegram API credentials'.options.apiId -is [array]) 'Wrongly typed arrays stopped reaching the actual CLI loader.'
$objects = $plans | Where-Object Id -CEQ 'api-object-hash'
$objectDocument = @(New-SelectionOptionsDocument -Catalog $catalog -Selection $objects -BundleName 'fixture.mpp' -BundleHash ('a' * 64) | ConvertFrom-Json)[0]
Assert-Selection ($objectDocument.patches.'Use registered Telegram API credentials'.options.apiHash -is [pscustomobject]) 'Wrongly typed objects stopped reaching the actual CLI loader.'
$numeric = $plans | Where-Object Id -CEQ 'api-number-id'
$numericDocument = @(New-SelectionOptionsDocument -Catalog $catalog -Selection $numeric -BundleName 'fixture.mpp' -BundleHash ('a' * 64) | ConvertFrom-Json)[0]
Assert-Selection ($numericDocument.patches.'Use registered Telegram API credentials'.options.apiId -is [long] -or
    $numericDocument.patches.'Use registered Telegram API credentials'.options.apiId -is [int]) 'The upstream numeric-ID case stopped reaching the actual CLI as a JSON number.'
$configured = $plans | Where-Object Id -CEQ 'credentials-configured'
Assert-Selection ($numeric.ApiId -ne $configured.ApiId -and [int]$numeric.ApiId % 128 -eq [int]$configured.ApiId % 128 -and
    $numericDocument.patches.'Use registered Telegram API credentials'.options.apiId -eq [int]$numeric.ApiId -and
    $numeric.Canaries -ccontains $numeric.ApiId) 'The compiled cases lost the colliding-ID pair or its private expectation.'

$invalidId = $plans | Where-Object Id -CEQ 'api-invalid-id'
$stock = [pscustomobject]@{ package = 'org.telegram.messenger.web'; versionName = '12.10.6' }
$reason = 'app.morphe.patcher.patch.PatchException: Use registered Telegram API credentials: apiId must be a positive 32-bit decimal integer.'
$rejection = [pscustomobject]@{
    packageName = $stock.package; packageVersion = $stock.versionName; success = $false; appliedPatches = @()
    failedPatches = @([pscustomobject]@{ patch = [pscustomobject]@{ name = 'Use registered Telegram API credentials' }; reason = $reason })
    patchingSteps = @([pscustomobject]@{ step = 'PATCHING'; success = $false
        message = 'app.morphe.desktop.command.PatchFailedException: FAILED: Use registered Telegram API credentials' })
}
Assert-Selection (Test-SelectionRefusal -Selection $invalidId -Report $rejection -PrivateLog $reason -Stock $stock) 'A proved option-validation refusal was rejected.'
foreach ($change in @('missing report', 'wrong target', 'wrong version', 'success', 'wrong patch', 'wrong reason', 'applied', 'rebuild', 'wrong step')) {
    $bad = $rejection | ConvertTo-Json -Depth 8 | ConvertFrom-Json
    switch ($change) {
        'missing report' { $bad = $null }
        'wrong target' { $bad.packageName = 'unrelated.package' }
        'wrong version' { $bad.packageVersion = '0.0' }
        'success' { $bad.success = $true }
        'wrong patch' { $bad.failedPatches[0].patch.name = 'Use registered Maps API key' }
        'wrong reason' { $bad.failedPatches[0].reason = 'java.lang.OutOfMemoryError: unrelated failure' }
        'applied' { $bad.appliedPatches = @([pscustomobject]@{ name = 'HushTelegram settings' }) }
        'rebuild' { $bad.patchingSteps += [pscustomobject]@{ step = 'REBUILDING'; success = $true } }
        'wrong step' { $bad.patchingSteps[0].step = 'REBUILDING' }
    }
    Assert-Selection (-not (Test-SelectionRefusal -Selection $invalidId -Report $bad -PrivateLog $reason -Stock $stock)) "Unrelated failure accepted as validation: $change"
}
$malformed = $plans | Where-Object Id -CEQ 'options-malformed'
$parseReport = [pscustomobject]@{ appliedPatches = @(); failedPatches = @(); patchingSteps = @() }
$parseLog = 'kotlinx.serialization.json.JsonDecodingException: Unexpected JSON token' + "`n" +
    '    at app.morphe.desktop.command.model.PatchBundle$$serializer.deserialize(PatchOptionsFile.kt:47)' + "`n" +
    '    at app.morphe.desktop.command.PatchCommand.call(PatchCommand.kt:100)'
Assert-Selection (Test-SelectionRefusal -Selection $malformed -Report $parseReport -PrivateLog $parseLog -Stock $stock) 'The options-file parser refusal was rejected.'
Assert-Selection (-not (Test-SelectionRefusal -Selection $invalidId -Report $parseReport -PrivateLog $parseLog -Stock $stock)) 'Parser evidence satisfied an unrelated API validation case.'
Assert-Selection (-not (Test-SelectionRefusal -Selection $malformed -Report $parseReport -PrivateLog ($parseLog.Replace('PatchBundle', 'UnrelatedDocument')) -Stock $stock)) 'An unrelated JSON parser failure passed.'
foreach ($toolFailure in @('java.lang.OutOfMemoryError: exhausted', 'java.lang.ClassNotFoundException: unavailable',
    'java.io.IOException: unavailable', 'Exception in thread "main" java.lang.OutOfMemoryError: exhausted',
    "`tSuppressed: java.io.IOException: unavailable", "`tCaused by: java.lang.OutOfMemoryError: exhausted")) {
    Assert-Selection (-not (Test-SelectionRefusal -Selection $invalidId -Report $rejection -PrivateLog ($reason + "`n" + $toolFailure) -Stock $stock)) 'A tool crash satisfied an option-validation case.'
    Assert-Selection (-not (Test-SelectionRefusal -Selection $malformed -Report $parseReport -PrivateLog ($parseLog + "`n" + $toolFailure) -Stock $stock)) 'A tool crash satisfied the options parser case.'
}

$scratch = Join-Path ([IO.Path]::GetTempPath()) ('hushtelegram-selection-contracts-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $scratch | Out-Null
try {
    $java = Resolve-Java
    $desktop = Resolve-DesktopCli -Root $Root -Required
    $fixtureDir = $env:HUSHTELEGRAM_FIXTURE_DIR
    if (-not $fixtureDir) { $fixtureDir = Join-Path $Root 'fixtures' }
    $fixtures = @('telegram-web-12.10.6-71129.apk', 'telegram-beta-12.10.7-71239.apk') |
        ForEach-Object { Join-Path $fixtureDir $_ }
    foreach ($fixture in $fixtures) {
        Assert-Selection (Test-Path -LiteralPath $fixture -PathType Leaf) 'A native-version control fixture is missing.'
    }
    $compiler = Join-Path (Split-Path -Parent $java) 'javac.exe'
    $classes = Join-Path $scratch 'classes'
    $compile = Invoke-SelectionTool -Program $compiler -Arguments @('-encoding', 'UTF-8', '-cp', $desktop, '-d', $classes,
        (Join-Path $Root 'scripts/DexDiff.java'), (Join-Path $Root 'scripts/SelectionCheck.java'),
        (Join-Path $Root 'scripts/SelectionCheckNativeVersionTest.java')) -PrivateOutput (Join-Path $scratch 'compile-private.txt')
    Assert-Selection ($compile -eq 0) 'The compiled selection checker tests did not compile.'
    $nativeOutput = Join-Path $scratch 'native-private.txt'
    $native = Invoke-SelectionTool -Program $java -Arguments (@('-Xmx512m', '-XX:ActiveProcessorCount=2', '-cp',
        ($classes + [IO.Path]::PathSeparator + $desktop), 'SelectionCheckNativeVersionTest') + $fixtures) -PrivateOutput $nativeOutput
    Assert-Selection ($native -eq 0 -and (Get-Content $nativeOutput -Raw).Contains('NATIVE_VERSION_CHECKS_PASSED checks=84')) `
        'The native-version checker lost its exact insertion or refusal controls.'
    $canary = 'private_selection_error_canary_529771'
    Assert-Selection (-not (Test-SelectionPublicText -Text ('before ' + $canary + ' after') -Canaries @($canary))) 'The output guard accepted a credential sentinel.'
    Assert-Selection (Test-SelectionPublicText -Text 'REFUSAL_PASSED' -Canaries @($canary)) 'The output guard rejected a fixed status code.'
    $private = Join-Path $scratch 'tool-private.txt'
    $failingTool = Join-Path $scratch 'failing-tool.ps1'
    [IO.File]::WriteAllText($failingTool,
        "[Console]::Out.WriteLine('$canary')`n[Console]::Error.WriteLine('$canary')`nexit 13`n",
        [Text.UTF8Encoding]::new($false))
    $code = Invoke-SelectionTool -Program (Get-Process -Id $PID).Path -Arguments @('-NoProfile', '-File', $failingTool) -PrivateOutput $private
    Assert-Selection ($code -eq 13 -and (Get-Content $private -Raw).Contains($canary)) 'A failing tool did not preserve its evidence privately.'
    $publicOutput = @(& (Get-Process -Id $PID).Path -NoProfile -File (Join-Path $Root 'scripts/verify-patch-selections.ps1') `
        -Apk $canary -DesktopJar $canary -WorkDir $scratch 2>&1 | ForEach-Object { "$_" }) -join "`n"
    Assert-Selection ($LASTEXITCODE -ne 0 -and $publicOutput.Contains('MATRIX_FAILED') -and
        (Test-SelectionPublicText -Text $publicOutput -Canaries @($canary))) 'An invalid input leaked its path through the public error stream.'
} finally { Remove-GeneratedPath -Path $scratch -Root ([IO.Path]::GetTempPath()) }
Write-Host "[selections] contracts passed ($assertions assertions)"
