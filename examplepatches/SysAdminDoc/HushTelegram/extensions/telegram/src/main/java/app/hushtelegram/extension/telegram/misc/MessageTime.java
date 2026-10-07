/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * A message's time comes from Telegram's time of day formatter while the bubble measures itself.
 * Each of those times comes here, and with the switch on the seconds go in right after the minutes,
 * so 9:41 PM reads 9:41:27 PM. A time written without a colon, as some languages do, stays as it is.
 */
public final class MessageTime {
    private MessageTime() {}

    private static final Pattern CLOCK = Pattern.compile("(?<![:\\d])\\d{1,2}:\\d{2}(?![:\\d])");

    /**
     * Asked in place of the formatter while a message bubble measures its time.
     *
     * @param formatter Telegram's time of day formatter
     * @param millis the moment to show
     * @return the time the bubble shows
     */
    public static String shown(Object formatter, long millis) {
        String time = stockFormat(formatter, millis);
        return time != null && on() ? withSeconds(time, millis) : time;
    }

    static boolean on() {
        HookStatus.invoked(FamilyNames.MESSAGE_SECONDS);
        try {
            return Utils.settingsReady() && Settings.MESSAGE_SECONDS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_SECONDS, "switch", failure);
            return false;
        }
    }

    static String withSeconds(String time, long millis) {
        Matcher clock = CLOCK.matcher(time);
        if (!clock.find()) return time;
        long seconds = ((millis / 1000) % 60 + 60) % 60;
        HookStatus.counted(FamilyNames.MESSAGE_SECONDS, "time shown with seconds");
        return time.substring(0, clock.end()) + (seconds < 10 ? ":0" : ":") + seconds + time.substring(clock.end());
    }

    /** Telegram's own formatting. Replaced with the formatter's method when patching. */
    public static String stockFormat(Object formatter, long millis) { return null; }
}
