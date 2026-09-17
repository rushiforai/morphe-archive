package app.template.extension.settings;

import android.content.Context;

import org.json.JSONObject;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Export / import of the Mod-settings config as a small JSON file, so a setup can be shared or
 * backed up. Only the keys in {@link #KEYS} travel — never internal state like the what's-new
 * dialog's seen-version. Import merges: a recognised key in the file is written, everything else
 * is left alone, so a config from an older build can't wipe newer settings. Values are sanity-
 * checked; a bad one is skipped rather than aborting the whole import.
 */
public final class ConfigTransfer {

    public static final int FORMAT = 1;
    private static final String APP = "letterboxd-morphe-patches";

    private static final boolean STR = false;
    private static final boolean BOOL = true;

    /** key -> is it a boolean. The single source of truth for what's shareable. */
    private static final Map<String, Boolean> KEYS = new LinkedHashMap<>();

    static {
        KEYS.put(Prefs.KEY_THEME_SURFACE, STR);
        KEYS.put(Prefs.KEY_THEME_OLED, BOOL);
        KEYS.put(Prefs.KEY_THEME_ACCENT, STR);
        KEYS.put(Prefs.KEY_THEME_ACCENT_HEX, STR);
        KEYS.put(Prefs.KEY_MATCH_BOTTOM_NAV, BOOL);
        KEYS.put(Prefs.KEY_NAV_INDICATOR, STR);
        KEYS.put(Prefs.KEY_NAV_ITEMS, STR);
        KEYS.put(Prefs.KEY_LAUNCH_TAB, STR);
        KEYS.put(Prefs.KEY_HOME_TABS, STR);
        KEYS.put(Prefs.KEY_HIDE_VIDEO_STORE, BOOL);
        KEYS.put(Prefs.KEY_HIDE_WHERE_TO_WATCH, BOOL);
        KEYS.put(Prefs.KEY_RUNTIME_HHMM, BOOL);
        KEYS.put(Prefs.KEY_OPEN_IN_PLAYER, BOOL);
        KEYS.put(Prefs.KEY_STREAMING_APP, STR);
        KEYS.put(Prefs.KEY_HIDE_RATINGS_ENABLED, BOOL);
        KEYS.put(Prefs.KEY_HIDE_RATINGS_STYLE, STR);
        KEYS.put(Prefs.KEY_HIDE_RATINGS_ANIMATION, STR);
        KEYS.put(Prefs.KEY_HIDE_RATINGS_CONFETTI_COLOR, STR);
        KEYS.put(Prefs.KEY_HIDE_RATINGS_HAPTIC, BOOL);
    }

    private ConfigTransfer() {}

    // --- export ------------------------------------------------------------

    public static String export(Context ctx) {
        Prefs.load(ctx);
        try {
            JSONObject settings = new JSONObject();
            for (Map.Entry<String, Boolean> e : KEYS.entrySet()) {
                String key = e.getKey();
                if (!Prefs.has(key)) continue; // only what the user actually set
                if (e.getValue() == BOOL) {
                    settings.put(key, Prefs.getBoolean(key, false));
                } else {
                    settings.put(key, Prefs.getString(key, ""));
                }
            }
            JSONObject root = new JSONObject();
            root.put("format", FORMAT);
            root.put("app", APP);
            root.put("settings", settings);
            return root.toString(2);
        } catch (Throwable t) {
            return "{\"format\":" + FORMAT + ",\"app\":\"" + APP + "\",\"settings\":{}}";
        }
    }

    // --- import ----------------------------------------------------------

    /** @return number of settings applied, or -1 if the text isn't a config file we understand. */
    public static int importJson(Context ctx, String text) {
        Prefs.load(ctx);
        JSONObject settings;
        try {
            JSONObject root = new JSONObject(text);
            if (root.optInt("format", 0) != FORMAT) return -1;
            settings = root.optJSONObject("settings");
            if (settings == null) return -1;
        } catch (Throwable t) {
            return -1;
        }

        int applied = 0;
        for (Map.Entry<String, Boolean> e : KEYS.entrySet()) {
            String key = e.getKey();
            if (!settings.has(key)) continue;
            try {
                if (e.getValue() == BOOL) {
                    Object v = settings.get(key);
                    if (!(v instanceof Boolean)) continue;
                    Prefs.putBoolean(key, (Boolean) v);
                    applied++;
                } else {
                    String v = settings.optString(key, null);
                    if (v == null || !validString(key, v)) continue;
                    Prefs.putString(key, v);
                    applied++;
                }
            } catch (Throwable ignored) {
            }
        }
        return applied;
    }

    /** Light per-key checks. CSV / free-form keys pass through — their readers already ignore junk. */
    private static boolean validString(String key, String v) {
        switch (key) {
            case Prefs.KEY_THEME_SURFACE:
                return v.isEmpty() || v.equals("stock") || v.equals("oled");
            case Prefs.KEY_NAV_INDICATOR:
                return oneOf(v, "stock", "nopill", "white", "accent", "accentPill");
            case Prefs.KEY_LAUNCH_TAB:
                return oneOf(v, "last", "popular", "search", "activity", "watchlist", "profile");
            case Prefs.KEY_STREAMING_APP:
                return oneOf(v, "stremio", "nuvio");
            case Prefs.KEY_HIDE_RATINGS_STYLE:
                return oneOf(v, "panel", "link", "shimmer", "burst");
            case Prefs.KEY_HIDE_RATINGS_ANIMATION:
                return oneOf(v, "default", "crumble", "confetti");
            case Prefs.KEY_HIDE_RATINGS_CONFETTI_COLOR:
                return oneOf(v, "accent", "letterboxd", "red");
            case Prefs.KEY_THEME_ACCENT_HEX:
                if (v.isEmpty()) return true;
                try {
                    AccentMath.parseHex(v);
                    return true;
                } catch (Throwable t) {
                    return false;
                }
            default:
                return v.length() <= 512; // theme_accent, nav_items, home_tabs — reader-sanitised
        }
    }

    private static boolean oneOf(String v, String... allowed) {
        for (String a : allowed) {
            if (a.equals(v)) return true;
        }
        return false;
    }
}
