package nl.johninnl.flitsmeister;

import static org.junit.Assert.*;
import android.app.Application;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class NativeWarningVersionTest {
    @Before public void setup(){NativeWarnings.setEndpointForTest(nl.johninnl.navigation.alerts.WarningEndpointFixtures.empty());}
    @After public void cleanup(){NativeWarnings.setEndpointForTest(null);}
    private Bundle metadata(String version,int code)throws Exception{
        Application app=RuntimeEnvironment.getApplication();PackageInfo info=app.getPackageManager().getPackageInfo(app.getPackageName(),0);
        info.versionName=version;info.versionCode=code;Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        NavigationControlService service=Robolectric.buildService(NavigationControlService.class).create().get();
        Bundle result=new Bundle();service.appendWarningCapabilities(result,10001);return result;
    }
    @Test public void pinned14AdvertisesRealEventProtocol()throws Exception{assertNotNull(metadata("14.17",1287).getBinder("warning_api"));}
    @Test public void pinned15AdvertisesItsAuditedEventProtocol()throws Exception{assertNotNull(metadata("15.0",1289).getBinder("warning_api"));}
    @Test public void pinned15UsesItsOwnCompleteCoverageDigest()throws Exception{
        NativeWarnings.setEndpointForTest(null);
        assertNotNull(metadata("15.0",1289).getBinder("warning_api"));
        java.lang.reflect.Field field=nl.johninnl.navigation.alerts.WarningEndpoint.class.getDeclaredField("profile");field.setAccessible(true);
        nl.johninnl.navigation.alerts.WarningCapabilities profile=(nl.johninnl.navigation.alerts.WarningCapabilities)field.get(NativeWarnings.endpoint());
        assertTrue(profile.complete);
        assertEquals(nl.johninnl.navigation.alerts.FlitsmeisterWarningTypes.MANIFEST_DIGEST_15,profile.manifestDigest);
        assertNotEquals(nl.johninnl.navigation.alerts.FlitsmeisterWarningTypes.MANIFEST_DIGEST,profile.manifestDigest);
    }
    @Test public void unreviewed15BuildKeepsLegacyControlWithoutClaimingNativeCapture()throws Exception{
        Bundle value=metadata("15.0",150000);assertFalse(value.containsKey("warning_api"));assertFalse(value.containsKey("warning_protocols"));
    }
    @Test public void sameNameDifferentArtifactCannotClaimCompleteCapture()throws Exception{assertFalse(metadata("14.17",1289).containsKey("warning_api"));}
}
