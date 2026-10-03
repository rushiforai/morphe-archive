package app.hushmessenger.extension;

import android.app.Activity;
import android.view.Window;
import android.view.WindowManager;
import java.util.Collections;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ScreenshotFlagsTest {
    private static final int SECURE = WindowManager.LayoutParams.FLAG_SECURE;
    private static final int KEEP = WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON;
    private static final int FULL = WindowManager.LayoutParams.FLAG_FULLSCREEN;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void theSetFlagsWrapperKeepsTheMaskWhenNativeArgumentsShareARegister() {
        Settings.preferences.edit().putBoolean("allow_screenshot", true).commit();
        assertTrue(Settings.installed.contains("allow_screenshot"));
        try (var activity = Robolectric.buildActivity(Activity.class).setup()) {
            Window window = activity.get().getWindow();
            window.setFlags(SECURE | KEEP, ~0);
            Settings.setScreenshotFlags(window, SECURE, SECURE);
            assertEquals(KEEP, window.getAttributes().flags);
            window.setFlags(SECURE | KEEP, ~0);
            Settings.setScreenshotFlags(window, SECURE | FULL, SECURE | FULL);
            assertEquals(KEEP | FULL, window.getAttributes().flags);
        }
    }

    @Test public void addFlagsFiltersOnlyItsSecureArgumentAndKeepsOtherOwnersFlags() {
        Settings.preferences.edit().putBoolean("allow_screenshot", true).commit();
        try (var activity = Robolectric.buildActivity(Activity.class).setup()) {
            Window window = activity.get().getWindow();
            for (int existing : new int[] {KEEP, SECURE | KEEP}) {
                window.setFlags(existing, ~0);
                Settings.addScreenshotFlags(window, SECURE | FULL);
                assertEquals(existing | FULL, window.getAttributes().flags);
            }
        }
    }

    @Test public void offPauseSafeModeAndMissingCapabilityPassNativeFlagsThrough() {
        try (var activity = Robolectric.buildActivity(Activity.class).setup()) {
            Window window = activity.get().getWindow();
            for (String state : new String[] {"off", "paused", "safe", "missing"}) {
                Settings.initialize(RuntimeEnvironment.getApplication());
                Settings.preferences.edit().clear().putBoolean("allow_screenshot", !state.equals("off"))
                        .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
                CrashGuard.resetForTests();
                CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
                if (state.equals("missing")) Settings.installed = Collections.emptySet();
                window.setFlags(KEEP, ~0);
                Settings.setScreenshotFlags(window, SECURE | FULL, SECURE | FULL);
                assertEquals(state, KEEP | SECURE | FULL, window.getAttributes().flags);
                window.setFlags(KEEP, ~0);
                Settings.addScreenshotFlags(window, SECURE | FULL);
                assertEquals(state, KEEP | SECURE | FULL, window.getAttributes().flags);
            }
        }
    }
}
