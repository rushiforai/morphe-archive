param([string]$Version = '0.3.0')
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path $PSScriptRoot -Parent)
$morphe = Join-Path $PWD 'tools\morphe-desktop.jar'
& 'tools\kotlin-current\kotlinc\bin\kotlinc.bat' scripts\generate-metadata.kt -classpath $morphe -jvm-target 11 -d build\metadata.jar
if ($LASTEXITCODE -ne 0) { throw 'No se pudo compilar el generador de metadatos.' }
& java -cp "build\metadata.jar;$morphe" Generate_metadataKt "dist\lunar-edge-patches-$Version.mpp"
if ($LASTEXITCODE -ne 0) { throw 'No se pudieron generar los metadatos.' }
