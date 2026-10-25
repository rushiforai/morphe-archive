#!/bin/sh
# End-to-end startup A/B on the real Discord bundle: inject two compacted runtimes with HbcPrelude
# (through HbcPreludeTest), boot each on the HBC98 VM through React Native's own initializer
# (tests/hermes-startup.js), and compare per-process user CPU over interleaved cold starts.
#   sh tests/bench/cold_boot.sh <old compacted bootstrap.js> [new, default patches/build/bootstrap.js] [runs]
# Needs: sh scripts/hbc/setup.sh [Discord.apkm], the tools from scripts/build.py. Builds what else it needs.
set -e
cd "$(dirname "$0")/../.."
OLD="$1"; NEW="${2:-patches/build/bootstrap.js}"; RUNS="${3:-25}"
[ -f "$OLD" ] || { echo "usage: sh tests/bench/cold_boot.sh old-bootstrap.js [new-bootstrap.js] [runs]" >&2; exit 2; }
BUNDLE=work/new/assets/index.android.bundle
[ -f "$BUNDLE" ] || { echo "Missing $BUNDLE: run sh scripts/hbc/setup.sh Discord.apkm" >&2; exit 2; }
[ -x work/hermes/vm/hermes ] || sh scripts/hbc/hermes_vm.sh >/dev/null
K=work/tools/kotlinc/bin/kotlinc
export JAVA_OPTS=-Xmx384m
[ -f patches/build/classes.jar ] || $K -no-stdlib -no-reflect -jvm-target 11 -Xlambdas=class \
  -cp work/tools/morphe.jar:work/tools/gson.jar $(find patches/src/main/kotlin -name '*.kt') -d patches/build/classes.jar
[ -f patches/build/hbc-prelude-tests.jar ] || $K -no-stdlib -no-reflect -Xfriend-paths=patches/build/classes.jar \
  -cp patches/build/classes.jar:work/tools/morphe.jar tests/native/HbcPreludeTest.kt -d patches/build/hbc-prelude-tests.jar
FEATURES='{picker:true,voice:true,noDelete:true,freeNitro:true,hiddenChannels:true,platformIndicators:true,quests:true,customThemes:true,translate:true}'
OUT=work/bench/cold
mkdir -p "$OUT"
for pair in "old:$OLD" "new:$NEW"; do
  name=${pair%%:*}; file=${pair#*:}
  { cat tests/hermes-startup.js; echo; sed "s#/\*__FEATURES__\*/#$FEATURES#" "$file"; } > "$OUT/combined-$name.js"
  java -Xmx600m -cp patches/build/hbc-prelude-tests.jar:patches/build/classes.jar:work/tools/morphe.jar \
    app.venus.patches.HbcPreludeTestKt "$BUNDLE" "$OUT/$name" "$OUT/combined-$name.js" | tail -1
  rm -f "$OUT/$name/invalid.hbc" "$OUT/$name/normal.hbc" "$OUT/$name/throwing.hbc"
  work/hermes/hermes-vm "$OUT/$name/environment.hbc" | grep -q HBC98_REAL_RN_ENVIRONMENT_PASS ||
    { echo "$name: patched bundle did not boot (no HBC98_REAL_RN_ENVIRONMENT_PASS)" >&2; exit 1; }
done
LD_LIBRARY_PATH="$PWD/work/hermes/icu/usr/lib/x86_64-linux-gnu" python3 - work/hermes/vm/hermes \
  "$OUT/old/environment.hbc" "$OUT/new/environment.hbc" "$RUNS" <<'EOF'
import resource, subprocess, sys
vm, a, b, n = sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4])
cpu = {a: [], b: []}
for i in range(n):
    for f in ((a, b) if i % 2 == 0 else (b, a)):
        s = resource.getrusage(resource.RUSAGE_CHILDREN)
        subprocess.run([vm, f], stdout=subprocess.DEVNULL, check=True)
        e = resource.getrusage(resource.RUSAGE_CHILDREN)
        cpu[f].append((e.ru_utime - s.ru_utime) * 1000)
def at(v, q): v = sorted(v); return v[min(len(v) - 1, int(q * len(v)))]
base = at(cpu[a], 0.1)
for name, f in (("old", a), ("new", b)):
    p10 = at(cpu[f], 0.1)
    ratio = base / p10
    print("%s  cold boot user CPU  p10 %.0f ms  median %.0f ms  %s" % (name, p10, at(cpu[f], 0.5),
          "baseline" if f == a else "%.2fx %s" % (ratio, "(within noise)" if abs(ratio - 1) < 0.05 else "faster" if ratio > 1 else "SLOWER")))
EOF
