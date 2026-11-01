#!/bin/bash
# Build a patches .mpp locally WITHOUT the Morphe Gradle plugin (which needs GitHub
# Packages credentials).
#
# The v1.13.1 release bundle is only used as a skeleton (directory layout). Everything inside
# it is rebuilt from this repository:
#   - patch classes             (patches/src/main/kotlin, compiled with kotlinc against
#                                morphe-cli; shipped both as JVM classes and as classes.dex)
#   - extensions/extension.mpe  (all Java extension code in this repo, compiled with javac + D8)
#   - stockfish binaries        (Stockfish 19, checksum verified)
#
# Toolchain (JDK 17, kotlinc 2.4, morphe-cli, ...) comes from scripts/setup_tools.sh.
#
# Usage: scripts/build_mpp_local.sh [version]
set -euo pipefail

VERSION="${1:-1.19.0}"
BASE_RELEASE="v1.13.1"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORK="${WORK_DIR:-$HOME/mpp-build}"
OUT="$ROOT/out/patches-${VERSION}.mpp"
TOOLS="${TOOLS:-$HOME/mpp-tools}"

TOOLS="$TOOLS" "$ROOT/scripts/setup_tools.sh" >/dev/null
export JAVA_HOME="$TOOLS/jdk17" PATH="$TOOLS/jdk17/bin:$PATH"

# Patcher-Version in the bundle manifest must be the version of the morphe-patcher LIBRARY the
# patches are compiled against (Morphe Manager/CLI refuse bundles that need a newer patcher).
# It is NOT the morphe-cli version: read it from the patcher inside the jar we compile against.
PATCHER_VERSION="$(unzip -p "$TOOLS/morphe-cli.jar" app/morphe/patcher/version.properties | sed -n 's/^version=//p' | tr -d '\r')"
[ -n "$PATCHER_VERSION" ] || { echo "Could not read the patcher version from morphe-cli.jar"; exit 1; }
echo "== Compiling against morphe-patcher $PATCHER_VERSION"

mkdir -p "$WORK" "$ROOT/out"
cd "$WORK"

fetch() { [ -s "$2" ] || curl -fsSL --retry 3 -o "$2" "$1"; }

echo "== Fetching tools"
fetch https://github.com/Sable/android-platforms/raw/master/android-30/android.jar android.jar
fetch https://dl.google.com/android/maven2/com/android/tools/r8/8.5.35/r8-8.5.35.jar r8.jar
fetch https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.5.2.jar baksmali.jar
fetch https://bitbucket.org/JesusFreke/smali/downloads/smali-2.5.2.jar smali.jar
fetch "https://github.com/PrathxmOp/Prathxm-Patches/releases/download/${BASE_RELEASE}/patches-${BASE_RELEASE#v}.mpp" base.mpp

echo "== Fetching Stockfish 19"
mkdir -p sf && cd sf
fetch https://github.com/official-stockfish/Stockfish/releases/download/sf_19/stockfish-android-arm64-universal.tar.gz a64.tar.gz
fetch https://github.com/official-stockfish/Stockfish/releases/download/sf_19/stockfish-android-armv7-neon.tar.gz a7.tar.gz
echo "ebb24051aa4a222b4daaf049b882ecf1163d370c128fe02316602643f4d5e426  a64.tar.gz" | sha256sum -c -
echo "47c34963f1cdf4a6af34c1b5294f7a4e2679b3eb52698c324855af2c6486024b  a7.tar.gz" | sha256sum -c -
tar -xzf a64.tar.gz stockfish/stockfish-android-arm64-universal
tar -xzf a7.tar.gz stockfish/stockfish-android-armv7-neon
cd ..

echo "== Unpacking base bundle"
rm -rf bundle && mkdir bundle && (cd bundle && unzip -q ../base.mpp)

echo "== Compiling patches (Kotlin)"
rm -rf kcls pdex && mkdir -p kcls pdex
JAVA_OPTS="-Xmx700m" "$TOOLS/kotlinc/bin/kotlinc" -nowarn -jvm-target 17 -no-stdlib -no-reflect \
  -module-name patches -cp "$TOOLS/morphe-cli.jar:$TOOLS/gson.jar:android.jar" -d kcls \
  $(find "$ROOT/patches/src/main/kotlin" -name "*.kt")
java -cp r8.jar com.android.tools.r8.D8 --release --min-api 26 --lib android.jar \
  --classpath "$TOOLS/morphe-cli.jar" --output pdex $(find kcls -name "*.class") 2>&1 | grep -v "^Warning" || true
[ -s pdex/classes.dex ] || { echo "D8 failed for patch classes"; exit 1; }
rm -rf bundle/app bundle/util bundle/classes.dex bundle/META-INF/*.kotlin_module
cp -r kcls/app kcls/util bundle/
cp kcls/META-INF/*.kotlin_module bundle/META-INF/
cp pdex/classes.dex bundle/classes.dex

echo "== Compiling extension"
rm -rf bc cls d8out && mkdir -p bc/app/prathxm/chess/extension cls d8out
cat > bc/app/prathxm/chess/extension/BuildConfig.java <<EOF
package app.prathxm.chess.extension;
public final class BuildConfig {
  public static final boolean DEBUG = false;
  public static final String APPLICATION_ID = "app.prathxm.chess.extension";
  public static final String BUILD_TYPE = "release";
  public static final int VERSION_CODE = -1;
  public static final String VERSION_NAME = "";
  public static final String PATCH_VERSION = "${VERSION}";
}
EOF
javac -encoding UTF-8 -nowarn --release 11 -cp android.jar -d cls \
  bc/app/prathxm/chess/extension/BuildConfig.java \
  $(find "$ROOT/extensions/extension/src/main/java" -name "*.java")
java -cp r8.jar com.android.tools.r8.D8 --release --min-api 26 --lib android.jar \
  --output d8out $(find cls -name "*.class")

# The extension is plain Java and must not ship a Kotlin runtime: the patcher merges extension
# classes into same-named app classes, and the app's R8-minified kotlin.* classes would get
# foreign members grafted onto them (e.g. an uninitialised kotlin.Unit.INSTANCE).
if java -jar baksmali.jar l classes d8out/classes.dex | grep -qE '^L(kotlin|kotlinx|org/jetbrains|org/intellij)/'; then
  echo "Extension dex contains Kotlin runtime classes"; exit 1
fi

echo "== Verifying every extension method called by the patches exists"
rm -rf patchsmali newsmali
java -jar baksmali.jar d bundle/classes.dex -o patchsmali
java -jar baksmali.jar d d8out/classes.dex -o newsmali
missing=0
while read -r sig; do
  sig="${sig%n}"; sig="${sig%\\}"; cls="${sig%%;->*}"; m="${sig#*;->}"
  grep -qF " ${m%%(*}(${m#*(}" "newsmali/${cls#L}.smali" 2>/dev/null || { echo "MISSING: $sig"; missing=1; }
done < <(grep -rhoE 'Lapp/prathxm/chess/extension/[A-Za-z/]*;->[A-Za-z]*\([^)]*\)(\[*L[A-Za-z/$]*;|\[*[VZBSCIJFD])' patchsmali | sort -u)
[ "$missing" = 0 ] || { echo "Extension API mismatch"; exit 1; }

echo "== Assembling bundle"
cp d8out/classes.dex bundle/extensions/extension.mpe
cp sf/stockfish/stockfish-android-arm64-universal bundle/stockfish/arm64-v8a/stockfish
cp sf/stockfish/stockfish-android-armv7-neon bundle/stockfish/armeabi-v7a/stockfish
chmod +x bundle/stockfish/*/stockfish
{
  printf 'Manifest-Version: 1.0\r\n'
  printf 'Name: Prathxm Patches\r\n'
  printf 'Description: Chess.com patches: offline Stockfish 19 analysis & game review, ad-fr\r\n ee, all bots unlocked, offline Lichess puzzles\r\n'
  printf 'Version: %s\r\n' "$VERSION"
  printf 'Timestamp: %s000\r\n' "$(date +%s)"
  printf 'Source: git@github.com:VenusIsJaded/Prathxm-Patches.git\r\n'
  printf 'Author: Prathxm\r\n'
  printf 'Contact: github.com/PrathxmOp\r\n'
  printf 'Website: github.com/VenusIsJaded/Prathxm-Patches\r\n'
  printf 'License: GPLv3\r\n'
  printf 'Patcher-Version: %s\r\n\r\n' "$PATCHER_VERSION"
} > bundle/META-INF/MANIFEST.MF

rm -f "$OUT"
(cd bundle && zip -q -X -r -D "$OUT" META-INF/MANIFEST.MF META-INF app classes.dex extensions stockfish util)
ls -la "$OUT"
echo "Built $OUT"
