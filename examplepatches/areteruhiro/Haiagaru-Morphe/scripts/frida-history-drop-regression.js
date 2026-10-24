Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 // Fixture isolates native evidence and never contacts a server. Returning a
 // fixed result from dropped(Object) avoids invoking 242's native URL model
 // through Frida's reflective test bridge; droppedUrl is only used to model
 // the already-confirmed sample row at the last assertion.
 const status=Java.use('app.morphe.extension.chmate.DroppedThreadStatus');
 status.dropped.implementation=function(){return false;};
 status.droppedUrl.implementation=function(url){return String(url).includes('/poverty/1792155688');};
 try {
  Java.openClassFile('/data/local/tmp/history-drop-regression-v4.dex').load();
  console.log(Java.use('app.morphe.extension.chmate.HistoryDropRegression').run(app));
 } catch(e){console.log('FAIL '+e.stack);if(e.$h)console.log(Java.use('android.util.Log').getStackTraceString(e));}
 finally {status.dropped.implementation=null;status.droppedUrl.implementation=null;}
});
