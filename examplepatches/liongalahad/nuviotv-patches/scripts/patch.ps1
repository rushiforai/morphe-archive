[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Patch,
    [ValidateSet('universal','x86_64','arm64-v8a','armeabi-v7a')][string]$Abi = 'x86_64',
    [string]$RunDirectory,
    [switch]$NoBuild
)

. "$PSScriptRoot\Common.ps1"
Initialize-NuvioEnvironment | Out-Null
$repo = Get-RepoRoot
$manifest = Get-PatchManifest $Patch
$asset = Get-Asset $manifest $Abi
if (-not $NoBuild) { & "$PSScriptRoot\build.ps1" -Patch $Patch; if ($LASTEXITCODE -ne 0) { throw 'Build failed.' } }
if (-not $RunDirectory) { $RunDirectory = New-PatchRunDirectory $Patch $Abi }
New-Item -ItemType Directory -Force $RunDirectory | Out-Null

$cache = Join-Path $repo "local\cache\nuvio-$($manifest.target.versions[0])-$Abi.apk"
New-Item -ItemType Directory -Force (Split-Path -Parent $cache) | Out-Null
if (-not (Test-Path $cache)) { Invoke-WebRequest $asset.url -OutFile $cache }
$inputHash = Assert-Sha256 $cache $asset.sha256

$bundle = Get-PatchBundle
$bundleHash = (Get-FileHash $bundle -Algorithm SHA256).Hash.ToLowerInvariant()
$output = Join-Path $RunDirectory 'nuviotv-patched.apk'
$result = Join-Path $RunDirectory 'patch-result.json'
$log = Join-Path $RunDirectory 'patch.log'
$keystore = Get-TestKeystore
$credentials = $keystore.Credentials
$keystoreAlias = $credentials.alias.ToLowerInvariant()
$jar = Get-MorpheJar

$arguments = @(
    '-jar', $jar, 'patch', '--patches', $bundle, '--exclusive',
    '--enable', $manifest.name, '--out', $output, '--result-file', $result,
    '--keystore', $keystore.Path, '--keystore-password', $credentials.storePassword,
    '--keystore-entry-alias', $keystoreAlias, '--keystore-entry-password', $credentials.entryPassword,
    # FULL mode rejects optional classes intentionally absent from the official
    # APK, while STRIP_SAFE triggers a Morphe 1.12.0 rebuild concurrency defect.
    # STRIP_FAST is Morphe's supported default and rewrites touched classes only.
    '--bytecode-mode', 'STRIP_FAST', $cache
)
$previousErrorAction = $ErrorActionPreference
$ErrorActionPreference = 'Continue'
try {
    & java @arguments 2>&1 | Tee-Object -FilePath $log
    $patchExitCode = $LASTEXITCODE
} finally {
    $ErrorActionPreference = $previousErrorAction
}
if ($patchExitCode -ne 0 -or -not (Test-Path $output)) { throw "Patching failed. See $log" }

$snapshot = [ordered]@{
    patchId = $Patch
    patchName = $manifest.name
    targetVersion = $manifest.target.versions[0]
    abi = $Abi
    officialAsset = $asset.url
    inputSha256 = $inputHash
    bundle = Split-Path -Leaf $bundle
    bundleSha256 = $bundleHash
    outputSha256 = (Get-FileHash $output -Algorithm SHA256).Hash.ToLowerInvariant()
    gitCommit = (& git -C $repo rev-parse HEAD)
    createdUtc = [DateTime]::UtcNow.ToString('o')
}
$snapshot | ConvertTo-Json | Set-Content -Encoding UTF8 (Join-Path $RunDirectory 'run.json')

$aapt = Get-ChildItem (Join-Path $env:ANDROID_HOME 'build-tools') -Recurse -Filter aapt2.exe |
    Sort-Object FullName -Descending | Select-Object -First 1
if ($aapt) {
    & $aapt.FullName dump xmltree --file AndroidManifest.xml $output 2>&1 |
        Set-Content -Encoding UTF8 (Join-Path $RunDirectory 'manifest-inspection.txt')
    $inspection = Get-Content (Join-Path $RunDirectory 'manifest-inspection.txt') -Raw
    foreach ($required in @($manifest.inspection.provider, $manifest.inspection.metadata)) {
        if ($inspection -notmatch [regex]::Escape($required)) { throw "Post-patch manifest inspection did not find $required" }
    }
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
$needles = @(
    'Lio/github/liongalahad/nuviotv/extension/settings/MorpheSettingsRuntime;',
    'Lio/github/liongalahad/nuviotv/extension/settings/MorpheComposeToggleAction;',
    'Lio/github/liongalahad/nuviotv/extension/settings/MorpheComposeModeAction;',
    'Lio/github/liongalahad/nuviotv/extension/settings/MorpheSdhModeDialogAction;',
    'Lio/github/liongalahad/nuviotv/extension/settings/MorpheSdhModeDialog;',
    'Lio/github/liongalahad/nuviotv/extension/settings/MorpheSubtitlesExpandAction;',
    'Lio/github/liongalahad/nuviotv/extension/subtitles/sdh/SdhCleanupMode;',
    'Lio/github/liongalahad/nuviotv/extension/subtitles/sdh/SdhCueTransformer;',
    'subtitles.sdh_cleanup_mode',
    'Landroidx/media3/common/text/CueGroup;'
)
$forbiddenNeedles = @('Lcom/google/common/collect/ImmutableList;')
$found = @{}
($needles + $forbiddenNeedles) | ForEach-Object { $found[$_] = $false }
$archive = [IO.Compression.ZipFile]::OpenRead($output)
try {
    foreach ($entry in $archive.Entries | Where-Object { $_.Name -match '^classes\d*\.dex$' }) {
        $stream = $entry.Open()
        $memory = New-Object IO.MemoryStream
        try {
            $stream.CopyTo($memory)
            $text = [Text.Encoding]::ASCII.GetString($memory.ToArray())
            foreach ($needle in ($needles + $forbiddenNeedles)) {
                if ($text.Contains($needle)) { $found[$needle] = $true }
            }
        } finally {
            $memory.Dispose()
            $stream.Dispose()
        }
    }
} finally {
    $archive.Dispose()
}
$found | ConvertTo-Json | Set-Content -Encoding UTF8 (Join-Path $RunDirectory 'dex-inspection.json')
foreach ($needle in $needles) {
    if (-not $found[$needle]) { throw "Post-patch DEX inspection did not find $needle" }
}
foreach ($needle in $forbiddenNeedles) {
    if ($found[$needle]) { throw "Post-patch DEX inspection found release-incompatible type $needle" }
}

[pscustomobject]@{ RunDirectory = $RunDirectory; PatchedApk = $output; Result = $result }
