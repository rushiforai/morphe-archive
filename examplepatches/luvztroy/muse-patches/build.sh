set -euo pipefail
cd "$(dirname "$0")"
rm -rf build/classes build/dex build/resources build/jsonbridge
mkdir -p .tools build/classes build/dex build/libs build/resources build/jsonbridge/classes build/jsonbridge/dex
cp -R src/main/resources/. build/resources/
fetch() {
  local name="$1" url="$2" hash="$3"
  if [[ ! -f ".tools/$name" ]]; then curl --fail --location --retry 2 "$url" -o ".tools/$name"; fi
  printf '%s  %s\n' "$hash" ".tools/$name" | sha256sum --check --status || { echo "Checksum failed: $name" >&2; exit 1; }
}
fetch morphe-desktop-1.19.0-all.jar https://github.com/MorpheApp/morphe-desktop/releases/download/v1.19.0/morphe-desktop-1.19.0-all.jar deb5d931f3899b20a119637473d338c52585f0c561b5d8b2856b916fe90163b5
fetch kotlin-compiler-2.4.21.zip https://github.com/JetBrains/kotlin/releases/download/v2.4.21/kotlin-compiler-2.4.21.zip 7cc140e76daf416a0424a5557f99afd7ca89ebd463ea1101261e3e01c33e75cd
fetch r8-9.1.31.jar https://dl.google.com/dl/android/maven2/com/android/tools/r8/9.1.31/r8-9.1.31.jar 3b4de3053885da105e39c15212261d22653d6d1b5eb92323dd04ae913cc8286f
fetch android-4.1.1.4.jar https://repo.maven.apache.org/maven2/com/google/android/android/4.1.1.4/android-4.1.1.4.jar 84072541cbb711eff89f7277100ff854929a446dba7ceb1b195c340e0b4fd3cb
fetch json-20240303.jar https://repo.maven.apache.org/maven2/org/json/json/20240303/json-20240303.jar 3cf6cd6892e32e2b4c1c39e0f52f5248a2f5b37646fdfbb79a66b46b618414ed
if [[ ! -x .tools/kotlin/kotlinc/bin/kotlinc ]]; then unzip -q .tools/kotlin-compiler-2.4.21.zip -d .tools/kotlin; fi
RUNTIME="$PWD/.tools/morphe-desktop-1.19.0-all.jar"
javac --release 11 -cp "$RUNTIME" -d build/tools tools/Assemble.java
for group in mcdebug trust jsonhooks hatchdebug; do
  java -cp "$RUNTIME:build/tools" Assemble "src/replacements/$group" "build/resources/muse/$group.dex"
done
javac --release 11 -cp .tools/android-4.1.1.4.jar:.tools/json-20240303.jar -d build/jsonbridge/classes tools/jsonbridge/src/com/facebook/aura/settings/internal/mcdebug/AuraMCDebugJsonBridge.java
jar --create --file build/jsonbridge/bridge.jar -C build/jsonbridge/classes .
java -cp .tools/r8-9.1.31.jar com.android.tools.r8.D8 --release --min-api 29 --lib .tools/android-4.1.1.4.jar --lib .tools/json-20240303.jar --lib "${JAVA_HOME:-/usr/lib/jvm/java-21-openjdk-amd64}" --output build/jsonbridge/dex build/jsonbridge/bridge.jar
cp build/jsonbridge/dex/classes.dex build/resources/muse/jsonbridge.dex
.tools/kotlin/kotlinc/bin/kotlinc src/main/kotlin -classpath "$RUNTIME" -jvm-target 11 -Xlambdas=class -d build/classes
cat > build/MANIFEST.MF <<'EOF'
Manifest-Version: 1.0
Name: luvztroy patches
Description: Clone, MC Debug, top-left menu long-press, Mobile Config JSON import/export and local trust
Version: 1.2.2
Patcher-Version: 2.0.0
Author: luvztroy custom patches
License: GPL-3.0-only

EOF
jar --create --file build/libs/muse-patches-1.2.2.mpp --manifest build/MANIFEST.MF -C build/classes . -C build/resources . -C . LICENSE -C . NOTICE
jar --create --file build/patch-classes.jar -C build/classes .
java -cp .tools/r8-9.1.31.jar com.android.tools.r8.D8 --release --min-api 26 --lib .tools/android-4.1.1.4.jar --lib "${JAVA_HOME:-/usr/lib/jvm/java-21-openjdk-amd64}" --classpath "$RUNTIME" --output build/dex build/patch-classes.jar
jar --update --file build/libs/muse-patches-1.2.2.mpp -C build/dex classes.dex
java -jar "$RUNTIME" list-patches --patches build/libs/muse-patches-1.2.2.mpp -p -v
sha256sum build/libs/muse-patches-1.2.2.mpp
