#!/usr/bin/env bash
# Adds out/classes3.dex to an APK that Morphe already patched, then re-signs it with a debug key.
#
# The Morphe output already has classes.dex AND classes2.dex (the extension), so the new dex
# must be classes3.dex. Overwriting classes2.dex crashes the app with NoClassDefFoundError X.0D7.
#
# It also adds a call to app.fblite.research.Preload.run(context) at the start of attachBaseContext,
# so the replacement X.0eF is loaded from the APK before the secondary dex (see Preload.java).
#
# Usage: UBER_APK_SIGNER_JAR=... APKTOOL_JAR=... ./make-test-apk.sh morphe-patched.apk
#        Output: out/test-aligned-debugSigned.apk
set -euo pipefail
cd "$(dirname "$0")"
: "${UBER_APK_SIGNER_JAR:?set UBER_APK_SIGNER_JAR}"
: "${APKTOOL_JAR:?set APKTOOL_JAR}"
input="$1"

rm -rf out/main && mkdir -p out/main
unzip -q -o "$input" classes.dex -d out/main
(cd out/main && zip -q main.jar classes.dex && rm classes.dex)
java -jar "$APKTOOL_JAR" d -f -r out/main/main.jar -o out/main/smali >/dev/null
shell=out/main/smali/smali/com/facebook/lite/ClientApplicationSplittedShell.smali
python3 - "$shell" <<'PY'
import re, sys
p = sys.argv[1]
s = open(p).read()
call = "    invoke-static/range { p1 .. p1 }, Lapp/fblite/research/Preload;->run(Landroid/content/Context;)V\n"
m = re.search(r"(\.method public final attachBaseContext\(Landroid/content/Context;\)V\n\s*\.locals \d+\n)", s)
if not m:
    sys.exit("attachBaseContext not found")
s = s[:m.end()] + call + s[m.end():]
open(p, "w").write(s)
PY
java -jar "$APKTOOL_JAR" b out/main/smali -o out/main/rebuilt.jar >/dev/null
unzip -q -o out/main/rebuilt.jar classes.dex -d out

cp "$input" out/test.apk
zip -q -d out/test.apk 'META-INF/*.SF' 'META-INF/*.RSA' 'META-INF/*.MF' || true
(cd out && zip -q test.apk classes.dex classes3.dex)
java -jar "$UBER_APK_SIGNER_JAR" -a out/test.apk -o out >/dev/null
echo "Built out/test-aligned-debugSigned.apk (debug key: uninstall the Morphe-signed app first)"
