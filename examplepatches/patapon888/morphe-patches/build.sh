#!/bin/bash
# build.sh <version>: builds build/patches-<version>.mpp from patches/ and extensions/,
# then regenerates patches-list.json and patches-bundle.json for the GitHub release v<version>.
#
# Needs: JDK 17+, python3, Android SDK (build-tools 36.0.0, platform android-36),
# kotlinc and morphe-cli.jar (Morphe Desktop 1.17.0 / patcher 1.14.1).
# Override the locations with ANDROID_SDK, KOTLINC and MORPHE_CLI.
set -euo pipefail
cd "$(dirname "$0")"
VERSION=${1:?usage: build.sh <version>}
REPO=patapon888/morphe-patches
SDK=${ANDROID_SDK:-~/android-sdk}; BT=$SDK/build-tools/36.0.0; AJ=$SDK/platforms/android-36/android.jar
K=${KOTLINC:-~/Nova_Bubble/work/tools/kotlinc/bin/kotlinc}; CLI=${MORPHE_CLI:-~/Nova_Bubble/work/tools/morphe-cli.jar}
B=build; OUT=$B/patches-$VERSION.mpp
rm -rf $B && mkdir -p $B/tmp $B/bundle/META-INF $B/bundle/extensions
quiet() { grep -v "^warning: \[options\]\|^[0-9] warning\|^Note:\|^warning: \|kotlin-stdlib" || true; }

# Extensions (dex files loaded into the patched apps)
mkdir -p $B/ext/duskdream/cls $B/ext/duskdream/dex
javac -nowarn -source 11 -target 11 -cp $AJ -d $B/ext/duskdream/cls $(find extensions/duskdream/src -name "*.java") 2>&1 | quiet
$BT/d8 --release --min-api 26 --lib $AJ --output $B/ext/duskdream/dex $(find $B/ext/duskdream/cls -name "*.class")
cp $B/ext/duskdream/dex/classes.dex $B/bundle/extensions/duskdream.mpe

mkdir -p $B/ext/novabubble/stub $B/ext/novabubble/cls $B/ext/novabubble/dex
javac -nowarn -source 11 -target 11 -cp $AJ -d $B/ext/novabubble/stub $(find extensions/novabubble/stub -name "*.java") 2>&1 | quiet
javac -nowarn -source 11 -target 11 -cp $AJ:$B/ext/novabubble/stub -d $B/ext/novabubble/cls $(find extensions/novabubble/src -name "*.java") 2>&1 | quiet
$BT/d8 --release --min-api 26 --lib $AJ --classpath $B/ext/novabubble/stub --output $B/ext/novabubble/dex $(find $B/ext/novabubble/cls -name "*.class")
cp $B/ext/novabubble/dex/classes.dex $B/bundle/extensions/novabubble.mpe

# Patches: class files for desktop, classes.dex for Android
mkdir -p $B/pcls $B/dex
$K -jvm-target 11 -no-stdlib -cp $CLI -d $B/pcls patches 2>&1 | quiet
$BT/d8 --release --min-api 26 --lib $AJ --classpath $CLI --output $B/dex $(find $B/pcls -name "*.class") > $B/d8.log 2>&1
cp -r $B/pcls/duskdream $B/pcls/patapon888 $B/bundle/ && cp $B/dex/classes.dex $B/bundle/
printf '%s\n' "Manifest-Version: 1.0" "Name: Patapon888's Patches" \
  "Description: Google Daydream, Nova Launcher and Bejeweled Classic patches for use with Morphe" "Version: $VERSION" \
  "Timestamp: $(date +%s%3N)" "Source: https://github.com/$REPO" "Author: Patapon888" \
  "Website: https://github.com/$REPO" "License: GPLv3" "Patcher-Version: 1.14.1" "" \
  > $B/bundle/META-INF/MANIFEST.MF
python3 -I tools/pack.py $B/bundle $OUT

# patches-list.json (read by morphe-patches.software)
mkdir -p $B/gen
$K -jvm-target 11 -cp $CLI -d $B/gen tools/PatchesList.kt 2>&1 | quiet
java -cp $CLI:$B/gen PatchesListKt $OUT $VERSION patches-list.json

# patches-bundle.json (read by Morphe Manager and Desktop when the repo is added as a source)
python3 -I - "$VERSION" "$REPO" <<'EOF'
import json, re, sys, datetime
version, repo = sys.argv[1:]
log = open("CHANGELOG.md", encoding="utf-8").read()
m = re.search(r"^## \[?" + re.escape(version) + r"\b.*?(?=^## |\Z)", log, re.S | re.M)
bundle = {
    "created_at": datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%S"),
    "description": m.group(0).strip() if m else "",
    "download_url": f"https://github.com/{repo}/releases/download/v{version}/patches-{version}.mpp",
    "signature_download_url": "",
    "version": version,
}
open("patches-bundle.json", "w", encoding="utf-8").write(json.dumps(bundle, indent=2, ensure_ascii=False) + "\n")
EOF
ls -la $OUT patches-list.json patches-bundle.json
