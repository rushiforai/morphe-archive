/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HiddenAccountsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Three signed-in slots (users 1000, 2000 and 3000), the second one in use, and an empty fourth. */
    private static class Fake implements HiddenAccounts.Telegram {
        final Map<Integer, Long> users = new HashMap<>();
        final Map<Long, String> names = new HashMap<>();
        int selected = 1;
        boolean broken;

        @Override public boolean activated(Object config) { return users.containsKey((Integer) config); }

        @Override public long userOf(Object config) {
            if (broken) throw new IllegalStateException("Telegram changed");
            return users.getOrDefault((Integer) config, 0L);
        }

        @Override public int selectedAccount() { return selected; }

        @Override public int accountSlots() { return 4; }

        @Override public long userId(int account) { return users.getOrDefault(account, 0L); }

        @Override public String peerName(int account, long id) { return names.get(id); }
    }

    private Fake telegram;
    private HiddenAccounts.Telegram original;

    @Before public void setUp() {
        original = HiddenAccounts.telegram;
        telegram = new Fake();
        telegram.users.put(0, 1000L);
        telegram.users.put(1, 2000L);
        telegram.users.put(2, 3000L);
        telegram.names.put(1000L, "Work");
        telegram.names.put(2000L, "Home");
        HiddenAccounts.telegram = telegram;
        PatchFamilyForTests.inBuild(PatchFamily.HIDE_FOLDER_COUNTERS);
        PatchFamilyForTests.installed(PatchFamily.Capability.HIDDEN_ACCOUNTS);
        Settings.HIDE_ACCOUNTS.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        HiddenAccounts.hide(new HashSet<>());
        HiddenAccounts.telegram = original;
        PatchFamilyForTests.reset();
        PatchFamilyForTests.resetCapabilities();
        Settings.HIDE_ACCOUNTS.resetToDefault();
    }

    private Set<Long> ids(Long... ids) {
        return new HashSet<>(Arrays.asList(ids));
    }

    @Test public void withTheSwitchOffEveryAccountShows() {
        HiddenAccounts.hide(ids(1000L));
        for (int slot = 0; slot < 3; slot++) assertTrue(HiddenAccounts.activated(slot));
        assertFalse("an empty slot stays empty", HiddenAccounts.activated(3));
    }

    @Test public void aPickedAccountLeavesTheListWhileTheSwitchIsOn() {
        Settings.HIDE_ACCOUNTS.save(true);
        HiddenAccounts.hide(ids(1000L, 3000L));
        assertFalse(HiddenAccounts.activated(0));
        assertTrue("the one not picked stays", HiddenAccounts.activated(1));
        assertFalse(HiddenAccounts.activated(2));
        assertFalse("an empty slot stays empty", HiddenAccounts.activated(3));
        assertTrue(String.join("\n", HookStatus.report()).contains("account left out"));
    }

    @Test public void theAccountInUseAlwaysShows() {
        Settings.HIDE_ACCOUNTS.save(true);
        HiddenAccounts.hide(ids(2000L));
        assertTrue(HiddenAccounts.activated(1));
        telegram.selected = 0;
        assertFalse("once another is in use it can go", HiddenAccounts.activated(1));
    }

    @Test public void aBuildWithoutTheHookKeepsEveryAccount() {
        Settings.HIDE_ACCOUNTS.save(true);
        HiddenAccounts.hide(ids(1000L));
        PatchFamilyForTests.resetCapabilities();
        PatchFamilyForTests.installed(PatchFamily.Capability.HIDDEN_CHATS);
        assertTrue(HiddenAccounts.activated(0));
    }

    @Test public void aTelegramThatThrowsKeepsTheStockAnswer() {
        Settings.HIDE_ACCOUNTS.save(true);
        HiddenAccounts.hide(ids(1000L));
        telegram.broken = true;
        assertTrue(HiddenAccounts.activated(0));
        assertTrue(String.join("\n", HookStatus.report()).contains("hidden accounts"));
    }

    @Test public void thePicksAreSavedPerPhoneAndCanBeCleared() {
        assertTrue(HiddenAccounts.hidden().isEmpty());
        assertTrue(HiddenAccounts.hide(ids(1000L, 3000L)));
        assertEquals(ids(1000L, 3000L), HiddenAccounts.hidden());
        assertTrue(HiddenAccounts.hide(new HashSet<>()));
        assertTrue(HiddenAccounts.hidden().isEmpty());
    }

    @Test public void theSettingsPageListsSignedInAccountsByName() {
        List<HiddenAccounts.Account> accounts = HiddenAccounts.accounts();
        assertEquals(3, accounts.size());
        assertEquals("Work", accounts.get(0).name);
        assertEquals("Home", accounts.get(1).name);
        assertEquals("a name Telegram doesn't have gets a number", "Account 3", accounts.get(2).name);
        assertEquals(3000L, accounts.get(2).user);
        assertEquals("No accounts hidden yet.", HiddenAccounts.summary(accounts));
        HiddenAccounts.hide(ids(1000L, 9999L));
        assertEquals("only accounts signed in now are named", "Work", HiddenAccounts.summary(accounts));
    }

    @Test public void aTelegramThatCannotBeReadGivesNoList() {
        HiddenAccounts.telegram = new Fake() {
            @Override public int accountSlots() { throw new IllegalStateException("Telegram changed"); }
        };
        assertNull(HiddenAccounts.accounts());
    }

    @Test public void pickingEveryAccountIsNotAllowed() {
        List<HiddenAccounts.Account> accounts = HiddenAccounts.accounts();
        assertTrue(HiddenAccounts.leavesOne(accounts, ids(1000L, 2000L)));
        assertFalse(HiddenAccounts.leavesOne(accounts, ids(1000L, 2000L, 3000L)));
        assertTrue("an id that isn't signed in changes nothing", HiddenAccounts.leavesOne(accounts, ids(1000L, 9999L)));
    }
}
