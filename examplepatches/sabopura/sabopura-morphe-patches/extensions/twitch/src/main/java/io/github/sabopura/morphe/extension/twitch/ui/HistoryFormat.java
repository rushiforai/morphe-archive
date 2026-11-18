package io.github.sabopura.morphe.extension.twitch.ui;

import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

/** The words and colours of a history row, free of Android so they can be tested. */
final class HistoryFormat {
    private static final long MINUTE = 60_000L, DAY = 86_400_000L;
    private static final String[] JA_WEEK = {"日", "月", "火", "水", "木", "金", "土"};
    private static final String[] EN_WEEK = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
    private static final String[] EN_MONTH = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
            "Nov", "Dec"};
    /** WCAG's minimum for body text. */
    private static final double READABLE = 4.5;

    private HistoryFormat() {
    }

    /** "HH:mm" in {@code zone}; empty for a message without a time. */
    static String clock(long time, TimeZone zone) {
        if (time <= 0) return "";
        int minutes = (int) Math.floorMod(Math.floorDiv(local(time, zone), MINUTE), 1440L);
        int hour = minutes / 60, minute = minutes % 60;
        return (hour < 10 ? "0" : "") + hour + (minute < 10 ? ":0" : ":") + minute;
    }

    /**
     * The day to show above a row, or null when it needs none: a row on the same day as the one before
     * it, or the first row when that is today. {@code previous} is 0 for the first row.
     */
    static String day(long previous, long time, long now, TimeZone zone, boolean japanese) {
        if (time <= 0) return null;
        long day = dayIndex(time, zone), today = dayIndex(now, zone);
        if (previous > 0 ? dayIndex(previous, zone) == day : day == today) return null;
        if (day == today) return japanese ? "今日" : "Today";
        if (day == today - 1) return japanese ? "昨日" : "Yesterday";
        Calendar at = Calendar.getInstance(zone, Locale.ROOT);
        at.setTimeInMillis(time);
        int year = at.get(Calendar.YEAR), month = at.get(Calendar.MONTH), date = at.get(Calendar.DAY_OF_MONTH);
        int weekday = at.get(Calendar.DAY_OF_WEEK) - Calendar.SUNDAY;
        at.setTimeInMillis(now);
        boolean thisYear = at.get(Calendar.YEAR) == year;
        if (japanese) return (thisYear ? "" : year + "年") + (month + 1) + "月" + date + "日（" + JA_WEEK[weekday] + "）";
        return EN_WEEK[weekday] + ", " + EN_MONTH[month] + " " + date + (thisYear ? "" : ", " + year);
    }

    private static long local(long time, TimeZone zone) {
        return time + zone.getOffset(time);
    }

    private static long dayIndex(long time, TimeZone zone) {
        return Math.floorDiv(local(time, zone), DAY);
    }

    static String count(int value) {
        return String.format(Locale.ROOT, "%,d", value);
    }

    /** {@code color}, moved toward white on a dark background or black on a light one until text in it reads. */
    static int readable(int color, int background) {
        int toward = luminance(background) < .18 ? 0xFFFFFFFF : 0xFF000000;
        for (int step = 0; step < 10; step++) {
            int candidate = mix(color | 0xFF000000, toward, step / 10f);
            if (contrast(candidate, background) >= READABLE) return candidate;
        }
        return toward;
    }

    static double contrast(int a, int b) {
        double x = luminance(a), y = luminance(b);
        return (Math.max(x, y) + .05) / (Math.min(x, y) + .05);
    }

    private static double luminance(int color) {
        return .2126 * linear(color >> 16 & 255) + .7152 * linear(color >> 8 & 255) + .0722 * linear(color & 255);
    }

    private static double linear(int channel) {
        double c = channel / 255.0;
        return c <= .03928 ? c / 12.92 : Math.pow((c + .055) / 1.055, 2.4);
    }

    private static int mix(int from, int to, float t) {
        int r = Math.round((from >> 16 & 255) + ((to >> 16 & 255) - (from >> 16 & 255)) * t);
        int g = Math.round((from >> 8 & 255) + ((to >> 8 & 255) - (from >> 8 & 255)) * t);
        int b = Math.round((from & 255) + ((to & 255) - (from & 255)) * t);
        return 0xFF000000 | r << 16 | g << 8 | b;
    }
}
