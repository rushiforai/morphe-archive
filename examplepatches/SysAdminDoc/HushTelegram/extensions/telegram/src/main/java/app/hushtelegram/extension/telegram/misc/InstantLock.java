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
 * Instant lock: with a Telegram passcode set, the app locks a second or two after you leave it.
 *
 * <p>Telegram's Auto-lock keeps the time it waits in seconds, and two places decide from it: the
 * check that runs when the app comes back ({@code AndroidUtilities.needShowPasscode}) and the timer
 * LaunchActivity starts when it goes to the background. The patch passes each of their reads through
 * {@link #autoLockIn}, and with the switch on the answer is one second. The stored Auto-lock choice
 * and the passcode screen that shows it are not hooked, so turning the switch off brings the old
 * delay back. One second rather than zero, since zero is how Telegram stores Auto-lock turned off.
 */
public final class InstantLock {
    /** The delay, in seconds, the lock checks see with the switch on. */
    static final int SECONDS = 1;

    private InstantLock() {}

    /**
     * Injected after each read of Telegram's Auto-lock delay in its lock checks.
     *
     * @param seconds the Auto-lock delay the user chose, 0 when it is off
     * @return the delay the check uses
     */
    public static int autoLockIn(int seconds) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        try {
            if (!Utils.settingsReady() || !Settings.INSTANT_LOCK.get()) return seconds;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "instant lock switch", failure);
            return seconds;
        }
        if (seconds != SECONDS) HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "lock checks made instant");
        return SECONDS;
    }
}
