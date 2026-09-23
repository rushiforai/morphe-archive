[CmdletBinding()]
param(
    [string]$Compiler,
    [string]$AndroidNdk
)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../../../../..')).Path
if (-not $Compiler) { $Compiler = Join-Path $repo 'build/tooling/zig/ziglang/zig.exe' }
if (-not $AndroidNdk) { $AndroidNdk = Join-Path $repo '.android-sdk/ndk/27.2.12479018' }
if (-not (Test-Path -LiteralPath $Compiler -PathType Leaf)) { throw "Missing host compiler: $Compiler" }
$headers = Join-Path $AndroidNdk 'toolchains/llvm/prebuilt/windows-x86_64/sysroot/usr/include'
$output = Join-Path $repo 'build/blue-noise-native-tests'
$include = Join-Path $output 'include'
New-Item -ItemType Directory -Force -Path $include | Out-Null
# Stage only platform-neutral Khronos headers; Android libc headers are not host headers.
foreach ($folder in @('EGL', 'GLES2', 'GLES3', 'KHR')) {
    Copy-Item -LiteralPath (Join-Path $headers $folder) -Destination $include -Recurse -Force
}
$executable = Join-Path $output 'blue-noise-native-tests.exe'
& $Compiler c++ -std=c++17 -O1 -Wall -Wextra -Werror -Wno-ignored-attributes `
    '-DEGL_NO_PLATFORM_SPECIFIC_TYPES' '-DGL_GLEXT_PROTOTYPES' `
    '-I' (Join-Path $PSScriptRoot 'tests/fakes') '-I' $include `
    (Join-Path $PSScriptRoot 'tests/native_tests.cpp') '-o' $executable
if ($LASTEXITCODE -ne 0) { throw "Native test compilation failed ($LASTEXITCODE)." }
& $executable
if ($LASTEXITCODE -ne 0) { throw "Native contract tests failed ($LASTEXITCODE)." }
