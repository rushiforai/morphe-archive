<#
.SYNOPSIS
    The receipt a whole-app walk leaves, and what makes one good enough to publish a bundle on.

.DESCRIPTION
    Dot-sourced by release/publish-release.ps1, which refuses to publish a bundle without a
    receipt that backs it. Nothing goes public until an APK patched from the exact bundle being
    released has been walked end to end on a release phone or an emulator and came back PASS:
    every Hush settings page and every patched screen, with no Tumblr crash.

    The walk writes walk-receipt.json with New-WalkReceipt. It names the SHA-256 of the .mpp the
    walked APK was patched with, and publish holds that to the signed bundle it's about to upload,
    so a walk of any other build can't stand in for this one.
#>
. (Join-Path $PSScriptRoot 'apk-provenance.ps1')
. (Join-Path $PSScriptRoot 'walk-plan.ps1')
. (Join-Path $PSScriptRoot 'walk-verifier.ps1')

# The phones release walks run on, by ro.product.model. An emulator passes by its serial.
$WalkReceiptPhones = @('SM-S908U1', 'SM-S938B')

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
        [Parameter(Mandatory = $true)][string]$BundleSha256,
        [AllowEmptyString()][string]$InstalledApkSha256,
        $Provenance,
        $InstalledBefore,
        $InstalledAfter,
        [object[]]$Routes = @(),
        [string]$RunId,
        $DeviceIdentity,
        $Verifier,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Started,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Finished,
        [int]$Screens,
        [int]$Crashes,
        [string[]]$Problems = @()
    )
    return [ordered]@{
        schema = 2; result = $Result; full = $Full
        serial = $Serial; device = $Device; emulator = $Serial.StartsWith('emulator-', [StringComparison]::Ordinal)
        appVersion = $AppVersion; bundleSha256 = $BundleSha256.ToLowerInvariant(); installedApkSha256 = $InstalledApkSha256
        started = $Started.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ'); finished = $Finished.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ')
        screens = $Screens; crashes = $Crashes; problems = @($Problems)
        provenance = $Provenance; installedBefore = $InstalledBefore; installedAfter = $InstalledAfter
        planVersion = 1; routes = @($Routes)
        runId = $RunId; deviceIdentity = $DeviceIdentity; verifier = $Verifier
    }
}

function Test-WalkReceipt {
    <#
    .SYNOPSIS
        Whether the receipt at -Path is a full, passing walk of the bundle at -BundlePath, on a
        release phone or an emulator. Answers @{ Valid; Reason; Receipt }.
    #>
    param([Parameter(Mandatory = $true)][string]$Path, [Parameter(Mandatory = $true)][string]$BundlePath,
        [Parameter(Mandatory)][string]$CatalogPath, [Parameter(Mandatory)][string]$ReleaseReceiptPath)
    function Fail([string]$Reason) { return [pscustomobject]@{ Valid = $false; Reason = $Reason; Receipt = $null } }
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { return Fail "there's no walk receipt at $Path" }
    try {
        $json = Get-Content -LiteralPath $Path -Raw
        $receipt = if ((Get-Command ConvertFrom-Json).Parameters.ContainsKey('DateKind')) { $json | ConvertFrom-Json -DateKind String }
            else { $json | ConvertFrom-Json }
    }
    catch { return Fail "the walk receipt doesn't read as JSON: $($_.Exception.Message)" }
    if ($null -eq $receipt -or ($receipt.schema -isnot [int] -and $receipt.schema -isnot [long]) -or $receipt.schema -ne 2) {
        return Fail 'the walk receipt is not schema 2; historical receipts cannot prove a new release'
    }
    if ($receipt.result -isnot [string] -or $receipt.result -cne 'PASS') {
        return Fail "the walk ended $(if ($receipt.result -is [string] -and $receipt.result) { $receipt.result } else { 'with no result' }), not PASS"
    }
    if ($receipt.full -isnot [bool] -or -not $receipt.full) { return Fail 'the walk skipped part of the app, so it was not the whole app' }
    if (($receipt.screens -isnot [int] -and $receipt.screens -isnot [long]) -or $receipt.screens -lt 1) {
        return Fail "the walk receipt doesn't say it opened any screen"
    }
    if (($receipt.crashes -isnot [int] -and $receipt.crashes -isnot [long]) -or $receipt.crashes -ne 0) {
        return Fail 'the walk recorded a Tumblr crash'
    }
    if ($receipt.problems -isnot [array] -or $receipt.problems.Count -ne 0) { return Fail 'the walk recorded problems or omitted their result' }
    $start = [DateTimeOffset]::MinValue
    $finish = [DateTimeOffset]::MinValue
    foreach ($field in @('started', 'finished')) {
        $stamp = if ($receipt.$field -is [datetime]) { $receipt.$field.ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ') } else { $receipt.$field }
        $parsed = [DateTimeOffset]::MinValue
        if ($stamp -isnot [string] -or -not [DateTimeOffset]::TryParseExact($stamp, 'yyyy-MM-ddTHH:mm:ssZ',
            [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::AssumeUniversal, [ref]$parsed)) {
            return Fail 'the walk timestamps are missing or invalid'
        }
        if ($field -eq 'started') { $start = $parsed } else { $finish = $parsed }
    }
    if ($finish -le $start) { return Fail 'the walk timestamps are reversed or empty' }
    if ($receipt.device -isnot [string] -or $receipt.serial -isnot [string] -or $receipt.emulator -isnot [bool]) {
        return Fail "the walk receipt doesn't say which device walked it"
    }
    $isEmulator = $receipt.serial.StartsWith('emulator-', [StringComparison]::Ordinal)
    if ($receipt.emulator -ne $isEmulator -or (-not $isEmulator -and $WalkReceiptPhones -cnotcontains $receipt.device)) {
        return Fail "$($receipt.device) isn't one of the release walk phones ($($WalkReceiptPhones -join ', ')) or an emulator"
    }
    if (-not (Test-Path -LiteralPath $BundlePath -PathType Leaf)) { return Fail "there's no bundle at $BundlePath to hold the walk to" }
    $bundleSha256 = (Get-FileHash -LiteralPath $BundlePath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($receipt.bundleSha256 -isnot [string] -or $receipt.bundleSha256 -cne $bundleSha256) {
        return Fail "the walked APK was patched with bundle '$($receipt.bundleSha256)', and this one is '$bundleSha256'"
    }
    try {
        if ($null -eq $receipt.provenance -or $null -eq $receipt.installedBefore -or $null -eq $receipt.installedAfter) {
            throw 'APK identity and provenance are required.'
        }
        Assert-HushApkProvenance -Provenance $receipt.provenance -BundleSha256 $bundleSha256 -CatalogPath $CatalogPath -FullSelection
        Assert-HushApkIdentity -Expected $receipt.provenance.output -Actual $receipt.installedBefore
        Assert-HushApkIdentity -Expected $receipt.provenance.output -Actual $receipt.installedAfter
        if ($receipt.installedApkSha256 -cne $receipt.provenance.output.sha256 -or
            $receipt.appVersion -cne $receipt.provenance.output.versionName) { throw 'Receipt APK identity contradicts its provenance.' }
        $release = Get-Content -LiteralPath $ReleaseReceiptPath -Raw | ConvertFrom-Json
        if ([string]$release.bundle.sha256 -ine $bundleSha256 -or
            @($release.targets | Where-Object { $_.source.forced -is [bool] -and -not $_.source.forced -and
                [string]$_.source.sha256 -ieq $receipt.provenance.sourceSha256 -and
                $_.source.package -ceq $receipt.provenance.output.package -and
                $_.source.versionName -ceq $receipt.provenance.output.versionName -and
                [string]$_.source.versionCode -ceq [string]$receipt.provenance.output.versionCode }).Count -eq 0) {
            throw 'APK provenance does not match a validated release input.'
        }
    } catch { return Fail "APK identity refused: $($_.Exception.Message)" }
    $coverage = Test-WalkCoverage -Routes @($receipt.routes) -PatchNames @($receipt.provenance.patches)
    if (($receipt.planVersion -isnot [int] -and $receipt.planVersion -isnot [long]) -or $receipt.planVersion -ne 1 -or $receipt.routes -isnot [array] -or
        -not $coverage.Complete -or $coverage.Invalid -or $receipt.screens -ne $receipt.routes.Count) {
        return Fail "the walk does not prove its required route plan: $($coverage.Reason)"
    }
    try { Assert-WalkVerifierEvidence -Receipt $receipt -WalkStarted $start }
    catch { return Fail "device verifier evidence refused: $($_.Exception.Message)" }
    return [pscustomobject]@{ Valid = $true; Reason = $null; Receipt = $receipt }
}
