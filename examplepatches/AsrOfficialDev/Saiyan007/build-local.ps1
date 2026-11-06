#requires -Version 5.1
[CmdletBinding()]
param(
    [string]$ToolDirectory = (Join-Path $env:LOCALAPPDATA 'Temp\Saiyan007\build-tools')
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
New-Item -ItemType Directory -Force -Path $ToolDirectory | Out-Null

function Get-VerifiedFile {
    param([string]$Name, [string]$Url, [string]$Sha256)
    $path = Join-Path $ToolDirectory $Name
    if (-not (Test-Path -LiteralPath $path)) {
        Write-Host "Downloading $Name"
        $temporary = Join-Path $ToolDirectory ([System.IO.Path]::GetRandomFileName())
        try {
            Invoke-WebRequest -UseBasicParsing -Uri $Url -OutFile $temporary
            if ((Get-FileHash -Algorithm SHA256 -LiteralPath $temporary).Hash -ne $Sha256) {
                throw "Checksum mismatch: $Name"
            }
            Move-Item -LiteralPath $temporary -Destination $path
        } finally {
            if (Test-Path -LiteralPath $temporary) { Remove-Item -LiteralPath $temporary }
        }
    }
    if ((Get-FileHash -Algorithm SHA256 -LiteralPath $path).Hash -ne $Sha256) {
        throw "Cached file checksum mismatch: $path"
    }
    return $path
}

$jdkArchive = Get-VerifiedFile `
    'OpenJDK21U-jdk_x64_windows_hotspot_21.0.13_9.zip' `
    'https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.13%2B9/OpenJDK21U-jdk_x64_windows_hotspot_21.0.13_9.zip' `
    'a4dbaa05fca4bd89d84584e58c459bd732efebb1722af80ab13c6516832004f9'
$javaHome = Join-Path $ToolDirectory 'jdk-21.0.13+9'
if (-not (Test-Path (Join-Path $javaHome 'bin\java.exe'))) {
    Expand-Archive -LiteralPath $jdkArchive -DestinationPath $ToolDirectory
}

$compilerArchive = Get-VerifiedFile `
    'kotlin-compiler-2.4.21.zip' `
    'https://github.com/JetBrains/kotlin/releases/download/v2.4.21/kotlin-compiler-2.4.21.zip' `
    '7cc140e76daf416a0424a5557f99afd7ca89ebd463ea1101261e3e01c33e75cd'
$kotlinDirectory = Join-Path $ToolDirectory 'kotlin-2.4.21'
$compiler = Join-Path $kotlinDirectory 'kotlinc\bin\kotlinc.bat'
if (-not (Test-Path $compiler)) {
    Expand-Archive -LiteralPath $compilerArchive -DestinationPath $kotlinDirectory
}

$desktop = Get-VerifiedFile `
    'morphe-desktop-1.20.0-all.jar' `
    'https://github.com/MorpheApp/morphe-desktop/releases/download/v1.20.0/morphe-desktop-1.20.0-all.jar' `
    '679f579b3ad743ac0ca697ef71e57430d00be59411b04494afd1845c43fb79f0'
$r8 = Get-VerifiedFile `
    'r8-9.1.57.jar' `
    'https://dl.google.com/dl/android/maven2/com/android/tools/r8/9.1.57/r8-9.1.57.jar' `
    '2c21870df0294bba3d5597a3de8f79e385650ea309d6dc55ffbeaa700bad18a5'

$versionLine = Get-Content (Join-Path $PSScriptRoot 'gradle.properties') | Where-Object { $_ -match '^version\s*=' }
$version = ($versionLine -split '=', 2)[1].Trim()
$buildDirectory = Join-Path $PSScriptRoot 'patches\build\local'
$classesDirectory = Join-Path $buildDirectory 'classes'
$outputDirectory = Join-Path $PSScriptRoot 'patches\build\libs'
if (Test-Path $classesDirectory) { Remove-Item -Recurse -LiteralPath $classesDirectory }
New-Item -ItemType Directory -Force -Path $classesDirectory, $outputDirectory | Out-Null

$sources = @(Get-ChildItem (Join-Path $PSScriptRoot 'patches\src\main\kotlin\app\custom') -Filter '*.kt' -Recurse | Select-Object -ExpandProperty FullName)
$compilerArguments = @(
    '-jvm-target', '11', '-no-stdlib', '-no-reflect',
    '-classpath', $desktop, '-d', $classesDirectory
) + $sources
$previousJavaHome = $env:JAVA_HOME
try {
    $env:JAVA_HOME = $javaHome
    & $compiler @compilerArguments
    if ($LASTEXITCODE -ne 0) { throw "Kotlin compilation failed ($LASTEXITCODE)." }
} finally {
    $env:JAVA_HOME = $previousJavaHome
}

$manifestPath = Join-Path $buildDirectory 'MANIFEST.MF'
$manifest = @"
Manifest-Version: 1.0
Name: Saiyan007
Description: Custom Android app patches for Morphe
Version: $version
Timestamp: $([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds())
Source: https://github.com/AsrOfficialDev/Saiyan007
Author: AsrOfficialDev
Contact: https://github.com/AsrOfficialDev/Saiyan007/issues
Website: https://github.com/AsrOfficialDev/Saiyan007
License: GPLv3
Patcher-Version: 2.1.0

"@
[System.IO.File]::WriteAllText($manifestPath, $manifest + "`n", [System.Text.Encoding]::ASCII)
$jvmJar = Join-Path $buildDirectory 'patches-jvm.jar'
& (Join-Path $javaHome 'bin\jar.exe') --create --file $jvmJar --manifest $manifestPath `
    -C $classesDirectory . -C $PSScriptRoot LICENSE -C $PSScriptRoot NOTICE
if ($LASTEXITCODE -ne 0) { throw "JAR packaging failed ($LASTEXITCODE)." }

$dexArchive = Join-Path $buildDirectory 'classes.zip'
if (Test-Path $dexArchive) { Remove-Item -LiteralPath $dexArchive }
& (Join-Path $javaHome 'bin\java.exe') -cp $r8 com.android.tools.r8.D8 `
    --release --min-api 26 --classpath $desktop --lib $javaHome --output $dexArchive $jvmJar
if ($LASTEXITCODE -ne 0) { throw "Android DEX compilation failed ($LASTEXITCODE)." }

$output = Join-Path $outputDirectory "Saiyan007-$version.mpp"
Copy-Item -LiteralPath $jvmJar -Destination $output -Force
$bundle = [System.IO.Compression.ZipFile]::Open($output, [System.IO.Compression.ZipArchiveMode]::Update)
try {
    $dex = [System.IO.Compression.ZipFile]::OpenRead($dexArchive)
    try {
        $entries = @($dex.Entries | Where-Object { $_.FullName -match '^classes\d*\.dex$' })
        if ($entries.Count -eq 0) { throw 'D8 produced no DEX files.' }
        foreach ($entry in $entries) {
            $inputStream = $entry.Open()
            try {
                $outputStream = $bundle.CreateEntry($entry.FullName).Open()
                try { $inputStream.CopyTo($outputStream) } finally { $outputStream.Dispose() }
            } finally { $inputStream.Dispose() }
        }
    } finally { $dex.Dispose() }
} finally { $bundle.Dispose() }

Write-Host "Built $output"
Get-FileHash -Algorithm SHA256 -LiteralPath $output | Format-List
