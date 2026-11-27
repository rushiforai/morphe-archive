package dev.srwi.gintype.extension.typingeffects;

import android.content.Context;
import android.content.SharedPreferences;
import dev.srwi.gintype.extension.flagsettings.GboardBooleanFlagSettings;
import dev.srwi.gintype.extension.settings.GboardPatchesSettings;

/**
 * Persistent preferences for the Typing Effects patch.
 */
public final class GboardTypingEffectsSettings {

    public static final String PREF_KEY_ENABLED = "pref_typing_effects_enabled";
    public static final String PREF_KEY_RAINBOW_TRAIL = "pref_typing_effects_rainbow_trail";
    public static final String PREF_KEY_TRAIL_GLOW = "pref_typing_effects_trail_glow";
    public static final String PREF_KEY_GLITTER = "pref_typing_effects_glitter";
    public static final String PREF_KEY_TAP_EXPLOSION = "pref_typing_effects_tap_explosion";
    public static final String PREF_KEY_RELEASE_EXPLOSION = "pref_typing_effects_release_explosion";
    public static final String PREF_KEY_SHOCKWAVE_RING = "pref_typing_effects_shockwave_ring";
    public static final String PREF_KEY_KEY_HIGHLIGHT = "pref_typing_effects_key_highlight";
    public static final String PREF_KEY_KEYBOARD_WARP = "pref_typing_effects_keyboard_warp";
    public static final String PREF_KEY_WIND = "pref_typing_effects_wind";
    public static final String PREF_KEY_COLOR_PALETTE = "pref_typing_effects_color_palette";
    public static final String PREF_KEY_EXPLOSION_STYLE = "pref_typing_effects_explosion_style";
    public static final String PREF_KEY_GLITTER_STYLE = "pref_typing_effects_glitter_style";
    public static final String PREF_KEY_KEY_HIGHLIGHT_STYLE =
            "pref_typing_effects_key_highlight_style";
    public static final String PREF_KEY_TRAIL_WIDTH_DP = "pref_typing_effects_trail_width_dp";
    public static final String PREF_KEY_TRAIL_FADE_MS = "pref_typing_effects_trail_fade_ms";
    public static final String PREF_KEY_RAINBOW_SPEED = "pref_typing_effects_rainbow_speed";
    public static final String PREF_KEY_PARTICLE_COUNT = "pref_typing_effects_particle_count";
    public static final String PREF_KEY_GLITTER_DENSITY = "pref_typing_effects_glitter_density";
    public static final String PREF_KEY_PARTICLE_SIZE = "pref_typing_effects_particle_size";
    public static final String PREF_KEY_PARTICLE_LIFETIME_MS =
            "pref_typing_effects_particle_lifetime_ms";
    public static final String PREF_KEY_PARTICLE_SPEED = "pref_typing_effects_particle_speed";
    public static final String PREF_KEY_KEY_HIGHLIGHT_DURATION_MS =
            "pref_typing_effects_key_highlight_duration_ms";
    public static final String PREF_KEY_WARP_STRENGTH = "pref_typing_effects_warp_strength";
    public static final String PREF_KEY_WARP_RADIUS_DP = "pref_typing_effects_warp_radius_dp";
    public static final String PREF_KEY_WIND_INTENSITY = "pref_typing_effects_wind_intensity";
    public static final String PREF_KEY_WIND_SPREAD_DP = "pref_typing_effects_wind_spread_dp";

    public static final boolean DEFAULT_ENABLED = true;
    public static final boolean DEFAULT_RAINBOW_TRAIL = true;
    public static final boolean DEFAULT_TRAIL_GLOW = true;
    public static final boolean DEFAULT_GLITTER = true;
    public static final boolean DEFAULT_TAP_EXPLOSION = true;
    public static final boolean DEFAULT_RELEASE_EXPLOSION = true;
    public static final boolean DEFAULT_SHOCKWAVE_RING = true;
    public static final boolean DEFAULT_KEY_HIGHLIGHT = true;
    public static final boolean DEFAULT_KEYBOARD_WARP = false;
    public static final boolean DEFAULT_WIND = true;

    public static final String DEFAULT_COLOR_PALETTE = TypingEffectsConfig.PALETTE_RAINBOW;
    public static final String DEFAULT_EXPLOSION_STYLE =
            TypingEffectsConfig.EXPLOSION_STYLE_SPARKS_RING;
    public static final String DEFAULT_GLITTER_STYLE = TypingEffectsConfig.GLITTER_STYLE_SPARKLES;
    public static final String DEFAULT_KEY_HIGHLIGHT_STYLE =
            TypingEffectsConfig.KEY_HIGHLIGHT_STYLE_NEON_GLOW;

    public static final int MIN_TRAIL_WIDTH_DP = 4;
    public static final int MAX_TRAIL_WIDTH_DP = 24;
    public static final int DEFAULT_TRAIL_WIDTH_DP = 12;

    public static final int MIN_TRAIL_FADE_MS = 120;
    public static final int MAX_TRAIL_FADE_MS = 900;
    public static final int DEFAULT_TRAIL_FADE_MS = 360;

    public static final int MIN_RAINBOW_SPEED_PERCENT = 50;
    public static final int MAX_RAINBOW_SPEED_PERCENT = 400;
    public static final int DEFAULT_RAINBOW_SPEED_PERCENT = 150;

    public static final int MIN_PARTICLE_COUNT = 6;
    public static final int MAX_PARTICLE_COUNT = 48;
    public static final int DEFAULT_PARTICLE_COUNT = 20;

    public static final int MIN_GLITTER_DENSITY = 1;
    public static final int MAX_GLITTER_DENSITY = 10;
    public static final int DEFAULT_GLITTER_DENSITY = 5;

    public static final int MIN_PARTICLE_SIZE_PERCENT = 50;
    public static final int MAX_PARTICLE_SIZE_PERCENT = 220;
    public static final int DEFAULT_PARTICLE_SIZE_PERCENT = 100;

    public static final int MIN_PARTICLE_LIFETIME_MS = 200;
    public static final int MAX_PARTICLE_LIFETIME_MS = 1200;
    public static final int DEFAULT_PARTICLE_LIFETIME_MS = 520;

    public static final int MIN_PARTICLE_SPEED_PERCENT = 40;
    public static final int MAX_PARTICLE_SPEED_PERCENT = 220;
    public static final int DEFAULT_PARTICLE_SPEED_PERCENT = 100;

    public static final int MIN_KEY_HIGHLIGHT_DURATION_MS = 120;
    public static final int MAX_KEY_HIGHLIGHT_DURATION_MS = 1200;
    public static final int DEFAULT_KEY_HIGHLIGHT_DURATION_MS = 380;

    public static final int MIN_WARP_STRENGTH_PERCENT = 25;
    public static final int MAX_WARP_STRENGTH_PERCENT = 220;
    public static final int DEFAULT_WARP_STRENGTH_PERCENT = 100;

    public static final int MIN_WARP_RADIUS_DP = 60;
    public static final int MAX_WARP_RADIUS_DP = 220;
    public static final int DEFAULT_WARP_RADIUS_DP = 115;

    public static final int MIN_WIND_INTENSITY = 1;
    public static final int MAX_WIND_INTENSITY = 10;
    public static final int DEFAULT_WIND_INTENSITY = 5;

    public static final int MIN_WIND_SPREAD_DP = 25;
    public static final int MAX_WIND_SPREAD_DP = 120;
    public static final int DEFAULT_WIND_SPREAD_DP = 70;

    private GboardTypingEffectsSettings() {
    }

    private static SharedPreferences resolvePreferences(Context context) {
        if (context == null) return null;
        SharedPreferences preferences = GboardPatchesSettings.preferencesOrNull(context);
        if (preferences == null) {
            preferences = context.getSharedPreferences(
                    context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
        }
        return preferences;
    }

    public static TypingEffectsConfig readConfig(Context context) {
        try {
            SharedPreferences preferences = resolvePreferences(context);
            return preferences == null ? TypingEffectsConfig.defaults() : readConfig(preferences);
        } catch (Throwable ignored) {
            return TypingEffectsConfig.defaults();
        }
    }

    public static TypingEffectsConfig readConfig(SharedPreferences preferences) {
        if (preferences == null) {
            return TypingEffectsConfig.defaults();
        }
        return new TypingEffectsConfig(
                readEnabled(preferences),
                readRainbowTrailEnabled(preferences),
                readTrailGlowEnabled(preferences),
                readGlitterEnabled(preferences),
                readTapExplosionEnabled(preferences),
                readReleaseExplosionEnabled(preferences),
                readShockwaveRingEnabled(preferences),
                readKeyHighlightEnabled(preferences),
                readKeyboardWarpEnabled(preferences),
                readWindEnabled(preferences),
                readColorPalette(preferences),
                readExplosionStyle(preferences),
                readGlitterStyle(preferences),
                readKeyHighlightStyle(preferences),
                readTrailWidthDp(preferences),
                readTrailFadeMs(preferences),
                readRainbowSpeedPercent(preferences),
                readParticleCount(preferences),
                readGlitterDensity(preferences),
                readParticleSizePercent(preferences),
                readParticleLifetimeMs(preferences),
                readParticleSpeedPercent(preferences),
                readKeyHighlightDurationMs(preferences),
                readWarpStrengthPercent(preferences),
                readWarpRadiusDp(preferences),
                readWindIntensity(preferences),
                readWindSpreadDp(preferences));
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        GboardBooleanFlagSettings.ensureDefault(
                preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
        if (preferences == null) return;
        SharedPreferences.Editor editor = null;
        if (!preferences.contains(PREF_KEY_RAINBOW_TRAIL)) {
            editor = preferences.edit();
            editor.putBoolean(PREF_KEY_RAINBOW_TRAIL, DEFAULT_RAINBOW_TRAIL);
        }
        if (!preferences.contains(PREF_KEY_TRAIL_GLOW)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_TRAIL_GLOW, DEFAULT_TRAIL_GLOW);
        }
        if (!preferences.contains(PREF_KEY_GLITTER)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_GLITTER, DEFAULT_GLITTER);
        }
        if (!preferences.contains(PREF_KEY_TAP_EXPLOSION)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_TAP_EXPLOSION, DEFAULT_TAP_EXPLOSION);
        }
        if (!preferences.contains(PREF_KEY_RELEASE_EXPLOSION)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_RELEASE_EXPLOSION, DEFAULT_RELEASE_EXPLOSION);
        }
        if (!preferences.contains(PREF_KEY_SHOCKWAVE_RING)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_SHOCKWAVE_RING, DEFAULT_SHOCKWAVE_RING);
        }
        if (!preferences.contains(PREF_KEY_KEY_HIGHLIGHT)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_KEY_HIGHLIGHT, DEFAULT_KEY_HIGHLIGHT);
        }
        if (!preferences.contains(PREF_KEY_KEYBOARD_WARP)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_KEYBOARD_WARP, DEFAULT_KEYBOARD_WARP);
        }
        if (!preferences.contains(PREF_KEY_WIND)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_WIND, DEFAULT_WIND);
        }
        if (!preferences.contains(PREF_KEY_COLOR_PALETTE)) {
            if (editor == null) editor = preferences.edit();
            editor.putString(PREF_KEY_COLOR_PALETTE, DEFAULT_COLOR_PALETTE);
        }
        if (!preferences.contains(PREF_KEY_EXPLOSION_STYLE)) {
            if (editor == null) editor = preferences.edit();
            editor.putString(PREF_KEY_EXPLOSION_STYLE, DEFAULT_EXPLOSION_STYLE);
        }
        if (!preferences.contains(PREF_KEY_GLITTER_STYLE)) {
            if (editor == null) editor = preferences.edit();
            editor.putString(PREF_KEY_GLITTER_STYLE, DEFAULT_GLITTER_STYLE);
        }
        if (!preferences.contains(PREF_KEY_KEY_HIGHLIGHT_STYLE)) {
            if (editor == null) editor = preferences.edit();
            editor.putString(PREF_KEY_KEY_HIGHLIGHT_STYLE, DEFAULT_KEY_HIGHLIGHT_STYLE);
        }
        if (!preferences.contains(PREF_KEY_TRAIL_WIDTH_DP)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_TRAIL_WIDTH_DP, DEFAULT_TRAIL_WIDTH_DP);
        }
        if (!preferences.contains(PREF_KEY_TRAIL_FADE_MS)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_TRAIL_FADE_MS, DEFAULT_TRAIL_FADE_MS);
        }
        if (!preferences.contains(PREF_KEY_RAINBOW_SPEED)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_RAINBOW_SPEED, DEFAULT_RAINBOW_SPEED_PERCENT);
        }
        if (!preferences.contains(PREF_KEY_PARTICLE_COUNT)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_PARTICLE_COUNT, DEFAULT_PARTICLE_COUNT);
        }
        if (!preferences.contains(PREF_KEY_GLITTER_DENSITY)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_GLITTER_DENSITY, DEFAULT_GLITTER_DENSITY);
        }
        if (!preferences.contains(PREF_KEY_PARTICLE_SIZE)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_PARTICLE_SIZE, DEFAULT_PARTICLE_SIZE_PERCENT);
        }
        if (!preferences.contains(PREF_KEY_PARTICLE_LIFETIME_MS)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_PARTICLE_LIFETIME_MS, DEFAULT_PARTICLE_LIFETIME_MS);
        }
        if (!preferences.contains(PREF_KEY_PARTICLE_SPEED)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_PARTICLE_SPEED, DEFAULT_PARTICLE_SPEED_PERCENT);
        }
        if (!preferences.contains(PREF_KEY_KEY_HIGHLIGHT_DURATION_MS)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_KEY_HIGHLIGHT_DURATION_MS, DEFAULT_KEY_HIGHLIGHT_DURATION_MS);
        }
        if (!preferences.contains(PREF_KEY_WARP_STRENGTH)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_WARP_STRENGTH, DEFAULT_WARP_STRENGTH_PERCENT);
        }
        if (!preferences.contains(PREF_KEY_WARP_RADIUS_DP)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_WARP_RADIUS_DP, DEFAULT_WARP_RADIUS_DP);
        }
        if (!preferences.contains(PREF_KEY_WIND_INTENSITY)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_WIND_INTENSITY, DEFAULT_WIND_INTENSITY);
        }
        if (!preferences.contains(PREF_KEY_WIND_SPREAD_DP)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_WIND_SPREAD_DP, DEFAULT_WIND_SPREAD_DP);
        }
        if (editor != null) {
            editor.commit();
        }
    }

    public static boolean resetToDefaults(SharedPreferences preferences) {
        if (preferences == null) return false;
        boolean ok = preferences.edit()
                .putBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED)
                .putBoolean(PREF_KEY_RAINBOW_TRAIL, DEFAULT_RAINBOW_TRAIL)
                .putBoolean(PREF_KEY_TRAIL_GLOW, DEFAULT_TRAIL_GLOW)
                .putBoolean(PREF_KEY_GLITTER, DEFAULT_GLITTER)
                .putBoolean(PREF_KEY_TAP_EXPLOSION, DEFAULT_TAP_EXPLOSION)
                .putBoolean(PREF_KEY_RELEASE_EXPLOSION, DEFAULT_RELEASE_EXPLOSION)
                .putBoolean(PREF_KEY_SHOCKWAVE_RING, DEFAULT_SHOCKWAVE_RING)
                .putBoolean(PREF_KEY_KEY_HIGHLIGHT, DEFAULT_KEY_HIGHLIGHT)
                .putBoolean(PREF_KEY_KEYBOARD_WARP, DEFAULT_KEYBOARD_WARP)
                .putBoolean(PREF_KEY_WIND, DEFAULT_WIND)
                .putString(PREF_KEY_COLOR_PALETTE, DEFAULT_COLOR_PALETTE)
                .putString(PREF_KEY_EXPLOSION_STYLE, DEFAULT_EXPLOSION_STYLE)
                .putString(PREF_KEY_GLITTER_STYLE, DEFAULT_GLITTER_STYLE)
                .putString(PREF_KEY_KEY_HIGHLIGHT_STYLE, DEFAULT_KEY_HIGHLIGHT_STYLE)
                .putInt(PREF_KEY_TRAIL_WIDTH_DP, DEFAULT_TRAIL_WIDTH_DP)
                .putInt(PREF_KEY_TRAIL_FADE_MS, DEFAULT_TRAIL_FADE_MS)
                .putInt(PREF_KEY_RAINBOW_SPEED, DEFAULT_RAINBOW_SPEED_PERCENT)
                .putInt(PREF_KEY_PARTICLE_COUNT, DEFAULT_PARTICLE_COUNT)
                .putInt(PREF_KEY_GLITTER_DENSITY, DEFAULT_GLITTER_DENSITY)
                .putInt(PREF_KEY_PARTICLE_SIZE, DEFAULT_PARTICLE_SIZE_PERCENT)
                .putInt(PREF_KEY_PARTICLE_LIFETIME_MS, DEFAULT_PARTICLE_LIFETIME_MS)
                .putInt(PREF_KEY_PARTICLE_SPEED, DEFAULT_PARTICLE_SPEED_PERCENT)
                .putInt(PREF_KEY_KEY_HIGHLIGHT_DURATION_MS, DEFAULT_KEY_HIGHLIGHT_DURATION_MS)
                .putInt(PREF_KEY_WARP_STRENGTH, DEFAULT_WARP_STRENGTH_PERCENT)
                .putInt(PREF_KEY_WARP_RADIUS_DP, DEFAULT_WARP_RADIUS_DP)
                .putInt(PREF_KEY_WIND_INTENSITY, DEFAULT_WIND_INTENSITY)
                .putInt(PREF_KEY_WIND_SPREAD_DP, DEFAULT_WIND_SPREAD_DP)
                .commit();
        GboardTypingEffectsRuntime.invalidateCachedConfig();
        return ok;
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        return GboardBooleanFlagSettings.readEnabled(preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        boolean ok = GboardBooleanFlagSettings.writeEnabled(preferences, PREF_KEY_ENABLED, enabled);
        GboardTypingEffectsRuntime.invalidateCachedConfig();
        return ok;
    }

    public static boolean readRainbowTrailEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_RAINBOW_TRAIL, DEFAULT_RAINBOW_TRAIL);
    }

    public static boolean writeRainbowTrailEnabled(SharedPreferences preferences, boolean value) {
        return writeBoolean(preferences, PREF_KEY_RAINBOW_TRAIL, value);
    }

    public static boolean readTrailGlowEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_TRAIL_GLOW, DEFAULT_TRAIL_GLOW);
    }

    public static boolean writeTrailGlowEnabled(SharedPreferences preferences, boolean value) {
        return writeBoolean(preferences, PREF_KEY_TRAIL_GLOW, value);
    }

    public static boolean readGlitterEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_GLITTER, DEFAULT_GLITTER);
    }

    public static boolean writeGlitterEnabled(SharedPreferences preferences, boolean value) {
        return writeBoolean(preferences, PREF_KEY_GLITTER, value);
    }

    public static boolean readTapExplosionEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_TAP_EXPLOSION, DEFAULT_TAP_EXPLOSION);
    }

    public static boolean writeTapExplosionEnabled(SharedPreferences preferences, boolean value) {
        return writeBoolean(preferences, PREF_KEY_TAP_EXPLOSION, value);
    }

    public static boolean readReleaseExplosionEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_RELEASE_EXPLOSION, DEFAULT_RELEASE_EXPLOSION);
    }

    public static boolean writeReleaseExplosionEnabled(SharedPreferences preferences, boolean value) {
        return writeBoolean(preferences, PREF_KEY_RELEASE_EXPLOSION, value);
    }

    public static boolean readShockwaveRingEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_SHOCKWAVE_RING, DEFAULT_SHOCKWAVE_RING);
    }

    public static boolean writeShockwaveRingEnabled(SharedPreferences preferences, boolean value) {
        return writeBoolean(preferences, PREF_KEY_SHOCKWAVE_RING, value);
    }

    public static boolean readKeyHighlightEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_KEY_HIGHLIGHT, DEFAULT_KEY_HIGHLIGHT);
    }

    public static boolean writeKeyHighlightEnabled(SharedPreferences preferences, boolean value) {
        return writeBoolean(preferences, PREF_KEY_KEY_HIGHLIGHT, value);
    }

    public static boolean readKeyboardWarpEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_KEYBOARD_WARP, DEFAULT_KEYBOARD_WARP);
    }

    public static boolean writeKeyboardWarpEnabled(SharedPreferences preferences, boolean value) {
        return writeBoolean(preferences, PREF_KEY_KEYBOARD_WARP, value);
    }

    public static boolean readWindEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_WIND, DEFAULT_WIND);
    }

    public static boolean writeWindEnabled(SharedPreferences preferences, boolean value) {
        return writeBoolean(preferences, PREF_KEY_WIND, value);
    }

    public static String readColorPalette(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_COLOR_PALETTE;
        try {
            return TypingEffectsConfig.normalizePalette(
                    preferences.getString(PREF_KEY_COLOR_PALETTE, DEFAULT_COLOR_PALETTE));
        } catch (ClassCastException ignored) {
            return DEFAULT_COLOR_PALETTE;
        }
    }

    public static boolean writeColorPalette(SharedPreferences preferences, String value) {
        return writeString(preferences, PREF_KEY_COLOR_PALETTE,
                TypingEffectsConfig.normalizePalette(value));
    }

    public static String readExplosionStyle(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_EXPLOSION_STYLE;
        try {
            return TypingEffectsConfig.normalizeExplosionStyle(
                    preferences.getString(PREF_KEY_EXPLOSION_STYLE, DEFAULT_EXPLOSION_STYLE));
        } catch (ClassCastException ignored) {
            return DEFAULT_EXPLOSION_STYLE;
        }
    }

    public static boolean writeExplosionStyle(SharedPreferences preferences, String value) {
        return writeString(preferences, PREF_KEY_EXPLOSION_STYLE,
                TypingEffectsConfig.normalizeExplosionStyle(value));
    }

    public static String readGlitterStyle(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_GLITTER_STYLE;
        try {
            return TypingEffectsConfig.normalizeGlitterStyle(
                    preferences.getString(PREF_KEY_GLITTER_STYLE, DEFAULT_GLITTER_STYLE));
        } catch (ClassCastException ignored) {
            return DEFAULT_GLITTER_STYLE;
        }
    }

    public static boolean writeGlitterStyle(SharedPreferences preferences, String value) {
        return writeString(preferences, PREF_KEY_GLITTER_STYLE,
                TypingEffectsConfig.normalizeGlitterStyle(value));
    }

    public static String readKeyHighlightStyle(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_KEY_HIGHLIGHT_STYLE;
        try {
            return TypingEffectsConfig.normalizeKeyHighlightStyle(
                    preferences.getString(PREF_KEY_KEY_HIGHLIGHT_STYLE, DEFAULT_KEY_HIGHLIGHT_STYLE));
        } catch (ClassCastException ignored) {
            return DEFAULT_KEY_HIGHLIGHT_STYLE;
        }
    }

    public static boolean writeKeyHighlightStyle(SharedPreferences preferences, String value) {
        return writeString(preferences, PREF_KEY_KEY_HIGHLIGHT_STYLE,
                TypingEffectsConfig.normalizeKeyHighlightStyle(value));
    }

    public static int readTrailWidthDp(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_TRAIL_WIDTH_DP,
                DEFAULT_TRAIL_WIDTH_DP, MIN_TRAIL_WIDTH_DP, MAX_TRAIL_WIDTH_DP);
    }

    public static boolean writeTrailWidthDp(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_TRAIL_WIDTH_DP,
                value, MIN_TRAIL_WIDTH_DP, MAX_TRAIL_WIDTH_DP);
    }

    public static int readTrailFadeMs(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_TRAIL_FADE_MS,
                DEFAULT_TRAIL_FADE_MS, MIN_TRAIL_FADE_MS, MAX_TRAIL_FADE_MS);
    }

    public static boolean writeTrailFadeMs(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_TRAIL_FADE_MS,
                value, MIN_TRAIL_FADE_MS, MAX_TRAIL_FADE_MS);
    }

    public static int readRainbowSpeedPercent(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_RAINBOW_SPEED,
                DEFAULT_RAINBOW_SPEED_PERCENT, MIN_RAINBOW_SPEED_PERCENT, MAX_RAINBOW_SPEED_PERCENT);
    }

    public static boolean writeRainbowSpeedPercent(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_RAINBOW_SPEED,
                value, MIN_RAINBOW_SPEED_PERCENT, MAX_RAINBOW_SPEED_PERCENT);
    }

    public static int readParticleCount(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_PARTICLE_COUNT,
                DEFAULT_PARTICLE_COUNT, MIN_PARTICLE_COUNT, MAX_PARTICLE_COUNT);
    }

    public static boolean writeParticleCount(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_PARTICLE_COUNT,
                value, MIN_PARTICLE_COUNT, MAX_PARTICLE_COUNT);
    }

    public static int readGlitterDensity(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_GLITTER_DENSITY,
                DEFAULT_GLITTER_DENSITY, MIN_GLITTER_DENSITY, MAX_GLITTER_DENSITY);
    }

    public static boolean writeGlitterDensity(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_GLITTER_DENSITY,
                value, MIN_GLITTER_DENSITY, MAX_GLITTER_DENSITY);
    }

    public static int readParticleSizePercent(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_PARTICLE_SIZE,
                DEFAULT_PARTICLE_SIZE_PERCENT, MIN_PARTICLE_SIZE_PERCENT, MAX_PARTICLE_SIZE_PERCENT);
    }

    public static boolean writeParticleSizePercent(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_PARTICLE_SIZE,
                value, MIN_PARTICLE_SIZE_PERCENT, MAX_PARTICLE_SIZE_PERCENT);
    }

    public static int readParticleLifetimeMs(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_PARTICLE_LIFETIME_MS,
                DEFAULT_PARTICLE_LIFETIME_MS, MIN_PARTICLE_LIFETIME_MS, MAX_PARTICLE_LIFETIME_MS);
    }

    public static boolean writeParticleLifetimeMs(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_PARTICLE_LIFETIME_MS,
                value, MIN_PARTICLE_LIFETIME_MS, MAX_PARTICLE_LIFETIME_MS);
    }

    public static int readParticleSpeedPercent(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_PARTICLE_SPEED,
                DEFAULT_PARTICLE_SPEED_PERCENT, MIN_PARTICLE_SPEED_PERCENT, MAX_PARTICLE_SPEED_PERCENT);
    }

    public static boolean writeParticleSpeedPercent(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_PARTICLE_SPEED,
                value, MIN_PARTICLE_SPEED_PERCENT, MAX_PARTICLE_SPEED_PERCENT);
    }

    public static int readKeyHighlightDurationMs(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_KEY_HIGHLIGHT_DURATION_MS,
                DEFAULT_KEY_HIGHLIGHT_DURATION_MS,
                MIN_KEY_HIGHLIGHT_DURATION_MS,
                MAX_KEY_HIGHLIGHT_DURATION_MS);
    }

    public static boolean writeKeyHighlightDurationMs(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_KEY_HIGHLIGHT_DURATION_MS,
                value, MIN_KEY_HIGHLIGHT_DURATION_MS, MAX_KEY_HIGHLIGHT_DURATION_MS);
    }

    public static int readWarpStrengthPercent(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_WARP_STRENGTH,
                DEFAULT_WARP_STRENGTH_PERCENT, MIN_WARP_STRENGTH_PERCENT, MAX_WARP_STRENGTH_PERCENT);
    }

    public static boolean writeWarpStrengthPercent(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_WARP_STRENGTH,
                value, MIN_WARP_STRENGTH_PERCENT, MAX_WARP_STRENGTH_PERCENT);
    }

    public static int readWarpRadiusDp(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_WARP_RADIUS_DP,
                DEFAULT_WARP_RADIUS_DP, MIN_WARP_RADIUS_DP, MAX_WARP_RADIUS_DP);
    }

    public static boolean writeWarpRadiusDp(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_WARP_RADIUS_DP,
                value, MIN_WARP_RADIUS_DP, MAX_WARP_RADIUS_DP);
    }

    public static int readWindIntensity(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_WIND_INTENSITY,
                DEFAULT_WIND_INTENSITY, MIN_WIND_INTENSITY, MAX_WIND_INTENSITY);
    }

    public static boolean writeWindIntensity(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_WIND_INTENSITY,
                value, MIN_WIND_INTENSITY, MAX_WIND_INTENSITY);
    }

    public static int readWindSpreadDp(SharedPreferences preferences) {
        return readClampedInt(preferences, PREF_KEY_WIND_SPREAD_DP,
                DEFAULT_WIND_SPREAD_DP, MIN_WIND_SPREAD_DP, MAX_WIND_SPREAD_DP);
    }

    public static boolean writeWindSpreadDp(SharedPreferences preferences, int value) {
        return writeClampedInt(preferences, PREF_KEY_WIND_SPREAD_DP,
                value, MIN_WIND_SPREAD_DP, MAX_WIND_SPREAD_DP);
    }

    private static boolean readBoolean(SharedPreferences prefs, String key, boolean def) {
        if (prefs == null) return def;
        try {
            return prefs.getBoolean(key, def);
        } catch (ClassCastException ignored) {
            return def;
        }
    }

    private static boolean writeBoolean(SharedPreferences prefs, String key, boolean value) {
        if (prefs == null) return false;
        boolean ok = prefs.edit().putBoolean(key, value).commit();
        GboardTypingEffectsRuntime.invalidateCachedConfig();
        return ok;
    }

    private static boolean writeString(SharedPreferences prefs, String key, String value) {
        if (prefs == null) return false;
        boolean ok = prefs.edit().putString(key, value).commit();
        GboardTypingEffectsRuntime.invalidateCachedConfig();
        return ok;
    }

    private static int readClampedInt(
            SharedPreferences prefs, String key, int def, int min, int max) {
        if (prefs == null) return def;
        try {
            return clamp(prefs.getInt(key, def), min, max);
        } catch (ClassCastException ignored) {
            return def;
        }
    }

    private static boolean writeClampedInt(
            SharedPreferences prefs, String key, int value, int min, int max) {
        if (prefs == null) return false;
        boolean ok = prefs.edit().putInt(key, clamp(value, min, max)).commit();
        GboardTypingEffectsRuntime.invalidateCachedConfig();
        return ok;
    }

    public static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }
}
