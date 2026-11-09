/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.widget.TextView;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram's sign-in phone screen has a Test Backend checkbox that only shows while the account
 * being added already sits on Telegram's test servers. With the switch on, it shows for every new
 * sign-in. Ticking it moves only that account's connection to the test servers, the way Telegram's
 * own box does, so test sessions stay apart from the accounts already signed in. While the box is
 * ticked, the screen also takes the 999 code of Telegram's test numbers, which release builds refuse
 * as an unknown country.
 */
public final class TestServers {
    private TestServers() {}

    /**
     * Asked with Telegram's own answer to whether this account is on the test servers, right where
     * the sign-in screen decides to add the checkbox. True shows it. Telegram's yes always stays a
     * yes, so a test account keeps its box whatever the switch says.
     */
    public static boolean shown(int stock) {
        HookStatus.invoked(FamilyNames.TEST_SERVER_SIGN_IN);
        if (stock != 0) return true;
        return switchOn();
    }

    /** The phone screen's country state for a code no country has. */
    static final int UNKNOWN_CODE = 2;
    /** The phone screen's country state for a code it knows. */
    static final int KNOWN_CODE = 0;
    /** The country code Telegram's test numbers use (99966XYYYY), which no real country has. */
    static final String TEST_CODE = "999";

    /**
     * Asked with the phone screen's country state, right before Next refuses a code no country has,
     * and the field holding the typed code, only while the Test Backend box is ticked (the patch
     * leaves Next to Telegram otherwise). Telegram's test numbers start with 999, so with the switch
     * on that code reads as known and the number goes to the servers like any other. Everything else
     * keeps Telegram's answer.
     */
    public static int countryState(int stock, Object codeField) {
        HookStatus.invoked(FamilyNames.TEST_SERVER_SIGN_IN);
        if (stock != UNKNOWN_CODE || !(codeField instanceof TextView)) return stock;
        CharSequence code = ((TextView) codeField).getText();
        if (code == null || !TEST_CODE.contentEquals(code)) return stock;
        return switchOn() ? KNOWN_CODE : stock;
    }

    private static boolean switchOn() {
        try {
            return Utils.settingsReady() && Settings.TEST_SERVER_SIGN_IN.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TEST_SERVER_SIGN_IN, "switch", failure);
            return false;
        }
    }
}
