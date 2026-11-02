// Isolated emulator fixture only; restore every existing preference map in finally.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.migration191242'){reject(Error('fixture app required'));return;}
 const File=Java.use('java.io.File'),Hash=Java.use('java.util.HashMap'),Entry=Java.use('java.util.Map$Entry');
 const names=new Set(['io.github.areteruhiro.chmate.haiagaru.ui-config','haiagaru.local-auto-backup','haiagaru.ads-only-preset','haiagaru.poster-highlight','haiagaru.programmable-ng','haiagaru.hidden-id-ng','haiagaru.mega-sync.options','haiagaru_imgur_web','haiagaru_upload_hosts','haiagaru_replace_str','haiagaru_response_actions']);
 for(const f of File.$new(app.getApplicationInfo().dataDir.value,'shared_prefs').listFiles()||[]){const n=String(f.getName());if(n.endsWith('.xml'))names.add(n.slice(0,-4));}
 const saved=Array.from(names,n=>[n,Hash.$new(app.getSharedPreferences(n,0).getAll())]);
 const checks=[],dialogs=[];let captured=null,showHook=null;function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 function restore(){for(const [n,map] of saved){const e=app.getSharedPreferences(n,0).edit().clear(),it=map.entrySet().iterator();while(it.hasNext()){const row=Java.cast(it.next(),Entry),k=String(row.getKey()),v=row.getValue(),type=String(v.getClass().getName());if(type==='java.lang.Boolean')e.putBoolean(k,Java.cast(v,Java.use(type)).booleanValue());else if(type==='java.lang.Integer')e.putInt(k,Java.cast(v,Java.use(type)).intValue());else if(type==='java.lang.Long')e.putLong(k,Java.cast(v,Java.use(type)).longValue());else if(type==='java.lang.Float')e.putFloat(k,Java.cast(v,Java.use(type)).floatValue());else if(type==='java.lang.String')e.putString(k,String(v));else e.putStringSet(k,Java.cast(v,Java.use('java.util.Set')));}if(!e.commit())throw Error('fixture restore failed');}}
 try{
  let a=null;for(const x of Java.use('android.app.ActivityThread').currentActivityThread().mActivities.value.values().toArray()){const r=Java.cast(x,Java.use('android.app.ActivityThread$ActivityClientRecord'));if(!r.paused.value)a=r.activity.value;}check(!!a,'activity available');
  const L=Java.use('app.morphe.extension.chmate.LightweightSetup'),M=Java.use('app.morphe.extension.chmate.MinimalSetup'),D=Java.use('app.morphe.extension.chmate.HaiagaruDialog'),p=app.getSharedPreferences('haiagaru.local-auto-backup',0),store=app.getSharedPreferences('haiagaru.ads-only-preset',0);
  showHook=D.show.overload();showHook.implementation=function(){const result=showHook.call(this),d=Java.retain(this);dialogs.push(d);if(String(d.spec.value.title.value)==='Haiagaruの初期設定')captured=d;return result;};
  for(const on of [true,false]){
   p.edit().putBoolean('enabled',on).putString('tree','content://fixture-preserved').putInt('hours',12).putInt('keep',5).putInt('categories',8).putLong('last',Java.use('java.lang.System').currentTimeMillis()).putString('files','[]').commit();const before=Hash.$new(p.getAll());
   store.edit().remove('before').commit();L.apply(a);check(before.equals(p.getAll()),'ads-only apply preserves backup '+on);L.restore(a);check(before.equals(p.getAll()),'ads-only restore preserves backup '+on);
   store.edit().putString('before',JSON.stringify({'haiagaru.local-auto-backup':{enabled:!on}})).commit();L.restore(a);check(before.equals(p.getAll()),'legacy preset snapshot preserves current backup '+on);
   captured=null;M.show(a);
   // Release optimization can inline Dialog.show at this call site.
   Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch(d){if(d.isShowing()&&String(d.spec.value.title.value)==='Haiagaruの初期設定')captured=Java.retain(d);},onComplete(){}});
   // The callback runs synchronously here so no fixture preferences can escape finally.
   check(!!captured,'minimal setup dialog captured '+on);const d=captured,spec=d.spec.value,root=Java.cast(spec.view.value,Java.use('android.view.ViewGroup'));let found=false;for(let i=0;i<root.getChildCount();i++){const v=root.getChildAt(i);if(Java.use('android.widget.Switch').class.isInstance(v)){Java.cast(v,Java.use('android.widget.Switch')).setChecked(true);found=true;}}check(found,'minimal setup selected '+on);const buttons=Java.cast(spec.buttons.value,Java.use('java.util.Map')),pair=buttons.get(Java.use('java.lang.Integer').valueOf(-1)),Listener=Java.use('android.content.DialogInterface$OnClickListener');let callback=null;for(const f of pair.getClass().getDeclaredFields()){f.setAccessible(true);const value=f.get(pair);if(value&&Listener.class.isInstance(value))callback=Java.cast(value,Listener);}check(!!callback,'minimal setup callback found '+on);callback.onClick(d,-1);d.dismissNow();
   check(before.equals(p.getAll()),'minimal setup preserves backup '+on);
  }
  resolve({passed:checks.length,checks});
 }catch(e){reject(Error(String(e.stack||e)));}
  finally{try{restore();for(const d of dialogs)if(d.isShowing())d.dismissNow();Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch(d){if(d.isShowing())d.dismissNow();},onComplete(){}});}catch(e){send({cleanupError:String(e)});}finally{if(showHook)showHook.implementation=null;}}
})));}};
