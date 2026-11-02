"""Open the common patrol log from real settings controls, without modifying data."""
import json
import pathlib
import re
import subprocess
import sys
import time
import xml.etree.ElementTree as ET

serial, package = sys.argv[1:3]
assert serial == 'emulator-5580'
assert re.fullmatch(r'jp\.co\.airfront\.android\.a2chMate\.haiagaru\.(settingsfix191|resumefix226|resumefix242)', package)
adb='C:/Users/narum/AppData/Local/Android/Sdk/platform-tools/adb.exe'
def run(*args):
    return subprocess.check_output([adb,'-s',serial,*args])
def tree():
    for _ in range(3):
        time.sleep(.7)
        if b'dumped to:' in run('shell','uiautomator','dump','/sdcard/haiagaru-patrol-ui.xml'):
            return ET.fromstring(run('shell','cat','/sdcard/haiagaru-patrol-ui.xml'))
    raise AssertionError('UI hierarchy unavailable')
def tap_text(root,text):
    nodes=[n for n in root.iter('node') if n.get('text')==text]
    assert len(nodes)==1,(text,len(nodes))
    x,y,r,b=map(int,re.findall(r'\d+',nodes[0].get('bounds')))
    run('shell','input','tap',str((x+r)//2),str((y+b)//2))
run('shell','su','0','am','start','-n',package+'/app.morphe.extension.chmate.HaiagaruSettingsActivity')
t=tree()
if any(n.get('text')=='オンライン共有NGへの同意（開発中）' for n in t.iter('node')):
    run('shell','input','keyevent','4');tree()
run('shell','input','swipe','520','2060','520','800','450')
tap_text(tree(),'履歴・コピーした記事')
tap_text(tree(),'巡回エラーログ（板URL）')
t=tree()
assert any(n.get('text')=='巡回エラーログ（最新100件・端末内のみ）' for n in t.iter('node'))
run('shell','screencap','-p','/sdcard/haiagaru-patrol-ui.png')
run('pull','/sdcard/haiagaru-patrol-ui.png',f'build/patrol-error-history-{package[-3:]}.png')
run('shell','input','keyevent','4')
print(json.dumps({'version':package[-3:],'settingsButtonOpensHistory':True}))
