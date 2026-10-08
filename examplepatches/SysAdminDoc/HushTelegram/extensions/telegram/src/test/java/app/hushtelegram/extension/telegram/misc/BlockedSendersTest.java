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
public class BlockedSendersTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_BLOCKED_IN_GROUPS);
        Settings.HIDE_BLOCKED_IN_GROUPS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultEveryMessageKeepsItsType() {
        assertFalse(Settings.HIDE_BLOCKED_IN_GROUPS.get());
        assertEquals(0, BlockedSenders.type(new Object(), 0));
        assertEquals("Telegram's own hidden messages stay hidden", -1, BlockedSenders.type(new Object(), -1));
        assertEquals(5, BlockedSenders.type(null, 5));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_BLOCKED_IN_GROUPS));
    }

    @Test public void onOnlyAPersonsMessageInAGroupCanBeHidden() {
        Settings.HIDE_BLOCKED_IN_GROUPS.save(true);
        assertTrue(BlockedSenders.on());
        assertTrue("a group", BlockedSenders.listedInGroup(-42L, false, 7L));
        assertTrue("a supergroup", BlockedSenders.listedInGroup(-1001234567890L, false, 7L));
        assertFalse("a private chat", BlockedSenders.listedInGroup(7L, false, 7L));
        assertFalse("a channel's post", BlockedSenders.listedInGroup(-1001234567890L, true, 7L));
        assertFalse("a chat speaking as itself", BlockedSenders.listedInGroup(-1001234567890L, false, -1001234567890L));
        assertFalse("a channel speaking in a group", BlockedSenders.listedInGroup(-42L, false, -1009876543210L));
        // The unpatched stub knows nobody is blocked, so the message keeps its type.
        assertEquals(3, BlockedSenders.type(new Object(), 3));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheMessage() {
        Settings.HIDE_BLOCKED_IN_GROUPS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), BlockedSenders.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(BlockedSenders.on()));
        SettingReadsForTests.breakReads(Settings.HIDE_BLOCKED_IN_GROUPS);
        assertFalse(BlockedSenders.on());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_BLOCKED_IN_GROUPS).isEmpty());
    }
}
