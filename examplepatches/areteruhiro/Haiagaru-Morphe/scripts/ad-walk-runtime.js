// A detached synthetic View tree, fixture package only; restores both settings.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
 const a=Java.use('android.app.ActivityThread').currentApplication();if(String(a.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.migration191242')throw Error('fixture only');
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),p=a.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),had=p.contains('adClass'),old=p.getString('adClass',null),hideHad=p.contains('hideAd'),hideOld=p.getBoolean('hideAd',true),walk=H.hideRememberedAdViews.overload('android.view.View'),clock=Java.use('android.os.SystemClock');
 const timings=[],checks=[];function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 try{
  p.edit().remove('adClass').putBoolean('hideAd',true).commit();
  function tree(count){const root=Java.use('android.widget.LinearLayout').$new(a);for(let i=0;i<count;i++)root.addView(Java.use('android.view.View').$new(a));return root;}
  const root=tree(200);for(let i=0;i<3;i++){const start=Number(clock.elapsedRealtimeNanos());check(!walk.call(H,root),'plain Views remain visible '+i);timings.push((Number(clock.elapsedRealtimeNanos())-start)/1e6);}
  const fallback=String(H.defaultAdClass());
  for(const stored of ['o.qheCC','o.setUseHandlerThreadForCallbacks','o.zzbgb','o.zzexb']){p.edit().putString('adClass',stored).commit();check(String(H.configuredAdClass(p))===(H.classExists(stored)?stored:fallback),'built-in migration '+stored);}
  p.edit().putString('adClass','com.example.CustomAdContainer').commit();check(String(H.configuredAdClass(p))==='com.example.CustomAdContainer','custom class preserved verbatim');
  const group=Java.use('android.widget.LinearLayout').$new(a),text=Java.use('android.widget.TextView').$new(a),button=Java.use('android.widget.Button').$new(a);group.addView(text);group.addView(button);
  p.edit().putString('adClass','android.widget.TextView').commit();check(walk.call(H,group)&&text.getVisibility()===8&&button.getVisibility()===0&&group.getVisibility()===0,'custom target hides only matching child');
  text.setVisibility(0);p.edit().putString('adClass','android.widget.Button').commit();check(walk.call(H,group)&&button.getVisibility()===8&&text.getVisibility()===0,'changed custom target takes effect on next walk');
  resolve({views:201,walkMs:timings,defaultAdClass:fallback,checks});
 }finally{const e=p.edit();if(had)e.putString('adClass',old);else e.remove('adClass');if(hideHad)e.putBoolean('hideAd',hideOld);else e.remove('hideAd');e.commit();}
 }catch(e){reject(Error(String(e.stack||e)));}})));}};
