<#
.SYNOPSIS
    Preflight selected local patch sources before merging or patching an APK.
.DESCRIPTION
    Selections is JSON with schemaVersion 1 and sources [{bundle, patches}]. Exact names are
    scoped to their own bundle; ["*"] selects every patch for this APK's package. No force,
    installation or signing is performed. The output APK is unsigned. InspectOnly writes
    the same local ownership report without merging or patching the APK.
.NOTES
    https://github.com/SysAdminDoc/HushGram
    Original HushGram tooling. GPL-3.0-only.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Apk,
    [Parameter(Mandatory = $true)][string]$Selections,
    [Parameter(Mandatory = $true)][string]$DesktopJar,
    [Parameter(Mandatory = $true)][string]$WorkDir,
    [string]$Java,
    [string]$Aapt2,
    [switch]$InspectOnly,
    [string]$FailureLog
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'apk-facts.ps1')
. (Join-Path $PSScriptRoot 'patch-report.ps1')
. (Join-Path $PSScriptRoot 'patch-target.ps1')
. (Join-Path $PSScriptRoot 'patch-sources.ps1')
$Java = Resolve-Java -Explicit $Java
$DesktopJar = (Resolve-Path -LiteralPath $DesktopJar).Path
$Aapt2 = Resolve-Aapt2 -Explicit $Aapt2 -Root (Split-Path -Parent $PSScriptRoot)
$selected = @(Read-PatchSourceSelection -Path $Selections)
New-Item -ItemType Directory -Path $WorkDir -Force | Out-Null
$run = Join-Path (Resolve-Path -LiteralPath $WorkDir).Path ("sources-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $run | Out-Null
# Extracting the manifest's base is read-only. Split merging is deliberately after the gate.
$base = Get-BaseApk -Apk $Apk -Destination (Join-Path $run 'stock-base.apk')
$stock = Get-ApkManifestFacts -Apk $base -Aapt2 $Aapt2
$inspected = [Collections.Generic.List[object]]::new()
for ($index = 0; $index -lt $selected.Count; $index++) {
    $source = $selected[$index]
    $inspected.Add((Get-PatchSourceInspection -Bundle $source.Bundle -Patches $source.Patches `
        -PackageName $stock.package -Java $Java -DesktopJar $DesktopJar -Scratch (Join-Path $run "source-$index")))
}
$sources = @($inspected | ForEach-Object { $_.Inspection })
$target = Test-SelectedPatchTargets -Sources $sources -PackageName $stock.package `
    -VersionName $stock.versionName -VersionCode $stock.versionCode
$definitions = Test-PatchSourceDefinitions -Sources $sources
$unknown = @($sources | Where-Object { $_.inspectionError })
$valid = $unknown.Count -eq 0 -and $target.Valid -and $definitions.Valid
$reason = if ($unknown.Count) {
    $owner = $unknown[0].identity
    "Unknown selected-source compatibility for $($owner.name) $($owner.version) [$($owner.sha256)] " +
        "($($unknown[0].inspectionError)). No APK mutation was started."
} elseif (-not $target.Valid) { $target.Reason } elseif (-not $definitions.Valid) { $definitions.Reason } else { $null }
$failures = @()
if ($FailureLog) { $failures = @(Get-PatchFailureOwnership -Sources $sources -Text ([IO.File]::ReadAllText(
    (Resolve-Path -LiteralPath $FailureLog).Path))) }
$diagnostic = [ordered]@{
    schemaVersion = 1
    target = [ordered]@{ package = $stock.package; versionName = $stock.versionName; versionCode = $stock.versionCode }
    desktopSha256 = (Get-FileHash -LiteralPath $DesktopJar -Algorithm SHA256).Hash.ToLowerInvariant()
    sources = @($sources | ForEach-Object { [ordered]@{ identity = $_.identity; patches = $_.patches; inspectionError = $_.inspectionError } })
    preflight = [ordered]@{ valid = $valid; reason = $reason; identicalSharedDefinitions = $definitions.SharedDefinitions }
    failureEvidence = if ($FailureLog) { [ordered]@{ kind = 'external-log'; scope = 'selected-bundle-inventory'
        sha256 = (Get-FileHash -LiteralPath $FailureLog -Algorithm SHA256).Hash.ToLowerInvariant() } }
        else { [ordered]@{ kind = 'not-run' } }
    failures = $failures
    patching = [ordered]@{ started = $false; valid = $false }
}
$diagnosticPath = Join-Path $run 'source-diagnostic.json'
function Save-Diagnostic {
    [IO.File]::WriteAllText($diagnosticPath, ($diagnostic | ConvertTo-Json -Depth 24), [Text.UTF8Encoding]::new($false))
}
Save-Diagnostic
foreach ($source in $sources) {
    Write-Host "[sources] $($source.identity.name) $($source.identity.version) [$($source.identity.sha256)]"
}
foreach ($failure in $failures) {
    $owner = if ($failure.dependencyOwner) { $failure.dependencyOwner.name } else { 'unknown or ambiguous source' }
    Write-Host "[sources] $($failure.patch): initializer $($failure.initializer), dependency owner $owner"
}
Write-Host "[sources] local diagnostic: $diagnosticPath"
if (-not $valid) { throw $reason }
if ($InspectOnly) { Write-Host '[sources] Preflight passed. No APK mutation was started.'; return }
foreach ($item in $inspected) {
    if ((Get-FileHash -LiteralPath $item.Snapshot -Algorithm SHA256).Hash.ToLowerInvariant() -cne $item.Inspection.identity.sha256) {
        throw 'A selected snapshot changed after inspection. No APK mutation was started.'
    }
}
$inputApk = Get-MergedApk -Apk $Apk -Destination (Join-Path $run 'stock-merged.apk') -Java $Java -DesktopJar $DesktopJar
$outputApk = Join-Path $run 'patched-unsigned.apk'
$resultPath = Join-Path $run 'patch-result.json'
$arguments = @('patch', '--exclusive', '--unsigned', '-o', $outputApk, '-t', (Join-Path $run 'temporary'), '-r', $resultPath)
$expected = @()
$dependencies = @()
foreach ($item in $inspected) {
    $arguments += @('-p', $item.Snapshot)
    foreach ($patch in @($item.Inspection.patches)) {
        if ($patch.selected) { $arguments += @('-e', [string]$patch.name); $expected += [string]$patch.name }
        elseif ($patch.name) { $dependencies += [string]$patch.name }
    }
}
$arguments += @($inputApk)
$diagnostic.patching.started = $true
Save-Diagnostic
$previous = $ErrorActionPreference
try {
    $ErrorActionPreference = 'Continue'
    $global:LASTEXITCODE = -1
    $lines = @(& $Java '-jar' $DesktopJar @arguments 2>&1)
    $code = $LASTEXITCODE
} finally { $ErrorActionPreference = $previous }
$report = $null
if (Test-Path -LiteralPath $resultPath -PathType Leaf) {
    try { $report = [IO.File]::ReadAllText($resultPath) | ConvertFrom-Json } catch { }
}
$verdict = Test-PatchingReport -Report $report -ExpectedNames $expected -AllowedDependencyNames $dependencies `
    -OutputPath $outputApk -ExpectedPackageName $stock.package -ExpectedPackageVersion $stock.versionName
$diagnostic.patching = [ordered]@{ started = $true; valid = ($code -eq 0 -and $verdict.Valid)
    cliExit = $code; reason = $verdict.Reason; applied = $verdict.Applied; failed = $verdict.Failed }
$diagnostic.failures = @(Get-PatchFailureOwnership -Sources $sources -Report $report -Text ($lines -join "`n"))
$diagnostic.failureEvidence = [ordered]@{ kind = 'current-native-run' }
Save-Diagnostic
if (-not $diagnostic.patching.valid) { throw "Selected-source patching failed. See the local ownership report ($($verdict.Reason))." }
Write-Host "[sources] Applied $($verdict.Applied) patches without forcing. Unsigned APK: $outputApk"
