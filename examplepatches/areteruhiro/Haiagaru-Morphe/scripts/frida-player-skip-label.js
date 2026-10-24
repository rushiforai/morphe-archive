Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification only');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),had=p.contains('videoDoubleTapSeconds'),old=p.getInt('videoDoubleTapSeconds',10);
 Java.scheduleOnMainThread(function(){try{
  const a=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
  if(!a||String(a.getClass().getName())!=='app.morphe.extension.chmate.VideoViewerActivity')throw Error('No video Activity');
  p.edit().putInt('videoDoubleTapSeconds',30).commit();
  const f=a.getClass().getDeclaredField('controls');f.setAccessible(true);Java.cast(f.get(a),Java.use('android.widget.MediaController')).show(0);
  console.log('READY 30-second labels');
 }catch(e){console.log('FAIL '+e.stack);}});
 setTimeout(()=>Java.perform(function(){const e=p.edit();if(had)e.putInt('videoDoubleTapSeconds',old);else e.remove('videoDoubleTapSeconds');e.commit();console.log('LABEL_PREFERENCE_RESTORED');}),50000);
});
