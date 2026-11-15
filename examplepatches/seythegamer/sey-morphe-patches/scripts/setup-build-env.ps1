# scripts/setup-build-env.ps1
# Downloads and installs every build dependency for the Sey Morphe patches.
#
# Run: powershell -ExecutionPolicy Bypass -File scripts\setup-build-env.ps1

[CmdletBinding()]
param(
    [switch]$SkipGit,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$RepoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $RepoRoot

$ToolsDir = Join-Path $RepoRoot 'tools'
New-Item -Path $ToolsDir -ItemType Directory -Force | Out-Null

Write-Host "=== Sey Morphe Build Environment Setup ==="
Write-Host "Repo root: $RepoRoot"
Write-Host "Tools dir: $ToolsDir"
Write-Host ""

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
function Download-File([string]$url, [string]$out, [string]$label) {
    if (-not $Force -and (Test-Path $out)) {
        Write-Host "  [skip] $label already exists: $out"
        return
    }
    Write-Host "  [downloading] $label -> $out"
    try {
        Invoke-WebRequest -Uri $url -OutFile $out -TimeoutSec 300
    }
    catch {
        throw "Failed to download $label from ${url}: $($_.Exception.Message)"
    }
}

function Expand-ArchiveFile([string]$zip, [string]$dest, [string]$label) {
    Write-Host "  [extracting] $label -> $dest"
    Expand-Archive -Path $zip -DestinationPath $dest -Force
}

function Add-Path([string]$path) {
    if (-not (Test-Path $path)) { return }
    $current = [Environment]::GetEnvironmentVariable('PATH', [EnvironmentVariableTarget]::Process)
    $entries = @()
    if ($current) {
        $entries = $current.Split(';', [StringSplitOptions]::RemoveEmptyEntries)
    }
    if ($entries -notcontains $path) {
        $newPath = ($entries + $path) -join ';'
        [Environment]::SetEnvironmentVariable('PATH', $newPath, [EnvironmentVariableTarget]::Process)
    }
}

# ---------------------------------------------------------------------------
# 1. JDK 21 (Adoptium Temurin)
# ---------------------------------------------------------------------------
Write-Host "--- 1/6: JDK 21 (Adoptium Temurin) ---"
$JdkDir = Join-Path $ToolsDir 'jdk21'
$JdkArchive = Join-Path $ToolsDir 'openjdk-21-windows-x64.zip'
$JdkUrl = 'https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.5%2B11/OpenJDK21U-jdk_x64_windows_hotspot_21.0.5_11.zip'

if ($Force -or -not (Test-Path (Join-Path $JdkDir 'bin\java.exe'))) {
    New-Item -Path $JdkDir -ItemType Directory -Force | Out-Null
    Download-File $JdkUrl $JdkArchive 'JDK 21 (Adoptium Temurin)'
    Expand-ArchiveFile $JdkArchive $JdkDir 'JDK 21'
    $inner = Get-ChildItem $JdkDir -Directory | Where-Object { $_.Name -like 'jdk-*' } | Select-Object -First 1
    if ($inner) {
        Get-ChildItem $inner.FullName | Move-Item -Destination $JdkDir -Force
        Remove-Item $inner.FullName -Recurse -Force
    }
    Remove-Item $JdkArchive -Force -ErrorAction SilentlyContinue
}
else {
    Write-Host "  [skip] JDK 21 already present"
}

$env:JAVA_HOME = $JdkDir
Add-Path (Join-Path $JdkDir 'bin')

Write-Host "  java: $(Join-Path $JdkDir 'bin\java.exe')"
Write-Host "  javac: $(Join-Path $JdkDir 'bin\javac.exe')"

# ---------------------------------------------------------------------------
# 2. Android SDK command-line tools + platform + build-tools
# ---------------------------------------------------------------------------
Write-Host "--- 2/6: Android SDK (command-line tools + platform + build-tools) ---"
$SdkDir = Join-Path $ToolsDir 'android-sdk'
$CmdlineToolsZip = Join-Path $ToolsDir 'cmdline-tools.zip'
$CmdlineToolsUrl = 'https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip'
$LatestToolsDir = Join-Path $SdkDir 'cmdline-tools\latest'

if ($Force -or -not (Test-Path (Join-Path $SdkDir 'platforms\android-34\android.jar'))) {
    New-Item -Path $LatestToolsDir -ItemType Directory -Force | Out-Null
    Download-File $CmdlineToolsUrl $CmdlineToolsZip 'Android SDK command-line tools'
    Expand-ArchiveFile $CmdlineToolsZip $LatestToolsDir 'command-line tools'

    $nestedCmdline = Join-Path $LatestToolsDir 'cmdline-tools'
    if (Test-Path $nestedCmdline) {
        Get-ChildItem $nestedCmdline | Move-Item -Destination $LatestToolsDir -Force
        Remove-Item $nestedCmdline -Recurse -Force
    }
    Remove-Item $CmdlineToolsZip -Force -ErrorAction SilentlyContinue

    $env:ANDROID_HOME = $SdkDir
    $env:ANDROID_SDK_ROOT = $SdkDir
    $sdkmanager = Join-Path $LatestToolsDir 'bin\sdkmanager.bat'

    Write-Host "  [sdkmanager] accepting licenses..."
    1..20 | ForEach-Object { "y" } | & $sdkmanager --licenses | Out-Null

    Write-Host "  [sdkmanager] installing platform android-34..."
    & $sdkmanager 'platforms;android-34' | Out-Host

    Write-Host "  [sdkmanager] installing build-tools 34.0.0..."
    & $sdkmanager 'build-tools;34.0.0' | Out-Host
}
else {
    Write-Host "  [skip] Android SDK already present"
}

$env:ANDROID_HOME = $SdkDir
$env:ANDROID_SDK_ROOT = $SdkDir
Add-Path (Join-Path $SdkDir 'build-tools\34.0.0')
Add-Path (Join-Path $SdkDir 'platform-tools')

Write-Host "  ANDROID_HOME: $SdkDir"
Write-Host "  d8: $(Join-Path $SdkDir 'build-tools\34.0.0\d8.bat')"
Write-Host "  apksigner: $(Join-Path $SdkDir 'build-tools\34.0.0\apksigner.bat')"
Write-Host "  zipalign: $(Join-Path $SdkDir 'build-tools\34.0.0\zipalign.exe')"
Write-Host "  android.jar: $(Join-Path $SdkDir 'platforms\android-34\android.jar')"

# ---------------------------------------------------------------------------
# 3. Kotlin compiler
# ---------------------------------------------------------------------------
Write-Host "--- 3/6: Kotlin compiler (kotlinc) ---"
$KotlincDir = Join-Path $ToolsDir 'kotlinc'
$KotlincZip = Join-Path $ToolsDir 'kotlin-compiler.zip'
$KotlincUrl = 'https://github.com/JetBrains/kotlin/releases/download/v2.1.20/kotlin-compiler-2.1.20.zip'

if ($Force -or -not (Test-Path (Join-Path $KotlincDir 'bin\kotlinc.bat'))) {
    New-Item -Path $KotlincDir -ItemType Directory -Force | Out-Null
    Download-File $KotlincUrl $KotlincZip 'Kotlin compiler'
    Expand-ArchiveFile $KotlincZip $KotlincDir 'Kotlin compiler'
    $inner = Get-ChildItem $KotlincDir -Directory | Where-Object { $_.Name -eq 'kotlinc' } | Select-Object -First 1
    if ($inner) {
        Get-ChildItem $inner.FullName | Move-Item -Destination $KotlincDir -Force
        Remove-Item $inner.FullName -Recurse -Force
    }
    Remove-Item $KotlincZip -Force -ErrorAction SilentlyContinue
}
else {
    Write-Host "  [skip] Kotlin compiler already present"
}

Add-Path (Join-Path $KotlincDir 'bin')

Write-Host "  kotlinc: $(Join-Path $KotlincDir 'bin\kotlinc.bat')"
Write-Host "  kotlin-stdlib.jar: $(Join-Path $KotlincDir 'lib\kotlin-stdlib.jar')"

# ---------------------------------------------------------------------------
# 4. morphe-desktop.jar
# ---------------------------------------------------------------------------
Write-Host "--- 4/6: morphe-desktop.jar ---"
$MorpheJar = Join-Path $ToolsDir 'morphe-desktop.jar'

if ($Force -or -not (Test-Path $MorpheJar)) {
    $release = Invoke-RestMethod -Uri 'https://api.github.com/repos/MorpheApp/morphe-desktop/releases/latest' -Headers @{ 'User-Agent' = 'setup-build-env' }
    $asset = $release.assets | Where-Object { $_.name -like 'morphe-desktop-*-all.jar' } | Select-Object -First 1
    if (-not $asset) {
        throw "Could not find morphe-desktop-*-all.jar in latest MorpheApp/morphe-desktop release."
    }
    Download-File $asset.browser_download_url $MorpheJar $asset.name
}
else {
    Write-Host "  [skip] morphe-desktop.jar already present"
}

Write-Host "  morphe-desktop.jar: $MorpheJar"

# ---------------------------------------------------------------------------
# 5. Git for Windows (optional)
# ---------------------------------------------------------------------------
if (-not $SkipGit) {
    Write-Host "--- 5/6: Git for Windows ---"
    $GitExe = Join-Path $env:ProgramFiles 'Git\bin\git.exe'
    if ($Force -or -not (Test-Path $GitExe)) {
        $GitInstaller = Join-Path $ToolsDir 'Git-64-bit.exe'
        $GitUrl = 'https://github.com/git-for-windows/git/releases/download/v2.47.1.windows.1/Git-2.47.1.2-64-bit.exe'
        Download-File $GitUrl $GitInstaller 'Git for Windows'
        Write-Host "  [installing] Git for Windows silently..."
        Start-Process -FilePath $GitInstaller -ArgumentList '/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS' -Wait
        Remove-Item $GitInstaller -Force -ErrorAction SilentlyContinue
    }
    else {
        Write-Host "  [skip] Git already present at $GitExe"
    }
    Add-Path (Join-Path $env:ProgramFiles 'Git\bin')
    Add-Path (Join-Path $env:ProgramFiles 'Git\usr\bin')
}
else {
    Write-Host "--- 5/6: Git for Windows (skipped) ---"
}

# ---------------------------------------------------------------------------
# 6. Verify
# ---------------------------------------------------------------------------
Write-Host ""
Write-Host "--- 6/6: Verification ---"

$errors = @()

function Check-Tool([string]$path, [string]$name) {
    if (Test-Path $path) {
        Write-Host "  OK: $name -> $path"
    }
    else {
        Write-Host "  MISSING: $name -> $path" -ForegroundColor Yellow
        $script:errors += $name
    }
}

Check-Tool (Join-Path $JdkDir 'bin\java.exe')                     'java'
Check-Tool (Join-Path $JdkDir 'bin\javac.exe')                    'javac'
Check-Tool (Join-Path $SdkDir 'build-tools\34.0.0\d8.bat')        'd8'
Check-Tool (Join-Path $SdkDir 'build-tools\34.0.0\apksigner.bat') 'apksigner'
Check-Tool (Join-Path $SdkDir 'build-tools\34.0.0\zipalign.exe')  'zipalign'
Check-Tool (Join-Path $SdkDir 'platforms\android-34\android.jar') 'android.jar'
Check-Tool (Join-Path $KotlincDir 'bin\kotlinc.bat')              'kotlinc'
Check-Tool (Join-Path $KotlincDir 'lib\kotlin-stdlib.jar')        'kotlin-stdlib.jar'
Check-Tool $MorpheJar                                             'morphe-desktop.jar'

if ($errors.Count -gt 0) {
    Write-Host ""
    Write-Host "Some tools are missing: $($errors -join ', ')" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "=== Build environment ready! ==="
Write-Host ""
Write-Host "Next, run the build:"
Write-Host "  powershell -ExecutionPolicy Bypass -File scripts\build-patch.ps1 -Version 1.2.5"
Write-Host ""
Write-Host "Then (for KICK patched APK):"
Write-Host "  powershell -ExecutionPolicy Bypass -File scripts\build-kick-apk.ps1 -Version 1.2.5"
Write-Host ""
Write-Host "Environment variables set for this session only. To make them permanent,"
Write-Host "add these to your System PATH manually:"
Write-Host "  $JdkDir\bin"
Write-Host "  $KotlincDir\bin"
Write-Host "  $SdkDir\build-tools\34.0.0"
Write-Host "  $SdkDir\platform-tools"
Write-Host "And set ANDROID_HOME=$SdkDir"