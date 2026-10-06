/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.view.Window;
import android.view.WindowManager;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Facebook setting a window's flags through the extension: the secure flag comes out while the
 * switch is on, and every other flag goes through as asked.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ScreenshotsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int SECURE = WindowManager.LayoutParams.FLAG_SECURE;
    private static final int KEEP_ON = WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON;

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.ALLOW_SCREENSHOTS.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static Window window() {
        return Robolectric.buildActivity(Activity.class).setup().get().getWindow();
    }

    private static int flags(Window window) {
        return window.getAttributes().flags;
    }

    private static String counterLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(Screenshots.ROUTE + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOnAndTakesOnlyTheSecureFlagOut() {
        assertTrue("the switch starts on", Settings.ALLOW_SCREENSHOTS.get());
        Window added = window();
        Screenshots.addFlags(added, SECURE | KEEP_ON);
        assertEquals(KEEP_ON, flags(added) & (SECURE | KEEP_ON));
        Window set = window();
        Screenshots.setFlags(set, SECURE, SECURE);
        assertEquals(0, flags(set) & SECURE);
        assertEquals(KEEP_ON, Screenshots.layoutFlags(SECURE | KEEP_ON));
        assertEquals(Screenshots.ROUTE + ": 3 lists, 3 items, 3 removed. Last reason: secure flag. Removed: secure flag 3",
                counterLine());
    }

    /** A window's other flags go through untouched and uncounted, and so does clearing the secure flag. */
    @Test
    public void otherFlagsGoThrough() {
        Window window = window();
        Screenshots.addFlags(window, KEEP_ON);
        assertEquals(KEEP_ON, flags(window) & KEEP_ON);
        Screenshots.setFlags(window, 0, KEEP_ON);
        assertEquals(0, flags(window) & KEEP_ON);
        assertEquals(KEEP_ON, Screenshots.layoutFlags(KEEP_ON));
        assertNull(counterLine());
        assertTrue(HookStatus.report("").toString(), !HookStatus.report("").toString()
                .contains(FamilyNames.SCREENSHOTS + ": invoked"));
    }

    @Test
    public void offOrPausedTheWindowStaysSecure() {
        Settings.ALLOW_SCREENSHOTS.save(false);
        Window off = window();
        Screenshots.addFlags(off, SECURE);
        assertEquals(SECURE, flags(off) & SECURE);
        assertEquals(Screenshots.ROUTE + ": 1 lists, 1 items, 0 removed", counterLine());
        Settings.ALLOW_SCREENSHOTS.resetToDefault();
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertEquals(SECURE, Screenshots.layoutFlags(SECURE));
        PauseForTests.resume();
        assertEquals(0, Screenshots.layoutFlags(SECURE));
    }
}
