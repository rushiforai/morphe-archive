// Actual response fragment. Temporary display preferences restored after one minute.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification only');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const keys=['bottomQuickFilterPanel','floatingQuickFilterButton'],saved=keys.map(k=>({k,had:p.contains(k),v:p.getBoolean(k,false)}));
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters');
 Java.scheduleOnMainThread(function(){try{
  const a=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
  p.edit().putBoolean(keys[0],true).putBoolean(keys[1],true).commit();E.updateOptions(a);console.log('READY real response floating button');
 }catch(e){console.log('FAIL '+e.stack);}});
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(function(){
  const e=p.edit();saved.forEach(s=>{if(s.had)e.putBoolean(s.k,s.v);else e.remove(s.k);});e.commit();E.updateOptions(Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null));console.log('LIVE_FILTER_PREFERENCES_RESTORED');
 })),60000);
});
