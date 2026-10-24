Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 const intent=Java.use('android.content.Intent').$new(app,Java.use('app.morphe.extension.chmate.HaiagaruSettingsActivity').class);
 intent.addFlags(0x10000000);
 Java.scheduleOnMainThread(function(){app.startActivity(intent);console.log('SETTINGS_OPENED');});
});
