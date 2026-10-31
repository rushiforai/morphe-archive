#!/usr/bin/env python3
"""Snapshot only the owned Mihon fixture before/after a same-key APK update."""
import argparse
import hashlib
import io
import json
from pathlib import Path
import sqlite3
import subprocess
import tarfile

p=argparse.ArgumentParser(description=__doc__);p.add_argument('label')
p.add_argument('--serial',required=True);p.add_argument('--avd',required=True);a=p.parse_args()
if not a.label.replace('-','').isalnum(): p.error('Simple checkpoint label required')
if not a.serial.startswith('emulator-'):p.error('Disposable emulator serial required')
def adb(*args):return subprocess.run(['adb','-s',a.serial,*args],check=True,capture_output=True).stdout
assert adb('emu','avd','name').decode().splitlines()[0]==a.avd
assert adb('shell','getprop','ro.hardware').strip()==b'ranchu'
assert adb('shell','am','get-current-user').strip()==b'0'
assert adb('exec-out','su','0','cat','/data/user/0/app.mihon/files/penguin-retention-fixture/.owner')==b'PenguinMihonRetentionFixture-2026-10-29'
adb('shell','am','force-stop','--user','0','app.mihon')
out=Path('.scratch/mihon/android/state')/a.label;out.mkdir(parents=True,exist_ok=True)
blob=adb('exec-out','su','0','tar','-c','-C','/data/user/0/app.mihon','databases','shared_prefs','files/penguin-retention-fixture')
(out/'fixture.tar').write_bytes(blob)
files={}
with tarfile.open(fileobj=io.BytesIO(blob)) as archive:
    for entry in archive:
        if not entry.isfile():continue
        data=archive.extractfile(entry).read();files[entry.name]=hashlib.sha256(data).hexdigest()
        if entry.name in ('databases/tachiyomi.db','databases/tachiyomi.db-wal'):
            (out/entry.name.removeprefix('databases/')).write_bytes(data)
c=sqlite3.connect(out/'tachiyomi.db');c.row_factory=sqlite3.Row
manga=[dict(x) for x in c.execute('select * from manga order by id')]
assert len(manga)==1 and manga[0]['id']==9900000001
result={'manga':manga,'chapter':[dict(x) for x in c.execute('select * from chapter order by id')],
        'persistentFiles':{k:v for k,v in files.items() if not k.startswith('databases/')}}
# SQLite memo BLOBs are synthetic UTF-8 JSON; make their representation explicit.
for rows in (result['manga'],result['chapter']):
    for row in rows:
        for key,value in row.items():
            if isinstance(value,bytes):row[key]={'hex':value.hex()}
(out/'state.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'checkpoint':a.label,'mangaCount':len(manga),'persistentFileCount':len(result['persistentFiles'])}))
