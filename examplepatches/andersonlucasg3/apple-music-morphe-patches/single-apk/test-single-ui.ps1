<#
.SYNOPSIS
    Runs the framework-free JVM tests of the single-APK UI.

.DESCRIPTION
    Compiles the pure-Java parser/normalisation classes with javac --release 8 and runs
    their main() on the local JVM; no Android device or emulator is needed.

    Covered:
      - UpdateAbisTest: ABI -> updater asset key (primary ABI only);
      - CatalogResolverTest: " - Single"/" - EP"/"(Deluxe)"/"[Remastered]" normalisation
        and the best-match pick used by Biblioteca, "Ver tudo" and Busca;
      - CatalogSearchTest: amp-api JSON for search/album/artist/playlist/tracks.

    The Android framework is only a compile/runtime classpath (android.jar); the real
    org.json implementation used by the tests is downloaded once from Maven Central into
    the output directory and checked against a pinned SHA-256. Nothing is added to the APK.

.EXAMPLE
    ./single-apk/test-single-ui.ps1
#>
[CmdletBinding()]
param(
    [string]$OutDir = "single-apk/out-one/test-ui",
    [string]$JsonJar = ""
)

$ErrorActionPreference = "Stop"
$repo = Split-Path -Parent $PSScriptRoot
$out = if ([IO.Path]::IsPathRooted($OutDir)) { $OutDir } else { Join-Path $repo $OutDir }
$srcRoot = Join-Path $PSScriptRoot "single-ui/src/main/java"
$testRoot = Join-Path $PSScriptRoot "single-ui/test"
$sep = [IO.Path]::PathSeparator

# --- Android platform (used only as the framework classpath) -------------------------
$sdk = $env:ANDROID_HOME
if (-not $sdk) { $sdk = $env:ANDROID_SDK_ROOT }
if (-not $sdk) { $sdk = Join-Path $env:LOCALAPPDATA "Android\Sdk" }
if (-not (Test-Path $sdk)) { throw "Android SDK not found (set ANDROID_HOME)" }
$platform = Join-Path $sdk "platforms/android-36"
if (-not (Test-Path $platform)) {
    $platform = Get-ChildItem (Join-Path $sdk "platforms") -Directory |
        Sort-Object { [int]($_.Name -replace "^android-", "") } -Descending |
        Select-Object -First 1 -ExpandProperty FullName
}
$androidJar = Join-Path $platform "android.jar"
if (-not (Test-Path $androidJar)) { throw "missing android.jar: $androidJar" }

# --- real org.json for the JVM (test-only dependency, never packaged) ---------------
$jsonUrl = "https://repo1.maven.org/maven2/org/json/json/20240303/json-20240303.jar"
$jsonSha256 = "3cf6cd6892e32e2b4c1c39e0f52f5248a2f5b37646fdfbb79a66b46b618414ed"
if (-not $JsonJar) {
    $JsonJar = Join-Path $PSScriptRoot "out-one/test-libs/json-20240303.jar"
}
$jsonPath = if ([IO.Path]::IsPathRooted($JsonJar)) { $JsonJar } else { Join-Path $repo $JsonJar }
if (-not (Test-Path $jsonPath)) {
    New-Item -ItemType Directory -Force (Split-Path -Parent $jsonPath) | Out-Null
    Write-Host "download : $jsonUrl"
    Invoke-WebRequest -UseBasicParsing -Uri $jsonUrl -OutFile $jsonPath
}
$actualSha = (Get-FileHash $jsonPath -Algorithm SHA256).Hash.ToLowerInvariant()
if ($actualSha -ne $jsonSha256) {
    throw "org.json SHA-256 mismatch: $actualSha (expected $jsonSha256)"
}

Remove-Item $out -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force $out | Out-Null

$sources = @(
    (Join-Path $srcRoot "com/anderson/applemusic/one/UpdateAbis.java"),
    (Join-Path $srcRoot "com/anderson/applemusic/one/media/CatalogResolver.java"),
    (Join-Path $srcRoot "com/anderson/applemusic/one/media/CatalogSearch.java"),
    (Join-Path $srcRoot "com/anderson/applemusic/one/media/MediaClient.java")
)
$tests = @(Get-ChildItem $testRoot -Recurse -Filter *.java | ForEach-Object { $_.FullName })
$classpath = "$androidJar$sep$jsonPath"

Write-Host "javac    : $($sources.Count) source(s) + $($tests.Count) test(s), --release 8"
& javac --release 8 -Xlint:-options -encoding UTF-8 -classpath $classpath -d $out `
    @sources @tests
if ($LASTEXITCODE -ne 0) { throw "javac failed with exit code $LASTEXITCODE" }

$runClasspath = "$out$sep$jsonPath$sep$androidJar"
$mains = @(
    "com.anderson.applemusic.one.UpdateAbisTest",
    "com.anderson.applemusic.one.media.CatalogResolverTest",
    "com.anderson.applemusic.one.media.CatalogSearchTest"
)
foreach ($main in $mains) {
    Write-Host "java     : $main"
    & java -cp $runClasspath $main
    if ($LASTEXITCODE -ne 0) { throw "$main failed with exit code $LASTEXITCODE" }
}
Write-Host "single-ui JVM tests: OK"
