#!/usr/bin/env bash
# Run smali assertions against one or more dex files (baksmali + rg).

set -euo pipefail

# Usage: run_smali_assertions <assertions_json> <dex_dir_or_file>...
# assertions_json: [{"file":"com/foo/Bar.smali","method":"m","pattern":"return-void","label":"..."}]
run_smali_assertions() {
  local assertions_json="$1"
  shift
  local dex_inputs=("$@")

  [[ ${#dex_inputs[@]} -gt 0 ]] || die "run_smali_assertions: no dex inputs"
  require_cmd baksmali

  local count
  count="$(python3 -c "import json,sys; print(len(json.loads(sys.argv[1])))" "$assertions_json")"
  [[ "$count" != "0" ]] || return 0

  local work
  work="$(mktemp -d)"
  trap 'rm -rf "$work"' RETURN

  local dex bak_out combined failed=0
  for dex in "${dex_inputs[@]}"; do
    [[ -f "$dex" ]] || continue
    bak_out="$work/$(basename "$dex")"
    mkdir -p "$bak_out"
    baksmali d "$dex" -o "$bak_out" >/dev/null 2>&1
  done

  while IFS= read -r line; do
    local file method pattern label target method_block
    file="$(echo "$line" | python3 -c "import json,sys; d=json.loads(sys.stdin.read()); print(d['file'])")"
    method="$(echo "$line" | python3 -c "import json,sys; d=json.loads(sys.stdin.read()); print(d.get('method',''))")"
    pattern="$(echo "$line" | python3 -c "import json,sys; d=json.loads(sys.stdin.read()); print(d['pattern'])")"
    label="$(echo "$line" | python3 -c "import json,sys; d=json.loads(sys.stdin.read()); print(d.get('label', d['file']))")"

    target=""
    for bak_out in "$work"/*; do
      [[ -d "$bak_out" ]] || continue
      if [[ -f "$bak_out/$file" ]]; then
        target="$bak_out/$file"
        break
      fi
    done

    if [[ -z "$target" ]]; then
      echo "MISS $label ($file: not found in dex)"
      failed=1
      continue
    fi

    if [[ -n "$method" ]]; then
      method_block="$(python3 - "$target" "$method" <<'PY'
import re, sys
path, name = sys.argv[1], sys.argv[2]
text = open(path).read()
m = re.search(rf'\.method[^\n]*\s+{re.escape(name)}\(', text)
if not m:
    sys.exit(1)
end = text.find('.end method', m.start())
print(text[m.start():end if end != -1 else None])
PY
)" || method_block=""
      if [[ -n "$method_block" ]] && echo "$method_block" | rg -q "$pattern"; then
        echo "OK   $label (smali)"
      else
        echo "MISS $label ($file::$method: $pattern)"
        failed=1
      fi
    elif rg -q "$pattern" "$target" 2>/dev/null; then
      echo "OK   $label (smali)"
    else
      echo "MISS $label ($file: $pattern)"
      failed=1
    fi
  done < <(python3 -c "import json,sys; [print(json.dumps(x)) for x in json.loads(sys.argv[1])]" "$assertions_json")

  return "$failed"
}

# Extract classes*.dex from an APK zip into a temp dir; prints dex paths one per line.
extract_dex_from_apk() {
  local apk="$1"
  local out_dir="$2"
  require_cmd unzip
  mkdir -p "$out_dir"
  unzip -l "$apk" | awk '/classes[0-9]*\.dex/{print $4}' | while read -r entry; do
    [[ -n "$entry" ]] || continue
    unzip -p "$apk" "$entry" > "$out_dir/$(basename "$entry")"
    echo "$out_dir/$(basename "$entry")"
  done
}
