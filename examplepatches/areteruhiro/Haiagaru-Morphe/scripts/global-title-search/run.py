import json,pathlib,subprocess,sys,time,frida,frida_tools
serial,package=sys.argv[1:3];adb='D:/Android/Sdk/platform-tools/adb.exe'
pid=int(subprocess.check_output([adb,'-s',serial,'shell','pidof',package]).decode().split()[0])
bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js';session=frida.get_device(serial,timeout=15).attach(pid)
script=session.create_script(bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path('scripts/global-title-search/runtime.js').read_text(encoding='utf-8-sig'));script.load();rpc=script.exports_sync
try:
 print('SETUP',rpc.setup(),flush=True);print('TESTS',rpc.tests(),flush=True)
 if len(sys.argv)>3 and sys.argv[3]=='ui':
  rpc.show();time.sleep(2);print('UI_READY',flush=True);time.sleep(20);print('UI_TESTS',rpc.ui_tests(),flush=True)
finally:
 try:print('RESTORE',rpc.cleanup(),flush=True)
 finally:session.detach()
