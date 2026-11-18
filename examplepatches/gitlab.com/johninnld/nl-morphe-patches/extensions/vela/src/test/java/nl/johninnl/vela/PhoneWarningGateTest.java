package nl.johninnl.vela;

import static org.junit.Assert.*;
import android.app.Application;
import android.os.*;
import java.lang.reflect.Field;
import java.time.Duration;
import java.util.*;
import nl.johninnl.navigation.alerts.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class PhoneWarningGateTest {
    Application app;WarningView warnings;WarningPreferences choices;
    @Before public void setup()throws Exception{
        app=RuntimeEnvironment.getApplication();app.getSharedPreferences("vela_settings",0).edit().clear().commit();
        TelemetryRuntime.resetForTest();TelemetryRuntime.init(app,()->{});TelemetryRuntime.select(TelemetryStore.FLITSMEISTER);
        Field field=TelemetryRuntime.class.getDeclaredField("nativeWarnings");field.setAccessible(true);warnings=(WarningView)field.get(null);
        field=TelemetryRuntime.class.getDeclaredField("warningPreferences");field.setAccessible(true);choices=(WarningPreferences)field.get(null);choices.categories(127);choices.confirm();
        assertNull(TelemetryRuntime.lastFix());assertNull(TelemetryRuntime.phoneSpeedValue());assertFalse(TelemetryRuntime.showSpeed(false));
    }
    @After public void cleanup(){TelemetryRuntime.resetForTest();}
    private WarningEvent event(){long now=SystemClock.elapsedRealtime();Bundle b=new Bundle();b.putInt("protocol_version",1);b.putString("provider_session",UUID.randomUUID().toString());b.putLong("sequence",1);b.putString("operation","ANNOUNCE");b.putString("warning_id","early/AMBULANCE:no-speed");b.putLong("revision",1);b.putLong("announcement_index",1);b.putString("phase","notice");b.putString("native_type","INCIDENT");b.putString("native_subtype","AMBULANCE");b.putString("category","emergency_vehicle");b.putInt("priority",0);b.putString("message","Ambulance approaching");b.putString("language_tag","en-US");b.putString("message_origin","native_text");b.putString("relevance","moving_emergency");b.putString("relationship","unknown");b.putLong("observed_elapsed_ms",now);b.putLong("issued_elapsed_ms",now);b.putLong("announce_until_elapsed_ms",now+5000);b.putLong("state_until_elapsed_ms",now+30000);return WarningCodec.decode(b,now);}
    private void warning(){warnings.events(Collections.singletonList(event()));}
    @Test public void semanticWarningOpensNativePhoneSlotWithoutLocationOrSpeedEvenWhenSilent(){
        choices.mode(WarningAudioOwner.Mode.SILENT);warning();
        assertTrue("Fresh semantic warning must be visible with no native or legacy speed",TelemetryRuntime.showSpeed(false));
        assertEquals("Flitsmeister\nAmbulance approaching",TelemetryRuntime.compactWarningText());
        assertNull(TelemetryRuntime.lastFix());assertNull(TelemetryRuntime.phoneSpeedValue());
    }
    @Test public void wazeWarningsUseSelectedAttributionAndIndependentChoicesWithoutGps(){
        choices.mode(WarningAudioOwner.Mode.SILENT);warning();
        TelemetryRuntime.select(TelemetryStore.WAZE);assertEquals("",TelemetryRuntime.nativeCarWarningText());
        WarningPreferences waze=TelemetryRuntime.warningPreferences();assertTrue(waze.reviewed());waze.categories(WarningPreferences.ROAD_DANGER);waze.mode(WarningAudioOwner.Mode.TONE);waze.confirm();
        Bundle b=WarningCodec.encode(event());long now=SystemClock.elapsedRealtime();b.putString("native_type","HAZARD");b.putString("native_subtype","HAZARD_TYPE_EMERGENCY_VEHICLE");b.putString("category","road_danger");b.putString("relevance","notice");b.putString("message","Emergency vehicle ahead");
        warnings.events(Collections.singletonList(WarningCodec.decode(b,now)));
        assertEquals("De-Waze\nEmergency vehicle ahead",TelemetryRuntime.compactWarningText());assertEquals("De-Waze\nEmergency vehicle ahead",TelemetryRuntime.nativeCarWarningText());assertTrue(TelemetryRuntime.showSpeed(false));
        TelemetryRuntime.select(TelemetryStore.FLITSMEISTER);assertTrue(TelemetryRuntime.warningPreferences().reviewed());assertEquals(WarningAudioOwner.Mode.SILENT,TelemetryRuntime.warningPreferences().mode());assertEquals("",TelemetryRuntime.nativeCarWarningText());
        TelemetryRuntime.select(TelemetryStore.WAZE);assertEquals(WarningAudioOwner.Mode.TONE,TelemetryRuntime.warningPreferences().mode());assertTrue(TelemetryRuntime.warningPreferences().reviewed());
    }
    public static class MutedGuide { public boolean n=true,o=false; }
    @Test public void nativeFullMuteDoesNotHideSemanticWarning()throws Exception{
        warning();TelemetryRuntime.bindVoice(new MutedGuide());
        Field field=TelemetryRuntime.class.getDeclaredField("nativeSpeaker");field.setAccessible(true);VelaWarningSpeaker speaker=(VelaWarningSpeaker)field.get(null);
        assertEquals(WarningAudioOwner.Mode.SILENT,speaker.effectiveMode(WarningAudioOwner.Mode.VOICE));
        assertTrue("Verified native full mute controls audio, not native warning visibility",TelemetryRuntime.showSpeed(false));
    }
    @Test public void clearExpiryCategoryAndProviderOffRemoveOnlySemanticEligibility(){
        warning();assertTrue(TelemetryRuntime.showSpeed(false));warnings.clear();assertFalse(TelemetryRuntime.showSpeed(false));
        warning();choices.categories(0);assertFalse(TelemetryRuntime.showSpeed(false));choices.categories(127);assertTrue(TelemetryRuntime.showSpeed(false));
        TelemetryRuntime.select("");assertFalse(TelemetryRuntime.showSpeed(false));TelemetryRuntime.select(TelemetryStore.FLITSMEISTER);warning();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(31));assertFalse(TelemetryRuntime.showSpeed(false));
        assertTrue("Original native eligibility remains authoritative",TelemetryRuntime.showSpeed(true));
    }
}
