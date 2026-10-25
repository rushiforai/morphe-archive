<#
.SYNOPSIS
    The receipt a whole-app walk leaves, and what makes one good enough to publish a bundle on.

.DESCRIPTION
    Dot-sourced by release/publish-release.ps1, which refuses to publish a bundle without a
    receipt that backs it. Nothing goes public until an APK patched from the exact bundle being
    released has been walked end to end on a release phone or an emulator and came back PASS:
    every Hush settings page and every patched screen, with no Pinterest crash.

    Schema 2 embeds the checked patch run's stock/catalog/selection and signed APK identity.
    The observed installed APK must match it, and its bundle must match the upload. Legacy
    receipts and installed-app surveys without build evidence cannot authorize publication.
#>

# The phones release walks run on, by ro.product.model. An emulator passes by its serial.
$WalkReceiptPhones = @('SM-S908U1', 'SM-S938B')
. (Join-Path $PSScriptRoot 'patch-target.ps1')
$WalkReceiptCatalog = Join-Path (Split-Path -Parent $PSScriptRoot) 'patches-list.json'

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
        [AllowEmptyString()][string]$AppVersion,
        [AllowEmptyString()][string]$AppVersionCode,
        [Parameter(Mandatory = $true)][string]$BundleSha256,
        [AllowEmptyString()][string]$InstalledApkSha256,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Started,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Finished,
        [int]$Screens,
        [int]$Crashes,
        [string[]]$Problems = @(),
        $Build
    )
    return [ordered]@{
        schema = 2; result = $Result; full = $Full
        serial = $Serial; device = $Device; emulator = $Serial.StartsWith('emulator-', [StringComparison]::Ordinal)
        appVersion = $AppVersion; appVersionCode = $AppVersionCode
        bundleSha256 = $BundleSha256.ToLowerInvariant(); installedApkSha256 = $InstalledApkSha256
        build = $Build
        started = $Started.UtcDateTime.ToString('o'); finished = $Finished.UtcDateTime.ToString('o')
        screens = $Screens; crashes = $Crashes; problems = @($Problems)
    }
}

function Test-WalkReceipt {
    <#
    .SYNOPSIS
        Whether the receipt at -Path is a full, passing walk of the bundle at -BundlePath, on a
        release phone or an emulator. Answers @{ Valid; Reason; Receipt }.
    #>
    param([Parameter(Mandatory = $true)][string]$Path, [Parameter(Mandatory = $true)][string]$BundlePath,
        [string]$PatchList = $WalkReceiptCatalog)
    function Fail([string]$Reason) { return [pscustomobject]@{ Valid = $false; Reason = $Reason; Receipt = $null } }
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { return Fail "there's no walk receipt at $Path" }
    try {
        $json = Get-Content -LiteralPath $Path -Raw
        $receipt = if ((Get-Command ConvertFrom-Json).Parameters.ContainsKey('DateKind')) {
            $json | ConvertFrom-Json -DateKind String
        } else { $json | ConvertFrom-Json }
    }
    catch { return Fail "the walk receipt doesn't read as JSON: $($_.Exception.Message)" }
    if ($null -eq $receipt -or ($receipt.schema -isnot [int] -and $receipt.schema -isnot [long]) -or $receipt.schema -ne 2) {
        return Fail "the walk receipt isn't schema 2 with build/install evidence; run a new walk"
    }
    if ($receipt.result -isnot [string] -or $receipt.result -cne 'PASS') {
        return Fail "the walk ended $(if ($receipt.result -is [string] -and $receipt.result) { $receipt.result } else { 'with no result' }), not PASS"
    }
    if ($receipt.full -isnot [bool] -or -not $receipt.full) { return Fail 'the walk skipped part of the app, so it was not the whole app' }
    if (($receipt.screens -isnot [int] -and $receipt.screens -isnot [long]) -or $receipt.screens -lt 1) {
        return Fail "the walk receipt doesn't say it opened any screen"
    }
    if (($receipt.crashes -isnot [int] -and $receipt.crashes -isnot [long]) -or $receipt.crashes -ne 0) {
        return Fail 'the walk recorded a Pinterest crash'
    }
    if ($null -eq $receipt.problems -or $receipt.problems -isnot [Array] -or $receipt.problems.Count -ne 0) {
        return Fail 'the walk has problems or no problems list'
    }
    # ConvertFrom-Json returns DateTime in newer PowerShell and text in 5.1. Normalize both
    # explicitly; a date without a zone is not evidence of an unambiguous instant.
    $times = @{}
    $isoTime = '\A\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{1,7})?(?:Z|[+-]\d{2}:\d{2})\z'
    foreach ($field in @('started', 'finished')) {
        $value = $receipt.$field
        if ($value -is [DateTime]) {
            if ($value.Kind -eq [DateTimeKind]::Unspecified) { return Fail "ambiguous $field time" }
            $value = $value.ToUniversalTime().ToString('o')
        }
        $parsed = [DateTimeOffset]::MinValue
        if ($value -isnot [string] -or $value -notmatch $isoTime -or
            -not [DateTimeOffset]::TryParse($value, [Globalization.CultureInfo]::InvariantCulture,
                [Globalization.DateTimeStyles]::None, [ref]$parsed)) { return Fail "invalid $field time" }
        $times[$field] = $parsed
    }
    if ($times.finished -lt $times.started -or $times.finished -gt [DateTimeOffset]::UtcNow.AddMinutes(5)) {
        return Fail 'the walk times are reversed or in the future'
    }
    if ($receipt.device -isnot [string] -or $receipt.serial -isnot [string] -or $receipt.emulator -isnot [bool]) {
        return Fail "the walk receipt doesn't say which device walked it"
    }
    $isEmulator = $receipt.serial.StartsWith('emulator-', [StringComparison]::Ordinal)
    if ($receipt.serial -notmatch '\A[A-Za-z0-9][A-Za-z0-9._-]*\z' -or
        ($isEmulator -and $receipt.serial -notmatch '\Aemulator-\d+\z') -or [string]::IsNullOrWhiteSpace($receipt.device)) {
        return Fail 'invalid walk device identity'
    }
    if ($receipt.emulator -ne $isEmulator -or (-not $isEmulator -and $WalkReceiptPhones -cnotcontains $receipt.device)) {
        return Fail "$($receipt.device) isn't one of the release walk phones ($($WalkReceiptPhones -join ', ')) or an emulator"
    }
    if (-not (Test-Path -LiteralPath $BundlePath -PathType Leaf)) { return Fail "there's no bundle at $BundlePath to hold the walk to" }
    $bundleSha256 = (Get-FileHash -LiteralPath $BundlePath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($receipt.bundleSha256 -isnot [string] -or $receipt.bundleSha256 -cne $bundleSha256) {
        return Fail "the walked APK was patched with bundle '$($receipt.bundleSha256)', and this one is '$bundleSha256'"
    }
    $build = $receipt.build
    if ($null -eq $build -or ($build.schema -isnot [int] -and $build.schema -isnot [long]) -or $build.schema -ne 1) {
        return Fail 'no versioned patch/build evidence binds this installed APK'
    }
    foreach ($hash in @($receipt.installedApkSha256, $build.bundleSha256, $build.fixtureSha256,
            $build.catalogSha256, $build.signedApkSha256)) {
        if ($hash -isnot [string] -or $hash -cnotmatch '\A[0-9a-f]{64}\z') { return Fail 'missing or malformed build/install hash' }
    }
    if ($build.bundleSha256 -cne $bundleSha256 -or $build.signedApkSha256 -cne $receipt.installedApkSha256) {
        return Fail 'the installed APK does not match the APK patched from this bundle'
    }
    try {
        $catalog = Get-Content -LiteralPath $PatchList -Raw | ConvertFrom-Json
        $target = Get-PatchTarget -PatchList $catalog
        $catalogHash = (Get-FileHash -LiteralPath $PatchList -Algorithm SHA256).Hash.ToLowerInvariant()
    } catch { return Fail "the patch catalog could not be verified: $($_.Exception.Message)" }
    if ($build.catalogSha256 -cne $catalogHash -or $build.packageName -cne $target.PackageName -or
        $receipt.appVersion -isnot [string] -or $receipt.appVersionCode -isnot [string] -or
        $receipt.appVersion -cne $build.appVersion -or $receipt.appVersionCode -cne $build.appVersionCode -or
        -not (Test-DeclaredBuild -Target $target -VersionName $receipt.appVersion -VersionCode $receipt.appVersionCode)) {
        return Fail 'the build/install app identity does not match the supported catalog'
    }
    $selected = $build.selectedPatches
    if ($selected -isnot [Array] -or $selected.Count -eq 0) { return Fail 'the build has no patch selection' }
    $seen = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($name in $selected) {
        if ($name -isnot [string] -or @($catalog.patches.name) -cnotcontains $name -or -not $seen.Add($name)) {
            return Fail 'the build patch selection is unknown or duplicated'
        }
    }
    $builtAt = $build.completed
    if ($builtAt -is [DateTime]) {
        if ($builtAt.Kind -eq [DateTimeKind]::Unspecified) { return Fail 'ambiguous patch/build time' }
        $builtAt = $builtAt.ToUniversalTime().ToString('o')
    }
    $builtTime = [DateTimeOffset]::MinValue
    if ($builtAt -isnot [string] -or $builtAt -notmatch $isoTime -or
        -not [DateTimeOffset]::TryParse($builtAt, [Globalization.CultureInfo]::InvariantCulture,
            [Globalization.DateTimeStyles]::None, [ref]$builtTime) -or $builtTime -gt $times.started) {
        return Fail 'the patch/build time is invalid or after the walk started'
    }
    return [pscustomobject]@{ Valid = $true; Reason = $null; Receipt = $receipt }
}
