/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

/** Delete account (#71): what goes to Telegram, and what each of its answers says and does. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DeleteAccountTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final List<String> heard = new ArrayList<>();
    private final DeleteAccount.Answer answer = new DeleteAccount.Answer() {
        @Override public void done(String said) { heard.add("done: " + said); }

        @Override public void refused(String refused) { heard.add("refused: " + refused); }
    };

    @Before public void signIn() {
        DeleteAccountForTests.signedIn(2, "Test account");
    }

    @After public void restore() {
        DeleteAccountForTests.restore();
        HookStatus.clear();
    }

    @Test public void theAccountInUseIsDeletedWithNoReasonAndSignedOut() {
        assertEquals("Test account", DeleteAccount.account().name);
        assertNull(DeleteAccount.send(2, answer));
        assertEquals(Collections.singletonList("2: deleteAccount reason=\"\""), DeleteAccountForTests.sent());
        assertTrue("nothing is heard before Telegram answers", heard.isEmpty());

        DeleteAccountForTests.deleted();
        ShadowLooper.idleMainLooper();
        assertEquals(Collections.singletonList("done: Account deleted."), heard);
        assertEquals(Collections.singletonList(2), DeleteAccountForTests.signedOut());
    }

    @Test public void anAccountWithACloudPasswordIsDeletedOnTheDayTelegramSets() {
        DeleteAccount.send(2, answer);
        DeleteAccountForTests.refused("2FA_CONFIRM_WAIT_604800");
        DeleteAccount.send(2, answer);
        // Part of a day counts as a day.
        DeleteAccountForTests.refused("2FA_CONFIRM_WAIT_3600");
        ShadowLooper.idleMainLooper();
        assertEquals(Arrays.asList("done: Telegram deletes the account in 7 days.",
                "done: Telegram deletes the account in 1 day."), heard);
        assertTrue("the account stays signed in until then", DeleteAccountForTests.signedOut().isEmpty());
    }

    @Test public void eachRefusalSaysWhy() {
        for (String code : new String[]{"FLOOD_WAIT_30", AccountGuard.POWERED_OFF_TEXT, AccountGuard.RECEIVE_ONLY_TEXT,
                "2FA_CONFIRM_WAIT_soon", "A_VERY_LONG_ERROR_FROM_TELEGRAM_SERVERS"}) {
            DeleteAccount.send(2, answer);
            DeleteAccountForTests.refused(code);
        }
        DeleteAccount.send(2, answer);
        DeleteAccountForTests.notDeleted();
        ShadowLooper.idleMainLooper();
        assertEquals(Arrays.asList("refused: Wait 30 seconds, then try again.", "refused: This account is powered off.",
                "refused: Receive only mode is on.", "refused: Telegram refused it: 2FA_CONFIRM_WAIT_soon",
                "refused: Telegram refused it: A_VERY_LONG_ERROR_FROM_TELEG",
                "refused: Telegram didn't delete the account."), heard);
        assertTrue(DeleteAccountForTests.signedOut().isEmpty());
    }

    @Test public void aRequestThatCantGoOutIsRefusedOnTheSpot() {
        DeleteAccountForTests.refuseSends();
        assertEquals("Telegram didn't delete the account.", DeleteAccount.send(2, answer));
        assertTrue(DeleteAccountForTests.sent().isEmpty());

        // Unpatched, the stubs build no request at all.
        DeleteAccountForTests.restore();
        assertEquals("Telegram didn't delete the account.", DeleteAccount.send(2, answer));
        ShadowLooper.idleMainLooper();
        assertTrue(heard.isEmpty());
    }

    @Test public void aSignOutThatFailsStillSaysTheAccountIsGone() {
        DeleteAccountForTests.failSignOut();
        DeleteAccount.send(2, answer);
        DeleteAccountForTests.deleted();
        ShadowLooper.idleMainLooper();
        assertEquals(Collections.singletonList("done: Account deleted."), heard);
        assertFalse(HookStatus.missing(FamilyNames.DISABLE_ANALYTICS).isEmpty());
    }

    @Test public void noAccountSignedInIsNoAccount() {
        DeleteAccountForTests.signedIn(0, null);
        assertNull(DeleteAccount.account());
    }
}
