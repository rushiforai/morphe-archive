[CmdletBinding()]
param(
    [string]$Compiler,
    [string]$AndroidNdk,
    [switch]$InnerFadeVariant
)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../../../../..')).Path
$steamlinkBuildRoot = [IO.Path]::GetFullPath((Join-Path $repo '../builds/steamlink-patches'))
if (-not $Compiler) { $Compiler = Join-Path $steamlinkBuildRoot 'build/tooling/zig/ziglang/zig.exe' }
if (-not $AndroidNdk) { $AndroidNdk = Join-Path $repo '.android-sdk/ndk/27.2.12479018' }
if (-not (Test-Path -LiteralPath $Compiler -PathType Leaf)) { throw "Missing host compiler: $Compiler" }
$headers = Join-Path $AndroidNdk 'toolchains/llvm/prebuilt/windows-x86_64/sysroot/usr/include'
$output = Join-Path $steamlinkBuildRoot 'build/blue-noise-native-tests'
$variantDefines = @()
if ($InnerFadeVariant) {
    # Same production source compiled with the 5002527 helper slots (16/17, host uniforms <= 15).
    $output = Join-Path $steamlinkBuildRoot 'build/blue-noise-native-tests-inner-fade'
    $variantDefines = @('-DSL_NOISE_LOCATION=16', '-DSL_ENABLE_LOCATION=17', '-DSL_MAX_HOST_LOCATION=15')
}
$include = Join-Path $output 'include'
New-Item -ItemType Directory -Force -Path $include | Out-Null
$savedZigLocalCache = $env:ZIG_LOCAL_CACHE_DIR
$savedZigGlobalCache = $env:ZIG_GLOBAL_CACHE_DIR
$env:ZIG_LOCAL_CACHE_DIR = Join-Path $output 'zig-cache'
$env:ZIG_GLOBAL_CACHE_DIR = Join-Path $steamlinkBuildRoot 'build/tooling/zig-global-cache'
try {
# Stage only platform-neutral Khronos headers; Android libc headers are not host headers.
foreach ($folder in @('EGL', 'GLES2', 'GLES3', 'KHR')) {
    Copy-Item -LiteralPath (Join-Path $headers $folder) -Destination $include -Recurse -Force
}
$executable = Join-Path $output 'blue-noise-native-tests.exe'
& $Compiler c++ -std=c++17 -O1 -Wall -Wextra -Werror -Wno-ignored-attributes `
    '-DEGL_NO_PLATFORM_SPECIFIC_TYPES' '-DGL_GLEXT_PROTOTYPES' @variantDefines `
    '-I' (Join-Path $PSScriptRoot 'tests/fakes') '-I' $include `
    (Join-Path $PSScriptRoot 'tests/native_tests.cpp') '-o' $executable
if ($LASTEXITCODE -ne 0) { throw "Native test compilation failed ($LASTEXITCODE)." }
& $executable
if ($LASTEXITCODE -ne 0) { throw "Native contract tests failed ($LASTEXITCODE)." }
} finally {
    $env:ZIG_LOCAL_CACHE_DIR = $savedZigLocalCache
    $env:ZIG_GLOBAL_CACHE_DIR = $savedZigGlobalCache
}
