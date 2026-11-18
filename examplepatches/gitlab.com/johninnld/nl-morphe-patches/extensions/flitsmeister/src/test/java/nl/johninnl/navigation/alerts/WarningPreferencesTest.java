package nl.johninnl.navigation.alerts;
import static org.junit.Assert.*;
import android.content.SharedPreferences;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class WarningPreferencesTest {
    SharedPreferences prefs;
    @Before public void setup(){prefs=RuntimeEnvironment.getApplication().getSharedPreferences("warnings",0);prefs.edit().clear().commit();}
    @Test public void freshMapsUsesRecommendedVoiceWithoutConfirmation(){WarningPreferences p=new WarningPreferences(prefs,true);assertEquals(WarningAudioOwner.Mode.VOICE,p.mode());assertEquals(WarningPreferences.RECOMMENDED,p.categories());assertTrue(p.reviewed());assertEquals("Voice",p.summary(false));}
    @Test public void explicitLegacyPoliceAndMuteRemainSelected(){prefs.edit().putInt("waze_alerts_kinds",1).putBoolean("waze_alerts_chime",false).commit();WarningPreferences p=new WarningPreferences(prefs,true);assertEquals(WarningPreferences.POLICE,p.categories());assertEquals(WarningAudioOwner.Mode.SILENT,p.mode());assertTrue(p.origin().contains("legacy_explicit"));}
    @Test public void explicitLegacyChimeRemainsToneRatherThanEnablingVoice(){prefs.edit().putBoolean("waze_alerts_chime",true).commit();assertEquals(WarningAudioOwner.Mode.TONE,new WarningPreferences(prefs,true).mode());}
    @Test public void absentVelaPreferenceIsNotAnExplicitMute(){WarningPreferences p=new WarningPreferences(prefs,false);assertEquals(WarningAudioOwner.Mode.VOICE,p.mode());assertEquals("recommended",p.origin());}
    @Test public void explicitVelaMuteSurvivesRepeatedInitialization(){prefs.edit().putBoolean("morphe_telemetry_spoken",false).commit();WarningPreferences p=new WarningPreferences(prefs,false);assertEquals(WarningAudioOwner.Mode.SILENT,p.mode());p.categories(WarningPreferences.EMERGENCY);p.confirm();WarningPreferences again=new WarningPreferences(prefs,false);assertEquals(WarningPreferences.EMERGENCY,again.categories());assertTrue(again.reviewed());assertFalse(prefs.getBoolean("morphe_telemetry_spoken",true));}
    @Test public void wazeChoicesDoNotReuseOrOverwriteReviewedFlitsmeisterChoices(){
        WarningPreferences fm=new WarningPreferences(prefs,true);fm.mode(WarningAudioOwner.Mode.SILENT);fm.categories(WarningPreferences.EMERGENCY);fm.confirm();
        java.util.Map<String,?> original=new java.util.HashMap<>(prefs.getAll());
        WarningPreferences waze=new WarningPreferences(prefs,true,WarningProviders.WAZE);
        assertTrue(waze.reviewed());assertEquals(WarningAudioOwner.Mode.VOICE,waze.mode());assertEquals(WarningPreferences.RECOMMENDED,waze.categories());
        waze.mode(WarningAudioOwner.Mode.TONE);waze.categories(WarningPreferences.ROAD_DANGER);waze.confirm();
        for(String key:original.keySet())assertEquals("Existing FM preference bytes remain unchanged: "+key,original.get(key),prefs.getAll().get(key));
        assertEquals(WarningPreferences.EMERGENCY,new WarningPreferences(prefs,true).categories());
        assertEquals(WarningAudioOwner.Mode.TONE,new WarningPreferences(prefs,true,WarningProviders.WAZE).mode());
        assertTrue(new WarningPreferences(prefs,true,WarningProviders.WAZE).reviewed());
    }
    @Test public void wazeIndependentlyMigratesExplicitLegacyMuteAndTypes(){
        prefs.edit().putInt("waze_alerts_kinds",1).putBoolean("waze_alerts_chime",false).commit();
        WarningPreferences fm=new WarningPreferences(prefs,true);fm.categories(WarningPreferences.ALL);fm.confirm();
        WarningPreferences waze=new WarningPreferences(prefs,true,WarningProviders.WAZE);
        assertEquals(WarningAudioOwner.Mode.SILENT,waze.mode());assertEquals(WarningPreferences.POLICE,waze.categories());assertTrue(waze.reviewed());
        assertEquals(1,prefs.getInt("morphe_native_warnings_waze_legacy_types",0));assertEquals(WarningPreferences.ALL,fm.categories());
    }
    @Test public void profilesRetainDistinctNativeNamespacesAndBoundedCapabilitySets(){
        assertTrue(WarningProviders.supported("com.waze"));assertTrue(WarningProviders.supported("nl.flitsmeister"));assertFalse(WarningProviders.supported("app.provider"));assertFalse(WarningProviders.supported(null));
        assertEquals("De-Waze",WarningProviders.displayName("com.waze"));assertEquals("Flitsmeister",WarningProviders.displayName("nl.flitsmeister"));
        java.util.Set<String> waze=WarningProviders.required("com.waze");
        assertTrue(waze.size()<=WarningCapabilities.MAX_CAPABILITIES);
        assertEquals(26,waze.stream().filter(value->value.startsWith("waze/AlerterType/")).count());
        assertEquals(96,waze.stream().filter(value->value.startsWith("waze/ui/Subtype/")).count());
        assertEquals(10,waze.stream().filter(value->value.startsWith("waze/SegmentInsightInfo/SegmentType/")).count());
        for(String value:new String[]{"waze/ui/Subtype/HAZARD_TYPE_EMERGENCY_VEHICLE","waze/proto/AlerterSubType/Hazard/HAZARD_SUB_TYPE_EMERGENCY_VEHICLE","waze/ui/SubtypeTrait/CAR_ON_SHOULDER_PEOPLE_AROUND","waze/Notification/EVENT_IN_CAR_CLOSED","waze/Feature/FEATURE_CYCLISTS","waze/validation/presence_v1"})assertTrue(value,waze.contains(value));
        assertFalse(waze.contains("fm/EarlyWarningTypeEnum/AMBULANCE"));
        WarningCapabilities capabilities=new WarningCapabilities(WazeWarningTypes.MANIFEST_DIGEST,waze,false);
        assertFalse("Structural inventory must not assert proven native capture",capabilities.complete);
    }
}
