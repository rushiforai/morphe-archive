<#
.SYNOPSIS
    Builds the Pixiv Morphe .mpp patch bundle locally and offline.
#>

$ErrorActionPreference = "Stop"
$RepoRoot = $PSScriptRoot
Set-Location $RepoRoot

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "  Pixiv Morphe Patch Repository - Local/Offline Build Pipeline (PS1)" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan

# 1. Locate Android SDK tools
$D8Bat = $null
if (Test-Path "$env:LOCALAPPDATA\Android\Sdk\build-tools") {
    $D8Bat = (Get-ChildItem -Path "$env:LOCALAPPDATA\Android\Sdk\build-tools" -Filter "d8.bat" -Recurse -File | Sort-Object FullName -Descending | Select-Object -First 1).FullName
}
if (-not $D8Bat -and $env:ANDROID_HOME) {
    $D8Bat = (Get-ChildItem -Path "$env:ANDROID_HOME\build-tools" -Filter "d8.bat" -Recurse -File | Sort-Object FullName -Descending | Select-Object -First 1).FullName
}

$AndroidJar = $null
if (Test-Path "$env:LOCALAPPDATA\Android\Sdk\platforms") {
    $AndroidJar = (Get-ChildItem -Path "$env:LOCALAPPDATA\Android\Sdk\platforms" -Filter "android.jar" -Recurse -File | Sort-Object FullName -Descending | Select-Object -First 1).FullName
}
if (-not $AndroidJar -and $env:ANDROID_HOME) {
    $AndroidJar = (Get-ChildItem -Path "$env:ANDROID_HOME\platforms" -Filter "android.jar" -Recurse -File | Sort-Object FullName -Descending | Select-Object -First 1).FullName
}

if (-not $D8Bat) { throw "d8.bat not found in Android SDK build-tools." }
if (-not $AndroidJar) { throw "android.jar not found in Android SDK platforms." }

Write-Host "[OK] Using D8: $D8Bat" -ForegroundColor Green
Write-Host "[OK] Using android.jar: $AndroidJar" -ForegroundColor Green

# 2. Locate Tools
$ToolsDir = Join-Path $RepoRoot "..\tools"
if (-not (Test-Path $ToolsDir)) { $ToolsDir = Join-Path $RepoRoot "tools" }

$Kotlinc = Join-Path $ToolsDir "kotlinc\bin\kotlinc.bat"
if (-not (Test-Path $Kotlinc)) {
    $KotlincCmd = Get-Command "kotlinc" -ErrorAction SilentlyContinue
    if ($KotlincCmd) { $Kotlinc = $KotlincCmd.Source }
}
if (-not (Test-Path $Kotlinc)) { throw "kotlinc compiler not found." }

$KotlinStdlib = Join-Path $ToolsDir "kotlinc\lib\kotlin-stdlib.jar"
if (-not (Test-Path $KotlinStdlib)) { throw "kotlin-stdlib.jar not found." }

$MorpheCli = Join-Path $ToolsDir "morphe-cli.jar"
if (-not (Test-Path $MorpheCli)) { $MorpheCli = Join-Path $RepoRoot "libs\morphe-cli.jar" }
if (-not (Test-Path $MorpheCli)) { throw "morphe-cli.jar not found." }

Write-Host "[OK] Using kotlinc: $Kotlinc" -ForegroundColor Green
Write-Host "[OK] Using morphe-cli: $MorpheCli" -ForegroundColor Green

# 3. Clean & Setup Staging
Write-Host "[1/5] Preparing build staging..." -ForegroundColor Yellow
$BuildDir = Join-Path $RepoRoot "build\local"
if (Test-Path $BuildDir) { Remove-Item $BuildDir -Recurse -Force }
$ExtClasses = New-Item -ItemType Directory -Path "$BuildDir\extension_classes" -Force
$ExtDex = New-Item -ItemType Directory -Path "$BuildDir\extension_dex" -Force
$PatchClasses = New-Item -ItemType Directory -Path "$BuildDir\patch_classes" -Force
$PatchDex = New-Item -ItemType Directory -Path "$BuildDir\patch_dex" -Force
$StagingExt = New-Item -ItemType Directory -Path "$BuildDir\staging\extensions" -Force
$StagingMeta = New-Item -ItemType Directory -Path "$BuildDir\staging\META-INF" -Force
$OutDir = New-Item -ItemType Directory -Path "$RepoRoot\patches\build\libs" -Force

# 4. Compile Extension Sources
Write-Host "[2/5] Compiling extension Kotlin sources..." -ForegroundColor Yellow
$ExtSrcFiles = Get-ChildItem -Path "$RepoRoot\extensions\pixiv\src\main\kotlin" -Filter "*.kt" -Recurse -File
if ($ExtSrcFiles.Count -gt 0) {
    & $Kotlinc ($ExtSrcFiles | ForEach-Object { $_.FullName }) -cp $AndroidJar -d $ExtClasses.FullName
    $ExtClassFiles = (Get-ChildItem -Path $ExtClasses.FullName -Filter "*.class" -Recurse -File | ForEach-Object { $_.FullName })
    & $D8Bat --lib $AndroidJar --output $ExtDex.FullName $ExtClassFiles $KotlinStdlib
    Copy-Item "$($ExtDex.FullName)\classes.dex" "$($StagingExt.FullName)\pixiv.mpe" -Force
}

# 5. Compile Patch Sources
Write-Host "[3/5] Compiling patch Kotlin sources..." -ForegroundColor Yellow
$PatchSrcFiles = Get-ChildItem -Path "$RepoRoot\patches\src\main\kotlin" -Filter "*.kt" -Recurse -File
if ($PatchSrcFiles.Count -eq 0) { throw "No patch sources found in patches\src\main\kotlin" }

& $Kotlinc -jvm-target 11 ($PatchSrcFiles | ForEach-Object { $_.FullName }) -cp $MorpheCli -d $PatchClasses.FullName
$PatchClassFiles = (Get-ChildItem -Path $PatchClasses.FullName -Filter "*.class" -Recurse -File | ForEach-Object { $_.FullName })
& $D8Bat --lib $AndroidJar --output $PatchDex.FullName $PatchClassFiles

Copy-Item "$($PatchDex.FullName)\classes.dex" "$BuildDir\staging\classes.dex" -Force
Copy-Item "$($PatchClasses.FullName)\*" "$BuildDir\staging\" -Recurse -Force

# 6. Manifest & Bundle
Write-Host "[4/5] Packaging .mpp bundle..." -ForegroundColor Yellow
$PatchesGradle = Join-Path $RepoRoot "patches\build.gradle.kts"
$PatchesVersion = "1.0.2"
if (Test-Path $PatchesGradle) {
    $verMatch = Select-String -Path $PatchesGradle -Pattern 'version\s*=\s*"([^"]+)"'
    if ($verMatch -and $verMatch.Matches[0].Groups[1].Value) {
        $PatchesVersion = $verMatch.Matches[0].Groups[1].Value
    }
}

$ManifestContent = @"
Manifest-Version: 1.0
Name: Pixiv Patches
Description: Morphe patches for Pixiv Android
Version: $PatchesVersion
Source: https://github.com/Fripe070/PixivPatches
Author: Fripe070
Website: https://github.com/Fripe070/PixivPatches
License: GNU General Public License v3.0
Patcher-Version: 1.10.0
"@
Set-Content -Path "$StagingMeta\MANIFEST.MF" -Value $ManifestContent -Encoding Ascii

$OutputMpp = "$($OutDir.FullName)\pixiv-patches-$PatchesVersion.mpp"
if (Test-Path $OutputMpp) { Remove-Item $OutputMpp -Force }

& jar cvfm $OutputMpp "$StagingMeta\MANIFEST.MF" -C "$BuildDir\staging" .
Copy-Item $OutputMpp "$RepoRoot\pixiv-patches.mpp" -Force
Copy-Item $OutputMpp "$RepoRoot\patches\build\libs\pixiv-patches-1.0.0.mpp" -Force
Copy-Item $OutputMpp "$RepoRoot\patches-$PatchesVersion.mpp" -Force

# 7. Verification
Write-Host "[5/5] Verifying bundle with morphe-cli and dexdump..." -ForegroundColor Yellow
& java -jar $MorpheCli list-patches --patches=$OutputMpp

$DexDump = "$env:LOCALAPPDATA\Android\Sdk\build-tools\36.0.0\dexdump.exe"
if (Test-Path $DexDump) {
    Write-Host "Verifying compiled extension DEX bytecode with dexdump..." -ForegroundColor Gray
    $dumpOut = & $DexDump -c "$($ExtDex.FullName)\classes.dex" 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Extension DEX bytecode validation failed: $dumpOut"
    }
    Write-Host "[OK] Extension DEX passed dexdump validation." -ForegroundColor Green
}

Write-Host "======================================================================" -ForegroundColor Green
Write-Host "  SUCCESS: $OutputMpp" -ForegroundColor Green
Write-Host "======================================================================" -ForegroundColor Green
