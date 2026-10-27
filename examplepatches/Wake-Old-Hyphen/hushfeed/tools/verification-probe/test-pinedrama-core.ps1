[CmdletBinding()]
param([string]$JavaHome = $env:JAVA_HOME, [string]$Sdk = $env:ANDROID_HOME)
$ErrorActionPreference = 'Stop'
if (-not $JavaHome) { $JavaHome = 'C:/Program Files/Android/Android Studio/jbr' }
if (-not $Sdk) { $Sdk = Join-Path $env:LOCALAPPDATA 'Android/Sdk' }
$java = Join-Path $JavaHome 'bin/java.exe'
$javac = Join-Path $JavaHome 'bin/javac.exe'
$platform = Get-ChildItem -LiteralPath (Join-Path $Sdk 'platforms') -Directory |
    Sort-Object { [int]($_.Name -replace '\D', '') } -Descending | Select-Object -First 1
$android = Join-Path $platform.FullName 'android.jar'
foreach ($file in @($java,$javac,$android)) { if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { throw "Missing PineDrama core contract input: $file" } }
$tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\','/')
$output = Join-Path $tempRoot ('hushfeed-pine-core-' + [guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($output)
try {
    $sources = @('src/app/hushfeed/verification/PineDramaCapabilities.java','src/app/hushfeed/verification/PineDramaCoreState.java',
        'src/app/hushfeed/verification/PineDramaInlineCoreState.java','src/app/hushfeed/verification/PineDramaCoreProbe.java',
        'tests/app/hushfeed/verification/PineDramaCoreStateContract.java','tests/app/hushfeed/verification/PineDramaInlineCoreStateContract.java') |
        ForEach-Object { Join-Path $PSScriptRoot $_ }
    & $javac -J-Xmx192m -J-XX:ActiveProcessorCount=2 --release 11 -encoding UTF-8 -cp $android -d $output @sources
    if ($LASTEXITCODE) { throw 'PineDrama core probe compilation failed.' }
    & $java -Xmx128m -XX:ActiveProcessorCount=2 -cp "$output;$android" app.hushfeed.verification.PineDramaCoreStateContract
    if ($LASTEXITCODE) { throw 'PineDrama core route contract failed.' }
    & $java -Xmx128m -XX:ActiveProcessorCount=2 -cp "$output;$android" app.hushfeed.verification.PineDramaInlineCoreStateContract
    if ($LASTEXITCODE) { throw 'PineDrama inline core route contract failed.' }
} finally {
    $absolute = [IO.Path]::GetFullPath($output)
    if (-not $absolute.StartsWith($tempRoot + [IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase) -or
            [IO.Path]::GetFileName($absolute) -cnotmatch '^hushfeed-pine-core-[a-f0-9]{32}$') { throw 'Owned PineDrama core cleanup guard failed.' }
    Remove-Item -LiteralPath $absolute -Recurse -Force
}
