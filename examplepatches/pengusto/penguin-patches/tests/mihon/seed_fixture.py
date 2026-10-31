#!/usr/bin/env python3
"""Seed the owned synthetic library while Mihon's bundled SQLite is stopped."""
import argparse
import io
import json
from pathlib import Path
import sqlite3
import subprocess
import tarfile

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--serial', required=True); p.add_argument('--avd', required=True)
a = p.parse_args()
if not a.serial.startswith('emulator-'): p.error('Disposable emulator required')
def adb(*args):
    return subprocess.run(['adb', '-s', a.serial, *args], check=True, capture_output=True, timeout=60).stdout
assert adb('emu', 'avd', 'name').decode().splitlines()[0] == a.avd
assert adb('shell', 'getprop', 'ro.hardware').strip() == b'ranchu'
assert adb('shell', 'am', 'get-current-user').strip() == b'0'
root = '/data/user/0/app.mihon'
assert adb('exec-out', 'cat', root + '/files/penguin-retention-fixture/.owner') == b'PenguinMihonRetentionFixture-2026-10-29'
adb('shell', 'am', 'force-stop', '--user', '0', 'app.mihon')
out = Path('.scratch/mihon/seed'); out.mkdir(parents=True, exist_ok=True)
blob = adb('exec-out', 'tar', '-c', '-C', root, 'databases')
with tarfile.open(fileobj=io.BytesIO(blob)) as archive:
    for member in archive:
        if member.name in ('databases/tachiyomi.db', 'databases/tachiyomi.db-wal') and member.isfile():
            (out / Path(member.name).name).write_bytes(archive.extractfile(member).read())
db = out / 'tachiyomi.db'
c = sqlite3.connect(db)
assert c.execute('pragma integrity_check').fetchone()[0] == 'ok'
assert c.execute('select count(*) from manga where id != 9900000001').fetchone()[0] == 0
fixture = json.loads(Path(__file__).with_name('fixture.json').read_text())
c.execute('insert or replace into source(id, name, language) values(?, ?, ?)', (9900000002, '', ''))
for table in ('manga', 'chapter'):
    for record in fixture[table]:
        values = [bytes.fromhex(v['hex']) if isinstance(v, dict) else v for v in record.values()]
        c.execute(f'insert or replace into {table} ({",".join(record)}) values ({",".join("?" for _ in record)})', values)
c.commit(); c.execute('pragma wal_checkpoint(truncate)'); c.execute('pragma journal_mode=delete')
assert c.execute('pragma integrity_check').fetchone()[0] == 'ok'
c.close()
uid = adb('shell', 'stat', '-c', '%u:%g', root + '/databases/tachiyomi.db').decode().strip()
assert all(part.isdigit() for part in uid.split(':'))
adb('push', str(db), '/data/local/tmp/mihon-synthetic.db')
adb('shell', 'cp', '/data/local/tmp/mihon-synthetic.db', root + '/databases/tachiyomi.db')
adb('shell', 'rm', '-f', root + '/databases/tachiyomi.db-wal', root + '/databases/tachiyomi.db-shm')
adb('shell', 'chown', uid, root + '/databases/tachiyomi.db')
print('Seeded one synthetic favorite/chapter with the app stopped; SQLite integrity check passed')
