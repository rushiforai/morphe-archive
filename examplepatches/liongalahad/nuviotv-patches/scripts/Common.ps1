Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$script:RepoRoot = Split-Path -Parent $PSScriptRoot

function Get-RepoRoot { $script:RepoRoot }

function Initialize-NuvioEnvironment {
    $config = Get-Content (Join-Path $script:RepoRoot 'config\tools.json') -Raw | ConvertFrom-Json
    $env:JAVA_HOME = $config.android.studioJdk
    $env:ANDROID_HOME = $config.android.sdk
    $env:ANDROID_SDK_ROOT = $config.android.sdk

    $localGradlePlugin = Join-Path $script:RepoRoot ("tools\" + $config.morpheSources.gradlePlugin.directory)
    $localPatcher = Join-Path $script:RepoRoot ("tools\" + $config.morpheSources.patcher.directory)
    if (Test-Path (Join-Path $localGradlePlugin 'settings.gradle.kts')) {
        $env:MORPHE_GRADLE_PLUGIN_SRC = (Resolve-Path $localGradlePlugin).Path
    }
    if (Test-Path (Join-Path $localPatcher 'settings.gradle.kts')) {
        $env:MORPHE_PATCHER_SRC = (Resolve-Path $localPatcher).Path
    }

    $paths = @(
        (Join-Path $env:JAVA_HOME 'bin'),
        (Join-Path $env:ANDROID_HOME 'platform-tools'),
        (Join-Path $env:ANDROID_HOME 'emulator')
    )
    $env:PATH = ($paths + ($env:PATH -split ';') | Select-Object -Unique) -join ';'
    foreach ($required in @($env:JAVA_HOME, $env:ANDROID_HOME)) {
        if (-not (Test-Path $required)) { throw "Required path is missing: $required" }
    }
    $config
}

function Get-PatchManifest([Parameter(Mandatory)][string]$Patch) {
    $path = Join-Path $script:RepoRoot "testing\patches\$Patch\patch.json"
    if (-not (Test-Path $path)) { throw "Unknown patch '$Patch'. Expected $path" }
    Get-Content $path -Raw | ConvertFrom-Json
}

function Get-PatchManifestPath([Parameter(Mandatory)][string]$Patch) {
    Join-Path $script:RepoRoot "testing\patches\$Patch\patch.json"
}

function Get-MorpheJar {
    $config = Get-Content (Join-Path $script:RepoRoot 'config\tools.json') -Raw | ConvertFrom-Json
    $path = Join-Path $script:RepoRoot ("tools\" + $config.morpheDesktop.file)
    if (-not (Test-Path $path)) { throw "Morphe Desktop is missing. Run scripts\bootstrap.ps1 first." }
    $path
}

function Get-PatchBundle {
    $bundle = Get-ChildItem (Join-Path $script:RepoRoot 'patches\build\libs') -Filter '*.mpp' -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if (-not $bundle) { throw 'No .mpp bundle exists. Run scripts\build.ps1 first.' }
    $bundle.FullName
}

function New-PatchRunDirectory(
    [Parameter(Mandatory)][string]$Patch,
    [string]$Asset
) {
    $stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $suffix = if ($Asset) { "-$Asset" } else { '' }
    $path = Join-Path $script:RepoRoot "local\patches\$Patch\$stamp$suffix"
    New-Item -ItemType Directory -Force $path | Out-Null
    $path
}

function Get-Asset([Parameter(Mandatory)]$Manifest, [Parameter(Mandatory)][string]$Abi) {
    $asset = $Manifest.assets.PSObject.Properties[$Abi]
    if (-not $asset) { throw "No official asset is declared for ABI '$Abi'." }
    $asset.Value
}

function Assert-Sha256([Parameter(Mandatory)][string]$Path, [Parameter(Mandatory)][string]$Expected) {
    $actual = (Get-FileHash $Path -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actual -ne $Expected.ToLowerInvariant()) {
        throw "SHA-256 mismatch for $Path. Expected $Expected; got $actual"
    }
    $actual
}

function Get-TestKeystore {
    $keystore = Join-Path $script:RepoRoot 'local\keystore\nuviotv-test.jks'
    $credentials = Join-Path $script:RepoRoot 'local\keystore\credentials.json'
    if (-not (Test-Path $keystore) -or -not (Test-Path $credentials)) {
        throw 'Test keystore is missing. Run scripts\bootstrap.ps1 first.'
    }
    [pscustomobject]@{
        Path = $keystore
        Credentials = (Get-Content $credentials -Raw | ConvertFrom-Json)
    }
}

function Get-ConnectedAvdSerial([Parameter(Mandatory)][string]$AvdName) {
    foreach ($serial in (& adb devices | Select-String '^emulator-\d+\s+device' | ForEach-Object { ($_ -split '\s+')[0] })) {
        $name = (& adb -s $serial emu avd name 2>$null | Select-Object -First 1).Trim()
        if ($name -eq $AvdName) { return $serial }
    }
    $null
}

function Wait-ForAndroid([Parameter(Mandatory)][string]$Serial) {
    & adb -s $Serial wait-for-device | Out-Null
    $deadline = (Get-Date).AddMinutes(4)
    do {
        $booted = (& adb -s $Serial shell getprop sys.boot_completed 2>$null).Trim()
        if ($booted -eq '1') { return }
        Start-Sleep -Seconds 2
    } while ((Get-Date) -lt $deadline)
    throw "Android device $Serial did not finish booting."
}
