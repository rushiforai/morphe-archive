#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 || $# -gt 4 ]]; then
  echo "Usage: $0 ORIGINAL.apk OUTPUT.apk [KEYSTORE] [KEY_ALIAS]" >&2
  exit 2
fi

input=$1
output=$2
keystore=${3:-imou-test.keystore}
alias=${4:-imou-test}
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

apktool_bin=${APKTOOL:-apktool}
zipalign_bin=${ZIPALIGN:-zipalign}
apksigner_bin=${APKSIGNER:-apksigner}

"$apktool_bin" d -f "$input" -o "$work/decoded" >/dev/null

python3 - "$work/decoded" <<'PY'
from pathlib import Path
import sys

root = Path(sys.argv[1])
replacements = {
    "res/layout/fragment_me_tab_new.xml": (
        'android:id="@id/imou_protect_cl" android:layout_width=',
        'android:id="@id/imou_protect_cl" android:visibility="gone" android:layout_width=',
    ),
    "res/layout-v22/fragment_me_tab_new.xml": (
        'android:id="@id/imou_protect_cl" android:layout_width=',
        'android:id="@id/imou_protect_cl" android:visibility="gone" android:layout_width=',
    ),
    "res/layout/server_imou_protect_dialog_layout.xml": (
        '<androidx.constraintlayout.widget.ConstraintLayout android:background=',
        '<androidx.constraintlayout.widget.ConstraintLayout android:visibility="gone" android:background=',
    ),
    "res/layout/pop_vas_info_layout.xml": (
        '<androidx.constraintlayout.widget.ConstraintLayout android:background=',
        '<androidx.constraintlayout.widget.ConstraintLayout android:visibility="gone" android:background=',
    ),
}

for rel, (old, new) in replacements.items():
    path = root / rel
    if not path.exists():
        print(f"warning: missing {rel}", file=sys.stderr)
        continue
    text = path.read_text()
    if new in text:
        continue
    if text.count(old) != 1:
        raise SystemExit(f"unexpected match count in {rel}: {text.count(old)}")
    path.write_text(text.replace(old, new, 1))
PY

unsigned="$work/unsigned.apk"
aligned="$work/aligned.apk"
"$apktool_bin" b "$work/decoded" -o "$unsigned" >/dev/null
"$zipalign_bin" -f -p 4 "$unsigned" "$aligned"

if [[ ! -f "$keystore" ]]; then
  echo "Keystore not found: $keystore" >&2
  echo "Create one with keytool or pass an existing keystore." >&2
  exit 1
fi

mkdir -p "$(dirname "$output")"
"$apksigner_bin" sign --ks "$keystore" --ks-key-alias "$alias" --out "$output" "$aligned"
"$apksigner_bin" verify "$output"
echo "Wrote $output"
