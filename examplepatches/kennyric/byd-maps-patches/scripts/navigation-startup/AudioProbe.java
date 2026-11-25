package nl.johninnl.startup.audio;

import android.app.*;
import android.content.*;
import android.media.AudioManager;
import android.os.*;
import java.lang.reflect.*;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONObject;

/** Instrumentation-only native audio contract probe, signed with a disposable test key. */
public final class AudioProbe extends Instrumentation {
 private Bundle args;
 @Override public void onCreate(Bundle b){args=b;start();}
 private void check(boolean value,String message){if(!value)throw new AssertionError(message);}
 private void checkedMain(Runnable action){java.util.concurrent.atomic.AtomicReference<Throwable> error=new java.util.concurrent.atomic.AtomicReference<>();runOnMainSync(()->{try{action.run();}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new AssertionError("Native audio invocation failed",error.get());}
 private Object call(Class<?> cls,String name,Class<?>[] types,Object... params)throws Exception{return cls.getMethod(name,types).invoke(null,params);}
 public static final class Player {public float value;public void setVolume(float v){value=v;}}
 @Override public void onStart(){Bundle result=new Bundle();JSONObject report=new JSONObject();
  try {
   runOnMainSync(()->{});
   Context context=getTargetContext();ClassLoader loader=context.getClassLoader();Class<?> audio=loader.loadClass("nl.johninnl.navigation.startup.ProviderAudio");
   Class<?> engine=loader.loadClass("nl.johninnl.navigation.startup.ProviderEngineService");
   call(engine,"renewLease",new Class[]{Context.class},context);
   check((Boolean)call(audio,"muted",new Class[]{}),"managed lease must mute provider before initialization");
   AudioManager system=(AudioManager)context.getSystemService(Context.AUDIO_SERVICE);int before=system.getStreamVolume(AudioManager.STREAM_MUSIC);
   Player provider=new Player();call(audio,"volume",new Class[]{Object.class,float.class},provider,.65f);check(provider.value==0,"owned player leaked audio");
   AtomicInteger completions=new AtomicInteger();String pkg=context.getPackageName();
   if(pkg.equals("com.waze")) {
    Class<?> callback=loader.loadClass("g.h.a.a");Object done=Proxy.newProxyInstance(loader,new Class[]{callback},(p,m,a)->{if(m.getName().equals("invoke")){completions.incrementAndGet();return loader.loadClass("g.ab").getField("a").get(null);}if(m.getName().equals("hashCode"))return System.identityHashCode(p);if(m.getName().equals("equals"))return p==a[0];return "AudioProbe";});
    Class<?> soundType=loader.loadClass("com.waze.sound.d.c");Object sound=loader.loadClass("kotlinx.coroutines.a.ab").getMethod("l",Class.class).invoke(null,soundType);
    checkedMain(()->{try{sound.getClass().getMethod("g",String.class,String.class,boolean.class,boolean.class,callback).invoke(sound,"/no-audio-file-needed.wav","managed-probe",true,true,done);sound.getClass().getMethod("l",String.class,String.class,callback).invoke(sound,"https://invalid.local/no-download","managed-probe",done);}catch(Exception e){throw new RuntimeException(e);}});
    check(completions.get()==2,"native Waze forced sound callbacks did not complete synchronously");
    report.put("forced_native_file_and_url_suppressed",true);
   } else if(pkg.equals("nl.flitsmeister")) {
    Class<?> callback=loader.loadClass("z39");Object done=Proxy.newProxyInstance(loader,new Class[]{callback},(p,m,a)->{if(m.getName().equals("invoke")){completions.incrementAndGet();return loader.loadClass("tvj").getField("a").get(null);}if(m.getName().equals("hashCode"))return System.identityHashCode(p);if(m.getName().equals("equals"))return p==a[0];return "AudioProbe";});
    Class<?> managerType=loader.loadClass("t50");Object manager=managerType.getConstructor(Context.class).newInstance(context);
    checkedMain(()->{try{managerType.getMethod("a",String.class,String.class,loader.loadClass("h4k"),boolean.class,boolean.class,boolean.class,callback).invoke(manager,"managed-probe",null,null,true,true,true,done);}catch(Exception e){throw new RuntimeException(e);}});
    check(completions.get()==1,"native Flitsmeister forced sound callback did not complete");
    check(((java.util.Queue<?>)managerType.getField("f").get(manager)).isEmpty(),"muted Flitsmeister sound entered native queue");report.put("forced_native_request_suppressed",true);
   } else throw new AssertionError("unexpected target "+pkg);
   context.getSharedPreferences("navigation_startup_lease",0).edit().putLong("until",SystemClock.elapsedRealtime()-1).commit();
   check(!(Boolean)call(audio,"muted",new Class[]{}),"expired session remained muted");
   call(audio,"volume",new Class[]{Object.class,float.class},provider,.65f);check(provider.value==.65f,"standalone provider volume not restored");check(before==system.getStreamVolume(AudioManager.STREAM_MUSIC),"device stream volume changed");
   report.put("provider",pkg);report.put("native_callbacks",completions.get());report.put("managed_player_muted",true);report.put("standalone_player_restored",true);report.put("device_stream_unchanged",true);report.put("pass",true);
   result.putString("audio_result",report.toString());finish(Activity.RESULT_OK,result);
  }catch(Throwable e){result.putString("audio_error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}
 }
}
