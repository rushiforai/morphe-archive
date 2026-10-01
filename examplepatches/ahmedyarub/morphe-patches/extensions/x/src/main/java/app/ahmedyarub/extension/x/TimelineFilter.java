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
 * Decides which timeline items are left out: promoted ones, when Remove Ads is applied, and posts
 * containing a filtered keyword.
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

    private static final String PREFERENCES = "morphe_x";
    private static final String KEYWORDS_KEY = "filter_keywords";

    private static final class Setup {
        static final boolean HIDE_PROMOTED = hidePromoted();
    }

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

        return (Setup.HIDE_PROMOTED && Ads.isPromoted(item)) || containsKeyword(item);
    }

    /** The timeline item, or null when it is left out, which the app then skips. */
    public static Object filter(Object item) {
        return hide(item) ? null : item;
    }

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

    private static boolean containsKeyword(Object item) {
        List<String> filtered = keywords();
        if (filtered.isEmpty()) return false;

        try {
            Method getText = TEXT.computeIfAbsent(item.getClass(), itemClass -> {
                try {
                    return itemClass.getMethod("getText");
                } catch (NoSuchMethodException ex) {
                    return NO_TEXT;
                }
            });
            if (getText == NO_TEXT) return false;

            Object text = getText.invoke(item);
            if (text == null) return false;

            String lower = text.toString().toLowerCase(Locale.ROOT);
            for (String keyword : filtered) {
                if (lower.contains(keyword)) return true;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Keyword filter failure", ex);
        }
        return false;
    }
}
