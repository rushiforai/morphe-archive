<#
.SYNOPSIS
    A sorted, comparable inventory of what a Tumblr build talks to and reads about the device.

.DESCRIPTION
    scripts/AppInventory.java reads the APK's dex files and writes one "key = value" line per entry
    in six sections: the Retrofit endpoints with their verbs, the TAG_* startup tasks, the hosts the
    code names and the packages holding them, who opens connections, the third-party SDK packages,
    and who reads the advertising ID, the Android ID, the install referrer and the device
    identifiers. A package the shrinker renamed is written as ~, so a new build of the same code
    gives the same lines.

    -BaseApk inventories that build too and writes the difference: what each section gained, lost
    or changed. Nothing is patched, installed or run. Each JVM waits for a slot in the build queue
    BUILD_QUEUE_SCRIPT names, then runs below normal priority, or at idle with -Priority Idle.

    The inventories go in -OutDir (build/inventory by default) as <apk name>.inventory.txt, and the
    difference as <base>--<apk>.diff.txt. -Detail adds the real class and method names under each
    line, which the difference leaves out.

.EXAMPLE
    scripts/app-inventory.ps1 -Apk $env:HUSHTUMBLR_FIXTURE_DIR/tumblr-46.9.1.100-1460901100.apk
    scripts/app-inventory.ps1 -Apk new.apk -BaseApk old.apk -Priority Idle
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Apk,
    [string]$BaseApk,
    [string]$OutDir,
    [switch]$Detail,
    [string]$DesktopJar,
    [string]$Java,
    [ValidateSet('BelowNormal', 'Idle')][string]$Priority = 'BelowNormal'
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
$Java = Resolve-Java -Explicit $Java
# dexlib2 comes from the desktop CLI, as for DexDiff and HostReferences.
$DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $root -Required
if (-not $OutDir) { $OutDir = Join-Path $root 'build/inventory' }
$OutDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutDir)
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

function Invoke-AppInventory {
    <# One AppInventory.java run in its own queue slot. Returns its output lines; throws when it fails. #>
    param([Parameter(Mandatory = $true)][string[]]$Arguments, [Parameter(Mandatory = $true)][string]$Job)

    # A newer JDK warns on stderr, which Windows PowerShell turns into a terminating error under
    # Stop. The exit code is what gets judged.
    $ErrorActionPreference = 'Continue'
    $process = [System.Diagnostics.Process]::GetCurrentProcess()
    $priorityBefore = $process.PriorityClass
    $queued = Enter-HushTumblrQueue -Job $Job
    try {
        if ($Priority -eq 'Idle') { $process.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::Idle }
        $global:LASTEXITCODE = -1
        $output = @(& $Java '-Xmx6g' '-cp' $DesktopJar (Join-Path $PSScriptRoot 'AppInventory.java') @Arguments 2>&1 |
            ForEach-Object { "$_" })
        $exitCode = $LASTEXITCODE
    } finally {
        Exit-HushTumblrQueue $queued
        $process.PriorityClass = $priorityBefore
    }
    $output | ForEach-Object { Write-Host $_ }
    if ($exitCode -ne 0) { throw "AppInventory.java $($Arguments[0]) failed (exit $exitCode). Read its output above." }
}

function Get-InventoryPath([string]$Path) {
    $resolved = (Get-Item -LiteralPath $Path).FullName
    if ([IO.Path]::GetExtension($resolved) -ne '.apk') {
        throw "$resolved isn't an .apk. Inventory the universal APK, or the base.apk of a split bundle."
    }
    return [pscustomobject]@{
        Apk       = $resolved
        Inventory = Join-Path $OutDir ([IO.Path]::GetFileNameWithoutExtension($resolved) + '.inventory.txt')
    }
}

$target = Get-InventoryPath $Apk
$detailArgument = @(if ($Detail) { '--detail' })
Invoke-AppInventory -Job 'app inventory' -Arguments (@('inventory', $target.Apk, $target.Inventory) + $detailArgument)
Write-Host "[inventory] wrote $($target.Inventory)"
if ($BaseApk) {
    $base = Get-InventoryPath $BaseApk
    Invoke-AppInventory -Job 'app inventory' -Arguments (@('inventory', $base.Apk, $base.Inventory) + $detailArgument)
    $diff = Join-Path $OutDir ([IO.Path]::GetFileNameWithoutExtension($base.Apk) + '--' +
        [IO.Path]::GetFileNameWithoutExtension($target.Apk) + '.diff.txt')
    Invoke-AppInventory -Job 'app inventory diff' -Arguments @('diff', $base.Inventory, $target.Inventory, $diff)
    Write-Host "[inventory] wrote $diff"
}
