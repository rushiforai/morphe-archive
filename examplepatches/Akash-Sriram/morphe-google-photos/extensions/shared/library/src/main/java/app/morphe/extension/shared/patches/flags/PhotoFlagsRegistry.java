package app.morphe.extension.shared.patches.flags;

import android.content.SharedPreferences;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import app.morphe.extension.shared.Logger;

/**
 * Registry for Morphe Google Photos Flags.
 * Pre-populated with verified flags, tool-centric categories, and subsystem trigger explanations.
 * Contains only the flags that override Google's defaults or provide custom features.
 */
public final class PhotoFlagsRegistry {

    private PhotoFlagsRegistry() {}

    public enum FlagType {
        BOOLEAN,
        LONG,
        STRING,
        FLOAT
    }

    public static class CuratedFlag {
        public final String key;
        public final String title;
        public final String description;
        public final String category;
        public final String triggerTarget;
        public final FlagType type;
        public final Object defaultValue;

        public CuratedFlag(String key, String title, String description, String category, String triggerTarget, FlagType type, Object defaultValue) {
            this.key = key;
            this.title = title;
            this.description = description;
            this.category = category;
            this.triggerTarget = triggerTarget;
            this.type = type;
            this.defaultValue = defaultValue;
        }

        public boolean isBoolean() {
            return type == FlagType.BOOLEAN;
        }

        public boolean isLong() {
            return type == FlagType.LONG;
        }

        public boolean isFloat() {
            return type == FlagType.FLOAT;
        }
    }

    public static final List<CuratedFlag> CURATED_FLAGS = new ArrayList<>();
    public static final Map<String, CuratedFlag> FLAG_MAP = new LinkedHashMap<>();
    public static final Map<String, String> CATEGORY_TRIGGERS = new LinkedHashMap<>();

    static {
        CATEGORY_TRIGGERS.put("🤖 Gemini & Ask Photos Search", "⚡ Triggers: Natural language photo search, conversational query engine & Gemini sparkle");
        CATEGORY_TRIGGERS.put("🪄 AI Photo & Video Editor Tools", "⚡ Triggers: Magic Editor lasso selection, AI Enhance V2 & Bluejay AI backend");
        CATEGORY_TRIGGERS.put("🎞️ Create Tab: Motion & Animation", "⚡ Triggers: Animation tool card, burst loop generator & motion photo stabilizer pill");
        CATEGORY_TRIGGERS.put("🧭 Modern Navigation & Filters", "⚡ Triggers: \"On this device\" media filter pill & local photo isolation");
        CATEGORY_TRIGGERS.put("⭕ OneGoogle: Subscriber Avatar Rings", "⚡ Triggers: Modern Blue Gemini Aura subscriber ring around avatar");
        initFlags();
    }

    private static void initFlags() {
        // 🤖 Gemini & Ask Photos Search (2 Flags)
        register("3013", "Gemini Search UI & Sparkle Indicator", "Enables modern Gemini AI search interface and interactive sparkle highlights (1 = Modern fluid expand).", "🤖 Gemini & Ask Photos Search", "Gemini UI & Sparkle Physics", FlagType.LONG, 1L);
        register("45724258", "Ask Photos AI Natural Language Search", "Ask natural conversational questions to find specific photos and memories.", "🤖 Gemini & Ask Photos Search", "Ask Photos AI Search", FlagType.BOOLEAN, Boolean.TRUE);

        // 🪄 AI Photo & Video Editor Tools (3 Flags)
        register("45683689", "AI Enhance V2", "Multi-stage neural network image enhancement for exposure, HDR, and detail.", "🪄 AI Photo & Video Editor Tools", "AI Neural Photo Enhance", FlagType.BOOLEAN, Boolean.TRUE);
        register("45705305", "Magic Editor Gesture Lasso Selection", "Circle-to-select and tap-to-select object recognition inside Magic Editor.", "🪄 AI Photo & Video Editor Tools", "Magic Editor Object Lasso", FlagType.BOOLEAN, Boolean.TRUE);
        register("45753336", "Bluejay AI Model V3", "Forces Bluejay AI model version 3 backend with caching for video generation.", "🪄 AI Photo & Video Editor Tools", "Bluejay V3 Backend", FlagType.BOOLEAN, Boolean.TRUE);

        // 🎞️ Create Tab: Motion & Animation (2 Flags)
        register("4311", "Motion Photo Stabilizer & Floating Pill", "Controls floating playback pill and motion video stabilization in viewer.", "🎞️ Create Tab: Motion & Animation", "Motion Photo Playback Pill", FlagType.BOOLEAN, Boolean.TRUE);
        register("45694311", "Motion Photo Frame Extractor", "Extracts stabilized frames from motion photos for animated GIF loops.", "🎞️ Create Tab: Motion & Animation", "Tool 7: Animation Card", FlagType.BOOLEAN, Boolean.TRUE);

        // 🧭 Modern Navigation & Filters (1 Flag)
        register("45753590", "On This Device Filter Pill", "Adds top-bar filter button to isolate and display only photos physically stored on the device.", "🧭 Modern Navigation & Filters", "Local Media Filter", FlagType.BOOLEAN, Boolean.TRUE);

        // ⭕ OneGoogle: Subscriber Avatar Rings (1 Flag)
        register("45781251", "Google One Blue Aura Ring (Gemini Style)", "Enables the modern blue gradient aura ring for Google One instead of the classic 4-color multi-color ring.", "⭕ OneGoogle: Subscriber Avatar Rings", "Google One Blue Ring", FlagType.BOOLEAN, Boolean.TRUE);
    }

    private static void register(String key, String title, String description, String category, String triggerTarget, FlagType type, Object defaultValue) {
        CuratedFlag flag = new CuratedFlag(key, title, description, category, triggerTarget, type, defaultValue);
        CURATED_FLAGS.add(flag);
        FLAG_MAP.put(key, flag);
    }

    public static String getCategoryTriggerDescription(String category) {
        String trig = CATEGORY_TRIGGERS.get(category);
        return trig != null ? trig : "Controls features and parameters in this subsystem";
    }

    public static List<String> getCategories() {
        List<String> categories = new ArrayList<>();
        for (CuratedFlag f : CURATED_FLAGS) {
            if (!categories.contains(f.category)) {
                categories.add(f.category);
            }
        }
        return categories;
    }

    public static List<CuratedFlag> getFlagsForCategory(String category) {
        List<CuratedFlag> list = new ArrayList<>();
        for (CuratedFlag f : CURATED_FLAGS) {
            if (f.category.equals(category)) {
                list.add(f);
            }
        }
        return list;
    }

    public static void applyCuratedDefaults(SharedPreferences prefs) {
        SharedPreferences.Editor edit = prefs.edit();
        for (CuratedFlag f : CURATED_FLAGS) {
            if (f.defaultValue instanceof Boolean) {
                edit.putBoolean(f.key, (Boolean) f.defaultValue);
            } else if (f.defaultValue instanceof Long) {
                edit.putLong(f.key, (Long) f.defaultValue);
            } else if (f.defaultValue instanceof Integer) {
                edit.putInt(f.key, (Integer) f.defaultValue);
            } else if (f.defaultValue instanceof Float) {
                edit.putFloat(f.key, (Float) f.defaultValue);
            } else if (f.defaultValue instanceof String) {
                edit.putString(f.key, (String) f.defaultValue);
            }
        }
        edit.putBoolean("_presets_loaded", true);
        edit.commit();
    }

    public static void applyAll26Defaults(SharedPreferences prefs) {
        applyCuratedDefaults(prefs);
    }
}
