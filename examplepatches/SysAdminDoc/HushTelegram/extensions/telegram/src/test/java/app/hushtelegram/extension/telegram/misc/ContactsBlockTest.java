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
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ContactsBlockTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_CONTACTS_BLOCK);
        Settings.HIDE_CONTACTS_BLOCK.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultKeepsTelegramsOwnListAndLoadingRows() {
        assertFalse(Settings.HIDE_CONTACTS_BLOCK.get());
        ArrayList<Object> contacts = contacts();
        assertSame(contacts, ContactsBlock.rows(contacts));
        assertTrue(ContactsBlock.placeholder(true));
    }

    @Test public void onHidesRowsAndLoadingRowsWithoutTouchingTheList() {
        Settings.HIDE_CONTACTS_BLOCK.save(true);
        ArrayList<Object> contacts = contacts();
        List<Object> before = new ArrayList<>(contacts);
        assertNull(ContactsBlock.rows(contacts));
        assertFalse(ContactsBlock.placeholder(true));
        assertEquals(before, contacts);
        assertTrue(String.join("\n", HookStatus.report()).contains("contact rows hidden 1"));
    }

    @Test public void switchingBackReturnsTheSameCachedRows() {
        ArrayList<Object> contacts = contacts();
        Settings.HIDE_CONTACTS_BLOCK.save(true);
        assertNull(ContactsBlock.rows(contacts));
        Settings.HIDE_CONTACTS_BLOCK.save(false);
        assertSame(contacts, ContactsBlock.rows(contacts));
        assertTrue(ContactsBlock.placeholder(true));
    }

    @Test public void absentRowsAndFinishedSyncPassThroughInEveryState() {
        for (boolean on : new boolean[]{false, true}) {
            Settings.HIDE_CONTACTS_BLOCK.save(on);
            assertNull(ContactsBlock.rows(null));
            assertFalse(ContactsBlock.placeholder(false));
        }
    }

    @Test public void pauseAndUnavailableSettingsRestoreStockAndKeepTheSavedSwitch() {
        Settings.HIDE_CONTACTS_BLOCK.save(true);
        ArrayList<Object> contacts = contacts();
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertSame(contacts, ContactsBlock.rows(contacts));
            assertTrue(ContactsBlock.placeholder(true));
            assertTrue(Settings.HIDE_CONTACTS_BLOCK.savedValue());
            PauseForTests.resume();
            assertNull(ContactsBlock.rows(contacts));
        }
        SettingsContextRule.withoutContext(() -> {
            assertSame(contacts, ContactsBlock.rows(contacts));
            assertTrue(ContactsBlock.placeholder(true));
        });
    }

    @Test public void unreadableSwitchShowsTheBlockAndReportsIt() {
        Settings.HIDE_CONTACTS_BLOCK.save(true);
        ArrayList<Object> contacts = contacts();
        SettingReadsForTests.breakReads(Settings.HIDE_CONTACTS_BLOCK);
        assertSame(contacts, ContactsBlock.rows(contacts));
        assertTrue(ContactsBlock.placeholder(true));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_CONTACTS_BLOCK).isEmpty());
        SettingReadsForTests.mend(Settings.HIDE_CONTACTS_BLOCK);
        assertNull(ContactsBlock.rows(contacts));
    }

    private static ArrayList<Object> contacts() {
        return new ArrayList<>(Arrays.asList("first contact", "second contact"));
    }
}
