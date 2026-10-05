[CmdletBinding()]
param(
    [Parameter(Mandatory)][string] $InputApk,
    [Parameter(Mandatory)][ValidatePattern('^\d+\.\d+\.\d+(?:_BETA)?$')][string] $ExpectedVersion,
    [switch] $Decompile,
    [string[]] $Patch = @()
)
. "$PSScriptRoot/common.ps1"

$inputPath = (Resolve-Path -LiteralPath $InputApk).Path
$extension = [IO.Path]::GetExtension($inputPath).ToLowerInvariant()
if ($extension -notin @('.apk', '.apkm', '.apks', '.xapk')) { throw 'Supply an original APK or complete bundle.' }
$sdk = Get-AndroidSdk
$aapt = Join-Path $sdk 'build-tools/36.0.0/aapt2.exe'
$apksigner = Join-Path $sdk 'build-tools/36.0.0/apksigner.bat'
if (-not (Test-Path -LiteralPath $aapt) -or -not (Test-Path -LiteralPath $apksigner)) {
    throw 'Install Android Build-Tools 36.0.0.'
}
$run = New-RunDirectory 'update'
$originals = Join-Path $run 'originals'
New-Item -ItemType Directory -Path $originals | Out-Null
$snapshot = Join-Path $originals ('input' + $extension)
Copy-Item -LiteralPath $inputPath -Destination $snapshot
$inputHash = (Get-FileHash -LiteralPath $inputPath -Algorithm SHA256).Hash
if ((Get-FileHash -LiteralPath $snapshot -Algorithm SHA256).Hash -ne $inputHash) {
    throw 'Original snapshot hash mismatch.'
}
$parts = [Collections.Generic.List[object]]::new()
if ($extension -eq '.apk') {
    $parts.Add([pscustomobject]@{ Name = 'base.apk'; Path = $snapshot })
} else {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [IO.Compression.ZipFile]::OpenRead($snapshot)
    try {
        $entries = @($archive.Entries | Where-Object { $_.FullName.EndsWith('.apk', [StringComparison]::OrdinalIgnoreCase) })
        if ($entries.Count -eq 0 -or $entries.Count -gt 32) { throw 'Expected 1 to 32 APK parts in the bundle.' }
        foreach ($entry in $entries) {
            if ($entry.Length -gt 2GB) { throw 'APK part exceeds the intake limit.' }
            $path = Join-Path $originals ('part-{0:D3}.apk' -f $parts.Count)
            [IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $path)
            $parts.Add([pscustomobject]@{ Name = [IO.Path]::GetFileName($entry.FullName); Path = $path })
        }
    } finally { $archive.Dispose() }
}
$baseParts = @($parts | Where-Object { $_.Name -eq 'base.apk' })
if ($baseParts.Count -ne 1) { throw 'A complete bundle must contain exactly one base.apk.' }
$expectedSigner = '1338f9b049893cc70b78432a177582f90bd4bc6296ea4ed35bcc7df59687ac53'
$identities = [Collections.Generic.List[object]]::new()
$versionCode = $null
foreach ($part in $parts) {
    $signature = @(& $apksigner verify --print-certs $part.Path 2>&1)
    if ($LASTEXITCODE -ne 0) { throw "Invalid APK signature: $($part.Name)" }
    $certificates = @($signature | ForEach-Object {
        if ($_ -match '^Signer #\d+ certificate SHA-256 digest: ([0-9a-fA-F]{64})$') { $Matches[1].ToLowerInvariant() }
    })
    if ($certificates.Count -ne 1 -or $certificates[0] -ne $expectedSigner) {
        throw "Unexpected publisher signature: $($part.Name)"
    }
    $badging = @(& $aapt dump badging $part.Path)
    if ($LASTEXITCODE -ne 0) { throw "Cannot inspect APK manifest: $($part.Name)" }
    $packageLine = @($badging | Where-Object { $_ -match '^package:' })
    if ($packageLine.Count -ne 1 -or $packageLine[0] -notmatch "^package: name='([^']+)' versionCode='(\d+)' versionName='([^']*)'") {
        throw "Unexpected package metadata: $($part.Name)"
    }
    $package = $Matches[1]; $partCode = [long]$Matches[2]; $partVersion = $Matches[3]
    $split = $packageLine[0] -match " split='"
    $validVersion = $partVersion -eq $ExpectedVersion -or ($split -and $partVersion -eq '')
    if ($package -ne 'tv.twitch.android.app' -or -not $validVersion -or
        ($null -ne $versionCode -and $versionCode -ne $partCode)) {
        throw "Package or version mismatch: $($part.Name)"
    }
    if ($extension -eq '.apk' -and $split) { throw 'A split APK is not a complete input.' }
    if ($part.Name -eq 'base.apk' -and ($split -or $partVersion -ne $ExpectedVersion)) {
        throw 'The base APK must declare the expected version and cannot be a split.'
    }
    $versionCode = $partCode
    $abis = @($badging | Where-Object { $_ -match '^native-code:' } | ForEach-Object {
        [regex]::Matches($_, "'([^']+)'") | ForEach-Object { $_.Groups[1].Value }
    })
    $identities.Add([ordered]@{ name = $part.Name; abis = $abis
        sha256 = (Get-FileHash -LiteralPath $part.Path -Algorithm SHA256).Hash.ToLowerInvariant() })
}
$prepared = $snapshot
if ($extension -ne '.apk') {
    $prepared = & "$PSScriptRoot/prepare-original.ps1" -InputBundle $snapshot -OriginalBaseApk $baseParts[0].Path
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $prepared -PathType Leaf)) {
        throw 'Original preparation did not produce a verified input.'
    }
}
$metadata = [ordered]@{
    packageName = 'tv.twitch.android.app'; versionName = $ExpectedVersion; versionCode = $versionCode
    sourceSha256 = $inputHash.ToLowerInvariant(); publisherCertificateSha256 = $expectedSigner
    parts = $identities.ToArray(); preparedInput = $prepared
    preparedSha256 = (Get-FileHash -LiteralPath $prepared -Algorithm SHA256).Hash.ToLowerInvariant()
    stage = 'original-verified'; deviceAcceptance = 'not-tested'
}
$metadataPath = Join-Path $run 'candidate.json'
$metadata | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $metadataPath -Encoding utf8
Write-Host "Candidate intake: $run"
Write-Host "Prepared original: $prepared"
if ($Decompile) {
    & "$PSScriptRoot/inspect-apk.ps1" -InputApk $snapshot -Decompile
    if ($LASTEXITCODE -ne 0) { throw 'Inspection failed. Review the local JADX report before continuing.' }
}
if ($Patch.Count) {
    & "$PSScriptRoot/build.ps1"
    if ($LASTEXITCODE -ne 0) { throw 'Candidate build failed.' }
    & "$PSScriptRoot/patch.ps1" -InputApk $prepared -AuditOriginalBaseApk $prepared -Patch $Patch
    if ($LASTEXITCODE -ne 0) { throw 'Candidate patch or audit failed. Do not bypass mandatory hooks.' }
    $metadata.stage = 'patch-and-original-aware-audit-passed'
    $metadata | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $metadataPath -Encoding utf8
}
