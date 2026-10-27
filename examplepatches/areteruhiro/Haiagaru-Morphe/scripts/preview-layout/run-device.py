"""Run original and repaired layout code in isolated Android loaders, without changing app settings."""
import json,pathlib,subprocess,sys
import frida,frida_tools
serial=sys.argv[1]
adb=str(pathlib.Path('D:/Android/Sdk/platform-tools/adb.exe'))
package='jp.co.airfront.android.a2chMate.haiagaru.resumefix226'
pid=int(subprocess.check_output([adb,'-s',serial,'shell','pidof',package]).decode().strip().split()[0])
bridge=pathlib.Path(frida_tools.__file__).parent/'bridges'/'java.js'
source=bridge.read_text(encoding='utf-8')+'\nconst Java=bridge;\n'+r'''
rpc.exports.run=function(mode){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 try{
  const app=Java.use('android.app.ActivityThread').currentApplication();
  const loader=Java.use('dalvik.system.DexClassLoader').$new('/data/local/tmp/haiagaru-preview-layout-'+mode+'-v2.dex',String(app.getCodeCacheDir().getAbsolutePath()),null,app.getClassLoader().getParent());
  const test=Java.ClassFactory.get(loader).use('app.morphe.extension.chmate.LayoutRestoreTest');
  try{test.run(test.context(app),mode==='baseline');}catch(error){throw Error(String(error)+'; '+test.messages.value);}
  const lines=[];for(let i=0;i<test.messages.value.size();i++)lines.push(String(test.messages.value.get(i)));
  resolve({mode:mode,checks:test.checks.value,lines:lines});
 }catch(error){reject(new Error(String(error.stack||error)));}
})));};
rpc.exports.exercise=function(name){return new Promise((resolve,reject)=>Java.perform(()=>{
 let test,tries=0;
 Java.scheduleOnMainThread(()=>{try{
  const app=Java.use('android.app.ActivityThread').currentApplication();
  const loader=Java.use('dalvik.system.DexClassLoader').$new('/data/local/tmp/haiagaru-preview-layout-fixed-v2.dex',String(app.getCodeCacheDir().getAbsolutePath()),null,app.getClassLoader().getParent());
  const factory=Java.ClassFactory.get(loader),context=factory.use('app.morphe.extension.chmate.LayoutRestoreTest').context(app);
  test=factory.use('app.morphe.extension.chmate.'+name);test.start(context);
 }catch(error){reject(new Error(String(error)));}});
 const timer=setInterval(()=>Java.perform(()=>{
  if(!test)return;
  const result=String(test.result.value);
  if(result.startsWith('PASS')||result.startsWith('FAIL')||++tries>200){clearInterval(timer);resolve(result);}
 }),100);
}));};
'''
session=frida.get_device(serial,timeout=10).attach(pid)
try:
 script=session.create_script(source);script.load()
 results=[]
 for mode in ('baseline','fixed'):
  result=script.exports_sync.run(mode);results.append(result)
  print(json.dumps(result,ensure_ascii=False),flush=True)
 for name in ('PerformanceTest','RetryTest'):
  result=script.exports_sync.exercise(name);results.append({'exercise':name,'result':result});print(result,flush=True)
  if not result.startswith('PASS'):raise RuntimeError(result)
 pathlib.Path('build/preview-layout-device-result.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
finally:session.detach()
