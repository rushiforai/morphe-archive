<#
.SYNOPSIS
    Writes a Telegram build's name table, patches/src/main/resources/hushtelegram/names/<versionCode>.txt.

.DESCRIPTION
    Since 13.2, R8 renames org.telegram.messenger's classes and members, so the patches name their
    targets as the last named build (13.1.1) did and look the build's own names up in a table.
    NameTable.java matches the build against that named one and writes the classes, methods and
    fields it trusts, then the resource ids of every resource name the -NamesFrom table holds.

    Run it again on a build that has a table and every # block below the generated rows (the
    gap-fill and the hand-added rows) stays as it is. A kept row replaces any generated row that
    names the same member in either build, so a correction made by hand survives the rerun. A kept
    class row that overrules the match also drops the member rows matched through the wrong pair,
    so add hand rows for the members of that class the patches use.
    A new build starts with no kept rows. The matcher only pairs classes that stay in
    org.telegram.messenger, so write the previous table's gap-fill and hand rows again with the
    new build's names, add them under the generated rows, then run the script again.

    The matcher holds both builds' dex in memory and takes several minutes.

.PARAMETER Apk
    The build to name: an .apk, or an .apkm, .apks or .xapk bundle, which is merged first.

.PARAMETER Named
    Telegram 13.1.1 in the same flavor: the web build (72379) for a web table, the Play build
    (72371) for a Play table. Both still carry the source names.

.PARAMETER Out
    The table to write. Defaults to names/<versionCode>.txt.

.PARAMETER NamesFrom
    The table whose resource names to look up in the build. Defaults to -Out when it exists, and
    otherwise to the table with the highest version code.

.PARAMETER Heap
    The matcher's Java heap cap. 6g is comfortable for 13.2; lower it on a machine with less memory.

.EXAMPLE
    scripts/name-table.ps1 -Apk fixtures/telegram-web-13.2.2-73039.apk -Named C:\apks\telegram-web-13.1.1-72379.apk -DesktopJar C:\tools\morphe-desktop-all.jar
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Apk,
    [Parameter(Mandatory = $true)][string]$Named,
    [string]$Out,
    [string]$NamesFrom,
    [ValidatePattern('^\d+[mMgG]$')][string]$Heap = '6g',
    [string]$Java,
    [string]$DesktopJar,
    [string]$Aapt2
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')

$Java = Resolve-Java -Explicit $Java
$DesktopJar = Resolve-DesktopCli -Explicit $DesktopJar -Root $root -Required
$Aapt2 = Resolve-Aapt2 -Explicit $Aapt2 -Root $root
$names = Join-Path $root 'patches/src/main/resources/hushtelegram/names'

$work = Join-Path ([System.IO.Path]::GetTempPath()) ("hushtelegram-names-" + [guid]::NewGuid().ToString('N').Substring(0, 8))
New-Item -ItemType Directory -Force -Path $work | Out-Null
try {
    $newApk = Get-MergedApk -Apk $Apk -Destination (Join-Path $work 'new.apk') -Java $Java -DesktopJar $DesktopJar
    $namedApk = Get-MergedApk -Apk $Named -Destination (Join-Path $work 'named.apk') -Java $Java -DesktopJar $DesktopJar
    $facts = Get-ApkManifestFacts -Apk $newApk -Aapt2 $Aapt2
    $build = "$($facts.versionCode) $($facts.versionName) $($facts.package)"

    if ($Out) { $Out = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Out) }
    else { $Out = Join-Path $names "$($facts.versionCode).txt" }
    if ($NamesFrom) {
        $NamesFrom = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($NamesFrom)
    } elseif (Test-Path -LiteralPath $Out -PathType Leaf) {
        $NamesFrom = $Out
    } else {
        $NamesFrom = Get-ChildItem -LiteralPath $names -Filter '*.txt' -File | Where-Object { $_.BaseName -match '^\d+$' } |
            Sort-Object { [long]$_.BaseName } | Select-Object -Last 1 -ExpandProperty FullName
    }
    if (-not $NamesFrom -or -not (Test-Path -LiteralPath $NamesFrom -PathType Leaf)) {
        throw "No table to take resource names from. Pass -NamesFrom."
    }
    Write-Host "[names] $build -> $Out (resource names from $(Split-Path -Leaf $NamesFrom))"

    # Continue for the call alone: a JDK warning on stderr is not a failure. The exit code decides.
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        & $Java "-Xmx$Heap" '-cp' $DesktopJar (Join-Path $PSScriptRoot 'NameTable.java') $namedApk $newApk $build $Out $NamesFrom 2>&1 |
            ForEach-Object { Write-Host "[names] $_" }
        $exitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $preference
    }
    if ($exitCode -ne 0) { throw "NameTable.java failed (exit $exitCode); $Out is unchanged." }
} finally {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}
