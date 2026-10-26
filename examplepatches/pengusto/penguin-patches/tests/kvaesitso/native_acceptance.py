#!/usr/bin/env python3
"""Native-only #1504 acceptance using disposable APKs and synthetic data.

WARNING: replaces the two test packages and clears the debug fixture. Run only
on a new isolated emulator with no real data, using English UI, 1080x2400.
Baseline/fixed debug APKs must have the same package and disposable key.
"""
import argparse, json, re, sqlite3, subprocess, time, sys, uuid, xml.etree.ElementTree as E
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--adb',required=True)
p.add_argument('--serial',default='emulator-5580')
p.add_argument('--baseline',type=Path,required=True)
p.add_argument('--fixed',type=Path,required=True)
p.add_argument('--release',type=Path,required=True)
p.add_argument('--artifacts',type=Path,required=True)
p.add_argument('--disposable-emulator',action='store_true',required=True)
a=p.parse_args()
assert a.serial.startswith('emulator-'),'Refusing physical device'
for apk in (a.baseline,a.fixed,a.release):assert apk.is_file(),apk
ADB = a.adb
PKG = 'de.mm20.launcher2.debug'
OUT = a.artifacts
OUT.mkdir(parents=True,exist_ok=True)

def adb(*args, binary=False, check=True):
    r=subprocess.run([ADB,'-s',a.serial,*map(str,args)],capture_output=True,check=check,timeout=60)
    return r.stdout if binary else r.stdout.decode()

assert adb('shell','getprop','ro.kernel.qemu').strip()=='1'
assert adb('shell','getprop','ro.hardware').strip()=='ranchu'

def dump():
    for _ in range(4):
        adb('shell','rm','-f','/sdcard/penguin-acceptance.xml')
        result=adb('shell','uiautomator','dump','/sdcard/penguin-acceptance.xml')
        if 'dumped to:' in result:
            text=adb('shell','cat','/sdcard/penguin-acceptance.xml')
            root=E.fromstring(text)
            if any(n.get('package')==PKG for n in root.iter('node')):
                (OUT/'latest.xml').write_text(text)
                return root
        time.sleep(.5)
    raise AssertionError('No fresh UI for '+PKG)

def find(root,label):
    return next((n for n in root.iter('node') if label in (n.get('text'),n.get('content-desc'))),None)

def tapnode(n):
    assert n is not None
    x,y,X,Y=map(int,re.findall(r'\d+',n.get('bounds')))
    adb('shell','input','tap',(x+X)//2,(y+Y)//2)
    time.sleep(.4)

def click(label):
    n=find(dump(),label)
    assert n is not None,'Missing: '+label
    tapnode(n)

def back():
    adb('shell','input','keyevent','KEYCODE_BACK');time.sleep(.4)

def restart():
    adb('shell','am','force-stop',PKG)
    adb('shell','am','start','-W','-a','android.intent.action.MAIN','-c','android.intent.category.HOME','-p',PKG)
    dump()

def scroll(label):
    for _ in range(8):
        node=find(dump(),label)
        if node is not None:
            _,y,_,Y=map(int,re.findall(r'\d+',node.get('bounds')))
            if y>=150 and Y<2200:return
        adb('shell','input','swipe',540,1800,540,700,350)
    print([(n.get('text'),n.get('content-desc'),n.get('bounds')) for n in dump().iter('node') if n.get('text') or n.get('content-desc')],flush=True)
    raise AssertionError('Cannot scroll to '+label)

def setting(label,wanted):
    root=dump();n=find(root,label);assert n is not None,label
    parents={c:p for p in root.iter() for c in p}
    while n in parents:
        n=parents[n]
        switches=[s for s in n.iter('node') if s.get('checkable')=='true']
        if switches:
            assert len(switches)==1
            if (switches[0].get('checked')=='true')!=wanted:click(label)
            print('SET',label,wanted,flush=True)
            return
    raise AssertionError('Missing switch '+label)

def configure(visible, home=False):
    restart();click('More actions');click('Settings');click('Home screen')
    setting('Edit button',visible);setting('Widgets on home screen',home)
    back();back()
    restart()

def widgets():
    adb('shell','input','swipe',540,1800,540,800,350);time.sleep(.5)

def rows(label):
    adb('shell','am','force-stop',PKG)
    folder=OUT/label;folder.mkdir(exist_ok=True)
    for suffix in ('','-wal','-shm'):
        r=subprocess.run([ADB,'-s',a.serial,'exec-out','run-as',PKG,'cat','databases/room'+suffix],capture_output=True,timeout=30)
        if r.returncode==0:(folder/('room'+suffix)).write_bytes(r.stdout)
    db=sqlite3.connect(folder/'room')
    result=[tuple(v.hex() if isinstance(v,bytes) else v for v in row) for row in db.execute('SELECT id,type,config,position,parentId FROM Widget ORDER BY position,id').fetchall()];db.close()
    (folder/'widgets.json').write_text(json.dumps(result,indent=2))
    return result

adb('logcat','-b','crash','-c')
adb('install','-r',a.baseline)
adb('shell','pm','clear',PKG) # Fresh synthetic fixture on the asserted isolated emulator only.
configure(False)
# Seed a documented synthetic pre-existing note into the disposable baseline
# fixture, rather than depending on the unrelated widget picker animation.
initial=rows('initial')
assert len(initial)==3 and {r[1] for r in initial}=={'weather','music','calendar'}
db=sqlite3.connect(OUT/'initial/room')
parent=db.execute('SELECT parentId FROM Widget LIMIT 1').fetchone()[0]
db.execute('INSERT INTO Widget(id,type,config,position,parentId) VALUES(?,?,?,?,?)',
           (uuid.uuid4().bytes,'notes',json.dumps({'storedText':'Penguin1504Fixture'}),3,parent))
db.commit();db.execute('PRAGMA wal_checkpoint(TRUNCATE)');db.close()
adb('push',OUT/'initial/room','/data/local/tmp/penguin-1504-room')
adb('shell','run-as',PKG,'cp','/data/local/tmp/penguin-1504-room','databases/room')
adb('shell','run-as',PKG,'rm','-f','databases/room-wal','databases/room-shm')
restart();widgets();scroll('Penguin1504Fixture')
before=rows('before-update')
note=next(r for r in before if 'Penguin1504Fixture' in (r[2] or ''))
print('PASS: baseline source APK displays pre-existing synthetic note '+note[0],flush=True)
adb('install','-r',a.fixed)
after=rows('after-update')
assert before==after,'Widget data changed during same-key update'
print('PASS: baseline-to-fixed same-key update preserves every Widget row exactly',flush=True)
restart();click('More actions');click('Edit widgets')
root=dump();n=find(root,'Note');first=find(root,'Weather');assert n is not None and first is not None
x,y,X,Y=map(int,re.findall(r'\d+',n.get('bounds')))
_,fy,_,fY=map(int,re.findall(r'\d+',first.get('bounds')))
adb('shell','input','swipe',x-50,(y+Y)//2,x-50,max(300,fy-100),1500)
time.sleep(1);click('Done')
moved=rows('after-reorder')
assert moved[0][0]==note[0],'Dragging the note did not move it to the first position'
print('PASS: widget drag/reorder persists in Room',flush=True)
restart();click('More actions');click('Edit widgets')
root=dump();n=find(root,'Media');assert n is not None
parents={c:p for p in root.iter() for c in p}
while n in parents:
    n=parents[n];removes=[s for s in n.iter('node') if s.get('content-desc')=='Remove']
    if removes:
        assert len(removes)==1;tapnode(removes[0]);break
else:raise AssertionError('Media remove control missing')
time.sleep(1);click('Done')
removed=rows('after-remove')
assert len(removed)==len(moved)-1
assert any(r[0]==note[0] and 'Penguin1504Fixture' in (r[2] or '') for r in removed)
print('PASS: remove persists and unrelated synthetic note remains intact',flush=True)
restart();widgets();scroll('Penguin1504Fixture')
assert find(dump(),'Penguin1504Fixture') is not None
print('PASS: synthetic note content visible after process restart',flush=True)

# Only this session's freshly installed emulator fixture is removed: official
# release and disposable native build have different certificates. No host app
# or physical device is touched. Debug data above stays installed for review.
adb('uninstall','de.mm20.launcher2.release')
adb('install',a.release)
for name,extra in [('release-default',[]),('release-dark',['--layout','home'])]:
    if name=='release-dark':adb('shell','cmd','uimode','night','yes')
    with (OUT/(name+'.log')).open('w') as log:
        subprocess.run([sys.executable,str(ROOT/'tests/kvaesitso/menu_regression.py'),'--adb',ADB,'--serial',a.serial,'--package','de.mm20.launcher2.release','--artifacts',str(OUT/name),*extra],stdout=log,stderr=subprocess.STDOUT,check=True)
    print('PASS: optimized '+name+' UI regression',flush=True)
adb('shell','cmd','uimode','night','no')
crashes=adb('logcat','-b','crash','-d');(OUT/'crash.log').write_text(crashes)
assert 'FATAL EXCEPTION' not in crashes,crashes
print('PASS: crash buffer has no FATAL EXCEPTION',flush=True)
