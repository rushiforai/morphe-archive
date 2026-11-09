/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
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
public class AccountGuardTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Named the way Telegram's builds name them: an outer namespace class and a TL_ request inside. */
    static final class TL_messages_sendMessage {}
    static final class TL_messages_getHistory {}
    static final class TL_account_updateStatus {}
    static final class TL_messages_readHistory {}

    private final Object write = new TL_messages_sendMessage();
    private final Object read = new TL_messages_getHistory();

    @Before public void setUp() {
        reset();
        AccountGuard.lookup = manager -> (Integer) manager;
    }

    @After public void tearDown() {
        reset();
        AccountGuard.lookup = Accounts::indexOf;
    }

    private static void reset() {
        Settings.RECEIVE_ONLY.resetToDefault();
        Settings.RECEIVE_ONLY_ACCOUNTS.resetToDefault();
        Settings.POWER_OFF_ACCOUNTS.resetToDefault();
        Settings.POWERED_OFF_ACCOUNTS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void classifiesReadsByTheNamesTelegramKeeps() {
        assertTrue(AccountGuard.reads("org.telegram.tgnet.TLRPC$TL_messages_getHistory"));
        assertTrue(AccountGuard.reads("org.telegram.tgnet.TLRPC$TL_messages_readHistory"));
        assertTrue(AccountGuard.reads("org.telegram.tgnet.TLRPC$TL_auth_sendCode"));
        assertTrue(AccountGuard.reads("org.telegram.tgnet.TLRPC$TL_help_getConfig"));
        assertTrue(AccountGuard.reads("org.telegram.tgnet.TLRPC$TL_updates_getDifference"));
        assertTrue(AccountGuard.reads("org.telegram.tgnet.TLRPC$TL_ping"));
        assertFalse(AccountGuard.reads("org.telegram.tgnet.TLRPC$TL_messages_sendMessage"));
        assertFalse(AccountGuard.reads("org.telegram.tgnet.TLRPC$TL_messages_setTyping"));
        assertFalse(AccountGuard.reads("org.telegram.tgnet.TL_account$updateStatus"));
        assertFalse(AccountGuard.reads("org.telegram.tgnet.TL_account$TL_updateProfile"));
    }

    @Test public void nothingIsRefusedWithTheSwitchesOff() {
        Settings.POWERED_OFF_ACCOUNTS.save("0");
        Settings.RECEIVE_ONLY_ACCOUNTS.save("0");
        assertFalse(AccountGuard.drop(0, write, null));
    }

    @Test public void aPoweredOffAccountSendsNothingButOthersDo() {
        Settings.POWER_OFF_ACCOUNTS.save(true);
        Settings.POWERED_OFF_ACCOUNTS.save("1");
        assertTrue(AccountGuard.drop(1, write, null));
        assertTrue(AccountGuard.drop(1, read, null));
        assertFalse(AccountGuard.drop(0, write, null));
        assertTrue(AccountGuard.isPoweredOff(1));
        assertFalse(AccountGuard.isPoweredOff(0));
    }

    @Test public void aReceiveOnlyAccountStillReads() {
        Settings.RECEIVE_ONLY.save(true);
        Settings.RECEIVE_ONLY_ACCOUNTS.save("0,2");
        assertTrue(AccountGuard.drop(0, write, null));
        assertTrue(AccountGuard.drop(2, new TL_account_updateStatus(), null));
        assertFalse(AccountGuard.drop(0, read, null));
        assertFalse(AccountGuard.drop(0, new TL_messages_readHistory(), null));
        assertFalse(AccountGuard.drop(1, write, null));
    }

    @Test public void aCallbackWithoutTheRunMethodDoesNotBreakTheRefusal() {
        Settings.RECEIVE_ONLY.save(true);
        Settings.RECEIVE_ONLY_ACCOUNTS.save("0");
        assertTrue(AccountGuard.drop(0, write, new Object()));
    }

    @Test public void aLookupThatFailsLeavesTheRequestAlone() {
        Settings.POWER_OFF_ACCOUNTS.save(true);
        Settings.POWERED_OFF_ACCOUNTS.save("0");
        AccountGuard.lookup = manager -> { throw new IllegalStateException("no manager"); };
        assertFalse(AccountGuard.drop(0, write, null));
        AccountGuard.lookup = manager -> -1;
        assertFalse(AccountGuard.drop(0, write, null));
        assertFalse(AccountGuard.drop(0, null, null));
    }

    @Test public void theListsKeepTheirMembersSorted() {
        AccountGuard.setReceiveOnly(2, true);
        AccountGuard.setReceiveOnly(0, true);
        assertEquals("0,2", Settings.RECEIVE_ONLY_ACCOUNTS.get());
        AccountGuard.setReceiveOnly(0, false);
        assertEquals("2", Settings.RECEIVE_ONLY_ACCOUNTS.get());
        assertTrue(AccountGuard.isListedReceiveOnly(2));
        assertFalse(AccountGuard.isReceiveOnly(2));
    }

    @Test public void theMarkIsEmptyWhenNothingIsOn() {
        assertEquals("", AccountGuard.mark(123L));
    }
}
