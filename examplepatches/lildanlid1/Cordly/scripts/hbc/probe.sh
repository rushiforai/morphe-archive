#!/bin/sh
# Boot the real Discord bundle with a Venus runtime on the HBC98 VM, then run a probe script inside it
# (developer-only; nothing here ships). React Native's own initializer runs first (tests/hermes-startup.js), then
# the probe, which can require Metro modules with metro(id) and, with --debug, read Venus internals through
# globalThis.__venusDbg(). __ASSET_IDS__ in the probe expands to every AssetRegistry module ID.
#   sh scripts/hbc/probe.sh probe.js                 # against patches/build/bootstrap.js
#   sh scripts/hbc/probe.sh probe.js --debug a,b,c   # compacts a copy exposing those top-level names
#   FEATURES='{iconPacks:true}' sh scripts/hbc/probe.sh probe.js
# Needs: sh scripts/hbc/bench_setup.sh Discord.apkm (tools, VM, bundle). Builds the Kotlin test jar it needs.
set -e
cd "$(dirname "$0")/../.."
PROBE="$1"; [ -f "$PROBE" ] || { echo "usage: sh scripts/hbc/probe.sh probe.js [--debug name,name] [runtime.js]" >&2; exit 2; }
shift
RUNTIME=patches/build/bootstrap.js
OUT=work/probe; mkdir -p "$OUT"
if [ "$1" = "--debug" ]; then
  python3 scripts/hbc/probe_runtime.py "$2" "$OUT/runtime.js"; RUNTIME="$OUT/runtime.js"; shift 2
fi
[ -n "$1" ] && RUNTIME="$1"
BUNDLE=work/new/assets/index.android.bundle
[ -f "$BUNDLE" ] || { echo "Missing $BUNDLE: run sh scripts/hbc/bench_setup.sh Discord.apkm" >&2; exit 2; }
K=work/tools/kotlinc/bin/kotlinc; export JAVA_OPTS=-Xmx384m
[ -f patches/build/classes.jar ] || $K -no-stdlib -no-reflect -jvm-target 11 -Xlambdas=class \
  -cp work/tools/morphe.jar:work/tools/gson.jar $(find patches/src/main/kotlin -name '*.kt') -d patches/build/classes.jar
[ -f patches/build/hbc-prelude-tests.jar ] || $K -no-stdlib -no-reflect -Xfriend-paths=patches/build/classes.jar \
  -cp patches/build/classes.jar:work/tools/morphe.jar tests/native/HbcPreludeTest.kt -d patches/build/hbc-prelude-tests.jar
FEATURES=${FEATURES:-'{picker:true,voice:true,noDelete:true,freeNitro:true,hiddenChannels:true,platformIndicators:true,quests:true,customThemes:true,translate:true,iconPacks:true,serverInfo:true,messageHighlight:true,appIcons:true,accountSwitcher:true,userNotif:true,reviewDB:true}'}
python3 - "$PROBE" "$BUNDLE" "$OUT/startup.js" <<'PY'
import sys; sys.path.insert(0, 'scripts/hbc'); from hbc import Bundle
probe = open(sys.argv[1]).read()
if '__ASSET_IDS__' in probe:
    B = Bundle(sys.argv[2])
    probe = probe.replace('__ASSET_IDS__', ','.join(str(m) for m in sorted(m for m, d in B.deps.items() if d and d[0] == 1132)))
src = open('tests/hermes-startup.js').read(); mark = 'print("HBC98_REAL_RN_ENVIRONMENT_PASS");'
assert src.count(mark) == 1
probe = probe.encode('ascii', 'backslashreplace').decode()   # the prelude injector only takes ASCII
open(sys.argv[3], 'w').write(src.replace(mark, mark + '\n' + probe))
PY
{ cat "$OUT/startup.js"; echo; sed "s#/\*__FEATURES__\*/#$FEATURES#" "$RUNTIME"; } > "$OUT/combined.js"
java -Xmx600m -cp patches/build/hbc-prelude-tests.jar:patches/build/classes.jar:work/tools/morphe.jar \
  app.venus.patches.HbcPreludeTestKt "$BUNDLE" "$OUT/build" "$OUT/combined.js" >/dev/null
timeout 120 work/hermes/hermes-vm "$OUT/build/environment.hbc"
