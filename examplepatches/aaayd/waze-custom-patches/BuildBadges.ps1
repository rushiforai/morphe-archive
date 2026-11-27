param([string]$AndroidSdk = "$env:LOCALAPPDATA\Android\Sdk", [string]$Jdk = 'C:\Program Files\Android\Android Studio\jbr')
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$env:JAVA_HOME = $Jdk
$desktop = Join-Path $PSScriptRoot 'tools\morphe-desktop.jar'
if ((Get-FileHash $desktop -Algorithm SHA256).Hash -ne '36E20D7A18F655FB5829AE50AADD61217E2208536C0741DF5F7799300F758F56') { throw 'Unexpected Morphe Desktop dependency.' }
$androidJar = "$AndroidSdk\platforms\android-36\android.jar"
$d8 = "$AndroidSdk\build-tools\36.0.0\d8.bat"
New-Item -ItemType Directory -Force build\badges-dex,build\badges-extension-classes,build\badges-extension-dex,build\badges-bundle\extensions,dist | Out-Null
& "$Jdk\bin\javac.exe" --release 11 -cp $androidJar -d build\badges-extension-classes badge-extension\src\local\wazemaps\badges\BadgeSelector.java
if ($LASTEXITCODE) { throw 'Badge extension compilation failed.' }
& "$Jdk\bin\jar.exe" cf build\badges-extension.jar -C build\badges-extension-classes .
if ($LASTEXITCODE) { throw 'Badge extension archive failed.' }
& $d8 --release --min-api 29 --lib $androidJar --output build\badges-extension-dex build\badges-extension.jar
if ($LASTEXITCODE) { throw 'Badge extension DEX failed.' }
Copy-Item build\badges-extension-dex\classes.dex build\badges-bundle\extensions\badge-selector.dex
& .\gradlew.bat badgesJar --console=plain
if ($LASTEXITCODE) { throw 'Badge patch compilation failed.' }
& $d8 --release --min-api 26 --lib $androidJar --classpath $desktop --output build\badges-dex build\libs\waze-badge-selector-1.0.0.jar
if ($LASTEXITCODE) { throw 'Badge patch DEX failed.' }
Copy-Item build\libs\waze-badge-selector-1.0.0.jar dist\waze-badge-selector-1.0.0.mpp
& "$Jdk\bin\jar.exe" uf dist\waze-badge-selector-1.0.0.mpp -C build\badges-dex classes.dex -C build\badges-bundle extensions
if ($LASTEXITCODE) { throw 'Badge patch packaging failed.' }
& "$Jdk\bin\java.exe" -jar $desktop list-patches --patches dist\waze-badge-selector-1.0.0.mpp -pv
if ($LASTEXITCODE) { throw 'Morphe could not load the badge patch.' }
