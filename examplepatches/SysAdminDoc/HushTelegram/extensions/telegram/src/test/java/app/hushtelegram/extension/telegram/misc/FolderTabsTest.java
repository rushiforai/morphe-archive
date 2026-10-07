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
public class FolderTabsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_FOLDER_COUNTERS);
        Settings.HIDE_FOLDER_COUNTERS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTabsShowTheirCounts() {
        assertFalse(Settings.HIDE_FOLDER_COUNTERS.get());
        assertFalse(FolderTabs.countersHidden());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_FOLDER_COUNTERS));
    }

    @Test public void onTheCountsAreHidden() {
        Settings.HIDE_FOLDER_COUNTERS.save(true);
        assertTrue(FolderTabs.countersHidden());
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheCounts() {
        Settings.HIDE_FOLDER_COUNTERS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), FolderTabs.countersHidden());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(FolderTabs.countersHidden()));
        SettingReadsForTests.breakReads(Settings.HIDE_FOLDER_COUNTERS);
        assertFalse(FolderTabs.countersHidden());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_FOLDER_COUNTERS).isEmpty());
    }
}
