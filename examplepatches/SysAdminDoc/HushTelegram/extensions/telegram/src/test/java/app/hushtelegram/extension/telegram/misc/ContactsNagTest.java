/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.Collections;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ContactsNagTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private SharedPreferences prefs;

    @Before public void setUp() {
        Settings.QUIET_CONTACTS_NAG.resetToDefault();
        HookStatus.clear();
        prefs = RuntimeEnvironment.getApplication().getSharedPreferences("contacts_nag_test", Context.MODE_PRIVATE);
        prefs.edit().clear().commit();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.QUIET_CONTACTS_NAG);
        Settings.QUIET_CONTACTS_NAG.resetToDefault();
        prefs.edit().clear().commit();
        HookStatus.clear();
    }

    @Test public void theFirstRequestIsTelegramsOwn() {
        assertTrue(Settings.QUIET_CONTACTS_NAG.get());
        assertFalse(ContactsNag.skipAsk(prefs));
        assertFalse(ContactsNag.hideBadge(prefs));
        assertEquals(Collections.singletonList("Quiet contacts nag: invoked 2, 0 found, 0 missing"), HookStatus.report());
    }

    @Test public void notNowInTheContactsTabQuietsBoth() {
        prefs.edit().putBoolean(ContactsNag.ASKED_IN_CONTACTS, false).commit();
        assertTrue(ContactsNag.skipAsk(prefs));
        assertTrue(ContactsNag.hideBadge(prefs));
        assertEquals(Collections.singletonList("Quiet contacts nag: invoked 2, 0 found, 0 missing. "
                + "Counted: contacts prompt skipped 1, contacts badge hidden 1"), HookStatus.report());
    }

    @Test public void aDenialFromTheChatListQuietsBoth() {
        // Telegram leaves the Contacts tab's flag alone here, which is how the badge sticks in stock.
        prefs.edit().putBoolean(ContactsNag.ASKED_ANYWHERE, false).putBoolean(ContactsNag.ASKED_IN_CONTACTS, true).commit();
        assertTrue(ContactsNag.skipAsk(prefs));
        assertTrue(ContactsNag.hideBadge(prefs));
    }

    @Test public void switchedOffTelegramAsksAgain() {
        prefs.edit().putBoolean(ContactsNag.ASKED_ANYWHERE, false).putBoolean(ContactsNag.ASKED_IN_CONTACTS, false).commit();
        Settings.QUIET_CONTACTS_NAG.save(false);
        assertFalse(ContactsNag.skipAsk(prefs));
        assertFalse(ContactsNag.hideBadge(prefs));
        assertEquals(Collections.singletonList("Quiet contacts nag: invoked 2, 0 found, 0 missing"), HookStatus.report());
    }

    @Test public void everyPauseReasonBringsThePromptBackAndResumeQuietsItAgain() {
        prefs.edit().putBoolean(ContactsNag.ASKED_IN_CONTACTS, false).commit();
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ContactsNag.skipAsk(prefs));
            assertFalse(reason.name(), ContactsNag.hideBadge(prefs));
            PauseForTests.resume();
        }
        assertTrue(ContactsNag.skipAsk(prefs));
        assertTrue(ContactsNag.hideBadge(prefs));
    }

    @Test public void unavailableSettingsAskAsTelegramDoes() {
        prefs.edit().putBoolean(ContactsNag.ASKED_IN_CONTACTS, false).commit();
        SettingsContextRule.withoutContext(() -> {
            assertFalse(ContactsNag.skipAsk(prefs));
            assertFalse(ContactsNag.hideBadge(prefs));
        });
    }

    @Test public void unreadableSettingFailsOpenAndReportsItsStateFailure() {
        prefs.edit().putBoolean(ContactsNag.ASKED_IN_CONTACTS, false).commit();
        SettingReadsForTests.breakReads(Settings.QUIET_CONTACTS_NAG);
        assertFalse(ContactsNag.skipAsk(prefs));
        assertFalse(ContactsNag.hideBadge(prefs));
        assertEquals(Collections.singletonList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.QUIET_CONTACTS_NAG));
    }

    @Test public void unreadablePromptFlagsFailOpenAndReportIt() {
        assertFalse(ContactsNag.skipAsk(null));
        assertFalse(ContactsNag.hideBadge(null));
        assertEquals(Collections.singletonList("a working 'prompt flags read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.QUIET_CONTACTS_NAG));
    }
}
