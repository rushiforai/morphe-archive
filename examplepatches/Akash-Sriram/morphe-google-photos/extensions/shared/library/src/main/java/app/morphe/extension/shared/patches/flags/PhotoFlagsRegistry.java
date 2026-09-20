package app.morphe.extension.shared.patches.flags;

import android.content.SharedPreferences;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import app.morphe.extension.shared.Logger;

/**
 * Single source of truth for the curated 25 Morphe Google Photos Flags.
 * Stripped of obsolete, broken, legacy, and OneGoogle library flags.
 */
public final class PhotoFlagsRegistry {

    private PhotoFlagsRegistry() {}

    public enum FlagType {
        BOOLEAN,
        LONG,
        STRING
    }

    public static class CuratedFlag {
        public final String key;
        public final String title;
        public final String description;
        public final String category;
        public final FlagType type;
        public final Object defaultValue;

        public CuratedFlag(String key, String title, String description, String category, FlagType type, Object defaultValue) {
            this.key = key;
            this.title = title;
            this.description = description;
            this.category = category;
            this.type = type;
            this.defaultValue = defaultValue;
        }

        public boolean isBoolean() {
            return type == FlagType.BOOLEAN;
        }

        public boolean isLong() {
            return type == FlagType.LONG;
        }
    }

    public static final List<CuratedFlag> CURATED_FLAGS = new ArrayList<>();
    public static final Map<String, CuratedFlag> FLAG_MAP = new LinkedHashMap<>();

    static {
        // 1. Photo Editor & Tools (4 flags)
        register("45705305", "Tap/Circle Select", "Tap, circle or brush to select objects in editor", "Photo Editor", FlagType.BOOLEAN, true);
        register("45683689", "AI Enhance V2", "AI Enhance V2 presets with multi-option photo enhancement", "Photo Editor", FlagType.BOOLEAN, true);
        register("45797840", "Moods Edit Presets", "Adaptive creative edit presets with hold-to-compare", "Photo Editor", FlagType.BOOLEAN, true);
        register("45709528", "New Video Editor & AI", "Intuitive video editor layout with AI-powered features & presets", "Photo Editor", FlagType.BOOLEAN, true);

        // 2. Navigation & Tabs (4 flags)
        register("45762698", "Collections V2 Layout", "Collections Shelves V2 redesigned grouped layout (0=Off, 2=On)", "Navigation & Tabs", FlagType.LONG, 2L);
        register("45802110", "Collections V2 Content", "Collections Shelves V2 content view and modern shelves", "Navigation & Tabs", FlagType.LONG, 2L);
        register("45752831", "Reels Videos Tab (V1)", "Full-screen scrollable Reels-style Videos feed", "Navigation & Tabs", FlagType.BOOLEAN, true);
        register("45754546", "Reels Videos Tab (V2)", "Explore tab transition into full-screen video feed", "Navigation & Tabs", FlagType.BOOLEAN, true);

        // 3. AI Assistant & Top Bar (2 flags)
        register("45753590", "\"On this device\" Filter", "Quick top bar filter button to show local device media", "AI & Search", FlagType.BOOLEAN, true);
        register("45724258", "Ask Photos AI", "Conversational Gemini AI search (requires server enrollment)", "AI & Search", FlagType.BOOLEAN, true);

        // 4. Media, Grid & Memories (15 flags)
        register("45743215", "Date Capsule Pill", "Floating [ Today ] date capsule pill & smart search filters", "Media & Memories", FlagType.BOOLEAN, true);
        register("45732792", "Floating Navigation Bar", "Floating bottom navigation bar pill", "Media & Memories", FlagType.BOOLEAN, true);
        register("45683026", "Video Seek Scrubbing", "High-speed video thumbnail scrubbing preview bar", "Media & Memories", FlagType.BOOLEAN, true);
        register("45353606", "Document Scanner Crop", "Perspective document scanner cropping & modern controls", "Media & Memories", FlagType.BOOLEAN, true);
        register("45694311", "Motion Stabilizer", "Motion photo stabilizer and floating playback pill", "Media & Memories", FlagType.BOOLEAN, true);
        register("45659276", "Story Cutouts (Pop-Out)", "Master pop-out subject cutout scrapbook animations in Memories", "Media & Memories", FlagType.BOOLEAN, true);
        register("45477626", "MemoryCard Styles", "Master MemoryCard graphic styling & scrapbook frames", "Media & Memories", FlagType.BOOLEAN, true);
        register("45785531", "Pop-Out Templates", "Pop-out animation templates & 3D foreground motion", "Media & Memories", FlagType.BOOLEAN, true);
        register("45662994", "MemoryCard Templates", "Dynamic scrapbook layout templates & textures", "Media & Memories", FlagType.BOOLEAN, true);
        register("45741031", "N Years Ago Generator", "On-device N Years Ago graphic generator", "Media & Memories", FlagType.BOOLEAN, true);
        register("45737826", "Over the Years Theme", "Over the Years delightful scrapbook theme", "Media & Memories", FlagType.BOOLEAN, true);
        register("45764779", "Collage Engine", "Multi-up collage scrapbook layout engine", "Media & Memories", FlagType.BOOLEAN, true);
        register("45659278", "Collage Layout Support", "Multi-up collage layout support & animations", "Media & Memories", FlagType.BOOLEAN, true);
        register("45742883", "Multi-up Capability", "Story multi-up grid and cutout capability", "Media & Memories", FlagType.BOOLEAN, true);
        register("3999", "Skottie CDN Bundle", "Skottie asset bundle CDN version for cutout animations", "Media & Memories", FlagType.LONG, 118109605L);
    }

    private static void register(String key, String title, String description, String category, FlagType type, Object defaultValue) {
        CuratedFlag flag = new CuratedFlag(key, title, description, category, type, defaultValue);
        CURATED_FLAGS.add(flag);
        FLAG_MAP.put(key, flag);
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
        if (prefs == null) return;
        SharedPreferences.Editor editor = prefs.edit();
        for (CuratedFlag f : CURATED_FLAGS) {
            if (f.type == FlagType.BOOLEAN) {
                editor.putBoolean(f.key, (Boolean) f.defaultValue);
            } else if (f.type == FlagType.LONG) {
                editor.putLong(f.key, ((Number) f.defaultValue).longValue());
            } else {
                editor.putString(f.key, String.valueOf(f.defaultValue));
            }
        }
        editor.putInt("_morphe_curated_preset_version", 8);
        editor.putBoolean("_morphe_flags_seeded", true);
        editor.apply();
        Logger.printInfo(() -> "Applied all " + CURATED_FLAGS.size() + " curated preset flags to SharedPreferences.");
    }

    public static void applyAll26Defaults(SharedPreferences prefs) {
        applyCuratedDefaults(prefs);
    }
}
