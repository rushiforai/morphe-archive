<#
.SYNOPSIS
    Provenance and complete named coverage for a whole-app release walk.
.DESCRIPTION
    A walk binds the exact bundle ZIP and payload identity to the signed APK and its patching
    inputs. Installed bytes must match before and after the walk. Historical schema 1 receipts
    remain historical evidence; they cannot qualify a new publication.
#>
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'patch-report.ps1')
. (Join-Path $PSScriptRoot 'walk-app-core.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')

$WalkReceiptPhones = @('SM-S908U1', 'SM-S938B')

function Read-WalkJson {
    param([Parameter(Mandatory = $true)][string]$Path)
    $arguments = @{ InputObject = [IO.File]::ReadAllText(
        $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)) }
    if ((Get-Command ConvertFrom-Json).Parameters.ContainsKey('DateKind')) { $arguments.DateKind = 'String' }
    ConvertFrom-Json @arguments
}

function Test-WalkPatchReceipt {
    param([object]$Receipt, [Parameter(Mandatory = $true)][string]$BundlePath,
        [string]$Java, [string]$DesktopJar, [string]$Aapt2, [string]$SourceRoot)
    function Fail([string]$Reason) { [pscustomobject]@{ Valid = $false; Reason = $Reason } }
    try {
        if ($null -eq $Receipt -or ($Receipt.schema -isnot [int] -and $Receipt.schema -isnot [long]) -or
            $Receipt.schema -ne 1 -or $Receipt.kind -cne 'hushthreads-patch') {
            return Fail 'missing patch provenance'
        }
        $bundleHash = (Get-FileHash -LiteralPath $BundlePath -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($Receipt.bundleSha256 -cne $bundleHash) { return Fail 'patch provenance names another bundle ZIP' }
        $identity = Get-BundleIdentityFacts -BundlePath $BundlePath
        if (-not $identity.Valid -or $Receipt.bundlePayloadSha256 -cne $identity.PayloadSha256) {
            return Fail 'patch provenance has no matching verified bundle payload identity'
        }
        foreach ($artifact in @($Receipt.input, $Receipt.apk, $Receipt.catalog)) {
            if ($null -eq $artifact -or $artifact.file -isnot [string] -or
                $artifact.sha256 -isnot [string] -or $artifact.sha256 -cnotmatch '\A[0-9a-f]{64}\z' -or
                -not (Test-Path -LiteralPath $artifact.file -PathType Leaf)) {
                return Fail 'patch provenance is missing an artifact or its SHA-256'
            }
            if ((Get-FileHash -LiteralPath $artifact.file -Algorithm SHA256).Hash.ToLowerInvariant() -cne $artifact.sha256) {
                return Fail 'a patch provenance artifact changed'
            }
        }
        foreach ($build in @($Receipt.input, $Receipt.apk)) {
            foreach ($field in @('package', 'versionName', 'versionCode')) {
                if ($build.$field -isnot [string] -or [string]::IsNullOrWhiteSpace($build.$field)) {
                    return Fail 'patch provenance has incomplete package/build facts'
                }
            }
        }
        $catalog = Read-WalkJson -Path $Receipt.catalog.file
        # The receipt cannot substitute its own compatibility declaration for the bundle's.
        if (-not $SourceRoot) { $SourceRoot = Split-Path -Parent $PSScriptRoot }
        $tree = (@(Invoke-RepoGit -Root $sourceRoot -Arguments @('rev-parse', ($identity.SourceCommit + '^{tree}'))) -join '').Trim()
        if ($LASTEXITCODE -ne 0 -or $tree -cne $identity.SourceTree) { return Fail 'the bundle source tree is unavailable or inconsistent' }
        $sourceJson = @(Invoke-RepoGit -Root $sourceRoot -Arguments @('show', ($identity.SourceCommit + ':patches-list.json'))) -join "`n"
        if ($LASTEXITCODE -ne 0) { return Fail 'the bundle source catalog is unavailable' }
        $sourceCatalog = ConvertFrom-Json -InputObject $sourceJson
        if ((ConvertTo-Json -InputObject $catalog -Depth 40 -Compress) -cne
            (ConvertTo-Json -InputObject $sourceCatalog -Depth 40 -Compress)) {
            return Fail 'the catalog is not the declaration from the bundle source commit'
        }
        $target = Get-PatchTarget -PatchList $catalog
        if ($Receipt.input.package -cne $target.PackageName -or
            -not (Test-DeclaredBuild -Target $target -VersionName $Receipt.input.versionName -VersionCode $Receipt.input.versionCode)) {
            return Fail 'patch provenance names an undeclared vendor build'
        }
        if ($Receipt.apk.package -cne $Receipt.input.package -or $Receipt.apk.versionName -cne $Receipt.input.versionName) {
            return Fail 'patch provenance output changed the package or version name'
        }
        foreach ($field in @('requestedPatches', 'appliedPatches')) {
            $values = $Receipt.$field
            if ($values -isnot [array] -or $values.Count -eq 0) { return Fail 'patch provenance has no patch selection' }
            $unique = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
            foreach ($value in $values) {
                if ($value -isnot [string] -or [string]::IsNullOrWhiteSpace($value) -or -not $unique.Add($value)) {
                    return Fail 'patch provenance has an invalid or repeated patch name'
                }
            }
        }
        $dependencies = @(Get-PatchDependencyNames -PatchList $catalog -RequestedNames $Receipt.requestedPatches)
        if (-not (Test-ReportedPatchNames -Expected $Receipt.requestedPatches -Actual $Receipt.appliedPatches -AllowedDependencies $dependencies) -or
            $Receipt.options -cne 'defaults') { return Fail 'patch provenance has inconsistent patches or options' }
        $expectedCode = if ($Receipt.requestedPatches -ccontains 'Change version code') { '2147483647' } else { $Receipt.input.versionCode }
        if ($Receipt.apk.versionCode -cne $expectedCode) { return Fail 'patch provenance output has the wrong version code' }
        $aapt = Resolve-Aapt2 -Explicit $Aapt2 -Root $SourceRoot
        $stockCopy = Join-Path ([IO.Path]::GetTempPath()) ('hushthreads-walk-stock-' + [guid]::NewGuid().ToString('N') + '.apk')
        try {
            $stockApk = Get-BaseApk -Apk $Receipt.input.file -Destination $stockCopy
            foreach ($pair in @(
                    @{ Record = $Receipt.input; File = $stockApk },
                    @{ Record = $Receipt.apk; File = $Receipt.apk.file })) {
                $actual = Get-ApkManifestFacts -Apk $pair.File -Aapt2 $aapt
                foreach ($field in @('package', 'versionName', 'versionCode')) {
                    if ([string]$actual.$field -cne $pair.Record.$field) { return Fail 'an APK manifest contradicts its patch provenance' }
                }
            }
        } finally { Remove-Item -LiteralPath $stockCopy -Force -ErrorAction SilentlyContinue }
        $javaCommand = Resolve-Java -Explicit $Java
        $cli = Resolve-DesktopCli -Explicit $DesktopJar -Root $SourceRoot -Required
        $source = if ($identity.SourceState -cin @('clean', 'dirty')) {
            '{0}:{1}; tree={2}' -f $identity.SourceState, $identity.SourceCommit, $identity.SourceTree
        } else { 'unknown' }
        $expectedIdentity = 'sha256={0}; source={1}; inputs={2}' -f $identity.PayloadSha256, $source, $identity.InputSha256
        $preference = $ErrorActionPreference
        try {
            $ErrorActionPreference = 'Continue'
            $global:LASTEXITCODE = -1
            $output = @(& $javaCommand -Xmx1g -cp $cli (Join-Path $PSScriptRoot 'IdentityApkCheck.java') --expected $expectedIdentity $Receipt.apk.file 2>&1)
            $code = $LASTEXITCODE
        } finally { $ErrorActionPreference = $preference }
        if ($code -ne 0) { return Fail "the signed APK does not carry the bundle payload identity: $($output -join ' ')" }
        [pscustomobject]@{ Valid = $true; Reason = $null }
    } catch { return Fail "unreadable patch provenance: $($_.Exception.Message)" }
}

function New-WalkReceipt {
    param(
        [Parameter(Mandatory = $true)][ValidateSet('PASS', 'PARTIAL', 'FAIL')][string]$Result,
        [Parameter(Mandatory = $true)][bool]$Full,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Device,
        [AllowEmptyString()][string]$AppVersion,
        [AllowEmptyString()][string]$AppVersionCode,
        [Parameter(Mandatory = $true)][string]$BundleSha256,
        [AllowEmptyString()][string]$InstalledApkSha256,
        [AllowEmptyString()][string]$InstalledBeforeSha256,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Started,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Finished,
        [int]$Screens,
        [int]$Crashes,
        [string[]]$Problems = @(),
        [string[]]$PlannedScreens = @(),
        [string[]]$ReachedScreens = @(),
        [object]$Patch
    )
    [ordered]@{
        schema = 2; result = $Result; full = $Full
        serial = $Serial; device = $Device; emulator = $Serial.StartsWith('emulator-', [StringComparison]::Ordinal)
        appVersion = $AppVersion; appVersionCode = $AppVersionCode
        bundleSha256 = $BundleSha256.ToLowerInvariant()
        installedApkSha256 = $InstalledApkSha256; installedBeforeSha256 = $InstalledBeforeSha256
        started = $Started.UtcDateTime.ToString('o'); finished = $Finished.UtcDateTime.ToString('o')
        screens = $Screens; crashes = $Crashes; problems = @($Problems)
        plannedScreens = @($PlannedScreens); reachedScreens = @($ReachedScreens); patch = $Patch
    }
}

function Test-WalkReceipt {
    param([Parameter(Mandatory = $true)][string]$Path, [Parameter(Mandatory = $true)][string]$BundlePath,
        [string]$Java, [string]$DesktopJar, [string]$Aapt2, [string]$SourceRoot)
    function Fail([string]$Reason) { [pscustomobject]@{ Valid = $false; Reason = $Reason; Receipt = $null } }
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { return Fail "there's no walk receipt at $Path" }
    try { $receipt = Read-WalkJson -Path $Path }
    catch { return Fail "the walk receipt doesn't read as JSON: $($_.Exception.Message)" }
    try {
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
            return Fail 'the walk recorded a Threads crash'
        }
        if ($receipt.device -isnot [string] -or [string]::IsNullOrWhiteSpace($receipt.device) -or
            $receipt.serial -isnot [string] -or [string]::IsNullOrWhiteSpace($receipt.serial) -or $receipt.emulator -isnot [bool]) {
            return Fail "the walk receipt doesn't say which device walked it"
        }
        $isEmulator = $receipt.serial -cmatch '\Aemulator-[0-9]+\z'
        if ($receipt.emulator -ne $isEmulator -or (-not $isEmulator -and $WalkReceiptPhones -cnotcontains $receipt.device)) {
            return Fail "$($receipt.device) isn't one of the release walk phones ($($WalkReceiptPhones -join ', ')) or an emulator"
        }
        if ($receipt.problems -isnot [array] -or $receipt.problems.Count -ne 0) { return Fail 'the walk recorded problems or omitted its problem list' }
        $times = @()
        foreach ($field in @('started', 'finished')) {
            $value = $receipt.$field
            $stamp = [DateTimeOffset]::MinValue
            if ($value -isnot [string] -or $value -cnotmatch '\A\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{1,7})?Z\z' -or
                -not [DateTimeOffset]::TryParse($value, [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::None, [ref]$stamp)) {
                return Fail 'the walk has an invalid UTC timestamp'
            }
            $times += $stamp
        }
        if ($times[1] -lt $times[0] -or $times[1] -gt [DateTimeOffset]::UtcNow.AddMinutes(5)) {
            return Fail 'the walk timestamps are out of order or in the future'
        }
        if (-not $SourceRoot) { $SourceRoot = Split-Path -Parent $PSScriptRoot }
        $expected = @(Get-WalkExpectedScreens -Root $SourceRoot)
        foreach ($field in @('plannedScreens', 'reachedScreens')) {
            $values = $receipt.$field
            if ($values -isnot [array] -or $values.Count -ne $expected.Count) { return Fail 'the walk has incomplete named screen coverage' }
            $seen = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
            foreach ($value in $values) {
                if ($value -isnot [string] -or -not $seen.Add($value)) { return Fail 'the walk repeats or misnames a screen' }
            }
            if (-not $seen.SetEquals([string[]]$expected)) { return Fail 'the walk has incomplete named screen coverage' }
        }
        if ($receipt.screens -ne $expected.Count) { return Fail 'the walk screen count contradicts its coverage' }
        if (-not (Test-Path -LiteralPath $BundlePath -PathType Leaf)) { return Fail "there's no bundle at $BundlePath to hold the walk to" }
        $bundleSha256 = (Get-FileHash -LiteralPath $BundlePath -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($receipt.bundleSha256 -isnot [string] -or $receipt.bundleSha256 -cne $bundleSha256) {
            return Fail "the walked APK was patched with bundle '$($receipt.bundleSha256)', and this one is '$bundleSha256'"
        }
        if ($null -eq $receipt.patch) { return Fail 'missing patch provenance' }
        foreach ($field in @('installedBeforeSha256', 'installedApkSha256')) {
            if ($receipt.$field -isnot [string] -or $receipt.$field -cnotmatch '\A[0-9a-f]{64}\z' -or
                $receipt.$field -cne $receipt.patch.apk.sha256) { return Fail 'the installed APK does not match the patched artifact before and after the walk' }
        }
        if ($receipt.appVersion -cne $receipt.patch.apk.versionName -or $receipt.appVersionCode -cne $receipt.patch.apk.versionCode) {
            return Fail 'the installed app build contradicts its patch provenance'
        }
        $patch = Test-WalkPatchReceipt -Receipt $receipt.patch -BundlePath $BundlePath -Java $Java -DesktopJar $DesktopJar -Aapt2 $Aapt2 -SourceRoot $SourceRoot
        if (-not $patch.Valid) { return Fail $patch.Reason }
        [pscustomobject]@{ Valid = $true; Reason = $null; Receipt = $receipt }
    } catch { return Fail "incomplete walk receipt: $($_.Exception.Message)" }
}
