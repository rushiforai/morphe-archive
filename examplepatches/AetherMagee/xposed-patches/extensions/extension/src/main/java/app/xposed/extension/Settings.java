package app.xposed.extension;

import android.content.Context;
import android.content.SharedPreferences;

/** User settings, mirroring the extension's options. Defaults follow X-Posed's Display settings as used here. */
final class Settings {
    static final String PREFS = "xposed_settings";

    static final String BADGE_SIZE = "badge_size";
    static final String BADGE_BACKGROUND = "badge_background";
    static final String BADGE_FLAGS = "badge_flags";
    static final String BADGE_DEVICES = "badge_devices";
    static final String BADGE_VPN = "badge_vpn";
    static final String BADGE_INFO = "badge_info";
    static final String FILTER_MODE = "filter_mode";
    static final String FILTER_LOCATIONS = "filter_locations";
    static final String ZERO_ENGAGEMENT = "zero_engagement";
    static final String COMMUNITY_CACHE = "community_cache";
    static final String HIGHLIGHT_CONTRAST = "highlight_contrast";

    static final String MODE_HIGHLIGHT = "highlight";
    static final String MODE_HIDE = "hide";

    private static volatile SharedPreferences prefs;
    private static volatile Badge badge;
    // Held strongly: SharedPreferences only keeps weak references to listeners.
    private static final SharedPreferences.OnSharedPreferenceChangeListener invalidate = (p, key) -> badge = null;

    /** Badge settings read together, once per change instead of on every bind. */
    static final class Badge {
        final BadgeStyle.Size size;
        final boolean background, flags, devices, vpn, info;

        private Badge() {
            size = badgeSize();
            background = bool(BADGE_BACKGROUND, true);
            flags = bool(BADGE_FLAGS, true);
            devices = bool(BADGE_DEVICES, false);
            vpn = bool(BADGE_VPN, false);
            info = bool(BADGE_INFO, true);
        }
    }

    static Badge badge() {
        Badge b = badge;
        if (b == null) badge = b = new Badge();
        return b;
    }

    private Settings() {
    }

    static void init(Context context) {
        if (prefs != null) return;
        synchronized (Settings.class) {
            if (prefs == null) {
                SharedPreferences p = context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
                p.registerOnSharedPreferenceChangeListener(invalidate);
                prefs = p;
                badge = null;
            }
        }
    }

    /** Null before init(), e.g. for events dispatched before the first post is shown. */
    static SharedPreferences prefs() {
        return prefs;
    }

    private static BadgeStyle.Size badgeSize() {
        String s = string(BADGE_SIZE, "medium");
        return "small".equals(s) ? BadgeStyle.Size.SMALL : "large".equals(s) ? BadgeStyle.Size.LARGE : BadgeStyle.Size.MEDIUM;
    }

    static boolean highlightMode() {
        return !MODE_HIDE.equals(string(FILTER_MODE, MODE_HIGHLIGHT));
    }

    /** Tint opacity multiplier and rail width in dp for highlighted posts; "standard" is X-Posed's look. */
    static float[] highlightContrast() {
        String level = string(HIGHLIGHT_CONTRAST, "standard");
        if (level.equals(contrastLevel)) return contrast;
        contrastLevel = level;
        contrast = contrastFor(level);
        return contrast;
    }

    private static volatile String contrastLevel;
    private static volatile float[] contrast;

    private static float[] contrastFor(String level) {
        switch (level) {
            case "subtle":
                return new float[]{0.5f, 2};
            case "strong":
                return new float[]{3, 3};
            case "bold":
                return new float[]{6, 4};
            default:
                return new float[]{1, 2};
        }
    }

    static boolean zeroEngagement() {
        return bool(ZERO_ENGAGEMENT, true);
    }

    static boolean communityCache() {
        return bool(COMMUNITY_CACHE, true);
    }

    private static boolean bool(String key, boolean def) {
        SharedPreferences p = prefs;
        return p == null ? def : p.getBoolean(key, def);
    }

    private static String string(String key, String def) {
        SharedPreferences p = prefs;
        return p == null ? def : p.getString(key, def);
    }
}
