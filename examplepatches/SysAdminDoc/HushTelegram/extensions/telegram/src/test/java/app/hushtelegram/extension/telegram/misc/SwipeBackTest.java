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
public class SwipeBackTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.SWIPE_BACK_ON_PROFILES);
        Settings.SWIPE_BACK_ON_PROFILES.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultThePhotosAndTabsKeepTheSwipe() {
        assertFalse(Settings.SWIPE_BACK_ON_PROFILES.get());
        assertTrue(SwipeBack.touchBlocks(true));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.SWIPE_BACK_ON_PROFILES));
    }

    @Test public void onASwipeOnThePhotosOrTabsGoesBack() {
        Settings.SWIPE_BACK_ON_PROFILES.save(true);
        assertFalse(SwipeBack.touchBlocks(true));
        assertTrue(String.join("\n", HookStatus.report()).contains("profile swipe sent back 1"));
    }

    @Test public void aTouchElsewhereOnTheProfileIsLeftAlone() {
        assertFalse(SwipeBack.touchBlocks(false));
        Settings.SWIPE_BACK_ON_PROFILES.save(true);
        assertFalse(SwipeBack.touchBlocks(false));
        assertFalse(String.join("\n", HookStatus.report()).contains("profile swipe sent back"));
    }

    @Test public void pausingOrAnEarlyStartLeavesTheSwipeToTheProfile() {
        Settings.SWIPE_BACK_ON_PROFILES.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertTrue(reason.name(), SwipeBack.touchBlocks(true));
            assertTrue(Settings.SWIPE_BACK_ON_PROFILES.savedValue());
            PauseForTests.resume();
            assertFalse(reason.name(), SwipeBack.touchBlocks(true));
        }
        SettingsContextRule.withoutContext(() -> assertTrue(SwipeBack.touchBlocks(true)));
    }

    @Test public void anUnreadableSwitchLeavesTheSwipeToTheProfileAndReportsIt() {
        Settings.SWIPE_BACK_ON_PROFILES.save(true);
        SettingReadsForTests.breakReads(Settings.SWIPE_BACK_ON_PROFILES);
        assertTrue(SwipeBack.touchBlocks(true));
        assertFalse(HookStatus.missing(FamilyNames.SWIPE_BACK_ON_PROFILES).isEmpty());
    }
}
