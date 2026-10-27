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
Assert-Selection ($plans.Count -eq 85 -and @($plans.Id | Sort-Object -Unique).Count -eq 85) 'The matrix changed its bounded case inventory.'
Assert-Selection (@($plans | Where-Object Failure).Count -eq 10) 'A malformed, incomplete or typed-input refusal is missing.'
Assert-Selection (@($plans | Where-Object Id -CEQ 'maps-array-noop').Count -eq 1) 'The CLI typed-option no-op case is missing.'
Assert-Selection (@($plans | Where-Object Default).Count -eq 1 -and $plans[0].Id -ceq 'default63') 'Defaults must be exercised through the actual CLI defaults.'
Assert-Selection ($plans[0].Names.Count -eq 63 -and ($plans | Where-Object Id -CEQ 'full67').Names.Count -eq 67) 'Default and full catalog counts changed.'
$logoCase = @($plans | Where-Object Id -CEQ 'launch-logo')
Assert-Selection ($logoCase.Count -eq 1 -and ($logoCase[0].Names -join ',') -ceq 'AMOLED black,Black and white launch logo') 'The launch logo needs its own case beside the switch it shows behind.'
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
    Assert-Selection ($expectation.icon -eq ($plan.Names -ccontains 'HushTelegram icon and name')) 'The checker expects the launcher icon on the wrong cases.'
    Assert-Selection ($expectation.flags.Count -eq $model.StatusNames.Count) 'The compiled checker omitted a status flag.'
    foreach ($capability in $model.Capabilities) {
        $family = $model.Families | Where-Object Enum -CEQ $capability.Family
        Assert-Selection ($expectation.flags[$capability.Status] -eq ($plan.Names -ccontains $family.Name)) 'A capability was credited to an omitted family.'
    }
    Assert-Selection ($plan.ApiId -cmatch '^[1-9][0-9]*$' -and [int]$plan.ApiId -gt 0 -and
        $plan.ApiHash -cmatch '^[0-9a-f]{32}$' -and $plan.MapsKey -cmatch '^AIza[0-9A-Za-z_-]{35}$') 'Synthetic configured values no longer fit the real validators.'
    $document = @(New-SelectionOptionsDocument -Catalog $catalog -Selection $plan -BundleName 'fixture.mpp' -BundleHash ('a' * 64) | ConvertFrom-Json)
    Assert-Selection ($document.Count -eq 1 -and $document[0].meta.source -ceq 'fixture.mpp' -and
        $document[0].meta.sha256 -ceq ('a' * 64)) 'Options no longer follow the CLI''s PatchBundle array grammar (1.18 and 1.19.0).'
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

# morphe-desktop 1.19.0 (patcher 2.0) writes the same refusal as stepResults, {name, error},
# failureReason and failureDetail, and leads the exception it prints with ERROR:.
$trace = "`n`tat app.morphe.patcher.patch.Patch.execute(Patch.kt:141)"
$stepError = 'Patch "Use registered Telegram API credentials" failed: Use registered Telegram API credentials: apiId must be a positive 32-bit decimal integer.'
$currentLog = "INFO: Executing patches`nERROR: FAILED: Use registered Telegram API credentials`nERROR: " + $reason + $trace
$current = [pscustomobject]@{
    success = $false; outputPath = 'private.apk'; packageName = $stock.package; packageVersion = $stock.versionName; appliedPatches = @()
    failedPatches = @([pscustomobject]@{ name = 'Use registered Telegram API credentials'; error = $reason + $trace })
    stepResults = @([pscustomobject]@{ step = 'PATCHING'; success = $false; error = $stepError })
    failureReason = 'Patching failed: ' + $stepError
    failureDetail = $reason + $trace
}
Assert-Selection (Test-SelectionRefusal -Selection $invalidId -Report $current -PrivateLog $currentLog -Stock $stock) 'A proved 1.19.0 option-validation refusal was rejected.'
foreach ($change in @('wrong target', 'wrong version', 'success', 'wrong patch', 'wrong reason', 'applied', 'rebuild', 'wrong step',
    'step passed', 'wrong step error', 'wrong failure reason', 'wrong failure detail', 'older failure shape', 'both step lists',
    'bare log line', 'no FAILED line')) {
    $bad = $current | ConvertTo-Json -Depth 8 | ConvertFrom-Json
    $badLog = $currentLog
    switch ($change) {
        'wrong target' { $bad.packageName = 'unrelated.package' }
        'wrong version' { $bad.packageVersion = '0.0' }
        'success' { $bad.success = $true }
        'wrong patch' { $bad.failedPatches[0].name = 'Use registered Maps API key' }
        'wrong reason' { $bad.failedPatches[0].error = 'java.lang.OutOfMemoryError: unrelated failure' }
        'applied' { $bad.appliedPatches = @('HushTelegram settings') }
        'rebuild' { $bad.stepResults += [pscustomobject]@{ step = 'REBUILDING'; success = $true } }
        'wrong step' { $bad.stepResults[0].step = 'REBUILDING' }
        'step passed' { $bad.stepResults[0].success = $true }
        'wrong step error' { $bad.stepResults[0].error = 'java.lang.OutOfMemoryError: unrelated failure' }
        'wrong failure reason' { $bad.failureReason = 'Patching failed: java.lang.OutOfMemoryError: unrelated failure' }
        'wrong failure detail' { $bad.failureDetail = 'java.lang.OutOfMemoryError: unrelated failure' }
        'older failure shape' { $bad.failedPatches = @([pscustomobject]@{ patch = [pscustomobject]@{ name = 'Use registered Telegram API credentials' }; reason = $reason }) }
        'both step lists' { $bad | Add-Member -NotePropertyName patchingSteps -NotePropertyValue @($bad.stepResults) }
        'bare log line' { $badLog = $currentLog.Replace("ERROR: $reason", $reason) }
        'no FAILED line' { $badLog = $currentLog.Replace('ERROR: FAILED: ', 'INFO: ') }
    }
    Assert-Selection (-not (Test-SelectionRefusal -Selection $invalidId -Report $bad -PrivateLog $badLog -Stock $stock)) "Unrelated failure accepted as a 1.19.0 validation: $change"
}
# 1.19.0 reads the options file before it writes a result, so a malformed one leaves none.
$currentParseLog = 'INFO: Reading options from private.json' + "`n" +
    'kotlinx.serialization.json.JsonDecodingException: Unexpected JSON token at offset 3: Encountered an unknown key ''private'' at path: $[0]' + "`n`t" +
    'at app.morphe.engine.options.PatchBundle$$serializer.deserialize(PatchOptionsFile.kt:30)' + "`n`t" +
    'at app.morphe.engine.options.PatchOptionsFileKt.readPatchBundles(PatchOptionsFile.kt:412)' + "`n`t" +
    'at app.morphe.engine.PatchEngine$patch$3.invokeSuspend(PatchEngine.kt:311)'
Assert-Selection (Test-SelectionRefusal -Selection $malformed -Report $null -PrivateLog $currentParseLog -Stock $stock) 'The 1.19.0 options-file parser refusal was rejected.'
Assert-Selection (-not (Test-SelectionRefusal -Selection $invalidId -Report $null -PrivateLog $currentParseLog -Stock $stock)) '1.19.0 parser evidence satisfied an unrelated API validation case.'
Assert-Selection (-not (Test-SelectionRefusal -Selection $malformed -Report $null -PrivateLog $parseLog -Stock $stock)) 'A 1.18 parser log passed without the result file 1.18 always writes.'
Assert-Selection (-not (Test-SelectionRefusal -Selection $malformed -Report $parseReport -PrivateLog $currentParseLog -Stock $stock)) 'A 1.19.0 parser log passed beside a 1.18 result file.'
Assert-Selection (-not (Test-SelectionRefusal -Selection $malformed -PrivateLog $currentParseLog -Stock $stock `
    -Report ([pscustomobject]@{ appliedPatches = @(); failedPatches = @(); stepResults = @() }))) 'A 1.19.0 parser refusal passed with a result file.'
Assert-Selection (-not (Test-SelectionRefusal -Selection $malformed -Report $null -PrivateLog ($currentParseLog.Replace('PatchBundle', 'UnrelatedDocument')) -Stock $stock)) 'An unrelated 1.19.0 JSON parser failure passed.'
Assert-Selection (-not (Test-SelectionRefusal -Selection $malformed -Report $null -PrivateLog ($currentParseLog.Replace('readPatchBundles', 'readSomethingElse')) -Stock $stock)) 'A 1.19.0 JSON failure outside the options file reader passed.'
# 1.19.1 wraps each stack line in italic style codes, as its real refusal log does.
$styleOn = [string][char]27 + '[3m'
$styleOff = [string][char]27 + '[23m' + [char]27 + '[0m'
$styledParseLog = (($currentParseLog -split "`n") | ForEach-Object { if ($_.StartsWith("`tat ")) { $styleOn + $_ + $styleOff } else { $_ } }) -join "`n"
Assert-Selection ($styledParseLog -ne $currentParseLog) 'The styled 1.19.1 parser log carries no style codes.'
Assert-Selection (Test-SelectionRefusal -Selection $malformed -Report $null -PrivateLog $styledParseLog -Stock $stock) 'A 1.19.1 parser refusal with styled stack lines was rejected.'
Assert-Selection (-not (Test-SelectionRefusal -Selection $malformed -Report $null -PrivateLog ($styledParseLog.Replace('readPatchBundles', 'readSomethingElse')) -Stock $stock)) 'A styled JSON failure outside the options file reader passed.'
Assert-Selection (-not (Test-SelectionRefusal -Selection $invalidId -Report $null -PrivateLog $styledParseLog -Stock $stock)) 'Styled parser evidence satisfied an unrelated API validation case.'
foreach ($toolFailure in @('java.lang.OutOfMemoryError: exhausted', 'Exception in thread "main" java.lang.OutOfMemoryError: exhausted',
    "`tCaused by: java.io.IOException: unavailable")) {
    Assert-Selection (-not (Test-SelectionRefusal -Selection $invalidId -Report $current -PrivateLog ($currentLog + "`n" + $toolFailure) -Stock $stock)) 'A tool crash satisfied a 1.19.0 option-validation case.'
    Assert-Selection (-not (Test-SelectionRefusal -Selection $malformed -Report $null -PrivateLog ($currentParseLog + "`n" + $toolFailure) -Stock $stock)) 'A tool crash satisfied the 1.19.0 options parser case.'
}

$scratch = Join-Path ([IO.Path]::GetTempPath()) ('hushtelegram-selection-contracts-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $scratch | Out-Null
try {
    $java = Resolve-Java
    $desktop = Resolve-DesktopCli -Root $Root -Required
    $fixtureDir = $env:HUSHTELEGRAM_FIXTURE_DIR
    if (-not $fixtureDir) { $fixtureDir = Join-Path $Root 'fixtures' }
    $fixtures = @('telegram-web-13.1.0-72299.apk', 'telegram-play-13.1.0-72291.apk') |
        ForEach-Object { Join-Path $fixtureDir $_ }
    foreach ($fixture in $fixtures) {
        Assert-Selection (Test-Path -LiteralPath $fixture -PathType Leaf) 'A native-version control fixture is missing.'
    }
    $compiler = Join-Path (Split-Path -Parent $java) 'javac.exe'
    $classes = Join-Path $scratch 'classes'
    $compile = Invoke-SelectionTool -Program $compiler -Arguments @('-encoding', 'UTF-8', '-cp', $desktop, '-d', $classes,
        (Join-Path $Root 'scripts/DexDiff.java'), (Join-Path $Root 'scripts/SelectionCheck.java'),
        (Join-Path $Root 'scripts/SelectionCheckNativeVersionTest.java'), (Join-Path $Root 'scripts/SelectionCheckFixtureTest.java')) `
        -PrivateOutput (Join-Path $scratch 'compile-private.txt')
    Assert-Selection ($compile -eq 0) 'The compiled selection checker tests did not compile.'
    $nativeOutput = Join-Path $scratch 'native-private.txt'
    $native = Invoke-SelectionTool -Program $java -Arguments (@('-Xmx512m', '-XX:ActiveProcessorCount=2', '-cp',
        ($classes + [IO.Path]::PathSeparator + $desktop), 'SelectionCheckNativeVersionTest') + $fixtures) -PrivateOutput $nativeOutput
    Assert-Selection ($native -eq 0 -and (Get-Content $nativeOutput -Raw).Contains('NATIVE_VERSION_CHECKS_PASSED checks=90')) `
        'The native-version checker lost its exact insertion, refusal or initial-value controls.'
    $fixtureOutput = Join-Path $scratch 'fixture-private.txt'
    $fixtureCode = Invoke-SelectionTool -Program $java -Arguments (@('-Xmx512m', '-XX:ActiveProcessorCount=2', '-cp',
        ($classes + [IO.Path]::PathSeparator + $desktop), 'SelectionCheckFixtureTest') + $fixtures) -PrivateOutput $fixtureOutput
    Assert-Selection ($fixtureCode -eq 0 -and (Get-Content $fixtureOutput -Raw).Contains('FIXTURE_CHECKS_PASSED checks=8')) `
        'The checker lost its BuildVars refusal control or its launcher icon control.'
    # A matrix run keeps one checker, which decodes the clean fixture once and answers each case.
    $checker = Start-SelectionChecker -Java $java -ClassPath ($classes + [IO.Path]::PathSeparator + $desktop) -Apk $fixtures[0] `
        -PrivateOutput (Join-Path $scratch 'checker-private.txt')
    $answers = @(foreach ($n in 1..2) {
        Invoke-SelectionChecker -Checker $checker -Request @((Join-Path $scratch "missing-$n.apk"), (Join-Path $scratch 'missing.json'),
            (Join-Path $scratch "evidence-$n.json"))
    })
    $decoded = Stop-SelectionChecker -Checker $checker
    Assert-Selection ($answers.Count -eq 2 -and $answers -notcontains $true -and $null -ne $decoded -and $decoded.Cases -eq 2 -and
        $decoded.Decodes -eq 1 -and (Test-Path -LiteralPath (Join-Path $scratch 'evidence-2.json.failure-private.txt'))) `
        'The selection checker did not answer each case from one decode of the clean fixture.'
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
# The icon patch adds its three mipmaps and the launch logo its two drawables and its theme, and
# only a case that selects one may add its own.
$none = "[resources] added resources: 0`r`n[resources] files named by the patched table: 7115, moved 0"
$iconLines = "  0x7f0d0021 mipmap/hush_launcher`r`n  0x7f0d0022 mipmap/hush_launcher_foreground`r`n  0x7f0d0023 mipmap/hush_launcher_monochrome"
$logoLines = "  0x7f0807f0 drawable/hush_launch_logo`r`n  0x7f0807f1 drawable/hush_launch_logo_shape`r`n  0x7f1003a0 style/HushTelegramLaunchStock"
$tail = "`r`n[resources] files named by the patched table: 7117, moved 0"
$icons = "[resources] added resources: 3`r`n$iconLines$tail"
$logos = "[resources] added resources: 3`r`n$logoLines$tail"
$both = "[resources] added resources: 6`r`n$iconLines`r`n$logoLines$tail"
$full = ($plans | Where-Object Id -CEQ 'full67').Names
$default = $plans[0].Names
$logoOnly = ($plans | Where-Object Id -CEQ 'launch-logo').Names
Assert-Selection (Test-SelectionAddedResources -Report $none -Closure $default) 'A case without the icon was refused for adding nothing.'
Assert-Selection (-not (Test-SelectionAddedResources -Report $icons -Closure $default)) 'A case without the icon patch was allowed its mipmaps.'
Assert-Selection (-not (Test-SelectionAddedResources -Report $logos -Closure $default)) 'A case without the launch logo was allowed its drawables and theme.'
Assert-Selection (Test-SelectionAddedResources -Report $both -Closure $full) 'The full catalog was refused the icon''s and the launch logo''s resources.'
Assert-Selection (-not (Test-SelectionAddedResources -Report $icons -Closure $full)) 'The full catalog passed without the launch logo''s resources.'
Assert-Selection (-not (Test-SelectionAddedResources -Report $none -Closure $full)) 'The full catalog passed without the icon patch''s mipmaps.'
Assert-Selection (Test-SelectionAddedResources -Report $logos -Closure $logoOnly) 'The launch logo case was refused its drawables and theme.'
Assert-Selection (-not (Test-SelectionAddedResources -Report $both -Closure $logoOnly)) 'The launch logo case was allowed the icon patch''s mipmaps.'
Assert-Selection (-not (Test-SelectionAddedResources -Report ($both -replace 'hush_launcher_monochrome', 'hush_other') -Closure $full)) 'A stray added resource passed as the icon patch''s.'
Assert-Selection (-not (Test-SelectionAddedResources -Report ($both -replace 'hush_launch_logo_shape', 'hush_other') -Closure $full)) 'A stray added resource passed as the launch logo''s.'
Assert-Selection (-not (Test-SelectionAddedResources -Report 'no table report' -Closure $default)) 'A report without its added resources line passed.'
# The launch logo rewrites Telegram's dark launch theme, its splash background to black and its
# splash icon to the logo it added, and only a case that selects it may.
$rewritesNone = "[resources] rewritten values: 0`r`n[resources] renamed by the rebuild: 0"
$rewriteLines = "  0x7f100149 style/Theme.TMessages.Start [night-v29] item 0x0101062c #ff1f2732 -> #ff000000`r`n" +
    "  0x7f100149 style/Theme.TMessages.Start [night-v29] item 0x0101062d @0x7f0807db -> @0x7f0807f0"
$rewrites = "[resources] rewritten values: 2`r`n$rewriteLines`r`n[resources] renamed by the rebuild: 0`r`n$logos"
Assert-Selection (Test-SelectionRewrittenValues -Report $rewritesNone -Closure $default) 'A case without the launch logo was refused for rewriting nothing.'
Assert-Selection (-not (Test-SelectionRewrittenValues -Report $rewrites -Closure $default)) 'A case without the launch logo was allowed its two rewrites.'
Assert-Selection (Test-SelectionRewrittenValues -Report $rewrites -Closure $logoOnly) 'The launch logo case was refused its two rewrites.'
Assert-Selection (-not (Test-SelectionRewrittenValues -Report "$rewritesNone`r`n$logos" -Closure $logoOnly)) 'The launch logo case passed without rewriting the dark launch theme.'
Assert-Selection (-not (Test-SelectionRewrittenValues -Report ($rewrites -replace '-> #ff000000', '-> #ff111111') -Closure $logoOnly)) 'A dark launch screen that isn''t black passed.'
Assert-Selection (-not (Test-SelectionRewrittenValues -Report ($rewrites -replace '-> @0x7f0807f0', '-> @0x7f0807f1') -Closure $logoOnly)) 'A splash icon naming another resource passed as the logo.'
Assert-Selection (-not (Test-SelectionRewrittenValues -Report ($rewrites -replace 'night-v29', 'v31') -Closure $logoOnly)) 'A rewrite of the light launch theme passed.'
Assert-Selection (-not (Test-SelectionRewrittenValues -Report ($rewrites -replace 'rewritten values: 2', 'rewritten values: 3') -Closure $logoOnly)) 'A third rewrite passed with the logo''s two.'
Assert-Selection (-not (Test-SelectionRewrittenValues -Report 'no table report' -Closure $default)) 'A report without its rewritten values line passed.'
# No contract runs this matrix through the CLI, so its patch command is read from the source: every
# argument list that runs the CLI's patch command also passes --validate.
$selectionSource = [System.Management.Automation.Language.Parser]::ParseFile(
    (Join-Path $Root 'scripts/verify-patch-selections.ps1'), [ref]$null, [ref]$null)
$patchCommands = @($selectionSource.FindAll({ param($Node)
            $Node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
            @($Node.Right.FindAll({ param($Inner)
                        $Inner -is [System.Management.Automation.Language.StringConstantExpressionAst] -and
                        $Inner.Value -ceq 'patch' }, $true)).Count -gt 0 }, $true))
$unvalidated = @($patchCommands | Where-Object {
        @($_.Right.FindAll({ param($Inner)
                    $Inner -is [System.Management.Automation.Language.StringConstantExpressionAst] -and
                    $Inner.Value -ceq '--validate' }, $true)).Count -eq 0 })
Assert-Selection ($patchCommands.Count -ge 1 -and $unvalidated.Count -eq 0) `
    "verify-patch-selections.ps1 runs the CLI's patch command without --validate: $(@($unvalidated | ForEach-Object { $_.Extent.Text }) -join '; ')"
Write-Host "[selections] contracts passed ($assertions assertions)"
