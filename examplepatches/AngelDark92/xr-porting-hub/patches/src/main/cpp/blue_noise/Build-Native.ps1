[CmdletBinding()]
param([string]$NdkDirectory, [string]$OutputDirectory, [switch]$InnerFadeVariant)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../../../../..')).Path
$steamlinkBuildRoot = [IO.Path]::GetFullPath((Join-Path $repo '../builds/steamlink-patches'))
if (!$NdkDirectory) { $NdkDirectory = Join-Path $repo '.android-sdk/ndk/27.2.12479018' }
# The 2.0.24/5002527 variant moves only the helper-owned uniform slots (16/17) so Valve's
# vInnerFade keeps its stock location 14. The default build must stay byte-identical to the
# tracked libgxd.so; the variant is a separate resource used only by that exact base. It is
# installed as lib/arm64-v8a/libgxd.so, so its soname must stay libgxd.so (DT_NEEDED match).
$resourceName = 'libgxd.so'
$variantDefines = @()
$defaultOutput = 'build/blue-noise-native'
if ($InnerFadeVariant) {
    $resourceName = 'libgxd-inner-fade.so'
    $variantDefines = @('-DSL_NOISE_LOCATION=16', '-DSL_ENABLE_LOCATION=17', '-DSL_MAX_HOST_LOCATION=15')
    $defaultOutput = 'build/blue-noise-native-inner-fade'
}
if (!$OutputDirectory) { $OutputDirectory = Join-Path $steamlinkBuildRoot $defaultOutput }
$bin = Join-Path $NdkDirectory 'toolchains/llvm/prebuilt/windows-x86_64/bin'
$null = New-Item -ItemType Directory -Force -Path $OutputDirectory
$library = Join-Path $OutputDirectory $resourceName
& (Join-Path $bin 'aarch64-linux-android29-clang++.cmd') -std=c++17 -O2 -fPIC -shared -fvisibility=hidden -static-libstdc++ -Wall -Wextra -Werror @variantDefines `
    (Join-Path $PSScriptRoot 'blue_noise.cpp') -o $library '-Wl,-soname,libgxd.so' '-Wl,-z,max-page-size=16384' '-Wl,--exclude-libs,ALL' '-Wl,--no-as-needed' -lGLESv3 -lEGL -ldl -llog
if ($LASTEXITCODE -ne 0) { throw 'Blue-noise native compilation failed.' }
& (Join-Path $bin 'llvm-strip.exe') --strip-unneeded $library
if ($LASTEXITCODE -ne 0) { throw 'Native strip failed.' }
$destination = Join-Path $repo ('patches/src/main/resources/steamlink/blue-noise/' + $resourceName)
$null = New-Item -ItemType Directory -Force -Path (Split-Path $destination)
Copy-Item -LiteralPath $library -Destination $destination
Get-FileHash -LiteralPath $destination -Algorithm SHA256
