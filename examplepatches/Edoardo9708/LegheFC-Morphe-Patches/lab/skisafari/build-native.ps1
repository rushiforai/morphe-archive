$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$source = Join-Path $repoRoot 'patches\src\main\resources\skisafari\native\skisafariunlock.c'
$output = Join-Path $repoRoot 'patches\src\main\resources\skisafari\libskisafariunlock.so'

$sdk = $env:ANDROID_SDK_ROOT
if ([string]::IsNullOrWhiteSpace($sdk)) { $sdk = $env:ANDROID_HOME }
if ([string]::IsNullOrWhiteSpace($sdk)) { $sdk = Join-Path $env:LOCALAPPDATA 'Android\Sdk' }

$ndk = $env:ANDROID_NDK_HOME
if ([string]::IsNullOrWhiteSpace($ndk)) { $ndk = $env:ANDROID_NDK_ROOT }
if ([string]::IsNullOrWhiteSpace($ndk)) {
    $ndkRoot = Join-Path $sdk 'ndk'
    $ndk = Get-ChildItem -LiteralPath $ndkRoot -Directory |
        Sort-Object { [version]$_.Name } -Descending |
        Select-Object -First 1 -ExpandProperty FullName
}
if (-not $ndk -or -not (Test-Path -LiteralPath $ndk)) { throw 'Android NDK non trovato.' }

$toolchain = Join-Path $ndk 'toolchains\llvm\prebuilt\windows-x86_64\bin'
$clang = Join-Path $toolchain 'aarch64-linux-android26-clang.cmd'
$readelf = Join-Path $toolchain 'llvm-readelf.exe'
if (-not (Test-Path -LiteralPath $clang)) { throw "Compiler ARM64 non trovato: $clang" }

New-Item -ItemType Directory -Path (Split-Path -Parent $output) -Force | Out-Null
& $clang -shared -fPIC -O2 -fvisibility=hidden -Wall -Wextra -Werror `
    $source -o $output -llog -ldl '-Wl,--build-id=none'
if ($LASTEXITCODE -ne 0) { throw 'Compilazione della libreria Ski Safari Unlock fallita.' }

$header = & $readelf -h $output
$headerExitCode = $LASTEXITCODE
$headerText = $header -join "`n"
if ($headerExitCode -ne 0 -or $headerText -notmatch '(?m)^\s*Machine:\s+AArch64\s*$') {
    throw 'La libreria risultante non e'' un ELF AArch64 valido.'
}
$symbols = & $readelf --dyn-syms $output
$symbolExitCode = $LASTEXITCODE
$symbolText = $symbols -join "`n"
if ($symbolExitCode -ne 0 -or $symbolText -notmatch 'Java_lab_skisafari_SkiSafariUnlock_tryUnlock') {
    throw 'La funzione JNI tryUnlock non e'' esportata.'
}

Get-FileHash -LiteralPath $output -Algorithm SHA256
