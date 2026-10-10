package app.nogoogle.gboard.extras;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;

import app.nogoogle.gboard.NoGoogleSettings;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Small Gboard features ported from jasonwu1994's Gboard-patches
 * (https://github.com/jasonwu1994/Gboard-patches, GPLv3), each a set of feature flag overrides.
 * A feature works only when its Morphe patch was applied (the patch leaves a manifest marker)
 * and its switch in No-Google settings is on.
 */
public final class PortedFeatures {
    /** Manifest meta-data name prefix written by each feature's Morphe patch. */
    public static final String MARKER_PREFIX = "app.nogoogle.feature.";
    public static final String PREF_PREFIX = "gp_";

    public static final int TOOLBAR_MIN = 3;
    public static final int TOOLBAR_MAX = 8;
    public static final int TOOLBAR_DEFAULT = 6;
    public static final int CLIPBOARD_DEFAULT = 20_000; // Gboard's own limit

    // Feature kinds: plain ints, not an enum (see build.sh: d8 3.3.20 cannot dex javac 21 enums).
    public static final int SWITCH = 0;
    public static final int MENU_STYLE = 1;
    public static final int TOOLBAR_COUNT = 2;
    public static final int CLIPBOARD_LIMIT = 3;

    /** A ported feature: its id (marker / setting), Morphe name, description, the flags it sets and
     *  whether its switch starts on. */
    public static final class Feature {
        public final String id;
        public final String name;
        public final String description;
        public final int kind;
        final boolean defaultOn;
        final List<String> flags;

        Feature(String id, String name, String description, int kind, boolean defaultOn, String... flags) {
            this.id = id;
            this.name = name;
            this.description = description;
            this.kind = kind;
            this.defaultOn = defaultOn;
            this.flags = Arrays.asList(flags);
        }

        public String setting() {
            return PREF_PREFIX + id;
        }
    }

    // Names, descriptions and switch defaults as in Gboard-patches; flags verified present in Gboard 18.2.4.
    public static final List<Feature> ALL = Collections.unmodifiableList(Arrays.asList(
            new Feature("emoji_size", "Change emoji size", "Enables Gboard's emoji size setting.",
                    SWITCH, true, "emoji_scale_supported"),
            new Feature("cursor_trackpad", "Enable cursor trackpad mode",
                    "Enables the long-press-spacebar trackpad, cursor lock mode, and the required scrub-move preference.",
                    SWITCH, false, "free_cursor", "free_cursor_lock_mode"),
            new Feature("key_shape", "Key Shape Selection",
                    "Enables the Key shape option inside theme details without forcing rounded keys by default.",
                    SWITCH, true, "more_pill_keys"),
            new Feature("close_proactive", "Close Proactive Suggestions",
                    "Shows a dismiss button in the proactive suggestions bar.",
                    SWITCH, true, "enable_close_proactive_suggestions_access_point"),
            new Feature("quick_insert", "Quick Insert", "Enables the Quick Insert panel and toolbar access point.",
                    SWITCH, true, "super_insert", "super_insert_vk"),
            new Feature("inline_autofill", "Enable Inline Autofill Suggestions",
                    "Enables inline autofill suggestions in supported contexts.",
                    SWITCH, true, "enable_device_intelligence"),
            new Feature("access_points_menu", "Access Points menu style",
                    "Lets you switch between the new and legacy Access Points menu styles.",
                    MENU_STYLE, false, "enable_access_points_menu_redesign"),
            new Feature("toolbar_count", "Top Toolbar Item Count", "Lets you customize the top toolbar item count.",
                    TOOLBAR_COUNT, false, "config_max_access_points", "config_default_access_points_num_on_bar"),
            new Feature("clipboard_limit", "Clipboard Custom Character Limit",
                    "Lets you set the maximum number of characters stored for each text clipboard item, "
                            + "with Gboard's stock 20,000-character limit as the default.",
                    CLIPBOARD_LIMIT, true, "text_clip_item_char_limit")));

    private static final Map<String, Feature> BY_FLAG = new HashMap<>();

    static {
        for (Feature f : ALL) for (String flag : f.flags) BY_FLAG.put(flag, f);
    }

    private static volatile Set<String> included;

    private PortedFeatures() {
    }

    /** Called from FlagOverrides for every Gboard flag read. */
    public static Object apply(String flag, Object value) {
        Feature f = BY_FLAG.get(flag);
        if (f == null || !included(f)) return value;
        switch (f.kind) {
            case SWITCH: // only switch on what Gboard has off, as Gboard-patches does
                return Boolean.FALSE.equals(value) && on(f) ? Boolean.TRUE : value;
            case MENU_STYLE: // on = the new menu, off = the legacy one
                return value instanceof Boolean ? Boolean.valueOf(on(f)) : value;
            case TOOLBAR_COUNT:
                return value instanceof Long && on(f) ? Long.valueOf(toolbarCount()) : value;
            case CLIPBOARD_LIMIT:
                return value instanceof Long ? Long.valueOf(clipboardLimit()) : value;
            default:
                return value;
        }
    }

    /** The feature's Morphe patch was applied (its manifest marker is present). */
    public static boolean included(Feature f) {
        Set<String> s = included;
        if (s == null) {
            s = readMarkers();
            if (s == null) return false; // no context yet: try again on the next read
            included = s;
        }
        return s.contains(f.id);
    }

    public static boolean anyIncluded() {
        for (Feature f : ALL) if (included(f)) return true;
        return false;
    }

    private static Set<String> readMarkers() {
        Context c = NoGoogleSettings.context();
        if (c == null) return null;
        try {
            ApplicationInfo info = c.getPackageManager().getApplicationInfo(c.getPackageName(), PackageManager.GET_META_DATA);
            Set<String> ids = new HashSet<>();
            Bundle meta = info.metaData;
            if (meta != null) {
                for (String key : meta.keySet()) {
                    if (key.startsWith(MARKER_PREFIX)) ids.add(key.substring(MARKER_PREFIX.length()));
                }
            }
            return ids;
        } catch (Throwable t) {
            return null;
        }
    }

    public static boolean on(Feature f) {
        return NoGoogleSettings.bool(f.setting());
    }

    /** Default of a feature's switch (setting key "gp_<id>"); false for unknown keys. */
    public static boolean defaultOn(String setting) {
        for (Feature f : ALL) if (f.setting().equals(setting)) return f.defaultOn;
        return false;
    }

    public static int toolbarCount() {
        int n = intSetting("gp_toolbar_count_value", TOOLBAR_DEFAULT);
        return Math.max(TOOLBAR_MIN, Math.min(TOOLBAR_MAX, n));
    }

    /**
     * Patched over every read of the toolbar's capacity (AccessPointsBar keeps the flag value it saw when
     * it was built): with a custom count on, always the current count, so a change applies at once and
     * dragging items in respects it.
     */
    public static int toolbarCapacity(int stock) {
        Feature f = BY_FLAG.get("config_max_access_points");
        return f != null && included(f) && on(f) ? toolbarCount() : stock;
    }

    public static int clipboardLimit() {
        int n = intSetting("gp_clipboard_limit_value", CLIPBOARD_DEFAULT);
        return n > 0 ? n : CLIPBOARD_DEFAULT;
    }

    private static int intSetting(String key, int fallback) {
        try {
            String v = NoGoogleSettings.str(key);
            return v == null || v.isEmpty() ? fallback : Integer.parseInt(v.trim());
        } catch (NumberFormatException e) {
            return fallback;
        }
    }
}
