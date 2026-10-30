<#
.SYNOPSIS
    The receipt a whole-app walk leaves, and what makes one good enough to publish a bundle on.

.DESCRIPTION
    Dot-sourced by release/release.ps1, whose publish stage refuses to publish a bundle without a
    receipt that backs it for each Telegram build it patches (Test-WalkReceipts). Nothing goes public until an APK patched from the exact bundle being
    released has been walked end to end on a release phone or an emulator and came back PASS:
    every scenario walk-scenarios.json asks of the patches in that APK, with no Telegram crash.

    The walk writes walk-receipt.json with New-WalkReceipt. It carries the patch artifact record
    (New-WalkArtifact) of the signed APK that was installed: that APK's SHA-256, its package,
    version and version code, the vendor fixture and bundle it was patched from, and the patches
    selected. Publish holds the record to the signed bundle it's about to upload and the catalog
    beside it, and holds the installed APK's hash to the record, so a walk of any other build, an
    APK left from an older bundle, or a build with patches left out can't stand in for this one.

    A walk signed out of Telegram can only open what comes before sign-in and the Hush settings, so
    its receipt is a settings smoke. A signed-in walk also opens Telegram's own screens and is the
    feature acceptance. Test-WalkReceipt answers which one a receipt is. The Play build's walk has
    to be signed in, since no other walk opens its screens past sign-in.

    The receipt and the record are plain JSON on this machine, kept so a walk can be read back and
    a patched APK walked again with -SkipPatch. They're a check that the walk that was run matches
    the build being published, not proof that can't be edited.
#>

. (Join-Path $PSScriptRoot 'patch-target.ps1')

# The phones release walks run on, by ro.product.model. An emulator passes by its serial.
$WalkReceiptPhones = @('SM-S908U1', 'SM-S938B')
# What a walk has to open, and which patches make each part of it required.
$WalkScenarioPath = Join-Path $PSScriptRoot 'walk-scenarios.json'
$WalkAccounts = [Collections.Generic.Dictionary[string, string]]::new([StringComparer]::Ordinal)
$WalkAccounts['signed in'] = 'feature acceptance'
$WalkAccounts['signed out'] = 'settings smoke'
# A device clock and this one can disagree a little; a walk later than this hasn't happened yet.
$WalkClockSkew = [TimeSpan]::FromMinutes(5)
# The builds a signed-out smoke can't stand in for. The web build runs signed in on the release
# phone every day; nothing else opens the Play build's screens past sign-in.
$WalkSignedInPackages = @('org.telegram.messenger')

function Read-WalkScenarios {
    <#
    .SYNOPSIS
        The scenarios in walk-scenarios.json, each with an id, a kind, the account it needs (any, or
        'signed in') and the patches that make it required (none means always).
    #>
    param([string]$Path = $WalkScenarioPath)
    $manifest = Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json
    if ($null -eq $manifest -or $manifest.schema -ne 1) { throw "$Path isn't a schema 1 walk scenario list." }
    $ids = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($scenario in @($manifest.scenarios)) {
        if ($scenario.id -isnot [string] -or -not $scenario.id) { throw "$Path has a scenario with no id." }
        if (-not $ids.Add($scenario.id)) { throw "$Path names the scenario $($scenario.id) twice." }
        if (@('launch', 'visit', 'settings-home', 'settings', 'section') -cnotcontains $scenario.kind) {
            throw "$Path gives the scenario $($scenario.id) the unknown kind '$($scenario.kind)'."
        }
        $account = if ($scenario.account) { [string]$scenario.account } else { 'any' }
        if (@('any', 'signed in') -cnotcontains $account) { throw "$Path gives the scenario $($scenario.id) the unknown account '$account'." }
        [pscustomobject]@{
            Id = $scenario.id; Kind = $scenario.kind; Account = $account
            Link = [string]$scenario.link; Page = [string]$scenario.page; Patches = @($scenario.patches | Where-Object { $_ })
        }
    }
}

function Get-WalkRequiredScenarios {
    <#
    .SYNOPSIS
        The ids a walk of a build with -Patches has to have opened, signed in or signed out. A
        scenario tied to patches is required when any of them is in the build; one needing a
        signed-in account is left out of a signed-out walk.
    #>
    param([Parameter(Mandatory = $true)]$Scenarios, [string[]]$Patches = @(), [Parameter(Mandatory = $true)][string]$Account)
    foreach ($scenario in @($Scenarios)) {
        if ($scenario.Account -ceq 'signed in' -and $Account -cne 'signed in') { continue }
        if (@($scenario.Patches).Count -gt 0 -and -not @($scenario.Patches | Where-Object { @($Patches) -ccontains $_ })) { continue }
        $scenario.Id
    }
}

function New-WalkArtifact {
    <#
    .SYNOPSIS
        The record of one signed APK patch-for-device.ps1 built: its hash and identity, and the
        fixture, bundle and patch selection it came from.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$ApkSha256,
        [Parameter(Mandatory = $true)][string]$Package,
        [Parameter(Mandatory = $true)][string]$PackageVersion,
        [Parameter(Mandatory = $true)][string]$VersionCode,
        [Parameter(Mandatory = $true)][string[]]$SignerSha256,
        [Parameter(Mandatory = $true)][string]$FixtureName,
        [Parameter(Mandatory = $true)][string]$FixtureSha256,
        [Parameter(Mandatory = $true)][string]$BundleVersion,
        [Parameter(Mandatory = $true)][string]$BundleSha256,
        [Parameter(Mandatory = $true)][string[]]$Patches,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Created
    )
    return [ordered]@{
        schema = 1; apkSha256 = $ApkSha256.ToLowerInvariant(); package = $Package; packageVersion = $PackageVersion
        versionCode = $VersionCode
        signerSha256 = @($SignerSha256 | ForEach-Object { $_.ToLowerInvariant() } | Sort-Object -CaseSensitive -Unique)
        fixture = $FixtureName; fixtureSha256 = $FixtureSha256.ToLowerInvariant()
        bundleVersion = $BundleVersion; bundleSha256 = $BundleSha256.ToLowerInvariant()
        patches = @($Patches | Sort-Object -CaseSensitive); created = $Created.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ')
    }
}

function New-WalkReceipt {
    <#
    .SYNOPSIS
        The receipt for one walk, as an ordered dictionary ready for ConvertTo-Json.
    #>
    param(
        [Parameter(Mandatory = $true)][ValidateSet('PASS', 'PARTIAL', 'FAIL')][string]$Result,
        [Parameter(Mandatory = $true)][bool]$Full,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Device,
        [Parameter(Mandatory = $true)][string]$Package,
        [AllowEmptyString()][string]$AppVersion,
        [Parameter(Mandatory = $true)][string]$BundleSha256,
        [AllowEmptyString()][string]$InstalledApkSha256,
        $Artifact,
        [Parameter(Mandatory = $true)][string]$Account,
        [string[]]$Scenarios = @(),
        [Parameter(Mandatory = $true)][DateTimeOffset]$Started,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Finished,
        [int]$Screens,
        [int]$Crashes,
        [string[]]$Problems = @()
    )
    return [ordered]@{
        schema = 2; result = $Result; full = $Full
        serial = $Serial; device = $Device; emulator = $Serial.StartsWith('emulator-', [StringComparison]::Ordinal)
        package = $Package; appVersion = $AppVersion; bundleSha256 = $BundleSha256.ToLowerInvariant()
        installedApkSha256 = $InstalledApkSha256.ToLowerInvariant(); artifact = $Artifact
        account = $Account; kind = $(if ($WalkAccounts.ContainsKey($Account)) { $WalkAccounts[$Account] } else { 'none' })
        scenarios = @($Scenarios)
        started = $Started.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ'); finished = $Finished.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ')
        screens = $Screens; crashes = $Crashes; problems = @($Problems)
    }
}

function ConvertFrom-WalkStamp {
    <# A receipt time as a DateTimeOffset, or $null when it isn't one. Either shell's JSON reader. #>
    param($Value)
    if ($Value -is [datetime]) { return [DateTimeOffset]$Value.ToUniversalTime() }
    $parsed = [DateTimeOffset]::MinValue
    if ($Value -is [string] -and [DateTimeOffset]::TryParseExact($Value, "yyyy-MM-dd'T'HH:mm:ss'Z'", [Globalization.CultureInfo]::InvariantCulture,
            [Globalization.DateTimeStyles]::AssumeUniversal, [ref]$parsed)) { return $parsed }
    return $null
}

function Test-WalkReceipt {
    <#
    .SYNOPSIS
        Whether the receipt at -Path is a full, passing walk of the bundle at -BundlePath, on a
        release phone or an emulator, of an APK patched from it with every patch -PatchListPath
        lists. Answers @{ Valid; Reason; Receipt; Kind }.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$BundlePath,
        [Parameter(Mandatory = $true)][string]$PatchListPath,
        [string]$ScenarioPath = $WalkScenarioPath
    )
    function Fail([string]$Reason) { return [pscustomobject]@{ Valid = $false; Reason = $Reason; Receipt = $null; Kind = $null } }
    function Test-Sha256($Value) { return $Value -is [string] -and $Value -cmatch '^[0-9a-f]{64}$' }
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { return Fail "there's no walk receipt at $Path" }
    try { $receipt = Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json }
    catch { return Fail "the walk receipt doesn't read as JSON: $($_.Exception.Message)" }
    if ($null -eq $receipt -or ($receipt.schema -isnot [int] -and $receipt.schema -isnot [long]) -or $receipt.schema -ne 2) {
        return Fail "the walk receipt isn't schema 2"
    }
    if ($receipt.result -isnot [string] -or $receipt.result -cne 'PASS') {
        return Fail "the walk ended $(if ($receipt.result -is [string] -and $receipt.result) { $receipt.result } else { 'with no result' }), not PASS"
    }
    if ($receipt.full -isnot [bool] -or -not $receipt.full) { return Fail 'the walk skipped part of the app, so it was not the whole app' }
    if (($receipt.screens -isnot [int] -and $receipt.screens -isnot [long]) -or $receipt.screens -lt 1) {
        return Fail "the walk receipt doesn't say it opened any screen"
    }
    if (($receipt.crashes -isnot [int] -and $receipt.crashes -isnot [long]) -or $receipt.crashes -ne 0) {
        return Fail 'the walk recorded a Telegram crash'
    }
    if ($null -eq $receipt.problems -or @($receipt.problems).Count -gt 0) {
        return Fail "the walk recorded problems: $(@($receipt.problems) -join '; ')"
    }
    if ($receipt.device -isnot [string] -or $receipt.serial -isnot [string] -or $receipt.emulator -isnot [bool]) {
        return Fail "the walk receipt doesn't say which device walked it"
    }
    $isEmulator = $receipt.serial.StartsWith('emulator-', [StringComparison]::Ordinal)
    if ($receipt.emulator -ne $isEmulator -or (-not $isEmulator -and $WalkReceiptPhones -cnotcontains $receipt.device)) {
        return Fail "$($receipt.device) isn't one of the release walk phones ($($WalkReceiptPhones -join ', ')) or an emulator"
    }
    $started = ConvertFrom-WalkStamp $receipt.started
    $finished = ConvertFrom-WalkStamp $receipt.finished
    if ($null -eq $started -or $null -eq $finished) { return Fail "the walk receipt's start and finish aren't UTC times" }
    if ($finished -lt $started) { return Fail 'the walk finished before it started' }
    if ($finished -gt [DateTimeOffset]::UtcNow.Add($WalkClockSkew)) { return Fail "the walk says it finished at $($receipt.finished), which hasn't come yet" }

    if (-not (Test-Path -LiteralPath $BundlePath -PathType Leaf)) { return Fail "there's no bundle at $BundlePath to hold the walk to" }
    $bundleSha256 = (Get-FileHash -LiteralPath $BundlePath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($receipt.bundleSha256 -isnot [string] -or $receipt.bundleSha256 -cne $bundleSha256) {
        return Fail "the walked APK was patched with bundle '$($receipt.bundleSha256)', and this one is '$bundleSha256'"
    }

    # The installed APK is the signed APK the record describes, patched from this bundle.
    if (-not (Test-Sha256 $receipt.installedApkSha256)) { return Fail "the walk receipt doesn't name the installed APK's SHA-256" }
    $artifact = $receipt.artifact
    if ($null -eq $artifact -or $artifact.schema -ne 1) { return Fail "the walk receipt has no patch artifact record for the APK it walked" }
    if (-not (Test-Sha256 $artifact.apkSha256) -or $artifact.apkSha256 -cne $receipt.installedApkSha256) {
        return Fail "the installed APK is '$($receipt.installedApkSha256)', not the patched APK '$($artifact.apkSha256)' the record names"
    }
    if ($artifact.bundleSha256 -cne $bundleSha256) {
        return Fail "the patched APK came from bundle '$($artifact.bundleSha256)', not this one, so it's left from another build"
    }
    if (-not (Test-Sha256 $artifact.fixtureSha256) -or $artifact.fixture -isnot [string] -or -not $artifact.fixture) {
        return Fail "the patch artifact record doesn't name the vendor fixture it was patched from"
    }
    # apksigner verified the APK when the record was made, and the installed hash ties it to that file.
    $signers = @($artifact.signerSha256)
    if ($signers.Count -eq 0 -or @($signers | Where-Object { -not (Test-Sha256 $_) }).Count -ne 0) {
        return Fail "the patch artifact record doesn't name the patched APK's signing certificate"
    }
    $created = ConvertFrom-WalkStamp $artifact.created
    if ($null -eq $created -or $created -gt $started) { return Fail 'the patched APK was made after the walk started' }

    if (-not (Test-Path -LiteralPath $PatchListPath -PathType Leaf)) { return Fail "there's no patch list at $PatchListPath to hold the walk to" }
    $catalog = Get-Content -LiteralPath $PatchListPath -Raw | ConvertFrom-Json
    if ($receipt.package -isnot [string] -or $artifact.package -cne $receipt.package) {
        return Fail "the walk was of $($receipt.package), and the patched APK is $($artifact.package)"
    }
    try { $target = Get-PatchTarget -PatchList $catalog -PackageName $receipt.package }
    catch { return Fail "the walk was of $($receipt.package), which this bundle doesn't patch" }
    if (-not (Test-DeclaredBuild -Target $target -VersionName ([string]$artifact.packageVersion) -VersionCode ([string]$artifact.versionCode))) {
        return Fail "the patched APK is $($artifact.packageVersion) ($($artifact.versionCode)), which this bundle doesn't declare"
    }
    $fixtureName = Get-VendorFixtureName -Target $target -VersionName ([string]$artifact.packageVersion) -VersionCode ([string]$artifact.versionCode)
    if ($artifact.fixture -cne $fixtureName) {
        return Fail "the APK was patched from '$($artifact.fixture)', not the declared fixture $fixtureName"
    }
    if ($receipt.appVersion -cne $artifact.packageVersion) {
        return Fail "the installed Telegram is '$($receipt.appVersion)', not the patched $($artifact.packageVersion)"
    }
    $catalogNames = @($catalog.patches | ForEach-Object { [string]$_.name } | Sort-Object -CaseSensitive)
    $artifactNames = @($artifact.patches | ForEach-Object { [string]$_ } | Sort-Object -CaseSensitive)
    $missingPatches = @($catalogNames | Where-Object { $artifactNames -cnotcontains $_ })
    $extraPatches = @($artifactNames | Where-Object { $catalogNames -cnotcontains $_ })
    if ($missingPatches.Count -gt 0 -or $extraPatches.Count -gt 0) {
        return Fail ("the patched APK wasn't patched with every patch in this bundle" +
            $(if ($missingPatches.Count) { "; it left out $($missingPatches -join ', ')" }) +
            $(if ($extraPatches.Count) { "; it names $($extraPatches -join ', ') too" }))
    }

    # Every scenario those patches ask of a walk on this account, not just the pages a caller listed.
    if ($receipt.account -isnot [string] -or -not $WalkAccounts.ContainsKey($receipt.account)) {
        return Fail "the walk receipt doesn't say whether Telegram was signed in"
    }
    $kind = $WalkAccounts[$receipt.account]
    if ($receipt.kind -cne $kind) { return Fail "a walk $($receipt.account) is a $kind, and the receipt calls it '$($receipt.kind)'" }
    $required = @(Get-WalkRequiredScenarios -Scenarios @(Read-WalkScenarios -Path $ScenarioPath) -Patches $artifactNames -Account $receipt.account)
    $walked = @($receipt.scenarios | ForEach-Object { [string]$_ })
    $left = @($required | Where-Object { $walked -cnotcontains $_ })
    if ($left.Count -gt 0) { return Fail "the walk left out $($left -join ', ')" }
    return [pscustomobject]@{ Valid = $true; Reason = $null; Receipt = $receipt; Kind = $kind }
}

function Test-WalkReceipts {
    <#
    .SYNOPSIS
        Whether the receipts at -Path back the bundle at -BundlePath for every Telegram build
        -PatchListPath declares: one receipt Test-WalkReceipt takes for each package, signed in for
        the packages in $WalkSignedInPackages. Answers @{ Valid; Reason; Walks }, Walks holding one
        Test-WalkReceipt answer per package.
    #>
    param(
        [Parameter(Mandatory = $true)][AllowEmptyCollection()][string[]]$Path,
        [Parameter(Mandatory = $true)][string]$BundlePath,
        [Parameter(Mandatory = $true)][string]$PatchListPath,
        [string]$ScenarioPath = $WalkScenarioPath
    )
    function Fail([string]$Reason) { return [pscustomobject]@{ Valid = $false; Reason = $Reason; Walks = @() } }
    $walks = [ordered]@{}
    foreach ($one in @($Path | Where-Object { $_ })) {
        $walked = Test-WalkReceipt -Path $one -BundlePath $BundlePath -PatchListPath $PatchListPath -ScenarioPath $ScenarioPath
        if (-not $walked.Valid) { return Fail "the walk at $one doesn't count: $($walked.Reason)" }
        $package = [string]$walked.Receipt.package
        if ($walks.Contains($package)) { return Fail "two walk receipts are of $package, and each build takes one" }
        if ($WalkSignedInPackages -ccontains $package -and $walked.Receipt.account -cne 'signed in') {
            return Fail "the walk of $package was $($walked.Receipt.account), and that build's walk has to be signed in"
        }
        $walks[$package] = $walked
    }
    if (-not (Test-Path -LiteralPath $PatchListPath -PathType Leaf)) { return Fail "there's no patch list at $PatchListPath to hold the walks to" }
    $declared = @(Get-PatchTargets -PatchList (Get-Content -LiteralPath $PatchListPath -Raw | ConvertFrom-Json) | ForEach-Object { $_.PackageName })
    $unwalked = @($declared | Where-Object { -not $walks.Contains($_) })
    if ($unwalked.Count -gt 0) { return Fail "no walk receipt is of $($unwalked -join ', '), and every build this bundle patches needs one" }
    return [pscustomobject]@{ Valid = $true; Reason = $null; Walks = @($walks.Values) }
}
