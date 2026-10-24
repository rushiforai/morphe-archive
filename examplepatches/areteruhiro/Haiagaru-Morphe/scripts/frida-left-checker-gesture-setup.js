// Keep a disposable native checker tab open for real swipe reproduction.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.settingsfix191')throw Error('191 test package required');
 Java.classFactory.loader=app.getClassLoader();
 Java.scheduleOnMainThread(()=>{try{
  const H=Java.use('app.morphe.extension.chmate.Haiagaru'),T=Java.use('app.morphe.extension.chmate.NativeToolTabs');
  const host=T.manualHost(H.toolbarActivity(null)),p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
  console.log('PREVIOUS_NATIVE_TABS had='+p.contains('nativeToolTabs')+' value='+p.getBoolean('nativeToolTabs',false));
  p.edit().putBoolean('nativeToolTabs',true).commit();
  console.log('PREVIOUS_SWIPE had='+p.contains('hissiViewerSwipeHistory')+' value='+p.getInt('hissiViewerSwipeHistory',0));
  p.edit().putInt('hissiViewerSwipeHistory',2).commit();
  Java.choose('app.morphe.extension.chmate.NativeToolFragment',{onMatch(f){const n=Java.cast(f,Java.use('androidx.fragment.app.Fragment'));if(n.isResumed()&&String(n.getArguments().getString('_data')).startsWith('haiagaru-tool://hissi'))T.closeCurrentTab(host,f);},onComplete(){}});
  const intent=Java.use('android.content.Intent').$new();intent.setData(Java.use('android.net.Uri').parse('http://hissi.org/read.php/android/'));intent.putExtra.overload('java.lang.String','boolean').call(intent,'haiagaru.native.hissiViewer',true);
  const retained=Java.retain(host),launch=Java.retain(intent);
  setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>console.log('LEFT_CHECKER_OPEN='+T.open(retained,'hissi',launch)))),800);
 }catch(e){console.log('FAIL '+e.stack);}});
});
