package nl.johninnl.vela;

import static org.junit.Assert.*;
import android.os.Bundle;
import android.os.SystemClock;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import nl.johninnl.navigation.alerts.*;

/** Urgency changes only the scoped external preroll; the same selected native engine receives text. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class VelaUrgentLeadTest {
    VelaWarningSpeakerTest fixture;
    @Before public void setup(){fixture=new VelaWarningSpeakerTest();fixture.setup();}
    @After public void cleanup(){fixture.cleanup();}
    @Test public void p0DoesNotAddAnArtificialSilentUtteranceBeforeItsNativeText(){WarningEvent event=fixture.event();assertEquals(WarningEvent.Priority.P0,event.priority);assertTrue(fixture.speaker.speak(event,fixture.grant(event),fixture.results));VelaWarningSpeaker.dispatch(fixture.guide.closure);assertEquals(0,fixture.engine.leadCalls);assertEquals(1,fixture.engine.calls);assertEquals(event.message,fixture.engine.text);assertEquals(0,fixture.results.starts);}
    @Test public void ordinaryNativeTextRetainsExistingPrerollAndEnqueueDoesNotInventStart(){Bundle fields=WarningCodec.encode(fixture.event());fields.putInt("priority",1);WarningEvent event=WarningCodec.decode(fields,SystemClock.elapsedRealtime());assertTrue(fixture.speaker.speak(event,fixture.grant(event),fixture.results));VelaWarningSpeaker.dispatch(fixture.guide.closure);assertEquals(1,fixture.engine.leadCalls);assertEquals(1,fixture.engine.calls);assertEquals(event.message,fixture.engine.text);assertEquals(0,fixture.results.starts);}
}
