param([string]$Version = '0.3.0', [switch]$Streaming)
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path $PSScriptRoot -Parent)
$morphe = Join-Path $PWD 'tools\morphe-desktop.jar'
$classes = Join-Path $PWD "build\$Version-patches\cast-classes"
New-Item -ItemType Directory -Force build\cast-tests | Out-Null
& javac --release 11 -cp $classes -d build\cast-tests scripts\CastWireTest.java
if ($LASTEXITCODE -ne 0) { throw 'No compila el test de Cast.' }
& java -cp "$classes;build\cast-tests" CastWireTest
if ($LASTEXITCODE -ne 0) { throw 'Fallan las pruebas del protocolo Cast.' }
& javac --release 11 -cp $classes -d build\cast-tests scripts\CastDiagnosticsTest.java
if ($LASTEXITCODE -ne 0) { throw 'No compila el test de diagnóstico.' }
& java -cp "$classes;build\cast-tests" CastDiagnosticsTest
if ($LASTEXITCODE -ne 0) { throw 'Falla el diagnóstico de fuentes.' }
& javac --release 11 -cp $classes -d build\cast-tests scripts\CastRelayTest.java
if ($LASTEXITCODE -ne 0) { throw 'No compila el test del puente HLS.' }
& java -cp "$classes;build\cast-tests" CastRelayTest
if ($LASTEXITCODE -ne 0) { throw 'Falla el puente CORS/HLS.' }
& javac --release 11 -cp $classes -d build\cast-tests scripts\LocalPlaybackTest.java
if ($LASTEXITCODE -ne 0) { throw 'No compila el test de traspaso del reproductor.' }
& java -cp "$classes;build\cast-tests" LocalPlaybackTest
if ($LASTEXITCODE -ne 0) { throw 'El traspaso libera el reproductor local.' }
& javac --release 11 -cp $classes -d build\cast-tests scripts\SessionLeaseTest.java
if ($LASTEXITCODE -ne 0) { throw 'No compila el test de vida de la sesión.' }
& java -cp "$classes;build\cast-tests" SessionLeaseTest
if ($LASTEXITCODE -ne 0) { throw 'La sesión no libera correctamente los recursos de segundo plano.' }
if ($Streaming) {
    & javac --release 11 -cp $classes -d build\cast-tests scripts\CastRelayStreamingTest.java
    if ($LASTEXITCODE -ne 0) { throw 'No compila el test de streaming prolongado.' }
    & java -cp "$classes;build\cast-tests" CastRelayStreamingTest
    if ($LASTEXITCODE -ne 0) { throw 'Falla la entrega de fragmentos nuevos después de 30 segundos.' }
}
& tools\kotlin-current\kotlinc\bin\kotlinc.bat scripts\verify-cast-bundle.kt -classpath $morphe -jvm-target 11 -d build\cast-tests\bundle-tests.jar
if ($LASTEXITCODE -ne 0) { throw 'No compila el test del paquete.' }
& java -cp "build\cast-tests\bundle-tests.jar;$morphe" Verify_cast_bundleKt "dist\lunar-edge-patches-$Version.mpp"
if ($LASTEXITCODE -ne 0) { throw 'El paquete de prueba no cumple sus requisitos.' }
