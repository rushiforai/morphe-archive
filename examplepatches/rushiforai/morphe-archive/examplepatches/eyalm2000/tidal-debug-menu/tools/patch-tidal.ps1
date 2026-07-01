param(
    [Parameter(Mandatory = $true)]
    [string]$ApkPath,

    [Parameter(Mandatory = $false)]
    [string]$OutputApkPath = "dist/tidal-patched.apk",

    [Parameter(Mandatory = $false)]
    [string]$PatchesBundlePath,

    [switch]$EnableExportPatch,
    [switch]$Force
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -Path $ApkPath)) {
    throw "APK not found: $ApkPath"
}

if ([string]::IsNullOrWhiteSpace($PatchesBundlePath)) {
    $latestBundle = Get-ChildItem "patches/build/libs" -Filter "patches-*.rvp" |
        Where-Object { $_.Name -notmatch "sources|javadoc" } |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1

    if ($null -eq $latestBundle) {
        throw "No .rvp bundle found in patches/build/libs. Build first: .\\gradlew.bat :patches:buildAndroid"
    }

    $PatchesBundlePath = $latestBundle.FullName
}

if (-not (Test-Path -Path $PatchesBundlePath)) {
    throw "Patch bundle not found: $PatchesBundlePath"
}

$outputDir = Split-Path -Parent $OutputApkPath
if (-not [string]::IsNullOrWhiteSpace($outputDir) -and -not (Test-Path -Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

$arguments = @("-jar", "revanced-cli.jar", "patch", "--patches=$PatchesBundlePath", "--out=$OutputApkPath", "--enable=Unlock Debug Menu")

if ($EnableExportPatch) {
    $arguments += "--enable=Export Debug Activity"
}

if ($Force) {
    $arguments += "--force"
}

$arguments += $ApkPath

Write-Host "Using bundle: $PatchesBundlePath"
Write-Host "Input APK:   $ApkPath"
Write-Host "Output APK:  $OutputApkPath"

& java @arguments

if ($LASTEXITCODE -ne 0) {
    throw "Patching failed with exit code $LASTEXITCODE"
}

Write-Host "Done. Patched APK: $OutputApkPath"
