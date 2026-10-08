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
import java.util.ArrayList;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FeaturesInviteTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_FEATURES_AND_INVITE);
        Settings.HIDE_FEATURES_AND_INVITE.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultBothListsKeepTheirRows() {
        assertFalse(Settings.HIDE_FEATURES_AND_INVITE.get());
        ArrayList<Object> rows = new ArrayList<>();
        assertTrue(FeaturesInvite.addFeaturesRow(rows, "Telegram Features"));
        assertEquals(1, rows.size());
        // The unpatched stub calls every list one without invites, so counts and rows pass through.
        assertEquals(4, FeaturesInvite.sectionCount(new Object(), 0, 4));
        assertEquals(2, FeaturesInvite.sectionRow(new Object(), 0, 2));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_FEATURES_AND_INVITE));
    }

    @Test public void onTheFeaturesRowIsLeftOut() {
        Settings.HIDE_FEATURES_AND_INVITE.save(true);
        ArrayList<Object> rows = new ArrayList<>();
        assertFalse(FeaturesInvite.addFeaturesRow(rows, "Telegram Features"));
        assertTrue(rows.isEmpty());
    }

    @Test public void contactsLosesOnlyItsInviteRows() {
        assertEquals("Invite Friends", 1, FeaturesInvite.hiddenRows(FeaturesInvite.INVITE_ROW, 0, 4));
        assertEquals("letters stay", 0, FeaturesInvite.hiddenRows(FeaturesInvite.INVITE_ROW, 1, 7));
        assertEquals("the invite list", 9, FeaturesInvite.hiddenRows(FeaturesInvite.INVITE_LIST, 1, 9));
        assertEquals("the empty notice stays", 0, FeaturesInvite.hiddenRows(FeaturesInvite.INVITE_LIST, 0, 1));
        assertEquals("other lists", 0, FeaturesInvite.hiddenRows(FeaturesInvite.NO_INVITES, 0, 4));
        assertEquals("Recent Calls moves up", 1, FeaturesInvite.shift(FeaturesInvite.INVITE_ROW, 0));
        assertEquals(0, FeaturesInvite.shift(FeaturesInvite.INVITE_LIST, 0));
        assertEquals(0, FeaturesInvite.shift(FeaturesInvite.INVITE_ROW, 1));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheRows() {
        Settings.HIDE_FEATURES_AND_INVITE.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), FeaturesInvite.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(FeaturesInvite.on()));
        SettingReadsForTests.breakReads(Settings.HIDE_FEATURES_AND_INVITE);
        ArrayList<Object> rows = new ArrayList<>();
        assertTrue(FeaturesInvite.addFeaturesRow(rows, "Telegram Features"));
        assertEquals(1, rows.size());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_FEATURES_AND_INVITE).isEmpty());
    }
}
