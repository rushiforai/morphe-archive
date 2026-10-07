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
$adPermissions = @('com.google.android.gms.permission.AD_ID', 'android.permission.ACCESS_ADSERVICES_AD_ID',
    'android.permission.ACCESS_ADSERVICES_ATTRIBUTION')
$consentDefaults = @('google_analytics_default_allow_analytics_storage', 'google_analytics_default_allow_ad_storage',
    'google_analytics_default_allow_ad_user_data', 'google_analytics_default_allow_ad_personalization_signals')
$spoofSource = [IO.File]::ReadAllText((Join-Path $PSScriptRoot '../patches/src/main/kotlin/app/morphe/patches/pinterest/privacy/GoogleSignInSpoofPatch.kt'))
$certificateDer = -join @([regex]::Matches(($spoofSource -split 'PINTEREST_CERTIFICATE_DER =', 2)[1].Split([string[]]@('/**'), 2, 'None')[0],
    '"([0-9a-f]+)"') | ForEach-Object { $_.Groups[1].Value })
$certificateSha1 = [regex]::Match($spoofSource, 'PINTEREST_CERTIFICATE_SHA1 = "([0-9a-f]{40})"').Groups[1].Value
$signatureMetadata = [ordered]@{ 'app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE' = $certificateSha1; 'fake-signature' = $certificateDer }
function Metadata-Lines([string]$name, [string]$value) {
    return @('        E: meta-data (line=21)',
        "          A: http://schemas.android.com/apk/res/android:name=`"$name`"",
        "          A: http://schemas.android.com/apk/res/android:value=$value")
}
<# Both declared builds ask for the ad permissions, carry the ad services property beside another
   application property, and declare Google's four consent defaults as true. #>
function Fixture-Facts([string[]]$features = @(), [string]$build = '14.38.0',
        [ValidateSet('Absent', 'Resource', 'True', 'False')][string]$flag = 'Absent', [switch]$NoQueries,
        [switch]$NoConsentDefaults, [switch]$NoAdServices, [switch]$WithSignature) {
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
    if (-not $NoAdServices -and $features -notcontains 'adtracking') {
        foreach ($permission in $adPermissions) {
            $lines.AddRange([string[]]@('      E: uses-permission (line=3)',
                "        A: http://schemas.android.com/apk/res/android:name=`"$permission`""))
        }
    }
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
        '        E: property (line=21)',
        '          A: http://schemas.android.com/apk/res/android:name="android.window.PROPERTY_COMPAT_ALLOW_RESTRICTED_RESIZABILITY"',
        '          A: http://schemas.android.com/apk/res/android:value=true'))
    if (-not $NoAdServices -and $features -notcontains 'adtracking') {
        $lines.AddRange([string[]]@('        E: property (line=21)',
            '          A: http://schemas.android.com/apk/res/android:name="android.adservices.AD_SERVICES_CONFIG"',
            '          A: http://schemas.android.com/apk/res/android:resource=@0x7f180005'))
    }
    if (-not $NoConsentDefaults -or $features -contains 'analytics') {
        $consent = if ($features -contains 'analytics') { 'false' } else { 'true' }
        foreach ($name in $consentDefaults) { $lines.AddRange([string[]](Metadata-Lines $name $consent)) }
    }
    if ($features -contains 'analytics') {
        $lines.AddRange([string[]](Metadata-Lines 'firebase_crashlytics_collection_enabled' 'false'))
        $lines.AddRange([string[]](Metadata-Lines 'firebase_performance_collection_deactivated' 'true'))
        $lines.AddRange([string[]](Metadata-Lines 'google_analytics_adid_collection_enabled' 'false'))
    }
    if ($features -contains 'signature' -or $WithSignature) {
        foreach ($name in $signatureMetadata.Keys) {
            $value = $signatureMetadata[$name]
            $lines.AddRange([string[]]@('        E: meta-data (line=21)',
                "          A: http://schemas.android.com/apk/res/android:name=`"$name`"",
                "          A: http://schemas.android.com/apk/res/android:value=`"$value`" (Raw: `"$value`")"))
        }
    }
    $lines.AddRange([string[]]@(
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
$adTracking = 'Remove ad tracking permissions'; $signature = 'Spoof signature for Google sign-in'
$all = @($settings, $analytics, $browser, $adTracking, $signature)
$allowlist = Join-Path $PSScriptRoot 'manifest-delta-allowlist.txt'
function Check-Manifest($stock, $patched, [string[]]$names) {
    $approved = @(Read-ManifestDeltaAllowlist -Path $allowlist -SelectedPatchNames $names)
    return Test-ManifestDelta -Stock $stock -Patched $patched -SelectedPatchNames $names -ApprovedManifestDelta $approved
}

Assert-Manifest ($certificateDer.Length -eq 1190 -and $certificateSha1.Length -eq 40) 'The patch source lost its certificate constants.'
$signatureTemplates = @(Read-ManifestDeltaAllowlist -Path $allowlist -SelectedPatchNames @($signature))
$signatureWritten = @($signatureMetadata.Keys | ForEach-Object {
    'metadata-added ' + (ConvertTo-ManifestDeclaration -Owner 'application' -Node ([pscustomobject]@{ tag = 'meta-data'
        attributes = [pscustomobject]@{ 'android:name' = $_; 'android:value' = $signatureMetadata[$_] }; children = @() })) })
Assert-Manifest ((@($signatureTemplates | Sort-Object -CaseSensitive) -join "`n") -ceq (@($signatureWritten | Sort-Object -CaseSensitive) -join "`n")) `
    "The allowlist approves other signature metadata than the patch writes: $($signatureTemplates -join '; ')"
foreach ($build in @('14.38.0', '14.25.0')) {
    $stock = Fixture-Facts -build $build
    Assert-Manifest ($stock.components.Count -eq 6 -and $stock.metadata.Count -eq 6 -and $stock.intentFilters.Count -eq 2) `
        'The parser lost a nonexported component or nested declaration.'
    Assert-Manifest ($stock.queries.Count -eq 4) 'The parser lost a vendor query block.'
    Assert-Manifest (($stock.components -join '') -like '*com.pinterest.AccountProvider*') 'Relative component names were not qualified.'
    Assert-Manifest (@($adPermissions | Where-Object { $stock.permissions -ccontains $_ }).Count -eq 3 -and
        ($stock.components -join '') -like '*android.adservices.AD_SERVICES_CONFIG*') 'The parser lost an ad permission or property.'
    foreach ($scenario in @(
            @{ label = 'default'; names = @($settings, $analytics, $adTracking); features = @('settings', 'analytics', 'adtracking') },
            @{ label = 'all'; names = $all; features = @('settings', 'analytics', 'browser', 'adtracking', 'signature') },
            @{ label = 'analytics-excluded'; names = @($settings, $browser, $adTracking); features = @('settings', 'browser', 'adtracking') },
            @{ label = 'analytics-only'; names = @($analytics, $settings); features = @('settings', 'analytics') },
            @{ label = 'ad-tracking-only'; names = @($adTracking, $settings); features = @('settings', 'adtracking') },
            @{ label = 'signature-only'; names = @($signature, $settings); features = @('settings', 'signature') })) {
        $check = Check-Manifest $stock (Fixture-Facts -build $build -features $scenario.features) $scenario.names
        Assert-Manifest $check.Valid "$build $($scenario.label): $($check.Reason)"
    }
    # A build without the consent defaults gets them added as denied, and one without any ad
    # declaration is left alone by Remove ad tracking permissions.
    $noConsent = Check-Manifest (Fixture-Facts -build $build -NoConsentDefaults) `
        (Fixture-Facts -build $build -NoConsentDefaults -features @('settings', 'analytics')) @($settings, $analytics)
    Assert-Manifest $noConsent.Valid "$build without consent defaults: $($noConsent.Reason)"
    Assert-Manifest (@($noConsent.Delta.metadataAdded | Where-Object { $_ -like '*google_analytics_default_allow_*"android:value":"false"*' }).Count -eq 4) `
        "$build without consent defaults didn't add all four as denied."
    $noAds = Check-Manifest (Fixture-Facts -build $build -NoAdServices) (Fixture-Facts -build $build -NoAdServices -features @('settings')) @($settings, $adTracking)
    Assert-Manifest $noAds.Valid "$build without ad declarations: $($noAds.Reason)"
    foreach ($flag in @('Resource', 'False', 'True')) {
        $withFlag = Fixture-Facts -build $build -flag $flag
        $included = Check-Manifest $withFlag (Fixture-Facts -build $build -features @('settings', 'analytics') -flag $flag) @($settings, $analytics)
        Assert-Manifest $included.Valid "Existing Firebase $flag metadata could not be deactivated: $($included.Reason)"
        $excluded = Check-Manifest $withFlag (Fixture-Facts -build $build -features @('settings') -flag $flag) @($settings)
        Assert-Manifest $excluded.Valid "Excluding Analytics changed original $flag metadata: $($excluded.Reason)"
    }
}
$stock = Fixture-Facts
$patched = Fixture-Facts -features @('settings', 'analytics', 'browser', 'adtracking', 'signature')
$valid = Check-Manifest $stock $patched $all
# Settings 3, Analytics 8 added and 4 consent values replaced, browser 2, ad tracking 3 permissions
# and the application declaration replaced once, and the 2 signature metadata entries.
Assert-Manifest ($valid.Entries.Count -eq 24) "The expected full delta is not readable as 24 exact entries: $($valid.Entries.Count)."
Assert-Manifest (@($valid.Delta.metadataAdded | Where-Object { $_ -clike '*SPOOFED_PACKAGE_SIGNATURE*' -or $_ -clike '*"fake-signature"*' }).Count -eq 2) `
    'The full delta does not add both signature metadata entries.'
$applicationChanges = @($valid.Entries | Where-Object { $_ -like 'component-*' -and $_ -like '*"tag":"application"*' })
Assert-Manifest ($applicationChanges.Count -eq 2 -and $applicationChanges[0] -like '*PROPERTY_COMPAT_ALLOW_RESTRICTED_RESIZABILITY*' -and
    $applicationChanges[1] -like '*PROPERTY_COMPAT_ALLOW_RESTRICTED_RESIZABILITY*' -and
    @($applicationChanges | Where-Object { $_ -like '*AD_SERVICES_CONFIG*' }).Count -eq 1 -and
    $applicationChanges -ccontains ('component-removed ' + @($stock.components | Where-Object { $_ -like '*AD_SERVICES_CONFIG*' })[0])) `
    'The ad services property removal changed more of the application than that property.'
Assert-Manifest (@(Read-ManifestDeltaAllowlist -Path $allowlist -SelectedPatchNames @()).Count -eq 0) 'An excluded family retained approvals.'
$historical = @(ConvertTo-ManifestDeltaEntries -Delta $valid.Delta -SchemaVersion 3)
Assert-Manifest (($historical -join '; ') -ceq ((@('exported-added activity-alias:app.hushpinterest.extension.pinterest.settings.OpenSettings') +
    @($adPermissions | ForEach-Object { "permission-removed $_" }) | Sort-Object -CaseSensitive) -join '; ')) `
    "A historical delta included schema 4 fields: $($historical -join '; ')"
$withoutQueries = Check-Manifest (Fixture-Facts -NoQueries) (Fixture-Facts -NoQueries -features @('settings', 'browser')) @($settings, $browser)
Assert-Manifest $withoutQueries.Valid "A new browser query container was refused: $($withoutQueries.Reason)"

# Matching browser intents in a later vendor block are retained without adding duplicate intents.
$existing = Copy-Manifest $stock
$existingPatched = Fixture-Facts -features @('settings', 'analytics', 'adtracking', 'signature')
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
$bad = Copy-Manifest $patched; $bad.permissions = @($bad.permissions | Where-Object { $_ -cne 'android.permission.INTERNET' })
$negatives['removed INTERNET permission'] = $bad
foreach ($permission in $adPermissions) {
    $bad = Copy-Manifest $patched; $bad.permissions += $permission
    $negatives["kept $permission"] = $bad
}
$bad = Copy-Manifest $patched; $bad.components = @($stock.components | Where-Object { ($_ | ConvertFrom-Json).tag -ceq 'application' }) +
    @($bad.components | Where-Object { ($_ | ConvertFrom-Json).tag -cne 'application' })
$negatives['kept the ad services property'] = $bad
$bad = Copy-Manifest $patched; $bad.components = @($bad.components | ForEach-Object {
    $node = $_ | ConvertFrom-Json
    if ($node.tag -ceq 'application') {
        $node.children = @(@($node.children) | Where-Object { $_.tag -cne 'property' })
        ConvertTo-ManifestDeclaration -Node $node
    } else { $_ }
})
$negatives['removed another application property'] = $bad
$bad = Copy-Manifest $patched; $bad.components = @($bad.components | ForEach-Object { $_ -replace '"android:allowBackup":"true"', '"android:allowBackup":"false"' })
$negatives['changed an application attribute'] = $bad
$bad = Copy-Manifest $patched; $bad.metadata = @($bad.metadata | ForEach-Object {
    if ($_ -like '*google_analytics_default_allow_ad_storage*') { $_ -replace '"android:value":"false"', '"android:value":"true"' } else { $_ }
})
$negatives['consent default left granted'] = $bad
$bad = Copy-Manifest $patched; $bad.metadata = @($bad.metadata | ForEach-Object { $_ -replace $certificateSha1, ('0' * 40) })
$negatives['signature metadata naming another certificate'] = $bad
$bad = Copy-Manifest $patched; $bad.metadata = @($bad.metadata | Where-Object { $_ -cnotlike '*"fake-signature"*' })
$negatives['one signature metadata entry left out'] = $bad
$bad = Copy-Manifest $patched; $bad.permissions += 'android.permission.FAKE_PACKAGE_SIGNATURE'
$negatives['signature spoofing permission requested'] = $bad
foreach ($pair in $negatives.GetEnumerator()) {
    $check = Check-Manifest $stock $pair.Value $all
    Assert-Manifest (-not $check.Valid) "Accepted $($pair.Key)."
}
$omitted = Check-Manifest $stock (Fixture-Facts -features @('settings', 'browser', 'adtracking')) $all
Assert-Manifest (-not $omitted.Valid) 'Selecting Analytics without compiled deactivation was accepted.'
$excluded = Check-Manifest $stock $patched @($settings, $browser, $adTracking)
Assert-Manifest (-not $excluded.Valid) 'Excluded Analytics still deactivated collection.'
$keptAds = Check-Manifest $stock (Fixture-Facts -features @('settings', 'analytics', 'browser', 'signature')) $all
Assert-Manifest (-not $keptAds.Valid) 'Selecting Remove ad tracking permissions without the compiled removal was accepted.'
$droppedAds = Check-Manifest $stock $patched @($settings, $analytics, $browser, $signature)
Assert-Manifest (-not $droppedAds.Valid) 'Excluded Remove ad tracking permissions still removed the ad declarations.'
$alone = Check-Manifest $stock (Fixture-Facts -features @('adtracking')) @($adTracking)
Assert-Manifest (-not $alone.Valid -and $alone.Reason -like '*settings dependency*') 'Remove ad tracking permissions passed without its settings dependency.'
$unreviewed = Test-ManifestDelta -Stock $stock -Patched (Fixture-Facts -features @('settings', 'adtracking')) -SelectedPatchNames @($settings, $adTracking) `
    -ApprovedManifestDelta @(Read-ManifestDeltaAllowlist -Path $allowlist -SelectedPatchNames @($settings, $adTracking) | Where-Object { $_ -notlike 'component-removed *' })
Assert-Manifest (-not $unreviewed.Valid -and $unreviewed.Reason -like '*no exact reviewed template*AD_SERVICES_CONFIG*') 'The ad services property removal passed without its reviewed template.'
$noSignature = Check-Manifest $stock (Fixture-Facts -features @('settings', 'analytics', 'browser', 'adtracking')) $all
Assert-Manifest (-not $noSignature.Valid) "Selecting $signature without the compiled metadata was accepted."
$droppedSignature = Check-Manifest $stock $patched @($settings, $analytics, $browser, $adTracking)
Assert-Manifest (-not $droppedSignature.Valid) "Excluded $signature still added the signature metadata."
$signatureAlone = Check-Manifest $stock (Fixture-Facts -features @('signature')) @($signature)
Assert-Manifest (-not $signatureAlone.Valid -and $signatureAlone.Reason -like '*settings dependency*') "$signature passed without its settings dependency."
$alreadySpoofed = Check-Manifest (Fixture-Facts -WithSignature) (Fixture-Facts -WithSignature -features @('settings')) @($settings, $signature)
Assert-Manifest (-not $alreadySpoofed.Valid -and $alreadySpoofed.Reason -like '*already declares*') "A stock manifest already naming the signature was accepted: $($alreadySpoofed.Reason)"

# Schema 4 requires facts and every delta array, and verifies every target independently.
$receipt = [pscustomobject]@{
    schemaVersion = 4
    release = @{ version = '1.0.0'; tag = 'v1.0.0'; commit = ('a' * 40); commitTimestamp = 1000; patchCount = $all.Count }
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
$bad.targets[1].manifest.patched = Fixture-Facts -features @('settings', 'browser', 'adtracking', 'signature')
$bad.targets[1].manifestDelta = Get-ManifestDelta -Stock $stock -Patched $bad.targets[1].manifest.patched
Assert-Manifest (-not (Test-ReleaseReceipt -Receipt $bad @arguments).Valid) 'One good target hid missing Analytics on another.'
foreach ($schema in @(1, 2, 3)) {
    $historical = Copy-Manifest $receipt; $historical.schemaVersion = $schema
    $historical.targets[0].PSObject.Properties.Remove('manifest')
    foreach ($field in @('componentsAdded', 'componentsRemoved', 'metadataAdded', 'metadataRemoved', 'queriesAdded', 'queriesRemoved', 'intentFiltersAdded', 'intentFiltersRemoved')) {
        $historical.targets[0].manifestDelta.PSObject.Properties.Remove($field)
    }
    $legacyArguments = $arguments.Clone(); $legacyArguments.ExpectedSchemaVersion = $schema
    $legacyArguments.ApprovedManifestDelta = @(@('exported-added activity-alias:app.hushpinterest.extension.pinterest.settings.OpenSettings') +
        @($adPermissions | ForEach-Object { "permission-removed $_" }))
    $check = Test-ReleaseReceipt -Receipt $historical @legacyArguments
    Assert-Manifest $check.Valid "Historical schema $schema changed its contract: $($check.Reason)"
}
Write-Host "[manifest-contracts] $script:checks checks passed"
