package app.ahmedyarub.extension.x;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Decides which timeline items are left out: promoted ones, when Remove Ads is applied, posts
 * containing a filtered keyword, and posts not matching the active feed filters.
 */
@SuppressWarnings("unused")
public final class TimelineFilter {

    /** Rewritten to true by Remove Ads. */
    private static boolean hidePromoted() {
        return false;
    }

    /**
     * The keywords filtered until they are edited in the app, lowercase, separated by |.
     * Rewritten by Filter posts by keyword.
     */
    private static String initialKeywords() {
        return "";
    }

    /** Rewritten to true by Feed filters. */
    private static boolean feedFiltersEnabled() {
        return false;
    }

    /**
     * The include keywords set at patch time, lowercase, separated by |.
     * Rewritten by Feed filters.
     */
    private static String initialIncludeKeywords() {
        return "";
    }

    private static final String PREFERENCES = "morphe_x";
    private static final String KEYWORDS_KEY = "filter_keywords";
    private static final String MEDIA_ONLY_KEY = "feed_media_only";
    private static final String HIDE_FOLLOWED_KEY = "feed_hide_followed";
    private static final String INCLUDE_KEYWORDS_KEY = "feed_include_keywords";

    private static final class Setup {
        static final boolean HIDE_PROMOTED = hidePromoted();
        static final boolean FEED_FILTERS = feedFiltersEnabled();
    }

    // region Exclude keywords

    /** The filtered keywords, lowercase. Loaded on first use, replaced when edited. */
    private static volatile List<String> keywords;

    private static List<String> keywords() {
        List<String> current = keywords;
        if (current == null) {
            current = parse(preferences().getString(KEYWORDS_KEY, initialKeywords().replace('|', '\n')));
            keywords = current;
        }
        return current;
    }

    /** The filtered keywords, one per line, for editing. */
    public static String keywordsText() {
        return String.join("\n", keywords());
    }

    /** Replaces the filtered keywords with the given lines. */
    public static void setKeywords(String text) {
        List<String> parsed = parse(text == null ? "" : text);
        preferences().edit().putString(KEYWORDS_KEY, String.join("\n", parsed)).apply();
        keywords = parsed;
    }

    // endregion

    // region Include keywords

    /** The include keywords, lowercase. Loaded on first use, replaced when edited. */
    private static volatile List<String> includeKeywords;

    private static List<String> includeKeywords() {
        List<String> current = includeKeywords;
        if (current == null) {
            current = parse(preferences().getString(INCLUDE_KEYWORDS_KEY, initialIncludeKeywords().replace('|', '\n')));
            includeKeywords = current;
        }
        return current;
    }

    /** The include keywords, one per line, for editing. */
    public static String includeKeywordsText() {
        return String.join("\n", includeKeywords());
    }

    /** Replaces the include keywords with the given lines. */
    public static void setIncludeKeywords(String text) {
        List<String> parsed = parse(text == null ? "" : text);
        preferences().edit().putString(INCLUDE_KEYWORDS_KEY, String.join("\n", parsed)).apply();
        includeKeywords = parsed;
    }

    // endregion

    // region Feed filter toggles

    public static boolean isMediaOnlyEnabled() {
        return preferences().getBoolean(MEDIA_ONLY_KEY, false);
    }

    public static void setMediaOnly(boolean enabled) {
        preferences().edit().putBoolean(MEDIA_ONLY_KEY, enabled).apply();
    }

    public static boolean isHideFollowedEnabled() {
        return preferences().getBoolean(HIDE_FOLLOWED_KEY, false);
    }

    public static void setHideFollowed(boolean enabled) {
        preferences().edit().putBoolean(HIDE_FOLLOWED_KEY, enabled).apply();
    }

    // endregion

    private static SharedPreferences preferences() {
        return Utils.getContext().getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    private static List<String> parse(String lines) {
        List<String> parsed = new ArrayList<>();
        for (String line : lines.split("\n")) {
            String keyword = line.trim().toLowerCase(Locale.ROOT);
            if (!keyword.isEmpty() && !parsed.contains(keyword)) parsed.add(keyword);
        }
        return Collections.unmodifiableList(parsed);
    }

    /** If a timeline item is left out. */
    public static boolean hide(Object item) {
        if (item == null) return false;

        if (Setup.HIDE_PROMOTED && Ads.isPromoted(item)) return true;
        if (containsExcludeKeyword(item)) return true;

        if (Setup.FEED_FILTERS && isPost(item)) {
            boolean needsMedia = isMediaOnlyEnabled();
            boolean needsNotFollowed = isHideFollowedEnabled();
            List<String> include = includeKeywords();

            if (needsMedia || needsNotFollowed) {
                String repr = String.valueOf(item);
                if (needsMedia && !hasMediaIn(repr)) return true;
                if (needsNotFollowed && isFollowedIn(repr)) return true;
            }

            if (!include.isEmpty() && !matchesAnyKeyword(item, include)) return true;
        }

        return false;
    }

    /** The timeline item, or null when it is left out, which the app then skips. */
    public static Object filter(Object item) {
        return hide(item) ? null : item;
    }

    // region Post detection and text extraction

    /** A post's getText keeps its name; items that are not posts have none. */
    private static final Map<Class<?>, Method> TEXT = new ConcurrentHashMap<>();
    private static final Method NO_TEXT;

    static {
        try {
            NO_TEXT = Object.class.getMethod("toString");
        } catch (NoSuchMethodException ex) {
            throw new IllegalStateException(ex);
        }
    }

    private static Method textMethod(Object item) {
        return TEXT.computeIfAbsent(item.getClass(), itemClass -> {
            try {
                return itemClass.getMethod("getText");
            } catch (NoSuchMethodException ex) {
                return NO_TEXT;
            }
        });
    }

    private static boolean isPost(Object item) {
        return textMethod(item) != NO_TEXT;
    }

    private static String getPostText(Object item) {
        try {
            Method getText = textMethod(item);
            if (getText == NO_TEXT) return null;
            Object text = getText.invoke(item);
            return text == null ? null : text.toString();
        } catch (Exception ex) {
            Logger.printException(() -> "getPostText failure", ex);
            return null;
        }
    }

    // endregion

    // region Exclude keyword filter

    private static boolean containsExcludeKeyword(Object item) {
        List<String> filtered = keywords();
        if (filtered.isEmpty()) return false;

        String text = getPostText(item);
        if (text == null) return false;

        String lower = text.toLowerCase(Locale.ROOT);
        for (String keyword : filtered) {
            if (lower.contains(keyword)) return true;
        }
        return false;
    }

    // endregion

    // region Include keyword filter

    private static boolean matchesAnyKeyword(Object item, List<String> keywords) {
        String text = getPostText(item);
        if (text == null) return false;

        String lower = text.toLowerCase(Locale.ROOT);
        for (String keyword : keywords) {
            if (lower.contains(keyword)) return true;
        }
        return false;
    }

    // endregion

    // region Media detection

    /**
     * Whether a post's data-class toString contains media content markers. Videos, GIFs and images
     * are all serialised by name in the X data model.
     */
    private static boolean hasMediaIn(String repr) {
        return repr.contains("MediaContentVideo(")
                || repr.contains("MediaContentGif(")
                || repr.contains("MediaContentImage(");
    }

    // endregion

    // region Following detection

    private static boolean isFollowedIn(String repr) {
        return repr.contains("isFollowedByMe=true");
    }

    // endregion
}
