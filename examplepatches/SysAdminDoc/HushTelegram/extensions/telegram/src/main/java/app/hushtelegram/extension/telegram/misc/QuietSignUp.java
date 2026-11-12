/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Don't notify contacts (#71): signing up a phone number that's new to Telegram normally tells
 * everyone who has that number saved that it joined.
 *
 * <p>The sign-up request carries a flag that keeps that notice from going out, and Telegram on
 * Android never sets it. The patch passes the flag through {@link #noJoinedNotifications} as the
 * request is written out, so the switch only changes what goes to the server. Signing in to an
 * account that already exists never sends this request.
 */
public final class QuietSignUp {
    private QuietSignUp() {}

    /**
     * Injected after the sign-up request reads its quiet flag, before it goes into the request's flags.
     *
     * @param requested the flag as Telegram set it, non-zero for set
     * @return the flag the request sends
     */
    public static boolean noJoinedNotifications(int requested) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        try {
            if (!Utils.settingsReady() || !Settings.QUIET_SIGN_UP.get()) return requested != 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "don't notify contacts switch", failure);
            return requested != 0;
        }
        if (requested == 0) HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "sign-ups kept from contacts");
        return true;
    }
}
