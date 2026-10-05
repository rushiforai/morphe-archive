[CmdletBinding()]
param([string]$NdkDirectory, [string]$OpenXrDirectory, [string]$OutputDirectory)
$ErrorActionPreference = 'Stop'
$fcRepo = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
if (!$NdkDirectory) { $NdkDirectory = Join-Path $fcRepo '.android-sdk/ndk/27.2.12479018' }
if (!$OpenXrDirectory) { $OpenXrDirectory = Join-Path $fcRepo 'extensions/controller-velocity-layer/build-android/_deps/openxr_headers-src' }
if (!$OutputDirectory) { $OutputDirectory = Join-Path $fcRepo 'build/foveal-canvas-work/native-direct' }
$fcBin = Join-Path $NdkDirectory 'toolchains/llvm/prebuilt/windows-x86_64/bin'
New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
$fcLibrary = Join-Path $OutputDirectory 'libgxr_foveal_canvas.so'
& (Join-Path $fcBin 'aarch64-linux-android29-clang++.cmd') -std=c++17 -O2 -fPIC -shared -fvisibility=hidden -static-libstdc++ -Wall -Wextra -Werror -Wno-missing-field-initializers `
    -DXR_USE_PLATFORM_ANDROID -DXR_USE_GRAPHICS_API_OPENGL_ES "-I$OpenXrDirectory/include" `
    (Join-Path $PSScriptRoot 'src/foveal_canvas_layer.cpp') -o $fcLibrary `
    '-Wl,-soname,libgxr_foveal_canvas.so' '-Wl,-z,max-page-size=16384' '-Wl,--exclude-libs,ALL' -lGLESv3 -lEGL -llog
if ($LASTEXITCODE -ne 0) { throw 'Foveal canvas Android compilation failed' }
& (Join-Path $fcBin 'llvm-strip.exe') --strip-unneeded $fcLibrary
if ($LASTEXITCODE -ne 0) { throw 'Foveal canvas strip failed' }
Get-FileHash -LiteralPath $fcLibrary -Algorithm SHA256
Write-Host 'Build output only. Stage the validated helper and update its Kotlin SHA pin before packaging.'
