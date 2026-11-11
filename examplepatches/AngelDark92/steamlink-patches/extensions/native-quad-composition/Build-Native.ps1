[CmdletBinding()]
param([string]$NdkDirectory, [string]$OutputDirectory)
# Reproducible build of libgxr_quad_native.so. Output stays outside the repository.
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$buildRoot = [IO.Path]::GetFullPath((Join-Path $repo '../builds/steamlink-patches'))
if (!$NdkDirectory) { $NdkDirectory = 'F:/Runtimes/AndroidSdk/ndk/28.2.13676358' }
if (!$OutputDirectory) { $OutputDirectory = Join-Path $buildRoot 'extensions/native-quad-composition/build-android' }
$bin = Join-Path $NdkDirectory 'toolchains/llvm/prebuilt/windows-x86_64/bin'
New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
$out = Join-Path $OutputDirectory 'libgxr_quad_native.so'
$map = Join-Path $OutputDirectory 'exports.map'
Set-Content -LiteralPath $map -Value "{ global: gxr_sq_entry; local: *; };" -Encoding ascii
$src = Join-Path $PSScriptRoot 'src/gxr_sq.c'
# -ffp-contract=off keeps float operation order; -fexceptions keeps unwind tables so an
# exception thrown by the scene's operator new/length-error thrower propagates through
# this frame exactly as it did through the stock GetProjectionLayers frame.
& (Join-Path $bin 'clang.exe') --target=aarch64-linux-android29 -std=c11 -O2 -fPIC -shared -ffp-contract=off `
    -fno-math-errno -fno-vectorize -fno-slp-vectorize -fexceptions -fno-stack-protector -fvisibility=hidden -ffunction-sections -fdata-sections `
    -fno-asynchronous-unwind-tables -fno-ident -Wall -Wextra -Werror `
    "-ffile-prefix-map=$PSScriptRoot=." -Wno-unused-parameter `
    $src -o $out `
    '-Wl,-soname,libgxr_quad_native.so' '-Wl,-z,max-page-size=16384' '-Wl,-z,relro' '-Wl,-z,now' `
    '-Wl,-z,noexecstack' '-Wl,--gc-sections' '-Wl,--no-undefined' "-Wl,--version-script=$map" `
    '-Wl,--build-id=none' '-Wl,--hash-style=gnu' -lm -lc -ldl
if ($LASTEXITCODE -ne 0) { throw 'native quad helper compilation failed' }
& (Join-Path $bin 'llvm-strip.exe') --strip-unneeded --remove-section=.comment --remove-section=.note.android.ident $out
if ($LASTEXITCODE -ne 0) { throw 'native quad helper strip failed' }
Get-FileHash -LiteralPath $out -Algorithm SHA256 | Format-List
Write-Host 'Build output only. Stage the validated helper and update the Kotlin SHA pin before packaging.'
