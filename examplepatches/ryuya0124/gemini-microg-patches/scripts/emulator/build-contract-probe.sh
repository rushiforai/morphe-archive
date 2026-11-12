#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/common.sh"
: "${GEMINIPATCH_STORE_PASS:?Set local signing environment first}"
export GEMINIPATCH_STORE_PASS
sdk_tools="$ANDROID_HOME/build-tools/36.0.0"
android_jar="$ANDROID_HOME/platforms/android-36/android.jar"
probe="$BUILD_DIR/contract-probe"
mkdir -p "$probe/classes" "$probe/dex"
javac -source 8 -target 8 -bootclasspath "$android_jar" -d "$probe/classes" "$ROOT/analysis/emulator/"*.java
"$JAVA" -cp "$ROOT/tools/r8.jar" com.android.tools.r8.D8 --release --min-api 23 --lib "$android_jar" --output "$probe/dex" "$probe/classes/app/geminipatch/contractprobe/"*.class
"$sdk_tools/aapt2" link -I "$android_jar" --manifest "$ROOT/analysis/emulator/AndroidManifest.xml" -o "$probe/unsigned.apk"
python3 - "$probe" <<'PY'
import pathlib, sys, zipfile
p = pathlib.Path(sys.argv[1])
with zipfile.ZipFile(p / 'unsigned.apk', 'a') as z:
    z.write(p / 'dex/classes.dex', 'classes.dex')
PY
key="${KEYSTORE_PATH:-local/keys/gemini-release.p12}"
[[ "$key" = /* ]] || key="$ROOT/$key"
"$sdk_tools/apksigner" sign --ks "$key" --ks-key-alias "${KEY_ALIAS:-geminipatch}" --ks-pass env:GEMINIPATCH_STORE_PASS --key-pass env:GEMINIPATCH_STORE_PASS --out "$probe/probe.apk" "$probe/unsigned.apk"
printf 'Built emulator-only probe: %s\n' "$probe/probe.apk"
