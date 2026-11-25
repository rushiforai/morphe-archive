package nl.johninnl.vela;

import static org.junit.Assert.*;
import java.lang.reflect.Method;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import nl.johninnl.navigation.alerts.*;

/** Android onStop(true)/onError before onStart do not prove that no output occurred. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class VelaStopContractTest {
    VelaWarningSpeakerTest fixture;
    @Before public void setup(){fixture=new VelaWarningSpeakerTest();fixture.setup();}
    @After public void cleanup(){fixture.cleanup();}
    private PlaybackGrant queued(){WarningEvent event=fixture.event();PlaybackGrant grant=fixture.grant(event);assertTrue(fixture.speaker.speak(event,grant,fixture.results));VelaWarningSpeaker.dispatch(fixture.guide.closure);assertEquals(1,fixture.engine.calls);assertEquals(0,fixture.results.starts);return grant;}
    private void stopped(boolean interrupted)throws Exception{
        // Exercise the previous two-argument ABI as RED, then the corrected binding without
        // inventing an onStart notification that Android does not guarantee for errors/stops.
        Object listener=new VelaWarningSpeakerTest.NativeListener(fixture.guide);
        try {Method method=VelaWarningSpeaker.class.getMethod("utteranceStopped",Object.class,String.class,boolean.class);method.invoke(null,listener,fixture.engine.id,interrupted);}
        catch(NoSuchMethodException oldAbi){VelaWarningSpeaker.class.getMethod("utteranceStopped",Object.class,String.class).invoke(null,listener,fixture.engine.id);}
        fixture.idle();
    }
    @Test public void interruptedSynthesisWithoutStartSuppressesAutomaticReplay()throws Exception{PlaybackGrant grant=queued();fixture.speaker.cancel(grant);stopped(true);assertEquals(PlaybackGrant.Outcome.UNCERTAIN,fixture.results.outcomes.get(fixture.results.outcomes.size()-1));assertTrue(fixture.results.quiet.get(fixture.results.quiet.size()-1));assertEquals(0,fixture.results.starts);}
    @Test public void errorWithoutStartCannotBeClassifiedAsSafeNoOutput(){queued();VelaWarningSpeaker.utteranceError(new VelaWarningSpeakerTest.NativeListener(fixture.guide),fixture.engine.id);fixture.idle();assertEquals(PlaybackGrant.Outcome.UNCERTAIN,fixture.results.outcomes.get(0));assertTrue(fixture.results.quiet.get(0));}
    @Test public void cancelledErrorWithoutStartRemainsUncertain(){PlaybackGrant grant=queued();fixture.speaker.cancel(grant);VelaWarningSpeaker.utteranceError(new VelaWarningSpeakerTest.NativeListener(fixture.guide),fixture.engine.id);fixture.idle();assertEquals(PlaybackGrant.Outcome.UNCERTAIN,fixture.results.outcomes.get(fixture.results.outcomes.size()-1));assertTrue(fixture.results.quiet.get(fixture.results.quiet.size()-1));}
    @Test public void flushedBeforeSynthesisIsPositiveNoStartProof()throws Exception{queued();stopped(false);assertEquals(PlaybackGrant.Outcome.NOT_STARTED,fixture.results.outcomes.get(0));assertTrue(fixture.results.quiet.get(0));}
    @Test public void intentionalCancelBeforeSynthesisRetainsCancelledOutcome()throws Exception{PlaybackGrant grant=queued();fixture.speaker.cancel(grant);stopped(false);assertEquals(PlaybackGrant.Outcome.CANCELLED,fixture.results.outcomes.get(fixture.results.outcomes.size()-1));assertTrue(fixture.results.quiet.get(fixture.results.quiet.size()-1));}
}
