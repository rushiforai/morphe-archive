param(
    [string[]]$Checks = @(
        'frida-image-paging-reset-regression',
        'frida-archive-search-crash-smoke'
    )
)

$out = 'build/frida-verification'
New-Item -ItemType Directory -Force -Path $out | Out-Null
npm.cmd install --prefix $out frida-java-bridge@7.1.0 frida-compile@19.1.0
if ($LASTEXITCODE -ne 0) { throw 'Could not install the pinned Frida Java bridge compiler.' }

$compiler = Join-Path $out 'node_modules/.bin/frida-compile.cmd'
foreach ($name in $Checks) {
    $sourcePath = Join-Path 'scripts' ($name + '.js')
    if (-not (Test-Path -LiteralPath $sourcePath)) { throw "Missing Frida check: $sourcePath" }
    $entryPath = Join-Path $out ($name + '.entry.js')
    $bundlePath = Join-Path $out ($name + '.bundle.js')
    $source = Get-Content -LiteralPath $sourcePath -Raw -Encoding UTF8
    $source = $source.Replace('console.log(', 'send(')
    Set-Content -LiteralPath $entryPath -Encoding UTF8 -Value ("import Java from 'frida-java-bridge'; globalThis.Java=Java;`n" + $source)
    & $compiler $entryPath -o $bundlePath -S
    if ($LASTEXITCODE -ne 0) { throw "Could not compile Frida check: $name" }
    Write-Output "PASS $bundlePath"
}
