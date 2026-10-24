// Fixture-only list transforms; original preferences are restored by the Java test.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Isolated package required');
    Java.openClassFile('/data/local/tmp/haiagaru-history-context-tests.dex').load();
    try{console.log(Java.use('app.morphe.extension.chmate.DroppedThreadsAndroidTest').run(app));}
    catch(e){console.log('FAIL HISTORY '+e.stack);}
});
