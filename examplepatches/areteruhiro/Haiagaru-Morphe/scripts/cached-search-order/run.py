import pathlib,sys,subprocess,frida,frida_tools,time,json
serial,package=sys.argv[1:3]
pid=int(subprocess.check_output(['D:/Android/Sdk/platform-tools/adb.exe','-s',serial,'shell','pidof',package]).decode().split()[0])
bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js'
session=frida.get_device(serial,timeout=15).attach(pid)
try:
 script=session.create_script(bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path('scripts/cached-search-order/runtime.js').read_text(encoding='utf-8-sig'))
 script.on('message',lambda m,d:print(json.dumps(m,ensure_ascii=False),flush=True));script.load();rpc=script.exports_sync
 try:
  rpc.launch();time.sleep(4);print('PASS',rpc.test(),'native cached search order checks',flush=True)
 finally:rpc.cleanup()
finally:session.detach()
