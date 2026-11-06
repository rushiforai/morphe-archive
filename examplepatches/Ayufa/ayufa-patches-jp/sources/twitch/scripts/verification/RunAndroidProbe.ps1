[CmdletBinding()]
param([Parameter(Mandatory)][string] $Source, [string[]] $SupportSource = @(), [string] $Bundle, [string] $Serial)
. "$PSScriptRoot/../common.ps1"
if (-not $Bundle) { $Bundle = Get-BundlePath }
$bundlePath = (Resolve-Path -LiteralPath $Bundle).Path
$sourcePath = (Resolve-Path -LiteralPath $Source).Path
$probeName = [IO.Path]::GetFileNameWithoutExtension($sourcePath)
if ($probeName -notmatch '^[A-Za-z][A-Za-z0-9_]*$') { throw 'Invalid Android probe class name.' }
$device = Resolve-Device $Serial
$adb = Get-AdbPath
$sdk = Get-AndroidSdk
$androidJar = Join-Path $sdk 'platforms/android-36/android.jar'
$d8 = Join-Path $sdk 'build-tools/36.0.0/lib/d8.jar'
$run = New-RunDirectory 'android-ui-probe'
$classes = Join-Path $run 'classes'
New-Item -ItemType Directory -Path $classes | Out-Null
$extensionClasses = Get-ProjectPath 'extensions/twitch/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes'
$sources = @($sourcePath) + @($SupportSource | ForEach-Object { (Resolve-Path -LiteralPath $_).Path })
& javac '-classpath' "$androidJar;$extensionClasses" '-d' $classes @sources
if ($LASTEXITCODE -ne 0) { throw 'Android probe compilation failed.' }
$classFiles = @(Get-ChildItem -LiteralPath $classes -Filter '*.class' | ForEach-Object FullName)
$probe = Join-Path $run 'probe.zip'
& java '-cp' $d8 'com.android.tools.r8.D8' '--min-api' '26' '--lib' $androidJar '--output' $probe @classFiles
if ($LASTEXITCODE -ne 0) { throw 'Android probe DEX compilation failed.' }
Add-Type -AssemblyName System.IO.Compression.FileSystem
$archive = [IO.Compression.ZipFile]::OpenRead($bundlePath)
$extension = Join-Path $run 'extension.dex'
try {
    $entry = $archive.GetEntry('extensions/twitch.mpe')
    if (-not $entry) { throw 'Twitch extension missing from bundle.' }
    [IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $extension)
} finally { $archive.Dispose() }
$remote = '/data/local/tmp/twitch-ui-probe-' + [guid]::NewGuid().ToString('N')
try {
    & $adb '-s' $device push $probe "$remote.zip"
    if ($LASTEXITCODE -ne 0) { throw 'Android probe transfer failed.' }
    & $adb '-s' $device push $extension "$remote.dex"
    if ($LASTEXITCODE -ne 0) { throw 'Android extension transfer failed.' }
    & $adb '-s' $device shell "CLASSPATH=$remote.zip`:$remote.dex app_process -Xmx64m /system/bin $probeName" 2>&1 |
        Tee-Object -FilePath (Join-Path $run 'result.log')
    if ($LASTEXITCODE -ne 0) { throw "Android UI regression failed. See $run." }
} finally {
    & $adb '-s' $device shell rm '-f' "$remote.zip" "$remote.dex" | Out-Null
}
Write-Host "Android UI regression artifacts: $run"
