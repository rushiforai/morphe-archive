#!/usr/bin/env python3
"""Read synthetic Read You state after stopping it on the owned API35 AVD."""
import argparse
import hashlib
import json
from pathlib import Path
import sqlite3
import sys
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'finamp'))
import android_acceptance as base

p=argparse.ArgumentParser(description=__doc__);p.add_argument('label');a=p.parse_args()
if not a.label.replace('-','').isalnum():p.error('Use a simple fixture label')
base.PACKAGE='me.ash.reader';base.OUT_ROOT=base.REPO_ROOT/'.scratch/readyou/android'
u=base.Android(out=base.OUT_ROOT/'state'/a.label)
user=u.adb('shell','am','get-current-user').strip()
if user!='0':raise RuntimeError('This fixture is owned only in Android user0')
u.adb('shell','am','force-stop','--user',user,base.PACKAGE)
for name in ('Reader','Reader-wal'):
    data=u.adb('exec-out','su','0','cat','/data/user/0/me.ash.reader/databases/'+name,binary=True,check=False)
    if data and not data.startswith(b'cat:'): (u.out/name).write_bytes(data)
c=sqlite3.connect(u.out/'Reader');c.row_factory=sqlite3.Row
result={
 'groups':[dict(x) for x in c.execute('select id,name,accountId from "group" order by id')],
 'feeds':[dict(x) for x in c.execute('select id,name,url,groupId,accountId,isNotification,isFullContent,isBrowser from feed order by id')],
 'accounts':[dict(x) for x in c.execute('select id,name,type from account order by id')],
}
data=u.adb('exec-out','su','0','cat','/data/user/0/me.ash.reader/files/datastore/settings.preferences_pb',binary=True)
(u.out/'settings.preferences_pb').write_bytes(data)
result['settingsSha256']=hashlib.sha256(data).hexdigest()
(u.out/'state.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,ensure_ascii=False))
