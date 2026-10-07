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
 * Telegram shortens member, subscriber, view, reply and reaction counts to 12.3K through one method,
 * which asks here first. File sizes and durations have formatters of their own and never come here.
 *
 * <p>Callers that pick a plural form read the rounded count back from an array, so the full count
 * goes there too.
 */
public final class ExactNumbers {
    private ExactNumbers() {}

    /**
     * Asked before Telegram shortens a count.
     *
     * @param number the count
     * @param rounded where Telegram's callers read the count the text shows, or null
     * @return the full count with commas, or null for Telegram's short form
     */
    public static String format(int number, int[] rounded) {
        HookStatus.invoked(FamilyNames.EXACT_NUMBERS);
        try {
            if (!Utils.settingsReady() || !Settings.EXACT_NUMBERS.get()) return null;
            if (rounded != null && rounded.length > 0) rounded[0] = number;
            HookStatus.counted(FamilyNames.EXACT_NUMBERS, "count shown in full");
            return grouped(number);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.EXACT_NUMBERS, "exact number", failure);
            return null;
        }
    }

    /** The count with a comma every three digits, the way Telegram writes full counts elsewhere. */
    static String grouped(int number) {
        String digits = Long.toString(Math.abs((long) number));
        StringBuilder text = new StringBuilder(digits.length() + digits.length() / 3 + 1);
        if (number < 0) text.append('-');
        for (int i = 0; i < digits.length(); i++) {
            if (i > 0 && (digits.length() - i) % 3 == 0) text.append(',');
            text.append(digits.charAt(i));
        }
        return text.toString();
    }
}
