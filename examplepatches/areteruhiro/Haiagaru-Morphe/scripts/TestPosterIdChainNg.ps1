param()
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$java = if ($env:JAVA_HOME) { Join-Path $env:JAVA_HOME 'bin/java.exe' } else { 'java' }
$javac = if ($env:JAVA_HOME) { Join-Path $env:JAVA_HOME 'bin/javac.exe' } else { 'javac' }
$out = Join-Path $root 'build/verification/poster-hidden'
New-Item -ItemType Directory -Force $out | Out-Null
$sources = @(Get-ChildItem (Join-Path $PSScriptRoot 'poster-id-chain') -Filter '*.java' -Recurse | ForEach-Object FullName)
& $javac -encoding UTF-8 -d $out @sources (Join-Path $root 'extensions/chmate/src/main/java/app/morphe/extension/chmate/PosterIdChainNg.java') (Join-Path $root 'extensions/chmate/src/main/java/app/morphe/extension/chmate/ChainAboneVisibility.java')
if ($LASTEXITCODE -ne 0) { throw 'Poster chain compilation failed' }
foreach ($test in @('PosterIdChainNgTest', 'PosterIdHiddenChainTest', 'app.morphe.extension.chmate.ChainAboneReasonTest')) {
    & $java -cp $out $test
    if ($LASTEXITCODE -ne 0) { throw "$test failed" }
}
