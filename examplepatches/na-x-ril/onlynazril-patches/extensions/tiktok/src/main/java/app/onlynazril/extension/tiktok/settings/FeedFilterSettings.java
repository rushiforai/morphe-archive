package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The feed filter's own switches, kept apart from {@link HandleSettings} so a name, a region or a
 * post time cannot change what the feed contains, and a filter cannot change what a name shows.
 * <p>
 * Ads have a switch. Survey cards, LIVE and drama have their own, all off by default, so a feed
 * change is opt-in. The two count filters do not have a switch: the range *is* their switch, because a
 * range with nothing typed in it means the whole range and hides nothing, while a range with a
 * bound in it is the user saying what they want hidden. A stored flag beside it could only ever
 * disagree with what the screen shows.
 * <p>
 * A range is kept as the string the screen shows back. Anything that does not parse falls back to
 * the whole range — a filter that cannot read its own bound must not hide a video.
 */
public final class FeedFilterSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_ADS = "feed_filter_ads";
    private static final String KEY_VIEWS_RANGE = "feed_filter_views_range";
    private static final String KEY_LIKES_RANGE = "feed_filter_likes_range";
    private static final String KEY_SURVEY = "feed_filter_survey";
    private static final String KEY_LIVE = "feed_filter_live";
    private static final String KEY_DRAMA = "feed_filter_drama";

    private static final boolean ADS_DEFAULT = true;
    private static final boolean CARD_DEFAULT = false;
    private static final long[] NO_RANGE = {0L, Long.MAX_VALUE};

    private FeedFilterSettings() {}

    public static boolean isAdsEnabled(Context ctx) {
        return ctx == null || prefs(ctx).getBoolean(KEY_ADS, ADS_DEFAULT);
    }

    public static boolean isAdsEnabled() {
        return isAdsEnabled(appContext());
    }

    public static void setAdsEnabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_ADS, value).apply();
    }

    /** Survey cards, inserted into the feed as their own item. Off by default. */
    public static boolean isSurveyEnabled(Context ctx) {
        return ctx != null && prefs(ctx).getBoolean(KEY_SURVEY, CARD_DEFAULT);
    }

    public static boolean isSurveyEnabled() {
        return isSurveyEnabled(appContext());
    }

    public static void setSurveyEnabled(Context ctx, boolean value) {
        if (ctx == null) return;
        prefs(ctx).edit().putBoolean(KEY_SURVEY, value).apply();
    }

    /** LIVE videos, rooms and the LIVE entry card. Off by default. */
    public static boolean isLiveEnabled(Context ctx) {
        return ctx != null && prefs(ctx).getBoolean(KEY_LIVE, CARD_DEFAULT);
    }

    public static boolean isLiveEnabled() {
        return isLiveEnabled(appContext());
    }

    public static void setLiveEnabled(Context ctx, boolean value) {
        if (ctx == null) return;
        prefs(ctx).edit().putBoolean(KEY_LIVE, value).apply();
    }

    /** Mini-drama and series videos. Off by default. */
    public static boolean isDramaEnabled(Context ctx) {
        return ctx != null && prefs(ctx).getBoolean(KEY_DRAMA, CARD_DEFAULT);
    }

    public static boolean isDramaEnabled() {
        return isDramaEnabled(appContext());
    }

    public static void setDramaEnabled(Context ctx, boolean value) {
        if (ctx == null) return;
        prefs(ctx).edit().putBoolean(KEY_DRAMA, value).apply();
    }

    /** The play-count range the views filter keeps, or the whole range when none is set. */
    public static long[] minMaxViews() {
        return range(KEY_VIEWS_RANGE);
    }

    /** The digg-count range the likes filter keeps, or the whole range when none is set. */
    public static long[] minMaxLikes() {
        return range(KEY_LIKES_RANGE);
    }

    public static void setViewsRange(Context ctx, long min, long max) {
        prefs(ctx).edit().putString(KEY_VIEWS_RANGE, min + "-" + max).apply();
    }

    public static void setLikesRange(Context ctx, long min, long max) {
        prefs(ctx).edit().putString(KEY_LIKES_RANGE, min + "-" + max).apply();
    }

    private static long[] range(String key) {
        Context ctx = appContext();
        if (ctx == null) return NO_RANGE;
        return parse(prefs(ctx).getString(key, null));
    }

    /** `min-max`, both non-negative and min ≤ max. Anything else is the whole range. */
    private static long[] parse(String value) {
        if (value == null) return NO_RANGE;
        String[] parts = value.split("-");
        if (parts.length != 2) return NO_RANGE;
        try {
            long min = Long.parseLong(parts[0]);
            long max = Long.parseLong(parts[1]);
            if (min < 0 || max < min) return NO_RANGE;
            return new long[] {min, max};
        } catch (NumberFormatException ignored) {
            return NO_RANGE;
        }
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Context appContext() {
        return HandleSettings.appContext();
    }
}
