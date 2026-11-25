package nl.johninnl.navigation.startup;
import org.junit.Test;
import static org.junit.Assert.*;
public class WazeStartupTest {
 @Test public void invokesNativeWazeInitializerWithoutActivityOrJustStartingService() throws Exception {
  com.waze.ls app=new com.waze.ls();Class<?> c=Class.forName("org.ungoogled.waze.NavigationStartup");
  c.getMethod("initialize",android.app.Application.class).invoke(null,app);assertEquals(1,app.initializations);
 }
 @Test public void healthRequiresNativeInitialization() throws Exception {
  Class<?> c=Class.forName("org.ungoogled.waze.NavigationStartup");com.waze.NativeManager.started=false;
  assertFalse((Boolean)c.getMethod("running").invoke(null));com.waze.NativeManager.started=true;
  assertTrue((Boolean)c.getMethod("running").invoke(null));com.waze.NativeManager.started=false;
 }
}

