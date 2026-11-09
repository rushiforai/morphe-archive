<#
.SYNOPSIS
    Runs the JVM test for the updater's ABI mapping (UpdateAbis).

.DESCRIPTION
    Compiles single-apk/single-ui/src/main/java/.../UpdateAbis.java together with
    single-apk/single-ui/test/.../UpdateAbisTest.java using javac --release 8 (no Android
    framework needed) and runs its main. Exits non-zero when any mapping check fails.

    Covered: arm64-v8a -> one-arm64, armeabi-v7a/armeabi -> one-arm32,
    x86/x86_64 -> one-x86, unknown -> no candidate. Only the primary ABI counts, so an
    arm64 device never falls back to one-arm32.

.EXAMPLE
    ./single-apk/test-update-abis.ps1
#>
[CmdletBinding()]
param(
    [string]$OutDir = "single-apk/out-one/test-abis"
)

$ErrorActionPreference = "Stop"
$repo = Split-Path -Parent $PSScriptRoot
$out = if ([IO.Path]::IsPathRooted($OutDir)) { $OutDir } else { Join-Path $repo $OutDir }
$src = Join-Path $PSScriptRoot "single-ui/src/main/java/com/anderson/applemusic/one/UpdateAbis.java"
$test = Join-Path $PSScriptRoot "single-ui/test/com/anderson/applemusic/one/UpdateAbisTest.java"

Remove-Item $out -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force $out | Out-Null

Write-Host "javac: UpdateAbis.java + UpdateAbisTest.java"
& javac --release 8 -Xlint:-options -encoding UTF-8 -d $out $src $test
if ($LASTEXITCODE -ne 0) { throw "javac failed with exit code $LASTEXITCODE" }

Write-Host "java : com.anderson.applemusic.one.UpdateAbisTest"
& java -cp $out com.anderson.applemusic.one.UpdateAbisTest
if ($LASTEXITCODE -ne 0) { throw "UpdateAbisTest failed with exit code $LASTEXITCODE" }
