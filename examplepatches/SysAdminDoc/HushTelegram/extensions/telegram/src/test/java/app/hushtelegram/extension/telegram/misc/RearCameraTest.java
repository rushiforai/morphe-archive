/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class RearCameraTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.REAR_CAMERA_FIRST);
        Settings.REAR_CAMERA_FIRST.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTelegramPicksTheLens() {
        assertFalse(Settings.REAR_CAMERA_FIRST.get());
        assertTrue(RearCamera.front(true));
        assertFalse(RearCamera.front(false));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.REAR_CAMERA_FIRST));
    }

    @Test public void onTheCameraStartsOnTheRearLens() {
        Settings.REAR_CAMERA_FIRST.save(true);
        assertFalse(RearCamera.front(true));
        assertFalse(RearCamera.front(false));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTelegramsLens() {
        Settings.REAR_CAMERA_FIRST.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertTrue(reason.name(), RearCamera.front(true));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertTrue(RearCamera.front(true)));
        SettingReadsForTests.breakReads(Settings.REAR_CAMERA_FIRST);
        assertTrue(RearCamera.front(true));
        assertFalse(HookStatus.missing(FamilyNames.REAR_CAMERA_FIRST).isEmpty());
    }
}
