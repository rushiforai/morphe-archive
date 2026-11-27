# Host (linux x86_64) natives for AnalysisCasesRealTest: the phone's analyser, run on the PC.
#   - libbitchord_analysis.so, built from BitChord's source (app/src/main/cpp/CMakeLists.txt's file list
#     and flags, minus Android's log library) with gcc:14, against the JNI headers of the
#     ytm-patches-tools JDK the unit tests run on (whose libstdc++, GCC 15's, is newer than gcc:14's)
#   - libonnxruntime.so and libonnxruntime4j_jni.so from Maven Central's desktop onnxruntime jar (sha1
#     checked), the same version as onnxruntime-android, whose Java classes stay on the test classpath
# Then run the unit tests with the output mounted, e.g. add
#   -v "<out>:/natives" -e AUTOMIX_NATIVES=/natives
# to the docker command. Nothing here is committed: the output goes under work/ (git-ignored).
param(
    [string]$BitChord = "D:\Programs\Projects\BitChord",
    [string]$Out = (Join-Path $PSScriptRoot "..\work\scratch\analysis-natives"),
    [string]$Ort = "1.28.0"
)
$ErrorActionPreference = "Stop"
New-Item -ItemType Directory -Force $Out | Out-Null
$Out = (Resolve-Path $Out).Path
$jni = Join-Path $Out ".jni"
docker run --rm -v "${Out}:/out" --entrypoint sh ytm-patches-tools -c 'rm -rf /out/.jni && cp -r $JAVA_HOME/include /out/.jni'
if ($LASTEXITCODE -ne 0) { throw "JNI headers not copied" }
$sh = @'
set -e
N=/bc/native; J=/bc/app/src/main/cpp
g++ -std=c++17 -O3 -fvisibility=hidden -fPIC -shared \
  -o /out/libbitchord_analysis.so \
  $N/analyzer/audio_analysis.cpp $N/analyzer/tempo_analysis.cpp $N/analyzer/resampler.cpp \
  $N/analyzer/mel_spectrogram.cpp $N/analyzer/vocal_spectrogram.cpp \
  $J/jni/analysis_jni.cpp $J/jni/mel_jni.cpp $J/jni/vocal_jni.cpp \
  -I$J -I$N -I/out/.jni -I/out/.jni/linux
cd /tmp
U=https://repo1.maven.org/maven2/com/microsoft/onnxruntime/onnxruntime/$ORT/onnxruntime-$ORT.jar
curl -fsSLo ort.jar $U && curl -fsSLo ort.sha1 $U.sha1
echo "$(cut -c1-40 ort.sha1)  ort.jar" | sha1sum -c -
unzip -q -o -j ort.jar 'ai/onnxruntime/native/linux-x64/*' -d /out
rm -rf /out/.jni /out/.build.sh
ls -l /out
'@
# (the script goes in a file: Windows PowerShell mangles quotes in a native argument)
[IO.File]::WriteAllText((Join-Path $Out ".build.sh"), ($sh -replace "`r", ""))
docker run --rm -e ORT=$Ort -v "${BitChord}:/bc:ro" -v "${Out}:/out" gcc:14 sh /out/.build.sh
$code = $LASTEXITCODE
foreach ($p in @($jni, (Join-Path $Out ".build.sh"))) { if (Test-Path $p) { Remove-Item -Recurse -Force $p } }
if ($code -ne 0) { throw "native build failed" }
Write-Host "natives in $Out"
