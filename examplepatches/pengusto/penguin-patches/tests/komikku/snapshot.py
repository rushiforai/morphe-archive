#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-only
"""Archive and inspect ONLY the marked, disposable Komikku fixture."""
import argparse
import hashlib
import io
import json
from pathlib import Path
import sqlite3
import subprocess
import tarfile
import xml.etree.ElementTree as ET

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('label')
p.add_argument('--adb', required=True)
p.add_argument('--serial', choices=['emulator-5584'], required=True)
a = p.parse_args()
if not a.label.replace('-', '').isalnum(): p.error('Simple checkpoint label required')
def adb(*args):
    return subprocess.check_output([a.adb, '-s', a.serial, *args])
assert adb('emu', 'avd', 'name').splitlines()[0] == b'komikku'
assert adb('shell', 'am', 'get-current-user').strip() == b'0'
root = '/data/user/0/app.komikku'
assert adb('exec-out', 'su', '0', 'cat', root + '/files/penguin-search-fixture/.owner') == b'PenguinKomikkuSearchFixture-2026-10-30'
adb('shell', 'am', 'force-stop', '--user', '0', 'app.komikku')
out = Path('.scratch/komikku/android/state') / a.label
out.mkdir(parents=True, exist_ok=False)
blob = adb('exec-out', 'su', '0', 'tar', '-c', '-C', root, 'databases', 'shared_prefs', 'files/penguin-search-fixture')
(out / 'fixture.tar').write_bytes(blob)
files = {}
logs = {}
prefs = {}
caches = {}
with tarfile.open(fileobj=io.BytesIO(blob)) as archive:
    for entry in archive:
        if not entry.isfile(): continue
        data = archive.extractfile(entry).read()
        if entry.name.startswith('files/penguin-search-fixture/logs/'):
            logs[entry.name] = hashlib.sha256(data).hexdigest()
        elif entry.name.startswith('files/penguin-search-fixture/'):
            files[entry.name] = hashlib.sha256(data).hexdigest()
        if entry.name in ('databases/tachiyomi.db', 'databases/tachiyomi.db-wal'):
            (out / entry.name.split('/')[-1]).write_bytes(data)
        if entry.name == 'shared_prefs/app.komikku_preferences.xml':
            prefs = {node.attrib['name']: (sorted(child.text or '' for child in node) if node.tag == 'set' else node.attrib.get('value', node.text)) for node in ET.fromstring(data)}
            for key in ('__APP_STATE_pref_library_cover_ratios_key', '__APP_STATE_pref_library_cover_colors_key'):
                if key in prefs: caches[key] = prefs.pop(key)
db = sqlite3.connect(out / 'tachiyomi.db')
db.row_factory = sqlite3.Row
tables = {}
for (name,) in db.execute("select name from sqlite_master where type='table' and name not like 'sqlite_%' order by name"):
    rows = [dict(row) for row in db.execute('select * from "' + name.replace('"', '""') + '"')]
    for row in rows:
        for key, value in row.items():
            if isinstance(value, bytes): row[key] = {'hex': value.hex()}
    tables[name] = sorted(rows, key=lambda row: json.dumps(row, sort_keys=True))
assert {row['_id'] for row in tables['mangas']} == {9900000001, 9900000002, 9900000003}
state = {'tables': tables, 'fixtureFiles': files, 'preferences': prefs}
(out / 'state.json').write_text(json.dumps(state, indent=2, sort_keys=True) + '\n')
(out / 'generated-runtime.json').write_text(json.dumps({'logs': logs, 'coverCaches': caches}, indent=2, sort_keys=True) + '\n')
print(json.dumps({'checkpoint': a.label, 'manga': len(tables['mangas']), 'chapters': len(tables['chapters']), 'fixtureFiles': len(files)}))
