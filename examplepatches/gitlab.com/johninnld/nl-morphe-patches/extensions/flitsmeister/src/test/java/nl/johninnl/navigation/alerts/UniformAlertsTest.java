package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import android.os.Bundle;
import java.util.Locale;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** One wording, language and sound per alert type, whichever provider reported it. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=32, manifest=Config.NONE)
public class UniformAlertsTest {
    private final Locale before=Locale.getDefault();
    private long sequence;
    @Before public void on(){UniformAlerts.enabled=true;}
    @After public void restore(){Locale.setDefault(before);UniformAlerts.defaultSounds();UniformAlerts.enabled=true;}

    private Bundle fields(String id,String type,String sub,String category,String phase,Integer distance,String operation,long now){
        Bundle b=new Bundle();b.putInt("protocol_version",1);b.putString("provider_session","0f0e0d0c-0b0a-4908-8706-050403020100");
        b.putLong("sequence",++sequence);b.putString("operation",operation);b.putString("warning_id",id);b.putLong("revision",1);
        b.putLong("announcement_index",0);b.putString("phase",phase);b.putString("native_type",type);if(!sub.isEmpty())b.putString("native_subtype",sub);
        b.putString("category",category);b.putInt("priority",1);b.putString("message","Provider text");b.putString("language_tag","nl");
        b.putString("message_origin","native_text");b.putString("relevance","notice");b.putString("relationship","unknown");
        b.putLong("observed_elapsed_ms",now);b.putLong("issued_elapsed_ms",now);b.putLong("state_until_elapsed_ms",now+30000);
        if(operation.equals("ANNOUNCE"))b.putLong("announce_until_elapsed_ms",now+10000);
        if(distance!=null){b.putInt("distance_m",distance);b.putLong("distance_observed_elapsed_ms",now);b.putBoolean("distance_estimated",false);}
        return b;
    }
    private WarningEvent event(String type,String sub,String category,String phase,Integer distance){
        return WarningCodec.decode(fields("w-"+type,type,sub,category,phase,distance,"UPSERT",1000),1000);
    }

    @Test public void flitsmeisterWordingInEveryLanguageWithEnglishFallback(){
        WarningEvent trap=event("SPEED_TRAP","","speed_control","approach",480);
        assertEquals("Caution, speed trap",UniformAlerts.phrase(trap,"en-GB"));
        assertEquals("Let op, flitser",UniformAlerts.phrase(trap,"nl-NL"));
        assertEquals("Achtung, Blitzer",UniformAlerts.phrase(trap,"de"));
        assertEquals("Attention, radar",UniformAlerts.phrase(trap,"fr"));
        assertEquals("Atención, radar",UniformAlerts.phrase(trap,"es"));
        assertEquals("Attenzione, autovelox",UniformAlerts.phrase(trap,"it"));
        assertEquals("Atenção, radar",UniformAlerts.phrase(trap,"pt-PT"));
        assertEquals("Caution, speed trap",UniformAlerts.phrase(trap,"pl"));
        assertEquals("Flitspaal",UniformAlerts.phrase(event("SPEED_CAM","","speed_control","approach",900),"nl"));
        assertEquals("Let op, file",UniformAlerts.phrase(event("TRAFFIC_JAM","","traffic","approach",1520),"nl"));
        assertEquals("Je nadert een verkeerscamera",UniformAlerts.phrase(event("SPEED_CAM","TRAFFIC_CAMERA","traffic_camera","approach",300),"nl"));
    }

    @Test public void wazeAndFlitsmeisterPoliceAndZonesUseTheSameWords(){
        assertEquals("Let op, controle",UniformAlerts.phrase(event("POLICE","POLICE_HIDING","police_control","notice",null),"nl"));
        assertEquals("Let op, controle",UniformAlerts.phrase(event("REPORT","CONTROL","police_control","notice",null),"nl"));
        assertEquals("Populaire flitslocatie",UniformAlerts.phrase(event("POLICEHOTSPOT","","police_control","notice",null),"nl"));
        assertEquals("Let op, trajectcontrole",UniformAlerts.phrase(event("AVERAGE_SPEED_CAMERA","","average_speed_zone","approach",800),"nl"));
        assertEquals("Trajectcontrole",UniformAlerts.phrase(WarningCodec.decode(insideZone(fields("z","AVG_SPEED_CHECK","","speed_control","enter",4000,"UPSERT",1000)),1000),"nl"));
        // Flitsmeister's own "enter" announcement ahead of the control is not entry.
        assertEquals("Let op, trajectcontrole",UniformAlerts.phrase(event("AVG_SPEED_CHECK","","speed_control","enter",900),"nl"));
        assertEquals("Maximumsnelheid 100",UniformAlerts.phrase(WarningCodec.decode(withLimit(fields("l","ROAD_LIMIT_CHANGE","","maximum_speed","notice",null,"UPSERT",1000),100),1000),"nl"));
        // Features without a uniform phrase keep the provider's own words.
        assertNull(UniformAlerts.phrase(event("SPEED_BUMP","","road_feature","approach",200),"nl"));
        assertEquals("flitser.m4a",UniformAlerts.sound(event("SPEED_CAM","","speed_control","approach",900)));
        assertEquals("trajectcontrole_start.m4a",UniformAlerts.sound(event("AVERAGE_SPEED_CAMERA","","average_speed_zone","active",900)));
        assertEquals("subtle_beep.mp3",UniformAlerts.sound(event("POLICE","POLICE_VISIBLE","police_control","notice",null)));
    }
    private static Bundle withLimit(Bundle b,int limit){b.putInt("road_speed_limit_kmh",limit);return b;}
    private static Bundle insideZone(Bundle b){b.putString("native_distance_kind","remaining_in_segment");return b;}

    @Test public void receiversSpeakTheirOwnLanguageAndTheUniformSound(){
        org.robolectric.RuntimeEnvironment.setQualifiers("de-rDE");
        WarningEvent announce=WarningCodec.decode(fields("p","POLICE","POLICE_VISIBLE","police_control","notice",600,"ANNOUNCE",1000),1000);
        WarningEvent spoken=UniformAlerts.localize(announce);
        assertEquals("Achtung, Kontrolle",spoken.message);assertEquals("de-DE",spoken.languageTag);
        assertEquals("subtle_beep.mp3",spoken.nativeSound);
        assertEquals(announce.warningId,spoken.warningId);assertEquals(announce.announcementIndex,spoken.announcementIndex);
        org.robolectric.RuntimeEnvironment.setQualifiers("pl-rPL");assertEquals("en-GB",UniformAlerts.localize(announce).languageTag);
        UniformAlerts.enabled=false;assertSame(announce,UniformAlerts.localize(announce));
    }

    @Test public void providerSideAnnouncesSilentAlertsOncePerStage(){
        UniformAlerts.Announcer a=new UniformAlerts.Announcer();
        assertNull(a.decide(event("SPEED_CAM","","speed_control","approach",1500),1000)); // still far
        Bundle near=a.decide(event("SPEED_CAM","","speed_control","approach",700),1000);
        assertNotNull(near);assertEquals("ANNOUNCE",near.getString("operation"));assertEquals("uniform_alert",near.getString("announcement_origin"));
        assertNull(a.decide(event("SPEED_CAM","","speed_control","approach",400),2000)); // once
        // The provider's own announcement moments later is not spoken again; a minute later it is a real repeat.
        assertTrue(a.suppress(WarningCodec.decode(fields("w-SPEED_CAM","SPEED_CAM","","speed_control","approach",300,"ANNOUNCE",3000),3000),3000));
        assertFalse(a.suppress(WarningCodec.decode(fields("w-SPEED_CAM","SPEED_CAM","","speed_control","approach",300,"ANNOUNCE",70_000),70_000),70_000));
        // A zone is announced ahead and again on entry; silent pills and display-only alerts never are.
        assertNotNull(a.decide(event("AVERAGE_SPEED_CAMERA","","average_speed_zone","approach",900),1000));
        assertNotNull(a.decide(event("AVERAGE_SPEED_CAMERA","","average_speed_zone","active",5000),1000));
        assertNull(a.decide(event("AVERAGE_SPEED_CAMERA","","average_speed_zone","active",4000),1000));
        Bundle silent=fields("s","POLICE","","police_control","notice",200,"UPSERT",1000);silent.putBoolean("native_visual_only",true);
        assertNull(a.decide(WarningCodec.decode(silent,1000),1000));
        assertNull(a.decide(event("POLICE","","display_only","notice",200),1000));
        a.cleared("w-SPEED_CAM");
        assertNull(a.decide(event("SPEED_CAM","","speed_control","approach",700),1000)); // same type moments ago
        assertNotNull(a.decide(WarningCodec.decode(fields("w-SPEED_CAM","SPEED_CAM","","speed_control","approach",700,"UPSERT",40_000),40_000),40_000));
    }

    @Test public void controlClearedAndShownAgainMidZoneIsNotAnnouncedAgain(){
        UniformAlerts.Announcer a=new UniformAlerts.Announcer();
        Bundle in=fields("AvgSpeedCheck:NL_3288","AVG_SPEED_CHECK","","speed_control","enter",9000,"UPSERT",1000);in.putString("native_distance_kind","remaining_in_segment");
        assertNotNull(a.decide(WarningCodec.decode(in,1000),1000));
        a.cleared("AvgSpeedCheck:NL_3288");
        Bundle again=fields("AvgSpeedCheck:NL_3288","AVG_SPEED_CHECK","","speed_control","enter",6000,"UPSERT",200_000);again.putString("native_distance_kind","remaining_in_segment");
        assertNull(a.decide(WarningCodec.decode(again,200_000),200_000));
    }
    @Test public void oneReportSplitIntoSeveralIsAnnouncedOnce(){
        UniformAlerts.Announcer a=new UniformAlerts.Announcer();
        assertNotNull(a.decide(WarningCodec.decode(fields("lane-1","BLOCKED_LANE","","closure","notice",600,"UPSERT",1000),1000),1000));
        assertNull(a.decide(WarningCodec.decode(fields("lane-2","BLOCKED_LANE","","closure","notice",500,"UPSERT",15_000),15_000),15_000));
        // The provider's own announcement of another report of the same closure is shown, not spoken again.
        WarningEvent nativeAnnounce=WarningCodec.decode(fields("lane-3","BLOCKED_LANE","","closure","notice",500,"ANNOUNCE",20_000),20_000);
        assertTrue(a.suppress(nativeAnnounce,20_000));
        WarningEvent later=WarningCodec.decode(fields("lane-4","BLOCKED_LANE","","closure","notice",500,"ANNOUNCE",45_000),45_000);
        assertFalse(a.suppress(later,45_000));a.announced(later,45_000);
        assertNull(a.decide(WarningCodec.decode(fields("lane-5","BLOCKED_LANE","","closure","notice",500,"UPSERT",60_000),60_000),60_000));
        // Cameras stay the provider's decision: another camera moments later is still spoken.
        WarningEvent cam1=WarningCodec.decode(fields("cam-1","SPEED_CAM","","speed_control","approach",300,"ANNOUNCE",61_000),61_000);
        assertFalse(a.suppress(cam1,61_000));a.announced(cam1,61_000);
        assertFalse(a.suppress(WarningCodec.decode(fields("cam-2","SPEED_CAM","","speed_control","approach",300,"ANNOUNCE",62_000),62_000),62_000));
    }

    @Test public void languageFollowsTheAppsOwnConfiguration(){
        org.robolectric.RuntimeEnvironment.setQualifiers("nl-rNL");Locale.setDefault(Locale.US);
        assertEquals("nl-NL",UniformAlerts.language());
        org.robolectric.RuntimeEnvironment.setQualifiers("pl-rPL");
        assertEquals("en-GB",UniformAlerts.language());
    }
}
