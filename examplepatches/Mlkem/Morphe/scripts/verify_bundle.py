"""Check generated metadata and bundle contents before releasing."""
from pathlib import Path
import json, zipfile
root=Path(__file__).resolve().parents[1]
patches=json.loads((root/'patches-list.json').read_text())['patches']
names=[p['name'] for p in patches]
assert len(patches)==25, f'Expected 25 patches, found {len(patches)}'
assert len(names)==len(set(names)), 'Duplicate patch names'
packages={c['packageName'] for p in patches for c in (p.get('compatiblePackages') or [])}
expected={'com.musicleague.app','ca.walmart.ecommerceapp','com.wongnai.android','com.neave.zoomearth','com.pushpress.memberportal'}
assert packages==expected, f'Unexpected app set: {packages}'
merge=next(p for p in patches if p['name']=='Merge XAPK only')
assert merge['default'] is False and merge['compatiblePackages'] is None
for p in patches:
    if 'Hermes hide' in p['name']: assert p['default'] is False
    for c in p.get('compatiblePackages') or []:
        if c['packageName'] in {'ca.walmart.ecommerceapp','com.pushpress.memberportal'}:
            assert all(t['isExperimental'] for t in c['targets']), 'Unverified target must stay experimental'
bundles=[p for p in (root/'patches/build/libs').glob('*.mpp')
         if not any(kind in p.name for kind in ('-sources', '-javadoc'))]
assert bundles, 'No MPP generated'
for p in bundles:
    with zipfile.ZipFile(p) as z:
        files=z.namelist()
        assert len(files)==len(set(files))
        assert z.read('classes.dex').startswith(b'dex\n')
        assert any(f.endswith('.class') for f in files)
        for name in ['extensions/canada.mpe','extensions/pushpress-crossfit-only.mpe']:
            assert z.read(name).startswith(b'dex\n'), name
            assert b'Lkotlin/' not in z.read(name), f'Unexpected Kotlin runtime in Java extension: {name}'
        assert not any(f.startswith(('kotlin/','app/morphe/patcher/')) for f in files)
        assert not any(f.endswith(('.key','.keystore','.jks','.apk','.xapk')) for f in files)
        manifest=z.read('META-INF/MANIFEST.MF').decode()
        metadata=json.loads((root/'patches-list.json').read_text())
        assert f"Version: {metadata['version']}" in manifest, 'Bundle/catalog version mismatch'
print(f'Verified {len(patches)} patches, {len(packages)} apps, plus universal merge-only.')
