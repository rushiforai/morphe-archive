<# Compiled manifest contracts. Synthetic aapt2 trees keep this suite offline and device-free. #>
[CmdletBinding()]
param([string]$Root = (Split-Path -Parent $PSScriptRoot))
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')

$script:checks = 0
function Assert-Manifest([bool]$condition, [string]$message) {
    $script:checks++
    if (-not $condition) { throw $message }
}
function Copy-Manifest($facts) { return $facts | ConvertTo-Json -Depth 12 | ConvertFrom-Json }
function Browser-Lines([string]$scheme) {
    return @(
        '        E: intent (line=10)',
        '          E: action (line=10)',
        '            A: http://schemas.android.com/apk/res/android:name="android.intent.action.VIEW"',
        '          E: category (line=10)',
        '            A: http://schemas.android.com/apk/res/android:name="android.intent.category.BROWSABLE"',
        '          E: data (line=10)',
        "            A: http://schemas.android.com/apk/res/android:scheme=`"$scheme`"")
}
function Fixture-Facts([string[]]$features = @(), [string]$build = '14.38.0',
        [ValidateSet('Absent', 'Resource', 'True', 'False')][string]$flag = 'Absent', [switch]$NoQueries) {
    $code = if ($build -eq '14.25.0') { '14258020' } else { '14388010' }
    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.AddRange([string[]]@(
        'N: android=http://schemas.android.com/apk/res/android (line=1)',
        '  E: manifest (line=1)',
        '    A: package="com.pinterest"',
        "    A: http://schemas.android.com/apk/res/android:versionName=`"$build`"",
        "    A: http://schemas.android.com/apk/res/android:versionCode=$code",
        '      E: uses-sdk (line=2)',
        '        A: http://schemas.android.com/apk/res/android:minSdkVersion=28',
        '    A: platformBuildVersionCode=36',
        '      E: uses-permission (line=3)',
        '        A: http://schemas.android.com/apk/res/android:name="android.permission.INTERNET"'))
    if (-not $NoQueries -or $features -contains 'browser') {
        $lines.Add('      E: queries (line=4)')
        if (-not $NoQueries) { $lines.AddRange([string[]]@('        E: package (line=5)',
            '          A: http://schemas.android.com/apk/res/android:name="vendor.browser"')) }
        if ($features -contains 'browser') {
            $lines.AddRange([string[]](Browser-Lines 'http')); $lines.AddRange([string[]](Browser-Lines 'https'))
        }
    }
    if (-not $NoQueries) {
        $lines.AddRange([string[]]@('      E: queries (line=6)', '        E: provider (line=7)',
            '          A: http://schemas.android.com/apk/res/android:authorities="vendor.maps"'))
    }
    $lines.AddRange([string[]]@(
        '      E: application (line=20)',
        '        A: http://schemas.android.com/apk/res/android:name=".PinterestApp"',
        '        A: http://schemas.android.com/apk/res/android:allowBackup=true',
        '        E: meta-data (line=21)',
        '          A: http://schemas.android.com/apk/res/android:name="firebase_messaging_auto_init_enabled"',
        '          A: http://schemas.android.com/apk/res/android:value=true',
        '        E: provider (line=22)',
        '          A: http://schemas.android.com/apk/res/android:name=".FirebaseInit"',
        '          A: http://schemas.android.com/apk/res/android:exported=false',
        '          A: http://schemas.android.com/apk/res/android:authorities="com.pinterest.firebase"',
        '          E: meta-data (line=23)',
        '            A: http://schemas.android.com/apk/res/android:name="vendor.firebase.init"',
        '            A: http://schemas.android.com/apk/res/android:value=true',
        '        E: provider (line=24)',
        '          A: http://schemas.android.com/apk/res/android:name=".AccountProvider"',
        '          A: http://schemas.android.com/apk/res/android:exported=false',
        '          A: http://schemas.android.com/apk/res/android:permission="com.pinterest.account.Credentials"',
        '          A: http://schemas.android.com/apk/res/android:authorities="com.pinterest.account"',
        '        E: service (line=25)',
        '          A: http://schemas.android.com/apk/res/android:name="com.google.firebase.messaging.FirebaseMessagingService"',
        '          A: http://schemas.android.com/apk/res/android:exported=false',
        '          A: http://schemas.android.com/apk/res/android:directBootAware=true',
        '          E: intent-filter (line=26)',
        '            E: action (line=27)',
        '              A: http://schemas.android.com/apk/res/android:name="com.google.firebase.MESSAGING_EVENT"',
        '        E: receiver (line=28)',
        '          A: http://schemas.android.com/apk/res/android:name="com.google.firebase.iid.FirebaseInstanceIdReceiver"',
        '          A: http://schemas.android.com/apk/res/android:exported=true',
        '          A: http://schemas.android.com/apk/res/android:permission="com.google.android.c2dm.permission.SEND"',
        '        E: activity (line=29)',
        '          A: http://schemas.android.com/apk/res/android:name=".AccountAuth"',
        '          A: http://schemas.android.com/apk/res/android:exported=false',
        '          E: intent-filter (line=30)',
        '            E: action (line=31)',
        '              A: http://schemas.android.com/apk/res/android:name="android.intent.action.VIEW"',
        '            E: data (line=32)',
        '              A: http://schemas.android.com/apk/res/android:scheme="pinterest-auth"'))
    if ($features -contains 'settings') {
        $lines.AddRange([string[]]@(
            '        E: activity-alias (line=40)',
            '          A: http://schemas.android.com/apk/res/android:name="app.hushpinterest.extension.pinterest.settings.OpenSettings"',
            '          A: http://schemas.android.com/apk/res/android:targetActivity="com.pinterest.activity.PinterestActivity"',
            '          A: http://schemas.android.com/apk/res/android:exported=true',
            '          E: intent-filter (line=41)',
            '            E: action (line=42)',
            '              A: http://schemas.android.com/apk/res/android:name="android.intent.action.APPLICATION_PREFERENCES"',
            '            E: category (line=43)',
            '              A: http://schemas.android.com/apk/res/android:name="android.intent.category.DEFAULT"'))
    }
    if ($features -contains 'analytics' -or $flag -ne 'Absent') {
        $lines.AddRange([string[]]@('        E: meta-data (line=50)',
            '          A: http://schemas.android.com/apk/res/android:name="firebase_analytics_collection_deactivated"'))
        if ($features -notcontains 'analytics' -and $flag -eq 'Resource') {
            $lines.Add('          A: http://schemas.android.com/apk/res/android:resource=@0x7f150001')
        } else {
            $value = if ($features -contains 'analytics' -or $flag -eq 'True') { 'true' } else { 'false' }
            $lines.Add("          A: http://schemas.android.com/apk/res/android:value=$value")
        }
    }
    return ConvertFrom-ManifestXmlTree -Lines $lines.ToArray() -Source "synthetic $build"
}

$settings = 'HushPinterest settings'; $analytics = 'Disable analytics'; $browser = 'Open links in your browser'
$all = @($settings, $analytics, $browser)
$allowlist = Join-Path $PSScriptRoot 'manifest-delta-allowlist.txt'
function Check-Manifest($stock, $patched, [string[]]$names) {
    $approved = @(Read-ManifestDeltaAllowlist -Path $allowlist -SelectedPatchNames $names)
    return Test-ManifestDelta -Stock $stock -Patched $patched -SelectedPatchNames $names -ApprovedManifestDelta $approved
}

foreach ($build in @('14.38.0', '14.25.0')) {
    $stock = Fixture-Facts -build $build
    Assert-Manifest ($stock.components.Count -eq 6 -and $stock.metadata.Count -eq 2 -and $stock.intentFilters.Count -eq 2) `
        'The parser lost a nonexported component or nested declaration.'
    Assert-Manifest ($stock.queries.Count -eq 4) 'The parser lost a vendor query block.'
    Assert-Manifest (($stock.components -join '') -like '*com.pinterest.AccountProvider*') 'Relative component names were not qualified.'
    foreach ($scenario in @(
            @{ label = 'default'; names = @($settings, $analytics); features = @('settings', 'analytics') },
            @{ label = 'all'; names = $all; features = @('settings', 'analytics', 'browser') },
            @{ label = 'analytics-excluded'; names = @($settings, $browser); features = @('settings', 'browser') },
            @{ label = 'analytics-only'; names = @($analytics, $settings); features = @('settings', 'analytics') })) {
        $check = Check-Manifest $stock (Fixture-Facts -build $build -features $scenario.features) $scenario.names
        Assert-Manifest $check.Valid "$build $($scenario.label): $($check.Reason)"
    }
    foreach ($flag in @('Resource', 'False', 'True')) {
        $withFlag = Fixture-Facts -build $build -flag $flag
        $included = Check-Manifest $withFlag (Fixture-Facts -build $build -features @('settings', 'analytics') -flag $flag) @($settings, $analytics)
        Assert-Manifest $included.Valid "Existing Firebase $flag metadata could not be deactivated: $($included.Reason)"
        $excluded = Check-Manifest $withFlag (Fixture-Facts -build $build -features @('settings') -flag $flag) @($settings)
        Assert-Manifest $excluded.Valid "Excluding Analytics changed original $flag metadata: $($excluded.Reason)"
    }
}
$stock = Fixture-Facts
$patched = Fixture-Facts -features @('settings', 'analytics', 'browser')
$valid = Check-Manifest $stock $patched $all
Assert-Manifest ($valid.Entries.Count -eq 6) 'The expected full delta is not readable as six exact entries.'
Assert-Manifest (@(Read-ManifestDeltaAllowlist -Path $allowlist -SelectedPatchNames @()).Count -eq 0) 'An excluded family retained approvals.'
Assert-Manifest (@(ConvertTo-ManifestDeltaEntries -Delta $valid.Delta -SchemaVersion 3).Count -eq 1) 'A historical delta included schema 4 fields.'
$withoutQueries = Check-Manifest (Fixture-Facts -NoQueries) (Fixture-Facts -NoQueries -features @('settings', 'browser')) @($settings, $browser)
Assert-Manifest $withoutQueries.Valid "A new browser query container was refused: $($withoutQueries.Reason)"

# Matching browser intents in a later vendor block are retained without adding duplicate intents.
$existing = Copy-Manifest $stock
$existingPatched = Fixture-Facts -features @('settings', 'analytics')
foreach ($entry in @(Read-ManifestDeltaAllowlist -Path $allowlist -SelectedPatchNames @($browser))) {
    $query = $entry.Substring('query-added '.Length) | ConvertFrom-Json
    if ($query.declaration.tag -ne 'intent') { continue }
    $canonical = ConvertTo-ManifestDeclaration -Owner 'queries#1' -Node $query.declaration
    $existing.queries += $canonical; $existingPatched.queries += $canonical
}
$existingCheck = Check-Manifest $existing $existingPatched $all
Assert-Manifest $existingCheck.Valid "An existing browser query was not preserved: $($existingCheck.Reason)"
Assert-Manifest ($existingCheck.Delta.queriesAdded.Count -eq 0) 'An existing browser query was added again.'

$negatives = [ordered]@{}
foreach ($name in @('FirebaseMessagingService', 'FirebaseInit', 'AccountProvider', 'AccountAuth', 'FirebaseInstanceIdReceiver')) {
    $bad = Copy-Manifest $patched
    $bad.components = @($bad.components | Where-Object { $_ -notlike "*$name*" })
    $negatives["removed $name"] = $bad
}
$bad = Copy-Manifest $patched; $bad.metadata = @($bad.metadata | ForEach-Object { $_ -replace '"android:value":"true"', '"android:value":"false"' })
$negatives['tampered Firebase metadata'] = $bad
$bad = Copy-Manifest $patched; $bad.metadata = @($bad.metadata | ForEach-Object {
    $entry = $_ | ConvertFrom-Json
    if ($entry.declaration.attributes.'android:name' -eq 'firebase_messaging_auto_init_enabled') {
        $entry.declaration.attributes.'android:value' = 'false'
        ConvertTo-ManifestDeclaration -Owner $entry.owner -Node $entry.declaration
    } else { $_ }
})
$negatives['disabled FCM initialization'] = $bad
$bad = Copy-Manifest $patched; $bad.components = @($bad.components | ForEach-Object { $_ -replace '"android:permission":"com.pinterest.account.Credentials"', '"android:permission":"wrong.permission"' })
$negatives['changed auth permission'] = $bad
$bad = Copy-Manifest $patched; $bad.components = @($bad.components | ForEach-Object { $_ -replace '"android:targetActivity":"com.pinterest.activity.PinterestActivity"', '"android:targetActivity":"com.pinterest.AccountAuth"' })
$negatives['changed settings target'] = $bad
$bad = Copy-Manifest $patched; $bad.intentFilters = @($bad.intentFilters | ForEach-Object { $_ -replace 'android.intent.action.APPLICATION_PREFERENCES', 'android.intent.action.VIEW' })
$negatives['unexpected settings filter'] = $bad
$bad = Copy-Manifest $patched; $bad.intentFilters += $bad.intentFilters[0]
$negatives['unexpected extra intent filter'] = $bad
$bad = Copy-Manifest $patched; $bad.queries = @($bad.queries | Where-Object { ($_ | ConvertFrom-Json).owner -ne 'queries#1' })
$negatives['removed vendor query block'] = $bad
$bad = Copy-Manifest $patched; $bad.queries += @($valid.Delta.queriesAdded)[0]
$negatives['duplicate browser query'] = $bad
$bad = Copy-Manifest $patched; $bad.queries = @($bad.queries | ForEach-Object {
    $entry = $_ | ConvertFrom-Json
    if ($entry.declaration.tag -eq 'intent') {
        ($entry.declaration.children | Where-Object { $_.tag -eq 'data' }).attributes.'android:scheme' = '*'
        ConvertTo-ManifestDeclaration -Owner $entry.owner -Node $entry.declaration
    } else { $_ }
})
$negatives['broadened browser query'] = $bad
$bad = Copy-Manifest $patched; $bad.metadata += @($valid.Delta.metadataAdded)[0]
$negatives['duplicate Analytics metadata'] = $bad
$bad = Copy-Manifest $patched; $bad.permissions += 'android.permission.CAMERA'
$negatives['unexpected permission'] = $bad
foreach ($pair in $negatives.GetEnumerator()) {
    $check = Check-Manifest $stock $pair.Value $all
    Assert-Manifest (-not $check.Valid) "Accepted $($pair.Key)."
}
$omitted = Check-Manifest $stock (Fixture-Facts -features @('settings', 'browser')) $all
Assert-Manifest (-not $omitted.Valid) 'Selecting Analytics without compiled deactivation was accepted.'
$excluded = Check-Manifest $stock $patched @($settings, $browser)
Assert-Manifest (-not $excluded.Valid) 'Excluded Analytics still deactivated collection.'

# Schema 4 requires facts and every delta array, and verifies every target independently.
$receipt = [pscustomobject]@{
    schemaVersion = 4
    release = @{ version = '1.0.0'; tag = 'v1.0.0'; commit = ('a' * 40); commitTimestamp = 1000; patchCount = 3 }
    toolchain = @{ patcherVersion = '1.15.0'; managerFloor = '1.33.0' }
    sbom = @{ file = 'patches-1.0.0.cdx.json'; sha256 = ('A' * 64); components = 1 }
    bundle = @{ file = 'patches-1.0.0.mpp'; sizeBytes = 1; sha256 = ('A' * 64); timestamp = 1000000 }
    extension = @{ dexPayloads = @(@{ name = 'classes.dex'; sizeBytes = 1; sha256 = ('A' * 64) }) }
    targets = @(@{ source = @{ package = $stock.package; versionName = $stock.versionName; versionCode = $stock.versionCode
            sha256 = ('A' * 64); forced = $false }
        patches = @($all | ForEach-Object { @{ name = $_; applied = $true } })
        sdk = @{ stockMinSdk = 28; patchedMinSdk = 28 }
        manifest = @{ stock = $stock; patched = $patched }; manifestDelta = $valid.Delta })
}
$receipt = Copy-Manifest $receipt
$arguments = @{ ExpectedVersion = '1.0.0'; ExpectedPatchNames = $all; ExpectedPatcherVersion = '1.15.0'
    ExpectedManagerFloor = '1.33.0'; ExpectedPackageName = 'com.pinterest'; ExpectedPackageVersions = @('14.38.0')
    ExpectedPackageVersionCodes = @{ '14.38.0' = '14388010' }; ApprovedManifestDelta = @(Read-ManifestDeltaAllowlist -Path $allowlist -SelectedPatchNames $all) }
$check = Test-ReleaseReceipt -Receipt $receipt @arguments
Assert-Manifest $check.Valid "Schema 4 receipt was refused: $($check.Reason)"
foreach ($property in $valid.Delta.PSObject.Properties) {
    $bad = Copy-Manifest $receipt; $bad.targets[0].manifestDelta.PSObject.Properties.Remove($property.Name)
    $check = Test-ReleaseReceipt -Receipt $bad @arguments
    Assert-Manifest (-not $check.Valid) "A missing $($property.Name) receipt array was accepted."
}
$bad = Copy-Manifest $receipt; $bad.targets[0].manifestDelta.metadataAdded = @()
Assert-Manifest (-not (Test-ReleaseReceipt -Receipt $bad @arguments).Valid) 'A false recorded metadata delta was accepted.'
$bad = Copy-Manifest $receipt; $bad.targets += Copy-Manifest $bad.targets[0]
$bad.targets[1].manifest.patched = Fixture-Facts -features @('settings', 'browser')
$bad.targets[1].manifestDelta = Get-ManifestDelta -Stock $stock -Patched $bad.targets[1].manifest.patched
Assert-Manifest (-not (Test-ReleaseReceipt -Receipt $bad @arguments).Valid) 'One good target hid missing Analytics on another.'
foreach ($schema in @(1, 2, 3)) {
    $historical = Copy-Manifest $receipt; $historical.schemaVersion = $schema
    $historical.targets[0].PSObject.Properties.Remove('manifest')
    foreach ($field in @('componentsAdded', 'componentsRemoved', 'metadataAdded', 'metadataRemoved', 'queriesAdded', 'queriesRemoved', 'intentFiltersAdded', 'intentFiltersRemoved')) {
        $historical.targets[0].manifestDelta.PSObject.Properties.Remove($field)
    }
    $legacyArguments = $arguments.Clone(); $legacyArguments.ExpectedSchemaVersion = $schema
    $legacyArguments.ApprovedManifestDelta = @('exported-added activity-alias:app.hushpinterest.extension.pinterest.settings.OpenSettings')
    $check = Test-ReleaseReceipt -Receipt $historical @legacyArguments
    Assert-Manifest $check.Valid "Historical schema $schema changed its contract: $($check.Reason)"
}
Write-Host "[manifest-contracts] $script:checks checks passed"
