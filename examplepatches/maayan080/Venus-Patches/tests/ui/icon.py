#!/usr/bin/env python3
"""Finds the Metro module that exports a Discord icon, for venusIcon(id, name) and rowIcon(id, name).
    python3 tests/ui/icon.py NewUserIcon [MoreIcon ...]     # first run indexes the bundle (~1 min), then instant
    python3 tests/ui/icon.py --list user                     # every icon name containing "user"
Needs work/new/assets/index.android.bundle (tests/ui/setup.sh extracts it). Add each new one to BOOTSTRAP_MODULES."""
import json, os, sys
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
sys.path.insert(0, os.path.join(ROOT, 'scripts/hbc'))
cache = os.path.join(ROOT, 'work/icon_index.json')
if os.path.exists(cache): index = json.load(open(cache))
else:
    from hbc import Bundle
    bundle = Bundle(os.path.join(ROOT, 'work/new/assets/index.android.bundle')); index = {}
    for mid in (bundle.modules if isinstance(bundle.modules, dict) else range(len(bundle.modules))):
        try: names = bundle.exports(mid) or []
        except Exception: continue
        for name in names:
            if isinstance(name, str) and name.endswith('Icon'): index.setdefault(name, []).append(mid)
    json.dump(index, open(cache, 'w'))
if sys.argv[1:2] == ['--list']:
    print('\n'.join(sorted(n for n in index if sys.argv[2].lower() in n.lower())))
else:
    for name in sys.argv[1:]: print(name, index.get(name, 'not found'))
