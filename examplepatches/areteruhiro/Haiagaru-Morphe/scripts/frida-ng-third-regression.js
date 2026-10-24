Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 Java.openClassFile('/data/local/tmp/haiagaru-ng-third.dex').load();
 const H=Java.use('app.morphe.extension.chmate.HiddenNgUnread'),D=Java.use('app.morphe.extension.chmate.DroppedThreadStatus');
 const lookup=D.rowUrl.overload('java.lang.Object','android.content.Context');let unrelated=0;
 lookup.implementation=function(row,c){const name=String(row.getClass().getName());const n=name==='o.onAdDisplayed$setIcon'?'h':name==='o.Yy2$open'?'g':'b';try{const f=row.getClass().getDeclaredField(n);f.setAccessible(true);const id=Number(f.getLong(row));if(id>=1999999000&&id<2000000000)unrelated++;}catch(_){}return lookup.call(this,row,c);};
 Java.scheduleOnMainThread(()=>{try{
  console.log(Java.use('app.morphe.extension.chmate.HiddenNgUnreadRebuildTest').run(app));
  console.log(Java.use('app.morphe.extension.chmate.HiddenNgUnreadNativeRowTest').run(app));
  console.log(Java.use('app.morphe.extension.chmate.HiddenNgUnreadAndroidTest').run(app));
  if(unrelated!==0)throw Error('Unrelated native URL lookups='+unrelated);
  console.log('PASS unrelated1000NativeUrlLookups=0');
 }catch(e){console.log('FAIL '+e);if(e.$h)console.log(Java.use('android.util.Log').getStackTraceString(e));}
 finally{lookup.implementation=null;console.log('NG_THIRD_REGRESSION_COMPLETE');}});
});
