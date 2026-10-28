import json,pathlib,subprocess,sys,time,frida,frida_tools
serial,package=sys.argv[1:3]
adb='D:/Android/Sdk/platform-tools/adb.exe'
pid=int(subprocess.check_output([adb,'-s',serial,'shell','pidof',package]).decode().split()[0])
bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js'
session=frida.get_device(serial,timeout=15).attach(pid)
script=session.create_script(bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path('scripts/preview-layout/frida-cold-position.js').read_text(encoding='utf-8-sig'))
script.on('message',lambda m,d:print(json.dumps(m,ensure_ascii=False),flush=True));script.load();rpc=script.exports_sync
try:
 print('PREPARE',rpc.prepare(),flush=True)
 print('INITIAL',rpc.inspect(),flush=True)
 rpc.simulate();time.sleep(1)
 saved=rpc.save_and_reset();print('SAVED',saved,flush=True)
 time.sleep(4)
 after=rpc.inspect();print('AFTER',after,flush=True)
 assert after['number']==saved['number'],(after,saved)
 assert abs(after['offset']-saved['offset'])<=2,(after,saved)
 print('PASS cold-process logical response and pixel offset recovery',flush=True)
finally:
 try:print('CLEANUP',rpc.cleanup(),flush=True)
 finally:session.detach()
