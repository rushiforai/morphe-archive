package app.afterglow.extension.settings;

/** iOS glow multipliers, cached once per preference revision. */
public final class GlowStyle {
    private static volatile GlowStyle current;
    private static volatile long revision = -1;
    public final boolean enabled, pivot, overlay, scrubber, seekBar;
    public final int strength, opacity, radius, layers;
    public final Integer color;
    private GlowStyle(java.util.Map<String, ?> prefs, ThemePalette palette) {
        enabled = flag(prefs, "theme_glowEnabled", false);
        pivot = flag(prefs, "theme_glowPivot", true);
        overlay = flag(prefs, "theme_glowOverlay", true);
        scrubber = flag(prefs, "theme_glowScrubber", true);
        seekBar = flag(prefs, "theme_glowSeekBar", false);
        int mode = ThemeStore.bounded(prefs, "theme_glowStrengthMode", ThemeStore.bounded(prefs, "theme_glowStrength", 1, 0, 2), 0, 3);
        strength = mode == 3 ? ThemeStore.bounded(prefs, "theme_glowStrengthCustom", 50, 0, 100) : new int[]{25,50,80}[mode];
        opacity = ThemeStore.bounded(prefs, "theme_glowOpacity", 100, 0, 100);
        radius = ThemeStore.bounded(prefs, "theme_glowRadius", 50, 0, 100);
        layers = ThemeStore.bounded(prefs, "theme_glowLayers", 1, 1, 12);
        color = palette.color(ThemeRole.GLOW);
    }
    private static boolean flag(java.util.Map<String, ?> prefs, String key, boolean fallback) {
        Object value = prefs.get(key);
        return value instanceof Boolean ? (Boolean) value : value instanceof Number ? ((Number) value).intValue() != 0 : fallback;
    }
    /** Preview a draft without writing any preference. */
    public static GlowStyle preview(ThemeDocument document) {
        java.util.Map<String, Object> prefs = new java.util.HashMap<>();
        if (document.glowEnabled != null) prefs.put("theme_glowEnabled", document.glowEnabled);
        if (document.glow != null) for (java.util.Map.Entry<String, Object> entry : document.glow.entrySet()) {
            String suffix = entry.getKey();
            prefs.put("theme_glow" + Character.toUpperCase(suffix.charAt(0)) + suffix.substring(1), entry.getValue());
        }
        return new GlowStyle(prefs, document.palette());
    }
    public static GlowStyle current() {
        long next = AfterglowPrefs.revision();
        if (current == null || revision != next) synchronized (GlowStyle.class) {
            if (current == null || revision != next) { current = new GlowStyle(AfterglowPrefs.snapshot(), ThemeStore.snapshot().palette); revision = next; }
        }
        return current;
    }
    public float opacity(float base, int layer) { return Math.min(1, base * strength / 50f * opacity / 100f) * (float) Math.pow(.72, layer); }
    public float radius(float base, int layer) { return base * strength / 50f * radius / 50f * (1 + .45f * layer); }
}
