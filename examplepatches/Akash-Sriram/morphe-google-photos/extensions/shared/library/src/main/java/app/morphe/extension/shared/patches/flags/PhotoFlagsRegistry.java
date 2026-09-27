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
        CATEGORY_TRIGGERS.put("🎨 Create Tab: Tool 1 — Video Remix & Soba", "⚡ Triggers: Video Remix tool card & AI clip styling in Create Tab");
        CATEGORY_TRIGGERS.put("🖼️ Create Tab: Tool 2 — Photo Remix & Poptart", "⚡ Triggers: Photo Remix card & prompt-based restyling in Create Tab");
        CATEGORY_TRIGGERS.put("🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "⚡ Triggers: Highlight video card, beat-matched movies & recipe chips");
        CATEGORY_TRIGGERS.put("👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "⚡ Triggers: Outfit try-on card, virtual wardrobe & flatlay generator");
        CATEGORY_TRIGGERS.put("📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "⚡ Triggers: Collage tool card, 100+ modern grid layouts & art styles");
        CATEGORY_TRIGGERS.put("🎥 Create Tab: Tool 6 — Cinematic Photo", "⚡ Triggers: Cinematic photo card & 3D parallax motion from 2D shots");
        CATEGORY_TRIGGERS.put("🎞️ Create Tab: Tool 7 — Animation (GIF Editor)", "⚡ Triggers: Animation tool card & living photo burst loop generator");
        CATEGORY_TRIGGERS.put("🎨 Create Tab: Tool 8 — Moods Edit Presets", "⚡ Triggers: Moods tool card & artistic aesthetic color grade palettes");
        CATEGORY_TRIGGERS.put("🏛️ Create Tab: Master Storefront Hub", "⚡ Triggers: Full modern Creative Studio hub, hero banner & 8-tool grid");
        CATEGORY_TRIGGERS.put("✨ Stories & Memories: 3D Pop-Out & Cutouts", "⚡ Triggers: 3D subjects breaking out of memory frames & motion graphics");
        CATEGORY_TRIGGERS.put("🎵 Stories & Memories: Player Controls & Sound", "⚡ Triggers: Full-screen story player, background music & bulk font titling");
        CATEGORY_TRIGGERS.put("🧭 Modern Navigation & Floating Bar", "⚡ Triggers: Floating Material You pill navigation bar & [ Today ] date pill");
        CATEGORY_TRIGGERS.put("📁 Collections V2 & Shelves", "⚡ Triggers: Collections horizontal shelves, pinned albums & pet carousels");
        CATEGORY_TRIGGERS.put("🪄 AI Photo & Video Editor Tools", "⚡ Triggers: Magic Editor lasso selection, AI Enhance V2 & Varenyky timeline");
        CATEGORY_TRIGGERS.put("⭕ OneGoogle: Subscriber Avatar Rings", "⚡ Triggers: Multi-color metallic Google One subscriber ring around avatar");

        initFlags();
    }

    private static void initFlags() {
        register("45748649", "Bluejay Video Remix Pipeline", "Video processing pipeline for AI video styling and Soba engine clip extraction.", "🎨 Create Tab: Tool 1 — Video Remix & Soba", "Tool 1: Video Remix Pipeline", FlagType.BOOLEAN, Boolean.TRUE);
        register("45815130", "Remix Creations Master Switch", "Enables the generative Remix creation suite in the Create Tab and Made For You tiles.", "🎨 Create Tab: Tool 1 — Video Remix & Soba", "Tool 1: Video Remix Card", FlagType.BOOLEAN, Boolean.TRUE);
        register("173314", "Highlight Video AMC Feature 173314", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("2797", "Highlight Video AMC Feature 2797", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45379873", "Highlight Video AMC Feature 45379873", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45382236", "Highlight Video AMC Feature 45382236", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45383712", "Highlight Video AMC Feature 45383712", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45384542", "Highlight Video AMC Feature 45384542", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45401287", "Highlight Video AMC Feature 45401287", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45406992", "Highlight Video AMC Feature 45406992", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45415459", "Highlight Video AMC Feature 45415459", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45415617", "Highlight Video AMC Feature 45415617", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45421698", "Highlight Video AMC Feature 45421698", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45424950", "Highlight Video AMC Feature 45424950", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45424956", "Highlight Video AMC Feature 45424956", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45425258", "Highlight Video AMC Feature 45425258", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45425736", "Highlight Video AMC Feature 45425736", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45426422", "Highlight Video AMC Feature 45426422", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45426705", "Highlight Video AMC Feature 45426705", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45429640", "Highlight Video AMC Feature 45429640", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45462916", "Highlight Video AMC Feature 45462916", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45477565", "Highlight Video AMC Feature 45477565", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45615213", "Highlight Video AMC Feature 45615213", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45647280", "Highlight Video AMC Feature 45647280", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45737458", "Highlight Video AMC Feature 45737458", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45744293", "Highlight Video AMC Feature 45744293", "Controls Automated Movie Creation (AMC), soundtracks, and recipe previews via Lcoeo.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC Recipes)", "Highlight Video & Movie Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45687123", "Outfit Try-on Feature 45687123", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45713555", "Apparel Carousel in Create Tab", "Horizontal showcase carousel in Create Tab highlighting your recognized outfits.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Tool 4: Apparel Carousel", FlagType.BOOLEAN, Boolean.TRUE);
        register("45715066", "Outfit Try-on Feature 45715066", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45717505", "Outfit Smart Suggestions", "AI suggestions pairing tops, bottoms, and accessories from your past photos.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Tool 4: Outfit Suggestions", FlagType.BOOLEAN, Boolean.TRUE);
        register("45731265", "Outfit Try-on Feature 45731265", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45741844", "Outfit Try-on Feature 45741844", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45750774", "Outfit Try-on Feature 45750774", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45755043", "Outfit Try-on Feature 45755043", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45760092", "Outfit Try-on Feature 45760092", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45762091", "Outfit Try-on Feature 45762091", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45767205", "Outfit Try-on Feature 45767205", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45767208", "Outfit Try-on Feature 45767208", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45767701", "Outfit Try-on Feature 45767701", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45767702", "Apparel Outfit Metadata Sync", "Synchronizes outfit clusters and clothing tags with Google account metadata.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Tool 4: Wardrobe Sync", FlagType.BOOLEAN, Boolean.TRUE);
        register("45768005", "Outfit Try-on Feature 45768005", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45771188", "Outfit Try-on Feature 45771188", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45771700", "Outfit Try-on Feature 45771700", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45773219", "Outfit Try-on Feature 45773219", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45778389", "My Fits Wardrobe Engine", "Detects clothing items across photos and organizes them into a virtual wardrobe.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Tool 4: My Fits Wardrobe", FlagType.BOOLEAN, Boolean.TRUE);
        register("45780002", "Outfit Try-on Tool Chip", "Directly triggers the Outfit Try-on tool card inside the Create Tab tools grid.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Tool 4: Outfit Try-on Card", FlagType.BOOLEAN, Boolean.TRUE);
        register("45781522", "My Fits MVP Suite", "Enables wardrobe browsing, outfit combinations, and try-on simulation.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Tool 4: Try-on Simulation", FlagType.BOOLEAN, Boolean.TRUE);
        register("45782800", "My Fits Flatlay Regeneration", "Generates clean top-down flatlay images of detected clothing items.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Tool 4: Flatlay Generator", FlagType.BOOLEAN, Boolean.TRUE);
        register("45785003", "Outfit Try-on Feature 45785003", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45787071", "Outfit Try-on Feature 45787071", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45787072", "Outfit Try-on Feature 45787072", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45787073", "Outfit Try-on Feature 45787073", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45789155", "Outfit Try-on Feature 45789155", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45806341", "Outfit Try-on Feature 45806341", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45822351", "Outfit Try-on Feature 45822351", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45827899", "Outfit Try-on Feature 45827899", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45890130", "Outfit Try-on Feature 45890130", "Controls clothing item recognition, virtual wardrobe, and try-on simulation via Lcnzf.", "👗 Create Tab: Tool 4 — Outfit Try-on (My Fits)", "Outfit Try-on & Wardrobe AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("3746", "Collage Grid Layout 3746", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("3768", "Collage Grid Layout 3768", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("3778", "Collage Grid Layout 3778", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45351199", "Collage Grid Layout 45351199", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45357121", "Collage Grid Layout 45357121", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45361103", "Collage Grid Layout 45361103", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45363145", "Collage Grid Layout 45363145", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45366356", "Collage Grid Layout 45366356", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45366360", "Collage Grid Layout 45366360", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45373147", "Collage Grid Layout 45373147", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45376295", "Collage Grid Layout 45376295", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45379729", "Collage Grid Layout 45379729", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45381763", "Collage Grid Layout 45381763", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45383650", "Collage Grid Layout 45383650", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45383918", "Collage Grid Layout 45383918", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45391272", "Collage Grid Layout 45391272", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45412062", "Collage Grid Layout 45412062", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45421095", "Collage Grid Layout 45421095", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45421221", "Collage Grid Layout 45421221", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45427667", "Collage Grid Layout 45427667", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45429413", "Collage Grid Layout 45429413", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45429414", "Collage Grid Layout 45429414", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45430489", "Collage Grid Layout 45430489", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45613285", "Collage Grid Layout 45613285", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45614002", "Collage Grid Layout 45614002", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45618074", "Collage Grid Layout 45618074", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45618486", "Collage Grid Layout 45618486", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45619467", "Collage Grid Layout 45619467", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45621064", "Collage Grid Layout 45621064", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45621107", "Collage Grid Layout 45621107", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45621113", "Collage Grid Layout 45621113", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45621573", "Collage Grid Layout 45621573", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45622110", "Collage Grid Layout 45622110", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45622469", "Collage Grid Layout 45622469", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45628225", "Collage Grid Layout 45628225", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45628550", "Collage Grid Layout 45628550", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45631391", "Collage Grid Layout 45631391", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45631603", "Collage Grid Layout 45631603", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45632447", "Collage Grid Layout 45632447", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45632448", "Collage Grid Layout 45632448", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45632449", "Collage Grid Layout 45632449", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45632965", "Collage Grid Layout 45632965", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45634595", "Collage Grid Layout 45634595", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45637624", "Collage Grid Layout 45637624", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45638963", "Collage Grid Layout 45638963", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45639164", "Collage Grid Layout 45639164", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45640322", "Collage Grid Layout 45640322", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45640504", "Collage Grid Layout 45640504", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45640505", "Collage Grid Layout 45640505", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45640764", "Collage Grid Layout 45640764", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45640844", "Collage Grid Layout 45640844", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45642957", "Collage Grid Layout 45642957", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45643006", "Collage Grid Layout 45643006", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45644061", "Collage Grid Layout 45644061", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45644595", "Collage Grid Layout 45644595", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45644775", "Collage Grid Layout 45644775", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45645462", "Collage Grid Layout 45645462", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45646781", "Collage Grid Layout 45646781", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45647254", "Collage Grid Layout 45647254", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45648697", "Collage Grid Layout 45648697", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45648886", "Collage Grid Layout 45648886", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45650278", "Collage Grid Layout 45650278", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45651344", "Collage Grid Layout 45651344", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45651598", "Collage Grid Layout 45651598", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45651749", "Collage Grid Layout 45651749", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45651980", "Collage Grid Layout 45651980", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45653406", "Collage Grid Layout 45653406", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45653407", "Collage Grid Layout 45653407", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45653581", "Collage Grid Layout 45653581", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45653582", "Collage Grid Layout 45653582", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45655278", "Collage Grid Layout 45655278", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45656581", "Collage Grid Layout 45656581", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45657395", "Collage Grid Layout 45657395", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45658006", "Collage Grid Layout 45658006", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45658221", "Collage Grid Layout 45658221", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45659248", "Collage Grid Layout 45659248", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45660274", "Collage Grid Layout 45660274", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45661188", "Collage Grid Layout 45661188", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45661840", "Collage Grid Layout 45661840", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45662058", "Collage Grid Layout 45662058", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45664048", "Collage Grid Layout 45664048", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45664395", "Collage Grid Layout 45664395", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45664970", "Collage Grid Layout 45664970", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45666355", "Collage Grid Layout 45666355", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45666483", "Collage Grid Layout 45666483", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45667018", "Collage Grid Layout 45667018", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45667019", "Collage Grid Layout 45667019", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45668764", "Collage Grid Layout 45668764", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45676222", "Collage Grid Layout 45676222", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45676289", "Collage Grid Layout 45676289", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45677617", "Collage Grid Layout 45677617", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45678735", "Collage Grid Layout 45678735", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45680313", "Collage Grid Layout 45680313", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45691779", "Collage Grid Layout 45691779", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45691864", "Collage Grid Layout 45691864", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45693639", "Collage Grid Layout 45693639", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45694541", "Collage Grid Layout 45694541", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45694542", "Collage Grid Layout 45694542", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45696402", "Collage Grid Layout 45696402", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45699033", "Collage Grid Layout 45699033", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45704067", "Collage Grid Layout 45704067", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45705374", "Collage Grid Layout 45705374", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45706748", "Collage Grid Layout 45706748", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45707670", "Collage Grid Layout 45707670", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45712494", "Collage Grid Layout 45712494", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45719574", "Collage Grid Layout 45719574", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45724817", "Collage Grid Layout 45724817", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45726712", "Collage Grid Layout 45726712", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45730325", "Collage Grid Layout 45730325", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45740278", "Collage Grid Layout 45740278", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45740594", "Collage Grid Layout 45740594", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45741002", "Collage Grid Layout 45741002", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45742602", "Collage Grid Layout 45742602", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45742979", "Collage Grid Layout 45742979", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45743260", "Collage Grid Layout 45743260", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45743955", "Collage Grid Layout 45743955", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45750626", "Collage Grid Layout 45750626", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45751235", "Collage Grid Layout 45751235", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45761245", "Collage Grid Layout 45761245", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45761246", "Collage Grid Layout 45761246", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45761247", "Collage Grid Layout 45761247", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45773083", "Collage Grid Layout 45773083", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45773084", "Collage Grid Layout 45773084", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45818951", "Collage Grid Layout 45818951", "Controls multi-photo collage layout grids, cutout borders, and scrapbook art styles via Lcnzc.", "📑 Create Tab: Tool 5 — Collage & Scrapbook (Stamp M2)", "Collage Template & Grid Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45418859", "Cinematic 3D Parallax Generator", "Generates realistic 3D camera pan and tilt movements from single 2D photos.", "🎥 Create Tab: Tool 6 — Cinematic Photo", "Tool 6: 3D Parallax Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45430236", "Cinematic Photo Creation Type", "Triggers the Cinematic Photo tool card in the Create Tab tools grid.", "🎥 Create Tab: Tool 6 — Cinematic Photo", "Tool 6: Cinematic Photo Card", FlagType.BOOLEAN, Boolean.TRUE);
        register("45353606", "Motion & Document Optimizer", "Keystone correction and frame stabilization for animated sequences.", "🎞️ Create Tab: Tool 7 — Animation (GIF Editor)", "Tool 7: Sequence Optimizer", FlagType.BOOLEAN, Boolean.TRUE);
        register("45694311", "Motion Photo Frame Extractor", "Extracts stabilized frames from motion photos for animated GIF loops.", "🎞️ Create Tab: Tool 7 — Animation (GIF Editor)", "Tool 7: Animation Card", FlagType.BOOLEAN, Boolean.TRUE);
        register("45797840", "Moods Edit Presets (Artistic Palettes)", "Adds the Moods tool card and carousel in Create Tab for aesthetic photo color grades.", "🎨 Create Tab: Tool 8 — Moods Edit Presets", "Tool 8: Moods Card & Palettes", FlagType.BOOLEAN, Boolean.TRUE);
        register("45719431", "Skottie Promo Animations", "Hardware-accelerated Skottie vector animations for creation previews and banners.", "🏛️ Create Tab: Master Storefront Hub", "Skottie Vector Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45729170", "Create Tab Storefront Feature 45729170", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45733872", "Create Tab Storefront Feature 45733872", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45745690", "Create Tab Storefront Feature 45745690", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45749971", "Create Tab Storefront Feature 45749971", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45754248", "Create Tab Master Switch (AuraTab)", "Replaces the legacy Utilities screen with the modern Creative Studio / AuraTab storefront.", "🏛️ Create Tab: Master Storefront Hub", "Creative Studio Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45754250", "Storefront Hero Banner", "Showcases a dynamic top hero card with animated creation prompts and seasonal highlights.", "🏛️ Create Tab: Master Storefront Hub", "Storefront Hero Banner", FlagType.BOOLEAN, Boolean.TRUE);
        register("45774010", "Storefront Suggestion Chips", "Interactive suggestion chips (e.g. Try Collages, Make Movie) in the hero section.", "🏛️ Create Tab: Master Storefront Hub", "Hero Suggestion Chips", FlagType.BOOLEAN, Boolean.TRUE);
        register("45776097", "Create Tab Storefront Feature 45776097", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45778099", "Create Tab Storefront Feature 45778099", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45778870", "Template Category Chips", "Filter chips at the top of the Create Tab to browse creations by style or theme.", "🏛️ Create Tab: Master Storefront Hub", "Template Filter Chips", FlagType.BOOLEAN, Boolean.TRUE);
        register("45779285", "Create Tab Storefront Feature 45779285", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45788224", "Create Tab Storefront Feature 45788224", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45795181", "Create Tab Storefront Feature 45795181", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45806296", "Create Tab Storefront Feature 45806296", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45812600", "Create Tab Storefront Feature 45812600", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45812997", "Create Tab Storefront Feature 45812997", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45815129", "Made For You Carousel", "Horizontal carousel of AI-generated suggestions, recent collages, and highlight reels.", "🏛️ Create Tab: Master Storefront Hub", "Made For You Carousel", FlagType.BOOLEAN, Boolean.TRUE);
        register("45815131", "Tools Module & Saved Creations", "Enables the 8-tool grid module and saved creations shelf at the bottom of AuraTab.", "🏛️ Create Tab: Master Storefront Hub", "8-Tool Grid & Saved Shelf", FlagType.BOOLEAN, Boolean.TRUE);
        register("45815512", "Create Tab Storefront Feature 45815512", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("45819223", "Create Tab Storefront Feature 45819223", "Controls storefront banners, category chips, and tools grid integration via Lcnxy.", "🏛️ Create Tab: Master Storefront Hub", "Create Tab Storefront & Hub", FlagType.BOOLEAN, Boolean.TRUE);
        register("3999", "Story Card Transition Timing", "Precise millisecond timing curve for 3D cutout transitions between story pages.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "Story Transition Timing", FlagType.LONG, Long.valueOf(118109605L));
        register("4306", "Feature Flag 4306", "Controls functional UI behavior and enhancements for flag 4306.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "UI Enhancement Feature", FlagType.BOOLEAN, Boolean.TRUE);
        register("4311", "Feature Flag 4311", "Controls functional UI behavior and enhancements for flag 4311.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "UI Enhancement Feature", FlagType.BOOLEAN, Boolean.TRUE);
        register("45357085", "Memories 3D Feature 45357085", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45375377", "Feature Flag 45375377", "Controls functional UI behavior and enhancements for flag 45375377.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "UI Enhancement Feature", FlagType.BOOLEAN, Boolean.TRUE);
        register("45377479", "Memories 3D Feature 45377479", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45377748", "Memories 3D Feature 45377748", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45378815", "Memories 3D Feature 45378815", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45378823", "Memories 3D Feature 45378823", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45382673", "Memories 3D Feature 45382673", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45477626", "Story Player 3D Pop-Out Cutouts", "Forces portrait subjects in memories to dynamically break out of the card boundary.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out Subject Cutout", FlagType.BOOLEAN, Boolean.TRUE);
        register("45617431", "Memories 3D Feature 45617431", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45625283", "Memories 3D Feature 45625283", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45630552", "Memories 3D Feature 45630552", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45631283", "Memories 3D Feature 45631283", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45638473", "Memories 3D Feature 45638473", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45640410", "Memories 3D Feature 45640410", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45650855", "Memories 3D Feature 45650855", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45658726", "Memories 3D Feature 45658726", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45659276", "3D Graphic Pop-Out Motion Templates", "Animated geometric and organic graphic shapes that pass behind the cutout subject.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Graphic Motion Templates", FlagType.BOOLEAN, Boolean.TRUE);
        register("45659278", "Animated Pop-Out Story Sharing", "Exports memories with intact 3D pop-out animations directly to messaging apps.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out Video Sharing", FlagType.BOOLEAN, Boolean.TRUE);
        register("45661385", "Memories 3D Feature 45661385", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45664049", "Memories 3D Feature 45664049", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45666907", "Memories 3D Feature 45666907", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45666946", "Memories 3D Feature 45666946", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45678918", "Memories 3D Feature 45678918", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45684593", "Memories 3D Feature 45684593", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45690149", "Memories 3D Feature 45690149", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45693621", "Memories 3D Feature 45693621", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45696874", "Memories 3D Feature 45696874", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45698703", "Memories 3D Feature 45698703", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45699860", "Memories 3D Feature 45699860", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45702733", "Memories 3D Feature 45702733", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45717954", "Memories 3D Feature 45717954", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45721596", "Memories 3D Feature 45721596", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45726890", "Memories 3D Feature 45726890", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45727343", "Memories 3D Feature 45727343", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45735093", "Memories 3D Feature 45735093", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45735409", "Memories 3D Feature 45735409", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45742883", "3D Story Card Cutout Elevation", "Elevates cutout subjects with realistic drop shadows during story slide transitions.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Card Elevation Shadows", FlagType.BOOLEAN, Boolean.TRUE);
        register("45744988", "Memories 3D Feature 45744988", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45748861", "Memories 3D Feature 45748861", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45749793", "Memories 3D Feature 45749793", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45764779", "Flying Memories Carousel (FMC) Physics", "Ultra-fluid spring physics and inertia when swiping through the memories header.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "Flying Memories Physics", FlagType.BOOLEAN, Boolean.TRUE);
        register("45770987", "Memories 3D Feature 45770987", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45785454", "Feature Flag 45785454", "Controls functional UI behavior and enhancements for flag 45785454.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "UI Enhancement Feature", FlagType.BOOLEAN, Boolean.TRUE);
        register("45785531", "Cinematic Story Moments from Video", "Automatically detects and clips the most dynamic video moments into memories.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "Cinematic Video Moments", FlagType.BOOLEAN, Boolean.TRUE);
        register("45790156", "Memories 3D Feature 45790156", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45797069", "Memories 3D Feature 45797069", "Controls 3D subject pop-out cutouts and motion templates in memories via Lcoei.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "3D Pop-Out & Cutout Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45804059", "Feature Flag 45804059", "Controls functional UI behavior and enhancements for flag 45804059.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "UI Enhancement Feature", FlagType.BOOLEAN, Boolean.TRUE);
        register("3442", "Story Player Feature 3442", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("3459", "Story Player Feature 3459", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("3460", "Story Player Feature 3460", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("3481", "Story Player Feature 3481", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("3489", "Story Player Feature 3489", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("3501", "Story Player Feature 3501", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("3503", "Story Player Feature 3503", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45356686", "Story Player Feature 45356686", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45357051", "Autoplay Badge Redesign", "Modern pill badge indicator showing playback status and audio mute toggles.", "🎵 Stories & Memories: Player Controls & Sound", "Autoplay Status Badge", FlagType.BOOLEAN, Boolean.TRUE);
        register("45357263", "Story Player Feature 45357263", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45358405", "Story Player Feature 45358405", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45362458", "Story Player Feature 45362458", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45363460", "Story Player Feature 45363460", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45388291", "Bulk Story Titling & Font Customizer", "Lets users customize titles, headers, dates, and font styles across entire stories.", "🎵 Stories & Memories: Player Controls & Sound", "Story Titling & Fonts", FlagType.BOOLEAN, Boolean.TRUE);
        register("45389907", "Story Player Feature 45389907", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45409808", "Story Player Feature 45409808", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45417060", "Story Player Feature 45417060", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45425326", "Story Player Feature 45425326", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45430787", "Story Player Feature 45430787", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45461103", "Story Player Feature 45461103", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45478000", "Story Player Feature 45478000", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45531422", "Story Player Feature 45531422", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45531730", "Story Player Feature 45531730", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45612624", "Story Player Feature 45612624", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45613283", "Story Player Feature 45613283", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45615286", "Story Player Feature 45615286", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45615686", "Story Player Feature 45615686", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45624133", "Story Player Feature 45624133", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45634177", "Story Player Feature 45634177", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45662994", "Dynamic Pacing & Rhythm in Stories", "Adjusts story slide durations dynamically based on photo composition and music beat.", "🎵 Stories & Memories: Player Controls & Sound", "Dynamic Story Pacing", FlagType.BOOLEAN, Boolean.TRUE);
        register("45665087", "Story Player Feature 45665087", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45669656", "Story Player Feature 45669656", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45676464", "Story Player Feature 45676464", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45681691", "Story Player Feature 45681691", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45681692", "Story Player Feature 45681692", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45691383", "Story Player Feature 45691383", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45709355", "Story Sound & Background Music", "Enables curated music tracks and background audio streaming during story playback.", "🎵 Stories & Memories: Player Controls & Sound", "Story Music Playback", FlagType.BOOLEAN, Boolean.TRUE);
        register("45709356", "Story Player Feature 45709356", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45709357", "Story Player Feature 45709357", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45717103", "Story Player Feature 45717103", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45719668", "Story Player Feature 45719668", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45719669", "Story Player Feature 45719669", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45731207", "Story Player Feature 45731207", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45737250", "Story Player Feature 45737250", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45737826", "Edge-to-Edge Swipe Navigation", "Android 14/15 predictive back gesture and fluid edge-to-edge story player swiping.", "🎵 Stories & Memories: Player Controls & Sound", "Edge-to-Edge Navigation", FlagType.BOOLEAN, Boolean.TRUE);
        register("45739443", "Story Player Feature 45739443", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45741031", "Skottie Glide Image Loader for Stories", "Hardware-accelerated image pipeline preventing memory stutters in story player.", "🎵 Stories & Memories: Player Controls & Sound", "Story Hardware Image Loader", FlagType.BOOLEAN, Boolean.TRUE);
        register("45755453", "Story Player Feature 45755453", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45757528", "Story Player Feature 45757528", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45760013", "Story Player Feature 45760013", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45766984", "Story Player Feature 45766984", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45768002", "Story Player Feature 45768002", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45804307", "Story Player Feature 45804307", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45807524", "Story Player Feature 45807524", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45815839", "Story Player Feature 45815839", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45827980", "Story Player Feature 45827980", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("45830680", "Story Player Feature 45830680", "Controls full-screen story player gestures, audio playback, and titling via Lcojt.", "🎵 Stories & Memories: Player Controls & Sound", "Story Player Controls & Titling", FlagType.BOOLEAN, Boolean.TRUE);
        register("2675", "Feature Flag 2675", "Controls functional UI behavior and enhancements for flag 2675.", "🧭 Modern Navigation & Floating Bar", "UI Enhancement Feature", FlagType.BOOLEAN, Boolean.TRUE);
        register("2892", "Fluid Grid & Zoom Animations", "Enables spring physics and smoother deceleration curves when pinching and scrolling.", "🧭 Modern Navigation & Floating Bar", "Fluid Scroll Physics", FlagType.BOOLEAN, Boolean.TRUE);
        register("45732792", "Floating Navigation Bar (Master)", "Replaces legacy bottom bar with floating elevated Material You navigation pill with blur and scroll animations.", "🧭 Modern Navigation & Floating Bar", "Floating Pill Navigation Bar", FlagType.BOOLEAN, Boolean.TRUE);
        register("45743215", "Date Capsule Floating Pill", "Floating [ Today ] indicator pill on the main photos grid; taps scroll directly to today's date.", "🧭 Modern Navigation & Floating Bar", "Floating Date Pill", FlagType.BOOLEAN, Boolean.TRUE);
        register("45745561", "Floating Bar Dynamic Theming", "Enables Material You Monet color extraction and corner rounding on navigation container.", "🧭 Modern Navigation & Floating Bar", "Material You Monet Theme", FlagType.BOOLEAN, Boolean.TRUE);
        register("45746812", "Floating Bar Dynamic Elevation", "Adds elevation shadow depth and scale transitions when scrolling the photos grid.", "🧭 Modern Navigation & Floating Bar", "Elevation & Shadows", FlagType.BOOLEAN, Boolean.TRUE);
        register("45752831", "Reels Video Tab (V1)", "Full-screen vertical swipe video feed tab in the main navigation bar.", "🧭 Modern Navigation & Floating Bar", "Reels Video Feed Tab", FlagType.BOOLEAN, Boolean.TRUE);
        register("45753590", "On This Device Filter Pill", "Adds top-bar filter button to isolate and display only photos physically stored on the device.", "🧭 Modern Navigation & Floating Bar", "Local Media Filter", FlagType.BOOLEAN, Boolean.TRUE);
        register("45754546", "Reels Video Tab (V2)", "Gesture navigation transition and fluid swipe gestures into full-screen video feed.", "🧭 Modern Navigation & Floating Bar", "Reels Gesture Navigation", FlagType.BOOLEAN, Boolean.TRUE);
        register("3013", "Collections Card Animation Mode", "Controls card touch responsiveness and ripple bounds (1 = Modern fluid expand).", "📁 Collections V2 & Shelves", "Card Touch Physics", FlagType.LONG, Long.valueOf(1L));
        register("3023", "Pinned Albums Shelf Activation", "Internal switch enabling custom album pinning to the Collections V2 top shelf.", "📁 Collections V2 & Shelves", "Album Pinning Switch", FlagType.BOOLEAN, Boolean.TRUE);
        register("3026", "Pinned Albums Entrypoint", "Enables album pin/unpin context actions across albums and search collections.", "📁 Collections V2 & Shelves", "Album Pinning Actions", FlagType.BOOLEAN, Boolean.TRUE);
        register("3606", "Collections Grid Layout", "Optimized two-column grid layout for legacy and custom album folders.", "📁 Collections V2 & Shelves", "Album Grid Layout", FlagType.BOOLEAN, Boolean.TRUE);
        register("3611", "Collections Search Shortcut", "Quick jump shortcut from collection shelves into unified search.", "📁 Collections V2 & Shelves", "Collection Search Shortcut", FlagType.BOOLEAN, Boolean.TRUE);
        register("45762698", "Collections V2 Shelves Layout", "Reorganizes the Library tab into modern categorized Collections V2 horizontal shelves (0=Off, 1=Legacy, 2=Full V2).", "📁 Collections V2 & Shelves", "Collections Shelves Structure", FlagType.LONG, Long.valueOf(2L));
        register("45787397", "Pinned Albums Shelf", "Adds a dedicated quick-access shelf for user-pinned favorite albums and folders.", "📁 Collections V2 & Shelves", "Pinned Albums Carousel", FlagType.BOOLEAN, Boolean.TRUE);
        register("45794037", "Screenshots Shelf", "Dedicated shelf grouping on-device screenshots with quick share options.", "📁 Collections V2 & Shelves", "Screenshots Category Shelf", FlagType.BOOLEAN, Boolean.TRUE);
        register("45794038", "Documents Shelf", "Dedicated shelf filtering receipts, documents, identity cards, and notes.", "📁 Collections V2 & Shelves", "Documents Category Shelf", FlagType.BOOLEAN, Boolean.TRUE);
        register("45802110", "Collections V2 Content Activation", "Populates dynamic categorized content cards within the Collections V2 shelves.", "📁 Collections V2 & Shelves", "Dynamic Shelf Content", FlagType.LONG, Long.valueOf(2L));
        register("45816328", "People & Pets Carousel", "Dedicated round-avatar carousel row showcasing recognized face clusters and pets.", "📁 Collections V2 & Shelves", "People & Pets Shelf", FlagType.BOOLEAN, Boolean.TRUE);
        register("45821034", "Modern Card Animations", "Fluid scale and elevation transitions when tapping or expanding collection albums.", "📁 Collections V2 & Shelves", "Card Expand Animations", FlagType.BOOLEAN, Boolean.TRUE);
        register("45683026", "Video Thumbnail Seek Scrubbing", "Real-time thumbnail seek preview when dragging across the video playback slider.", "🪄 AI Photo & Video Editor Tools", "Video Seek Scrubbing", FlagType.BOOLEAN, Boolean.TRUE);
        register("45683689", "AI Enhance V2", "Multi-stage neural network image enhancement for exposure, HDR, and detail.", "🪄 AI Photo & Video Editor Tools", "AI Neural Photo Enhance", FlagType.BOOLEAN, Boolean.TRUE);
        register("45705305", "Magic Editor Gesture Lasso Selection", "Circle-to-select and tap-to-select object recognition inside Magic Editor.", "🪄 AI Photo & Video Editor Tools", "Magic Editor Object Lasso", FlagType.BOOLEAN, Boolean.TRUE);
        register("45709528", "Redesigned Video Editor (Varenyky)", "Modern multi-layer video editor timeline with speed controls and text overlays.", "🪄 AI Photo & Video Editor Tools", "Varenyky Video Timeline", FlagType.BOOLEAN, Boolean.TRUE);
        register("45724258", "Ask Photos AI Natural Language Search", "Ask natural conversational questions to find specific photos and memories.", "🪄 AI Photo & Video Editor Tools", "Ask Photos AI Search", FlagType.BOOLEAN, Boolean.TRUE);
        register("45531621", "Master OneGoogle Avatar Ring Switch", "Forces the Google One multi-color metallic ring around the top-right profile avatar.", "⭕ OneGoogle: Subscriber Avatar Rings", "Subscriber Avatar Ring Switch", FlagType.BOOLEAN, Boolean.TRUE);
        register("45531625", "Subscriber Ring Gradient Palette", "Selects variant 3 (Premium iridescent 4-color gradient ring).", "⭕ OneGoogle: Subscriber Avatar Rings", "4-Color Gradient Palette", FlagType.LONG, Long.valueOf(3L));
        register("45398940", "Automated Movie Creation (AMC)", "Master engine for automatic highlight reel creation with beat-matched soundtracks.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC)", "Tool 3: Highlight Video Card", FlagType.BOOLEAN, Boolean.TRUE);
        register("45408988", "Highlight Video Rebranding V2", "Modern Material 3 typography and visual branding for highlight video creation.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC)", "Tool 3: Modern Video Branding", FlagType.BOOLEAN, Boolean.TRUE);
        register("45426765", "Create Tab Movie Integration", "Binds the highlight video creator directly to the Create Tab tools grid.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC)", "Tool 3: Create Tab Movie Binding", FlagType.BOOLEAN, Boolean.TRUE);
        register("45459614", "Multi-Asset Creation Recipes", "Allows mixing photos, living photos, and video clips into a single guided creation recipe.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC)", "Tool 3: Multi-Asset Recipes", FlagType.BOOLEAN, Boolean.TRUE);
        register("45726376", "AuraTab Recipe Preview Chips", "Preview chips inside Create Tab to audition highlight video themes before creating.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC)", "Tool 3: Recipe Preview Chips", FlagType.BOOLEAN, Boolean.TRUE);
        register("45726377", "AuraTab Recipe Chip Suggestions", "Contextual smart suggestion chips recommending movies for recent trips or events.", "🎬 Create Tab: Tool 3 — Highlight Video (AMC)", "Tool 3: Smart Movie Chips", FlagType.BOOLEAN, Boolean.TRUE);
        // ── Lcnwi AI & Settings flags (baked patch flags + extras) ────────
        register("45699618", "Redesigned Video Editor (Soba)", "Modern video editing UI with beat-matched trim & Soba clip styler engine.", "🪄 AI Photo & Video Editor Tools", "Soba Video Editor", FlagType.BOOLEAN, Boolean.TRUE);
        register("45729385", "Non-Destructive In-Place Save", "Saves edits without duplicating: overwrites original file path instead of creating copy.", "🪄 AI Photo & Video Editor Tools", "In-Place Save Pipeline", FlagType.BOOLEAN, Boolean.TRUE);
        register("45729710", "Smart Perspective Crop (Enchilada)", "Auto-corrects lens distortion and rotates subject to align horizon during crop.", "🪄 AI Photo & Video Editor Tools", "Perspective Crop AI", FlagType.BOOLEAN, Boolean.TRUE);
        register("45733505", "On-Demand Story & Month Recaps", "Triggers memory story and month recap creation on user request via BOM.", "✨ Stories & Memories: 3D Pop-Out & Cutouts", "On-Demand Recap Engine", FlagType.BOOLEAN, Boolean.TRUE);
        register("45737361", "Feature Discovery Badging", "Shows animated discovery badges on new tools and features to guide first use.", "🏛️ Create Tab: Master Storefront Hub", "Discovery Badges", FlagType.BOOLEAN, Boolean.TRUE);
        register("45737362", "Video Queue & Background Export", "Queues multiple video exports and processes them in background without blocking UI.", "🪄 AI Photo & Video Editor Tools", "Background Export Queue", FlagType.BOOLEAN, Boolean.TRUE);
        register("45752498", "Master Media & Codec Pipeline", "Enables HEVC/VP9 codec support and expedited transcoding job scheduling.", "🪄 AI Photo & Video Editor Tools", "Media Codec Pipeline", FlagType.BOOLEAN, Boolean.TRUE);
        register("45753336", "Bluejay AI Model V3", "Forces Bluejay AI model version 3 backend with caching for video generation.", "🪄 AI Photo & Video Editor Tools", "Bluejay V3 Backend", FlagType.BOOLEAN, Boolean.TRUE);
        register("45775066", "Editor Navigation Flow", "Controls return-to-start-page flow after editor sessions for consistent navigation.", "🪄 AI Photo & Video Editor Tools", "Editor Return Flow", FlagType.BOOLEAN, Boolean.TRUE);
        register("45786064", "AI Video Generation (Master)", "Master switch for generative AI video creation with text-to-video prompting.", "🪄 AI Photo & Video Editor Tools", "AI Video Generation", FlagType.BOOLEAN, Boolean.TRUE);
        register("45796589", "AI Prompt Suggestions", "Provides contextual AI-generated prompt suggestions for video creation.", "🪄 AI Photo & Video Editor Tools", "AI Prompt Suggestions", FlagType.BOOLEAN, Boolean.TRUE);
        register("45805882", "Texture Lab & Looks Presets", "Unlocks texture lab with creative looks presets and visual styling filters.", "🪄 AI Photo & Video Editor Tools", "Texture Lab Presets", FlagType.BOOLEAN, Boolean.TRUE);
        register("45818386", "AllPhotosCore Indexing", "Enables full-index AllPhotosCore pipeline for fast media library querying.", "🪄 AI Photo & Video Editor Tools", "AllPhotosCore Index", FlagType.BOOLEAN, Boolean.TRUE);
        register("45410157", "Settings UI Feature 45410157", "Controls settings UI layout and account configuration panel in Lcnwi.", "🪄 AI Photo & Video Editor Tools", "Settings UI Feature", FlagType.BOOLEAN, Boolean.TRUE);
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
        // ── Core AI & Editor flags (Lcnwi class) ─────────────────────────
        edit.putBoolean("45699618", true);   // Redesigned Video Editor & Soba Trim
        edit.putBoolean("45729385", true);   // Non-Destructive In-Place Save
        edit.putBoolean("45729710", true);   // Smart Perspective Crop (Enchilada)
        edit.putBoolean("45733505", true);   // On-Demand Story & Month Recaps
        edit.putBoolean("45737361", true);   // Feature Discovery Badging
        edit.putBoolean("45737362", true);   // Video Queue & Background Export
        edit.putBoolean("45752498", true);   // Master Media & Codec Pipeline
        edit.putBoolean("45753336", true);   // Bluejay Model V3 Backend & Caching
        edit.putBoolean("45775066", true);   // Editor Navigation Flow
        edit.putBoolean("45786064", true);   // AI Video Generation (Master)
        edit.putBoolean("45796589", true);   // AI Prompt Suggestions
        edit.putBoolean("45805882", true);   // Texture Lab & Looks Presets
        edit.putBoolean("45818386", true);   // AllPhotosCore Indexing
        edit.putBoolean("45410157", true);   // Settings UI Feature 45410157
        // ── Story Colors & Collage Templates (Lcnzc / 226 flags) ─────────
        edit.putBoolean("45363460", true);
        edit.putBoolean("45664970", true);
        edit.putBoolean("45744293", true);
        edit.putBoolean("45666355", true);
        edit.putBoolean("45615686", true);
        edit.putBoolean("45640764", true);
        edit.putBoolean("45730325", true);
        edit.putBoolean("45377748", true);
        edit.putBoolean("45373147", true);
        edit.putBoolean("45647280", true);
        edit.putBoolean("45658726", true);
        edit.putBoolean("45713555", true);
        edit.putBoolean("45707670", true);
        edit.putBoolean("45676289", true);
        edit.putBoolean("45779285", true);
        edit.putBoolean("45666907", true);
        edit.putBoolean("45778870", true);
        edit.putBoolean("45621573", true);
        edit.putBoolean("45748649", true);
        edit.putBoolean("45664049", true);
        edit.putLong("3999", 118109605L);
        edit.putBoolean("45664048", true);
        edit.putBoolean("45812997", true);
        edit.putBoolean("45749971", true);
        edit.putBoolean("45640410", true);
        edit.putBoolean("45615213", true);
        edit.putBoolean("45643006", true);
        edit.putBoolean("45666483", true);
        edit.putBoolean("45806296", true);
        edit.putBoolean("45754546", true);
        edit.putBoolean("45659278", true);
        edit.putBoolean("45642957", true);
        edit.putBoolean("45659276", true);
        edit.putBoolean("45750626", true);
        edit.putBoolean("45614002", true);
        edit.putBoolean("45693621", true);
        edit.putBoolean("45632447", true);
        edit.putBoolean("45719669", true);
        edit.putBoolean("2797", true);
        edit.putBoolean("45719668", true);
        edit.putBoolean("2675", true);
        edit.putBoolean("45632449", true);
        edit.putBoolean("45632448", true);
        edit.putLong("45531625", 3L);
        edit.putBoolean("45715066", true);
        edit.putBoolean("45531621", true);
        edit.putBoolean("3768", true);
        edit.putBoolean("45816328", true);
        edit.putBoolean("45421095", true);
        edit.putBoolean("45426422", true);
        edit.putBoolean("45619467", true);
        edit.putBoolean("45678918", true);
        edit.putBoolean("45795181", true);
        edit.putBoolean("45768005", true);
        edit.putBoolean("45780002", true);
        edit.putBoolean("45741002", true);
        edit.putBoolean("45391272", true);
        edit.putBoolean("45766984", true);
        edit.putBoolean("45691779", true);
        edit.putBoolean("45768002", true);
        edit.putBoolean("45890130", true);
        edit.putBoolean("45680313", true);
        edit.putBoolean("45818951", true);
        edit.putBoolean("45638543", true);
        edit.putBoolean("45622835", true);
        edit.putBoolean("45398451", true);
        edit.putBoolean("45376954", true);
        edit.putBoolean("45623041", true);
        edit.putBoolean("45668764", true);
        edit.putBoolean("45669003", true);
        edit.putBoolean("45653582", true);
        edit.putBoolean("45740278", true);
        edit.putBoolean("45721092", true);
        edit.putBoolean("45740262", true);
        edit.putBoolean("45722002", true);
        edit.putBoolean("45721094", true);
        edit.putBoolean("45773083", true);
        edit.putBoolean("45773084", true);
        edit.putBoolean("45835545", true);
        edit.putBoolean("45835544", true);
        edit.putBoolean("45839387", true);
        edit.putBoolean("45810382", true);
        edit.putBoolean("45769084", true);
        edit.putBoolean("45802724", true);
        edit.putBoolean("45836928", true);
        edit.putBoolean("45766276", true);
        edit.putBoolean("45768721", true);
        edit.putBoolean("3756", true);
        edit.putBoolean("45836696", true);
        edit.putBoolean("45779528", true);
        edit.putBoolean("45740594", true);
        edit.putBoolean("45832857", true);
        edit.putBoolean("4283", true);
        edit.putBoolean("4289", true);
        // ── Memories 3D Pop-Out & Cutouts (Lcoei class) ───────────────────
        edit.putBoolean("45477626", true);
        edit.putBoolean("45357085", true);
        edit.putBoolean("45377479", true);
        edit.putBoolean("45378815", true);
        edit.putBoolean("45378823", true);
        edit.putBoolean("45382673", true);
        edit.putBoolean("45617431", true);
        edit.putBoolean("45625283", true);
        edit.putBoolean("45630552", true);
        edit.putBoolean("45631283", true);
        edit.putBoolean("45638473", true);
        edit.putBoolean("45650855", true);
        edit.putBoolean("45661385", true);
        edit.putBoolean("45666946", true);
        edit.putBoolean("45684593", true);
        edit.putBoolean("45690149", true);
        edit.putBoolean("45696874", true);
        edit.putBoolean("45698703", true);
        edit.putBoolean("45699860", true);
        edit.putBoolean("45702733", true);
        edit.putBoolean("45717954", true);
        edit.putBoolean("45721596", true);
        edit.putBoolean("45726890", true);
        edit.putBoolean("45727343", true);
        edit.putBoolean("45735093", true);
        edit.putBoolean("45735409", true);
        edit.putBoolean("45742883", true);
        edit.putBoolean("45744988", true);
        edit.putBoolean("45748861", true);
        edit.putBoolean("45749793", true);
        edit.putBoolean("45764779", true);
        edit.putBoolean("45770987", true);
        edit.putBoolean("45785454", true);
        edit.putBoolean("45785531", true);
        edit.putBoolean("45790156", true);
        edit.putBoolean("45797069", true);
        edit.putBoolean("45804059", true);
        edit.putBoolean("45375377", true);
        edit.putBoolean("4306", true);
        edit.putBoolean("4311", true);
        // ── Story Player Controls & Sound (Lcojt class) ───────────────────
        edit.putBoolean("3442", true);
        edit.putBoolean("3459", true);
        edit.putBoolean("3460", true);
        edit.putBoolean("3481", true);
        edit.putBoolean("3489", true);
        edit.putBoolean("3501", true);
        edit.putBoolean("3503", true);
        edit.putBoolean("45356686", true);
        edit.putBoolean("45357051", true);
        edit.putBoolean("45357263", true);
        edit.putBoolean("45358405", true);
        edit.putBoolean("45362458", true);
        edit.putBoolean("45388291", true);
        edit.putBoolean("45389907", true);
        edit.putBoolean("45409808", true);
        edit.putBoolean("45417060", true);
        edit.putBoolean("45425326", true);
        edit.putBoolean("45430787", true);
        edit.putBoolean("45461103", true);
        edit.putBoolean("45478000", true);
        edit.putBoolean("45531422", true);
        edit.putBoolean("45531730", true);
        edit.putBoolean("45612624", true);
        edit.putBoolean("45613283", true);
        edit.putBoolean("45615286", true);
        edit.putBoolean("45624133", true);
        edit.putBoolean("45634177", true);
        edit.putBoolean("45662994", true);
        edit.putBoolean("45665087", true);
        edit.putBoolean("45669656", true);
        edit.putBoolean("45676464", true);
        edit.putBoolean("45681691", true);
        edit.putBoolean("45681692", true);
        edit.putBoolean("45691383", true);
        edit.putBoolean("45709355", true);
        edit.putBoolean("45709356", true);
        edit.putBoolean("45709357", true);
        edit.putBoolean("45717103", true);
        edit.putBoolean("45719668", true);
        edit.putBoolean("45719669", true);
        edit.putBoolean("45731207", true);
        edit.putBoolean("45737250", true);
        edit.putBoolean("45737826", true);
        edit.putBoolean("45739443", true);
        edit.putBoolean("45741031", true);
        edit.putBoolean("45755453", true);
        edit.putBoolean("45757528", true);
        edit.putBoolean("45760013", true);
        edit.putBoolean("45804307", true);
        edit.putBoolean("45807524", true);
        edit.putBoolean("45815839", true);
        edit.putBoolean("45827980", true);
        edit.putBoolean("45830680", true);
        // ── Create Tab Storefront & Hub ───────────────────────────────────
        edit.putBoolean("45754248", true);
        edit.putBoolean("45754250", true);
        edit.putBoolean("45774010", true);
        edit.putBoolean("45778099", true);
        edit.putBoolean("45788224", true);
        edit.putBoolean("45812600", true);
        edit.putBoolean("45815129", true);
        edit.putBoolean("45815130", true);
        edit.putBoolean("45815131", true);
        edit.putBoolean("45815512", true);
        edit.putBoolean("45819223", true);
        edit.putBoolean("45729170", true);
        edit.putBoolean("45733872", true);
        edit.putBoolean("45745690", true);
        edit.putBoolean("45776097", true);
        edit.putBoolean("45719431", true);
        edit.putBoolean("45797840", true);
        // ── AMC Highlight Video ───────────────────────────────────────────
        edit.putBoolean("173314", true);
        edit.putBoolean("45379873", true);
        edit.putBoolean("45382236", true);
        edit.putBoolean("45383712", true);
        edit.putBoolean("45384542", true);
        edit.putBoolean("45401287", true);
        edit.putBoolean("45406992", true);
        edit.putBoolean("45415459", true);
        edit.putBoolean("45415617", true);
        edit.putBoolean("45421698", true);
        edit.putBoolean("45424950", true);
        edit.putBoolean("45424956", true);
        edit.putBoolean("45425258", true);
        edit.putBoolean("45425736", true);
        edit.putBoolean("45426705", true);
        edit.putBoolean("45429640", true);
        edit.putBoolean("45462916", true);
        edit.putBoolean("45477565", true);
        edit.putBoolean("45737458", true);
        edit.putBoolean("45398940", true);
        edit.putBoolean("45408988", true);
        edit.putBoolean("45426765", true);
        edit.putBoolean("45459614", true);
        edit.putBoolean("45726376", true);
        edit.putBoolean("45726377", true);
        // ── Outfit Try-on (My Fits) ───────────────────────────────────────
        edit.putBoolean("45687123", true);
        edit.putBoolean("45717505", true);
        edit.putBoolean("45731265", true);
        edit.putBoolean("45741844", true);
        edit.putBoolean("45750774", true);
        edit.putBoolean("45755043", true);
        edit.putBoolean("45760092", true);
        edit.putBoolean("45762091", true);
        edit.putBoolean("45767205", true);
        edit.putBoolean("45767208", true);
        edit.putBoolean("45767701", true);
        edit.putBoolean("45767702", true);
        edit.putBoolean("45771188", true);
        edit.putBoolean("45771700", true);
        edit.putBoolean("45773219", true);
        edit.putBoolean("45778389", true);
        edit.putBoolean("45781522", true);
        edit.putBoolean("45782800", true);
        edit.putBoolean("45785003", true);
        edit.putBoolean("45787071", true);
        edit.putBoolean("45787072", true);
        edit.putBoolean("45787073", true);
        edit.putBoolean("45789155", true);
        edit.putBoolean("45806341", true);
        edit.putBoolean("45822351", true);
        edit.putBoolean("45827899", true);
        // ── Modern Navigation & Floating Bar ──────────────────────────────
        edit.putBoolean("45732792", true);
        edit.putBoolean("45743215", true);
        edit.putBoolean("45745561", true);
        edit.putBoolean("45746812", true);
        edit.putBoolean("45752831", true);
        edit.putBoolean("45753590", true);
        edit.putBoolean("2892", true);
        // ── Collections V2 & Shelves ──────────────────────────────────────
        edit.putLong("3013", 1L);
        edit.putBoolean("3023", true);
        edit.putBoolean("3026", true);
        edit.putBoolean("3606", true);
        edit.putBoolean("3611", true);
        edit.putLong("45762698", 2L);
        edit.putBoolean("45787397", true);
        edit.putBoolean("45794037", true);
        edit.putBoolean("45794038", true);
        edit.putLong("45802110", 2L);
        edit.putBoolean("45821034", true);
        // ── AI Photo & Video Editor ───────────────────────────────────────
        edit.putBoolean("45683026", true);
        edit.putBoolean("45683689", true);
        edit.putBoolean("45705305", true);
        edit.putBoolean("45709528", true);
        edit.putBoolean("45724258", true);
        // ── Cinematic & Animation ─────────────────────────────────────────
        edit.putBoolean("45418859", true);
        edit.putBoolean("45430236", true);
        edit.putBoolean("45353606", true);
        edit.putBoolean("45694311", true);
        // ── Extra Lcnzc collage flags ─────────────────────────────────────
        edit.putBoolean("45621064", true);
        edit.putBoolean("45621107", true);
        edit.putBoolean("45621113", true);
        edit.putBoolean("45622110", true);
        edit.putBoolean("45622469", true);
        edit.putBoolean("45628225", true);
        edit.putBoolean("45628550", true);
        edit.putBoolean("45631391", true);
        edit.putBoolean("45631603", true);
        edit.putBoolean("45632965", true);
        edit.putBoolean("45634595", true);
        edit.putBoolean("45637624", true);
        edit.putBoolean("45638963", true);
        edit.putBoolean("45639164", true);
        edit.putBoolean("45640322", true);
        edit.putBoolean("45640504", true);
        edit.putBoolean("45640505", true);
        edit.putBoolean("45640844", true);
        edit.putBoolean("45644061", true);
        edit.putBoolean("45644595", true);
        edit.putBoolean("45644775", true);
        edit.putBoolean("45645462", true);
        edit.putBoolean("45646781", true);
        edit.putBoolean("45647254", true);
        edit.putBoolean("45648697", true);
        edit.putBoolean("45648886", true);
        edit.putBoolean("45650278", true);
        edit.putBoolean("45651344", true);
        edit.putBoolean("45651598", true);
        edit.putBoolean("45651749", true);
        edit.putBoolean("45651980", true);
        edit.putBoolean("45653406", true);
        edit.putBoolean("45653407", true);
        edit.putBoolean("45653581", true);
        edit.putBoolean("45655278", true);
        edit.putBoolean("45656581", true);
        edit.putBoolean("45657395", true);
        edit.putBoolean("45658006", true);
        edit.putBoolean("45658221", true);
        edit.putBoolean("45659248", true);
        edit.putBoolean("45660274", true);
        edit.putBoolean("45661188", true);
        edit.putBoolean("45661840", true);
        edit.putBoolean("45662058", true);
        edit.putBoolean("45664395", true);
        edit.putBoolean("45667018", true);
        edit.putBoolean("45667019", true);
        edit.putBoolean("45676222", true);
        edit.putBoolean("45677617", true);
        edit.putBoolean("45678735", true);
        edit.putBoolean("45691864", true);
        edit.putBoolean("45693639", true);
        edit.putBoolean("45694541", true);
        edit.putBoolean("45694542", true);
        edit.putBoolean("45696402", true);
        edit.putBoolean("45699033", true);
        edit.putBoolean("45704067", true);
        edit.putBoolean("45705374", true);
        edit.putBoolean("45706748", true);
        edit.putBoolean("45712494", true);
        edit.putBoolean("45719574", true);
        edit.putBoolean("45724817", true);
        edit.putBoolean("45726712", true);
        edit.putBoolean("45742602", true);
        edit.putBoolean("45742979", true);
        edit.putBoolean("45743260", true);
        edit.putBoolean("45743955", true);
        edit.putBoolean("45751235", true);
        edit.putBoolean("45761245", true);
        edit.putBoolean("45761246", true);
        edit.putBoolean("45761247", true);
        edit.putBoolean("3746", true);
        edit.putBoolean("3778", true);
        edit.putBoolean("45351199", true);
        edit.putBoolean("45357121", true);
        edit.putBoolean("45361103", true);
        edit.putBoolean("45363145", true);
        edit.putBoolean("45366356", true);
        edit.putBoolean("45366360", true);
        edit.putBoolean("45376295", true);
        edit.putBoolean("45379729", true);
        edit.putBoolean("45381763", true);
        edit.putBoolean("45383650", true);
        edit.putBoolean("45383918", true);
        edit.putBoolean("45412062", true);
        edit.putBoolean("45421221", true);
        edit.putBoolean("45427667", true);
        edit.putBoolean("45429413", true);
        edit.putBoolean("45429414", true);
        edit.putBoolean("45430489", true);
        edit.putBoolean("45613285", true);
        edit.putBoolean("45618074", true);
        edit.putBoolean("45618486", true);
        edit.apply();
    }

    public static void applyAll26Defaults(SharedPreferences prefs) {
        applyCuratedDefaults(prefs);
    }
}

