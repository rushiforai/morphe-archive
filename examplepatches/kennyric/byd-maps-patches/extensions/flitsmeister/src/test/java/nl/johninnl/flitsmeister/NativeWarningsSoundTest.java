package nl.johninnl.flitsmeister;

import static org.junit.Assert.*;

import android.content.Context;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

/** FM's own alert sound and on-screen warning set, observed without changing its decisions. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=32,manifest=Config.NONE)
public class NativeWarningsSoundTest {
    public static class SpeedCam extends NativeWarningsTest.BaseReport {
        private final String id;
        SpeedCam(String id){this.id=id;}
        @Override public String getId(){return id;}
        @Override public String getReportType(){return "SPEED_CAM";}
        public String getSpeedCamType(){return "RED_LIGHT_50";}
    }
    /** FM15's ma1 relevance candidate: the report is its public field a. */
    public static class Candidate {
        public final Object a;
        Candidate(Object report){a=report;}
    }
    private final List<Bundle> events=new ArrayList<>();
    private Context app;

    @Before public void before(){app=RuntimeEnvironment.getApplication();NativeWarnings.resetForTest(app,events::add);NativeWarnings.awaitSoundForTest(true);}
    @After public void after(){NativeWarnings.setEndpointForTest(null);}

    private List<Bundle> announcements(){List<Bundle> out=new ArrayList<>();for(Bundle b:events)if("ANNOUNCE".equals(b.getString("operation")))out.add(b);return out;}

    @Test public void announcementWaitsForFmsChosenSoundAndCarriesIt(){
        SpeedCam camera=new SpeedCam("2023473");
        NativeWarnings.regular(null,camera,true,false,"Roodlichtcamera",null);
        assertTrue("Held until FM chooses its sound",announcements().isEmpty());
        NativeWarnings.sound(camera,true,"flitser.m4a");
        assertEquals(1,announcements().size());
        assertEquals("flitser.m4a",announcements().get(0).getString("native_sound"));
        assertEquals("Roodlichtcamera",announcements().get(0).getString("message"));
    }

    @Test public void stateRefreshesKeepTheAnnouncedSoundButANewAnnouncementDoesNotInheritIt(){
        SpeedCam camera=new SpeedCam("2023473");
        NativeWarnings.regular(null,camera,true,false,"Roodlichtcamera",null);NativeWarnings.sound(camera,true,"flitser.m4a");
        // FM's alerted-reports snapshot re-describes the same report right after its signal.
        NativeWarnings.reports(java.util.Collections.singletonList(new NativeWarningsTest.Alerted(camera)));
        Bundle refreshed=events.get(events.size()-1);
        assertEquals("UPSERT",refreshed.getString("operation"));assertEquals("flitser.m4a",refreshed.getString("native_sound"));
        NativeWarnings.regular(null,camera,true,false,"Roodlichtcamera",null);NativeWarnings.noSound(camera,true);
        assertFalse(announcements().get(announcements().size()-1).containsKey("native_sound"));
    }

    @Test public void fmSilenceOrAnUnsafeNameAnnouncesWithoutASound(){
        SpeedCam quiet=new SpeedCam("1"),unsafe=new SpeedCam("2");
        NativeWarnings.regular(null,quiet,true,false,"Flitspaal",null);NativeWarnings.noSound(quiet,true);
        NativeWarnings.regular(null,unsafe,true,false,"Flitspaal",null);NativeWarnings.sound(unsafe,true,"../secret.m4a");
        assertEquals(2,announcements().size());
        for(Bundle b:announcements())assertFalse(b.containsKey("native_sound"));
    }

    @Test public void fmDotOrSoundPackPathsStillAnnounceAfterTheBoundedWait(){
        SpeedCam camera=new SpeedCam("3");
        NativeWarnings.regular(null,camera,true,false,"Flitspaal",null);
        ShadowLooper.idleMainLooper(NativeWarnings.SOUND_WAIT_MS-1,TimeUnit.MILLISECONDS);
        assertTrue(announcements().isEmpty());
        ShadowLooper.idleMainLooper(1,TimeUnit.MILLISECONDS);
        assertEquals(1,announcements().size());assertFalse(announcements().get(0).containsKey("native_sound"));
        NativeWarnings.sound(camera,true,"flitser.m4a");
        assertEquals("A late sound never re-announces",1,announcements().size());
    }

    @Test public void soundsMatchTheirOwnReportAndPhaseNeverAnotherCamera(){
        SpeedCam first=new SpeedCam("10"),second=new SpeedCam("11");
        NativeWarnings.regular(null,first,true,false,"Eerste",null);
        NativeWarnings.regular(null,second,true,false,"Tweede",null);
        NativeWarnings.sound(second,true,"flitser_hard.m4a");
        NativeWarnings.sound(first,false,"flitser.m4a");
        assertEquals(1,announcements().size());
        assertEquals("Tweede",announcements().get(0).getString("message"));
        assertEquals("flitser_hard.m4a",announcements().get(0).getString("native_sound"));
        NativeWarnings.noSound(first,true);
        assertEquals(2,announcements().size());assertFalse(announcements().get(1).containsKey("native_sound"));
    }

    @Test public void stoppingFlushesHeldAnnouncements(){
        NativeWarnings.regular(null,new SpeedCam("20"),true,false,"Flitspaal",null);
        NativeWarnings.stopped();
        assertEquals(1,announcements().size());
    }

    @Test public void fmsOnScreenWarningShowsWithoutAnAnnouncementAndHidesAgain(){
        SpeedCam camera=new SpeedCam("2023473");Candidate candidate=new Candidate(camera);
        NativeWarnings.visible(candidate);
        Bundle shown=events.get(events.size()-1);
        assertEquals("UPSERT",shown.getString("operation"));
        assertEquals("visible_state",shown.getString("capture_path"));
        assertEquals("SpeedCam:2023473",shown.getString("warning_id"));
        assertTrue(announcements().isEmpty());
        NativeWarnings.hidden(candidate);
        assertEquals("CLEAR",events.get(events.size()-1).getString("operation"));
    }

    @Test public void anAnnouncedWarningKeepsItsOwnLifecycleWhenFmHidesIt(){
        SpeedCam camera=new SpeedCam("5");Candidate candidate=new Candidate(camera);
        NativeWarnings.visible(candidate);
        NativeWarnings.regular(null,camera,true,false,"Flitspaal",null);NativeWarnings.noSound(camera,true);
        int count=events.size();
        NativeWarnings.hidden(candidate);
        assertEquals("The announcement path owns its exit and expiry",count,events.size());
    }

    @Test public void aSecondCameraIsNeverHeldBackByTheFirst(){
        NativeWarnings.visible(new Candidate(new SpeedCam("30")));
        NativeWarnings.visible(new Candidate(new SpeedCam("31")));
        assertEquals(2,events.stream().filter(b->"UPSERT".equals(b.getString("operation"))).map(b->b.getString("warning_id")).distinct().count());
    }

    @Test public void zonesAndJamsKeepTheirDedicatedState(){
        class AvgSpeedCheck extends NativeWarningsTest.BaseReport {}
        class TrafficJam extends NativeWarningsTest.BaseReport {}
        NativeWarnings.visible(new Candidate(new AvgSpeedCheck()));
        NativeWarnings.visible(new Candidate(new TrafficJam()));
        NativeWarnings.visible(new Object());
        assertTrue(events.isEmpty());
    }
}
