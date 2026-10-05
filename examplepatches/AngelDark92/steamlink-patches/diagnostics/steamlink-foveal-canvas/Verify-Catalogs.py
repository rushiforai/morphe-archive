"""Check the generated experiment entry and preserve every prior patch verbatim."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil

p = argparse.ArgumentParser()
p.add_argument('generated', type=Path)
p.add_argument('--apply', action='store_true')
a = p.parse_args()
root = Path(__file__).resolve().parents[2]
title = 'Full-FOV foveal canvas (experimental)'
results = []
names = ['patches-list.json', 'patches-list-stable.json',
         'patches-list-experimental.json', 'patches-list-all.json']
for name in names:
    old_bytes = (root / name).read_bytes()
    new_bytes = (a.generated / name).read_bytes()
    old = json.loads(old_bytes)
    new = json.loads(new_bytes)
    assert old['channel'] == new['channel'] and old['version'] == new['version'], name
    previous = {patch['name']: patch for patch in old['patches']}
    current = {patch['name']: patch for patch in new['patches']}
    assert len(current) == len(new['patches']), 'Duplicate patch name'
    for key, patch in previous.items():
        assert current[key] == patch, (name, 'Changed existing patch', key)
    experimental = new['channel'] in ('all', 'experimental')
    assert set(current) - set(previous) == ({title} if experimental and title not in previous else set()), name
    if experimental:
        entry = current[title]
        assert entry['default'] is False and entry['dependencies'] == []
        targets = [t for c in entry['compatiblePackages'] for t in c['targets']]
        assert targets and all(t['version'] == '2.0.20' and
                               set(t['versionCodes'].values()) == {5001812} for t in targets)
    else:
        assert old == new, 'Stable catalog content change'
        # Preserve existing bytes even if the generator's newline convention differs.
        new_bytes = old_bytes
    results.append(dict(catalog=name, oldPatches=len(previous), newPatches=len(current),
                        existingEntriesUnchanged=True, sha256=hashlib.sha256(new_bytes).hexdigest()))
if a.apply:
    for name in names:
        if name != 'patches-list-stable.json' and (root / name).read_bytes() != (a.generated / name).read_bytes():
            shutil.copyfile(a.generated / name, root / name)
(Path(__file__).parent / 'catalog-validation.json').write_text(
    json.dumps(dict(status='PASS', results=results), indent=2) + '\n', encoding='utf-8')
print(json.dumps(results, indent=2))
