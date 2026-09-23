[CmdletBinding()]
param([string]$NdkDirectory, [string]$OutputDirectory)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../../../../..')).Path
if (!$NdkDirectory) { $NdkDirectory = Join-Path $repo '.android-sdk/ndk/27.2.12479018' }
if (!$OutputDirectory) { $OutputDirectory = Join-Path $repo 'build/blue-noise-native' }
$bin = Join-Path $NdkDirectory 'toolchains/llvm/prebuilt/windows-x86_64/bin'
$null = New-Item -ItemType Directory -Force -Path $OutputDirectory
$library = Join-Path $OutputDirectory 'libgxd.so'
& (Join-Path $bin 'aarch64-linux-android29-clang++.cmd') -std=c++17 -O2 -fPIC -shared -fvisibility=hidden -static-libstdc++ -Wall -Wextra -Werror `
    (Join-Path $PSScriptRoot 'blue_noise.cpp') -o $library '-Wl,-soname,libgxd.so' '-Wl,-z,max-page-size=16384' '-Wl,--exclude-libs,ALL' '-Wl,--no-as-needed' -lGLESv3 -lEGL -ldl -llog
if ($LASTEXITCODE -ne 0) { throw 'Blue-noise native compilation failed.' }
& (Join-Path $bin 'llvm-strip.exe') --strip-unneeded $library
if ($LASTEXITCODE -ne 0) { throw 'Native strip failed.' }
$destination = Join-Path $repo 'patches/src/main/resources/steamlink/blue-noise/libgxd.so'
$null = New-Item -ItemType Directory -Force -Path (Split-Path $destination)
Copy-Item -LiteralPath $library -Destination $destination
Get-FileHash -LiteralPath $destination -Algorithm SHA256
