#!/bin/sh
# End-to-end check of the built .mpp against the original Discord APKM (developer-only; output in work/verify/):
# patch it with every patch through the newest Morphe CLI (prerelease or stable), then run tests/native/VerifyApk.kt on the result.
#   sh scripts/verify_apk.sh [Discord.apkm]       # defaults to the newest complete .apkm in ~/uploaded_files
#   UNSIGNED=1 sh scripts/verify_apk.sh           # skip signing (less memory; no signature check)
# Needs python3 scripts/build.py first. Patching a 400 MB APKM needs about 1.5 GB of RAM (MORPHE_HEAP, default 1g).
set -e
cd "$(dirname "$0")/.."
APKM="${1:-$(python3 scripts/hbc/find_apkm.py)}"
[ -f "$APKM" ] || { echo "usage: sh scripts/verify_apk.sh Discord.apkm" >&2; exit 2; }
MPP=$(ls patches/build/libs/*.mpp 2>/dev/null | head -1)
[ -n "$MPP" ] && [ -f patches/build/classes.jar ] || { echo "Run python3 scripts/build.py first" >&2; exit 2; }
OUT=work/verify; rm -rf "$OUT"; mkdir -p "$OUT"
export JAVA_OPTS=-Xmx384m
# The newest Morphe CLI, prerelease or stable (scripts/morphe_cli.py); MORPHE_CLI=path overrides it.
CLI="${MORPHE_CLI:-$(python3 scripts/morphe_cli.py)}"
echo "Patching with $(basename "$CLI")"
status=0
# Every patch, including Custom branding (off by default), so every hook is checked at once.
java -Xmx${MORPHE_HEAP:-1g} -jar "$CLI" patch -p "$MPP" -e "Custom branding" -t "$OUT/tmp" \
  -o "$OUT/patched.apk" ${UNSIGNED:+--unsigned} "$APKM" > "$OUT/patch.log" 2>&1 || status=$?
grep -E "SEVERE|WARNING|failed" "$OUT/patch.log" || true
[ "$status" = 0 ] || { echo "Morphe exited with $status (137 = out of memory); see $OUT/patch.log" >&2; exit 1; }
python3 -c "import sys, zipfile; zipfile.ZipFile(sys.argv[1]).testzip()" "$OUT/patched.apk" ||
  { echo "$OUT/patched.apk is incomplete" >&2; exit 1; }
if grep -qE "SEVERE|failed" "$OUT/patch.log"; then echo "A patch failed; see $OUT/patch.log" >&2; exit 1; fi
rm -rf "$OUT/tmp" "$OUT"/*-merged.apk
work/tools/kotlinc/bin/kotlinc -no-stdlib -no-reflect -Xfriend-paths=patches/build/classes.jar \
  -cp patches/build/classes.jar:work/tools/morphe.jar tests/native/VerifyApk.kt -d "$OUT/verify.jar" 2>&1 | grep -v "^warning" || true
java -Xmx700m -cp "$OUT/verify.jar:patches/build/classes.jar:work/tools/morphe.jar" VerifyApkKt "$OUT/patched.apk" $([ -n "$UNSIGNED" ] || echo signed)
