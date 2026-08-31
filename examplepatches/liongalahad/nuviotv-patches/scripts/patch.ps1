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
    $manifestNeedlesProperty = $manifest.inspection.PSObject.Properties['manifestNeedles']
    if ($manifestNeedlesProperty) {
        foreach ($required in @($manifestNeedlesProperty.Value)) {
            if ($inspection -notmatch [regex]::Escape([string]$required)) {
                throw "Post-patch manifest inspection did not find $required"
            }
        }
    }
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
$needles = @($manifest.inspection.classes | ForEach-Object {
    'L' + ($_.Replace('.', '/')) + ';'
}) + @($manifest.inspection.needles)
$forbiddenNeedles = @($manifest.inspection.forbiddenNeedles)
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

$smaliProperty = $manifest.inspection.PSObject.Properties['smali']
$smaliInspections = @()
if ($smaliProperty) { $smaliInspections = @($smaliProperty.Value) }
if ($smaliInspections.Count -gt 0) {
    $apkAnalyzer = Get-ChildItem (Join-Path $env:ANDROID_HOME 'cmdline-tools') -Recurse `
        -Filter apkanalyzer.bat -ErrorAction SilentlyContinue |
        Sort-Object FullName -Descending | Select-Object -First 1
    if (-not $apkAnalyzer) {
        throw 'Post-patch Smali inspection requires apkanalyzer.bat from Android SDK command-line tools.'
    }
    $smaliDirectory = Join-Path $RunDirectory 'smali-inspection'
    New-Item -ItemType Directory -Force $smaliDirectory | Out-Null
    foreach ($smaliInspection in $smaliInspections) {
        $className = [string]$smaliInspection.class
        if ([string]::IsNullOrWhiteSpace($className)) {
            throw 'Post-patch Smali inspection is missing a class name.'
        }
        $classFile = Join-Path $smaliDirectory (($className -replace '[^A-Za-z0-9_.-]', '_') + '.smali')
        & $apkAnalyzer.FullName dex code --class $className $output 2>&1 |
            Set-Content -Encoding UTF8 $classFile
        if ($LASTEXITCODE -ne 0) {
            throw "Post-patch Smali inspection could not decompile $className"
        }
        $classSmali = Get-Content $classFile -Raw
        foreach ($required in @($smaliInspection.required)) {
            if (-not $classSmali.Contains([string]$required)) {
                throw "Post-patch Smali inspection of $className did not find $required"
            }
        }
        foreach ($forbidden in @($smaliInspection.forbidden)) {
            if ($classSmali.Contains([string]$forbidden)) {
                throw "Post-patch Smali inspection of $className found forbidden instruction $forbidden"
            }
        }
    }
}

[pscustomobject]@{ RunDirectory = $RunDirectory; PatchedApk = $output; Result = $result }
