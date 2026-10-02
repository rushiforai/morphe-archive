#!/usr/bin/env bash
# Builds a dex with a trace-only replacement of X.1DY (the props decoder) for Facebook Lite 530.0.0.8.106.
# It delegates to the original and appends to cache/fblite-ads.txt:
#   - posts that carry X.1HZ metadata, about 1.5 s after they are decoded;
#   - a dump of every child of the feed container (id 30001) when cache/fblite-dump-feed exists;
#   - with cache/fblite-hide-ads present at app start, hides sponsored posts the same way the patch does.
# Sources and stubs use X.$1DY-style names; the "$" is stripped in smali after compiling.
#
# Add the output as an extra classesN.dex and call X.ZZPreload.run(context) at the start of attachBaseContext
# (see research/glyph-rasterizer/make-test-apk.sh for how to inject the call).
#
# Usage: ANDROID_HOME=... APKTOOL_JAR=... ./build.sh   Output: out/classes.dex
set -euo pipefail
cd "$(dirname "$0")"
: "${ANDROID_HOME:?set ANDROID_HOME}"
: "${APKTOOL_JAR:?set APKTOOL_JAR}"
BUILD_TOOLS="${BUILD_TOOLS:-$(ls -d "$ANDROID_HOME"/build-tools/* | sort -V | tail -1)}"
ANDROID_JAR="${ANDROID_JAR:-$ANDROID_HOME/platforms/android-35/android.jar}"

rm -rf out && mkdir -p out/stub out/cls out/d8
javac -source 8 -target 8 -nowarn -cp "$ANDROID_JAR" -d out/stub stub/X/*.java
javac -source 8 -target 8 -nowarn -encoding UTF-8 -cp "$ANDROID_JAR:out/stub" -d out/cls src/X/*.java
"$BUILD_TOOLS/d8" --min-api 26 --lib "$ANDROID_JAR" --classpath out/stub --output out/d8 $(find out/cls -name '*.class')
(cd out/d8 && zip -q ../trace.jar classes.dex)
java -jar "$APKTOOL_JAR" d -f -r out/trace.jar -o out/smali >/dev/null
for f in out/smali/smali/X/*.smali; do
  LC_ALL=C sed -i.bak 's#LX/\$#LX/#g' "$f" && rm -f "$f.bak"
  n=$(basename "$f"); case "$n" in \$*) mv "$f" "out/smali/smali/X/${n#\$}";; esac
done
java -jar "$APKTOOL_JAR" b out/smali -o out/renamed.jar >/dev/null
unzip -o -q out/renamed.jar classes.dex -d out
echo "Built out/classes.dex"
