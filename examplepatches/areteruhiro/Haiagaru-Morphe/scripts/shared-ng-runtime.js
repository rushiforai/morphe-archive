rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg)){reject('isolated package required');return;}
 const P=Java.use('app.morphe.extension.chmate.PersonalNgSubmissions'),S=Java.use('app.morphe.extension.chmate.SharedNg'),Store=Java.use('app.morphe.extension.chmate.NativeNgStore'),Entry=Java.use('app.morphe.extension.chmate.NativeNgStore$Entry'),List=Java.use('java.util.ArrayList'),JSON=Java.use('org.json.JSONObject');
 const prefs=app.getSharedPreferences('haiagaru.personal-ng-submissions',0),saved=prefs.getAll();let checks=[],reports=[],enabled=true;
 function check(x,label){if(!x)throw Error(label);checks.push(label);}
 const entries=Store.entries.overload(),request=S.request.overload('java.lang.String','java.lang.String','org.json.JSONObject');
 try{
  check(!prefs.getBoolean('consent',false),'initial consent OFF');
  entries.implementation=function(){const list=List.$new();if(enabled){const item=this.item('synthetic-runtime',16,0,'https://egg.5ch.io/android/');list.add(Entry.$new(item));}return list;};
  request.implementation=function(method,url,body){check(String(method)==='POST','intercepted POST before network');const data=globalThis.JSON.parse(String(body));reports.push(data);return JSON.$new(globalThis.JSON.stringify({ok:true,ack:data.reports.map(r=>r.operationId)}));};
  P.collect();check(reports.length===0,'no submission before consent');
  prefs.edit().clear().putBoolean('consent',true).putBoolean('type.ID',false).putBoolean('type.NAME',false).putBoolean('type.WORD',true).commit();
  P.collect();check(reports.length===1&&reports[0].reports.length===1,'existing synthetic word submitted once');
  check(reports[0].reports[0].kind==='keyword'&&reports[0].reports[0].board==='5ch/android','native item adapter preserves kind and board');
  prefs.edit().putLong('retryAfter',0).commit();P.collect();check(reports.length===1,'unchanged snapshot not submitted again');
  enabled=false;prefs.edit().putLong('retryAfter',0).commit();P.collect();check(reports.length===2&&reports[1].reports[0].action==='delete','native removal withdraws candidate');
  prefs.edit().putBoolean('consent',false).commit();P.collect();check(reports.length===2,'OFF stops collection');
  resolve({checks,network:'all requests intercepted, synthetic data only'});
 }catch(e){reject(String(e.stack));}finally{
  entries.implementation=null;request.implementation=null;const edit=prefs.edit().clear(),it=saved.entrySet().iterator();while(it.hasNext()){const row=it.next(),key=String(row.getKey()),v=row.getValue(),name=String(v.getClass().getName());if(name==='java.lang.String')edit.putString(key,String(v));else if(name==='java.lang.Boolean')edit.putBoolean(key,String(v)==='true');else if(name==='java.lang.Long')edit.putLong(key,parseInt(String(v)));else if(name==='java.lang.Integer')edit.putInt(key,parseInt(String(v)));else if(name==='java.lang.Float')edit.putFloat(key,parseFloat(String(v)));else edit.putStringSet(key,Java.cast(v,Java.use('java.util.Set')));}edit.commit();console.log('PERSONAL_PREFS_RESTORED; native store was never changed');
 }
}));}};
