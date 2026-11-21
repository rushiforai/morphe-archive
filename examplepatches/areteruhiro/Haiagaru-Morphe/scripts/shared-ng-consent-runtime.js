rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),S=Java.use('app.morphe.extension.chmate.SharedNg'),P=Java.use('app.morphe.extension.chmate.PersonalNgSubmissions'),H=Java.use('app.morphe.extension.chmate.SharedNgHttp'),D=Java.use('app.morphe.extension.chmate.HaiagaruDialog'),VG=Java.use('android.view.ViewGroup'),Sw=Java.use('android.widget.Switch'),Button=Java.use('android.widget.Button');
 if(!/[.]reporter(191|226|242)$/.test(String(app.getPackageName()))){reject('isolated reporter app required');return;}
 const personal=app.getSharedPreferences('haiagaru.personal-ng-submissions',0),shared=app.getSharedPreferences('haiagaru.shared-ng',0),savedPersonal=Java.retain(personal.getAll()),savedShared=Java.retain(shared.getAll()),dialogs=[];let checks=[],activity;
 const collect=P.collect.overload();collect.implementation=function(){};
 const changed=P.changed.overload();changed.implementation=function(){};
 const schedule=S.schedule.overload();schedule.implementation=function(){};
 const request=H.request.overload('java.lang.String','java.lang.String','java.lang.String');request.implementation=function(){throw Java.use('java.io.IOException').$new('network blocked by Frida test');};
 function check(v,label){if(!v)throw Error(label);checks.push(label);}
 function walk(v,out){out.push(v);if(VG.class.isInstance(v)){const g=Java.cast(v,VG);for(let i=0;i<g.getChildCount();i++)walk(g.getChildAt(i),out);}return out;}
 function find(title){let found;Java.choose(D.$className,{onMatch(d){const f=D.class.getDeclaredField('spec');f.setAccessible(true);const spec=f.get(d),t=spec.getClass().getDeclaredField('title');t.setAccessible(true);if(d.isShowing()&&String(t.get(spec))===title)found=Java.retain(d);},onComplete(){}});if(!found)throw Error('dialog missing '+title);dialogs.push(found);return found;}
 function views(d){const f=D.class.getDeclaredField('spec');f.setAccessible(true);const spec=f.get(d),vf=spec.getClass().getDeclaredField('view');vf.setAccessible(true);return walk(Java.cast(vf.get(spec),Java.use('android.view.View')),[]);}
 function main(fn){return new Promise((ok,fail)=>Java.scheduleOnMainThread(()=>{try{ok(fn());}catch(e){fail(e);}}));}
 function restorePrefs(p,snapshot){const edit=p.edit().clear(),it=snapshot.entrySet().iterator();while(it.hasNext()){const row=Java.cast(it.next(),Java.use('java.util.Map$Entry')),k=String(row.getKey()),v=row.getValue(),t=String(v.getClass().getName());if(t==='java.lang.Boolean')edit.putBoolean(k,Java.cast(v,Java.use(t)).booleanValue());else if(t==='java.lang.Long')edit.putLong(k,Java.cast(v,Java.use(t)).longValue());else if(t==='java.lang.Integer')edit.putInt(k,Java.cast(v,Java.use(t)).intValue());else if(t==='java.lang.String')edit.putString(k,String(v));else if(Java.use('java.util.Set').class.isInstance(v))edit.putStringSet(k,Java.cast(v,Java.use('java.util.Set')));else throw Error('unsupported pref '+t);}if(!edit.commit())throw Error('prefs restore failed');}
 (async()=>{let outcome,failure;
  try{
   Java.choose('jp.syoboi.a2chMate.activity.ResListActivity',{onMatch(a){if(!a.isFinishing())activity=Java.retain(a);},onComplete(){}});
   if(!activity)Java.choose('jp.syoboi.a2chMate.activity.HomeActivity',{onMatch(a){if(!a.isFinishing())activity=Java.retain(a);},onComplete(){}});
   if(!activity)throw Error('live ChMate activity required');
   await main(()=>{personal.edit().putBoolean('consent',false).commit();shared.edit().remove('showAboon').commit();S.reload();S.settings(activity);});
   let dialog,on,display;
   await main(()=>{dialog=find('オンライン共有NG（開発中）');const all=views(dialog);on=Java.retain(all.find(v=>Sw.class.isInstance(v)&&String(Java.cast(v,Sw).getText())==='オンライン共有NGを使う'));if(!on)throw Error('receive switch missing');});
   await main(()=>{display=Java.retain(views(dialog).find(v=>Sw.class.isInstance(v)&&String(Java.cast(v,Sw).getText())==='共有NGの一致レスを「あぼーん」で表示'));if(!display)throw Error('shared aboon display switch missing');
    check(Java.cast(display,Sw).isChecked(),'shared NG defaults to visible aboon');check(Number(S.hiddenMapFlag())===8,'visible mode selects native visible-aboon flag');
    Java.cast(display,Sw).setChecked(false);check(!shared.getBoolean('showAboon',true)&&Number(S.hiddenMapFlag())===0x1000,'OFF switches shared NG to transparent aboon');
    Java.cast(display,Sw).setChecked(true);check(shared.getBoolean('showAboon',false)&&Number(S.hiddenMapFlag())===8,'ON restores visible aboon mode');
   });
   await main(()=>{if(Java.cast(on,Sw).isChecked())Java.cast(on,Sw).setChecked(false);Java.cast(on,Sw).setChecked(true);});
   await new Promise(r=>setTimeout(r,500));
   await main(()=>{
    check(shared.getBoolean('enabled',false),'receive-only switch enables shared NG');
    check(!personal.getBoolean('consent',false),'receiving never opts into personal NG upload');
    let consentDialog=false;Java.choose(D.$className,{onMatch(d){const f=D.class.getDeclaredField('spec');f.setAccessible(true);const spec=f.get(d),t=spec.getClass().getDeclaredField('title');t.setAccessible(true);if(d.isShowing()&&String(t.get(spec))==='個人NGの送信設定')consentDialog=true;},onComplete(){}});
    check(!consentDialog,'first-use personal NG dialog is absent');
    const personalButton=views(dialog).find(v=>Button.class.isInstance(v)&&String(Java.cast(v,Button).getText()).startsWith('個人NGの送信設定'));
    check(personalButton!==undefined,'personal upload remains separately accessible');
    Java.cast(on,Sw).setChecked(false);
    check(!shared.getBoolean('enabled',true),'receive switch can be turned OFF');
    outcome={checks,personalUpload:false,networkRequestsBlocked:true};
   });
  }catch(e){failure=String(e.stack||e);}
  finally{
   try{await main(()=>{for(const d of dialogs)if(d.isShowing())d.dismiss();restorePrefs(personal,savedPersonal);restorePrefs(shared,savedShared);S.reload();});}catch(e){failure=(failure||'')+'\ncleanup: '+String(e);}
   collect.implementation=null;changed.implementation=null;schedule.implementation=null;request.implementation=null;console.log('SHARED_NG_PREFS_RESTORED');
  }
  if(failure)reject(failure);else resolve(outcome);
 })();
}));}};
