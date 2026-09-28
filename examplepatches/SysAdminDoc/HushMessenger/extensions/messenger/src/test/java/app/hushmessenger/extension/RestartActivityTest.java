package app.hushmessenger.extension;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import java.lang.reflect.Proxy;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class RestartActivityTest {
    public static class Probe extends RestartActivity {
        boolean exited, denied;
        @Override void exitProcess() { exited = true; }
        @Override public void startActivity(Intent intent) {
            if (denied) throw new SecurityException("Launcher disabled during restart");
            super.startActivity(intent);
        }
    }

    private ResolveInfo entry(String name, String target) {
        ResolveInfo info = new ResolveInfo();
        info.activityInfo = new ActivityInfo();
        info.activityInfo.packageName = RuntimeEnvironment.getApplication().getPackageName();
        info.activityInfo.name = name;
        info.activityInfo.targetActivity = target;
        return info;
    }

    @Test public void selectsActiveMessengerIconInsteadOfSettingsOrTheirAliases() {
        var app = RuntimeEnvironment.getApplication();
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(app.getPackageName());
        Shadows.shadowOf(app.getPackageManager()).addResolveInfoForIntent(query, List.of(
            entry(SettingsActivity.class.getName(), null), entry("settings.Alias", SettingsActivity.class.getName()),
            entry("com.facebook.orca.auth.CustomIcon", "com.facebook.messenger.neue.MainActivity")));
        Intent launch = RestartActivity.launcherIntent(app);
        assertNotNull(launch);
        assertEquals("com.facebook.orca.auth.CustomIcon", launch.getComponent().getClassName());
        assertEquals(app.getPackageName(), launch.getPackage());
        assertEquals(Intent.ACTION_MAIN, launch.getAction());
        assertTrue(launch.hasCategory(Intent.CATEGORY_LAUNCHER));
        assertEquals(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK,
            launch.getFlags() & (Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK));
    }

    @Test public void previewCannotRestartTheSeparateStockMessenger() {
        assertNull(RestartActivity.launcherIntent(RuntimeEnvironment.getApplication()));
        try (var screen = Robolectric.buildActivity(RestartActivity.class).setup()) {
            assertTrue(screen.get().isFinishing());
            assertNull(Shadows.shadowOf(screen.get()).getNextStartedActivity());
            assertTrue(ShadowToast.getTextOfLatestToast().contains("Couldn't restart"));
        }
    }

    @Test public void pendingChoicesAreCommittedWithoutClearingAnyPreferences() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        var prefs = Settings.preferences;
        prefs.edit().clear().commit();
        prefs.edit().putBoolean("people", true).putBoolean("paused", true).putString("unrelated", "keep").apply();
        assertTrue(RestartActivity.saveBeforeRestart(prefs));
        assertTrue(prefs.getBoolean("people", false));
        assertTrue(prefs.getBoolean("paused", false));
        assertEquals("keep", prefs.getString("unrelated", null));
        assertTrue(prefs.contains("restart_requested_at"));
    }

    @Test public void diskFailureOrExceptionDoesNotClaimChoicesWereSaved() {
        for (boolean throwsError : new boolean[] {false, true}) {
            var editor = (SharedPreferences.Editor) Proxy.newProxyInstance(getClass().getClassLoader(),
                new Class<?>[] {SharedPreferences.Editor.class}, (proxy, method, args) -> {
                    if (method.getName().equals("commit")) {
                        if (throwsError) throw new IllegalStateException("Storage unavailable");
                        return false;
                    }
                    return proxy;
                });
            var prefs = (SharedPreferences) Proxy.newProxyInstance(getClass().getClassLoader(),
                new Class<?>[] {SharedPreferences.class}, (proxy, method, args) -> editor);
            assertFalse(RestartActivity.saveBeforeRestart(prefs));
        }
        assertFalse(RestartActivity.saveBeforeRestart(null));
    }

    @Test public void failedSaveDoesNotLaunchOrExit() {
        var screen = Robolectric.buildActivity(Probe.class).get();
        screen.completeRestart(new Intent(), false);
        assertFalse(screen.exited);
        assertNull(Shadows.shadowOf(screen).getNextStartedActivity());
        assertTrue(ShadowToast.getTextOfLatestToast().contains("wasn't restarted"));
    }

    @Test public void exitOnlyFollowsSuccessfulLauncherDispatch() {
        var screen = Robolectric.buildActivity(Probe.class).get();
        Intent intent = new Intent(Intent.ACTION_MAIN);
        screen.completeRestart(intent, true);
        assertSame(intent, Shadows.shadowOf(screen).getNextStartedActivity());
        assertTrue(screen.exited);
        var rejected = Robolectric.buildActivity(Probe.class).get();
        rejected.denied = true;
        rejected.completeRestart(intent, true);
        assertFalse(rejected.exited);
        assertTrue(ShadowToast.getTextOfLatestToast().contains("Couldn't restart"));
    }

    @Test public void appPageButtonUsesTheSameRestartEntryAsTheShortcut() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            var root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("restart_messenger").performClick();
            Intent launch = Shadows.shadowOf(screen.get()).getNextStartedActivity();
            assertEquals(RestartActivity.class.getName(), launch.getComponent().getClassName());
            assertEquals(screen.get().getPackageName(), launch.getComponent().getPackageName());
        }
    }
}
