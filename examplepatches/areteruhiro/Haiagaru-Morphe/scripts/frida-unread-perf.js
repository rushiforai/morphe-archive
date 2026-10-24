// Synthetic native row only; leaves preferences, read positions and history intact.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const D=Java.use('app.morphe.extension.chmate.DroppedThreadStatus');
 const method=D.rowUrl.overload('java.lang.Object','android.content.Context');let calls=0;
 method.implementation=function(row,c){calls++;return method.call(this,row,c);};
 try{
  Java.openClassFile('/data/local/tmp/haiagaru-unread-perf.dex').load();
  const started=Date.now();console.log(Java.use('app.morphe.extension.chmate.HiddenNgUnreadNativeRowTest').run(app));
  console.log(Java.use('app.morphe.extension.chmate.HiddenNgUnreadAndroidTest').run(app));
  console.log('UNREAD_NATIVE_URL_RESOLUTIONS='+calls+' harnessElapsedMs='+(Date.now()-started));
 }catch(e){console.log('FAIL '+e);if(e.$h)console.log(Java.use('android.util.Log').getStackTraceString(e));}
 finally{method.implementation=null;console.log('UNREAD_PERF_HOOK_REMOVED');}
});
