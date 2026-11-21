"""Run synthetic position and shared-NG dialog checks in one isolated reporter app."""
import json,pathlib,subprocess,sys,time
import frida,frida_tools

if len(sys.argv) not in (3,4): raise SystemExit('usage: run-reading-position-sharedng-frida.py SERIAL PACKAGE [board|display|position|bugfix]')
serial,package=sys.argv[1:3]
device=frida.get_device(serial,timeout=10)
app=next((item for item in device.enumerate_applications() if item.identifier==package),None)
if app is None: raise RuntimeError('reporter package not installed: '+package)
if not app.pid:
    adb='D:/Android/Sdk/platform-tools/adb.exe'
    subprocess.run([adb,'-s',serial,'shell','monkey','-p',package,'-c','android.intent.category.LAUNCHER','1'],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
    for _ in range(25):
        app=next((item for item in device.enumerate_applications() if item.identifier==package),None)
        if app is not None and app.pid: break
        time.sleep(.2)
    if app is None or not app.pid: raise RuntimeError('reporter package did not start: '+package)
session=device.attach(app.pid)
bridge=(pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js').read_text(encoding='utf-8')
try:
    tests=[('frida-preview-position-fixture.js','run'),('shared-ng-consent-runtime.js','test')]
    if len(sys.argv)==4 and sys.argv[3]=='board': tests=[('shared-ng-board-migration-runtime.js','test')]
    elif len(sys.argv)==4 and sys.argv[3]=='display': tests=[('shared-ng-display-runtime.js','test')]
    elif len(sys.argv)==4 and sys.argv[3]=='position': tests=[('frida-preview-position-fixture.js','run')]
    elif len(sys.argv)==4 and sys.argv[3]=='bugfix': tests=[('bugfix-nov20-frida.js','run')]
    for name,method in tests:
        source=bridge+'\nconst Java=bridge;\n'+pathlib.Path('scripts',name).read_text(encoding='utf-8')
        script=session.create_script(source)
        script.on('message',lambda message,data: print(json.dumps(message,ensure_ascii=False),flush=True) if message['type']!='log' else print(message['payload'].get('text',''),flush=True))
        script.load()
        result=getattr(script.exports_sync,method)()
        print(json.dumps({'package':package,'test':name,'result':result},ensure_ascii=False),flush=True)
        script.unload()
finally:
    session.detach()
