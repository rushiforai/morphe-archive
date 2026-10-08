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
public class ArchivePullTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.DISABLE_ARCHIVE_PULL);
        Settings.DISABLE_ARCHIVE_PULL.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTheArchiveStaysWhereTelegramPutsIt() {
        assertFalse(Settings.DISABLE_ARCHIVE_PULL.get());
        assertTrue(Settings.DISABLE_ARCHIVE_PULL.rebootApp);
        assertFalse(ArchivePull.on());
        assertFalse(ArchivePull.keepsOut());
        assertFalse(ArchivePull.leavesOut());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.DISABLE_ARCHIVE_PULL));
    }

    @Test public void onItFollowsTheArchiveStateAndLeavesThePinnedOneAlone() {
        Settings.DISABLE_ARCHIVE_PULL.save(true);
        assertTrue(ArchivePull.on());
        // Unpatched, the archive answers pinned, which the switch never touches.
        assertFalse(ArchivePull.keepsOut());
        assertFalse(ArchivePull.leavesOut());
        ArchivePull.menu(new Object(), new Object());
        assertFalse(String.join("\n", HookStatus.report()).contains("archive added to the menu"));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheArchivePull() {
        Settings.DISABLE_ARCHIVE_PULL.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ArchivePull.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(ArchivePull.on()));
        SettingReadsForTests.breakReads(Settings.DISABLE_ARCHIVE_PULL);
        assertFalse(ArchivePull.on());
        assertFalse(ArchivePull.keepsOut());
        assertFalse(HookStatus.missing(FamilyNames.DISABLE_ARCHIVE_PULL).isEmpty());
    }
}
