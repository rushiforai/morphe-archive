#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
PROJECT_ROOT=$(cd -- "$ROOT/.." && pwd)
APK=${1:-"$PROJECT_ROOT/Stick+War_+Legacy_2026.1.983_no-play.apk"}
XAPK=${2:-"$PROJECT_ROOT/Stick+War_+Legacy_2026.1.983_APKPure.xapk"}

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
attach = method(
    locate("com/pairip/application/Application.smali"),
    ".method protected attachBaseContext(Landroid/content/Context;)V",
)

checks = {
    "Stick War package retained": 'package="com.maxgames.stickwarlegacy"' in manifest,
    "PairIP runtime wrapper retained": 'android:name="com.pairip.application.Application"' in manifest,
    "Unity launcher retained": 'android:name="com.unity3d.player.UnityPlayerActivity"' in manifest,
    "PairIP license activity removed": "com.pairip.licensecheck.LicenseActivity" not in manifest,
    "Play license permission removed": "com.android.vending.CHECK_LICENSE" not in manifest,
    "billing integration retained": "com.android.vending.BILLING" in manifest,
    "Play Games integration retained": "com.google.android.gms.games.APP_ID" in manifest,
    "Firebase initialization retained": "com.google.firebase.provider.FirebaseInitProvider" in manifest,
    "Play asset extraction retained": "com.google.android.play.core.assetpacks.AssetPackExtractionService" in manifest,
    "PairIP VM context retained": "Lcom/pairip/VMRunner;->setContext" in attach,
    "Android application startup retained": "Lcom/pairip/application/Application;->attachBaseContext" in attach,
    "PairIP signature launch check removed": "Lcom/pairip/SignatureCheck;->verifyIntegrity" not in attach,
    "PairIP Play license launch check removed": "Lcom/pairip/licensecheck/LicenseClient;->checkLicense" not in attach,
}

for description, passed in checks.items():
    print(f"{'PASS' if passed else 'FAIL'}: {description}")
if not all(checks.values()):
    raise SystemExit(1)
PY

python3 - "$APK" "$XAPK" <<'PY'
import hashlib
import io
import sys
import zipfile

apk_path, xapk_path = sys.argv[1:]

def sha256(data):
    return hashlib.sha256(data).hexdigest()

with zipfile.ZipFile(xapk_path) as xapk, zipfile.ZipFile(apk_path) as patched:
    original_native = {}
    for split_name in xapk.namelist():
        if not split_name.endswith(".apk"):
            continue
        with zipfile.ZipFile(io.BytesIO(xapk.read(split_name))) as split:
            for name in split.namelist():
                if name.startswith("lib/arm64-v8a/") and name.endswith(".so"):
                    original_native[name] = sha256(split.read(name))

    missing = []
    changed = []
    for name, expected in sorted(original_native.items()):
        try:
            actual = sha256(patched.read(name))
        except KeyError:
            missing.append(name)
            continue
        if actual != expected:
            changed.append(name)

    if missing or changed:
        raise SystemExit(f"Native library verification failed; missing={missing}, changed={changed}")
    print(f"PASS: all {len(original_native)} ARM64 native libraries are unchanged")

    asset_payloads = {}
    asset_origins = {}
    for split_name in xapk.namelist():
        if not split_name.startswith("Unity") or not split_name.endswith(".apk"):
            continue
        with zipfile.ZipFile(io.BytesIO(xapk.read(split_name))) as split:
            for name in split.namelist():
                if not name.startswith("assets/") or name.endswith("/"):
                    continue
                digest = sha256(split.read(name))
                if name in asset_payloads and asset_payloads[name] != digest:
                    raise SystemExit(
                        f"Conflicting asset-pack payload {name} in "
                        f"{asset_origins[name]} and {split_name}"
                    )
                asset_payloads[name] = digest
                asset_origins[name] = split_name

    missing_assets = []
    changed_assets = []
    for name, expected in sorted(asset_payloads.items()):
        try:
            actual = sha256(patched.read(name))
        except KeyError:
            missing_assets.append(name)
            continue
        if actual != expected:
            changed_assets.append(name)

    if missing_assets or changed_assets:
        raise SystemExit(
            "Unity asset-pack verification failed; "
            f"missing={missing_assets}, changed={changed_assets}"
        )
    print(f"PASS: all {len(asset_payloads)} Unity asset-pack payloads are unchanged")
PY

echo "APK SHA-256: $(sha256sum "$APK" | awk '{print $1}')"