package org.ungoogled.ui;

import static org.junit.Assert.*;
import nl.johninnl.navigation.alerts.WarningAudioOwner.Mode;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE) @LooperMode(LooperMode.Mode.PAUSED)
public class MapsWarningModeTest {
    public enum NativeMode{UNMUTED}
    public static final class Mute{public NativeMode c(){return NativeMode.UNMUTED;}}
    public static final class Manager{public Mute f=new Mute();}
    private static void set(Object target,String name,Object value)throws Exception{java.lang.reflect.Field f=target.getClass().getDeclaredField(name);f.setAccessible(true);f.set(target,value);}
    @Test @Config(shadows=MapsGuidanceGapTest.BoundHooks.class)
    public void initializedEngineWithoutAPreparedLanguageCannotClaimVoiceReadiness()throws Exception{
        MapsWarningSpeaker speaker=new MapsWarningSpeaker(RuntimeEnvironment.getApplication());
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        java.lang.reflect.Field f=MapsWarningSpeaker.class.getDeclaredField("guidance");f.setAccessible(true);Object guidance=f.get(speaker);
        set(guidance,"manager",new Manager());set(guidance,"bound",true);set(guidance,"fault",false);set(speaker,"initialized",true);
        assertFalse(speaker.isReady("",Mode.VOICE));assertFalse(speaker.isReady("und",Mode.VOICE));assertFalse(speaker.isReady(null,Mode.VOICE));
        set(speaker,"preparedLanguage","en-US");assertTrue(speaker.isReady("en-US",Mode.VOICE));assertFalse(speaker.isReady("nl-NL",Mode.VOICE));speaker.close();
    }
    @Test public void unavailableBindingPreservesOutputIntentAndReportsNotReady(){
        MapsWarningSpeaker speaker=new MapsWarningSpeaker(RuntimeEnvironment.getApplication());
        assertEquals(Mode.VOICE,speaker.effectiveMode(Mode.VOICE));assertEquals(Mode.TONE,speaker.effectiveMode(Mode.TONE));
        assertFalse(speaker.isReady("en",Mode.VOICE));assertFalse(speaker.isReady("und",Mode.TONE));
        assertEquals(Mode.SILENT,speaker.effectiveMode(Mode.SILENT));assertTrue(speaker.isReady("und",Mode.SILENT));speaker.close();
    }
    @Test public void onlyVerifiedNativeMuteCapsAnAudiblePreference(){
        assertEquals(Mode.SILENT,MapsGuidanceCoordinator.capNativeMode(Mode.VOICE,"MUTED"));
        assertEquals(Mode.SILENT,MapsGuidanceCoordinator.capNativeMode(Mode.TONE,"MUTED"));
        assertEquals(Mode.TONE,MapsGuidanceCoordinator.capNativeMode(Mode.VOICE,"MINIMAL"));
        assertEquals(Mode.TONE,MapsGuidanceCoordinator.capNativeMode(Mode.TONE,"MINIMAL"));
        assertEquals(Mode.VOICE,MapsGuidanceCoordinator.capNativeMode(Mode.VOICE,"UNMUTED"));
        assertNull(MapsGuidanceCoordinator.capNativeMode(Mode.VOICE,"UNKNOWN"));
    }
}
