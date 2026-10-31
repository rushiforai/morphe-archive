set -euo pipefail
cd "$(dirname "$0")/.."
[[ -f build/libs/muse-patches-1.2.4.mpp ]] || { echo 'Run bash build.sh first.' >&2; exit 1; }
if [[ ! -f .tools/gson-2.14.0.jar ]]; then
  curl --fail --location --retry 2 https://repo.maven.apache.org/maven2/com/google/code/gson/gson/2.14.0/gson-2.14.0.jar -o .tools/gson-2.14.0.jar
fi
printf '%s\n' '2cbd119bf1961c28788310963dc80ba65f58cdeec1dd139c8bdb1240faa2c36f  .tools/gson-2.14.0.jar' | sha256sum --check --status
.tools/kotlin/kotlinc/bin/kotlinc tools/PatchListGenerator.kt -classpath .tools/morphe-desktop-1.19.0-all.jar:.tools/gson-2.14.0.jar -jvm-target 11 -d build/generator
rm -rf build/metadata-work
mkdir -p build/metadata-work/build/libs
cp build/libs/muse-patches-1.2.4.mpp build/metadata-work/build/libs/
(cd build/metadata-work && java -cp ../../.tools/morphe-desktop-1.19.0-all.jar:../../.tools/gson-2.14.0.jar:../generator util.PatchListGeneratorKt)
cp build/patches-list.json patches-list.json
printf '\n' >> patches-list.json
printf '\nGenerated patches-list.json from the compiled MPP.\n'
