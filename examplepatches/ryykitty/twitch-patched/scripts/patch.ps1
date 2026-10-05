[CmdletBinding()]
param(
    [Parameter(Mandatory)][string] $InputApk,
    [string[]] $Patch = @('Inspect Twitch APK'),
    [switch] $Build,
    [switch] $Install,
    [string] $AuditOriginalBaseApk,
    [switch] $KeepScratch,
    [string] $Serial
)
. "$PSScriptRoot/common.ps1"

$inputPath = (Resolve-Path -LiteralPath $InputApk).Path
if ([IO.Path]::GetExtension($inputPath) -notin @('.apk', '.apkm', '.apks', '.xapk')) {
    throw 'Input must be an original APK or a complete split bundle.'
}
if (-not $Patch.Count -or @($Patch | Where-Object { -not $_.Trim() }).Count) {
    throw 'Select at least one patch by its exact name.'
}
$device = if ($Install) { Resolve-Device $Serial } else { $null }
$auditBase = if ($AuditOriginalBaseApk) { (Resolve-Path -LiteralPath $AuditOriginalBaseApk).Path } else { $null }
if ($auditBase) {
    $baselineHash = (Get-FileHash -LiteralPath $auditBase -Algorithm SHA256).Hash
    if ([IO.Path]::GetExtension($inputPath) -eq '.apk') {
        if ($baselineHash -ne (Get-FileHash -LiteralPath $inputPath -Algorithm SHA256).Hash) {
            throw 'Audit original must be the same APK as the patch input.'
        }
    } else {
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $archive = [IO.Compression.ZipFile]::OpenRead($inputPath)
        try {
            $baseEntry = @($archive.Entries | Where-Object { $_.FullName -match '(^|/)base\.apk$' })
            if ($baseEntry.Count -ne 1) { throw 'Audit mode requires exactly one base.apk in the original bundle.' }
            $baseStream = $baseEntry[0].Open()
            $hasher = [Security.Cryptography.SHA256]::Create()
            try { $inputBaseHash = [BitConverter]::ToString($hasher.ComputeHash($baseStream)).Replace('-', '') }
            finally { $baseStream.Dispose(); $hasher.Dispose() }
            if ($baselineHash -ne $inputBaseHash) { throw 'Audit base does not match the immutable bundle input.' }
        } finally { $archive.Dispose() }
    }
}
if ($Install -and $auditBase) {
    throw 'Original-aware mode produces local review artifacts only. Device installation requires a separate explicit step.'
}
if ($Build) {
    & "$PSScriptRoot/build.ps1"
    if ($LASTEXITCODE -ne 0) { throw 'Build did not succeed.' }
}
$morphe = Get-MorphePath
$sourceBundle = Get-BundlePath
$run = New-RunDirectory 'patch'
$bundle = Join-Path $run 'patches.mpp'
Copy-Item -LiteralPath $sourceBundle -Destination $bundle
$output = Join-Path $run $(if ($auditBase) { 'twitch-candidate.apk' } else { 'twitch-patched.apk' })
$keystore = Get-ProjectPath '.local/signing/development.bks'
New-Item -ItemType Directory -Path (Split-Path $keystore) -Force | Out-Null
$sdk = Get-AndroidSdk
$env:PATH = "$(Join-Path $sdk 'platform-tools');$env:PATH"
$arguments = @('-Xmx4g', '-jar', $morphe, 'patch', '-p', $bundle, '--exclusive')
if ($KeepScratch) { $arguments += '--disable-purge' }
foreach ($name in $Patch) { $arguments += @('-e', $name) }
$arguments += @('--bytecode-mode=FULL')
if (-not $auditBase) { $arguments += "--verify-with-sdk=$sdk" }
$arguments += @('--keystore', $keystore,
    '-o', $output, '-r', (Join-Path $run 'result.json'),
    '-t', (Join-Path $run 'scratch'), $inputPath)

[ordered]@{
    inputSha256 = (Get-FileHash -LiteralPath $inputPath -Algorithm SHA256).Hash
    bundleSha256 = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash
    patches = $Patch
    tool = 'Morphe Desktop 1.18.0'
    bytecodeMode = 'FULL'
    verification = if ($auditBase) { 'original-aware local audit' } else { 'unqualified SDK' }
    originalBaseSha256 = if ($auditBase) { (Get-FileHash -LiteralPath $auditBase -Algorithm SHA256).Hash } else { $null }
    gitRevision = (& git -C $script:ProjectRoot rev-parse HEAD | Out-String).Trim()
    workingTree = @(& git -C $script:ProjectRoot status --porcelain)
    createdUtc = [DateTime]::UtcNow.ToString('o')
} | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $run 'run.json') -Encoding utf8

& java @arguments 2>&1 | Tee-Object -FilePath (Join-Path $run 'patch.log')
if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $output)) {
    throw "Patching failed. Inspect $run. No installation attempted."
}
if ($auditBase) {
    & "$PSScriptRoot/verify-original-aware.ps1" -OriginalBaseApk $auditBase -OutputApk $output
    $acceptedOutput = Join-Path $run 'twitch-patched.apk'
    Move-Item -LiteralPath $output -Destination $acceptedOutput
    $output = $acceptedOutput
}
[ordered]@{
    apkSha256 = (Get-FileHash -LiteralPath $output -Algorithm SHA256).Hash
    bundleSha256 = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash
    verification = if ($auditBase) { 'original-aware local audit passed; unqualified hierarchy/device pending' } else { 'SDK passed; device pending' }
} | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $run 'artifact.json') -Encoding utf8
if ($Install) {
    & (Get-AdbPath) -s $device install -r $output
    if ($LASTEXITCODE -ne 0) {
        throw 'Installation failed. Keep the existing app and data; verify device status and the signing certificate before retrying.'
    }
}
Write-Host "Run artifacts: $run"
