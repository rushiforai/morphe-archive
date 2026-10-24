// Simulate a slow font read without blocking the UI; only a RAM cache is reset.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName())))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const E=Java.use('app.morphe.extension.chmate.EmojiFontFallback'),Typeface=Java.use('android.graphics.Typeface'),Thread=Java.use('java.lang.Thread'),Looper=Java.use('android.os.Looper');
 let count=0,background=false,completed=false,elapsed=-1;
 const load=Typeface.createFromAsset.overload('android.content.res.AssetManager','java.lang.String');
 load.implementation=function(assets,path){
  if(String(path)==='haiagaru/NotoColorEmoji.ttf'){count++;background=Thread.currentThread().getId()!==Looper.getMainLooper().getThread().getId();Thread.sleep(1200);const result=load.call(Typeface,assets,path);completed=true;return result;}
  return load.call(Typeface,assets,path);
 };
 function field(name){const f=E.class.getDeclaredField(name);f.setAccessible(true);return f;}
 Java.scheduleOnMainThread(function(){
  try{field('emojiTypeface').set(null,null);field('fontLoadFailed').setBoolean(null,false);Java.cast(field('fontLoadStarted').get(null),Java.use('java.util.concurrent.atomic.AtomicBoolean')).set(false);
   const start=Java.use('android.os.SystemClock').uptimeMillis();for(let i=0;i<10;i++)E.processText(Java.use('java.lang.String').$new('\ud83d\ude00'));elapsed=Java.use('android.os.SystemClock').uptimeMillis()-start;
   if(elapsed>=1000)throw Error('UI waited for font asset');console.log('PASS emoji input returned without waiting elapsedMs='+elapsed);
  }catch(e){console.log('FAIL '+e.stack);}
 });
 setTimeout(()=>Java.perform(()=>{try{
  if(!completed||!background||count!==1||field('emojiTypeface').get(null)===null)throw Error('Font was not loaded once on background thread');
  console.log('EMOJI_FONT_ASYNC_COMPLETE singleLoad='+count+' background='+background+' elapsedMs='+elapsed);
 }catch(e){console.log('FAIL '+e.stack);}finally{load.implementation=null;console.log('FONT_TEST_HOOK_REMOVED');}}),10000);
});
