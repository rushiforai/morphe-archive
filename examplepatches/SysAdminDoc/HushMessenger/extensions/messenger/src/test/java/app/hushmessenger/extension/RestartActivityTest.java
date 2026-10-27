package app.hushmessenger.extension;

import android.content.ComponentName;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Insets;
import android.view.DisplayCutout;
import android.view.View;
import android.view.WindowInsets;
import android.widget.TextView;
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
        boolean exited, denied, changing, removedTask;
        @Override void exitProcess() { exited = true; }
        @Override void removeTask() { removedTask = true; super.removeTask(); }
        @Override public boolean isChangingConfigurations() { return changing || super.isChangingConfigurations(); }
        @Override public void startActivity(Intent intent) {
            if (denied) throw new SecurityException("Launcher disabled during restart");
            super.startActivity(intent);
        }
    }

    private static android.app.ActivityManager.AppTask appTask(int id) {
        var task = org.robolectric.shadows.ShadowAppTask.newInstance();
        var info = new android.app.ActivityManager.RecentTaskInfo();
        info.persistentId = id;
        if (android.os.Build.VERSION.SDK_INT >= 29) info.taskId = id;
        Shadows.shadowOf(task).setTaskInfo(info);
        return task;
    }

    private ResolveInfo entry(String name, String target) {
        ResolveInfo info = new ResolveInfo();
        info.activityInfo = new ActivityInfo();
        info.activityInfo.packageName = RuntimeEnvironment.getApplication().getPackageName();
        info.activityInfo.name = name;
        info.activityInfo.targetActivity = target;
        return info;
    }

    @Test public void restartDetailsFitANarrowWindowWithLargeText() {
        RuntimeEnvironment.setFontScale(2f);
        var app = RuntimeEnvironment.getApplication();
        View root = RestartActivity.content(new SettingsUi(app, false));
        root.measure(View.MeasureSpec.makeMeasureSpec(240, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(420, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 240, 420);
        TextView detail = root.findViewWithTag("restart_detail");
        assertTrue(detail.getWidth() > 0);
        assertTrue("Detail fits within the padded window", detail.getWidth() <= 192);
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

    @Test public void disabledLauncherCannotBeSelectedForRestart() {
        var app = RuntimeEnvironment.getApplication();
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(app.getPackageName());
        // Picking an alternate icon disables the default launcher at runtime; its manifest flag stays true.
        ResolveInfo stock = entry("com.facebook.orca.auth.StartScreenActivity", null);
        ResolveInfo manifestOff = entry("com.facebook.orca.DisabledIcon", "com.facebook.messenger.neue.MainActivity");
        manifestOff.activityInfo.enabled = false;
        Shadows.shadowOf(app.getPackageManager()).addResolveInfoForIntent(query, List.of(stock, manifestOff,
            entry("com.facebook.orca.ActiveIcon", "com.facebook.messenger.neue.MainActivity")));
        for (int state : new int[] {PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.COMPONENT_ENABLED_STATE_DISABLED_USER,
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED_UNTIL_USED}) {
            app.getPackageManager().setComponentEnabledSetting(new ComponentName(app, stock.activityInfo.name), state, PackageManager.DONT_KILL_APP);
            assertEquals("com.facebook.orca.ActiveIcon", RestartActivity.launcherIntent(app).getComponent().getClassName());
        }
    }

    @Test public void alternateIconEnabledAtRuntimeIsSelectedForRestart() {
        var app = RuntimeEnvironment.getApplication();
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(app.getPackageName());
        // Stock Messenger declares LauncherAlias* icons with android:enabled="false" and enables the chosen one at runtime.
        ResolveInfo alias = entry("com.facebook.orca.auth.LauncherAliasVaporwave", "com.facebook.messenger.neue.MainActivity");
        alias.activityInfo.enabled = false;
        Shadows.shadowOf(app.getPackageManager()).addResolveInfoForIntent(query, List.of(alias));
        app.getPackageManager().setComponentEnabledSetting(new ComponentName(app, alias.activityInfo.name),
            PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP);
        Intent launch = RestartActivity.launcherIntent(app);
        assertNotNull(launch);
        assertEquals(alias.activityInfo.name, launch.getComponent().getClassName());
    }

    @Test public void restartScreenFollowsTheSavedTheme() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(RestartActivity.class).setup()) {
                android.view.View pane = screen.get().findViewById(android.R.id.content).findViewWithTag("restart_page");
                TextView status = pane.findViewWithTag("restart_status");
                SettingsUi ui = new SettingsUi(screen.get(), light);
                assertEquals(ui.background, ((android.graphics.drawable.ColorDrawable) pane.getBackground()).getColor());
                // Both titles wear Messenger's gradient in this theme's stops.
                assertTrue(ShimmerTitle.wears(status));
                assertTrue(ShimmerTitle.wears(pane.findViewWithTag("restart_brand")));
                assertEquals(light, ui.light);
                // From API 35 enforced edge-to-edge ignores bar colors; the full-window status view shows behind them.
                if (android.os.Build.VERSION.SDK_INT < 35) {
                    assertEquals(ui.background, screen.get().getWindow().getStatusBarColor());
                    assertEquals(ui.background, screen.get().getWindow().getNavigationBarColor());
                }
            }
        }
        Settings.preferences.edit().clear().commit();
    }

    @Test public void previewCannotRestartTheSeparateStockMessenger() {
        assertNull(RestartActivity.launcherIntent(RuntimeEnvironment.getApplication()));
        try (var screen = Robolectric.buildActivity(RestartActivity.class).setup()) {
            assertTrue(screen.get().isFinishing());
            assertNull(Shadows.shadowOf(screen.get()).getNextStartedActivity());
            assertTrue(ShadowToast.getTextOfLatestToast().contains("Couldn't restart"));
        }
    }

    @Test @Config(sdk = {29, 36}) public void restartContentStaysClearOfCutoutsAndSystemBars() {
        var app = RuntimeEnvironment.getApplication();
        SettingsUi ui = new SettingsUi(app, false);
        View content = RestartActivity.content(ui);
        int[][] cases = {
            {0, 24, 0, 24, 80, 0, 0, 0, 80, 24, 0, 24},
            {0, 0, 0, 0, 0, 90, 0, 0, 0, 90, 0, 0},
            {0, 24, 0, 254, 0, 0, 80, 40, 0, 24, 80, 254}
        };
        for (int[] c : cases) {
            WindowInsets insets = new WindowInsets.Builder()
                .setSystemWindowInsets(Insets.of(c[0], c[1], c[2], c[3]))
                .setDisplayCutout(new DisplayCutout(Insets.of(c[4], c[5], c[6], c[7]), null, null, null, null))
                .build();
            WindowInsets left = content.dispatchApplyWindowInsets(insets);
            assertArrayEquals(new int[] {ui.dp(24) + c[8], ui.dp(24) + c[9], ui.dp(24) + c[10], ui.dp(24) + c[11]},
                new int[] {content.getPaddingLeft(), content.getPaddingTop(), content.getPaddingRight(), content.getPaddingBottom()});
            assertNull(left.getDisplayCutout());
        }
    }

    @Test public void restartContentFitsLargeTextInAShortWindow() {
        for (String locale : new String[] {"en-rUS", "ar-rXB"}) {
            RuntimeEnvironment.setQualifiers(locale + "-w320dp-h360dp-mdpi");
            RuntimeEnvironment.setFontScale(2f);
            for (boolean light : new boolean[] {false, true}) {
                View content = RestartActivity.content(new SettingsUi(RuntimeEnvironment.getApplication(), light));
                content.measure(View.MeasureSpec.makeMeasureSpec(320, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(360, View.MeasureSpec.EXACTLY));
                content.layout(0, 0, 320, 360);
                TextView status = content.findViewWithTag("restart_status");
                View message = (View) status.getParent();
                View center = (View) message.getParent();
                assertTrue("Message starts within its scrollable content", message.getTop() >= 0);
                assertTrue("Message ends within its scrollable content", message.getBottom() <= center.getHeight());
                assertEquals(0, status.getLayout().getEllipsisCount(status.getLineCount() - 1));
            }
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

    /**
     * A relaunch sent while this screen was still coming in left Messenger's start screen with no process on the S25
     * (2 of 3 restarts showed a black screen), so a saved restart waits until Android has shown the screen, or for a
     * while if it never says so. A failed save reports at once.
     */
    @Test public void aSavedRestartWaitsUntilTheScreenIsShown() {
        Intent start = new Intent(Intent.ACTION_MAIN);
        var slow = Robolectric.buildActivity(Probe.class).get();
        slow.launch = start;
        slow.saved(true);
        assertFalse("Still coming in", slow.exited);
        assertNull(Shadows.shadowOf(slow).getNextStartedActivity());
        slow.onEnterAnimationComplete();
        assertTrue(slow.exited);
        assertSame(start, Shadows.shadowOf(slow).getNextStartedActivity());
        var shownFirst = Robolectric.buildActivity(Probe.class).get();
        shownFirst.launch = start;
        shownFirst.onEnterAnimationComplete();
        assertFalse("Still saving", shownFirst.exited);
        shownFirst.saved(true);
        assertTrue(shownFirst.exited);
        assertSame(start, Shadows.shadowOf(shownFirst).getNextStartedActivity());
        var neverTold = Robolectric.buildActivity(Probe.class).get();
        neverTold.launch = start;
        neverTold.saved(true);
        var looper = Shadows.shadowOf(android.os.Looper.getMainLooper());
        looper.idleFor(java.time.Duration.ofMillis(RestartActivity.SHOWN_WAIT_MS - 1));
        assertFalse(neverTold.exited);
        looper.idleFor(java.time.Duration.ofMillis(1));
        assertTrue(neverTold.exited);
        neverTold.onEnterAnimationComplete();
        assertNotNull(Shadows.shadowOf(neverTold).getNextStartedActivity());
        assertNull("Told twice, it still relaunches once", Shadows.shadowOf(neverTold).getNextStartedActivity());
        var failed = Robolectric.buildActivity(Probe.class).get();
        failed.launch = start;
        failed.saved(false);
        assertFalse(failed.exited);
        assertNull(Shadows.shadowOf(failed).getNextStartedActivity());
        assertTrue(ShadowToast.getTextOfLatestToast().contains("wasn't restarted"));
        looper.idleFor(java.time.Duration.ofMillis(RestartActivity.SHOWN_WAIT_MS));
        assertFalse("A failed save never relaunches later", failed.exited);
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

    /**
     * A restart asked for from settings closes their whole task as it goes. A second settings screen stacked in it
     * outlived the process on the S22 and showed behind the reopened one on Back. The home screen shortcut's restart
     * only closes itself, and so does a Root Mount install's, whose settings live inside the stock host.
     */
    @Test public void aRestartFromSettingsClosesTheirTask() {
        var fromSettings = Robolectric.buildActivity(Probe.class, new Intent().putExtra(SettingsReopen.EXTRA, "controls")).get();
        var other = appTask(fromSettings.getTaskId() + 1);
        var settingsTask = appTask(fromSettings.getTaskId());
        var tasks = Shadows.shadowOf(fromSettings.getSystemService(android.app.ActivityManager.class));
        tasks.setAppTasks(java.util.List.of(other, settingsTask));
        fromSettings.completeRestart(new Intent(Intent.ACTION_MAIN), true);
        assertTrue(fromSettings.removedTask);
        // The whole task goes, found by its id, since this screen isn't the first in it. Messenger's own task stays.
        assertTrue(Shadows.shadowOf(settingsTask).isFinishedAndRemoved());
        assertFalse(Shadows.shadowOf(other).isFinishedAndRemoved());
        assertTrue(fromSettings.exited);
        // A task that can't be found leaves an ordinary finish.
        tasks.setAppTasks(java.util.List.of(other));
        var unlisted = Robolectric.buildActivity(Probe.class, new Intent().putExtra(SettingsReopen.EXTRA, "app")).get();
        unlisted.completeRestart(new Intent(Intent.ACTION_MAIN), true);
        assertTrue(unlisted.isFinishing());
        var fromShortcut = Robolectric.buildActivity(Probe.class).get();
        fromShortcut.completeRestart(new Intent(Intent.ACTION_MAIN), true);
        assertFalse(fromShortcut.removedTask);
        assertTrue(fromShortcut.isFinishing());
        var app = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(app.getPackageManager()).removeActivity(new android.content.ComponentName(app, SettingsActivity.class));
        var hosted = Robolectric.buildActivity(Probe.class, new Intent().putExtra(SettingsReopen.EXTRA, "app")).get();
        hosted.completeRestart(new Intent(Intent.ACTION_MAIN), true);
        assertFalse(hosted.removedTask);
        assertTrue(hosted.isFinishing());
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
