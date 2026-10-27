#!/usr/bin/env python3
"""Adds or removes UI texts in every language file and its override set at once, keeping them sorted.
    python3 tests/ui/i18n.py drop "English text" ["Another" ...]   # only texts tr() no longer uses
    python3 tests/ui/i18n.py add texts.json    # {"English": {"de": "...", "fr": "...", ...every language}, ...}
Plural texts take a dict per language ({"one": ..., "other": ...}). Every translation is still hand-written (AGENTS.md)."""
import glob, json, os, subprocess, sys
LANG = 'patches/src/main/resources/venus/i18n'
def write(path, data): open(path, 'w').write(json.dumps(data, ensure_ascii=False, indent=2) + '\n')
def files():
    for path in sorted(glob.glob(LANG + '/*.json')):
        pack = json.load(open(path)); override = f'scripts/i18n_overrides/{pack["code"]}.json'
        yield path, pack, override, json.load(open(override)) if os.path.exists(override) else None
cmd, args = sys.argv[1], sys.argv[2:]
if cmd == 'drop':
    used = set(json.loads(subprocess.check_output(['node', 'scripts/i18n_strings.cjs'], text=True)))
    still = [k for k in args if k in used]
    if still: sys.exit(f'Still used by tr(): {still}')
    for path, pack, opath, over in files():
        for k in args:
            pack['strings'].pop(k, None)
            if over is not None: over.pop(k, None)
        write(path, pack)
        if over is not None: write(opath, over)
elif cmd == 'add':
    new = json.load(open(args[0]))
    for path, pack, opath, over in files():
        code = pack['code']
        for english, per in new.items():
            if code not in per: sys.exit(f'{english!r} has no {code} translation')
            pack['strings'][english] = per[code]
            if over is not None: over[english] = per[code]
        pack['strings'] = dict(sorted(pack['strings'].items())); write(path, pack)
        if over is not None: write(opath, dict(sorted(over.items())))
print(cmd, len(args) if cmd == 'drop' else len(json.load(open(args[0]))), 'texts')
