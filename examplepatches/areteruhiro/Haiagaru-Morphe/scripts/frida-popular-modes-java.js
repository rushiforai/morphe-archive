Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.openClassFile('/data/local/tmp/popular-modes-test-v3.dex').load();
 try{console.log(Java.use('app.morphe.extension.chmate.PopularModesAndroidTest').run(app));}
 catch(e){console.log('FAIL '+e);if(e.$h)console.log(Java.use('android.util.Log').getStackTraceString(e));}
});
