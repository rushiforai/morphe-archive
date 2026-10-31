param(
    [Parameter(Mandatory)][string]$DesktopJar,
    [Parameter(Mandatory)][string]$BaselineBundle,
    [Parameter(Mandatory)][string]$OutputDirectory,
    [string]$JavaHome = 'C:\Program Files\Eclipse Adoptium\jdk-21.0.13.9-hotspot',
    [string]$AndroidSdk = "$env:LOCALAPPDATA\Android\Sdk",
    [string]$KotlinCompilerLib = "$env:USERPROFILE\.gradle\wrapper\dists\gradle-9.8.1-bin\a2l6ltp3k1vth6lwipzm5p2jp\gradle-9.8.1\lib"
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$DesktopJar = (Resolve-Path $DesktopJar).Path
$BaselineBundle = (Resolve-Path $BaselineBundle).Path
if (Test-Path $OutputDirectory) { throw 'Use a new output directory to avoid stale build files.' }
$out = (New-Item -ItemType Directory -Path $OutputDirectory).FullName
foreach ($directory in @('kotlin', 'java', 'patch-dex', 'extension-dex')) {
    New-Item -ItemType Directory -Path (Join-Path $out $directory) | Out-Null
}
$java = Join-Path $JavaHome 'bin\java.exe'
$jar = Join-Path $JavaHome 'bin\jar.exe'
$javac = Join-Path $JavaHome 'bin\javac.exe'
$androidJar = Join-Path $AndroidSdk 'platforms\android-35\android.jar'
$d8 = Join-Path $AndroidSdk 'build-tools\36.0.0\lib\d8.jar'
$baseline = [IO.Compression.ZipFile]::OpenRead($BaselineBundle)
try {
    foreach ($pair in @(@('classes.dex','baseline.dex'), @('extensions/extension.mpe','extension.dex'))) {
        [IO.Compression.ZipFileExtensions]::ExtractToFile($baseline.GetEntry($pair[0]), (Join-Path $out $pair[1]))
    }
} finally { $baseline.Dispose() }
& $java -cp "$KotlinCompilerLib\*" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -no-reflect -jvm-target 17 -module-name skisafari_local -classpath $DesktopJar -d "$out\kotlin" "$repo\patches\src\main\kotlin\lab\skisafari\patches\UnlockAllItemsPatch.kt"
if ($LASTEXITCODE -ne 0) { throw 'Kotlin compilation failed.' }
& $jar cf "$out\patch.jar" -C "$out\kotlin" .
if ($LASTEXITCODE -ne 0) { throw 'Kotlin JAR creation failed.' }
& $java -cp $d8 com.android.tools.r8.D8 --min-api 26 --output "$out\patch-dex" --lib $JavaHome --classpath $DesktopJar "$out\patch.jar" "$out\baseline.dex"
if ($LASTEXITCODE -ne 0) { throw 'Patch DEX compilation failed.' }
& $javac --release 8 -classpath $androidJar -d "$out\java" "$repo\extensions\extension\src\main\java\lab\skisafari\SkiSafariUnlock.java"
if ($LASTEXITCODE -ne 0) { throw 'Java extension compilation failed.' }
& $jar cf "$out\extension.jar" -C "$out\java" .
if ($LASTEXITCODE -ne 0) { throw 'Extension JAR creation failed.' }
& $java -cp $d8 com.android.tools.r8.D8 --min-api 26 --output "$out\extension-dex" --lib $androidJar "$out\extension.jar" "$out\extension.dex"
if ($LASTEXITCODE -ne 0) { throw 'Extension DEX compilation failed.' }
$bundle = Join-Path $out 'patches-skisafari-local.mpp'
Copy-Item -LiteralPath $BaselineBundle -Destination $bundle
$zip = [IO.Compression.ZipFile]::Open($bundle, [IO.Compression.ZipArchiveMode]::Update)
try {
    $files = @{
        'classes.dex' = "$out\patch-dex\classes.dex"
        'extensions/extension.mpe' = "$out\extension-dex\classes.dex"
        'skisafari/libskisafariunlock.so' = "$repo\patches\src\main\resources\skisafari\libskisafariunlock.so"
    }
    Get-ChildItem "$out\kotlin" -Recurse -File | ForEach-Object {
        $name = $_.FullName.Substring(("$out\kotlin").Length + 1).Replace('\', '/')
        if ($zip.GetEntry($name)) { throw "New class would replace existing entry: $name" }
        $files[$name] = $_.FullName
    }
    foreach ($name in $files.Keys) {
        $entry = $zip.GetEntry($name)
        if ($entry) { $entry.Delete() }
        [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $files[$name], $name) | Out-Null
    }
    $manifest = $zip.GetEntry('META-INF/MANIFEST.MF')
    $reader = [IO.StreamReader]::new($manifest.Open())
    $text = $reader.ReadToEnd(); $reader.Dispose(); $manifest.Delete()
    $text = $text -replace '(?m)^Version: [^\r\n]+', 'Version: 1.6.0-dev.16+skisafari.local'
    $writer = [IO.StreamWriter]::new($zip.CreateEntry('META-INF/MANIFEST.MF').Open(), [Text.UTF8Encoding]::new($false))
    $writer.Write($text); $writer.Dispose()
} finally { $zip.Dispose() }
Get-FileHash -LiteralPath $bundle -Algorithm SHA256
