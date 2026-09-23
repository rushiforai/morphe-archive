[CmdletBinding()]
param(
    [string]$NdkDirectory,
    [string]$OutputDirectory,
    [switch]$CopyResources
)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
if (!$NdkDirectory) { $NdkDirectory = Join-Path $repo '.android-sdk/ndk/27.2.12479018' }
if (!$OutputDirectory) { $OutputDirectory = Join-Path $repo 'build/decoder-buffering/native' }
$cmake = Join-Path $repo 'build/tooling/cmake/data/bin/cmake.exe'
$ninja = Join-Path $repo 'build/tooling/bin/ninja.exe'
$toolchain = Join-Path $NdkDirectory 'build/cmake/android.toolchain.cmake'
foreach ($required in @($cmake, $ninja, $toolchain)) {
    if (!(Test-Path -LiteralPath $required)) { throw "Missing build prerequisite: $required" }
}
& $cmake -S $PSScriptRoot -B $OutputDirectory -G Ninja `
    "-DCMAKE_MAKE_PROGRAM=$ninja" "-DCMAKE_TOOLCHAIN_FILE=$toolchain" `
    -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_STL=c++_static `
    -DCMAKE_BUILD_TYPE=Release
if ($LASTEXITCODE -ne 0) { throw 'Native CMake configuration failed' }
& $cmake --build $OutputDirectory
if ($LASTEXITCODE -ne 0) { throw 'Native build failed' }
$strip = Join-Path $NdkDirectory 'toolchains/llvm/prebuilt/windows-x86_64/bin/llvm-strip.exe'
foreach ($code in @('5002322', '5002363')) {
    $library = Join-Path $OutputDirectory "libgxr_dbuf_$code.so"
    & $strip --strip-unneeded $library
    if ($LASTEXITCODE -ne 0) { throw 'Native strip failed' }
    if ($CopyResources) {
        $resources = Join-Path $repo 'patches/src/main/resources/steamlink/decoder'
        $null = New-Item -ItemType Directory -Force -Path $resources
        # v1 resources intentionally stay byte-identical for the original modes.
        Copy-Item -LiteralPath $library -Destination (Join-Path $resources "libgxr_dbuf_${code}_telemetry.so")
    }
    Get-FileHash -LiteralPath $library -Algorithm SHA256
}
