package nl.johninnl.vela;

import static org.junit.Assert.*;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.speech.tts.TextToSpeech;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import nl.johninnl.navigation.alerts.WarningAudioOwner;

/** Car-only DI creates a real uninitialized guide; preparation must use its native selected engine. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class VelaPrepareContractTest {
    Context context;VelaWarningSpeaker speaker;ColdGuide guide;VelaWarningSpeakerTest.Engine engine;
    @Before public void setup(){context=RuntimeEnvironment.getApplication();context.getSharedPreferences("vela_settings",0).edit().clear().putString("voice_engine","test.selected.tts").commit();PackageInfo pkg=new PackageInfo();pkg.packageName="test.selected.tts";pkg.applicationInfo=new ApplicationInfo();pkg.applicationInfo.packageName=pkg.packageName;pkg.applicationInfo.enabled=true;Shadows.shadowOf(context.getPackageManager()).installPackage(pkg);engine=new VelaWarningSpeakerTest.Engine();guide=new ColdGuide(context,engine);speaker=new VelaWarningSpeaker(new VelaWarningSpeakerTest.PendingExecutor());speaker.bind(guide);}
    @After public void cleanup(){speaker.close();engine.shutdown();}
    public static class ColdGuide {
        public Context a;public TextToSpeech b;public boolean e,h,i,m,n,o,t;public int s;public Object l,p=new Object(),q=new Object();public float c=1,d=1;public String f,j="";public Collection<Object> g=new ArrayList<>();int calls;String selected;TextToSpeech instance;
        ColdGuide(Context context,TextToSpeech engine){a=context;instance=engine;}
        public void d(String engine){calls++;selected=engine;f=engine;b=instance;h=false;i=false;e=false;}
        void initialized(){h=true;e=true;}
        public void f(){if(s>0)s--;}
    }
    @Test public void carOnlyPrepareInvokesOriginalSelectedInitializerButWaitsForActualInit(){assertFalse(speaker.isReady("en"));speaker.prepare("en");assertEquals(1,guide.calls);assertEquals("test.selected.tts",guide.selected);assertSame(engine,guide.b);assertFalse(speaker.isReady("en"));guide.initialized();assertTrue(speaker.isReady("en"));}
    @Test public void preparationDoesNotRestartAnInitializingOrUsableNativeInstance(){speaker.prepare("en");speaker.prepare("nl");assertEquals(1,guide.calls);guide.initialized();speaker.prepare("en-US");assertEquals(1,guide.calls);assertSame(engine,guide.b);}
    @Test public void missingExplicitEngineDoesNotSelectAnUnrelatedDefault(){context.getSharedPreferences("vela_settings",0).edit().putString("voice_engine","missing.selected.tts").commit();speaker.prepare("en");assertEquals(0,guide.calls);assertNull(guide.b);assertFalse(speaker.isReady("en"));}
    @Test public void explicitToneAndSilentDoNotInitializeSpeech()throws Exception{for(WarningAudioOwner.Mode mode:new WarningAudioOwner.Mode[]{WarningAudioOwner.Mode.TONE,WarningAudioOwner.Mode.SILENT}){try{VelaWarningSpeaker.class.getMethod("prepare",String.class,WarningAudioOwner.Mode.class).invoke(speaker,"en",mode);}catch(NoSuchMethodException legacy){/* Previous no-op cannot initialize speech. */}}assertEquals(0,guide.calls);assertNull(guide.b);}
}
