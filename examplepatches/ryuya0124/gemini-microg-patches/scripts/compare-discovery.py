"""Compare two host-side DexKit reports; never edit hook profiles automatically."""
import json
import sys
from pathlib import Path

if len(sys.argv) != 3:
    raise SystemExit('Usage: compare-discovery.py OLD_REPORT.json NEW_REPORT.json')
old, new = (json.loads(Path(p).read_text()) for p in sys.argv[1:])
for rule in sorted(old['rules'].keys() | new['rules'].keys()):
    before, after = old['rules'].get(rule, {}), new['rules'].get(rule, {})
    a = {v['descriptor'] for v in before.get('candidates', [])}
    b = {v['descriptor'] for v in after.get('candidates', [])}
    print(f'{rule}: {before.get("status", "absent")} -> {after.get("status", "absent")}')
    for value in sorted(a - b):
        print('  - ' + value)
    for value in sorted(b - a):
        print('  + ' + value)
