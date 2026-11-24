param([string]$SdkPath=$env:ANDROID_HOME)
$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
$project=Split-Path -Parent $PSScriptRoot
if(!$SdkPath){$SdkPath=Join-Path $env:LOCALAPPDATA 'Android\Sdk'}
$aapt=Join-Path $SdkPath 'build-tools\36.0.0\aapt2.exe'
$android=Join-Path $SdkPath 'platforms\android-36\android.jar'
$assets=Join-Path $project 'patches\patches\src\main\resources\branding'
$scratch=Join-Path $project 'work\launcher-icons'
foreach($variant in @('light','dark')) {
    $task=Join-Path $scratch $variant
    $res=Join-Path $task 'res\drawable'
    New-Item -ItemType Directory -Force -Path $res | Out-Null
    Copy-Item -LiteralPath (Join-Path $assets "source\$variant.xml") -Destination (Join-Path $res 'ic_launcher_background.xml')
    $manifest=Join-Path $task 'AndroidManifest.xml'
    [IO.File]::WriteAllText($manifest,'<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="app.zonghome.icon"><uses-sdk android:minSdkVersion="21" android:targetSdkVersion="36" /><application android:icon="@drawable/ic_launcher_background" android:roundIcon="@drawable/ic_launcher_background" /></manifest>')
    $compiled=Join-Path $task 'compiled.zip'
    $apk=Join-Path $task 'icon.ap_'
    & $aapt compile --dir (Join-Path $task 'res') -o $compiled
    if($LASTEXITCODE -ne 0){throw "Icon compilation failed: $variant"}
    & $aapt link --no-auto-version -I $android --manifest $manifest -o $apk $compiled
    if($LASTEXITCODE -ne 0){throw "Icon linking failed: $variant"}
    $tree=(& $aapt dump xmltree --file res/drawable/ic_launcher_background.xml $apk) -join "`n"
    foreach($attribute in @('height(0x01010155)','width(0x01010159)','viewportWidth(0x01010402)','viewportHeight(0x01010403)','pathData(0x01010405)')) {
        if(!$tree.Contains($attribute)){throw "Incomplete linked icon $variant : missing $attribute"}
    }
    $zip=[IO.Compression.ZipFile]::OpenRead($apk)
    try {
        $entry=$zip.GetEntry('res/drawable/ic_launcher_background.xml')
        if(!$entry){throw "Linked icon resource missing: $variant"}
        $input=$entry.Open()
        $output=[IO.File]::Create((Join-Path $assets "launcher-$variant.xml"))
        try {$input.CopyTo($output)} finally {$input.Dispose();$output.Dispose()}
    } finally {$zip.Dispose()}
}
