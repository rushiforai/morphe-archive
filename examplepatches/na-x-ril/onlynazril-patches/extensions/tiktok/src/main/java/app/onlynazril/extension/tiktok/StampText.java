package app.onlynazril.extension.tiktok;

import android.os.Build;
import android.text.format.DateUtils;
import android.widget.TextView;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * The text the elements write, and the one place that decides its shape.
 * <p>
 * Three switches are only readable on screen if the line they produce is predictable: the handle
 * stays on the name, the time keeps TikTok's position and color, and the region follows the time.
 * A writer composing its own string is how the same region ended up inside a name on one surface
 * and on the time view on another, so every writer comes here instead.
 * <p>
 * The text a view already carries is never trusted on its own. A recycled view still holds the
 * previous video's text when it is handed over, and that text is shaped exactly like this item's, so
 * it is rebuilt from this item's own values whenever it can be recognized as ours, and an age-shaped
 * text that disagrees with this item is replaced.
 */
public final class StampText {
    public static final String SEPARATOR = " \u00b7 ";
    public static final String LEADING_DOT = "\u00b7 ";

    /** Tag holding exactly what this extension last rendered on the view, if anything. */
    public static final int TARGET_TAG = 0x7f0f9999;

    /** Tag holding the time text a render was built from, before the region. */
    public static final int BASE_TAG = 0x7f0f9998;

    /** A trailing "· XX" — a country code, whether TikTok put it there or this extension did. */
    private static final Pattern REGION_SUFFIX = Pattern.compile("\\s*\\u00b7\\s*[A-Z]{2,4}$");

    /** A separator already in front of the time, so the forced dot is added exactly once. */
    private static final Pattern LEADING_SEPARATOR = Pattern.compile("^[\\s\\u00b7]+");

    private static final long MINUTE = 60_000L;
    private static final long HOUR = 60L * MINUTE;
    private static final long DAY = 24L * HOUR;
    /** TikTok stores the post time in seconds; anything smaller is not epoch millis. */
    private static final long SECONDS_LIMIT = 100_000_000_000L;

    private StampText() {}

    /** The handle element's own text: the name, and nothing else. */
    public static String handle(String unique) {
        return "@" + unique;
    }

    /**
     * The feed header's time line: a dot in front of the time, then the region when it is on.
     * <p>
     * With no time on the view — TikTok hides it and the post time is off — the region is written on
     * its own, so the region switch never depends on the post-time switch: a country code has a
     * place here whether or not a time does.
     */
    public static String headerTime(String base, String region) {
        if (base.isEmpty()) return region == null ? "" : LEADING_DOT + region;
        String target = LEADING_DOT + base;
        if (region == null || hasRegion(base) || endsWithRegion(base, region)) return target;
        return target + SEPARATOR + region;
    }

    /** A comment's time line: the time as it stands, then the region when it is on. */
    public static String withRegion(String time, String region) {
        if (region == null) return time;
        if (time.isEmpty()) return region;
        if (hasRegion(time) || endsWithRegion(time, region)) return time;
        return time + SEPARATOR + region;
    }

    /** Whether the text already carries this exact region, code or name. */
    private static boolean endsWithRegion(String text, String region) {
        if (region == null || region.isEmpty()) return false;
        return text.endsWith(SEPARATOR + region)
                || text.endsWith(LEADING_DOT + region)
                || text.equals(region);
    }

    /**
     * The time text this extension writes. The epoch is the source: TikTok's own text is used only
     * when the item carries no create time, so the same video reads the same on every surface.
     * <p>
     * `withClock` appends the locale's short time to a date, which is what a comment older than a
     * week shows; the feed keeps the date alone.
     */
    public static String timeText(
            TextView timeView, String current, long createTime, boolean allowOurs, boolean compact,
            String pattern, boolean withClock) {
        String fallback = baseText(timeView, current);
        if (!allowOurs) return fallback;
        Locale locale = AppLocale.of(timeView.getContext());
        String expected = relative(createTime, locale, compact, pattern, withClock);
        return expected.isEmpty() ? fallback : expected;
    }

    /** The text without the region suffix this extension may have appended to it. */
    public static String withoutRegion(String text) {
        return REGION_SUFFIX.matcher(text).replaceFirst("");
    }

    /** The time before this extension added the region, recovered from its own last render. */
    public static String baseText(TextView view, String current) {
        Object rendered = view.getTag(TARGET_TAG);
        Object base = view.getTag(BASE_TAG);
        if (rendered instanceof String && current.equals(rendered) && base instanceof String) {
            return (String) base;
        }
        return withoutRegion(withoutLeadingSeparator(current));
    }

    public static boolean hasRegion(String text) {
        return REGION_SUFFIX.matcher(text).find();
    }

    public static String withoutLeadingSeparator(String text) {
        return LEADING_SEPARATOR.matcher(text).replaceFirst("");
    }

    /**
     * Compact age in the app's language. English and Indonesian follow TikTok's own shapes; every
     * other locale uses CLDR on API 24+, and the platform's own aging text on API 23, where
     * `android.icu` does not exist yet. Their wording may differ from TikTok's.
     */
    private static String relative(
            long createTime, Locale locale, boolean compact, String pattern, boolean withClock) {
        if (createTime <= 0) return "";
        long millis = createTime < SECONDS_LIMIT ? createTime * 1000L : createTime;
        long delta = System.currentTimeMillis() - millis;
        if (isIndonesian(locale)) {
            if (delta < MINUTE) return "baru saja";
            if (delta < HOUR) return unit(delta / MINUTE, "mnt", "lalu", compact);
            if (delta < DAY) return unit(delta / HOUR, "j", "lalu", compact);
            long days = delta / DAY;
            if (days <= 7) return unit(days, "h", "lalu", compact);
            if (days < 28) return unit(days / 7, "mgg", "lalu", compact);
            return date(millis, locale, pattern, withClock);
        }
        if (isEnglish(locale)) {
            if (delta < MINUTE) return "now";
            if (delta < HOUR) return unit(delta / MINUTE, "m", "ago", compact);
            if (delta < DAY) return unit(delta / HOUR, "h", "ago", compact);
            long days = delta / DAY;
            if (days <= 7) return unit(days, "d", "ago", compact);
            if (days < 28) return unit(days / 7, "w", "ago", compact);
            return date(millis, locale, pattern, withClock);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            return IcuAgeText.relative(delta, millis, locale, compact, pattern, withClock);
        }
        if (delta >= 28 * DAY) return date(millis, locale, pattern, withClock);
        return platformAge(delta, compact);
    }

    /**
     * The aging text Android itself localizes, for API 23 in a language without a hand-tuned
     * formatter. Seconds are the resolution under a minute, so the text is not a flat "0 minutes".
     */
    private static String platformAge(long delta, boolean compact) {
        long now = System.currentTimeMillis();
        long then = now - delta;
        long resolution = delta < MINUTE ? DateUtils.SECOND_IN_MILLIS : DateUtils.MINUTE_IN_MILLIS;
        CharSequence text = DateUtils.getRelativeTimeSpanString(
                then, now, resolution, DateUtils.FORMAT_ABBREV_RELATIVE);
        String age = text == null ? "" : text.toString();
        return compact ? withoutUnitSpace(age) : age;
    }

    /** Drops the space between a number and a short unit: `2 h` becomes `2h`. */
    private static String withoutUnitSpace(String text) {
        return text.replaceAll("(?<=\\d)[\\s\\u00A0\\u202F]+(?=\\S{1,2}(?:\\s|$))", "");
    }

    /**
     * A date through the locale's own skeleton: month and day while it is this year, the year too
     * otherwise. An explicit format overrides both, and `withClock` appends the short time.
     */
    public static String date(
            long millis, Locale locale, String pattern, boolean withClock) {
        Date value = new Date(millis);
        String day;
        try {
            day = pattern != null
                    ? new SimpleDateFormat(pattern, locale).format(value)
                    : automaticDate(millis, locale, value);
        } catch (IllegalArgumentException ex) {
            // A stored custom pattern that no longer parses must not take a render down with it.
            day = automaticDate(millis, locale, value);
        }
        if (!withClock) return day;
        return day + ", " + DateFormat.getTimeInstance(DateFormat.SHORT, locale).format(value);
    }

    /** The locale's own month-and-day skeleton, with the year once the instant is another year. */
    private static String automaticDate(long millis, Locale locale, Date value) {
        Calendar now = Calendar.getInstance();
        Calendar then = Calendar.getInstance();
        then.setTimeInMillis(millis);
        String skeleton = now.get(Calendar.YEAR) == then.get(Calendar.YEAR) ? "MMMd" : "yMMMd";
        String pattern = android.text.format.DateFormat.getBestDateTimePattern(locale, skeleton);
        return new SimpleDateFormat(pattern, locale).format(value);
    }

    private static String unit(long value, String unit, String suffix, boolean compact) {
        return compact ? value + unit + " " + suffix : value + " " + unit + " " + suffix;
    }

    private static boolean isEnglish(Locale locale) {
        return locale != null && "en".equals(locale.getLanguage());
    }

    private static boolean isIndonesian(Locale locale) {
        String language = locale == null ? "" : locale.getLanguage();
        return "id".equals(language) || "in".equals(language);
    }
}
