import json,pathlib,subprocess,sys,time,frida,frida_tools
serial,package=sys.argv[1:3];adb='D:/Android/Sdk/platform-tools/adb.exe'
bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js'
source=bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path('scripts/preview-layout/frida-cold-position.js').read_text(encoding='utf-8-sig')
def attach():
 pid=int(subprocess.check_output([adb,'-s',serial,'shell','pidof',package]).decode().split()[0]);session=frida.get_device(serial,timeout=15).attach(pid);script=session.create_script(source);script.load();return session,script
meta=None;s=None
try:
 s,script=attach();rpc=script.exports_sync;print('PREPARE',rpc.prepare(),flush=True);rpc.simulate();time.sleep(1);meta=rpc.checkpoint();print('CHECKPOINT',meta['target'],flush=True);s.detach();s=None
 subprocess.run([adb,'-s',serial,'shell','am','force-stop',package],check=True)
 subprocess.run([adb,'-s',serial,'shell','am','start','-W','-n',package+'/jp.syoboi.a2chMate.activity.HomeActivity'],check=True)
 time.sleep(4);s,script=attach();rpc=script.exports_sync;after=rpc.inspect();print('AFTER_RESTART',after,flush=True)
 assert after['number']==meta['target']['number'],(after,meta['target'])
 assert abs(after['offset']-meta['target']['offset'])<=2,(after,meta['target'])
 print('PASS actual process stop/start retains response and pixel offset with both link cards ON',flush=True)
finally:
 if meta:
  if s is None:s,script=attach();rpc=script.exports_sync
  print('RESTORE',rpc.restore_state(json.dumps(meta)),flush=True)
 if s:s.detach()
