package app.hushmessenger.extension;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

/** GmsCore support's two checks pass only while microG-RE is installed. */
@RunWith(RobolectricTestRunner.class)
public class GmsCoreTest {
    private final Context context = RuntimeEnvironment.getApplication();
    private Context stored;

    @Before public void storeTheApplication() {
        stored = Settings.appContext;
        Settings.appContext = context;
    }

    @After public void removeMicroG() {
        shadowOf(context.getPackageManager()).removePackage(GmsCore.PACKAGE);
        Settings.appContext = stored;
    }

    private void install(String packageName) {
        PackageInfo info = new PackageInfo();
        info.packageName = packageName;
        shadowOf(context.getPackageManager()).installPackage(info);
    }

    @Test public void withMicroGTheCheckPassesSoMessengerUsesIt() {
        install(GmsCore.PACKAGE);
        assertEquals("ConnectionResult.SUCCESS", 0, GmsCore.availability(context));
    }

    @Test public void withoutMicroGTheCheckSaysPlayServicesIsMissing() {
        assertEquals("ConnectionResult.SERVICE_MISSING", 1, GmsCore.availability(context));
    }

    @Test public void realPlayServicesAloneDoesNotCount() {
        install("com.google.android.gms");
        try {
            assertEquals("the reroute only talks to microG-RE", 1, GmsCore.availability(context));
            assertFalse(GmsCore.signsInThroughMicroG());
        } finally {
            shadowOf(context.getPackageManager()).removePackage("com.google.android.gms");
        }
    }

    @Test public void aMicroGTurnedOffInAppSettingsCountsAsDisabled() {
        install(GmsCore.PACKAGE);
        context.getPackageManager().setApplicationEnabledSetting(GmsCore.PACKAGE,
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED_USER, 0);
        assertEquals("ConnectionResult.SERVICE_DISABLED", 3, GmsCore.availability(context));
        assertFalse("the framework provider answers for itself", GmsCore.signsInThroughMicroG());
    }

    @Test public void withMicroGTheFrameworkProviderStepsAsideForIt() {
        install(GmsCore.PACKAGE);
        assertTrue("sign-in goes to microG-RE's provider", GmsCore.signsInThroughMicroG());
    }

    @Test public void withoutMicroGTheFrameworkProviderAnswersForItself() {
        assertFalse("a password manager can still offer a saved login", GmsCore.signsInThroughMicroG());
    }

    @Test public void beforeTheSettingsProviderStartsTheFrameworkProviderAnswersForItself() {
        install(GmsCore.PACKAGE);
        Settings.appContext = null;
        assertFalse(GmsCore.signsInThroughMicroG());
    }
}
