#!/usr/bin/env bash
# Poll upstream Constants.kt for a new Reddit AppTarget version.
# Exit 10 = would-retarget/applied, 0 = no change or parse fail (warning).
set -euo pipefail
UPSTREAM_URL="https://raw.githubusercontent.com/MorpheApp/morphe-patches/main/patches/src/main/kotlin/app/morphe/patches/reddit/shared/Constants.kt"
UPSTREAM_FILE=""
TARGET_FILE="reddit-target.txt"
KT_FILE="patches/src/main/kotlin/app/morphe/patches/reddit/shared/Constants.kt"
README_FILE="README.md"
DRY_RUN=0
APPLY=0
usage() { echo "Usage: $0 [--upstream-file F] [--target-file F] [--kt-file F] [--readme-file F] [--dry-run] [--apply] [--help]"; }
while [ $# -gt 0 ]; do
  case "$1" in
    --upstream-file) UPSTREAM_FILE="${2:?}"; shift 2 ;;
    --target-file) TARGET_FILE="${2:?}"; shift 2 ;;
    --kt-file) KT_FILE="${2:?}"; shift 2 ;;
    --readme-file) README_FILE="${2:?}"; shift 2 ;;
    --dry-run) DRY_RUN=1; shift ;;
    --apply) APPLY=1; shift ;;
    --help|-h) usage; exit 0 ;;
    *) echo "unknown arg: $1" >&2; usage >&2; exit 2 ;;
  esac
done
SRC="$UPSTREAM_FILE"
if [ -z "$SRC" ]; then
  SRC="$(mktemp)"
  trap 'rm -f "$SRC"' EXIT
  curl -fsSL "$UPSTREAM_URL" -o "$SRC"
fi
NEW_VER="$(sed -n '/COMPATIBILITY_REDDIT/,$p' "$SRC" \
  | sed -n 's/.*version *= *"\([^"]*\)".*/\1/p' | head -n 1)"
if [ -z "$NEW_VER" ]; then
  NEW_VER="$(sed -n 's/.*version *= *"\([^"]*\)".*/\1/p' "$SRC" | tail -n 1)"
fi
if [ -z "$NEW_VER" ]; then
  echo "warning: could not parse upstream version from $SRC" >&2
  exit 0
fi
CUR=""
if [ -f "$TARGET_FILE" ]; then
  CUR="$(tr -d ' \t\r\n' < "$TARGET_FILE")"
fi
if [ "$NEW_VER" = "$CUR" ]; then
  echo "no change (upstream $NEW_VER matches $TARGET_FILE)"
  exit 0
fi
echo "$NEW_VER"
if [ "$APPLY" -eq 1 ] && [ "$DRY_RUN" -eq 0 ]; then
  printf '%s\n' "$NEW_VER" > "$TARGET_FILE"
  echo "retargeted $TARGET_FILE to $NEW_VER"
  python3 - "$KT_FILE" "$README_FILE" "$NEW_VER" <<'EOF'
import re, sys
kt_path, readme_path, ver = sys.argv[1], sys.argv[2], sys.argv[3]
kt = open(kt_path).read().splitlines(keepends=True)
idx = next((i for i, l in enumerate(kt) if 'COMPATIBILITY_REDDIT' in l), None)
if idx is None:
    sys.exit('error: COMPATIBILITY_REDDIT marker not found in %s' % kt_path)
pat = re.compile(r'version\s*=\s*"[^"]*"')
for j in range(idx, len(kt)):
    if pat.search(kt[j]):
        kt[j] = pat.sub('version = "%s"' % ver, kt[j], count=1)
        break
else:
    sys.exit('error: no version assignment found after COMPATIBILITY_REDDIT marker in %s' % kt_path)
open(kt_path, 'w').writelines(kt)
print('retargeted %s to %s' % (kt_path, ver))
try:
    readme = open(readme_path).read()
except FileNotFoundError:
    print('warning: %s not found, skipping README update' % readme_path)
    sys.exit(0)
span = re.compile(r'(<!-- REDDIT-VERSION -->)(.*?)(<!-- /REDDIT-VERSION -->)', re.S)
updated, n = span.subn(lambda m: m.group(1) + re.sub(r'\d{4}\.\d+\.\d+', ver, m.group(2)) + m.group(3), readme)
if n == 0:
    print('warning: no REDDIT-VERSION markers in %s, skipping README update' % readme_path)
    sys.exit(0)
open(readme_path, 'w').write(updated)
print('updated %d version span(s) in %s to %s' % (n, readme_path, ver))
EOF
else
  echo "would retarget $TARGET_FILE ($CUR -> $NEW_VER)"
fi
exit 10
