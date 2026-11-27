param(
    [string]$SourceUrl = 'https://gall.dcinside.com/board/view/?id=monochrome&no=46651'
)

$ErrorActionPreference = 'Stop'
$html = (Invoke-WebRequest -Uri $SourceUrl -UseBasicParsing).Content
$start = $html.IndexOf('class="write_div"', [StringComparison]::Ordinal)
$end = $html.IndexOf('if(window.OutLink', $start, [StringComparison]::Ordinal)
if ($start -lt 0 -or $end -le $start) {
    throw 'Post body markers changed; inspect the source before updating the table.'
}

$body = $html.Substring($start, $end - $start)
$body = [regex]::Replace($body, '(?i)</div\s*>|<br\s*/?>|</p\s*>', "`n")
$body = [regex]::Replace($body, '<[^>]*>', '')
$body = [System.Net.WebUtility]::HtmlDecode($body)
$pattern = '^(?<key>(?:\d{1,3}\s*\.\s*\d{1,3}(?:\s*\.\s*\d{1,3}){0,2}|[0-9a-fA-F:]+(?:/\d{1,3})?))\s*-(?<label>.+)$'
$entries = [System.Collections.Generic.List[string]]::new()
$seen = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
foreach ($raw in ($body -split '\r?\n')) {
    $line = $raw.Trim()
    if ($line -notmatch $pattern) { continue }
    $key = [regex]::Replace($Matches['key'], '\s*\.\s*', '.').ToLowerInvariant()
    $label = $Matches['label'].Trim().Replace('기타등등', '기타')
    if ($key.Contains('.')) {
        $octets = $key.Split('.')
        if (($octets | Where-Object { [int]$_ -gt 255 }).Count -gt 0) { continue }
    } elseif ($key -notmatch '^[0-9a-f]{1,4}:[0-9a-f]{1,4}(?:::/32)?$') {
        continue
    }
    if (!$label) { continue }
    $entry = "$key-$label"
    if ($seen.Add($entry)) { $entries.Add($entry) }
}
if ($entries.Count -lt 1000) {
    throw "Only $($entries.Count) entries found; refusing to replace the table."
}
$target = Join-Path $PSScriptRoot '..\patches\src\main\resources\dcinside\lumi_ip_prefixes.txt'
$utf8NoBom = [System.Text.UTF8Encoding]::new($false)
[System.IO.File]::WriteAllText((Resolve-Path $target).Path,
    (($entries -join "`n") + "`n"), $utf8NoBom)
Write-Output "Wrote $($entries.Count) entries from $SourceUrl"
