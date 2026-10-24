// Real thread smoke test; temporary feature preferences restored after one minute.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification only');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const keys=['popularReplyDirect','popularReplyPopup'],saved=keys.map(k=>({k,had:prefs.contains(k),v:prefs.getBoolean(k,false)}));
 const P=Java.use('app.morphe.extension.chmate.PopularReplies'),E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters');
 Java.scheduleOnMainThread(function(){try{
  const f=E.class.getDeclaredField('OWNERS');f.setAccessible(true);const owners=Java.cast(f.get(null),Java.use('java.util.List'));
  for(let i=owners.size()-1;i>=0;i--){const owner=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!owner)continue;
   const view=owner.getClass().getMethod('getView',Java.array('java.lang.Class',[])).invoke(owner,Java.array('java.lang.Object',[]));if(!view||!Java.cast(view,Java.use('android.view.View')).isShown())continue;
   prefs.edit().putBoolean(keys[0],false).putBoolean(keys[1],true).commit();E.refreshPopularity();
   const snapshots=Java.use('app.morphe.extension.chmate.PopularNativeRows').class.getDeclaredField('snapshots');snapshots.setAccessible(true);console.log('CAPTURED_NATIVE_LAYOUTS='+Java.cast(snapshots.get(null),Java.use('java.util.List')).size());
   P.show(owner);console.log('READY_STANDARD_POPUP_REAL_THREAD');return;
  }throw Error('No visible response owner');
 }catch(error){console.log('FAIL '+error.stack);}});
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(function(){const e=prefs.edit();saved.forEach(s=>{if(s.had)e.putBoolean(s.k,s.v);else e.remove(s.k);});e.commit();E.refreshPopularity();console.log('POPULAR_LIVE_PREFERENCES_RESTORED');})),60000);
});
