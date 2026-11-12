package io.github.bryceaspringfield.morphe.extension.youtube;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Locale;
import java.util.function.Supplier;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;

/**
 * Like and dislike counts as counts, percentages, or both, on the video's like and dislike buttons. Dislikes come from
 * Return YouTube Dislike (Morphe's RYD); the like button shows YouTube's own count, and its percentage is RYD's share of
 * likes among all votes.
 */
public final class RydText {

    private static final String RYD = "app.morphe.extension.shared.returnyoutubedislike.ReturnYouTubeDislike";
    private static final String BUTTONS = "app.morphe.extension.shared.returnyoutubedislike.ReturnYouTubeDislikeButtons";

    private RydText() {
    }

    private static String mode() {
        String m = XSettings.VOTE_FORMAT.get();
        return m == null ? "count" : m;
    }

    private static String pct(float share) {
        float p = share * 100f;
        if (p > 0 && p < 1) return "<1%";
        if (p < 100 && p > 99) return String.format(Locale.US, "%.1f%%", p);
        return Math.round(p) + "%";
    }

    private static Object voteData(Object ryd) throws Exception {
        if (ryd == null) return null;
        Method m = Class.forName(RYD).getDeclaredMethod("getCompletedVoteData");
        m.setAccessible(true);
        return m.invoke(ryd);
    }

    private static float share(Object vote, String getter) throws Exception {
        return (Float) vote.getClass().getMethod(getter).invoke(vote);
    }

    /**
     * Injection points, at the start of RYD's dislike and like texts: the text in the chosen format, or null to keep
     * RYD's own (counts, or Morphe's Dislikes as percentage).
     */
    public static String dislikes(Object ryd) {
        return votes(ryd, "getDislikeCount", "getDislikePercentage");
    }

    public static String likes(Object ryd) {
        return votes(ryd, "getLikeCount", "getLikePercentage");
    }

    private static String votes(Object ryd, String countGetter, String shareGetter) {
        try {
            String mode = mode();
            if ("count".equals(mode)) return null;
            Object vote = voteData(ryd);
            if (vote == null) return null;
            String percent = pct(share(vote, shareGetter));
            if ("percent".equals(mode)) return percent;
            long n = (Long) vote.getClass().getMethod(countGetter).invoke(vote);
            Method f = Class.forName(RYD).getDeclaredMethod("formatDislikeCount", long.class);
            f.setAccessible(true);
            return f.invoke(null, n) + " · " + percent;
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: vote text kept: " + t);
            return null;
        }
    }

    /** The RYD data of the open video, through the source Morphe's buttons read. */
    @SuppressWarnings("unchecked")
    private static Object currentRyd() throws Exception {
        Field f = Class.forName(BUTTONS).getDeclaredField("videoDataSource");
        f.setAccessible(true);
        Supplier<Object> s = (Supplier<Object>) f.get(null);
        return s == null ? null : s.get();
    }

    /** A count as YouTube shows it ("3.4M", "3,4 M", "12 mil", "954K", "1,234") as a number, or -1. */
    static double parseCount(String text) {
        String t = text.replace('\u00a0', ' ').replace('\u202f', ' ').trim().toLowerCase(Locale.ROOT);
        java.util.regex.Matcher m = Pattern.compile("^(\\d+(?:[.,\\s]\\d+)*)\\s*([a-z.]*)").matcher(t);
        if (!m.find()) return -1;
        String num = m.group(1).replace(" ", ""), unit = m.group(2);
        double mult = unit.isEmpty() ? 1 : unit.startsWith("mil") && !unit.startsWith("mill") ? 1e3
                : unit.startsWith("k") ? 1e3 : unit.startsWith("m") ? 1e6 : unit.startsWith("b") ? 1e9 : -1;
        if (mult < 0) return -1;
        try {
            if (mult > 1) return Double.parseDouble(num.replace(',', '.')) * mult;
            return Double.parseDouble(num.replace(",", "").replace(".", ""));
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    /**
     * Injection point, on the text of each animated count YouTube draws (the like count of live streams, among others):
     * the like count as a percentage, or both, when the text matches RYD's like count within 15%.
     */
    public static String rollingNumber(String text) {
        return likeText(text, "rolling number");
    }

    /**
     * Injection point, on the count Morphe's RYD draws under a compact action bar's like and dislike icons (YouTube's
     * own like count, e.g. "9M"): the like count as a percentage, or both. The dislike count never matches RYD's like
     * count, and a text already holding a percentage is kept.
     */
    public static String iconText(String text) {
        return likeText(text, "icon count");
    }

    private static String likeText(String text, String where) {
        try {
            if (text == null || text.indexOf('%') >= 0 || "count".equals(mode())) return text;
            Object vote = voteData(currentRyd());
            if (vote == null) return text;
            long likes = (Long) vote.getClass().getMethod("getLikeCount").invoke(vote);
            long dislikes = (Long) vote.getClass().getMethod("getDislikeCount").invoke(vote);
            double shown = parseCount(text);
            if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: " + where + " " + text + " = " + shown + ", RYD likes " + likes);
            if (likes <= 0 || shown <= 0 || Math.abs(shown - likes) > 0.15 * likes
                    || Math.abs(shown - dislikes) < Math.abs(shown - likes)) return text;
            String percent = pct(share(vote, "getLikePercentage"));
            return "percent".equals(mode()) ? percent : text + " · " + percent;
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: like text kept: " + t);
            return text;
        }
    }
}
