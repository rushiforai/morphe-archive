#!/usr/bin/env bash
# Build a patched, signed split bundle from an XAPK you provide, and verify it.
#
#   scripts/build.sh /path/to/wispr-flow.xapk [out.xapk]
#
# The input must be the whole bundle: the base APK declares required split types and
# cannot be installed alone. scripts/preflight.py refuses a bare base APK instead of
# producing a build that fails with INSTALL_FAILED_MISSING_SPLIT.
#
# Environment:
#   KEYSTORE   keystore path   (default: tools/patch.keystore)
#   ALIAS      key alias       (default: wispr-patch)
#   STOREPASS  keystore pass   (default: patchpass)
#   API        dex api level   (default: 33, the app's minSdk)
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INPUT="${1:?usage: build.sh <bundle.xapk> [out.xapk]}"
OUT="${2:-$ROOT/build/wispr-flow-patched.xapk}"
WORK="$ROOT/build"
DECODED="$WORK/decoded"
INPUTS="$WORK/input"
BUNDLE="$WORK/bundle"
API="${API:-33}"
KEYSTORE="${KEYSTORE:-$ROOT/tools/patch.keystore}"
ALIAS="${ALIAS:-wispr-patch}"
STOREPASS="${STOREPASS:-patchpass}"

export JAVA_HOME="${JAVA_HOME:-$ROOT/tools/jdk}"
export PATH="$JAVA_HOME/bin:$PATH"
JAVA="$JAVA_HOME/bin/java"
APKTOOL="$ROOT/tools/apktool.jar"
BT="$ROOT/tools/android/build-tools"

[ -x "$JAVA" ] || { echo "error: run scripts/bootstrap.sh first" >&2; exit 1; }
[ -f "$KEYSTORE" ] || { echo "error: no keystore at $KEYSTORE (scripts/bootstrap.sh --keystore)" >&2; exit 1; }
[ -f "$APKTOOL" ] || { echo "error: no apktool at $APKTOOL" >&2; exit 1; }
mkdir -p "$WORK" "$BUNDLE" "$(dirname "$OUT")"

echo "== 1/8 checking the input bundle"
rm -rf "$INPUTS" "$BUNDLE"
mkdir -p "$BUNDLE" "$INPUTS"
PLAN="$(python3 "$ROOT/scripts/preflight.py" "$INPUT" --work "$INPUTS" --json)"
BASE="$(python3 -c 'import json,sys; print(json.loads(sys.argv[1])["base"])' "$PLAN")"
SPLITS=()
while IFS= read -r line; do [ -n "$line" ] && SPLITS+=("$line"); done \
    < <(python3 -c 'import json,sys; print("\n".join(json.loads(sys.argv[1])["splits"]))' "$PLAN")
echo "   base:   $(basename "$BASE")"
echo "   splits: ${#SPLITS[@]}"

echo "== 2/8 decompiling the base"
"$ROOT/scripts/decompile.sh" "$BASE" "$DECODED"

echo "== 3/8 applying patches"
python3 "$ROOT/scripts/apply_patches.py" --decoded "$DECODED"

echo "== 4/8 compiling the smali driver"
mkdir -p "$WORK/java"
javac -nowarn -cp "$APKTOOL" -d "$WORK/java" "$ROOT/tools/java/Smali2Dex.java"

echo "== 5/8 assembling the patched dex(es)"
python3 - "$ROOT" "$BASE" "$DECODED" "$WORK" "$API" "$APKTOOL" "$JAVA" <<'PY'
import json, subprocess, sys, zipfile
from pathlib import Path

root, apk, decoded, work, api, apktool, java = sys.argv[1:8]
decoded = Path(decoded)

hooks = []
for path in sorted(Path(root, "patches").glob("*/patch.json")):
    manifest = json.loads(path.read_text(encoding="utf-8"))
    for hook in manifest["hooks"]:
        # the file name is the declaration, the "name" field is the patch
        hook["patch"] = manifest["name"]
        hooks.append(hook)

# Which dex trees did the run write to? A class hook names its class; a global hook
# carries no class, so the trees are read back from the markers it left behind.
touched: set[str] = set()
for hook in hooks:
    if hook.get("kind") == "callsite-global":
        marker = f"# patch:{hook['patch']}:{hook['id']}"
        for path in decoded.glob("smali*/**/*.smali"):
            if marker in path.read_text(encoding="utf-8"):
                touched.add(path.relative_to(decoded).parts[0])
        continue
    # The descriptor also appears in dex files that merely reference the class, so ask
    # the decompiled tree, which is one file per definition.
    trees = sorted(decoded.glob(f"smali*/{hook['class']}.smali"))
    if not trees:
        sys.exit(f"error: {hook['class']} not found in the decompiled tree")
    if len(trees) > 1:
        sys.exit(f"error: {hook['class']} is defined in {len(trees)} smali trees")
    touched.add(trees[0].relative_to(decoded).parts[0])

built = {}
for tree in sorted(touched):
    # apktool names the first dex tree "smali", the others "smali_classesN".
    smali_dir = decoded / tree
    suffix = tree[len("smali_classes"):] if tree != "smali" else ""
    entry = f"classes{suffix}.dex" if suffix else "classes.dex"
    if entry in built:
        continue
    out = Path(work) / f"{entry}.patched"
    subprocess.run(
        [java, "-cp", f"{apktool}:{work}/java", "Smali2Dex", str(smali_dir), str(out), api],
        check=True,
    )
    built[entry] = out
    print(f"  {entry}: {smali_dir.name} -> {out.name}")

Path(work, "built-dexes.json").write_text(json.dumps({k: str(v) for k, v in built.items()}))
PY

echo "== 6/8 repacking, aligning and signing every piece under one key"
python3 - "$ROOT" "$BASE" "$WORK" "$BUNDLE" "$KEYSTORE" "$ALIAS" "$STOREPASS" "$BT" "$OUT" ${SPLITS[@]+"${SPLITS[@]}"} <<'PY'
import json, subprocess, sys
from pathlib import Path

root, base, work, bundle, keystore, alias, storepass, bt, out = sys.argv[1:10]
splits = sys.argv[10:]
built = json.loads(Path(work, "built-dexes.json").read_text())

def repack(source, target, entry=None, dex=None):
    cmd = ["python3", f"{root}/scripts/repack_apk.py", source, "-o", target,
           "--zipalign", f"{bt}/zipalign", "--apksigner", f"{bt}/apksigner",
           "--keystore", keystore, "--alias", alias, "--storepass", storepass]
    if dex:
        cmd[3:3] = [dex, "--entry", entry]
    subprocess.run(cmd, check=True)

# Each patched dex goes back into an APK that starts from the original, so the second
# and later dexes are applied on top of the previous result.
current = base
for index, (entry, dex) in enumerate(built.items()):
    last = index == len(built) - 1
    target = Path(bundle, Path(base).name) if last else Path(work, f"stage{index}.apk")
    repack(current, str(target), entry=entry, dex=dex)
    current = str(target)

for split in splits:
    repack(split, str(Path(bundle, Path(split).name)))

(Path(bundle) / "manifest.json").write_text(
    json.dumps({"package_name": "com.wispr.flowapp", "xapk_version": 2,
                "split_apks": [{"file": Path(p).name} for p in [base, *splits]]}, indent=2)
)
PY

echo "== 7/8 verifying the patched APK against the manifests"
python3 "$ROOT/scripts/verify_apk.py" --apk "$BUNDLE/$(basename "$BASE")" \
    --source-apk "$BASE" --tools "$ROOT/tools"

echo "== 8/8 verifying the bundle itself"
python3 "$ROOT/scripts/verify_bundle.py" --dir "$BUNDLE" --apksigner "$BT/apksigner"

echo "== packing $OUT"
python3 - "$BUNDLE" "$OUT" <<'PY'
import sys, zipfile
from pathlib import Path
bundle, out = Path(sys.argv[1]), Path(sys.argv[2])
with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as z:
    for path in sorted(bundle.iterdir()):
        z.write(path, path.name)
print(f"  {out} ({out.stat().st_size} bytes)")
PY

echo
echo "patched bundle: $OUT"
echo "to install (all pieces in one session, they share the patched signature):"
for piece in "$BUNDLE"/*.apk; do printf '  %s\n' "$piece"; done
echo "  adb install-multiple -r <paths above>"
