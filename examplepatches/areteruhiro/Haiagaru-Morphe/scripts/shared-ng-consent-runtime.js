rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),S=Java.use('app.morphe.extension.chmate.SharedNg'),P=Java.use('app.morphe.extension.chmate.PersonalNgSubmissions'),D=Java.use('app.morphe.extension.chmate.HaiagaruDialog'),VG=Java.use('android.view.ViewGroup'),Sw=Java.use('android.widget.Switch');
 if(!/[.](settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName()))){reject('verification package required');return;}
 const personal=app.getSharedPreferences('haiagaru.personal-ng-submissions',0),shared=app.getSharedPreferences('haiagaru.shared-ng',0),saved=Java.retain(personal.getAll()),hadEnabled=shared.contains('enabled'),oldEnabled=shared.getBoolean('enabled',false),dialogs=[];let checks=[],activity;
 const collect=P.collect.overload();collect.implementation=function(){};
 const changed=P.changed.overload();changed.implementation=function(){};
 function check(v,label){if(!v)throw Error(label);checks.push(label);}
 function walk(v,out){out.push(v);if(VG.class.isInstance(v)){const g=Java.cast(v,VG);for(let i=0;i<g.getChildCount();i++)walk(g.getChildAt(i),out);}return out;}
 function find(title){let found;Java.choose(D.$className,{onMatch(d){const f=D.class.getDeclaredField('spec');f.setAccessible(true);const b=f.get(d);const t=b.getClass().getDeclaredField('title');t.setAccessible(true);if(d.isShowing()&&String(t.get(b))===title)found=Java.retain(d);},onComplete(){}});if(!found)throw Error('dialog missing '+title);dialogs.push(found);return found;}
 function views(d){const f=D.class.getDeclaredField('spec');f.setAccessible(true);const b=f.get(d),v=b.getClass().getDeclaredField('view');v.setAccessible(true);return walk(Java.cast(v.get(b),Java.use('android.view.View')),[]);}
 function main(fn){return new Promise((ok,fail)=>Java.scheduleOnMainThread(()=>{try{ok(fn());}catch(e){fail(e);}}));}
 function restore(){const e=personal.edit().clear(),it=saved.entrySet().iterator();while(it.hasNext()){const row=Java.cast(it.next(),Java.use('java.util.Map$Entry')),k=String(row.getKey()),v=row.getValue(),t=String(v.getClass().getName());if(t==='java.lang.Boolean')e.putBoolean(k,Java.cast(v,Java.use(t)).booleanValue());else if(t==='java.lang.Long')e.putLong(k,Java.cast(v,Java.use(t)).longValue());else if(t==='java.lang.Integer')e.putInt(k,Java.cast(v,Java.use(t)).intValue());else if(t==='java.lang.String')e.putString(k,String(v));else if(Java.use('java.util.Set').class.isInstance(v))e.putStringSet(k,Java.cast(v,Java.use('java.util.Set')));else throw Error('unsupported pref '+t);}e.commit();const x=shared.edit();if(hadEnabled)x.putBoolean('enabled',oldEnabled);else x.remove('enabled');x.commit();S.reload();}
 (async()=>{let outcome,failure;try{
 Java.choose('jp.syoboi.a2chMate.activity.HomeActivity',{onMatch(a){if(!a.isFinishing())activity=Java.retain(a);},onComplete(){}});if(!activity)throw Error('home required');
 await main(()=>{personal.edit().putBoolean('consent',false).commit();shared.edit().putBoolean('enabled',false).commit();S.reload();S.settings(activity);});
 let on;await main(()=>{const d=find('オンライン共有NG');on=Java.retain(views(d).find(v=>Sw.class.isInstance(v)&&String(Java.cast(v,Sw).getText())==='オンライン共有NGを使う'));Java.cast(on,Sw).setChecked(true);});
 await new Promise(r=>setTimeout(r,500));
 await main(()=>{const d=find('個人NGの送信に同意'),toggle=views(d).find(v=>Sw.class.isInstance(v));check(Java.cast(toggle,Sw).isChecked(),'consent defaults personal send ON');check(!personal.getBoolean('consent',false)&&!shared.getBoolean('enabled',false),'neither saved before consent');d.getButton(-2).performClick();});
 await new Promise(r=>setTimeout(r,500));
 await main(()=>{check(!personal.getBoolean('consent',false)&&!shared.getBoolean('enabled',false),'cancel leaves both OFF');Java.cast(on,Sw).setChecked(true);});
 await new Promise(r=>setTimeout(r,500));
 await main(()=>find('個人NGの送信に同意').getButton(-1).performClick());
 await new Promise(r=>setTimeout(r,500));
 await main(()=>{check(personal.getBoolean('consent',false)&&shared.getBoolean('enabled',false),'save enables personal send and receive');Java.cast(on,Sw).setChecked(false);check(!shared.getBoolean('enabled',false),'receive switch OFF saves');});
 outcome={checks,realPersonalUploads:false};
 }catch(e){failure=String(e.stack);}finally{await main(()=>{for(const d of dialogs)if(d.isShowing())d.dismiss();restore();});collect.implementation=null;changed.implementation=null;console.log('CONSENT_PREFS_RESTORED');}if(failure)reject(failure);else resolve(outcome);})();
}));}};
