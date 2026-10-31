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
        CATEGORY_TRIGGERS.put("✨ Stories & Memories Hub", "⚡ Triggers: Full-screen story player, carousel physics & themes");
        CATEGORY_TRIGGERS.put("📑 Create Tab: Collage & Scrapbook (Stamp M2)", "⚡ Triggers: Collage tool card, 100+ modern grid layouts & art styles");
        CATEGORY_TRIGGERS.put("📁 Collections V2 & Shelves", "⚡ Triggers: Collections horizontal shelves, screenshots & documents filtering");
        CATEGORY_TRIGGERS.put("🤖 Gemini & Ask Photos Search", "⚡ Triggers: Natural language photo search, conversational query engine & Gemini sparkle");
        CATEGORY_TRIGGERS.put("🪄 AI Photo & Video Editor Tools", "⚡ Triggers: Magic Editor lasso selection, AI Enhance V2 & Bluejay AI backend");
        CATEGORY_TRIGGERS.put("🎞️ Create Tab: Motion & Animation", "⚡ Triggers: Animation tool card, burst loop generator & motion photo stabilizer pill");
        CATEGORY_TRIGGERS.put("🧭 Modern Navigation & Filters", "⚡ Triggers: \"On this device\" media filter pill & local photo isolation");
        CATEGORY_TRIGGERS.put("⭕ OneGoogle: Subscriber Avatar Rings", "⚡ Triggers: Multi-color metallic Google One subscriber ring around avatar");
        initFlags();
    }

    private static void initFlags() {
        // ✨ Stories & Memories Hub (4 Flags)
        register("3023", "Story Player Navigation Gestures", "Enhanced swipe gestures, tap-to-pause, and story navigation controls.", "✨ Stories & Memories Hub", "Story Player Navigation Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("3026", "Redesigned Memories Carousel", "Header carousel layout and transition effects for active memory stories.", "✨ Stories & Memories Hub", "Memories Carousel Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45662994", "MemoryCard Layout Templates", "Graphic scrapbooking frames, background textures, and dynamic card pacing.", "✨ Stories & Memories Hub", "Dynamic Story Pacing & Templates", FlagType.BOOLEAN, Boolean.TRUE);
        register("45737826", "Over the Years Scrapbook Theme", "Unlocks Over the Years commemorative memory layout and fluid edge-to-edge transitions.", "✨ Stories & Memories Hub", "Edge-to-Edge Navigation & Themes", FlagType.BOOLEAN, Boolean.TRUE);

        // 📑 Create Tab: Collage & Scrapbook (9 Flags)
        register("3756", "Collage Grid Layout Engine (Base)", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45398451", "Collage Grid Layout 45398451", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45623041", "Collage Grid Layout 45623041", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45721092", "Collage Grid Layout 45721092", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45740262", "Collage Grid Layout 45740262", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45810382", "Collage Grid Layout 45810382", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45835544", "Collage Grid Layout 45835544", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45835545", "Collage Grid Layout 45835545", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45836696", "Collage Grid Layout 45836696", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);

        // 📁 Collections V2 & Shelves (2 Flags)
        register("45762698", "Collections V2 Shelves Layout", "Reorganizes the Library tab into modern categorized Collections V2 horizontal shelves (0=Off, 1=Legacy, 2=Full V2, 8=Modern Redesign).", "📁 Collections V2 & Shelves", "Collections Shelves Structure", FlagType.LONG, 8L);
        register("3226", "Bouquet Album Title Online", "Enables title string creation in CreateEnvelope RPC.", "📁 Collections V2 & Shelves", "Album Title Engine", FlagType.BOOLEAN, Boolean.TRUE);

        // 🤖 Gemini & Ask Photos Search (2 Flags)
        register("3013", "Gemini Search UI & Sparkle Indicator", "Enables modern Gemini AI search interface and interactive sparkle highlights (1 = Modern fluid expand).", "🤖 Gemini & Ask Photos Search", "Gemini UI & Sparkle Physics", FlagType.LONG, 1L);
        register("45724258", "Ask Photos AI Natural Language Search", "Ask natural conversational questions to find specific photos and memories.", "🤖 Gemini & Ask Photos Search", "Ask Photos AI Search", FlagType.BOOLEAN, Boolean.TRUE);

        // 🪄 AI Photo & Video Editor Tools (3 Flags)
        register("45683689", "AI Enhance V2", "Multi-stage neural network image enhancement for exposure, HDR, and detail.", "🪄 AI Photo & Video Editor Tools", "AI Neural Photo Enhance", FlagType.BOOLEAN, Boolean.TRUE);
        register("45705305", "Magic Editor Gesture Lasso Selection", "Circle-to-select and tap-to-select object recognition inside Magic Editor.", "🪄 AI Photo & Video Editor Tools", "Magic Editor Object Lasso", FlagType.BOOLEAN, Boolean.TRUE);
        register("45753336", "Bluejay AI Model V3", "Forces Bluejay AI model version 3 backend with caching for video generation.", "🪄 AI Photo & Video Editor Tools", "Bluejay V3 Backend", FlagType.BOOLEAN, Boolean.TRUE);

        // 🎞️ Create Tab: Motion & Animation (3 Flags)
        register("4311", "Motion Photo Stabilizer & Floating Pill", "Controls floating playback pill and motion video stabilization in viewer.", "🎞️ Create Tab: Motion & Animation", "Motion Photo Playback Pill", FlagType.BOOLEAN, Boolean.TRUE);
        register("45353606", "Motion & Document Optimizer", "Keystone correction and frame stabilization for animated sequences.", "🎞️ Create Tab: Motion & Animation", "Tool 7: Sequence Optimizer", FlagType.BOOLEAN, Boolean.TRUE);
        register("45694311", "Motion Photo Frame Extractor", "Extracts stabilized frames from motion photos for animated GIF loops.", "🎞️ Create Tab: Motion & Animation", "Tool 7: Animation Card", FlagType.BOOLEAN, Boolean.TRUE);

        // 🧭 Modern Navigation & Filters (1 Flag)
        register("45753590", "On This Device Filter Pill", "Adds top-bar filter button to isolate and display only photos physically stored on the device.", "🧭 Modern Navigation & Filters", "Local Media Filter", FlagType.BOOLEAN, Boolean.TRUE);

        // ⭕ OneGoogle: Subscriber Avatar Rings (2 Flags)
        register("45531621", "OneGoogle Avatar Ring Master", "Forces the Google One subscriber metallic ring and Bento profile card layout.", "⭕ OneGoogle: Subscriber Avatar Rings", "OneGoogle Bento & Avatar Ring", FlagType.BOOLEAN, Boolean.TRUE);
        register("45531625", "Subscriber Ring Style (3 = Blue Pro)", "Controls the ring decoration visual style (3 = solid blue with Pro badge).", "⭕ OneGoogle: Subscriber Avatar Rings", "Avatar Ring Visual Style", FlagType.LONG, 3L);
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
