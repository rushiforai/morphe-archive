package dev.srwi.gintype.extension.typingeffects;

/**
 * Immutable configuration snapshot, color palette samplers, and visual style identifiers
 * for the Typing Effects runtime.
 *
 * <p>All color math is implemented in pure Java so the particle and trail engine can be
 * thoroughly unit-tested on the JVM without Android framework stubs.
 */
public final class TypingEffectsConfig {

    // Color palette identifiers
    public static final String PALETTE_RAINBOW = "rainbow";
    public static final String PALETTE_NEON = "neon";
    public static final String PALETTE_FIRE = "fire";
    public static final String PALETTE_GALAXY = "galaxy";
    public static final String PALETTE_PASTEL = "pastel";

    // Explosion visual style identifiers
    public static final String EXPLOSION_STYLE_SPARKS_RING = "sparks_ring";
    public static final String EXPLOSION_STYLE_SPARKLES = "sparkles";
    public static final String EXPLOSION_STYLE_CONFETTI = "confetti";
    public static final String EXPLOSION_STYLE_ALL_OUT = "all_out";

    // Glitter visual style identifiers
    public static final String GLITTER_STYLE_SPARKLES = "sparkles";
    public static final String GLITTER_STYLE_SPARKS = "sparks";
    public static final String GLITTER_STYLE_CONFETTI = "confetti";
    public static final String GLITTER_STYLE_MIXED = "mixed";

    // Key highlight visual style identifiers
    public static final String KEY_HIGHLIGHT_STYLE_NEON_GLOW = "neon_glow";
    public static final String KEY_HIGHLIGHT_STYLE_PLASMA_PULSE = "plasma_pulse";
    public static final String KEY_HIGHLIGHT_STYLE_SOFT_FILL = "soft_fill";

    private static final int[] NEON_COLORS = {
            0xFF00F5FF, // Electric cyan
            0xFFFF00E5, // Hot magenta
            0xFF39FF14, // Acid lime
            0xFF9D4EDD, // Electric violet
            0xFFFFE600  // Laser yellow
    };

    private static final int[] FIRE_COLORS = {
            0xFFFFF3B0, // White-hot core
            0xFFFFB703, // Solar gold
            0xFFFB5607, // Blazing orange
            0xFFE63946, // Crimson ember
            0xFFFF006E  // Plasma pink-red
    };

    private static final int[] GALAXY_COLORS = {
            0xFFE0FBFC, // Starlight
            0xFF4CC9F0, // Ice nebula blue
            0xFF4361EE, // Cosmic indigo
            0xFF7209B7, // Deep nebula purple
            0xFFF72585  // Supernova magenta
    };

    private static final int[] PASTEL_COLORS = {
            0xFFFFADAD, // Soft coral pink
            0xFFFFD6A5, // Peach
            0xFFFDFFB6, // Butter yellow
            0xFFCAFFBF, // Mint
            0xFF9BF6FF, // Sky cyan
            0xFFBDB2FF  // Lavender
    };

    public final boolean enabled;
    public final boolean rainbowTrailEnabled;
    public final boolean trailGlowEnabled;
    public final boolean glitterEnabled;
    public final boolean tapExplosionEnabled;
    public final boolean releaseExplosionEnabled;
    public final boolean shockwaveRingEnabled;
    public final boolean keyHighlightEnabled;
    public final boolean keyboardWarpEnabled;
    public final boolean windEnabled;
    public final String colorPalette;
    public final String explosionStyle;
    public final String glitterStyle;
    public final String keyHighlightStyle;
    public final int trailWidthDp;
    public final int trailFadeMs;
    public final int rainbowSpeedPercent;
    public final int particleCount;
    public final int glitterDensity;
    public final int particleSizePercent;
    public final int particleLifetimeMs;
    public final int particleSpeedPercent;
    public final int keyHighlightDurationMs;
    public final int warpStrengthPercent;
    public final int warpRadiusDp;
    public final int windIntensity;
    public final int windSpreadDp;

    public TypingEffectsConfig(
            boolean enabled,
            boolean rainbowTrailEnabled,
            boolean trailGlowEnabled,
            boolean glitterEnabled,
            boolean tapExplosionEnabled,
            boolean releaseExplosionEnabled,
            boolean shockwaveRingEnabled,
            boolean keyHighlightEnabled,
            boolean keyboardWarpEnabled,
            boolean windEnabled,
            String colorPalette,
            String explosionStyle,
            String glitterStyle,
            String keyHighlightStyle,
            int trailWidthDp,
            int trailFadeMs,
            int rainbowSpeedPercent,
            int particleCount,
            int glitterDensity,
            int particleSizePercent,
            int particleLifetimeMs,
            int particleSpeedPercent,
            int keyHighlightDurationMs,
            int warpStrengthPercent,
            int warpRadiusDp,
            int windIntensity,
            int windSpreadDp) {
        this.enabled = enabled;
        this.rainbowTrailEnabled = rainbowTrailEnabled;
        this.trailGlowEnabled = trailGlowEnabled;
        this.glitterEnabled = glitterEnabled;
        this.tapExplosionEnabled = tapExplosionEnabled;
        this.releaseExplosionEnabled = releaseExplosionEnabled;
        this.shockwaveRingEnabled = shockwaveRingEnabled;
        this.keyHighlightEnabled = keyHighlightEnabled;
        this.keyboardWarpEnabled = keyboardWarpEnabled;
        this.windEnabled = windEnabled;
        this.colorPalette = normalizePalette(colorPalette);
        this.explosionStyle = normalizeExplosionStyle(explosionStyle);
        this.glitterStyle = normalizeGlitterStyle(glitterStyle);
        this.keyHighlightStyle = normalizeKeyHighlightStyle(keyHighlightStyle);
        this.trailWidthDp = trailWidthDp;
        this.trailFadeMs = trailFadeMs;
        this.rainbowSpeedPercent = rainbowSpeedPercent;
        this.particleCount = particleCount;
        this.glitterDensity = glitterDensity;
        this.particleSizePercent = particleSizePercent;
        this.particleLifetimeMs = particleLifetimeMs;
        this.particleSpeedPercent = particleSpeedPercent;
        this.keyHighlightDurationMs = keyHighlightDurationMs;
        this.warpStrengthPercent = warpStrengthPercent;
        this.warpRadiusDp = warpRadiusDp;
        this.windIntensity = windIntensity;
        this.windSpreadDp = windSpreadDp;
    }

    public static TypingEffectsConfig defaults() {
        return new TypingEffectsConfig(
                GboardTypingEffectsSettings.DEFAULT_ENABLED,
                GboardTypingEffectsSettings.DEFAULT_RAINBOW_TRAIL,
                GboardTypingEffectsSettings.DEFAULT_TRAIL_GLOW,
                GboardTypingEffectsSettings.DEFAULT_GLITTER,
                GboardTypingEffectsSettings.DEFAULT_TAP_EXPLOSION,
                GboardTypingEffectsSettings.DEFAULT_RELEASE_EXPLOSION,
                GboardTypingEffectsSettings.DEFAULT_SHOCKWAVE_RING,
                GboardTypingEffectsSettings.DEFAULT_KEY_HIGHLIGHT,
                GboardTypingEffectsSettings.DEFAULT_KEYBOARD_WARP,
                GboardTypingEffectsSettings.DEFAULT_WIND,
                GboardTypingEffectsSettings.DEFAULT_COLOR_PALETTE,
                GboardTypingEffectsSettings.DEFAULT_EXPLOSION_STYLE,
                GboardTypingEffectsSettings.DEFAULT_GLITTER_STYLE,
                GboardTypingEffectsSettings.DEFAULT_KEY_HIGHLIGHT_STYLE,
                GboardTypingEffectsSettings.DEFAULT_TRAIL_WIDTH_DP,
                GboardTypingEffectsSettings.DEFAULT_TRAIL_FADE_MS,
                GboardTypingEffectsSettings.DEFAULT_RAINBOW_SPEED_PERCENT,
                GboardTypingEffectsSettings.DEFAULT_PARTICLE_COUNT,
                GboardTypingEffectsSettings.DEFAULT_GLITTER_DENSITY,
                GboardTypingEffectsSettings.DEFAULT_PARTICLE_SIZE_PERCENT,
                GboardTypingEffectsSettings.DEFAULT_PARTICLE_LIFETIME_MS,
                GboardTypingEffectsSettings.DEFAULT_PARTICLE_SPEED_PERCENT,
                GboardTypingEffectsSettings.DEFAULT_KEY_HIGHLIGHT_DURATION_MS,
                GboardTypingEffectsSettings.DEFAULT_WARP_STRENGTH_PERCENT,
                GboardTypingEffectsSettings.DEFAULT_WARP_RADIUS_DP,
                GboardTypingEffectsSettings.DEFAULT_WIND_INTENSITY,
                GboardTypingEffectsSettings.DEFAULT_WIND_SPREAD_DP);
    }

    public boolean hasAnyVisualEffectEnabled() {
        return enabled && (rainbowTrailEnabled
                || glitterEnabled
                || tapExplosionEnabled
                || releaseExplosionEnabled
                || keyHighlightEnabled
                || keyboardWarpEnabled
                || windEnabled);
    }

    public static String normalizePalette(String raw) {
        if (PALETTE_NEON.equals(raw)) return PALETTE_NEON;
        if (PALETTE_FIRE.equals(raw)) return PALETTE_FIRE;
        if (PALETTE_GALAXY.equals(raw)) return PALETTE_GALAXY;
        if (PALETTE_PASTEL.equals(raw)) return PALETTE_PASTEL;
        return PALETTE_RAINBOW;
    }

    public static String normalizeExplosionStyle(String raw) {
        if (EXPLOSION_STYLE_SPARKLES.equals(raw)) return EXPLOSION_STYLE_SPARKLES;
        if (EXPLOSION_STYLE_CONFETTI.equals(raw)) return EXPLOSION_STYLE_CONFETTI;
        if (EXPLOSION_STYLE_ALL_OUT.equals(raw)) return EXPLOSION_STYLE_ALL_OUT;
        return EXPLOSION_STYLE_SPARKS_RING;
    }

    public static String normalizeGlitterStyle(String raw) {
        if (GLITTER_STYLE_SPARKS.equals(raw)) return GLITTER_STYLE_SPARKS;
        if (GLITTER_STYLE_CONFETTI.equals(raw)) return GLITTER_STYLE_CONFETTI;
        if (GLITTER_STYLE_MIXED.equals(raw)) return GLITTER_STYLE_MIXED;
        return GLITTER_STYLE_SPARKLES;
    }

    public static String normalizeKeyHighlightStyle(String raw) {
        if (KEY_HIGHLIGHT_STYLE_PLASMA_PULSE.equals(raw)) return KEY_HIGHLIGHT_STYLE_PLASMA_PULSE;
        if (KEY_HIGHLIGHT_STYLE_SOFT_FILL.equals(raw)) return KEY_HIGHLIGHT_STYLE_SOFT_FILL;
        return KEY_HIGHLIGHT_STYLE_NEON_GLOW;
    }

    /**
     * Samples a smooth, cyclic opaque ARGB color from the configured palette for a continuous
     * phase {@code t} (any finite float; wraps cleanly every 1.0 unit).
     */
    public int sampleColor(float phase) {
        float wrapped = phase - (float) Math.floor(phase);
        if (PALETTE_RAINBOW.equals(colorPalette)) {
            return hsvToArgb(255, wrapped * 360f, 0.92f, 1.0f);
        }
        int[] stops;
        if (PALETTE_NEON.equals(colorPalette)) {
            stops = NEON_COLORS;
        } else if (PALETTE_FIRE.equals(colorPalette)) {
            stops = FIRE_COLORS;
        } else if (PALETTE_GALAXY.equals(colorPalette)) {
            stops = GALAXY_COLORS;
        } else {
            stops = PASTEL_COLORS;
        }
        float scaled = wrapped * stops.length;
        int idx0 = ((int) Math.floor(scaled)) % stops.length;
        if (idx0 < 0) idx0 += stops.length;
        int idx1 = (idx0 + 1) % stops.length;
        float frac = scaled - (float) Math.floor(scaled);
        return lerpArgb(stops[idx0], stops[idx1], frac);
    }

    public static int withAlpha(int argb, int alpha) {
        int clamped = alpha < 0 ? 0 : (alpha > 255 ? 255 : alpha);
        return (clamped << 24) | (argb & 0x00FFFFFF);
    }

    public static int blendTowardWhite(int argb, float amount) {
        float t = amount < 0f ? 0f : (amount > 1f ? 1f : amount);
        int a = (argb >>> 24) & 0xFF;
        int r = (argb >>> 16) & 0xFF;
        int g = (argb >>> 8) & 0xFF;
        int b = argb & 0xFF;
        r = Math.round(r + (255 - r) * t);
        g = Math.round(g + (255 - g) * t);
        b = Math.round(b + (255 - b) * t);
        return (a << 24) | (r << 16) | (g << 8) | b;
    }

    public static int lerpArgb(int c0, int c1, float t) {
        float clamped = t < 0f ? 0f : (t > 1f ? 1f : t);
        int a0 = (c0 >>> 24) & 0xFF;
        int r0 = (c0 >>> 16) & 0xFF;
        int g0 = (c0 >>> 8) & 0xFF;
        int b0 = c0 & 0xFF;
        int a1 = (c1 >>> 24) & 0xFF;
        int r1 = (c1 >>> 16) & 0xFF;
        int g1 = (c1 >>> 8) & 0xFF;
        int b1 = c1 & 0xFF;
        int a = Math.round(a0 + (a1 - a0) * clamped);
        int r = Math.round(r0 + (r1 - r0) * clamped);
        int g = Math.round(g0 + (g1 - g0) * clamped);
        int b = Math.round(b0 + (b1 - b0) * clamped);
        return (a << 24) | (r << 16) | (g << 8) | b;
    }

    public static int hsvToArgb(int alpha, float hueDeg, float sat, float val) {
        float h = ((hueDeg % 360f) + 360f) % 360f;
        float c = val * sat;
        float x = c * (1f - Math.abs((h / 60f) % 2f - 1f));
        float m = val - c;
        float r1;
        float g1;
        float b1;
        if (h < 60f) {
            r1 = c;
            g1 = x;
            b1 = 0f;
        } else if (h < 120f) {
            r1 = x;
            g1 = c;
            b1 = 0f;
        } else if (h < 180f) {
            r1 = 0f;
            g1 = c;
            b1 = x;
        } else if (h < 240f) {
            r1 = 0f;
            g1 = x;
            b1 = c;
        } else if (h < 300f) {
            r1 = x;
            g1 = 0f;
            b1 = c;
        } else {
            r1 = c;
            g1 = 0f;
            b1 = x;
        }
        int a = alpha < 0 ? 0 : (alpha > 255 ? 255 : alpha);
        int r = Math.round((r1 + m) * 255f);
        int g = Math.round((g1 + m) * 255f);
        int b = Math.round((b1 + m) * 255f);
        return (a << 24) | (r << 16) | (g << 8) | b;
    }
}
