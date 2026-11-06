Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$script:ProjectRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))

function Get-ProjectPath([string] $RelativePath) {
    return Join-Path $script:ProjectRoot $RelativePath
}

function Get-AndroidSdk {
    $candidates = @($env:ANDROID_HOME, $env:ANDROID_SDK_ROOT,
        (Join-Path $env:LOCALAPPDATA 'Android/Sdk'))
    foreach ($candidate in $candidates) {
        if ($candidate -and (Test-Path -LiteralPath $candidate -PathType Container)) {
            return [IO.Path]::GetFullPath($candidate)
        }
    }
    throw 'Android SDK not found. Set ANDROID_HOME to the installed SDK directory.'
}

function Get-AdbPath {
    $path = Join-Path (Get-AndroidSdk) 'platform-tools/adb.exe'
    if (-not (Test-Path -LiteralPath $path)) { throw 'Install Android SDK Platform-Tools.' }
    return $path
}

function Get-MorphePath {
    $config = Get-Content -Raw (Get-ProjectPath 'config/toolchain.json') | ConvertFrom-Json
    $path = Get-ProjectPath ".local/tools/$($config.morpheDesktop.file)"
    if (-not (Test-Path -LiteralPath $path)) { throw 'Run scripts/bootstrap-tools.ps1 first.' }
    $actual = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actual -ne $config.morpheDesktop.sha256) { throw 'Morphe Desktop SHA-256 mismatch.' }
    return $path
}

function Get-BundlePath {
    $versionLine = Get-Content (Get-ProjectPath 'gradle.properties') |
        Where-Object { $_ -match '^version\s*=' }
    if (@($versionLine).Count -ne 1) { throw 'Expected one public Gradle version property.' }
    $version = ($versionLine -split '=', 2)[1].Trim()
    $path = Get-ProjectPath "patches/build/libs/patches-$version.mpp"
    if (-not (Test-Path -LiteralPath $path)) { throw 'Bundle missing. Run scripts/build.ps1.' }
    return $path
}

function Resolve-Device([string] $Serial) {
    $adb = Get-AdbPath
    $lines = & $adb devices
    if ($LASTEXITCODE -ne 0) { throw 'ADB device listing failed.' }
    $devices = @($lines | ForEach-Object {
        if ($_ -match '^(\S+)\s+device$') { $Matches[1] }
    })
    if ($Serial) {
        if ($Serial -notin $devices) { throw 'Requested device is absent or unauthorized.' }
        return $Serial
    }
    if ($devices.Count -ne 1) { throw 'Connect one authorized device or pass -Serial explicitly.' }
    return $devices[0]
}

function New-RunDirectory([string] $Purpose) {
    $name = '{0}-{1}-{2}' -f (Get-Date -Format 'yyyyMMdd-HHmmss'), $Purpose,
        ([guid]::NewGuid().ToString('N').Substring(0, 8))
    $path = Get-ProjectPath ".local/runs/$name"
    New-Item -ItemType Directory -Path $path -Force | Out-Null
    return $path
}
