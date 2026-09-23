[CmdletBinding()]
param([Parameter(Mandatory)][string]$AuditDirectory, [switch]$Execute)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$root = [IO.Path]::GetFullPath($(if ([IO.Path]::IsPathRooted($AuditDirectory)) { $AuditDirectory } else { Join-Path $repo $AuditDirectory }))
$allowed = [IO.Path]::GetFullPath((Join-Path $repo 'build/fec-duplicate-reservation'))
function Assert-Owned([string]$Path, [string]$Parent) {
    $absolute = [IO.Path]::GetFullPath($Path)
    if (!$absolute.StartsWith($Parent.TrimEnd('\','/') + '\', [StringComparison]::OrdinalIgnoreCase)) { throw "Outside intended directory: $absolute" }
    $ancestor = $absolute
    while ($ancestor) {
        if ((Test-Path -LiteralPath $ancestor) -and ((Get-Item -LiteralPath $ancestor -Force).Attributes -band [IO.FileAttributes]::ReparsePoint)) { throw "Reparse ancestor: $ancestor" }
        if ($ancestor -eq $repo) { break }
        $next = Split-Path -Parent $ancestor
        if ($next -eq $ancestor) { break }
        $ancestor = $next
    }
}
Assert-Owned $root $allowed
$result = Get-Content -LiteralPath (Join-Path $root 'result.json') -Raw | ConvertFrom-Json
if ($result.Status -ne 'passed' -or $result.ApkCases -ne 16) { throw 'Require completed 16-case build before cleanup' }
$receipt = Join-Path $repo 'diagnostics/steamlink-hitches/fec-duplicate-reservation-validation.json'
if (!(Test-Path -LiteralPath $receipt)) { throw 'Preserve canonical validation receipt first' }
$validation = Get-Content -LiteralPath $receipt -Raw | ConvertFrom-Json
if ($validation.artifact.AuditDirectory -ne $root -or $validation.artifact.Sha256 -ne $result.Sha256 -or $validation.artifact.Artifact -ne $result.Artifact -or
    @($validation.cases).Count -ne 16 -or @($validation.cases | Where-Object { $_.status -ne 'passed' }).Count) {
    throw 'Canonical validation receipt does not match this completed audit run'
}
$artifact = [IO.Path]::GetFullPath($result.Artifact)
Assert-Owned $artifact ([IO.Path]::GetFullPath((Join-Path $repo 'patches/build/libs')))
if ((Get-FileHash -LiteralPath $artifact).Hash.ToLowerInvariant() -ne $result.Sha256) { throw 'Published MPP differs from validated artifact' }
$records = Join-Path $root 'cleanup'
$null = New-Item -ItemType Directory -Force -Path $records
$targets = @()
foreach ($relative in @('compiled/classes','compiled/test-classes','compiled/resources','catalogs/work','catalogs-before','previous-published-files')) { $targets += Join-Path $root $relative }
$targets += Join-Path $root ([IO.Path]::GetFileName($artifact))
foreach ($name in @('patches-list.json','patches-list-all.json','patches-list-stable.json','patches-list-experimental.json')) { $targets += Join-Path $root "catalogs/$name" }
foreach ($code in @('5002322','5002363')) {
    foreach ($selection in @('baseline','baseline-observe','standalone','bundle-first','guard-first','observe-guard-last','guard-first-observe','reapply')) {
        $targets += Join-Path $root "apks/$code-$selection/result-unsigned.apk"
    }
}
$inventory = foreach ($target in $targets) {
    $absolute = [IO.Path]::GetFullPath($target)
    Assert-Owned $absolute $root
    if (!(Test-Path -LiteralPath $absolute)) { continue }
    $item = Get-Item -LiteralPath $absolute -Force
    $items = if ($item.PSIsContainer) { @(Get-ChildItem -LiteralPath $absolute -Recurse -Force) } else { @($item) }
    if ($items | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint }) { throw "Reparse descendant: $absolute" }
    $files = @($items | Where-Object { !$_.PSIsContainer })
    [pscustomobject]@{ Path=$absolute; Files=$files.Count; Bytes=[long](($files | Measure-Object Length -Sum).Sum) }
}
$inventory | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $records 'allowlist.json') -Encoding utf8
$protected = @($artifact,$receipt,(Join-Path $repo 'patches/src/main/kotlin/app/template/patches/steamlink/RecommendedPatchBundles.kt'))
$protected += @(Get-ChildItem -LiteralPath (Join-Path $repo 'patches/src/main/resources/steamlink/decoder') -File | Select-Object -ExpandProperty FullName)
foreach ($base in @('2.0.22-5002322','2.0.23-5002363')) {
    $protected += Join-Path $repo "decoded-apk-android-steamlinkvr-release-base-$base/lib/arm64-v8a/libvrlink_scene.so"
    $protected += [IO.Path]::GetFullPath((Join-Path $repo "../Best Apks/android-steamlinkvr-release-$base.apk"))
}
$before = @($protected | ForEach-Object { Get-FileHash -LiteralPath $_ })
$before | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $records 'protected.json') -Encoding utf8
if (!$Execute) { [pscustomobject]@{Status='prepared';Targets=@($inventory).Count;Bytes=($inventory | Measure-Object Bytes -Sum).Sum}; return }
foreach ($row in $inventory) {
    Assert-Owned $row.Path $root
    Remove-Item -LiteralPath $row.Path -Recurse -Force
    if (Test-Path -LiteralPath $row.Path) { throw "Cleanup target remains: $($row.Path)" }
}
foreach ($file in $before) { if ((Get-FileHash -LiteralPath $file.Path).Hash -ne $file.Hash) { throw "Protected file changed: $($file.Path)" } }
$summary = [ordered]@{Status='passed';Utc=[DateTime]::UtcNow.ToString('o');Targets=@($inventory).Count;BytesReclaimed=($inventory | Measure-Object Bytes -Sum).Sum;ProtectedFilesVerified=$before.Count;Retained='Published MPP, canonical sources/resources/inputs, test reports, APK receipts, native evidence and current captures';Deferred='Earlier pipeline-review-test EXE/PDB remain outside this allowlist; previous approval rejection not retried'}
$summary | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $records 'result.json') -Encoding utf8
$summary | ConvertTo-Json
