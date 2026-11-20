param(
    [string]$ToolRoot = (Join-Path $PSScriptRoot '../../.tools')
)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$desktop = (Resolve-Path (Join-Path $ToolRoot 'morphe-desktop-1.18.1-all.jar')).Path
$cache = Join-Path $ToolRoot 'gradle-home/caches/modules-2/files-2.1'
$compiler = Get-ChildItem (Join-Path $cache 'org.jetbrains.kotlin/kotlin-compiler-embeddable/2.3.20') -Recurse -Filter '*.jar' | Select-Object -First 1 -ExpandProperty FullName
$annotations = Get-ChildItem (Join-Path $cache 'org.jetbrains/annotations') -Recurse -Filter '*.jar' | Select-Object -First 1 -ExpandProperty FullName
if (!$compiler -or !$annotations) { throw 'Kotlin 2.3.20 compiler and JetBrains annotations are required.' }
New-Item -ItemType Directory -Force build/classes,build/dex,dist | Out-Null
& java -cp "$compiler;$desktop;$annotations" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -no-reflect -jvm-target 11 -classpath $desktop -d build/classes src/ProjectivyPatch.kt
if ($LASTEXITCODE) { throw 'Kotlin compilation failed' }
@"
Manifest-Version: 1.0
Name: gggg-unit Projectivy Patches
Description: Independent version-unrestricted Projectivy patch
Version: 0.1.0
Author: gggg-unit
Source: https://github.com/gggg-unit/projectivy-morphe-patch
Website: https://github.com/gggg-unit/projectivy-morphe-patch/releases
License: GPL-3.0-only
Patcher-Version: 1.8.0

"@ | Set-Content -Encoding ascii build/MANIFEST.MF
& jar cfm build/patches.jar build/MANIFEST.MF -C build/classes . LICENSE NOTICE
if ($LASTEXITCODE) { throw 'Jar packaging failed' }
$d8 = Join-Path $ToolRoot 'android-sdk/build-tools/35.0.0/lib/d8.jar'
& java -cp $d8 com.android.tools.r8.D8 --min-api 23 --lib $desktop --output build/dex build/patches.jar
if ($LASTEXITCODE) { throw 'Android compilation failed' }
Copy-Item build/patches.jar dist/patches-0.1.0.mpp -Force
& jar uf dist/patches-0.1.0.mpp -C build/dex classes.dex
if ($LASTEXITCODE) { throw 'MPP packaging failed' }

