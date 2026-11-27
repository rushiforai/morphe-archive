/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.content.Context;
import android.text.format.DateUtils;

import java.time.ZonedDateTime;

import app.fakh.extension.shared.Features;

/** The date and time the app shows in place of an age such as "20d". */
@SuppressWarnings("unused")
public final class ExactTime {
    private ExactTime() {
    }

    /** Whether dates show instead of ages, which other patches that word a moment follow. */
    static boolean on() {
        return Features.on("fakh_exact_time");
    }

    /**
     * Formats a moment in the phone's language and time zone. The year is left out when it is the current one.
     *
     * @param context The context to format with.
     * @param time    The moment, or null.
     * @param brief   Whether the app asked for its short form, used where there is little room: only the time for a
     *                moment of today, otherwise only the date.
     * @return The text, or null for no moment or with the switch off, which leaves the app's own text.
     */
    public static String format(Context context, ZonedDateTime time, boolean brief) {
        if (!on() || context == null || time == null) return null;
        long millis = time.toInstant().toEpochMilli();
        int flags = DateUtils.FORMAT_ABBREV_MONTH;
        if (!brief) {
            flags |= DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_SHOW_TIME;
        } else if (DateUtils.isToday(millis)) {
            flags |= DateUtils.FORMAT_SHOW_TIME;
        } else {
            flags |= DateUtils.FORMAT_SHOW_DATE;
        }
        return DateUtils.formatDateTime(context, millis, flags);
    }
}
