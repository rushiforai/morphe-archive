/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.function.Consumer;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Facebook watching for screenshots and recordings through the extension. While the switch is on,
 * nothing reaches Android: the calls are made with a null activity and window manager, so one that
 * did would throw.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ScreenshotDetectionTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.BLOCK_SCREENSHOT_DETECTION.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String counterLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(ScreenshotDetection.ROUTE + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOnAndNothingReachesAndroid() {
        assertTrue("the switch starts on", Settings.BLOCK_SCREENSHOT_DETECTION.get());
        assertTrue(ScreenshotDetection.ignoresChange());
        ScreenshotDetection.registerScreenCaptureCallback(null, null, null);
        Consumer<Integer> callback = state -> { };
        assertEquals(ScreenshotDetection.NOT_RECORDED, ScreenshotDetection.addScreenRecordingCallback(null, null, callback));
        ScreenshotDetection.removeScreenRecordingCallback(null, callback);
        assertEquals(ScreenshotDetection.ROUTE + ": 3 lists, 3 items, 3 removed. Last reason: blocked. Removed: blocked 3. "
                + "Kinds: new picture 1, recording callback 1, screenshot callback 1", counterLine());
    }

    @Test
    public void offOrPausedFacebookWatches() {
        Settings.BLOCK_SCREENSHOT_DETECTION.save(false);
        assertFalse(ScreenshotDetection.ignoresChange());
        assertEquals(ScreenshotDetection.ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: new picture 1", counterLine());
        Settings.BLOCK_SCREENSHOT_DETECTION.resetToDefault();
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(ScreenshotDetection.ignoresChange());
        PauseForTests.resume();
        assertTrue(ScreenshotDetection.ignoresChange());
    }
}
