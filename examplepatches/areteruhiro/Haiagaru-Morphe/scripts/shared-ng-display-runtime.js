/* Exercise the shared-NG aboon display default and both map modes without opening a WebView. */
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),S=Java.use('app.morphe.extension.chmate.SharedNg'),H=Java.use('app.morphe.extension.chmate.SharedNgHttp');
 if(!/[.]reporter(191|226|242)$/.test(String(app.getPackageName()))){reject('isolated reporter app required');return;}
 const p=app.getSharedPreferences('haiagaru.shared-ng',0),had=p.contains('showAboon'),saved=p.getBoolean('showAboon',true),request=H.request.overload('java.lang.String','java.lang.String','java.lang.String');request.implementation=function(){throw Java.use('java.io.IOException').$new('network blocked by Frida test');};
 const checks=[];function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 try{
  S.initialize(app);p.edit().remove('showAboon').commit();S.reload();check(Number(S.hiddenMapFlag())===8,'unset preference defaults to visible aboon');
  p.edit().putBoolean('showAboon',false).commit();S.reload();check(Number(S.hiddenMapFlag())===0x1000,'OFF selects transparent aboon');
  p.edit().putBoolean('showAboon',true).commit();S.reload();check(Number(S.hiddenMapFlag())===8,'ON selects visible aboon');
  resolve({checks,networkRequestsBlocked:true});
 }catch(e){reject(String(e.stack||e));}
 finally{const edit=p.edit();if(had)edit.putBoolean('showAboon',saved);else edit.remove('showAboon');edit.commit();S.reload();request.implementation=null;console.log('SHARED_NG_DISPLAY_PREF_RESTORED');}
}));}};
