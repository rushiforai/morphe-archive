[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$ArtifactPath,

    [Parameter(Mandatory = $true)]
    [string]$BuildDirectory
)

$ErrorActionPreference = 'Stop'

$artifact = (Resolve-Path -LiteralPath $ArtifactPath).Path
$javac = 'C:\Program Files\Android\Android Studio\jbr\bin\javac.exe'
$jar = 'C:\Program Files\Android\Android Studio\jbr\bin\jar.exe'
$buildTools = Join-Path $env:LOCALAPPDATA 'Android\Sdk\build-tools\36.0.0'
$androidJar = Join-Path $env:LOCALAPPDATA 'Android\Sdk\platforms\android-36\android.jar'
$sourceDirectory = Join-Path $PSScriptRoot 'src\com\stremio\morphe'
$sources = @(Get-ChildItem -LiteralPath $sourceDirectory -Filter '*.java' -File | Select-Object -ExpandProperty FullName)

foreach ($requiredPath in @($javac, $jar, $buildTools, $androidJar, $sourceDirectory)) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Required addon-reordering module path does not exist: $requiredPath"
    }
}

if ($sources.Count -eq 0) {
    throw "The addon-reordering module contains no Java sources under $sourceDirectory"
}

$classes = Join-Path $BuildDirectory 'classes'
$dex = Join-Path $BuildDirectory 'dex'
$moduleJar = Join-Path $BuildDirectory 'addon-reordering.jar'
New-Item -ItemType Directory -Path $classes, $dex -Force | Out-Null

& $javac `
    -source 8 `
    -target 8 `
    -classpath $androidJar `
    -d $classes `
    $sources
if ($LASTEXITCODE -ne 0) {
    throw 'javac failed to compile the addon-reordering module.'
}

& $jar cf $moduleJar -C $classes '.'
if ($LASTEXITCODE -ne 0) {
    throw 'Failed to package the addon-reordering module classes.'
}

& (Join-Path $buildTools 'd8.bat') `
    --lib $androidJar `
    --min-api 24 `
    --output $dex `
    $moduleJar
if ($LASTEXITCODE -ne 0) {
    throw 'D8 failed to build the addon-reordering module dex.'
}

Move-Item -LiteralPath (Join-Path $dex 'classes.dex') -Destination (Join-Path $dex 'classes11.dex')

Push-Location $dex
try {
    & $jar uf $artifact 'classes11.dex'
    if ($LASTEXITCODE -ne 0) {
        throw 'Failed to inject the addon-reordering module dex into the APK.'
    }
}
finally {
    Pop-Location
}
