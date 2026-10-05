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
 *
 * <p>Custom poster and backdrop overrides live under two top-level keys
 * ({@code customPosters} and {@code customBackdrops}) as JSON maps of filmSlug -> url. They
 * don't go through {@link #KEYS} because there can be arbitrarily many of them and their
 * values are URLs, not fixed enums. Each map is written whole on export and replaced whole on
 * import.
 *
 * <p>The profile backdrop is a single string, so it goes through {@link #KEYS} like any other
 * string setting.
 */
public final class ConfigTransfer {

    public static final int FORMAT = 1;
    private static final String APP = "letterboxd-morphe-patches";
    private static final String KEY_CUSTOM_POSTERS_ROOT = "customPosters";
    private static final String KEY_CUSTOM_BACKDROPS_ROOT = "customBackdrops";

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
        KEYS.put(Prefs.KEY_PROFILE_BACKDROP, STR);
        // Note: KEY_TMDB_API_KEY is deliberately NOT in this list. It's a user-specific
        // credential (their personal API key), not a shareable setting. Exporting it into a
        // config file someone posts publicly would leak it.
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

            // Custom poster overrides — a map of slug -> URL. Only include if there's at least
            // one entry so an empty config stays byte-identical to older exports.
            try {
                JSONObject posters = CustomPosterStore.snapshot();
                if (posters != null && posters.length() > 0) {
                    root.put(KEY_CUSTOM_POSTERS_ROOT, posters);
                }
            } catch (Throwable ignored) {
            }

            // Custom film backdrop overrides — same shape, separate key.
            try {
                JSONObject backdrops = CustomPosterStore.snapshotBackdrops();
                if (backdrops != null && backdrops.length() > 0) {
                    root.put(KEY_CUSTOM_BACKDROPS_ROOT, backdrops);
                }
            } catch (Throwable ignored) {
            }

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
        JSONObject posters = null;
        JSONObject backdrops = null;
        try {
            JSONObject root = new JSONObject(text);
            if (root.optInt("format", 0) != FORMAT) return -1;
            settings = root.optJSONObject("settings");
            if (settings == null) return -1;
            // Both optional — an older config without them is still valid.
            posters = root.optJSONObject(KEY_CUSTOM_POSTERS_ROOT);
            backdrops = root.optJSONObject(KEY_CUSTOM_BACKDROPS_ROOT);
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

        // Custom poster overrides — replace the whole map on import.
        try {
            if (posters != null) {
                CustomPosterStore.replaceAll(posters);
                applied += posters.length();
            }
        } catch (Throwable ignored) {
        }

        // Custom backdrop overrides — same treatment.
        try {
            if (backdrops != null) {
                CustomPosterStore.replaceAllBackdrops(backdrops);
                applied += backdrops.length();
            }
        } catch (Throwable ignored) {
        }

        return applied;
    }

    /** Light per-key checks. CSV / free-form keys pass through — their readers already ignore junk. */
    private static boolean validString(String key, String v) {
        switch (key) {
            case Prefs.KEY_THEME_SURFACE:
                return v.isEmpty()
                        || v.equals("stock")
                        || v.equals("oled")
                        || v.equals("purple")
                        || v.equals("midnight");
            case Prefs.KEY_NAV_INDICATOR:
                return oneOf(v, "stock", "nopill", "white", "accent", "accentPill");
            case Prefs.KEY_LAUNCH_TAB:
                return oneOf(v, "last", "popular", "search", "activity", "watchlist", "profile");
            case Prefs.KEY_STREAMING_APP:
                return oneOf(v, "stremio", "nuvio", "cloudstream");
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
            case Prefs.KEY_PROFILE_BACKDROP:
                // URL string. Just sanity-check length; empty is valid (means "cleared").
                return v.length() <= 2048;
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
