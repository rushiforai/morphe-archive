[CmdletBinding()]
param(
    [string]$NdkPath = "C:\android\sdk\ndk\27.2.12479018",
    [string]$CmakePath = "C:\android\sdk\cmake\3.22.1\bin\cmake.exe",
    [string]$NinjaPath = "C:\android\sdk\cmake\3.22.1\bin\ninja.exe"
)

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
$jni = Join-Path $root "jni"
$resources = Join-Path (Split-Path $root -Parent) "..\patches\src\main\resources\native"
$toolchain = Join-Path $NdkPath "build\cmake\android.toolchain.cmake"

foreach ($path in @($toolchain, $CmakePath, $NinjaPath)) {
    if (-not (Test-Path -LiteralPath $path)) {
        throw "Required native build tool not found: $path"
    }
}

$targets = @(
    @{ Abi = "armeabi-v7a"; Build = "build-v7a" },
    @{ Abi = "arm64-v8a"; Build = "build-arm64" }
)

foreach ($target in $targets) {
    $abi = $target.Abi
    $buildDir = Join-Path $jni $target.Build
    $resourceDir = Join-Path $resources $abi

    & $CmakePath -S $jni -B $buildDir -G Ninja `
        "-DCMAKE_MAKE_PROGRAM=$NinjaPath" `
        "-DCMAKE_TOOLCHAIN_FILE=$toolchain" `
        "-DANDROID_ABI=$abi" `
        "-DANDROID_PLATFORM=android-23" `
        "-DCMAKE_BUILD_TYPE=Release"
    if ($LASTEXITCODE -ne 0) { throw "CMake configuration failed for $abi" }

    & $CmakePath --build $buildDir
    if ($LASTEXITCODE -ne 0) { throw "Native build failed for $abi" }

    New-Item -ItemType Directory -Path $resourceDir -Force | Out-Null
    Copy-Item -LiteralPath (Join-Path $buildDir "libpvhook.so") `
        -Destination (Join-Path $resourceDir "libpvhook.so") -Force

    $hash = (Get-FileHash -LiteralPath (Join-Path $resourceDir "libpvhook.so") -Algorithm SHA256).Hash
    Write-Host "${abi}: $hash"
}
