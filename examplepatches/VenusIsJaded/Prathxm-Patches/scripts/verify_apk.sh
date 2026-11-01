#!/bin/bash
# Verify the extension's reflection against a real Chess.com APK/APKM on a desktop JVM.
#
#   scripts/verify_apk.sh <chess.apkm|base.apk> <FlowInterface> [expectedArrowSetter]
#
# <FlowInterface> is the app's obfuscated kotlinx Flow interface (the return type of the
# hooked GameAnalysisRepositoryImpl method), e.g. com.google.android.xh4 for 4.10.17.
# The patch passes this class to the extension at runtime via const-class, so the harness
# does the same.
#
# Steps: dex2jar the app -> compile extension + harness against android.jar (with small
# JVM stubs for android.util.Log / ActivityThread) -> run the harness. Exit code 0 = pass.
set -euo pipefail

APK="$1"; FLOW="$2"; SETTER="${3:-}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TOOLS="${TOOLS:-$HOME/mpp-tools}"
WORK="${VERIFY_WORK:-$HOME/mpp-verify}"
JDK="$TOOLS/jdk17"
export JAVA_HOME="$JDK" PATH="$JDK/bin:$PATH"
mkdir -p "$WORK"

KEY=$(sha256sum "$APK" | cut -c1-16)
JARS="$WORK/appjar-$KEY"
if [ ! -f "$JARS/.done" ]; then
  echo "== Converting app dex to JVM classes (one-time per APK)"
  rm -rf "$JARS" "$WORK/dex" && mkdir -p "$JARS" "$WORK/dex"
  case "$APK" in
    *.apkm|*.xapk) unzip -p "$APK" base.apk > "$WORK/base.apk" ;;
    *) cp "$APK" "$WORK/base.apk" ;;
  esac
  (cd "$WORK/dex" && unzip -o -q ../base.apk 'classes*.dex')
  for f in "$WORK"/dex/classes*.dex; do
    n=$(basename "$f" .dex)
    if ! JAVA_OPTS="-Xmx600m -XX:+UseSerialGC" sh "$TOOLS/dex-tools-v2.4/d2j-dex2jar.sh" -f -o "$JARS/$n.jar" "$f" > "$JARS/$n.log" 2>&1 \
        || [ "$(stat -c %s "$JARS/$n.jar" 2>/dev/null || echo 0)" -lt 1000 ]; then
      # Low-memory machines: split the dex into 4 parts and convert each separately.
      echo "   $n: splitting (dex2jar ran out of memory)"
      rm -rf "$WORK/split" "$JARS/$n.jar" && mkdir -p "$WORK/split"
      java -Xmx500m -jar "$TOOLS/baksmali.jar" d -j 1 "$f" -o "$WORK/split/smali"
      find "$WORK/split/smali" -name "*.smali" | sort > "$WORK/split/list"
      split -n l/4 -d "$WORK/split/list" "$WORK/split/part."
      for part in "$WORK"/split/part.0*; do
        java -Xmx500m -jar "$TOOLS/smali.jar" a --api 26 -o "$part.dex" $(cat "$part")
        JAVA_OPTS="-Xmx600m -XX:+UseSerialGC" sh "$TOOLS/dex-tools-v2.4/d2j-dex2jar.sh" -f \
          -o "$JARS/${n}_$(basename "$part").jar" "$part.dex" > /dev/null 2>&1
      done
      rm -rf "$WORK/split"
    fi
  done
  touch "$JARS/.done"
fi
APPCP=$(ls "$JARS"/*.jar | tr '\n' ':')

echo "== Compiling stubs, extension and harness"
OUT="$WORK/classes"; rm -rf "$OUT" "$WORK/stubs" && mkdir -p "$OUT" "$WORK/stubs"
javac -encoding UTF-8 -nowarn --release 11 -d "$WORK/stubs" -cp "$TOOLS/android.jar" \
  $(find "$ROOT/scripts/harness/stubs" -name "*.java")
javac -encoding UTF-8 -nowarn --release 11 -d "$OUT" -cp "$WORK/stubs:$TOOLS/android.jar" \
  $(find "$ROOT/extensions/extension/src/main/java" -name "*.java") "$ROOT/scripts/harness/Harness.java" "$ROOT/scripts/harness/FlowHarness.java"

# The app classes (real com.chess.*) come first, then our stubs, then android.jar's API
# surface (its method bodies throw, so only the stubbed classes may actually be executed).
# dex2jar output has no StackMapTable frames, so JVM bytecode verification is disabled
# (the classes are only used as a reflection/instantiation target, not trusted input).
echo "== Running harness"
java -Xmx600m -XX:+UnlockDiagnosticVMOptions -XX:-BytecodeVerificationRemote -XX:-BytecodeVerificationLocal -cp "$OUT:$APPCP$WORK/stubs:$TOOLS/android.jar" \
  app.prathxm.chess.extension.stockfish.Harness "$FLOW" $SETTER
