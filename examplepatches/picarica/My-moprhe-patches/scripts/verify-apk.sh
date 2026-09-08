#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
AFFINE_ROOT=$(cd -- "$ROOT/.." && pwd)
APK=${1:-"$AFFINE_ROOT/AFFiNE_0.27.4_no-gms.apk"}
XAPK=${2:-"$AFFINE_ROOT/AFFiNE_0.27.4_APKPure.xapk"}

[[ -f "$APK" ]] || { echo "APK not found: $APK" >&2; exit 1; }
[[ -f "$XAPK" ]] || { echo "XAPK not found: $XAPK" >&2; exit 1; }

for command in awk python3 sha256sum unzip; do
    command -v "$command" >/dev/null || {
        echo "$command is required" >&2
        exit 1
    }
done

TMP=$(mktemp -d)
trap 'rm -rf -- "$TMP"' EXIT

if command -v apktool >/dev/null && command -v apksigner >/dev/null; then
    apktool d -f "$APK" -o "$TMP/decoded" >/dev/null
    apksigner verify --verbose --print-certs "$APK"
elif command -v nix >/dev/null; then
    # The inner script is intentionally single-quoted; $1/$2 belong to bash -c.
    # shellcheck disable=SC2016
    nix --extra-experimental-features "nix-command flakes" \
        shell nixpkgs#jdk21 nixpkgs#apktool nixpkgs#apksigner -c bash -c '
            apktool d -f "$1" -o "$2" >/dev/null
            apksigner verify --verbose --print-certs "$1"
        ' verify "$APK" "$TMP/decoded"
else
    echo "apktool and apksigner are required (or Nix, which can provide them)." >&2
    exit 1
fi

python3 - "$TMP/decoded" <<'PY'
import pathlib
import re
import sys

root = pathlib.Path(sys.argv[1])

def locate(suffix):
    matches = list(root.glob(f"smali*/{suffix}"))
    if len(matches) != 1:
        raise SystemExit(f"Expected one {suffix}, found {len(matches)}")
    return matches[0]

def method(path, signature):
    text = path.read_text()
    start = text.index(signature)
    end = text.index(".end method", start)
    return text[start:end]

manifest = (root / "AndroidManifest.xml").read_text()
save = method(locate("b7/f.smali"), ".method private final v(Ljava/lang/Object;)Ljava/lang/Object;")
clear = method(locate("u5/b.smali"), ".method public final p(Ljava/lang/Object;)Ljava/lang/Object;")
app = method(
    locate("app/affine/pro/AFFiNEApp.smali"),
    ".method public final onCreate()V",
)
tree_constructor = method(locate("x5/a.smali"), ".method public constructor <init>()V")
tree_log = method(
    locate("x5/a.smali"),
    ".method public final e(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V",
)
upload = method(
    locate("x5/g.smali"),
    ".method public final i(Lqe/q;Lzc/c;)Ljava/lang/Object;",
)

forbidden_manifest = (
    "com.pairip",
    "com.google.android.gms",
    "com.google.firebase",
    "com.google.android.datatransport",
    "com.android.vending",
    "com.google.android.finsky",
)

checks = {
    "AFFiNE application restored": 'android:name="app.affine.pro.AFFiNEApp"' in manifest,
    "Google and PairIP manifest entry points removed": not any(
        value in manifest for value in forbidden_manifest
    ),
    "save-cookie Crashlytics call removed": "Lda/b;->q()Lqa/c;" not in save,
    "save-cookie local persistence retained": all(
        value in save for value in ("affine_user_id", "affine_csrf_token")
    ),
    "save-cookie stale move-result neutralized": re.search(
        r"goto/32\s+:\w+\s+(?:\.line[^\n]*\s+)*nop", save
    ) is not None,
    "logout Crashlytics call removed": "Lda/b;->q()Lqa/c;" not in clear,
    "logout local deletion retained": all(
        value in clear for value in ("affine_user_id", "affine_csrf_token")
    ),
    "logout stale move-result neutralized": re.search(
        r"goto/32\s+:\w+\s+(?:\.line[^\n]*\s+)*nop", clear
    ) is not None,
    "app returns before Crashlytics lookup": app.index(
        "return-void", app.index("sput-object v0, Lapp/affine/pro/AFFiNEApp;->o")
    ) < app.index("Lda/b;->q()Lqa/c;"),
    "Crashlytics tree constructor is inert": tree_constructor.index(
        "return-void"
    ) < tree_constructor.index("Lda/b;->q()Lqa/c;"),
    "Crashlytics tree logger is inert": re.search(
        r"\.locals \d+\s+return-void", tree_log
    ) is not None,
    "old-log Firebase upload is inert": re.search(
        r"\.locals \d+\s+sget-object v0, Ltc/y;->a:Ltc/y;\s+return-object v0",
        upload,
    ) is not None,
}

for description, passed in checks.items():
    print(f"{'PASS' if passed else 'FAIL'}: {description}")
if not all(checks.values()):
    raise SystemExit(1)
PY

ORIGINAL_NATIVE=$(unzip -p "$XAPK" config.arm64_v8a.apk | \
    python3 -c 'import io,sys,zipfile; z=zipfile.ZipFile(io.BytesIO(sys.stdin.buffer.read())); sys.stdout.buffer.write(z.read("lib/arm64-v8a/libaffine_mobile_native.so"))' | \
    sha256sum | awk '{print $1}')
PATCHED_NATIVE=$(unzip -p "$APK" lib/arm64-v8a/libaffine_mobile_native.so | \
    sha256sum | awk '{print $1}')
[[ "$ORIGINAL_NATIVE" == "$PATCHED_NATIVE" ]] || {
    echo "FAIL: native engine changed" >&2
    exit 1
}
echo "PASS: native engine unchanged ($PATCHED_NATIVE)"
echo "APK SHA-256: $(sha256sum "$APK" | awk '{print $1}')"