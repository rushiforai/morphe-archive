Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(?:resumefix226|settingsfix191|resumefix242|responsearchive242)$/.test(app.getPackageName().toString()))throw Error('Verification app required');
 Java.openClassFile('/data/local/tmp/haiagaru-settings-history-tests.dex').load();
 let found=false;
 Java.choose('app.morphe.extension.chmate.HaiagaruSettingsActivity',{
  onMatch:function(a){if(found||a.isDestroyed()||a.isFinishing())return;found=true;
   const activity=Java.retain(a);
   Java.scheduleOnMainThread(function(){
    try{console.log(Java.use('app.morphe.extension.chmate.SettingsHistoryAndroidTest').run(activity));}
    catch(e){console.log('FAIL '+e.stack);}
   });
  },onComplete:function(){if(!found)console.log('FAIL settings screen not open');}
 });
});
