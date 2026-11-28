param(
    [string]$NdkPath,
    [int]$ApiLevel = 21
)

$ErrorActionPreference = 'Stop'

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SourcePath = Join-Path $ScriptDir 'libhdr10fix.c'
$MapPath = Join-Path $ScriptDir 'hdr10fix.map'
$BuildDir = Join-Path $ScriptDir 'build'
$OutputPath = Join-Path $BuildDir 'libhdr10fix.so'
$KnownGoodSha256 = '357c95a8f7d7d21675f65fbbec86c0648c278c6b1fcf577cb611aa5e2fcad120'

function Find-NdkPath {
    param([string]$ExplicitPath)

    if ($ExplicitPath) {
        return (Resolve-Path $ExplicitPath).Path
    }

    foreach ($candidate in @($env:ANDROID_NDK_HOME, $env:ANDROID_NDK_ROOT)) {
        if ($candidate -and (Test-Path $candidate)) {
            return (Resolve-Path $candidate).Path
        }
    }

    $sdkRoots = @(
        $env:ANDROID_HOME,
        $env:ANDROID_SDK_ROOT,
        'C:\Android\Sdk',
        (Join-Path $env:LOCALAPPDATA 'Android\Sdk')
    ) | Where-Object { $_ -and (Test-Path $_) } | Select-Object -Unique

    foreach ($sdkRoot in $sdkRoots) {
        $ndkRoot = Join-Path $sdkRoot 'ndk'
        if (Test-Path $ndkRoot) {
            $installed = Get-ChildItem -Path $ndkRoot -Directory | Sort-Object Name -Descending
            foreach ($dir in $installed) {
                $clang = Join-Path $dir.FullName 'toolchains\llvm\prebuilt\windows-x86_64\bin\clang.exe'
                if (Test-Path $clang) {
                    return $dir.FullName
                }
            }
        }
    }

    throw @'
Android NDK not found.

Install an NDK with sdkmanager, or rerun this script with -NdkPath.
Example:
  C:\Android\Sdk\cmdline-tools\latest\bin\sdkmanager.bat --list
  C:\Android\Sdk\cmdline-tools\latest\bin\sdkmanager.bat "ndk;<version>"
  .\build.ps1 -NdkPath C:\Android\Sdk\ndk\<version>
'@
}

$NdkPath = Find-NdkPath $NdkPath
$Clang = Join-Path $NdkPath 'toolchains\llvm\prebuilt\windows-x86_64\bin\clang.exe'

if (-not (Test-Path $Clang)) {
    throw "Android NDK clang was not found at: $Clang"
}

New-Item -ItemType Directory -Force -Path $BuildDir | Out-Null

$Target = "aarch64-linux-android$ApiLevel"
$CompilerArgs = @(
    "--target=$Target",
    '-fuse-ld=lld',
    '-fPIC',
    '-O2',
    '-fvisibility=hidden',
    '-ffreestanding',
    '-fno-stack-protector',
    '-fno-builtin',
    '-shared',
    '-nostdlib',
    '-Wl,-soname,libhdr10fix.so',
    '-Wl,--build-id=sha1',
    '-Wl,--unresolved-symbols=ignore-all',
    "-Wl,--version-script=$MapPath",
    '-o',
    $OutputPath,
    $SourcePath
)

Write-Host "NDK:    $NdkPath"
Write-Host "Target: $Target"
Write-Host "Output: $OutputPath"

& $Clang @CompilerArgs
if ($LASTEXITCODE -ne 0) {
    throw "clang failed with exit code $LASTEXITCODE"
}

$Hash = (Get-FileHash -Algorithm SHA256 $OutputPath).Hash.ToLowerInvariant()
$Size = (Get-Item $OutputPath).Length

Write-Host ""
Write-Host "Built libhdr10fix.so"
Write-Host "Size:   $Size bytes"
Write-Host "SHA256: $Hash"
Write-Host ""

if ($Hash -eq $KnownGoodSha256) {
    Write-Host 'The rebuild is byte-identical to the known-good tested binary.'
} else {
    Write-Warning "The rebuild is not byte-identical to the known-good tested binary ($KnownGoodSha256). This can be normal when using a different NDK/Clang/LLD version. Do not replace the bundled Morphe binary solely because this build succeeded."
}
