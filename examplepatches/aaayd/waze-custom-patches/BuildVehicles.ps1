param([string]$AndroidSdk = "$env:LOCALAPPDATA\Android\Sdk", [string]$Jdk = 'C:\Program Files\Android\Android Studio\jbr')
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$env:JAVA_HOME = $Jdk
$desktop = Join-Path $PSScriptRoot 'tools\morphe-desktop.jar'
if ((Get-FileHash $desktop -Algorithm SHA256).Hash -ne '36E20D7A18F655FB5829AE50AADD61217E2208536C0741DF5F7799300F758F56') { throw 'Unexpected Morphe Desktop dependency.' }
$androidJar = "$AndroidSdk\platforms\android-36\android.jar"
$d8 = "$AndroidSdk\build-tools\36.0.0\d8.bat"
New-Item -ItemType Directory -Force build\vehicles-dex,build\vehicles-extension-classes,build\vehicles-extension-dex,build\vehicles-bundle\extensions,dist | Out-Null
& "$Jdk\bin\javac.exe" --release 11 -cp $androidJar -d build\vehicles-extension-classes vehicle-extension\src\local\wazemaps\vehicles\BundledVehicles.java
if ($LASTEXITCODE) { throw 'Vehicle extension compilation failed.' }
& "$Jdk\bin\jar.exe" cf build\vehicles-extension.jar -C build\vehicles-extension-classes .
if ($LASTEXITCODE) { throw 'Vehicle extension archive failed.' }
& $d8 --release --min-api 29 --lib $androidJar --output build\vehicles-extension-dex build\vehicles-extension.jar
if ($LASTEXITCODE) { throw 'Vehicle extension DEX failed.' }
Copy-Item build\vehicles-extension-dex\classes.dex build\vehicles-bundle\extensions\bundled-vehicles.dex
& .\gradlew.bat vehiclesJar --console=plain
if ($LASTEXITCODE) { throw 'Vehicle patch compilation failed.' }
& $d8 --release --min-api 26 --lib $androidJar --classpath $desktop --output build\vehicles-dex build\libs\waze-vehicle-models-1.0.0.jar
if ($LASTEXITCODE) { throw 'Vehicle patch DEX failed.' }
Copy-Item build\libs\waze-vehicle-models-1.0.0.jar dist\waze-vehicle-models-1.0.0.mpp
& "$Jdk\bin\jar.exe" uf dist\waze-vehicle-models-1.0.0.mpp -C build\vehicles-dex classes.dex -C build\vehicles-bundle extensions
if ($LASTEXITCODE) { throw 'Vehicle patch packaging failed.' }
& "$Jdk\bin\java.exe" -jar $desktop list-patches --patches dist\waze-vehicle-models-1.0.0.mpp -pv
if ($LASTEXITCODE) { throw 'Morphe could not load the vehicle patch.' }
