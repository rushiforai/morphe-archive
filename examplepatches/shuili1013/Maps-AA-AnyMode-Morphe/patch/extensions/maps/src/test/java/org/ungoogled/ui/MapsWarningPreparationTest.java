package org.ungoogled.ui;

import static org.junit.Assert.*;
import android.os.Looper;
import android.speech.tts.TextToSpeech;
import android.speech.tts.Voice;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.Locale;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import org.robolectric.shadows.ShadowTextToSpeech;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE) @LooperMode(LooperMode.Mode.PAUSED)
public class MapsWarningPreparationTest {
    MapsWarningSpeaker speaker;
    @Before public void setup(){speaker=new MapsWarningSpeaker(RuntimeEnvironment.getApplication());ShadowTextToSpeech.addVoice(new Voice("offline-en",Locale.US,Voice.QUALITY_NORMAL,Voice.LATENCY_NORMAL,false,Collections.emptySet()));ShadowTextToSpeech.addVoice(new Voice("offline-nl",Locale.forLanguageTag("nl-NL"),Voice.QUALITY_NORMAL,Voice.LATENCY_NORMAL,false,Collections.emptySet()));}
    @After public void close(){speaker.close();Shadows.shadowOf(Looper.getMainLooper()).idle();}
    void idle(){Shadows.shadowOf(Looper.getMainLooper()).idle();}
    String prepared()throws Exception{Field field=MapsWarningSpeaker.class.getDeclaredField("preparedLanguage");field.setAccessible(true);return (String)field.get(speaker);}
    @Test public void realEventLanguageArrivingDuringColdInitReplacesEmptyWarmup()throws Exception{
        speaker.prepare("");idle();TextToSpeech tts=ShadowTextToSpeech.getLastTextToSpeechInstance();assertNotNull(tts);
        speaker.prepare("en-US");idle();assertEquals("",prepared());
        Shadows.shadowOf(tts).getOnInitListener().onInit(TextToSpeech.SUCCESS);idle();assertEquals("en-US",prepared());
    }
    @Test public void mostRecentRealLanguageWinsWhileEngineIsInitializing()throws Exception{
        speaker.prepare("en-US");idle();TextToSpeech tts=ShadowTextToSpeech.getLastTextToSpeechInstance();
        speaker.prepare("nl-NL");idle();Shadows.shadowOf(tts).getOnInitListener().onInit(TextToSpeech.SUCCESS);idle();assertEquals("nl-NL",prepared());
    }
    @Test public void repeatedPreparationKeepsInitializingEngineButReplacesFailedInstance()throws Exception{
        speaker.prepare("en-US");idle();TextToSpeech first=ShadowTextToSpeech.getLastTextToSpeechInstance();
        speaker.prepare("en-US");idle();assertSame(first,ShadowTextToSpeech.getLastTextToSpeechInstance());
        Shadows.shadowOf(first).getOnInitListener().onInit(TextToSpeech.ERROR);idle();
        speaker.prepare("en-US");idle();TextToSpeech replacement=ShadowTextToSpeech.getLastTextToSpeechInstance();assertNotSame(first,replacement);
        Shadows.shadowOf(replacement).getOnInitListener().onInit(TextToSpeech.SUCCESS);idle();assertEquals("en-US",prepared());
        Shadows.shadowOf(first).getOnInitListener().onInit(TextToSpeech.ERROR);idle();assertEquals("en-US",prepared());
        speaker.prepare("en-US");idle();assertSame(replacement,ShadowTextToSpeech.getLastTextToSpeechInstance());
    }
}
