package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.widget.Switch;
import java.time.Duration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/**
 * After an update the drawer icon can be back while `Hide app drawer icon` is on, and Android closes a screen the
 * moment the icon it was opened through goes. The screen stays open, and the icon goes once it closes.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class DrawerIconWaitTest {
    private Application app;
    private PackageManager packages;
    private ComponentName alias;

    @Before public void setUp() throws Exception {
        DrawerIconWait.resetForTests();
        app = RuntimeEnvironment.getApplication();
        packages = app.getPackageManager();
        var info = packages.getPackageInfo(app.getPackageName(), PackageManager.GET_META_DATA | PackageManager.GET_PROVIDERS);
        info.versionName = "582.0.0.61.92";
        info.setLongVersionCode((7L << 32) | 346415686L);
        info.applicationInfo.metaData = new Bundle();
        info.applicationInfo.metaData.putBoolean("hush.feature.people", true);
        info.applicationInfo.metaData.putBoolean("hush.feature.menu_row", true);
        Shadows.shadowOf(packages).installPackage(info);
        alias = new ComponentName(app.getPackageName(), SettingsActivity.DRAWER_ALIAS);
        Shadows.shadowOf(packages).addActivityIfNotPresent(alias);
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
    }

    @After public void tearDown() {
        Settings.preferences.edit().clear().commit();
        DrawerIconWait.resetForTests();
    }

    private boolean iconOff() {
        return packages.getComponentEnabledSetting(alias) == PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
    }

    /** What the launcher sends for the drawer icon. */
    private Intent throughIcon() {
        return new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setComponent(alias);
    }

    private ActivityController<SettingsActivity> openThroughIcon() {
        var screen = Robolectric.buildActivity(SettingsActivity.class, throughIcon()).setup();
        assertEquals("the screen came through the icon", alias, screen.get().getIntent().getComponent());
        return screen;
    }

    private static void close(ActivityController<? extends Activity> screen) {
        screen.get().finish();
        screen.pause().stop().destroy();
    }

    /** The process start SettingsProvider runs, with the icon back on after an update. */
    private void startProcess() {
        Settings.preferences.edit().putBoolean("hide_drawer_icon", true).commit();
        Robolectric.setupContentProvider(SettingsProvider.class, "app.hushmessenger.settings.test");
    }

    @Test public void aScreenOpenedThroughTheIconStaysOpenAndTheIconGoesWhenItCloses() {
        Settings.preferences.edit().putBoolean("hide_drawer_icon", true).commit();
        var screen = openThroughIcon();
        assertFalse("the icon stays while its screen is open", iconOff());
        screen.pause().stop();
        assertFalse("a stop alone, like a file picker opening over settings, keeps it", iconOff());
        screen.start().resume();
        close(screen);
        assertTrue("the icon goes once its screen closes", iconOff());
    }

    @Test public void aThemeChangeInAScreenOpenedThroughTheIconIsntAClose() {
        Settings.preferences.edit().putBoolean("hide_drawer_icon", true).commit();
        var screen = openThroughIcon();
        screen.recreate();
        assertFalse("the new copy of the screen is still the icon's", iconOff());
        close(screen);
        assertTrue(iconOff());
    }

    @Test public void turningTheSwitchOnInAScreenOpenedThroughTheIconWaitsForItToClose() {
        var screen = openThroughIcon();
        View root = screen.get().getWindow().getDecorView();
        root.findViewWithTag("tab_app").performClick();
        Switch hide = root.findViewWithTag("hide_drawer_icon");
        hide.setChecked(true);
        assertTrue(Settings.preferences.getBoolean("hide_drawer_icon", false));
        assertFalse("the icon stays while its screen is open", iconOff());
        close(screen);
        assertTrue(iconOff());
    }

    @Test public void turningTheSwitchBackOffBeforeClosingKeepsTheIcon() {
        var screen = openThroughIcon();
        View root = screen.get().getWindow().getDecorView();
        root.findViewWithTag("tab_app").performClick();
        Switch hide = root.findViewWithTag("hide_drawer_icon");
        hide.setChecked(true);
        hide.setChecked(false);
        close(screen);
        assertFalse(iconOff());
    }

    @Test public void atAProcessStartTheIconWaitsForTheFirstScreen() {
        startProcess();
        assertFalse("the first screen may be the icon's", iconOff());
        var screen = openThroughIcon();
        assertFalse(iconOff());
        close(screen);
        assertTrue(iconOff());
    }

    @Test public void aFirstScreenOpenedAnotherWayHidesTheIconThen() {
        startProcess();
        assertFalse(iconOff());
        var messenger = Robolectric.buildActivity(Activity.class).setup();
        assertTrue("Messenger's own first screen lets the icon go", iconOff());
        close(messenger);
    }

    @Test public void aStartThatShowsNoScreenHidesTheIconAfterAWhile() {
        startProcess();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(9));
        assertFalse(iconOff());
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
        assertTrue("a push or sync start with no screen hides it on its own", iconOff());
    }

    @Test public void aStartWithTheIconShownLeavesItShown() {
        Robolectric.setupContentProvider(SettingsProvider.class, "app.hushmessenger.settings.test");
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(11));
        assertFalse(iconOff());
    }
}
