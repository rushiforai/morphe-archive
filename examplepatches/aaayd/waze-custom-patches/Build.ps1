param(
    [string]$AndroidSdk = "$env:LOCALAPPDATA\Android\Sdk",
    [string]$Jdk = $env:JAVA_HOME
)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not $Jdk) { $Jdk = 'C:\Program Files\Android\Android Studio\jbr' }
if (-not (Test-Path "$Jdk\bin\java.exe")) { throw 'Supply -Jdk with a JDK 21 directory.' }
$env:JAVA_HOME = $Jdk
$buildTools = Join-Path $AndroidSdk 'build-tools\36.0.0'
$androidJar = Join-Path $AndroidSdk 'platforms\android-36\android.jar'
if (-not (Test-Path $androidJar)) { throw 'Install Android SDK platform 36.' }
if (-not (Test-Path "$buildTools\d8.bat")) { throw 'Install Android SDK build-tools 36.0.0.' }
New-Item -ItemType Directory -Force tools,build\dex,dist | Out-Null
$desktop = Join-Path $PSScriptRoot 'tools\morphe-desktop.jar'
if (-not (Test-Path $desktop)) {
    Invoke-WebRequest 'https://github.com/MorpheApp/morphe-desktop/releases/download/v1.18.0/morphe-desktop-1.18.0-all.jar' -OutFile $desktop
}
$expected = '36E20D7A18F655FB5829AE50AADD61217E2208536C0741DF5F7799300F758F56'
if ((Get-FileHash $desktop -Algorithm SHA256).Hash -ne $expected) { throw 'Unexpected Morphe Desktop download hash.' }
& .\gradlew.bat jar --console=plain
if ($LASTEXITCODE) { throw 'Kotlin build failed.' }
& "$buildTools\d8.bat" --release --min-api 26 --lib $androidJar --classpath $desktop --output build\dex build\libs\waze-maps-skin-2.0.0.jar
if ($LASTEXITCODE) { throw 'Android DEX build failed.' }
Copy-Item build\libs\waze-maps-skin-2.0.0.jar dist\waze-maps-skin-2.0.0.mpp
& "$Jdk\bin\jar.exe" uf dist\waze-maps-skin-2.0.0.mpp -C build\dex classes.dex
if ($LASTEXITCODE) { throw 'MPP packaging failed.' }
& "$Jdk\bin\java.exe" -jar $desktop list-patches --patches dist\waze-maps-skin-2.0.0.mpp -pv
if ($LASTEXITCODE) { throw 'Morphe could not load the bundle.' }
Write-Host "Built $PSScriptRoot\dist\waze-maps-skin-2.0.0.mpp"
