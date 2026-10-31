#!/usr/bin/env python3
"""Check archived raw evidence without requiring an emulator or rebuilding an APK."""
import hashlib
import json
from pathlib import Path
import xml.etree.ElementTree as ET

root = Path(__file__).with_name('evidence') / '2026-10-29'
p = json.loads((root / 'provenance.json').read_text())
for name, expected in p['screenshots'].items():
    assert hashlib.sha256((root / name).read_bytes()).hexdigest() == expected, name
for before, after in [('before-manager-update', 'after-manager-update'),
                      ('before-removal', 'patch-removed'), ('patch-removed', 'patch-reapplied')]:
    a = json.loads((root / 'state' / before / 'state.json').read_text())
    b = json.loads((root / 'state' / after / 'state.json').read_text())
    assert a == b, (before, after)
    assert len(a['manga']) == 1 and a['manga'][0]['id'] == 9900000001
for name, failures in [('original-native.json', 1), ('manager-native.json', 0), ('desktop-native.json', 0)]:
    report = json.loads((root / name).read_text())
    assert len(report['cases']) == 6 and report['failures'] == failures
    assert sum(not case['passed'] for case in report['cases']) == failures
raw = (root / 'ui-before.txt').read_text().split('stream=', 1)[1]
parsed = json.JSONDecoder().raw_decode(raw)[0]
assert json.loads((root / 'ui-before-recovered.json').read_text())['report'] == parsed
assert parsed['failures'] == 1 and not parsed['cases'][0]['actualRetained']
for name in ['before', 'after']:
    tree = ET.parse(root / (name + '.xml'))
    labels = {n.get('text') for n in tree.iter('node')}
    assert 'Downloaded only' in labels
    assert ('Penguin offline test' in labels) == (name == 'after')
assert json.loads((root / 'unit-summary.json').read_text())['fixedApp'] == {'tests': 37, 'failures': 0}
suites = [ET.parse(p).getroot() for p in (root / 'source-tests').glob('TEST-*.xml')]
assert sum(int(s.get('tests')) for s in suites) == 37
assert all(int(s.get('failures')) == 0 and int(s.get('errors')) == 0 for s in suites)
baseline = ET.parse(root / 'source-tests/baseline-retention.xml').getroot()
assert int(baseline.get('tests')) == 7 and int(baseline.get('failures')) == 1
print('PASS: screenshot hashes, matched UI, raw recovery, 18 native cases, 37 source tests and all APK-transition data snapshots')

current = root.parent / '2026-10-30'
provenance = json.loads((current / 'provenance.json').read_text())
for name, expected in provenance['screenshots'].items():
    assert hashlib.sha256((current / name).read_bytes()).hexdigest() == expected, name
for before, after in [('before-manager-update', 'after-manager-update'),
                      ('before-removal', 'patch-removed'), ('patch-removed', 'patch-reapplied')]:
    assert json.loads((current / 'state' / before / 'state.json').read_text()) == json.loads((current / 'state' / after / 'state.json').read_text())
export = json.loads((current / 'export.json').read_text())
installed = json.loads((current / 'installed-apk.json').read_text())
assert export['bytes'] > 0 and export['stableObservations'] >= 3
assert installed['matchesManagerExport'] and installed['apkSha256'] == export['apkSha256']
for name in ['manager-native.json', 'reapplied.json']:
    report = json.loads((current / name).read_text())
    assert report['failures'] == 0 and len(report['cases']) == 6
    assert report['apkSha256'] == export['apkSha256']
assert json.loads((current / 'ui-after.json').read_text())['cases'][0]['realCacheDownloaded']
assert 'Runtime: name=art' in (current / 'manager-runtime.txt').read_text()
assert (current / 'manager-input-sha.txt').read_text().split()[0] == '0026bd25ce5b1c6bdc5bd2c9589a08a811ddc4fa7c994cf937729d5b7010619d'
for name in ['before', 'after']:
    labels = {n.get('text') for n in ET.parse(current / (name + '.xml')).iter('node')}
    assert 'Downloaded only' in labels
    assert ('Penguin offline test' in labels) == (name == 'after')
assert 'Disabled' in (current / 'default-off.xml').read_text()
assert 'Enabled' in (current / 'selection.xml').read_text()
assert 'Do you want to update this app?' in (current / 'installer-confirmation.xml').read_text()
assert 'System installer' in (current / 'installed.xml').read_text()
print('PASS: fresh Manager ART selection/application/export/system installation, 12 native cases, cache, matched PNG/XML and update/removal/reapply state')
