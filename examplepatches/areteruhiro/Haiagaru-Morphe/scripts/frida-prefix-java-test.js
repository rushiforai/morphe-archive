Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!String(app.getPackageName()).endsWith('.settingsfix191'))throw Error('Test package required');
 Java.openClassFile('/data/local/tmp/haiagaru-prefix-tests.dex').load();
 Java.scheduleOnMainThread(()=>{try{const a=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);if(!a)throw Error('No resumed activity');console.log(Java.use('app.morphe.extension.chmate.PrefixFilterAndroidTest').run(a));}catch(e){console.log('FAIL '+e.stack);}});
});
