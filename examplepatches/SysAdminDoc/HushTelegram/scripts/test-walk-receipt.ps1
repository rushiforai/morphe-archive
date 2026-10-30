<# Offline contracts for walk-receipt.ps1: publish takes only a full, passing walk of the bundle it ships. #>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'walk-receipt.ps1')

function Assert-WalkContract([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}

$catalogPath = Join-Path (Split-Path -Parent $PSScriptRoot) 'patches-list.json'
$catalog = Get-Content -LiteralPath $catalogPath -Raw | ConvertFrom-Json
$target = Get-PatchTarget -PatchList $catalog -PackageName 'org.telegram.messenger.web'
$declaredVersion = $target.PackageVersion
$declaredCode = [string]@($target.PackageVersionCodes[$declaredVersion])[0]
$allPatches = [string[]]@($catalog.patches | ForEach-Object { $_.name })
$scenarios = @(Read-WalkScenarios)

# The manifest names only patches the catalog has, so renaming one can't quietly drop a scenario.
foreach ($scenario in $scenarios) {
    foreach ($named in @($scenario.Patches)) {
        Assert-WalkContract ($allPatches -ccontains $named) "walk-scenarios.json ties $($scenario.Id) to '$named', which isn't a patch."
    }
}
$signedIn = @(Get-WalkRequiredScenarios -Scenarios $scenarios -Patches $allPatches -Account 'signed in')
$signedOut = @(Get-WalkRequiredScenarios -Scenarios $scenarios -Patches $allPatches -Account 'signed out')
Assert-WalkContract ($signedIn.Count -eq $scenarios.Count) 'A signed-in walk of every patch did not need every scenario.'
Assert-WalkContract ($signedOut -ccontains 'section:About' -and $signedOut -cnotcontains 'visit:tg://settings') `
    'A signed-out walk needs the settings and not the screens past sign-in.'
# A build without a family's patches doesn't need that family's screen.
$noThemes = @(Get-WalkRequiredScenarios -Scenarios $scenarios -Account 'signed in' `
        -Patches @($allPatches | Where-Object { @('AMOLED black', 'Holiday look all year', 'Use system font') -cnotcontains $_ }))
Assert-WalkContract ($noThemes -cnotcontains 'visit:tg://settings/themes' -and $noThemes -ccontains 'visit:tg://settings/folders') `
    'The themes screen was required of a build with no theme patch, or another family dropped with it.'

$work = Join-Path ([IO.Path]::GetTempPath()) ('hushtelegram-walk-contract-' + [guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($work)
try {
    $bundle = Join-Path $work 'patches-0.0.20.mpp'
    [IO.File]::WriteAllText($bundle, 'the signed bundle')
    $bundleSha256 = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash
    $walkPath = Join-Path $work 'walk-receipt.json'
    $apkSha256 = '4' * 64
    # The receipt a signed-in walk of that bundle writes. -Change bends one receipt field,
    # -ArtifactChange one field of its patch artifact record.
    function Write-Walk([hashtable]$Change = @{}, [hashtable]$ArtifactChange = @{}, [string]$Account = 'signed in') {
        $artifact = New-WalkArtifact -ApkSha256 $apkSha256 -Package 'org.telegram.messenger.web' -PackageVersion $declaredVersion `
            -VersionCode $declaredCode -SignerSha256 ('8' * 64) -FixtureName "telegram-web-$declaredVersion-$declaredCode.apk" -FixtureSha256 ('7' * 64) `
            -BundleVersion '0.0.20' -BundleSha256 $bundleSha256 -Patches $allPatches -Created '2026-10-21T15:55:00Z'
        foreach ($key in $ArtifactChange.Keys) { $artifact[$key] = $ArtifactChange[$key] }
        $walk = New-WalkReceipt -Result PASS -Full $true -Serial 'TESTPHONE01' -Device 'SM-S908U1' -Package 'org.telegram.messenger.web' `
            -AppVersion $declaredVersion -BundleSha256 $bundleSha256 -InstalledApkSha256 $apkSha256 -Artifact $artifact `
            -Account $Account -Scenarios ([string[]]@(Get-WalkRequiredScenarios -Scenarios $scenarios -Patches $allPatches -Account $Account)) `
            -Started '2026-10-21T16:00:00Z' -Finished '2026-10-21T16:30:00Z' -Screens 40 -Crashes 0
        foreach ($key in $Change.Keys) { $walk[$key] = $Change[$key] }
        [IO.File]::WriteAllText($walkPath, (ConvertTo-Json -InputObject $walk -Depth 5))
    }
    function Test-Walk { Test-WalkReceipt -Path $walkPath -BundlePath $bundle -PatchListPath $catalogPath }

    # Either release phone or an emulator walks for a release, signed in or as a signed-out smoke.
    foreach ($walker in @(@{}, @{ device = 'SM-S938B' }, @{ serial = 'emulator-5554'; device = 'sdk_gphone64_x86_64'; emulator = $true })) {
        Write-Walk $walker
        $good = Test-Walk
        Assert-WalkContract ($good.Valid -and $good.Receipt.screens -eq 40 -and $good.Kind -ceq 'feature acceptance') "A full PASS walk of the bundle was refused: $($good.Reason)"
    }
    Write-Walk -Account 'signed out'
    $smoke = Test-Walk
    Assert-WalkContract ($smoke.Valid -and $smoke.Kind -ceq 'settings smoke') "A signed-out walk of every settings page was refused or not called a smoke: $($smoke.Reason) $($smoke.Kind)"

    $shortList = [string[]]@($signedIn | Where-Object { $_ -cne 'section:About' })
    foreach ($badWalk in @(
            @(@{ result = 'FAIL' }, @{}, '*the walk ended FAIL, not PASS*'),
            @(@{ result = 'PARTIAL'; full = $false }, @{}, '*the walk ended PARTIAL, not PASS*'),
            @(@{ result = $null }, @{}, '*ended with no result*'),
            @(@{ full = $false }, @{}, '*was not the whole app*'),
            @(@{ screens = 0 }, @{}, "*doesn't say it opened any screen*"),
            @(@{ crashes = 1 }, @{}, '*recorded a Telegram crash*'),
            @(@{ problems = @('tg://settings would not open') }, @{}, '*recorded problems: tg://settings would not open*'),
            @(@{ problems = $null }, @{}, '*recorded problems*'),
            @(@{ device = $null }, @{}, "*doesn't say which device walked it*"),
            @(@{ device = 'Pixel 9' }, @{}, "*Pixel 9 isn't one of the release walk phones*"),
            @(@{ device = 'Pixel 9'; emulator = $true }, @{}, "*Pixel 9 isn't one of the release walk phones*"),
            @(@{ bundleSha256 = ('5' * 64) }, @{}, '*patched with bundle*and this one is*'),
            @(@{ schema = 1 }, @{}, "*isn't schema 2*"),
            @(@{ finished = '2026-10-21T15:59:00Z' }, @{}, '*finished before it started*'),
            @(@{ finished = [DateTimeOffset]::UtcNow.AddDays(1).UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ') }, @{}, "*which hasn't come yet*"),
            @(@{ started = 'yesterday' }, @{}, "*aren't UTC times*"),
            @(@{ installedApkSha256 = '' }, @{}, "*doesn't name the installed APK's SHA-256*"),
            @(@{ installedApkSha256 = ('6' * 64) }, @{}, '*installed APK is*not the patched APK*'),
            @(@{ artifact = $null }, @{}, '*has no patch artifact record*'),
            @(@{}, @{ bundleSha256 = ('5' * 64) }, "*came from bundle*left from another build*"),
            @(@{}, @{ fixtureSha256 = '' }, "*doesn't name the vendor fixture*"),
            @(@{}, @{ fixture = 'telegram.apk' }, "*patched from 'telegram.apk', not the declared fixture telegram-web-$declaredVersion-$declaredCode.apk*"),
            @(@{}, @{ signerSha256 = @() }, "*doesn't name the patched APK's signing certificate*"),
            @(@{}, @{ signerSha256 = @(('8' * 64), 'not a digest') }, "*doesn't name the patched APK's signing certificate*"),
            @(@{}, @{ created = '2026-10-21T16:10:00Z' }, '*made after the walk started*'),
            @(@{ package = 'org.telegram.messenger' }, @{}, '*the walk was of org.telegram.messenger, and the patched APK is org.telegram.messenger.web*'),
            @(@{ package = 'com.example' }, @{ package = 'com.example' }, "*com.example, which this bundle doesn't patch*"),
            @(@{}, @{ packageVersion = '12.0.0' }, "*12.0.0*which this bundle doesn't declare*"),
            @(@{}, @{ versionCode = '1' }, "*$declaredVersion (1), which this bundle doesn't declare*"),
            @(@{ appVersion = '12.0.0' }, @{}, "*installed Telegram is '12.0.0'*"),
            @(@{}, @{ patches = @($allPatches | Where-Object { $_ -cne 'Hide ads' }) }, '*left out Hide ads*'),
            @(@{}, @{ patches = @($allPatches) + 'Unknown patch' }, '*names Unknown patch too*'),
            @(@{ account = 'unknown' }, @{}, "*doesn't say whether Telegram was signed in*"),
            @(@{ account = 'Signed In' }, @{}, "*doesn't say whether Telegram was signed in*"),
            @(@{ kind = 'feature acceptance'; account = 'signed out' }, @{}, "*calls it 'feature acceptance'*"),
            @(@{ scenarios = $shortList }, @{}, '*the walk left out section:About*'),
            @(@{ scenarios = @() }, @{}, '*the walk left out launch*'))) {
        Write-Walk $badWalk[0] $badWalk[1]
        $bad = Test-Walk
        Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like $badWalk[2]) "Expected the walk refusal [$($badWalk[2])], got [$($bad.Reason)]."
    }
    # A signed-out smoke still has to open every settings page.
    Write-Walk @{ scenarios = [string[]]@($signedOut | Where-Object { $_ -cne 'section:Privacy' }) } -Account 'signed out'
    $bad = Test-Walk
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like '*left out section:Privacy*') "A smoke that skipped a page passed: $($bad.Reason)"

    [IO.File]::WriteAllText($walkPath, 'not json')
    $bad = Test-Walk
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like "*doesn't read as JSON*") "A receipt that isn't JSON read as: $($bad.Reason)"
    $bad = Test-WalkReceipt -Path (Join-Path $work 'none.json') -BundlePath $bundle -PatchListPath $catalogPath
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like "*there's no walk receipt at*") "A missing receipt read as: $($bad.Reason)"

    # Publish takes one walk of each Telegram build the bundle patches, the Play build's signed in.
    function Write-BuildWalk([string]$Package, [string]$Account, [string]$Name) {
        $buildTarget = Get-PatchTarget -PatchList $catalog -PackageName $Package
        $version = $buildTarget.PackageVersion
        $code = [string]@($buildTarget.PackageVersionCodes[$version])[0]
        $artifact = New-WalkArtifact -ApkSha256 $apkSha256 -Package $Package -PackageVersion $version -VersionCode $code `
            -SignerSha256 ('8' * 64) -FixtureName (Get-VendorFixtureName -Target $buildTarget -VersionName $version -VersionCode $code) `
            -FixtureSha256 ('7' * 64) -BundleVersion '0.0.20' -BundleSha256 $bundleSha256 -Patches $allPatches -Created '2026-10-21T15:55:00Z'
        $walk = New-WalkReceipt -Result PASS -Full $true -Serial 'TESTPHONE01' -Device 'SM-S908U1' -Package $Package `
            -AppVersion $version -BundleSha256 $bundleSha256 -InstalledApkSha256 $apkSha256 -Artifact $artifact `
            -Account $Account -Scenarios ([string[]]@(Get-WalkRequiredScenarios -Scenarios $scenarios -Patches $allPatches -Account $Account)) `
            -Started '2026-10-21T16:00:00Z' -Finished '2026-10-21T16:30:00Z' -Screens 40 -Crashes 0
        $to = Join-Path $work $Name
        [IO.File]::WriteAllText($to, (ConvertTo-Json -InputObject $walk -Depth 5))
        return $to
    }
    function Test-Builds([string[]]$Paths) { Test-WalkReceipts -Path $Paths -BundlePath $bundle -PatchListPath $catalogPath }
    $webSmoke = Write-BuildWalk 'org.telegram.messenger.web' 'signed out' 'web-smoke.json'
    $webIn = Write-BuildWalk 'org.telegram.messenger.web' 'signed in' 'web-in.json'
    $playIn = Write-BuildWalk 'org.telegram.messenger' 'signed in' 'play-in.json'
    $playSmoke = Write-BuildWalk 'org.telegram.messenger' 'signed out' 'play-smoke.json'
    foreach ($pair in @(@($webSmoke, $playIn), @($playIn, $webIn))) {
        $both = Test-Builds $pair
        Assert-WalkContract ($both.Valid -and @($both.Walks).Count -eq 2 -and @($both.Walks | ForEach-Object { $_.Receipt.package }) -ccontains 'org.telegram.messenger') `
            "A walk of each build, the Play one signed in, was refused: $($both.Reason)"
    }
    foreach ($badSet in @(
            @(@($webIn), '*no walk receipt is of org.telegram.messenger, and every build*'),
            @(@($playIn), '*no walk receipt is of org.telegram.messenger.web,*'),
            @(@(), '*no walk receipt is of org.telegram.messenger.web, org.telegram.messenger,*'),
            @(@($webIn, $playSmoke), '*the walk of org.telegram.messenger was signed out, and that build''s walk has to be signed in*'),
            @(@($webSmoke, $webIn, $playIn), '*two walk receipts are of org.telegram.messenger.web*'),
            @(@($playIn, (Join-Path $work 'none.json')), "*the walk at *none.json doesn't count: there's no walk receipt at*"))) {
        $bad = Test-Builds $badSet[0]
        Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like $badSet[1]) "Expected the walks refusal [$($badSet[1])], got [$($bad.Reason)]."
    }

    # A walk of one bundle never backs another, even a rebuild of the same commit.
    Write-Walk
    [IO.File]::WriteAllText($bundle, 'the signed bundle, rebuilt')
    $bad = Test-Walk
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like '*patched with bundle*and this one is*') "A walk backed another bundle: $($bad.Reason)"
    $bad = Test-WalkReceipt -Path $walkPath -BundlePath (Join-Path $work 'gone.mpp') -PatchListPath $catalogPath
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like "*there's no bundle at*") "A walk backed a bundle that isn't there: $($bad.Reason)"
} finally {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}

# Publish asks for the walk once the signed assets check out, before the notes, the tag or GitHub.
$releaseText = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'release/release.ps1'))
$publishAt = $releaseText.IndexOf("'publish' {")
$assetsAt = $releaseText.IndexOf('$bundleHash = Test-Assets', $publishAt)
$walkAt = $releaseText.IndexOf('$walked = Test-WalkReceipts -Path $Walk', $publishAt)
$refuseAt = $releaseText.IndexOf('if (-not $walked.Valid) {', $publishAt)
foreach ($later in @('New-ReleaseNotes', 'Tagging $tag', 'Pushing $tag', 'gh release create')) {
    $laterAt = $releaseText.IndexOf($later, $publishAt)
    Assert-WalkContract ($publishAt -gt 0 -and $assetsAt -gt $publishAt -and $walkAt -gt $assetsAt -and $refuseAt -gt $walkAt -and $laterAt -gt $refuseAt) `
        "release.ps1 -Stage publish reaches $later before it holds the bundle to its walk."
}
Assert-WalkContract ($releaseText.IndexOf("-PatchListPath (Join-Path `$Root 'patches-list.json')", $walkAt) -gt $walkAt) `
    'release.ps1 holds the walk to no patch list.'
Assert-WalkContract ($releaseText -match '(?m)^\s*\[string\[\]\]\$Walk,') 'release.ps1 has no -Walk that takes a receipt per build.'
Write-Host '[scripts] walk receipt contracts passed'
