param(
    [string]$AndroidSdk = "$env:LOCALAPPDATA\Android\Sdk",
    [string]$Jdk = 'C:\Program Files\Android\Android Studio\jbr'
)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$env:JAVA_HOME = $Jdk
$desktop = Join-Path $PSScriptRoot 'tools\morphe-desktop.jar'
$expected = '36E20D7A18F655FB5829AE50AADD61217E2208536C0741DF5F7799300F758F56'
if ((Get-FileHash $desktop -Algorithm SHA256).Hash -ne $expected) { throw 'Run Build.ps1 to obtain the pinned Morphe Desktop first.' }
New-Item -ItemType Directory -Force build\icons-dex,dist | Out-Null
& .\gradlew.bat iconsJar --console=plain
if ($LASTEXITCODE) { throw 'Icon patch compilation failed.' }
& "$AndroidSdk\build-tools\36.0.0\d8.bat" --release --min-api 26 --lib "$AndroidSdk\platforms\android-36\android.jar" --classpath $desktop --output build\icons-dex build\libs\waze-driver-icons-1.0.0.jar
if ($LASTEXITCODE) { throw 'Icon patch DEX compilation failed.' }
Copy-Item build\libs\waze-driver-icons-1.0.0.jar dist\waze-driver-icons-1.0.0.mpp
& "$Jdk\bin\jar.exe" uf dist\waze-driver-icons-1.0.0.mpp -C build\icons-dex classes.dex
if ($LASTEXITCODE) { throw 'Icon patch packaging failed.' }
& "$Jdk\bin\java.exe" -jar $desktop list-patches --patches dist\waze-driver-icons-1.0.0.mpp -pv
if ($LASTEXITCODE) { throw 'Morphe could not load the icon patch.' }
