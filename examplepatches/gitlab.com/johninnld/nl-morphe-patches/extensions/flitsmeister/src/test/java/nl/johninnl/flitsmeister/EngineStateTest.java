package nl.johninnl.flitsmeister;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=34)
public class EngineStateTest {
 private boolean running() throws Exception {return (Boolean)NavigationBroadcasts.class.getMethod("engineRunning").invoke(null);}
 @Test public void broadcasterInitializationIsNotDrivingEngineReadiness() throws Exception {
  NavigationBroadcasts.resetForTest();NavigationBroadcasts.init(RuntimeEnvironment.getApplication());assertFalse(running());
  NavigationBroadcasts.started();assertTrue(running());NavigationBroadcasts.stopped();assertFalse(running());NavigationBroadcasts.resetForTest();
 }
}
