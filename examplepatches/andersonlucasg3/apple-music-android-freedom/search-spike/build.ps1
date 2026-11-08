# Search spike build: aapt2 -> javac -> d8 -> zip dex -> zipalign -> apksigner.
# Signed with the Morphe cert so the APK joins android:sharedUserId="com.apple.android"
# (same UID as the engine), which is what lets it read the engine's shared_prefs.
$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$repo = Split-Path -Parent $here
$sdk  = Join-Path $env:LOCALAPPDATA 'Android\Sdk'
$bt   = Join-Path $sdk 'build-tools\36.0.0'
$jar  = Join-Path $sdk 'platforms\android-36\android.jar'
$jdk  = 'C:\Users\anderson\.jdks\jdk-21.0.11+10'
$env:JAVA_HOME = $jdk
$env:PATH = "$jdk\bin;$env:PATH"

$out = Join-Path $here 'out'
Remove-Item -Recurse -Force $out -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force (Join-Path $out 'classes'), (Join-Path $out 'dex') | Out-Null

$srcs = Get-ChildItem -Recurse -Filter *.java (Join-Path $here 'src') | ForEach-Object { $_.FullName }
Write-Host "== aapt2 link"
& "$bt\aapt2.exe" link -o (Join-Path $out 'base.apk') `
    --manifest (Join-Path $here 'AndroidManifest.xml') `
    -I $jar --min-sdk-version 29 --target-sdk-version 34
if ($LASTEXITCODE -ne 0) { throw "aapt2 link failed: $LASTEXITCODE" }

Write-Host "== javac ($($srcs.Count) files)"
& "$jdk\bin\javac.exe" -source 8 -target 8 -bootclasspath $jar -Xlint:-options `
    -d (Join-Path $out 'classes') $srcs
if ($LASTEXITCODE -ne 0) { throw "javac failed: $LASTEXITCODE" }

Write-Host "== d8"
$classes = Get-ChildItem -Recurse -Filter *.class (Join-Path $out 'classes') | ForEach-Object { $_.FullName }
& "$bt\d8.bat" --lib $jar --min-api 29 --output (Join-Path $out 'dex') $classes
if ($LASTEXITCODE -ne 0) { throw "d8 failed: $LASTEXITCODE" }

Write-Host "== add classes.dex to apk"
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::Open((Join-Path $out 'base.apk'), [System.IO.Compression.ZipArchiveMode]::Update)
try {
    $dex = $zip.GetEntry('classes.dex')
    if ($dex) { $dex.Delete() }
    [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, (Join-Path $out 'dex\classes.dex'), 'classes.dex', [System.IO.Compression.CompressionLevel]::Optimal) | Out-Null
} finally { $zip.Dispose() }

Write-Host "== zipalign"
& "$bt\zipalign.exe" -f 4 (Join-Path $out 'base.apk') (Join-Path $out 'aligned.apk')
if ($LASTEXITCODE -ne 0) { throw "zipalign failed: $LASTEXITCODE" }

$ks = Join-Path $repo '.companion\morphe.p12'
if (-not (Test-Path $ks)) { throw "missing $ks" }

Write-Host "== apksigner (morphe cert)"
& "$bt\apksigner.bat" sign --ks $ks --ks-pass pass:amcpass --key-pass pass:amcpass `
    --ks-key-alias Morphe --min-sdk-version 29 `
    --out (Join-Path $here 'search-spike.apk') (Join-Path $out 'aligned.apk')
if ($LASTEXITCODE -ne 0) { throw "apksigner failed: $LASTEXITCODE" }

& "$bt\apksigner.bat" verify --print-certs (Join-Path $here 'search-spike.apk') | Select-String 'SHA-256 digest|DN'
Write-Host "== OK -> $here\search-spike.apk"
