param([string]$Jdk = 'C:\Program Files\Android\Android Studio\jbr', [string]$AndroidSdk = "$env:LOCALAPPDATA\Android\Sdk")
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$env:JAVA_HOME = $Jdk
$bt = Join-Path $AndroidSdk 'build-tools\36.0.0'
$platform = Join-Path $AndroidSdk 'platforms\android-36\android.jar'
$expected = @{
    'aidl.jar' = '584945C98F21B0C4E3CCDB74B51528F89852174C30BB2A4786C43A8CA456E496'
    'api.jar' = '4315FCD853F487321548BE5A997749FE43105FA29AAAA6F6E7A8CDC958A38357'
    'provider.jar' = '35AEE86B938CB8D06B315C9D73C30F41EC7CFDC10009A5DE83733BC5C4DB5051'
    'shared.jar' = '8557B8C715D374F8DA18E148CA5B971D1C7435E91447E6D4F7664403C7328760'
}
foreach ($name in $expected.Keys) { if ((Get-FileHash "lib/$name" -Algorithm SHA256).Hash -ne $expected[$name]) { throw "Unexpected dependency: $name" } }
New-Item -ItemType Directory -Force build/classes,build/dex,build/generated | Out-Null
& "$bt\aidl.exe" "-I$PSScriptRoot\src" "-o$PSScriptRoot\build\generated" "$PSScriptRoot\src\local\waze\aainstaller\IHandoffService.aidl"
if ($LASTEXITCODE) { throw 'AIDL failed' }
$sources = @(Get-ChildItem src,build/generated -Recurse -Filter *.java | ForEach-Object FullName)
$libraries = @(Get-ChildItem lib -Filter *.jar | ForEach-Object FullName)
$classpath = (@($platform) + $libraries) -join ';'
& "$Jdk\bin\javac.exe" --release 11 -cp $classpath -d build/classes @sources
if ($LASTEXITCODE) { throw 'Compilation failed' }
& "$Jdk\bin\jar.exe" cf build/classes.jar -C build/classes .
& "$bt\d8.bat" --release --min-api 30 --lib $platform --output build/dex build/classes.jar @libraries
if ($LASTEXITCODE) { throw 'DEX compilation failed' }
& "$bt\aapt2.exe" compile --dir res -o build/resources.zip
if ($LASTEXITCODE) { throw 'Resource compilation failed' }
& "$bt\aapt2.exe" link -I $platform --manifest AndroidManifest.xml -o build/base.apk build/resources.zip
if ($LASTEXITCODE) { throw 'APK linking failed' }
& "$Jdk\bin\jar.exe" uf build/base.apk -C build/dex classes.dex
& "$bt\zipalign.exe" -f -P 16 4 build/base.apk build/aligned.apk
if ($LASTEXITCODE) { throw 'Alignment failed' }
& "$bt\apksigner.bat" sign --ks "$env:USERPROFILE\.android\debug.keystore" --ks-key-alias androiddebugkey --ks-pass pass:android --out build/waze-aa-installer-1.0.0.apk build/aligned.apk
if ($LASTEXITCODE) { throw 'Signing failed' }
& "$bt\apksigner.bat" verify build/waze-aa-installer-1.0.0.apk
if ($LASTEXITCODE) { throw 'Signature verification failed' }
Copy-Item build/waze-aa-installer-1.0.0.apk ../../dist/waze-aa-installer-1.0.0.apk
Get-FileHash ../../dist/waze-aa-installer-1.0.0.apk -Algorithm SHA256
