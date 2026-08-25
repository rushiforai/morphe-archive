[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$OriginalApk,

    [string]$OutputDirectory
)

$ErrorActionPreference = 'Stop'

$workspace = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$original = (Resolve-Path -LiteralPath $OriginalApk).Path
$buildRoot = Join-Path $workspace 'build'
$configuration = Get-Content -Raw -LiteralPath (Join-Path $workspace 'checksums.json') | ConvertFrom-Json
$hash = (Get-FileHash -LiteralPath $original -Algorithm SHA256).Hash
$assetProperty = $configuration.assets.PSObject.Properties[$hash]

if ($null -eq $assetProperty) {
    throw "Unsupported original APK SHA-256: $hash"
}

$asset = $assetProperty.Value
$abi = [string]$asset.abi
$java = 'C:\Program Files\Android\Android Studio\jbr\bin\java.exe'
$apktool = Join-Path $workspace 'tools\apktool_3.0.3.jar'
$buildTools = Join-Path $env:LOCALAPPDATA 'Android\Sdk\build-tools\36.0.0'
$keystore = Join-Path $env:USERPROFILE '.android\debug.keystore'
$patchRoot = Join-Path $workspace 'patches'

function Resolve-PatchHook {
    param(
        [Parameter(Mandatory = $true)]
        [pscustomobject]$Module,

        [Parameter(Mandatory = $true)]
        [string]$RelativePath
    )

    if ([IO.Path]::IsPathRooted($RelativePath)) {
        throw "Patch module '$($Module.Id)' hook must be module-relative: $RelativePath"
    }

    $moduleRoot = [IO.Path]::GetFullPath($Module.Directory)
    $candidate = [IO.Path]::GetFullPath((Join-Path $moduleRoot $RelativePath))
    if (-not $candidate.StartsWith($moduleRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Patch module '$($Module.Id)' hook escapes its module directory: $RelativePath"
    }
    if (-not (Test-Path -LiteralPath $candidate -PathType Leaf)) {
        throw "Patch module '$($Module.Id)' hook does not exist: $candidate"
    }

    return $candidate
}

if ([string]::IsNullOrWhiteSpace($OutputDirectory)) {
    $OutputDirectory = Join-Path $workspace 'artifacts'
}

foreach ($requiredPath in @($java, $apktool, $buildTools, $keystore, $patchRoot)) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Required path does not exist: $requiredPath"
    }
}

$modules = @(
    Get-ChildItem -LiteralPath $patchRoot -Directory |
        Where-Object { $_.Name -notin @('build', 'src') } |
        ForEach-Object {
            $manifestPath = Join-Path $_.FullName 'patch.json'
            if (-not (Test-Path -LiteralPath $manifestPath)) {
                throw "Patch directory is missing patch.json: $($_.FullName)"
            }

            $manifest = Get-Content -Raw -LiteralPath $manifestPath | ConvertFrom-Json
            if ([string]$manifest.id -ne $_.Name) {
                throw "Patch manifest id must match its directory name '$($_.Name)': $manifestPath"
            }

            [pscustomobject]@{
                Directory = $_.FullName
                Id = [string]$manifest.id
                Order = [int]$manifest.order
                Apply = [string]$manifest.apply
                Augment = [string]$manifest.augment
            }
        } |
        Sort-Object Order, Id
)

if ($modules.Count -eq 0) {
    throw "No patch modules were found under $patchRoot"
}

$invalidModules = @($modules | Where-Object {
    [string]::IsNullOrWhiteSpace($_.Id) -or [string]::IsNullOrWhiteSpace($_.Apply)
})
if ($invalidModules.Count -ne 0) {
    throw 'Every patch manifest must define a non-empty id and apply script.'
}

$duplicateIds = @($modules | Group-Object Id | Where-Object Count -gt 1)
if ($duplicateIds.Count -ne 0) {
    throw "Patch module IDs must be unique: $($duplicateIds.Name -join ', ')"
}

New-Item -ItemType Directory -Path $buildRoot, $OutputDirectory -Force | Out-Null
$OutputDirectory = (Resolve-Path -LiteralPath $OutputDirectory).Path
$buildId = [Guid]::NewGuid().ToString('N')
$decoded = Join-Path $buildRoot ("repro-{0}-{1}" -f $abi, $buildId)
$moduleBuildRoot = Join-Path $buildRoot ("modules-{0}" -f $buildId)

& $java -jar $apktool d -f $original -o $decoded
if ($LASTEXITCODE -ne 0) {
    throw 'Apktool failed to decode the original APK.'
}

foreach ($module in $modules) {
    $applyScript = Resolve-PatchHook -Module $module -RelativePath $module.Apply

    & $applyScript -DecodedDirectory $decoded
    if ($LASTEXITCODE -ne 0) {
        throw "Patch module '$($module.Id)' failed."
    }
}

$artifactBase = "Stremio-Morphe-1.10.4-MultiAccount-SIDE-BY-SIDE-$abi"
$unsigned = Join-Path $OutputDirectory "$artifactBase-unsigned.apk"
$aligned = Join-Path $OutputDirectory "$artifactBase-aligned.apk"
$signed = Join-Path $OutputDirectory "$artifactBase.apk"

& $java -jar $apktool b $decoded -o $unsigned
if ($LASTEXITCODE -ne 0) {
    throw 'Apktool failed to rebuild the APK.'
}

foreach ($module in $modules | Where-Object { -not [string]::IsNullOrWhiteSpace($_.Augment) }) {
    $augmentScript = Resolve-PatchHook -Module $module -RelativePath $module.Augment

    $moduleBuildDirectory = Join-Path $moduleBuildRoot $module.Id
    & $augmentScript -ArtifactPath $unsigned -BuildDirectory $moduleBuildDirectory
    if ($LASTEXITCODE -ne 0) {
        throw "Patch module '$($module.Id)' artifact augmentation failed."
    }
}

& (Join-Path $buildTools 'zipalign.exe') -f -p 4 $unsigned $aligned
if ($LASTEXITCODE -ne 0) {
    throw 'zipalign failed.'
}

& (Join-Path $buildTools 'apksigner.bat') sign `
    --ks $keystore `
    --ks-key-alias androiddebugkey `
    --ks-pass pass:android `
    --key-pass pass:android `
    --v4-signing-enabled false `
    --out $signed `
    $aligned
if ($LASTEXITCODE -ne 0) {
    throw 'apksigner failed.'
}

& (Join-Path $buildTools 'apksigner.bat') verify --verbose $signed
if ($LASTEXITCODE -ne 0) {
    throw 'The signed APK failed verification.'
}

$signedHash = (Get-FileHash -LiteralPath $signed -Algorithm SHA256).Hash
Write-Output "APK: $signed"
Write-Output "SHA-256: $signedHash"
