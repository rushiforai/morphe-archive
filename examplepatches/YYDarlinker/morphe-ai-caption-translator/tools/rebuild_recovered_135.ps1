param()

$ErrorActionPreference = 'Stop'
$repo = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$source = Join-Path $repo 'recovered/1.3.5'
$build = Join-Path $repo 'build/recovered-1.3.5'
$deps = Join-Path $build 'tools'
New-Item -ItemType Directory -Path $deps -Force | Out-Null

$artifacts = @(
    @('org/smali/baksmali/2.5.2/baksmali-2.5.2.jar', 'baksmali.jar', '1ED236266D7DC4907AADE0B19A34F77EFAC25342B63C8ACE52E579039941B389'),
    @('org/smali/smali/2.5.2/smali-2.5.2.jar', 'smali.jar', '136C5C4653D6531BD7B6F10F35F8691CB96432E727D30B4D5579826EE01E9419'),
    @('org/smali/dexlib2/2.5.2/dexlib2-2.5.2.jar', 'dexlib2.jar', '5A5C8982D8BD7D6E3BB1A0713049E3C78B719EC32B20F6B619885CEC30A0DD61'),
    @('org/smali/util/2.5.2/util-2.5.2.jar', 'util.jar', '4F580A9CFF3EBB83CB3FD20BEC88E37E4F183796CA652732992611620282DAEA'),
    @('com/beust/jcommander/1.64/jcommander-1.64.jar', 'jcommander.jar', '156BE736199C990321D9FF77090B199629CFC9865E2D6C13F7CD291BB1641817'),
    @('com/google/guava/guava/27.1-android/guava-27.1-android.jar', 'guava.jar', '686404F2D1D4D221911F96BD627FF60DAC2226A5DFA6FB8BA517073EB97EC0EF'),
    @('org/antlr/antlr-runtime/3.5.2/antlr-runtime-3.5.2.jar', 'antlr-runtime.jar', 'CE3FC8ECB10F39E9A3CDDCBB2CE350D272D9CD3D0B1E18E6FE73C3B9389C8734')
)
$jars = @()
foreach ($item in $artifacts) {
    $path = Join-Path $deps $item[1]
    if (-not (Test-Path -LiteralPath $path)) {
        Invoke-WebRequest -Uri ('https://repo.maven.apache.org/maven2/' + $item[0]) -OutFile $path
    }
    if ((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash -ne $item[2]) {
        throw "Dependency checksum mismatch: $($item[1])"
    }
    $jars += $path
}
$classPath = $jars -join [IO.Path]::PathSeparator

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Assert-SmaliRoundTrip([string] $original, [string] $dex, [string] $name) {
    $again = Join-Path $build ($name + '-disassembled')
    & java -cp $classPath org.jf.baksmali.Main d $dex -o $again
    if ($LASTEXITCODE -ne 0) { throw "Disassembly failed: $name" }
    $files = @(Get-ChildItem -LiteralPath $original -Recurse -Filter '*.smali' -File)
    $reproduced = @(Get-ChildItem -LiteralPath $again -Recurse -Filter '*.smali' -File)
    if ($files.Count -ne $reproduced.Count) { throw "Class count changed: $name" }
    foreach ($file in $files) {
        $relative = $file.FullName.Substring($original.Length + 1)
        $counterpart = Join-Path $again $relative
        if (-not (Test-Path -LiteralPath $counterpart) -or
            (Get-FileHash -LiteralPath $file.FullName).Hash -ne (Get-FileHash -LiteralPath $counterpart).Hash) {
            throw "Round-trip mismatch: $name/$relative"
        }
    }
    Write-Output "$name round trip OK: $($files.Count) classes"
}

$extensionSmali = Join-Path $source 'extension-smali'
$patchSmali = Join-Path $source 'patch-smali'
$extensionDex = Join-Path $build 'extension.dex'
$patchDex = Join-Path $build 'classes.dex'
& java -cp $classPath org.jf.smali.Main a $extensionSmali -o $extensionDex
if ($LASTEXITCODE -ne 0) { throw 'Extension assembly failed' }
& java -cp $classPath org.jf.smali.Main a $patchSmali -o $patchDex
if ($LASTEXITCODE -ne 0) { throw 'Patch assembly failed' }
Assert-SmaliRoundTrip $extensionSmali $extensionDex 'extension'
Assert-SmaliRoundTrip $patchSmali $patchDex 'patch'

$template = Join-Path $source 'patches-1.3.5.mpp'
$output = Join-Path $build 'patches-1.3.5.mpp'
Copy-Item -LiteralPath $template -Destination $output -Force
$zip = [IO.Compression.ZipFile]::Open($output, [IO.Compression.ZipArchiveMode]::Update)
try {
    foreach ($replacement in @(@('classes.dex', $patchDex), @('extensions/extension.mpe', $extensionDex))) {
        $entry = $zip.GetEntry($replacement[0])
        if ($null -eq $entry) { throw "Missing MPP entry: $($replacement[0])" }
        $entry.Delete()
        $entry = $zip.CreateEntry($replacement[0], [IO.Compression.CompressionLevel]::Optimal)
        $inputStream = [IO.File]::OpenRead($replacement[1])
        $outputStream = $entry.Open()
        try { $inputStream.CopyTo($outputStream) }
        finally { $inputStream.Dispose(); $outputStream.Dispose() }
    }
}
finally { $zip.Dispose() }
Write-Output "Rebuilt $output"
