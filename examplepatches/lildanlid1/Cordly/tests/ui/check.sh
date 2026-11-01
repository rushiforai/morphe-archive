#!/bin/sh
# Quick check after a UI edit, before committing (a few seconds; scripts/build.py runs the full gates):
# the runtime still parses, and every tr()/pl() text is in every language with its {placeholders}.
cd "$(dirname "$0")/../.."
mkdir -p work
sed 's#/\*__FEATURES__\*/#{}#' patches/src/main/resources/venus/bootstrap.js > work/check-bootstrap.js && node --check work/check-bootstrap.js || exit 1
python3 - <<'PY'
import json, re, subprocess, sys
folder = 'patches/src/main/resources/venus/i18n'
codes = [l.strip() for l in open(folder + '/index.txt') if l.strip()]
found = json.loads(subprocess.check_output(['node', 'scripts/i18n_strings.cjs'], text=True))
bad = 0
for code in codes:
    strings = json.load(open(f'{folder}/{code}.json'))['strings']
    missing = [e for e in found if e not in strings]
    for english, value in strings.items():
        need = set(re.findall(r'\{\w+\}', english))
        for text in (value.values() if isinstance(value, dict) else [value]):
            if set(re.findall(r'\{\w+\}', text)) != need: print(code, 'placeholders differ:', english); bad = 1
    if missing: print(code, len(missing), 'untranslated:', missing[:6]); bad = 1
unused = [e for e in json.load(open(f'{folder}/de.json'))['strings'] if e not in found]
if unused: print('No longer used (python3 tests/ui/i18n.py drop ...):', unused[:10])
print('OK' if not bad else 'FAILED'); sys.exit(bad)
PY
