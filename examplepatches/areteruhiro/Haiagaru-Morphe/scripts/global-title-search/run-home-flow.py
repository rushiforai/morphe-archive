import json,pathlib,subprocess,sys,time,frida,frida_tools
serial,package=sys.argv[1:3];adb='D:/Android/Sdk/platform-tools/adb.exe'
pid=int(subprocess.check_output([adb,'-s',serial,'shell','pidof',package]).decode().split()[0]);bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js'
session=frida.get_device(serial,timeout=15).attach(pid);script=session.create_script(bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path('scripts/global-title-search/runtime.js').read_text(encoding='utf-8-sig'));script.load();rpc=script.exports_sync
try:
 print('SETUP',rpc.setup(),flush=True)
 # The real native HOME request goes to its normal service. The external result
 # is seeded locally so no fixture title is posted to a public board.
 rpc.ui_query();subprocess.run([adb,'-s',serial,'shell','input','tap','230','190'],check=True)
 time.sleep(5);subprocess.run([adb,'-s',serial,'shell','uiautomator','dump','/sdcard/haiagaru-global-ui-result.xml'],check=True);subprocess.run([adb,'-s',serial,'pull','/sdcard/haiagaru-global-ui-result.xml','build/global-ui-result.xml'],check=True)
 print('RESULT_SCREEN_READY',flush=True);time.sleep(15)
finally:
 try:print('RESTORE',rpc.cleanup(),flush=True)
 finally:session.detach()
