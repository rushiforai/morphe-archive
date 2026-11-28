/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import android.content.Context;
import android.text.format.DateFormat;
import android.text.format.DateUtils;

import androidx.annotation.Nullable;

import java.util.Calendar;
import java.util.Date;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Show when someone was last active" patch.
 *
 * <p>Instagram writes how recently a person was on as "Active 5m ago" or "Active 3h ago" under
 * their name in your messages, and in a chat's header, from the time its presence service last
 * reported them active. One method of its presence formatter builds that text. It first answers
 * Active now for someone on within the last few minutes, then works out the minutes or hours
 * since. The patch asks {@link #exact} at that point with the time Instagram already holds, and
 * the method answers what it gets back, or goes on to its own wording when it gets null.
 *
 * <p>With the switch on, the answer is the time itself in the phone's language and 12 or 24-hour
 * setting: "Active at 3:42 PM" today, "Active yesterday at 9:10 PM", or the date and time for
 * earlier in the week. Instagram shows nothing for someone last on over a week ago, and this
 * doesn't either. Nothing is requested and nothing Instagram sends about you changes.
 */
public final class LastActive {
    /** The step a failed lookup is reported under. */
    static final String STEP = "last active time";

    /** Instagram shows no presence past this, a week in milliseconds, and neither does this. */
    static final long WEEK = 7L * 24 * 60 * 60 * 1000;

    /**
     * Instagram says Active now for under six and a half minutes and never asks about those, so
     * this leaves anything under five to it as well, however it is asked.
     */
    static final long NOW = 5L * 60 * 1000;

    private LastActive() {
    }

    /** Whether the exact time is shown: the settings are read and the switch is on, which a pause answers off. */
    private static boolean on() {
        return Utils.settingsReady() && Settings.SHOW_LAST_ACTIVE.get();
    }

    /**
     * Injected in Instagram's presence text method, after it has ruled out Active now and before
     * it counts minutes or hours, with the time the person was last active in milliseconds.
     * Answers the time in the phone's language and clock, while the switch is on. Answers null, for
     * Instagram's own text, while it's off, HushGram is paused, the settings aren't ready, there's
     * no context, or the time isn't one in the past within a week. Never throws.
     */
    @Nullable
    public static String exact(long lastActive) {
        return exact(lastActive, System.currentTimeMillis());
    }

    /** {@link #exact(long)} with the clock given, in milliseconds. */
    @Nullable
    static String exact(long lastActive, long now) {
        try {
            HookStatus.invoked(FamilyNames.LAST_ACTIVE);
            if (lastActive <= 0 || !on()) return null;
            Context context = Utils.getContext();
            if (context == null) return null;
            String text = text(context, lastActive, now);
            if (text != null) HookStatus.bound(FamilyNames.LAST_ACTIVE, STEP);
            return text;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LAST_ACTIVE, STEP, failure);
            return null;
        }
    }

    /**
     * What a person last active at [then] is labeled at [now], both in milliseconds, or null when
     * [then] is under {@link #NOW} back, later than [now], or more than a week back.
     */
    @Nullable
    static String text(Context context, long then, long now) {
        if (now - then < NOW || now - then > WEEK) return null;
        String time = DateFormat.getTimeFormat(context).format(new Date(then));
        if (dayStart(now, 0) <= then) return L10n.f(context, "Active at %1$s", time);
        if (dayStart(now, -1) <= then) return L10n.f(context, "Active yesterday at %1$s", time);
        // Within a week the date reads clearly without a year, whatever the clock says.
        String date = DateUtils.formatDateTime(context, then, DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_ABBREV_MONTH
                | DateUtils.FORMAT_NO_YEAR);
        return L10n.f(context, "Active %1$s at %2$s", date, time);
    }

    /** Midnight, by the phone's clock and time zone, [days] days from the day [millis] falls on. */
    private static long dayStart(long millis, int days) {
        Calendar day = Calendar.getInstance();
        day.setTimeInMillis(millis);
        day.set(Calendar.HOUR_OF_DAY, 0);
        day.set(Calendar.MINUTE, 0);
        day.set(Calendar.SECOND, 0);
        day.set(Calendar.MILLISECOND, 0);
        day.add(Calendar.DAY_OF_YEAR, days);
        return day.getTimeInMillis();
    }
}
