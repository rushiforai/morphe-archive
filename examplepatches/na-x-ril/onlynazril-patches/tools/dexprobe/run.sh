#!/usr/bin/env bash
# Runs a DexKit-based probe against an APK.
#
#   tools/dexprobe/run.sh <ProbeClass> <apk> [probe args...]
#
# Needs the DexKit desktop build (jar + native library). Override the repo
# location with DEXKIT_HOME.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dexkit="${DEXKIT_HOME:-$HOME/Documents/programming/DexKit}"
out="$here/out"

probe="${1:?usage: run.sh <ProbeClass> <apk> [args...]}"; shift
apk="${1:?usage: run.sh <ProbeClass> <apk> [args...]}"; shift || true

jar="$dexkit/dexkit/build/libs/dexkit.jar"
libdir="$dexkit/dexkit/build/library"
[ -f "$jar" ] || { echo "missing $jar (build it: ./gradlew :dexkit:jar in $dexkit)" >&2; exit 1; }
[ -f "$libdir/libdexkit.so" ] || { echo "missing $libdir/libdexkit.so (build it: ./gradlew :dexkit:cmakeBuild)" >&2; exit 1; }

pick() {
  find "$HOME/.gradle/caches/modules-2/files-2.1/$1" -name "$2" ! -name '*sources*' \
    | sort -V | tail -1
}
stdlib="$(pick org.jetbrains.kotlin/kotlin-stdlib 'kotlin-stdlib-*.jar')"
flatbuffers="$(pick com.google.flatbuffers/flatbuffers-java 'flatbuffers-java-*.jar')"
[ -n "$stdlib" ] || { echo "kotlin-stdlib not found in the gradle cache" >&2; exit 1; }
[ -n "$flatbuffers" ] || { echo "flatbuffers-java not found in the gradle cache" >&2; exit 1; }

mkdir -p "$out"
classpath="$jar:$stdlib:$flatbuffers:$out"
javac -cp "$classpath" -d "$out" "$here"/*.java

# _JAVA_OPTIONS is cleared: a stray -Xmx caps the heap DexKit needs to index a full APK.
_JAVA_OPTIONS= java -Xmx6g -Djava.library.path="$libdir" -cp "$classpath" "$probe" "$apk" "$@"
