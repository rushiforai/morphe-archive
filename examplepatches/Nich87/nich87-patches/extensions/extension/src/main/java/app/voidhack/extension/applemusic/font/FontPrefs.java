package app.voidhack.extension.applemusic.font;

import android.content.Context;
import android.content.SharedPreferences;

import java.io.File;

final class FontPrefs {
    private static final String PREFS_NAME = "voidhack_custom_font";

    private static final String KEY_ENABLED = "enabled";
    private static final String KEY_SOURCE = "source";
    private static final String KEY_SCOPE = "scope";
    private static final String KEY_KEEP_SF_LATIN = "keep_sf_latin";
    private static final String KEY_DISABLE_SF_TRACKING = "disable_sf_tracking";
    private static final String KEY_WEIGHT_OFFSET = "weight_offset";
    private static final String KEY_CONFIG_VERSION = "config_version";

    static final int MIN_WEIGHT_OFFSET = -200;
    static final int MAX_WEIGHT_OFFSET = 200;

    enum FontSource {
        CUSTOM_FILE,
        SYSTEM_SANS,
        SYSTEM_SERIF,
        SYSTEM_MONOSPACE;

        static FontSource fromName(String name) {
            if (name == null) return CUSTOM_FILE;
            for (FontSource s : values()) {
                if (s.name().equals(name)) return s;
            }
            return CUSTOM_FILE;
        }
    }

    enum FontScope {
        ALL,
        LYRICS_ONLY,
        UI_ONLY;

        static FontScope fromName(String name) {
            if (name == null) return ALL;
            for (FontScope s : values()) {
                if (s.name().equals(name)) return s;
            }
            return ALL;
        }
    }

    enum FontSlot {
        MAIN_REGULAR("main_regular.font"),
        MAIN_BOLD("main_bold.font"),
        LYRICS_REGULAR("lyrics_regular.font"),
        LYRICS_BOLD("lyrics_bold.font");

        final String fileName;

        FontSlot(String fileName) {
            this.fileName = fileName;
        }
    }

    private FontPrefs() {}

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    static boolean isEnabled(Context ctx) {
        return prefs(ctx).getBoolean(KEY_ENABLED, false);
    }

    static void setEnabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_ENABLED, value).apply();
        bumpVersion(ctx);
    }

    static FontSource getSource(Context ctx) {
        return FontSource.fromName(prefs(ctx).getString(KEY_SOURCE, FontSource.CUSTOM_FILE.name()));
    }

    static void setSource(Context ctx, FontSource source) {
        prefs(ctx).edit().putString(KEY_SOURCE, source.name()).apply();
        bumpVersion(ctx);
    }

    static FontScope getScope(Context ctx) {
        return FontScope.fromName(prefs(ctx).getString(KEY_SCOPE, FontScope.ALL.name()));
    }

    static void setScope(Context ctx, FontScope scope) {
        prefs(ctx).edit().putString(KEY_SCOPE, scope.name()).apply();
        bumpVersion(ctx);
    }

    static boolean isKeepSfProLatin(Context ctx) {
        return prefs(ctx).getBoolean(KEY_KEEP_SF_LATIN, false);
    }

    static void setKeepSfProLatin(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_KEEP_SF_LATIN, value).apply();
        bumpVersion(ctx);
    }

    static boolean isDisableSfTracking(Context ctx) {
        return prefs(ctx).getBoolean(KEY_DISABLE_SF_TRACKING, true);
    }

    static void setDisableSfTracking(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_DISABLE_SF_TRACKING, value).apply();
        bumpVersion(ctx);
    }

    static int getWeightOffset(Context ctx) {
        return clampWeightOffset(prefs(ctx).getInt(KEY_WEIGHT_OFFSET, 0));
    }

    static void setWeightOffset(Context ctx, int value) {
        prefs(ctx).edit().putInt(KEY_WEIGHT_OFFSET, clampWeightOffset(value)).apply();
        bumpVersion(ctx);
    }

    static int clampWeightOffset(int value) {
        return Math.max(MIN_WEIGHT_OFFSET, Math.min(MAX_WEIGHT_OFFSET, value));
    }

    static long getConfigVersion(Context ctx) {
        return prefs(ctx).getLong(KEY_CONFIG_VERSION, 1L);
    }

    static void bumpVersion(Context ctx) {
        SharedPreferences p = prefs(ctx);
        p.edit().putLong(KEY_CONFIG_VERSION, p.getLong(KEY_CONFIG_VERSION, 1L) + 1L).apply();
    }

    static File fontDir(Context ctx) {
        File dir = new File(ctx.getApplicationContext().getFilesDir(), "voidhack_custom_font");
        if (!dir.exists()) dir.mkdirs();
        return dir;
    }

    static File slotFile(Context ctx, FontSlot slot) {
        return new File(fontDir(ctx), slot.fileName);
    }

    static boolean hasSlotFile(Context ctx, FontSlot slot) {
        File f = slotFile(ctx, slot);
        return f.isFile() && f.length() >= 12L;
    }

    static String getSlotDisplayName(Context ctx, FontSlot slot) {
        return prefs(ctx).getString("slot_name_" + slot.name(), "");
    }

    static void setSlotDisplayName(Context ctx, FontSlot slot, String name) {
        prefs(ctx).edit().putString("slot_name_" + slot.name(), name == null ? "" : name).apply();
        bumpVersion(ctx);
    }

    static void clearSlot(Context ctx, FontSlot slot) {
        File f = slotFile(ctx, slot);
        if (f.exists()) f.delete();
        prefs(ctx).edit().remove("slot_name_" + slot.name()).apply();
        bumpVersion(ctx);
    }
}
