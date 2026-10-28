import pathlib,json,subprocess,sys,frida,frida_tools,time
serial,package=sys.argv[1:3];adb='D:/Android/Sdk/platform-tools/adb.exe';pid=int(subprocess.check_output([adb,'-s',serial,'shell','pidof',package]).decode().split()[0]);bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js';session=frida.get_device(serial,timeout=15).attach(pid);script=session.create_script(bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path('scripts/media-thumbnail/diagnostic.js').read_text(encoding='utf-8-sig'));script.on('message',lambda m,d:print(json.dumps(m,ensure_ascii=False),flush=True));script.load();rpc=script.exports_sync
try:
 print(json.dumps(rpc.inspect(),ensure_ascii=False),flush=True)
 if len(sys.argv)>3:
  rpc.enable();rpc.trace();rpc.jump(int(sys.argv[3]));time.sleep(1);print('VIEWS',json.dumps(rpc.views(),ensure_ascii=False),flush=True);time.sleep(45)
finally:
 try:rpc.cleanup()
 finally:session.detach()
