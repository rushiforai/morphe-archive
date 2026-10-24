// Original state recorded by the first setup: both preferences were absent.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.settingsfix191')throw Error('191 test package required');
 app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0).edit().remove('nativeToolTabs').remove('hissiViewerSwipeHistory').commit();
 console.log('RESTORED_ORIGINAL_ABSENT_PREFS');
});
