import pathlib,subprocess,frida,frida_tools,json,sys,re,uuid
adb='D:/Android/Sdk/platform-tools/adb.exe';serial=sys.argv[1] if len(sys.argv)>1 else 'emulator-5558';package=sys.argv[2] if len(sys.argv)>2 else 'jp.co.airfront.android.a2chMate.haiagaru.resumefix242'
pid=int(subprocess.check_output([adb,'-s',serial,'shell','pidof',package]).decode().strip())
s=frida.get_device_manager().add_remote_device('127.0.0.1:27052').attach(pid)
bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js'
source=bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+pathlib.Path(sys.argv[3] if len(sys.argv)>3 else 'scripts/shared-ng-runtime.js').read_text(encoding='utf-8')
script=s.create_script(source);script.on('message',lambda m,d:print(json.dumps(m,ensure_ascii=False),flush=True));script.load()
if not re.fullmatch(r'[A-Za-z0-9_.]+',package):raise ValueError('Invalid verification package')
cache='/data/user/0/'+package+'/files/shared-ng-cache-v2.json.gz'
backup=cache+'.test-backup-'+uuid.uuid4().hex
restore_cache=len(sys.argv)>3 and 'receive' in sys.argv[3]
def privileged(command):return subprocess.run([adb,'-s',serial,'shell','su','-c',"'"+command+"'"],capture_output=True)
existed=False
if restore_cache:
 probe=privileged('test -f '+cache)
 if probe.returncode not in (0,1):raise RuntimeError('Cannot inspect cache; refusing test')
 existed=probe.returncode==0
 if existed:
  copy=privileged('cp -p '+cache+' '+backup)
  if copy.returncode:raise RuntimeError('Cannot back up cache; refusing test')
try:print(json.dumps(script.exports_sync.test(),ensure_ascii=False),flush=True)
finally:
 s.detach()
 if restore_cache:
  result=privileged(('mv '+backup+' '+cache) if existed else ('rm -f '+cache))
  if result.returncode:raise RuntimeError('Cache restore failed: '+result.stderr.decode(errors='replace'))
  print('Original cache restored',flush=True)
