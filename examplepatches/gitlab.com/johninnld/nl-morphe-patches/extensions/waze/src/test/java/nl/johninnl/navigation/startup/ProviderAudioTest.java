package nl.johninnl.navigation.startup;
import android.app.Application;import android.content.Context;import android.media.AudioManager;import android.os.Looper;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.Config;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=34)
public class ProviderAudioTest {
 Application app;Class<?> audio;
 @Before public void setup() throws Exception {app=RuntimeEnvironment.getApplication();app.getSharedPreferences("navigation_startup_lease",0).edit().clear().commit();audio=Class.forName("nl.johninnl.navigation.startup.ProviderAudio");audio.getMethod("init",Context.class).invoke(null,app);}
 private Object call(String n,Class<?>[] types,Object... args) throws Exception{return audio.getMethod(n,types).invoke(null,args);}
 public static class Player {public float volume;public void setVolume(float v){volume=v;}}
 public static class Completion {public int calls;public Object invoke(){calls++;return null;}}
 public static class Item {public Completion f=new Completion();}
 public static class Speech {public Object b;}
 public static class Queue {public java.util.concurrent.LinkedBlockingQueue<Item> f=new java.util.concurrent.LinkedBlockingQueue<>();public Speech e=new Speech();public boolean g=true;public int resets;public void k(){resets++;}}
 @Test public void leaseMutesOnlyOwnedPlayersAndRestoresTheirRequestedVolume() throws Exception {
  AudioManager system=(AudioManager)app.getSystemService(Context.AUDIO_SERVICE);int before=system.getStreamVolume(AudioManager.STREAM_MUSIC);
  Player provider=new Player(),mainMap=new Player();mainMap.setVolume(.8f);call("volume",new Class[]{Object.class,float.class},provider,.7f);assertEquals(.7f,provider.volume,0);
  ProviderEngineService.renewLease(app);Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(0,provider.volume,0);assertEquals(.8f,mainMap.volume,0);
  call("volume",new Class[]{Object.class,float.class},provider,.4f);assertEquals(0,provider.volume,0);
  Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(46));assertEquals(.4f,provider.volume,0);assertEquals(before,system.getStreamVolume(AudioManager.STREAM_MUSIC));
 }
 @Test public void suppressedRequestsCompleteOnceAndNormalPlaybackIsLeftToNativeCode() throws Exception {
  Completion c=new Completion();assertFalse((Boolean)call("skip",new Class[]{Object.class},c));assertEquals(0,c.calls);
  ProviderEngineService.renewLease(app);assertTrue((Boolean)call("skip",new Class[]{Object.class},c));assertEquals(1,c.calls);
 }
 @Test public void queuedProviderSoundsAreCompletedAndFocusReleasedOnHandover() throws Exception {
  Queue q=new Queue();Item first=new Item(),second=new Item();q.f.add(first);q.f.add(second);call("trackQueue",new Class[]{Object.class},q);
  ProviderEngineService.renewLease(app);Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(q.f.isEmpty());assertEquals(1,first.f.calls);assertEquals(1,second.f.calls);assertFalse(q.g);assertTrue(q.resets>0);
 }
 public static class SpeechEngine extends android.speech.tts.TextToSpeech {
  public android.speech.tts.UtteranceProgressListener listener;public String token;public int stops;
  SpeechEngine(Context context){super(context,null);}
  @Override public int setOnUtteranceProgressListener(android.speech.tts.UtteranceProgressListener l){listener=l;return SUCCESS;}
  @Override public int speak(CharSequence text,int mode,android.os.Bundle params,String id){token=id;return SUCCESS;}
  @Override public int synthesizeToFile(CharSequence text,android.os.Bundle params,java.io.File file,String id){token=id;return SUCCESS;}
  @Override public int stop(){stops++;return SUCCESS;}
 }
 public static class Listener extends android.speech.tts.UtteranceProgressListener {
  int errors,done;String id;
  public void onStart(String id){}public void onDone(String id){done++;this.id=id;}public void onError(String id){errors++;this.id=id;}
 }
 @Test public void handoverCompletesActiveSpeechAndSynthesisWithNativeErrorExactlyOnce() throws Exception {
  for(boolean synth:new boolean[]{false,true}) {
   app.getSharedPreferences("navigation_startup_lease",0).edit().clear().commit();audio.getMethod("init",Context.class).invoke(null,app);Shadows.shadowOf(Looper.getMainLooper()).idle();
   SpeechEngine speech=new SpeechEngine(app);Listener listener=new Listener();
   call("setListener",new Class[]{android.speech.tts.TextToSpeech.class,android.speech.tts.UtteranceProgressListener.class},speech,listener);
   if(synth)call("synthesize",new Class[]{android.speech.tts.TextToSpeech.class,CharSequence.class,android.os.Bundle.class,java.io.File.class,String.class},speech,"warning",new android.os.Bundle(),new java.io.File(app.getCacheDir(),"utterance.wav"),"original-id");
   else call("speak",new Class[]{android.speech.tts.TextToSpeech.class,CharSequence.class,int.class,android.os.Bundle.class,String.class},speech,"warning",1,new android.os.Bundle(),"original-id");
   String old=speech.token;ProviderEngineService.renewLease(app);Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(1,listener.errors);assertEquals("original-id",listener.id);assertEquals(0,listener.done);assertEquals(1,speech.stops);
   speech.listener.onDone(old);speech.listener.onError(old);assertEquals(1,listener.errors);assertEquals(0,listener.done);
  }
 }
 @Test public void directSoundpackBatchesCompleteBeforeAnyRoutingOrFocus() throws Exception {
  Item first=new Item(),second=new Item();Object batch=new Item[]{first,second};
  assertFalse((Boolean)call("skipItems",new Class[]{Object.class},batch));assertEquals(0,first.f.calls);
  ProviderEngineService.renewLease(app);assertTrue((Boolean)call("skipItems",new Class[]{Object.class},batch));assertEquals(1,first.f.calls);assertEquals(1,second.f.calls);
 }
}
