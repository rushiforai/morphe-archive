package app.southstar21.extension.instagram.liquidglass;

import android.content.SharedPreferences;
import android.graphics.Color;

import app.southstar21.extension.instagram.settings.ChoiceSetting;
import app.southstar21.extension.instagram.settings.IntSetting;
import app.southstar21.extension.instagram.settings.Settings;

/**
 * Everything about the bar's look that can be customized, read every frame by the bar and the
 * preview. {@link #get()} returns a cached snapshot, rebuilt only when a stored setting changes,
 * so reading it per frame costs nothing. Defaults are measured from iOS Instagram.
 */
final class NavbarStyle {

    // region Settings

    /** Values of {@link #BAR_STYLE}. */
    static final int STYLE_GLASS = 0, STYLE_TRANSPARENT = 1, STYLE_MATERIAL = 2, STYLE_NEON = 3;

    static final ChoiceSetting BAR_STYLE = new ChoiceSetting("liquid_glass_bar_style",
            "Bar style", "Glass, see-through, a solid Material You pill, or a glowing neon pill.", false,
            new String[]{"Liquid Glass", "Transparent", "Material", "Neon Glow"},
            new int[]{STYLE_GLASS, STYLE_TRANSPARENT, STYLE_MATERIAL, STYLE_NEON}, STYLE_GLASS)
            .help("Liquid Glass blurs and bends what's behind the bar. Transparent drops the glass: the feed "
                    + "shows straight through, with only a light veil set by Opacity (0% for none). Material is a "
                    + "solid pill in your wallpaper's colors (Android 12+), or in the Tint color if one is set. "
                    + "Neon Glow is a solid pill with a glowing colored edge, in the Tint color (purple if none); "
                    + "Rim sets how bright it glows. All but Liquid Glass skip the blur, so they're easier on "
                    + "the battery.");

    /** Values of {@link #INDICATOR}. */
    static final int INDICATOR_CAPSULE = 0, INDICATOR_DOT = 1, INDICATOR_LINE = 2;

    static final ChoiceSetting INDICATOR = new ChoiceSetting("liquid_glass_indicator",
            "Selection indicator", "A capsule behind the selected tab, or a dot or line under it.", false,
            new String[]{"Capsule", "Dot", "Line"},
            new int[]{INDICATOR_CAPSULE, INDICATOR_DOT, INDICATOR_LINE}, INDICATOR_CAPSULE)
            .help("Capsule is iOS's grey pill behind the selected tab. Dot and Line sit under the selected "
                    + "tab instead and stretch as they glide to another one. With Neon Glow they glow in the "
                    + "neon color. Selection shade sets how strong they are.");

    /** Neon Glow's color when no Tint is chosen. */
    private static final int DEFAULT_NEON = 0xFFBF5AF2;

    static final IntSetting OPACITY = new IntSetting("liquid_glass_opacity",
            "Opacity", "How much of the bar is material rather than see-through glass.", false,
            0, 100, "%", () -> 86)
            .help("How solid the bar's material is. At 100% nothing behind the bar shows through; lower values let the feed show more. iOS Instagram sits around 86%.");
    static final IntSetting VIBRANCY = new IntSetting("liquid_glass_vibrancy",
            "Vibrancy", "How much the glass boosts the colors behind it.", false,
            50, 200, "%", () -> 125)
            .help("Glass makes the colors behind it a little richer. 100% leaves them as they are, higher values saturate them more, lower ones wash them out.");
    static final IntSetting EDGE_CLARITY = new IntSetting("liquid_glass_edge_clarity",
            "Clear edge", "How clearly the rim shows what it bends in. Dark mode.", false,
            0, 100, "%", () -> 55)
            .help("In dark mode the very edge of the bar is clearer than its middle, so what the rim bends in from outside shows there. This sets how clear that edge is.");
    static final IntSetting RIM = new IntSetting("liquid_glass_rim",
            "Rim", "Brightness of the line around the bar.", false,
            0, 200, "%", () -> 100)
            .help("The thin line of light around the bar. 0% hides it, 200% doubles its brightness.");
    static final IntSetting GLARE = new IntSetting("liquid_glass_glare",
            "End glare", "White glare across the rounded ends. Light mode.", false,
            0, 100, "%", () -> 30)
            .help("In light mode a white glare runs across the bar's rounded ends, like light catching thick glass. This sets how strong it is.");
    static final IntSetting SHADOW = new IntSetting("liquid_glass_shadow",
            "Shadow", "The soft shadow under the bar.", false,
            0, 100, "%", () -> 50)
            .help("The soft shadow the bar casts on the feed under it.");

    private static final int[] TINT_COLORS = {
            0, 0xFF0A84FF, 0xFFBF5AF2, 0xFFFF375F, 0xFFFF9F0A, 0xFF30D158, 0xFF40C8E0};
    static final ChoiceSetting TINT = new ChoiceSetting("liquid_glass_tint",
            "Tint", "A color mixed into the glass.", false,
            new String[]{"None", "Blue", "Purple", "Pink", "Orange", "Green", "Teal"}, TINT_COLORS, 0)
            .help("Mixes a color into the glass: subtle in light mode, stronger in dark mode.");

    static final IntSetting HEIGHT = new IntSetting("liquid_glass_height",
            "Height", "How tall the bar is.", false,
            48, 84, "dp", () -> 64)
            .help("How tall the bar is. Instagram's own bar is 48dp; iOS Instagram's is about 64dp.");
    static final IntSetting SIDE_MARGIN = new IntSetting("liquid_glass_side_margin",
            "Side margin", "Space between the bar and the screen edges.", false,
            0, 60, "dp", () -> 22)
            .help("Space between the bar and the left and right edges of the screen. Bigger margins make a shorter, more floating bar.");
    static final IntSetting BOTTOM_GAP = new IntSetting("liquid_glass_bottom_gap",
            "Default bottom gap", "Fallback gap used until a page gets its own value.", false,
            0, 40, "dp", () -> 8)
            .help("Fallback space under the bar. Each page can override this below.");
    static final IntSetting FEED_BOTTOM_GAP = pageGap("feed", "Feed");
    static final IntSetting REELS_BOTTOM_GAP = pageGap("reels", "Reels");
    static final IntSetting MESSAGES_BOTTOM_GAP = pageGap("messages", "Messages");
    static final IntSetting EXPLORE_BOTTOM_GAP = pageGap("explore", "Explore");
    static final IntSetting PROFILE_BOTTOM_GAP = pageGap("profile", "Profile");
    static final IntSetting REEL_SEEK_BAR_POSITION = new IntSetting("liquid_glass_reel_seek_bar_position",
            "Reel seek bar position", "Move the Reel seek bar up or down without changing its captions or buttons.",
            false, -40, 40, "dp", () -> 0)
            .help("Adjust the Reel seek bar independently from the caption and action buttons. In the live preview, tap Reels and drag this slider. Positive values move it up; negative values move it down.");
    static final IntSetting VERTICAL_POSITION = new IntSetting("liquid_glass_vertical_position",
            "Vertical position", "Move the bar up or down. Positive moves it up; negative moves it down.", false,
            -80, 80, "dp", () -> 0)
            .help("Move the tab bar to avoid overlapping Reel controls. Positive values move it up; negative values move it down. The preview follows while you drag.");
    static final IntSetting ROUNDNESS = new IntSetting("liquid_glass_roundness",
            "Roundness", "100% is a full pill.", false,
            10, 100, "%", () -> 100)
            .help("How round the bar's corners are. 100% gives a full pill; lower values give a rounded rectangle. The selection follows.");
    static final IntSetting TAB_INSET = new IntSetting("liquid_glass_tab_inset",
            "Tab inset", "Space between the bar's ends and the outer tabs.", false,
            0, 40, "dp", () -> 10)
            .help("Space between the bar's ends and the first and last tabs. More pushes the tabs together.");

    static final IntSetting SELECTION_SHADE = new IntSetting("liquid_glass_selection_shade",
            "Selection shade", "How strongly the selected tab's capsule stands out.", false,
            0, 300, "%", () -> 100)
            .help("How strongly the capsule behind the selected tab stands out. 0% hides it.");
    static final IntSetting SELECTION_WIDTH = new IntSetting("liquid_glass_selection_width",
            "Selection width", "How much wider than its tab the capsule is.", false,
            0, 30, "dp", () -> 10)
            .help("How much wider than its tab the selection capsule is.");
    static final IntSetting SELECTION_INSET = new IntSetting("liquid_glass_selection_inset",
            "Selection inset", "Space between the capsule and the bar's top and bottom.", false,
            0, 14, "dp", () -> 4)
            .help("Space between the selection capsule and the bar's top and bottom. 0dp makes it fill the bar's height.");
    static final IntSetting DROP_SIZE = new IntSetting("liquid_glass_drop_size",
            "Drop size", "How much the selection swells while pressed.", false,
            100, 170, "%", () -> 130)
            .help("With the southstar21 style, pressing a tab swells the selection into a drop of glass. This sets how big the drop gets; past about 120% it pokes out of the bar.");

    static final IntSetting SHRUNK_SIZE = new IntSetting("liquid_glass_shrunk_size",
            "Shrunk size", "The bar's size while shrunk by scrolling.", false,
            50, 100, "%", () -> 83)
            .help("Scrolling down a feed shrinks the bar out of the way. This sets how small it gets.");

    private static IntSetting pageGap(String key, String title) {
        return new IntSetting("liquid_glass_" + key + "_bottom_gap", title + " bottom gap",
                "Space under the tab bar on the " + title.toLowerCase(java.util.Locale.ROOT) + " page. Tap that tab in the preview to see it.",
                false, 0, 40, "dp", BOTTOM_GAP::get)
                .help("Adjust the space under the bar on " + title + ". Tap the matching tab in the live preview to check it.");
    }

    // endregion

    // region Snapshot

    /** Where a bar gets its values: normally {@link #get()}, a demo overrides some. */
    interface Source {
        NavbarStyle get();
    }

    final float blurDp;
    /** 0..1 */
    final float refraction;
    final float opacity;
    final float vibrancy;
    final float edgeClarity;
    final float rim;
    final float glare;
    final float shadow;
    /** The tint color, or 0 for none. */
    final int tint;
    final int heightDp;
    final int sideMarginDp;
    final int bottomGapDp;
    /** Positive moves the bar up; negative moves it down. */
    final int verticalPositionDp;
    /** 0..1, 1 = a full pill. */
    final float roundness;
    final int tabInsetDp;
    final float selectionShade;
    final int selectionWidthDp;
    final int selectionInsetDp;
    final float dropScale;
    final float shrunkScale;
    final boolean southstar21;
    final boolean glassyPill;
    /** iOS style: the capsule turns into clear glass while pressed (off: stays grey, like iOS). */
    final boolean glassWhileDragging;
    /** 0..1, 0.5 by default. */
    final float edgeColors;
    final boolean haptics;
    final boolean shrinkOnScroll;
    /** {@link #STYLE_GLASS}, {@link #STYLE_TRANSPARENT} or {@link #STYLE_MATERIAL}. */
    final int barStyle;
    /** {@link #INDICATOR_CAPSULE}, {@link #INDICATOR_DOT} or {@link #INDICATOR_LINE}. */
    final int indicator;
    /** Changes whenever any value does. */
    final int version;

    private static NavbarStyle current;
    private static int changes;
    private static boolean listening;
    /** Held here: the preferences only keep listeners weakly. */
    private static final SharedPreferences.OnSharedPreferenceChangeListener LISTENER = (prefs, key) -> changes++;

    /** Values that replace the stored ones, by setting key (booleans as 0 or 1), or null. */
    private final java.util.Map<String, Integer> overrides;

    private NavbarStyle(int version, java.util.Map<String, Integer> overrides) {
        this.version = version;
        this.overrides = overrides;
        blurDp = i(LiquidGlassNavBarPatch.BLUR_RADIUS);
        refraction = i(LiquidGlassNavBarPatch.REFRACTION) / 100f;
        opacity = i(OPACITY) / 100f;
        vibrancy = i(VIBRANCY) / 100f;
        edgeClarity = i(EDGE_CLARITY) / 100f;
        rim = i(RIM) / 100f;
        glare = i(GLARE) / 100f;
        shadow = i(SHADOW) / 100f;
        Integer tintOverride = overrides != null ? overrides.get(TINT.key) : null;
        int tintIndex = tintOverride != null ? tintOverride : TINT.get();
        tint = TINT_COLORS[Math.max(0, Math.min(TINT_COLORS.length - 1, tintIndex))];
        heightDp = i(HEIGHT);
        sideMarginDp = i(SIDE_MARGIN);
        bottomGapDp = i(BOTTOM_GAP);
        verticalPositionDp = i(VERTICAL_POSITION);
        roundness = i(ROUNDNESS) / 100f;
        tabInsetDp = i(TAB_INSET);
        selectionShade = i(SELECTION_SHADE) / 100f;
        selectionWidthDp = i(SELECTION_WIDTH);
        selectionInsetDp = i(SELECTION_INSET);
        dropScale = i(DROP_SIZE) / 100f;
        shrunkScale = i(SHRUNK_SIZE) / 100f;
        southstar21 = b(LiquidGlassNavBarPatch.SOUTHSTAR21_STYLE);
        glassyPill = b(LiquidGlassNavBarPatch.GLASSY_PILL);
        glassWhileDragging = b(LiquidGlassNavBarPatch.GLASS_WHILE_DRAGGING);
        edgeColors = i(LiquidGlassNavBarPatch.EDGE_COLORS) / 100f;
        haptics = b(LiquidGlassNavBarPatch.HAPTICS);
        shrinkOnScroll = b(LiquidGlassNavBarPatch.SHRINK_ON_SCROLL);
        Integer styleOverride = overrides != null ? overrides.get(BAR_STYLE.key) : null;
        int chosenStyle = styleOverride != null ? styleOverride : BAR_STYLE.get();
        barStyle = chosenStyle >= STYLE_GLASS && chosenStyle <= STYLE_NEON ? chosenStyle : STYLE_GLASS;
        Integer indicatorOverride = overrides != null ? overrides.get(INDICATOR.key) : null;
        int chosenIndicator = indicatorOverride != null ? indicatorOverride : INDICATOR.get();
        indicator = chosenIndicator >= INDICATOR_CAPSULE && chosenIndicator <= INDICATOR_LINE
                ? chosenIndicator : INDICATOR_CAPSULE;
    }

    /** Neon Glow's color: the Tint, or purple without one. */
    int neon() {
        return tint != 0 ? tint : DEFAULT_NEON;
    }

    private int i(IntSetting setting) {
        Integer value = overrides != null ? overrides.get(setting.key) : null;
        return value != null ? value : setting.get();
    }

    private boolean b(app.southstar21.extension.instagram.settings.BooleanSetting setting) {
        Integer value = overrides != null ? overrides.get(setting.key) : null;
        return value != null ? value != 0 : setting.get();
    }

    /** The current values. Cheap: rebuilt only after a setting changed. */
    static NavbarStyle get() {
        if (!listening) listening = Settings.addChangeListener(LISTENER);
        // Until the preferences are there, nothing can tell us about changes: rebuild each time.
        if (current == null || current.version != changes || !listening) current = new NavbarStyle(changes, null);
        return current;
    }

    /**
     * The current values with some replaced, for a demo or a comparison. Not cached; the
     * version differs whenever the stored settings or the overrides do.
     */
    static NavbarStyle withOverrides(java.util.Map<String, Integer> overrides) {
        get();
        return new NavbarStyle(31 * (changes + 1) + overrides.hashCode() + 0x40000000, overrides);
    }

    /** Current style with the bottom gap chosen for the selected page. */
    static NavbarStyle forTab(int index) {
        int tab = clampTab(index);
        NavbarStyle base = get();
        if (tabStyles == null || tabStylesVersion != base.version) {
            tabStyles = new NavbarStyle[5];
            for (int i = 0; i < tabStyles.length; i++) {
                IntSetting setting = gapSetting(i);
                tabStyles[i] = withOverrides(java.util.Collections.singletonMap(BOTTOM_GAP.key, setting.get()));
            }
            tabStylesVersion = base.version;
        }
        return tabStyles[tab];
    }

    /** The page's default gap, used by the preview's hold-to-compare state. */
    static NavbarStyle defaultForTab(int index) {
        int tab = clampTab(index);
        IntSetting setting = gapSetting(tab);
        java.util.Map<String, Integer> values = defaultValues();
        values.put(BOTTOM_GAP.key, setting.getDefault());
        return withOverrides(values);
    }

    private static int clampTab(int index) {
        return Math.max(0, Math.min(4, index));
    }

    private static IntSetting gapSetting(int index) {
        switch (index) {
            case 1: return REELS_BOTTOM_GAP;
            case 2: return MESSAGES_BOTTOM_GAP;
            case 3: return EXPLORE_BOTTOM_GAP;
            case 4: return PROFILE_BOTTOM_GAP;
            case 0:
            default: return FEED_BOTTOM_GAP;
        }
    }

    private static NavbarStyle[] tabStyles;
    private static int tabStylesVersion = -1;

    // endregion

    // region Presets, defaults and demos

    /**
     * Looks to apply in one tap from the preview, by name. Each starts from the defaults
     * (the iOS look) and changes the values listed, by setting key.
     */
    static final java.util.Map<String, java.util.Map<String, Integer>> PRESETS = new java.util.LinkedHashMap<>();

    static {
        PRESETS.put("iOS", new java.util.HashMap<>());
        PRESETS.put("Clear", preset(
                "liquid_glass_opacity", 55, "liquid_glass_blur_radius", 2, "liquid_glass_refraction", 80,
                "liquid_glass_edge_clarity", 85, "liquid_glass_vibrancy", 140, "liquid_glass_rim", 120));
        PRESETS.put("Frosted", preset(
                "liquid_glass_opacity", 92, "liquid_glass_blur_radius", 16, "liquid_glass_refraction", 40,
                "liquid_glass_vibrancy", 110, "liquid_glass_edge_clarity", 30));
        PRESETS.put("Bold", preset(
                "liquid_glass_height", 72, "liquid_glass_selection_shade", 200, "liquid_glass_selection_width", 16,
                "liquid_glass_rim", 160, "liquid_glass_shadow", 80));
        PRESETS.put("Minimal", preset(
                "liquid_glass_height", 56, "liquid_glass_side_margin", 40, "liquid_glass_rim", 40,
                "liquid_glass_shadow", 10, "liquid_glass_selection_shade", 60, "liquid_glass_glare", 0));
        PRESETS.put("Neon", preset(
                "liquid_glass_tint", 2, "liquid_glass_vibrancy", 180, "liquid_glass_rim", 180,
                "liquid_glass_opacity", 75, "liquid_glass_refraction", 90, "liquid_glass_southstar21_style", 1));
        PRESETS.put("Crystal", preset(
                "liquid_glass_opacity", 25, "liquid_glass_blur_radius", 0, "liquid_glass_refraction", 100,
                "liquid_glass_edge_clarity", 100, "liquid_glass_vibrancy", 150, "liquid_glass_rim", 150));
        PRESETS.put("Floating", preset(
                "liquid_glass_height", 58, "liquid_glass_side_margin", 48, "liquid_glass_bottom_gap", 16,
                "liquid_glass_shadow", 90, "liquid_glass_tint", 6));
        PRESETS.put("Transparent", preset(
                "liquid_glass_bar_style", STYLE_TRANSPARENT, "liquid_glass_opacity", 0,
                "liquid_glass_rim", 60, "liquid_glass_shadow", 0));
        PRESETS.put("Material", preset(
                "liquid_glass_bar_style", STYLE_MATERIAL, "liquid_glass_rim", 0,
                "liquid_glass_shadow", 60, "liquid_glass_selection_shade", 150));
        PRESETS.put("Neon Glow", preset(
                "liquid_glass_bar_style", STYLE_NEON, "liquid_glass_indicator", INDICATOR_DOT,
                "liquid_glass_rim", 130, "liquid_glass_shadow", 20));
    }

    private static java.util.Map<String, Integer> preset(Object... keysAndValues) {
        java.util.Map<String, Integer> map = new java.util.HashMap<>();
        for (int i = 0; i < keysAndValues.length; i += 2) map.put((String) keysAndValues[i], (Integer) keysAndValues[i + 1]);
        return map;
    }

    /** Resets the Customize page's settings, then stores the preset's values. */
    static void applyPreset(String name) {
        java.util.Map<String, Integer> values = PRESETS.get(name);
        if (values == null) return;
        LiquidGlassNavBarPatch.SETTINGS.resetCustomization();
        for (app.southstar21.extension.instagram.settings.Setting setting : LiquidGlassNavBarPatch.SETTINGS.customizeSettings) {
            Integer value = values.get(setting.key);
            if (value == null) continue;
            if (setting instanceof IntSetting) ((IntSetting) setting).set(value);
            else if (setting instanceof ChoiceSetting) ((ChoiceSetting) setting).set(value);
            else if (setting instanceof app.southstar21.extension.instagram.settings.BooleanSetting) {
                ((app.southstar21.extension.instagram.settings.BooleanSetting) setting).set(value != 0);
            }
        }
    }

    /** A preset's full look: the defaults with its values applied. */
    static NavbarStyle presetStyle(String name) {
        java.util.Map<String, Integer> values = defaultValues();
        java.util.Map<String, Integer> preset = PRESETS.get(name);
        if (preset != null) values.putAll(preset);
        return withOverrides(values);
    }

    /** The preset the current settings match exactly, or null. */
    static String activePreset() {
        java.util.Map<String, Integer> current = new java.util.HashMap<>();
        for (app.southstar21.extension.instagram.settings.Setting setting : LiquidGlassNavBarPatch.SETTINGS.customizeSettings) {
            if (setting instanceof IntSetting) current.put(setting.key, ((IntSetting) setting).get());
            else if (setting instanceof ChoiceSetting) current.put(setting.key, ((ChoiceSetting) setting).get());
            else if (setting instanceof app.southstar21.extension.instagram.settings.BooleanSetting) {
                current.put(setting.key, ((app.southstar21.extension.instagram.settings.BooleanSetting) setting).get() ? 1 : 0);
            }
        }
        for (String name : PRESETS.keySet()) {
            java.util.Map<String, Integer> expected = defaultValues();
            expected.putAll(PRESETS.get(name));
            if (expected.equals(current)) return name;
        }
        return null;
    }

    private static NavbarStyle defaults;
    private static int defaultsFor = -1;

    /** The default look (every Customize page setting at its default), for comparing. */
    static NavbarStyle defaults() {
        int version = get().version;
        if (defaults == null || defaultsFor != version) {
            defaults = withOverrides(defaultValues());
            defaultsFor = version;
        }
        return defaults;
    }

    private static java.util.Map<String, Integer> defaultValues() {
        java.util.Map<String, Integer> map = new java.util.HashMap<>();
        for (app.southstar21.extension.instagram.settings.Setting setting : LiquidGlassNavBarPatch.SETTINGS.customizeSettings) {
            if (setting instanceof IntSetting) map.put(setting.key, ((IntSetting) setting).getDefault());
            else if (setting instanceof ChoiceSetting) map.put(setting.key, ((ChoiceSetting) setting).getDefault());
            else if (setting instanceof app.southstar21.extension.instagram.settings.BooleanSetting) {
                map.put(setting.key, ((app.southstar21.extension.instagram.settings.BooleanSetting) setting).getDefault() ? 1 : 0);
            }
        }
        return map;
    }

    /** The low and high a setting's demo sweeps between: enough to see, not the extremes. */
    static int[] demoRange(app.southstar21.extension.instagram.settings.Setting setting) {
        if (setting == LiquidGlassNavBarPatch.BLUR_RADIUS) return new int[]{0, 24};
        if (setting == OPACITY) return new int[]{40, 100};
        if (setting == VIBRANCY) return new int[]{60, 200};
        if (setting == HEIGHT) return new int[]{50, 80};
        if (setting == SIDE_MARGIN) return new int[]{0, 50};
        if (setting == BOTTOM_GAP) return new int[]{0, 30};
        if (setting == FEED_BOTTOM_GAP || setting == REELS_BOTTOM_GAP
                || setting == MESSAGES_BOTTOM_GAP || setting == EXPLORE_BOTTOM_GAP
                || setting == PROFILE_BOTTOM_GAP) return new int[]{0, 30};
        if (setting == VERTICAL_POSITION) return new int[]{-60, 60};
        if (setting == ROUNDNESS) return new int[]{20, 100};
        if (setting == TAB_INSET) return new int[]{0, 30};
        if (setting == SELECTION_SHADE) return new int[]{0, 250};
        if (setting == SELECTION_INSET) return new int[]{0, 12};
        if (setting == DROP_SIZE) return new int[]{100, 165};
        if (setting == SHRUNK_SIZE) return new int[]{55, 100};
        if (setting instanceof IntSetting) return new int[]{((IntSetting) setting).min, ((IntSetting) setting).max};
        if (setting instanceof ChoiceSetting) return new int[]{0, ((ChoiceSetting) setting).labels.length - 1};
        return new int[]{0, 1};
    }

    // endregion

    /**
     * The glass material's color at {@code alpha}: iOS Instagram's near black rgb(12, 14, 17)
     * in dark mode or white in light mode, with the tint mixed in.
     */
    int material(boolean dark, int alpha) {
        int r = dark ? 12 : 0xFA, g = dark ? 14 : 0xFA, b = dark ? 17 : 0xFC;
        if (tint != 0) {
            float k = dark ? 0.32f : 0.16f;
            r = Math.round(r + (Color.red(tint) - r) * k);
            g = Math.round(g + (Color.green(tint) - g) * k);
            b = Math.round(b + (Color.blue(tint) - b) * k);
        }
        return Color.argb(alpha, r, g, b);
    }
}