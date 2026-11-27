param([string]$AndroidSdk = "$env:LOCALAPPDATA\Android\Sdk", [string]$Jdk = 'C:\Program Files\Android\Android Studio\jbr', [string]$WazeVersion = '5.26.0.0', [string]$BundleVersion = '1.16.0')
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if ($WazeVersion -notmatch '^\d+(\.\d+){3}$' -or $BundleVersion -notmatch '^\d+(\.\d+){2}$') { throw 'Invalid Waze or bundle version.' }
$env:JAVA_HOME = $Jdk
$desktop = Join-Path $PSScriptRoot 'tools\morphe-desktop.jar'
if ((Get-FileHash $desktop -Algorithm SHA256).Hash -ne '36E20D7A18F655FB5829AE50AADD61217E2208536C0741DF5F7799300F758F56') { throw 'Unexpected Morphe Desktop dependency.' }
$androidJar = "$AndroidSdk\platforms\android-36\android.jar"
$d8 = "$AndroidSdk\build-tools\36.0.0\d8.bat"
New-Item -ItemType Directory -Force build\themes-dex,build\themes-extension-classes,build\themes-extension-dex,build\themes-bundle\extensions,build\themes-bundle\installer,dist | Out-Null
if ((Get-FileHash dist\waze-aa-installer-1.0.0.apk -Algorithm SHA256).Hash -ne 'E5D442454418EFD4FF438B3ED3F6BFA5A3AEE78F52616625CB25CE0EC8855B48') { throw 'Unexpected companion installer APK.' }
Copy-Item dist\waze-aa-installer-1.0.0.apk build\themes-bundle\installer\waze-aa-installer.apk
$extensionBuildRoot = Join-Path $PSScriptRoot ('build\extensions-' + [guid]::NewGuid().ToString('N'))
foreach ($extension in @(
    @{ Source = 'theme-extension'; Dex = 'theme-selector.dex' },
    @{ Source = 'badge-extension'; Dex = 'badge-selector.dex' },
    @{ Source = 'aa-extension'; Dex = 'aa-installer.dex' },
    @{ Source = 'icon-extension'; Dex = 'icon-pack.dex' },
    @{ Source = 'alert-extension'; Dex = 'alert-distance.dex' },
    @{ Source = 'camera-extension'; Dex = 'camera-sound.dex' }
)) {
    $extensionDir = Join-Path $extensionBuildRoot $extension.Source
    $classes = Join-Path $extensionDir 'classes'
    $dex = Join-Path $extensionDir 'dex'
    $archive = Join-Path $extensionDir 'extension.jar'
    New-Item -ItemType Directory -Force $classes,$dex | Out-Null
    $sources = @(Get-ChildItem -LiteralPath (Join-Path $extension.Source 'src') -Filter '*.java' -Recurse | ForEach-Object { $_.FullName })
    & "$Jdk\bin\javac.exe" --release 11 -cp $androidJar -d $classes @sources
    if ($LASTEXITCODE) { throw "Extension compilation failed: $($extension.Source)" }
    & "$Jdk\bin\jar.exe" cf $archive -C $classes .
    if ($LASTEXITCODE) { throw 'Extension archive failed.' }
    & $d8 --release --min-api 29 --lib $androidJar --output $dex $archive
    if ($LASTEXITCODE) { throw 'Extension DEX failed.' }
    Copy-Item (Join-Path $dex 'classes.dex') (Join-Path 'build\themes-bundle\extensions' $extension.Dex)
}
$fixtures = Get-Content ci/compatibility_fixtures.json -Raw | ConvertFrom-Json
$fixtureVersions = @($fixtures | Where-Object { -not $_.unsupported_patches } | ForEach-Object { $_.version })
foreach ($nativeVersion in (@($WazeVersion) + $fixtureVersions | Select-Object -Unique)) {
    python ci/native_icons.py --input "downloads/waze-$nativeVersion-original-arm64.apkm" --resource-root build/generated/native-icons --report "build/native-local-$nativeVersion.json"
    if ($LASTEXITCODE) { throw "Native icon discovery failed: $nativeVersion" }
}
& .\gradlew.bat themesJar --console=plain "-PwazeVersion=$WazeVersion" "-PbundleVersion=$BundleVersion"
if ($LASTEXITCODE) { throw 'Theme patch compilation failed.' }
& $d8 --release --min-api 26 --lib $androidJar --classpath $desktop --output build\themes-dex "build\libs\waze-theme-selector-$BundleVersion.jar"
if ($LASTEXITCODE) { throw 'Theme patch DEX failed.' }
Copy-Item "build\libs\waze-theme-selector-$BundleVersion.jar" "dist\waze-theme-selector-$BundleVersion.mpp"
& "$Jdk\bin\jar.exe" uf "dist\waze-theme-selector-$BundleVersion.mpp" -C build\themes-dex classes.dex -C build\themes-bundle extensions -C build\themes-bundle installer
if ($LASTEXITCODE) { throw 'Theme patch packaging failed.' }
& "$Jdk\bin\java.exe" -jar $desktop list-patches --patches "dist\waze-theme-selector-$BundleVersion.mpp" -pv
if ($LASTEXITCODE) { throw 'Morphe could not load the theme patch.' }
