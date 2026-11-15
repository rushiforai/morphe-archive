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
            "Bottom gap", "Space under the bar.", false,
            0, 40, "dp", () -> 8)
            .help("Space between the bar and the bottom of the screen.");
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
