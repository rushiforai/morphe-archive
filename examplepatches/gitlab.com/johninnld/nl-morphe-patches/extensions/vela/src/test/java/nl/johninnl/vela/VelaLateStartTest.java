package nl.johninnl.vela;

import static org.junit.Assert.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import nl.johninnl.navigation.alerts.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class VelaLateStartTest {
    VelaWarningSpeakerTest fixture;
    @Before public void setup(){fixture=new VelaWarningSpeakerTest();fixture.setup();}
    @After public void cleanup(){fixture.cleanup();}
    @Test public void lateNativeStartIsReportedWithOldGrantAndStoppedWithoutReplay(){
        WarningEvent event=fixture.event();PlaybackGrant grant=fixture.grant(event);List<PlaybackGrant> started=new ArrayList<>();List<PlaybackGrant.Outcome> outcomes=new ArrayList<>();List<Boolean> quiet=new ArrayList<>();
        VelaWarningSpeaker.Listener listener=new VelaWarningSpeaker.Listener(){public void started(PlaybackGrant value){started.add(value);}public void finished(PlaybackGrant value,PlaybackGrant.Outcome outcome,boolean quiescent){assertEquals(grant.attemptId,value.attemptId);outcomes.add(outcome);quiet.add(quiescent);}};
        assertTrue(fixture.speaker.speak(event,grant,listener));VelaWarningSpeaker.dispatch(fixture.guide.closure);String id=fixture.engine.id;fixture.speaker.cancel(grant);
        VelaWarningSpeaker.utteranceStart(new VelaWarningSpeakerTest.NativeListener(fixture.guide),id);fixture.idle();
        assertEquals(1,started.size());assertSame(grant,started.get(0));assertTrue(fixture.engine.stops>=2);assertEquals(Collections.singletonList(false),quiet);
        VelaWarningSpeaker.utteranceStart(new VelaWarningSpeakerTest.NativeListener(fixture.guide),id);fixture.idle();assertEquals(1,started.size());
        // Android positively stops this OLD tagged utterance. The new epoch is never invented.
        try{VelaWarningSpeaker.class.getMethod("utteranceStopped",Object.class,String.class,boolean.class).invoke(null,new VelaWarningSpeakerTest.NativeListener(fixture.guide),id,true);}catch(Exception error){throw new AssertionError(error);}fixture.idle();
        assertTrue(quiet.get(quiet.size()-1));assertEquals(PlaybackGrant.Outcome.CANCELLED,outcomes.get(outcomes.size()-1));assertFalse(fixture.speaker.speak(event,grant,listener));assertEquals(1,fixture.engine.calls);
    }
}
