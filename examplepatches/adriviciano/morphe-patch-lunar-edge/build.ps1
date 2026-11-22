param(
    [string]$Version = '0.3.0'
)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

# Las herramientas y salidas se mantienen dentro del proyecto.
$compiler = Join-Path $PSScriptRoot 'tools\kotlin-current\kotlinc\bin\kotlinc.bat'
$morphe = Join-Path $PSScriptRoot 'tools\morphe-desktop.jar'
$jadx = Join-Path $PSScriptRoot 'tools\jadx\lib\jadx-1.5.6-all.jar'
foreach ($toolPath in @($compiler, $morphe, $jadx)) {
    if (-not (Test-Path -LiteralPath $toolPath)) { throw "Falta la herramienta: $toolPath. Consulta README.md." }
}
$sdkRoot = $env:ANDROID_HOME
if (-not $sdkRoot) { $sdkRoot = Join-Path $env:USERPROFILE 'AppData\Local\Android\Sdk' }
$androidJar = Join-Path $sdkRoot 'platforms\android-35\android.jar'
if (-not (Test-Path -LiteralPath $androidJar)) { throw 'Falta Android SDK Platform 35. Configura ANDROID_HOME.' }

$flavor = 'patches'
$work = Join-Path $PSScriptRoot "build\$Version-$flavor"
$classes = Join-Path $work 'classes'
$castClasses = Join-Path $work 'cast-classes'
$castDex = Join-Path $work 'cast-dex'
$dex = Join-Path $work 'dex'
New-Item -ItemType Directory -Force $classes, $castClasses, $castDex, $dex, (Join-Path $classes 'extensions'), dist | Out-Null

$castSources = Get-ChildItem extensions\cast\src -Filter '*.java' -Recurse | Select-Object -ExpandProperty FullName
& javac --release 11 -cp $androidJar -d $castClasses $castSources
if ($LASTEXITCODE -ne 0) { throw 'Falló la compilación de la extensión Cast.' }
$extensionJar = Join-Path $work 'cast-extension.jar'
& jar --create --file $extensionJar -C $castClasses .
if ($LASTEXITCODE -ne 0) { throw 'Falló la creación de la extensión Cast.' }
& java -cp $jadx com.android.tools.r8.D8 --release --min-api 24 --lib $androidJar --output $castDex $extensionJar
if ($LASTEXITCODE -ne 0) { throw 'Falló la conversión DEX de Cast.' }
Copy-Item (Join-Path $castDex 'classes.dex') (Join-Path $classes 'extensions\cast.mpe') -Force

$patchSources = @(Get-ChildItem src\main\kotlin -Filter '*.kt' | Select-Object -ExpandProperty FullName)
$bundleName = 'Lunar Edge local patches'
& $compiler $patchSources -classpath $morphe -jvm-target 11 '-Xlambdas=class' -d $classes
if ($LASTEXITCODE -ne 0) { throw 'Falló la compilación Kotlin.' }

$manifest = @"
Manifest-Version: 1.0
Name: $bundleName
Description: Parches locales para Lunar Edge
Version: $Version
Author: Lunar Edge local patches
Source: https://github.com/adriviciano/morphe-patch-lunar-edge
Website: https://github.com/adriviciano/morphe-patch-lunar-edge
License: GPL-3.0-only

"@
$manifestPath = Join-Path $work 'MANIFEST.MF'
[IO.File]::WriteAllText($manifestPath, $manifest, [Text.UTF8Encoding]::new($false))
$bundle = Join-Path $PSScriptRoot "dist\lunar-edge-$flavor-$Version.mpp"
& jar --create --file $bundle --manifest $manifestPath -C $classes .
if ($LASTEXITCODE -ne 0) { throw 'Falló la creación del paquete.' }
$patchesJar = Join-Path $work 'patches.jar'
Copy-Item -LiteralPath $bundle -Destination $patchesJar -Force
& java -cp $jadx com.android.tools.r8.D8 --release --min-api 26 --classpath $morphe --output $dex $patchesJar
if ($LASTEXITCODE -ne 0) { throw 'Falló la conversión DEX.' }
& jar --update --file $bundle -C $dex classes.dex
if ($LASTEXITCODE -ne 0) { throw 'Falló la inclusión de classes.dex.' }
Write-Host "Creado $bundle"
