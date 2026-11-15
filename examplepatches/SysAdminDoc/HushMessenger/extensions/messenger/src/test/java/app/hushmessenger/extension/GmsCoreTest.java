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
    private java.util.Set<String> storedInstalled;
    private boolean storedPreview;

    @Before public void storeTheApplication() {
        stored = Settings.appContext;
        storedInstalled = Settings.installed;
        storedPreview = Settings.preview;
        Settings.appContext = context;
    }

    @After public void removeMicroG() {
        shadowOf(context.getPackageManager()).removePackage(GmsCore.PACKAGE);
        Settings.appContext = stored;
        Settings.installed = storedInstalled;
        Settings.preview = storedPreview;
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

    /** Messenger itself as GmsCore support's manifest edit leaves it, a patched (not preview) install with one control. */
    private void patchIn() throws Exception {
        PackageManager manager = context.getPackageManager();
        PackageInfo own = manager.getPackageInfo(context.getPackageName(),
                PackageManager.GET_META_DATA | PackageManager.GET_PROVIDERS | PackageManager.GET_PERMISSIONS);
        String[] had = own.requestedPermissions == null ? new String[0] : own.requestedPermissions;
        own.requestedPermissions = java.util.Arrays.copyOf(had, had.length + 1);
        own.requestedPermissions[had.length] = GmsCore.MICROG_RECEIVE;
        own.applicationInfo.metaData = new android.os.Bundle();
        own.applicationInfo.metaData.putBoolean("hush.feature.people", true);
        shadowOf(manager).installPackage(own);
    }

    @Test public void withoutThePatchPushComesFromPlayServicesWhenItsThere() {
        assertFalse(GmsCore.patchedIn(context));
        assertFalse(GmsCore.withoutPush(context));
        assertEquals("none, no Google Play services", GmsCore.pushRoute(context));
        install(GmsCore.PLAY_SERVICES);
        try {
            assertEquals("Google Play services", GmsCore.pushRoute(context));
        } finally {
            shadowOf(context.getPackageManager()).removePackage(GmsCore.PLAY_SERVICES);
        }
    }

    @Test public void withoutThePatchAPlayServicesTurnedOffGivesNoPush() {
        install(GmsCore.PLAY_SERVICES);
        try {
            context.getPackageManager().setApplicationEnabledSetting(GmsCore.PLAY_SERVICES,
                    PackageManager.COMPONENT_ENABLED_STATE_DISABLED_USER, 0);
            assertEquals("none, Google Play services is turned off", GmsCore.pushRoute(context));
            assertFalse("no warning without the patch", GmsCore.withoutPush(context));
        } finally {
            shadowOf(context.getPackageManager()).removePackage(GmsCore.PLAY_SERVICES);
        }
    }

    @Test public void aPackageManagerThatStopsAnsweringBreaksNeitherCopySetupNorTheHeader() {
        Context dead = new android.content.ContextWrapper(context) {
            @Override public PackageManager getPackageManager() {
                throw new IllegalStateException("package manager has died");
            }
        };
        assertEquals("unknown, the package manager didn't answer", GmsCore.pushRoute(dead));
        assertFalse(GmsCore.withoutPush(dead));
    }

    @Test public void patchedInWithoutMicroGMessengerHasNoPush() throws Exception {
        patchIn();
        install(GmsCore.PLAY_SERVICES);
        try {
            assertTrue(GmsCore.patchedIn(context));
            assertTrue("real Play services doesn't help once the patch points at microG-RE", GmsCore.withoutPush(context));
            assertEquals("none, GmsCore support is patched in and microG-RE isn't installed", GmsCore.pushRoute(context));
        } finally {
            shadowOf(context.getPackageManager()).removePackage(GmsCore.PLAY_SERVICES);
        }
    }

    @Test public void patchedInWithMicroGPushGoesThroughIt() throws Exception {
        patchIn();
        install(GmsCore.PACKAGE);
        assertFalse(GmsCore.withoutPush(context));
        assertEquals("microG-RE", GmsCore.pushRoute(context));
    }

    @Test public void patchedInWithMicroGTurnedOffMessengerHasNoPush() throws Exception {
        patchIn();
        install(GmsCore.PACKAGE);
        context.getPackageManager().setApplicationEnabledSetting(GmsCore.PACKAGE,
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED_USER, 0);
        assertTrue(GmsCore.withoutPush(context));
        assertEquals("none, GmsCore support is patched in and microG-RE is turned off", GmsCore.pushRoute(context));
    }

    /** #173: a no-push warning on a phone where GmsCore support went in without microG-RE. */
    @Test public void theSettingsHeaderSaysSoWhenGmsCoreSupportHasNoMicroG() throws Exception {
        patchIn();
        Settings.initialize(context);
        try (var screen = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = screen.get().getWindow().getDecorView();
            assertNull(root.findViewWithTag("preview_notice"));
            android.widget.TextView notice = root.findViewWithTag("gmscore_without_microg");
            assertNotNull(notice);
            assertEquals(android.view.View.VISIBLE, notice.getVisibility());
            assertTrue(notice.getText().toString().startsWith("GmsCore support is patched in, but microG-RE isn't installed"));
            install(GmsCore.PACKAGE);
            screen.pause().resume();
            assertEquals("installing microG-RE and coming back clears it", android.view.View.GONE, notice.getVisibility());
        }
        try (var screen = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View notice = screen.get().getWindow().getDecorView().findViewWithTag("gmscore_without_microg");
            assertTrue("microG-RE installed", notice == null || notice.getVisibility() == android.view.View.GONE);
        }
    }
}
