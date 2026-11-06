[CmdletBinding()]
param()
. "$PSScriptRoot/common.ps1"
$violations = [Collections.Generic.List[string]]::new()
$files = @(& git -C $script:ProjectRoot ls-files --cached --others --exclude-standard)
if ($LASTEXITCODE -ne 0) { throw 'Git file listing failed.' }
foreach ($file in $files) {
    $path = Get-ProjectPath $file
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { continue }
    if ($file -eq 'LICENSE' -or $file -eq 'NOTICE' -or $file -eq 'package-lock.json') { continue }
    if ($file -match '\.(kt|kts|java|js|cjs|ps1|py|md|json|yml|toml|properties)$|^\.releaserc$') {
        $content = [IO.File]::ReadAllText($path)
        if ($content -match '[\uD83C-\uD83E][\uDC00-\uDFFF]|[\u2600-\u27BF]|\uFE0F') {
            $violations.Add("Emoji found in $file")
        }
        if ($content -match 'app[.]template|User[XYZ]{3}|TEMPL[ATE]{3}-patches-template') {
            $violations.Add("Template identity found in $file")
        }
        if ($content -match '\u2014') {
            $violations.Add("Em dash found in $file")
        }
        if ($file -match '\.(kt|kts|java|js|cjs|ps1|py)$' -and ($content -split '\n').Count -gt 251) {
            $violations.Add("Source exceeds 250 lines: $file")
        }
        if ($file -eq 'gradle.properties' -and $content -match '(?m)^\s*gpr\.(user|key)\s*[:=]') {
            $violations.Add('GitHub Packages credentials belong in user-level properties.')
        }
        if ($file -match '\.(kt|kts)$' -and $content.Contains(('!' + '!'))) {
            $violations.Add("Non-null assertion found in $file")
        }
    }
}
if ($violations.Count) {
    $violations | ForEach-Object { Write-Host $_ }
    exit 1
}
Write-Host 'Source hygiene checks passed.'
