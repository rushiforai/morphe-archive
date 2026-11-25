package nl.johninnl.navigation.startup;
import android.Manifest;
import android.content.Context;
import org.robolectric.RuntimeEnvironment;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.Shadows;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=34)
public class StartupPermissionTest {
    private String state(Context c,boolean enabled,boolean running) throws Exception {
        return (String)Class.forName("nl.johninnl.navigation.startup.StartupProtocol").getMethod("state",Context.class,boolean.class,boolean.class).invoke(null,c,enabled,running);
    }
    @Test public void deniedLocationNeverOffersAStartAndDisableWins() throws Exception {
        Context c=RuntimeEnvironment.getApplication();
        Shadows.shadowOf((android.app.Application)c).denyPermissions(Manifest.permission.ACCESS_FINE_LOCATION,Manifest.permission.ACCESS_COARSE_LOCATION);
        assertEquals("permission_required",state(c,true,false));assertEquals("disabled",state(c,false,true));
    }
    @Test public void runningEngineDoesNotDependOnHavingGpsData() throws Exception {
        Context c=RuntimeEnvironment.getApplication();Shadows.shadowOf((android.app.Application)c).grantPermissions(Manifest.permission.ACCESS_COARSE_LOCATION);
        assertEquals("running",state(c,true,true));assertEquals("stopped",state(c,true,false));
    }
}
