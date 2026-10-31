#!/usr/bin/env python3
"""Check the real inline Gboard controls without clearing app data or changing saved values."""
import argparse, os, re, subprocess, xml.etree.ElementTree as ET
parser=argparse.ArgumentParser(); parser.add_argument('--package',required=True); parser.add_argument('--serial'); args=parser.parse_args()
adb=[os.environ.get('ADB','adb')]+(['-s',args.serial] if args.serial else [])
def call(*parts): return subprocess.check_output([*adb,*parts],text=True)
def tree():
    call('shell','uiautomator','dump','/data/local/tmp/urro-gboard-settings.xml')
    root=ET.fromstring(call('shell','cat','/data/local/tmp/urro-gboard-settings.xml').strip())
    assert not any('keeps stopping' in n.get('text','') for n in root.iter('node')), 'Gboard crashed opening settings'
    return root
def find(label):
    for attempt in range(5):
        root=tree()
        for node in root.iter('node'):
            if node.get('text')==label: return root,node
        call('shell','input','swipe','600','2100','600','600','300')
    raise AssertionError('Missing setting: '+label)
def tap(label):
    root,node=find(label); x1,y1,x2,y2=map(int,re.findall(r'\d+',node.get('bounds')))
    call('shell','input','tap',str((x1+x2)//2),str((y1+y2)//2)); return tree()
call('shell','am','start','-n',args.package+'/com.google.android.libraries.inputmethod.launcher.LauncherActivity')
root=tap('Clipboard')
find('ClipCascade'); find('Connect to ClipCascade'); find('Confirm before sending')
tap('This device section name'); find('Section name'); tap('Cancel')
call('shell','input','keyevent','4')
tap('Translate'); find('Translation shortcuts'); find('Simplify input field')
root,node=find('Simplify input field'); parents={c:p for p in root.iter() for c in p}
row=node
while row is not root and not any(n.get('checkable')=='true' for n in row.iter('node')): row=parents[row]
initial=next(n.get('checked') for n in row.iter('node') if n.get('checkable')=='true')
tap('Simplify input field')
root,node=find('Simplify input field'); parents={c:p for p in root.iter() for c in p}; row=node
while row is not root and not any(n.get('checkable')=='true' for n in row.iter('node')): row=parents[row]
after=next(n.get('checked') for n in row.iter('node') if n.get('checkable')=='true')
assert initial!=after, 'Simplify input field switch did not change'
tap('Simplify input field')
print('PASS: inline Clipboard and Translate sections, rename dialog, and native switch respond; original toggle restored')
