package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowApplication;
import org.robolectric.shadows.ShadowLog;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class HostScreensTest {
    private static final int SEPARATE = Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_NEW_DOCUMENT;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
    }

    @After public void forgetApplication() {
        HostScreens.applicationCreated(null);
        Settings.initialize(RuntimeEnvironment.getApplication());
    }

    private static Intent host(String screen) {
        Intent intent = new Intent();
        if (screen != null) intent.putExtra(HostScreens.EXTRA, screen);
        return intent;
    }

    /**
     * What a Root Mount install looks like to the app: PackageManager has never heard of HushMessenger's activities.
     * Robolectric adds an activity back when a test builds it, so they're disabled too, as on the phone test.
     */
    private static void mount() {
        Application app = RuntimeEnvironment.getApplication();
        var packages = Shadows.shadowOf(app.getPackageManager());
        for (Class<?> screen : new Class<?>[] {SettingsActivity.class, RestartActivity.class}) {
            ComponentName name = new ComponentName(app, screen);
            app.getPackageManager().setComponentEnabledSetting(name, PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
            packages.removeActivity(name);
        }
    }

    @Test public void onlyAStockHostWithAScreenBecomesAHushMessengerScreen() {
        assertTrue(HostScreens.activityFor(HostScreens.SCREEN_HOST, host("settings")) instanceof SettingsActivity);
        assertTrue(HostScreens.activityFor(HostScreens.SCREEN_HOST, host("restart")) instanceof RestartActivity);
        for (String screen : new String[] {"settings", "restart"}) {
            assertTrue(HostScreens.activityFor(HostScreens.SHORTCUT_HOST, host(screen)) instanceof HostScreens.ShortcutTrampoline);
        }
        // Messenger's own use of either activity, other activities and other extras stay stock.
        assertNull(HostScreens.activityFor(HostScreens.SCREEN_HOST, host(null)));
        assertNull(HostScreens.activityFor(HostScreens.SHORTCUT_HOST, host(null)));
        assertNull(HostScreens.activityFor(HostScreens.SCREEN_HOST, host("other")));
        assertNull(HostScreens.activityFor("com.facebook.messenger.neue.MainActivity", host("settings")));
        assertNull(HostScreens.activityFor(null, host("settings")));
        assertNull(HostScreens.activityFor(HostScreens.SCREEN_HOST, null));
        Intent wrongType = new Intent().putExtra(HostScreens.EXTRA, 1);
        assertNull(HostScreens.activityFor(HostScreens.SCREEN_HOST, wrongType));
    }

    @Test public void aNormalInstallOpensTheRealScreensAsBefore() {
        Application app = RuntimeEnvironment.getApplication();
        assertFalse(HostScreens.hosted(app));
        Intent settings = HostScreens.intentFor(app, HostScreens.SETTINGS);
        assertEquals(new ComponentName(app, SettingsActivity.class), settings.getComponent());
        assertEquals(Intent.FLAG_ACTIVITY_NEW_TASK, settings.getFlags());
        assertFalse(settings.hasExtra(HostScreens.EXTRA));
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Intent restart = HostScreens.intentFor(screen.get(), HostScreens.RESTART);
            assertEquals(new ComponentName(app, RestartActivity.class), restart.getComponent());
            assertEquals(0, restart.getFlags());
        }
        assertEquals(Intent.FLAG_ACTIVITY_NEW_TASK, HostScreens.intentFor(app, HostScreens.RESTART).getFlags());
    }

    @Test public void aDisabledSettingsActivityCountsAsHosted() {
        Application app = RuntimeEnvironment.getApplication();
        app.getPackageManager().setComponentEnabledSetting(new ComponentName(app, SettingsActivity.class),
            PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
        assertTrue(HostScreens.hosted(app));
    }

    @Test public void aRootMountInstallOpensTheScreensInsideTheStockHost() {
        mount();
        Application app = RuntimeEnvironment.getApplication();
        assertTrue(HostScreens.hosted(app));
        Intent settings = HostScreens.intentFor(app, HostScreens.SETTINGS);
        assertEquals(new ComponentName(app.getPackageName(), HostScreens.SCREEN_HOST), settings.getComponent());
        assertEquals("settings", settings.getStringExtra(HostScreens.EXTRA));
        // The host shares Messenger's task affinity, so settings open as their own document task instead.
        assertEquals(SEPARATE, settings.getFlags());
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Intent restart = HostScreens.intentFor(screen.get(), HostScreens.RESTART);
            assertEquals(new ComponentName(app.getPackageName(), HostScreens.SCREEN_HOST), restart.getComponent());
            assertEquals("restart", restart.getStringExtra(HostScreens.EXTRA));
            assertEquals(0, restart.getFlags());
        }
    }

    @Test public void aShortcutOpensTheScreenAndClosesItself() {
        for (boolean mounted : new boolean[] {false, true}) {
            if (mounted) mount();
            for (String screen : new String[] {"settings", "restart"}) {
                Intent shortcut = host(screen).setClassName(RuntimeEnvironment.getApplication(), HostScreens.SHORTCUT_HOST);
                try (var trampoline = Robolectric.buildActivity(HostScreens.ShortcutTrampoline.class, shortcut).setup()) {
                    Intent opened = Shadows.shadowOf(trampoline.get()).getNextStartedActivity();
                    assertEquals(HostScreens.intentFor(trampoline.get(), screen).filterEquals(opened), true);
                    assertEquals(HostScreens.intentFor(trampoline.get(), screen).getFlags(), opened.getFlags());
                    assertEquals(mounted ? screen : null, opened.getStringExtra(HostScreens.EXTRA));
                    assertTrue(trampoline.get().isFinishing());
                }
            }
        }
    }

    @Test public void theMenuRowOpensSettingsInsideTheHostOnARootMountInstall() {
        mount();
        Application app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            TextView row = new TextView(screen.get());
            row.setText("HushMessenger");
            View item = new View(screen.get());
            Settings.handleMenuItemBound(new MenuRowHolder(row, item));
            item.performClick();
            Intent opened = Shadows.shadowOf(screen.get()).getNextStartedActivity();
            assertEquals(HostScreens.SCREEN_HOST, opened.getComponent().getClassName());
            assertEquals("settings", opened.getStringExtra(HostScreens.EXTRA));
        }
    }

    /** The two fields Messenger's Menu row view holder keeps, under their obfuscated names. */
    static class MenuRowHolderBase {
        View A0I;
    }

    static final class MenuRowHolder extends MenuRowHolderBase {
        TextView A06;
        MenuRowHolder(TextView text, View item) { A06 = text; A0I = item; }
    }

    @Test public void settingsStartOnFirstUseWhenTheirProviderNeverRan() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        Settings.preferences = null;
        Settings.installed = Set.of();
        HostScreens.applicationCreated(app);
        app.getSharedPreferences("hushmessenger", 0).edit().putBoolean("people", true).commit();
        assertTrue(Settings.enabled("people"));
        assertNotNull(Settings.preferences);
        assertTrue(Settings.installed.contains("people"));
    }

    @Test public void anApplicationAndroidHasntAttachedYetIsLeftAlone() {
        Settings.preferences = null;
        Settings.installed = Set.of();
        HostScreens.applicationCreated(new Application());
        assertFalse(Settings.enabled("people"));
        assertNull(Settings.preferences);
        HostScreens.applicationCreated(null);
        assertFalse(Settings.enabled("people"));
    }

    @Test public void messengersOtherProcessesStayStockLikeOnANormalInstall() {
        Application app = RuntimeEnvironment.getApplication();
        Settings.preferences = null;
        Settings.installed = Set.of();
        HostScreens.applicationCreated(app);
        app.getSharedPreferences("hushmessenger", 0).edit().putBoolean("people", true).commit();
        ShadowApplication.setProcessName(app.getPackageName() + ":mqtt");
        try {
            assertFalse(Settings.enabled("people"));
            assertNull(Settings.preferences);
            assertFalse(HostScreens.started);
        } finally {
            ShadowApplication.setProcessName(app.getPackageName());
        }
        assertTrue(Settings.enabled("people"));
        assertTrue(HostScreens.started);
    }

    @Test public void aSettingsScreenThatStartsTheProcessChecksSafeModeFirst() {
        Settings.preferences.edit().putBoolean("safe_mode", true).commit();
        Settings.preferences = null;
        Settings.installed = Set.of();
        Robolectric.buildActivity(SettingsActivity.class).create();
        assertTrue(HostScreens.started);
        assertTrue(CrashGuard.isSafeMode());
    }

    @Test public void aStartThatFailsLeavesEveryControlStockUntilTheNextProcess() {
        Application app = RuntimeEnvironment.getApplication();
        Settings.preferences = null;
        Settings.installed = Set.of();
        HostScreens.applicationCreated(app);
        // A safe-mode flag stored as the wrong type makes CrashGuard throw while reading it.
        app.getSharedPreferences("hushmessenger", 0).edit().putBoolean("people", true).putString("safe_mode", "on").commit();
        ShadowLog.clear();
        assertFalse(Settings.enabled("people"));
        assertTrue(HostScreens.failed);
        assertFalse(HostScreens.started);
        assertFalse(Settings.enabled("people"));
        assertEquals("tried once", 1, ShadowLog.getLogsForTag("HushMessenger").stream()
            .filter(item -> "Can't start settings".equals(item.msg)).count());
    }

    @Test public void aStockLaunchOfAHostKeepsItsExtrasReadable() {
        Intent stock = new Intent().putExtra("stock", "value");
        // Stands in for the loader Android would otherwise leave on the extras until after the factory returns.
        stock.setExtrasClassLoader(new ClassLoader(null) { });
        assertNull(HostScreens.activityFor(HostScreens.SCREEN_HOST, stock));
        assertEquals(HostScreens.class.getClassLoader(), stock.getExtras().getClassLoader());
        assertEquals("value", stock.getStringExtra("stock"));
    }

    @Test public void thePatchedControlListIsReadLikeTheManifest() {
        assertEquals(Set.of(), Settings.bundled(""));
        assertEquals(Set.of(), Settings.bundled(null));
        assertEquals(Set.of("ads", "menu_row", "people"), Settings.bundled("ads,menu_row,people"));
        assertEquals(Set.of("ads"), Settings.bundled(",ads,"));
        // The extension alone records nothing; the patch writes the list.
        assertEquals("", HostScreens.bundledControls());
    }

    @Test public void onARootMountInstallTheAppTabLeavesOutTheDrawerIcon() {
        Application app = RuntimeEnvironment.getApplication();
        PackageInfo info = Shadows.shadowOf(app.getPackageManager()).getInternalMutablePackageInfo(app.getPackageName());
        info.applicationInfo.metaData = new Bundle();
        info.applicationInfo.metaData.putBoolean("hush.feature.menu_row", true);
        for (boolean mounted : new boolean[] {false, true}) {
            var controller = Robolectric.buildActivity(SettingsActivity.class);
            // Building the activity registers it with PackageManager again, so the mount comes after.
            if (mounted) mount();
            try (var screen = controller.setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                TextView help = root.findViewWithTag("access_help");
                assertEquals(new SettingsText(app).get(mounted ? "access_help_hosted_menu" : "access_help_menu"), help.getText().toString());
                assertEquals(mounted, root.findViewWithTag("hide_drawer_icon") == null);
                root.findViewWithTag("restart_messenger").performClick();
                Intent restart = Shadows.shadowOf(screen.get()).getNextStartedActivity();
                assertEquals(mounted ? HostScreens.SCREEN_HOST : RestartActivity.class.getName(), restart.getComponent().getClassName());
                assertEquals(mounted ? "restart" : null, restart.getStringExtra(HostScreens.EXTRA));
            }
        }
    }
}
