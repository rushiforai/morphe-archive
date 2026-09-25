package app.onlynazril.extension.tiktokHandle;

import android.widget.TextView;

import java.util.Locale;
import java.util.regex.Pattern;

/**
 * The text the elements write, and the one place that decides its shape.
 *
 * Three switches are only readable on screen if the line they produce is predictable: the handle
 * stays on the name, the time keeps TikTok's position and colour, and the region follows the time.
 * A writer composing its own string is how the same region ended up inside a name on one surface
 * and on the time view on another, so every writer comes here instead.
 *
 * The text a view already carries is never trusted on its own. A recycled view still holds the
 * previous video's text when it is handed over, and that text is shaped exactly like this item's, so
 * it is rebuilt from this item's own values whenever it can be recognised as ours, and an age-shaped
 * text that disagrees with this item is replaced.
 */
public final class StampText {
    public static final String SEPARATOR = " \u00b7 ";
    public static final String LEADING_DOT = "\u00b7 ";

    /** Tag holding exactly what this extension last rendered on the view, if anything. */
    public static final int TARGET_TAG = 0x7f0f9999;

    /** Tag holding the time text that render was built from, before the dot and the region. */
    public static final int BASE_TAG = 0x7f0f9998;

    /** A trailing "· XX" — a country code, whether TikTok put it there or this extension did. */
    private static final Pattern REGION_SUFFIX = Pattern.compile("\\s*\\u00b7\\s*[A-Z]{2,4}$");

    /** A separator already in front of the time, so the forced dot is added exactly once. */
    private static final Pattern LEADING_SEPARATOR = Pattern.compile("^[\\s\\u00b7]+");

    /**
     * The shapes the header writes a post's age in, and this extension writes itself: "3d ago" and,
     * past a week, "05-01". Deliberately narrow — anything else on screen is left alone, because it
     * is wording that cannot be judged here and TikTok's own is to be kept.
     */
    private static final Pattern AGE_SHAPE = Pattern.compile(
            "(?i)^(?:now|\\d{1,3}\\s*[mhd]\\s*ago|\\d{2}-\\d{2})$");

    private static final long MINUTE = 60_000L;
    private static final long HOUR = 60L * MINUTE;
    private static final long DAY = 24L * HOUR;
    private static final long WEEK = 7L * DAY;
    /** TikTok stores the post time in seconds; anything smaller is not epoch millis. */
    private static final long SECONDS_LIMIT = 100_000_000_000L;

    private StampText() {}

    /** The handle element's own text: the name, and nothing else. */
    public static String handle(String unique) {
        return "@" + unique;
    }

    /**
     * The feed header's time line: a dot in front of the time, then the region when it is on.
     *
     * With no time on the view — TikTok hides it and the post time is off — the region is written on
     * its own, so the region switch never depends on the post-time switch: a country code has a
     * place here whether or not a time does.
     */
    public static String headerTime(String base, String region) {
        if (base.isEmpty()) return region == null ? "" : LEADING_DOT + region;
        String target = LEADING_DOT + base;
        if (region == null || hasRegion(base)) return target;
        return target + SEPARATOR + region;
    }

    /** A comment's time line: the time as it stands, then the region when it is on. */
    public static String withRegion(String time, String region) {
        if (region == null) return time;
        if (time.isEmpty()) return region;
        if (hasRegion(time)) return time;
        return time + SEPARATOR + region;
    }

    /**
     * What the time view should read: the time text this extension last built for this view, else
     * TikTok's own. With the post time on, an age-shaped text that disagrees with this item is
     * replaced by the age computed from it — that is the recycled-view case, where the neighbour's
     * age is on the view.
     *
     * Our own render is recognised by the exact string that was written, not by rebuilding it from
     * the text: a view that carries a region on its own has no time to rebuild from, and guessing
     * whether a word is a time or a country code is how the two get mixed up.
     */
    public static String timeText(
            TextView timeView, String current, long createTime, boolean allowOurs) {
        Object rendered = timeView.getTag(TARGET_TAG);
        Object base = timeView.getTag(BASE_TAG);
        String text;
        if (rendered instanceof String && current.equals(rendered) && base instanceof String) {
            text = (String) base;
        } else {
            // TikTok's own text, or a render from an older install that left no tag behind.
            text = withoutRegion(withoutLeadingSeparator(current));
        }
        if (!allowOurs) return text;
        String expected = relative(createTime);
        if (expected.isEmpty()) return text;
        // The view TikTok left empty is the one case the post time exists for.
        if (text.isEmpty()) return expected;
        if (expected.equalsIgnoreCase(text)) return text;
        return AGE_SHAPE.matcher(text).matches() ? expected : text;
    }

    /** The text without the region suffix this extension may have appended to it. */
    public static String withoutRegion(String text) {
        return REGION_SUFFIX.matcher(text).replaceFirst("");
    }

    public static boolean hasRegion(String text) {
        return REGION_SUFFIX.matcher(text).find();
    }

    public static String withoutLeadingSeparator(String text) {
        return LEADING_SEPARATOR.matcher(text).replaceFirst("");
    }

    /**
     * Compact age, shaped like the header's own: a number, a unit and "ago", then a date once the
     * video is a week old. Used only when TikTok left the view empty.
     *
     * TikTok's own wording lives in its i18n packs — it is neither a string resource nor a literal
     * in the dex — so the verified samples are "2d ago" and, past a week, "09-02". This follows
     * that shape with "ago" on every unit rather than only on days.
     */
    private static String relative(long createTime) {
        if (createTime <= 0) return "";
        long millis = createTime < SECONDS_LIMIT ? createTime * 1000L : createTime;
        long delta = System.currentTimeMillis() - millis;
        if (delta < MINUTE) return "now";
        if (delta < HOUR) return (delta / MINUTE) + "m ago";
        if (delta < DAY) return (delta / HOUR) + "h ago";
        if (delta < WEEK) return (delta / DAY) + "d ago";
        return String.format(Locale.ROOT, "%1$tm-%1$td", millis);
    }
}
