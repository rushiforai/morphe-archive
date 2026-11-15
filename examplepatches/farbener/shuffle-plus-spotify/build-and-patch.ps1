# Builds the patch bundle and patches a Spotify APKM with it.
#   .\build-and-patch.ps1 -Apkm E:\ShufflePlus\apk\spotify-9.1.94.1929.apkm [-TapShuffles] [-RecentHours 24] [-Install]
# Needs: Android Studio (its Java 21), the morphe-desktop jar, and a gh login with read:packages.
param(
    [Parameter(Mandatory)] [string] $Apkm,
    [switch] $TapShuffles,
    [int] $RecentHours = 24,
    [switch] $Install,
    [string] $Java = "C:\Program Files\Android\Android Studio\jbr",
    [string] $MorpheJar = "$PSScriptRoot\..\tools\morphe-desktop-2.1.1-all.jar",
    [string] $Out = "$PSScriptRoot\..\out\spotify-shuffle.apk"
)
$ErrorActionPreference = "Stop"
$env:JAVA_HOME = $Java
$env:GITHUB_ACTOR = (gh api user -q .login)
$env:GITHUB_TOKEN = (gh auth token) # read:packages, for the Morphe registry; never written to disk

Push-Location $PSScriptRoot
.\gradlew.bat buildAndroid --no-daemon -q
Pop-Location

$bundle = Get-ChildItem "$PSScriptRoot\patches\build\libs\patches-*.mpp" -Exclude "*-sources.mpp", "*-javadoc.mpp" |
    Sort-Object LastWriteTime | Select-Object -Last 1
$patchArgs = @("-p", $bundle.FullName, "-e", "Shuffle+", "-O", "recentHours=$RecentHours")
if ($TapShuffles) { $patchArgs += @("-O", "tapShuffles=true") }
& "$Java\bin\java.exe" -jar $MorpheJar patch @patchArgs -o $Out -t "$PSScriptRoot\..\out\tmp" $Apkm
if ($LASTEXITCODE -ne 0) { throw "Patching failed" }

if ($Install) {
    $adb = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
    & $adb install -r $Out # same signing key as earlier builds, so the login stays
}
Write-Output "Patched APK: $Out"
