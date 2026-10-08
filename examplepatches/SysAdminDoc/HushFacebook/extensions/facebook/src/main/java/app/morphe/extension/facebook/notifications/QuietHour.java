/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.notifications;

import androidx.annotation.Nullable;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Locale;

/**
 * The hours quiet hours can start and end on, on the hour. Like {@code CommentOrder}, this holds
 * no Android type and reads no setting, and the label a person reads is their locale's own way of
 * writing the time, so it needs no translation.
 */
public enum QuietHour {
    H0, H1, H2, H3, H4, H5, H6, H7, H8, H9, H10, H11,
    H12, H13, H14, H15, H16, H17, H18, H19, H20, H21, H22, H23;

    /** The hour of the day, 0 to 23. */
    public int hour() {
        return ordinal();
    }

    /** What a settings file holds for this hour, as 24-hour clock time. It never changes once written. */
    public String fileValue() {
        return String.format(Locale.ROOT, "%02d:00", hour());
    }

    /** This hour as [locale] writes a time, such as 10:00 PM in the US or 22:00 in Germany. */
    public String label(Locale locale) {
        Calendar time = Calendar.getInstance();
        time.clear();
        time.set(Calendar.HOUR_OF_DAY, hour());
        return DateFormat.getTimeInstance(DateFormat.SHORT, locale).format(time.getTime());
    }

    /** The hour a settings file names, or null when it names none of these. */
    @Nullable
    public static QuietHour fromFile(@Nullable Object value) {
        if (!(value instanceof String)) return null;
        for (QuietHour hour : values()) {
            if (hour.fileValue().equals(value)) return hour;
        }
        return null;
    }

    /**
     * Whether [hour] of the day falls in the quiet hours from [from] until [until]: from the start
     * of [from] up to the start of [until], across midnight when [until] comes first. The same hour
     * for both is the whole day.
     */
    public static boolean holds(int hour, QuietHour from, QuietHour until) {
        int start = from.hour();
        int end = until.hour();
        return start < end ? hour >= start && hour < end : hour >= start || hour < end;
    }
}
