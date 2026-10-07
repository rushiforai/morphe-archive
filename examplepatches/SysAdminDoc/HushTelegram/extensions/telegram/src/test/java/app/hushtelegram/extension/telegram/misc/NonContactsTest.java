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
public class NonContactsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.SILENCE_NON_CONTACTS);
        Settings.SILENCE_NON_CONTACTS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultEveryNotificationKeepsItsSound() {
        assertFalse(Settings.SILENCE_NON_CONTACTS.get());
        assertFalse(NonContacts.silenced(new Object()));
        assertFalse(NonContacts.silenced(null));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.SILENCE_NON_CONTACTS));
    }

    @Test public void onlyAPrivateChatWithAStrangerGoesQuiet() {
        assertTrue(NonContacts.privateDialog(42L));
        assertFalse("groups and channels", NonContacts.privateDialog(-1001234L));
        assertFalse("login codes", NonContacts.privateDialog(NonContacts.SERVICE));
        assertTrue(NonContacts.outsider(false, false, false));
        assertFalse("a contact", NonContacts.outsider(true, false, false));
        assertFalse("a bot", NonContacts.outsider(false, true, false));
        assertFalse("your own reminders", NonContacts.outsider(false, false, true));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheSound() {
        Settings.SILENCE_NON_CONTACTS.save(true);
        assertTrue(NonContactsForTests.on());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), NonContactsForTests.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(NonContactsForTests.on()));
        SettingReadsForTests.breakReads(Settings.SILENCE_NON_CONTACTS);
        assertFalse(NonContactsForTests.on());
        assertFalse(HookStatus.missing(FamilyNames.SILENCE_NON_CONTACTS).isEmpty());
    }
}
