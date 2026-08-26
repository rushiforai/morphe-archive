[CmdletBinding()]
param(
    [string]$SteamVrPath,
    [switch]$NoPause
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'

$ScriptFolder = $PSScriptRoot
$SourceRoot = Join-Path $ScriptFolder 'SteamLink-GalaxyXR-SteamVR-Resources'
$Succeeded = $false

function Test-IsAdministrator {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Resolve-SteamVrPath {
    param([string]$RequestedPath)

    $candidates = New-Object System.Collections.Generic.List[string]
    if (-not [string]::IsNullOrWhiteSpace($RequestedPath)) {
        $candidates.Add($RequestedPath)
    }

    try {
        $steam = (Get-ItemProperty -LiteralPath 'HKCU:\Software\Valve\Steam' -ErrorAction Stop).SteamPath
        if (-not [string]::IsNullOrWhiteSpace($steam)) {
            $candidates.Add((Join-Path $steam 'steamapps\common\SteamVR'))
        }
    }
    catch {}

    if (${env:ProgramFiles(x86)}) {
        $candidates.Add((Join-Path ${env:ProgramFiles(x86)} 'Steam\steamapps\common\SteamVR'))
    }
    if ($env:ProgramFiles) {
        $candidates.Add((Join-Path $env:ProgramFiles 'Steam\steamapps\common\SteamVR'))
    }

    foreach ($candidate in $candidates | Select-Object -Unique) {
        if ([string]::IsNullOrWhiteSpace($candidate)) { continue }
        $resolved = [IO.Path]::GetFullPath($candidate)
        if (Test-Path -LiteralPath (Join-Path $resolved 'drivers\vrlink\resources') -PathType Container) {
            return $resolved
        }
    }
    throw 'SteamVR with the VRLink driver was not found. Pass -SteamVrPath with the SteamVR folder.'
}

function Assert-SteamVrStopped {
    $names = @('vrserver', 'vrmonitor', 'vrcompositor', 'vrdashboard', 'vrwebhelper')
    $running = @(Get-Process -ErrorAction SilentlyContinue | Where-Object { $names -contains $_.ProcessName })
    if ($running.Count -gt 0) {
        throw ('Close SteamVR before installing the Galaxy XR resources. Running: ' + (($running.ProcessName | Sort-Object -Unique) -join ', '))
    }
}

try {
    if (-not (Test-IsAdministrator)) {
        $arguments = @('-NoLogo', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', ('"' + $PSCommandPath + '"'), '-NoPause')
        if (-not [string]::IsNullOrWhiteSpace($SteamVrPath)) {
            $arguments += @('-SteamVrPath', ('"' + $SteamVrPath + '"'))
        }
        Write-Host 'Administrator access is required to add resource files to SteamVR.' -ForegroundColor Cyan
        $elevated = Start-Process -FilePath 'powershell.exe' -ArgumentList $arguments -Verb RunAs -Wait -PassThru
        exit $elevated.ExitCode
    }

    if (-not (Test-Path -LiteralPath $SourceRoot -PathType Container)) {
        throw 'SteamLink-GalaxyXR-SteamVR-Resources was not found beside this installer.'
    }
    Assert-SteamVrStopped
    $resolvedSteamVr = Resolve-SteamVrPath -RequestedPath $SteamVrPath
    $targetRoot = Join-Path $resolvedSteamVr 'drivers\vrlink\resources'
    $sourceFiles = @(Get-ChildItem -LiteralPath $SourceRoot -Recurse -File)
    if ($sourceFiles.Count -eq 0) {
        throw 'The Galaxy XR resource bundle is empty.'
    }

    $stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $backupRoot = Join-Path $ScriptFolder ('SteamLink-GalaxyXR-SteamVR-Backup-' + $stamp)
    $backedUp = 0
    foreach ($source in $sourceFiles) {
        $relative = $source.FullName.Substring($SourceRoot.Length).TrimStart('\')
        $target = Join-Path $targetRoot $relative
        if (Test-Path -LiteralPath $target -PathType Leaf) {
            $backup = Join-Path $backupRoot $relative
            New-Item -ItemType Directory -Path (Split-Path -Parent $backup) -Force | Out-Null
            Copy-Item -LiteralPath $target -Destination $backup -Force
            $backedUp++
        }
        New-Item -ItemType Directory -Path (Split-Path -Parent $target) -Force | Out-Null
        Copy-Item -LiteralPath $source.FullName -Destination $target -Force
        $sourceHash = (Get-FileHash -LiteralPath $source.FullName -Algorithm SHA256).Hash
        $targetHash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
        if ($sourceHash -ne $targetHash) {
            throw ('Hash verification failed after copying: ' + $relative)
        }
    }

    Write-Host ''
    Write-Host ('Installed ' + $sourceFiles.Count + ' Galaxy XR resource files into:') -ForegroundColor Green
    Write-Host $targetRoot
    if ($backedUp -gt 0) {
        Write-Host ('Backed up ' + $backedUp + ' replaced file(s) to: ' + $backupRoot)
    }
    else {
        Write-Host 'No existing SteamVR files were replaced; only new named resources were added.'
    }
    Write-Host 'No SteamVR DLL or executable was modified.'
    Write-Warning 'A SteamVR update may remove these added files. Rerun this installer if Galaxy XR input profiles disappear.'
    $Succeeded = $true
}
catch {
    Write-Host ''
    Write-Host ('ERROR: ' + $_.Exception.Message) -ForegroundColor Red
}

if (-not $NoPause) {
    $null = Read-Host 'Press Enter to close'
}
if ($Succeeded) { exit 0 }
exit 1
