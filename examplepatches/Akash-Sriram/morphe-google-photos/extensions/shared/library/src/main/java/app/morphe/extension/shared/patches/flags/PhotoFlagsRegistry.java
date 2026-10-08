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
        CATEGORY_TRIGGERS.put("👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "⚡ Triggers: Outfit try-on card, virtual wardrobe & flatlay generator");
        CATEGORY_TRIGGERS.put("📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "⚡ Triggers: Collage tool card, 100+ modern grid layouts & art styles");
        CATEGORY_TRIGGERS.put("🎞️ Create Tab: Tool 7 — Animation (GIF Editor)", "⚡ Triggers: Animation tool card & living photo burst loop generator");
        CATEGORY_TRIGGERS.put("✨ Stories & Memories: 3D Pop-Out & Cutouts", "⚡ Triggers: 3D subjects breaking out of memory frames & motion graphics");
        CATEGORY_TRIGGERS.put("🎵 Stories & Memories: Player Controls & Sound", "⚡ Triggers: Full-screen story player, background music & bulk font titling");
        CATEGORY_TRIGGERS.put("🧭 Modern Navigation & Floating Bar", "⚡ Triggers: Floating Material You pill navigation bar & [ Today ] date pill");
        CATEGORY_TRIGGERS.put("📁 Collections V2 & Shelves", "⚡ Triggers: Collections horizontal shelves, pinned albums & pet carousels");
        CATEGORY_TRIGGERS.put("🪄 AI Photo & Video Editor Tools", "⚡ Triggers: Magic Editor lasso selection, AI Enhance V2 & Varenyky timeline");
        CATEGORY_TRIGGERS.put("⭕ OneGoogle: Subscriber Avatar Rings", "⚡ Triggers: Multi-color metallic Google One subscriber ring around avatar");
        initFlags();
    }

    private static void initFlags() {
        register("45713555", "Apparel Carousel in Create Tab", "Horizontal showcase carousel in Create Tab highlighting your recognized outfits.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Tool 4: Apparel Carousel", FlagType.BOOLEAN, Boolean.TRUE);
        register("45818951", "Collage Grid Layout 45818951", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("3756", "Collage Grid Layout 3756", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45398451", "Collage Grid Layout 45398451", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45623041", "Collage Grid Layout 45623041", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45721092", "Collage Grid Layout 45721092", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45740262", "Collage Grid Layout 45740262", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45810382", "Collage Grid Layout 45810382", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45835544", "Collage Grid Layout 45835544", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45835545", "Collage Grid Layout 45835545", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45836696", "Collage Grid Layout 45836696", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45839387", "Collage Grid Layout 45839387", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45353606", "Motion & Document Optimizer", "Keystone correction and frame stabilization for animated sequences.", "🎞️ Create Tab: Tool 7 — Animation (GIF Editor)", "Tool 7: Sequence Optimizer", FlagType.BOOLEAN, Boolean.TRUE);
        register("45694311", "Motion Photo Frame Extractor", "Extracts stabilized frames from motion photos for animated GIF loops.", "🎞️ Create Tab: Tool 7 — Animation (GIF Editor)", "Tool 7: Animation Card", FlagType.BOOLEAN, Boolean.TRUE);
        register("4311", "Feature Flag 4311", "Controls functional UI behavior and enhancements for flag 4311.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "UI Enhancement Feature", FlagType.BOOLEAN, Boolean.TRUE);
        register("45735093", "Memories 3D Feature 45735093", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45742883", "3D Story Card Cutout Elevation", "Elevates cutout subjects with realistic drop shadows during story slide transitions.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Card Elevation Shadows", FlagType.BOOLEAN, Boolean.TRUE);
        register("45764779", "Flying Memories Carousel (FMC) Physics", "Ultra-fluid spring physics and inertia when swiping through the memories header.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "Flying Memories Physics", FlagType.BOOLEAN, Boolean.TRUE);
        register("45662994", "Dynamic Pacing & Rhythm in Stories", "Adjusts story slide durations dynamically based on photo composition and music beat.", "🎵 Stories & Memories: Player Controls & Sound", "Dynamic Story Pacing", FlagType.BOOLEAN, Boolean.TRUE);
        register("45737826", "Edge-to-Edge Swipe Navigation", "Android 14/15 predictive back gesture and fluid edge-to-edge story player swiping.", "🎵 Stories & Memories: Player Controls & Sound", "Edge-to-Edge Navigation", FlagType.BOOLEAN, Boolean.TRUE);
        register("45752831", "Reels Video Tab (V1)", "Full-screen vertical swipe video feed tab in the main navigation bar.", "🧭 Modern Navigation & Floating Bar", "Reels Video Feed Tab", FlagType.BOOLEAN, Boolean.TRUE);
        register("45753590", "On This Device Filter Pill", "Adds top-bar filter button to isolate and display only photos physically stored on the device.", "🧭 Modern Navigation & Floating Bar", "Local Media Filter", FlagType.BOOLEAN, Boolean.TRUE);
        register("45754546", "Reels Video Tab (V2)", "Gesture navigation transition and fluid swipe gestures into full-screen video feed.", "🧭 Modern Navigation & Floating Bar", "Reels Gesture Navigation", FlagType.BOOLEAN, Boolean.TRUE);
        register("3013", "Collections Card Animation Mode", "Controls card touch responsiveness and ripple bounds (1 = Modern fluid expand).", "📁 Collections V2 & Shelves", "Card Touch Physics", FlagType.LONG, 1L);
        register("45762698", "Collections V2 Shelves Layout", "Reorganizes the Library tab into modern categorized Collections V2 horizontal shelves (0=Off, 1=Legacy, 2=Full V2).", "📁 Collections V2 & Shelves", "Collections Shelves Structure", FlagType.LONG, 2L);
        register("45802110", "Collections V2 Content Activation", "Populates dynamic categorized content cards within the Collections V2 shelves.", "📁 Collections V2 & Shelves", "Dynamic Shelf Content", FlagType.LONG, 2L);
        register("3023", "Pinned Albums Shelf Activation", "Internal switch enabling custom album pinning to the Collections V2 top shelf.", "📁 Collections V2 & Shelves", "Album Pinning Switch", FlagType.BOOLEAN, Boolean.TRUE);
        register("3026", "Pinned Albums Entrypoint", "Enables album pin/unpin context actions across albums and search collections.", "📁 Collections V2 & Shelves", "Album Pinning Actions", FlagType.BOOLEAN, Boolean.TRUE);
        register("45794037", "Screenshots Shelf", "Dedicated shelf grouping on-device screenshots with quick share options.", "📁 Collections V2 & Shelves", "Screenshots Category Shelf", FlagType.BOOLEAN, Boolean.TRUE);
        register("45794038", "Documents Shelf", "Dedicated shelf filtering receipts, documents, identity cards, and notes.", "📁 Collections V2 & Shelves", "Documents Category Shelf", FlagType.BOOLEAN, Boolean.TRUE);
        register("45683689", "AI Enhance V2", "Multi-stage neural network image enhancement for exposure, HDR, and detail.", "🪄 AI Photo & Video Editor Tools", "AI Neural Photo Enhance", FlagType.BOOLEAN, Boolean.TRUE);
        register("45705305", "Magic Editor Gesture Lasso Selection", "Circle-to-select and tap-to-select object recognition inside Magic Editor.", "🪄 AI Photo & Video Editor Tools", "Magic Editor Object Lasso", FlagType.BOOLEAN, Boolean.TRUE);
        register("45709528", "Redesigned Video Editor (Varenyky)", "Modern multi-layer video editor timeline with speed controls and text overlays.", "🪄 AI Photo & Video Editor Tools", "Varenyky Video Timeline", FlagType.BOOLEAN, Boolean.TRUE);
        register("45724258", "Ask Photos AI Natural Language Search", "Ask natural conversational questions to find specific photos and memories.", "🪄 AI Photo & Video Editor Tools", "Ask Photos AI Search", FlagType.BOOLEAN, Boolean.TRUE);
        register("45753336", "Bluejay AI Model V3", "Forces Bluejay AI model version 3 backend with caching for video generation.", "🪄 AI Photo & Video Editor Tools", "Bluejay V3 Backend", FlagType.BOOLEAN, Boolean.TRUE);
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
        edit.apply();
    }

    public static void applyAll26Defaults(SharedPreferences prefs) {
        applyCuratedDefaults(prefs);
    }
}
