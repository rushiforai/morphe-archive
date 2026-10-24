// Isolated UI fixture: no network, thread changes or preference writes.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('Test package only');
 const Emoji=Java.use('app.morphe.extension.chmate.EmojiFontFallback'),Clock=Java.use('android.os.SystemClock');
 let fixture=null,parent=null,checks=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function pending(){const f=Emoji.class.getDeclaredField('pendingRefreshes');f.setAccessible(true);return Java.cast(f.get(null),Java.use('java.util.Map'));}
 Java.scheduleOnMainThread(()=>{try{
  const activity=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);if(!activity)throw Error('No current Activity');
  parent=Java.cast(activity.getWindow().getDecorView(),Java.use('android.view.ViewGroup'));
  fixture=Java.use('android.widget.LinearLayout').$new(activity);fixture.setOrientation(1);
  for(let i=0;i<160;i++){const text=Java.use('android.widget.TextView').$new(activity);text.setText(Java.use('java.lang.String').$new('>>123 参照レスの本文 '+i));fixture.addView(text);}
  parent.addView(fixture,Java.use('android.view.ViewGroup$LayoutParams').$new(1,1));
  const before=Clock.uptimeMillis();for(let i=0;i<100;i++)Emoji.scheduleRefresh(fixture);
  console.log('ENQUEUE_100_MS '+(Clock.uptimeMillis()-before));
  check(pending().containsKey(fixture),'repeated refresh has one pending job');
  const task=pending().get(fixture);check(task!==null,'refresh scheduled without synchronous walk');
  Java.cast(task,Java.use('java.lang.Runnable')).run();
  check(pending().containsKey(fixture),'large view tree yields before all rows');
  const field=task.getClass().getDeclaredField('remaining');field.setAccessible(true);
  const queue=Java.cast(field.get(task),Java.use('java.util.ArrayDeque'));
  check(queue.size()>0,'remaining rows deferred to another frame');
 }catch(e){console.log('FAIL INITIAL '+e.stack);if(fixture&&parent)parent.removeView(fixture);}});
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
  check(fixture!==null&&!pending().containsKey(fixture),'deferred tree completes and releases pending state');
  parent.removeView(fixture);check(!fixture.isAttachedToWindow(),'test views removed');
  Emoji.scheduleRefresh(fixture);
 }catch(e){console.log('FAIL FINAL '+e.stack);}finally{if(fixture&&parent)parent.removeView(fixture);}})),2500);
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{check(!pending().containsKey(fixture),'detached view cancels queued refresh');console.log('ANCHOR_REFRESH_PASS '+checks);}catch(e){console.log('FAIL CLEANUP '+e.stack);}})),4000);
});
