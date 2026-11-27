package dev.srwi.gintype.extension.typingeffects;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import dev.srwi.gintype.extension.R;
import dev.srwi.gintype.extension.settings.GboardPatchesFeatureAvailability;
import dev.srwi.gintype.extension.settings.GboardPatchesIcons;
import dev.srwi.gintype.extension.settings.GboardPatchesSettings;
import dev.srwi.gintype.extension.settings.GboardPatchesSettingsContract;
import dev.srwi.gintype.extension.settings.GboardSettingsText;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Settings screen for Typing Effects: individual effect toggles, color palette & particle style
 * pickers, full fine-tuning sliders, and reset-to-defaults.
 */
public final class GboardTypingEffectsSettingsFeature implements GboardPatchesSettingsContract.Feature {

    private static final String TAG = "GboardPatches";

    private static final int TRAIL_WIDTH_STEP_DP = 1;
    private static final int TRAIL_FADE_STEP_MS = 20;
    private static final int RAINBOW_SPEED_STEP_PERCENT = 10;
    private static final int PARTICLE_COUNT_STEP = 2;
    private static final int GLITTER_DENSITY_STEP = 1;
    private static final int PARTICLE_SIZE_STEP_PERCENT = 10;
    private static final int PARTICLE_LIFETIME_STEP_MS = 40;
    private static final int PARTICLE_SPEED_STEP_PERCENT = 10;
    private static final int KEY_HIGHLIGHT_DURATION_STEP_MS = 20;
    private static final int WARP_STRENGTH_STEP_PERCENT = 15;
    private static final int WARP_RADIUS_STEP_DP = 5;
    private static final int WIND_INTENSITY_STEP = 1;
    private static final int WIND_SPREAD_STEP_DP = 5;

    private interface IntFormatter {
        String format(int value);
    }

    private interface IntSaver {
        boolean save(int value);
    }

    private final String title;
    private final String summary;
    private final String sectionGeneral;
    private final String sectionTrail;
    private final String sectionGlitter;
    private final String sectionExplosions;
    private final String sectionParticlePhysics;
    private final String sectionKeyGlow;
    private final String sectionWarp;
    private final String sectionWind;
    private final String enabledTitle;
    private final String enabledSummary;
    private final String rainbowTrailTitle;
    private final String rainbowTrailSummary;
    private final String trailGlowTitle;
    private final String trailGlowSummary;
    private final String glitterTitle;
    private final String glitterSummary;
    private final String tapExplosionTitle;
    private final String tapExplosionSummary;
    private final String releaseExplosionTitle;
    private final String releaseExplosionSummary;
    private final String shockwaveRingTitle;
    private final String shockwaveRingSummary;
    private final String keyHighlightTitle;
    private final String keyHighlightSummary;
    private final String keyboardWarpTitle;
    private final String keyboardWarpSummary;
    private final String windTitle;
    private final String windSummary;
    private final String paletteTitle;
    private final String paletteSummary;
    private final String[] paletteLabels;
    private final String[] paletteValues;
    private final String explosionStyleTitle;
    private final String explosionStyleSummary;
    private final String[] explosionStyleLabels;
    private final String[] explosionStyleValues;
    private final String glitterStyleTitle;
    private final String glitterStyleSummary;
    private final String[] glitterStyleLabels;
    private final String[] glitterStyleValues;
    private final String keyHighlightStyleTitle;
    private final String keyHighlightStyleSummary;
    private final String[] keyHighlightStyleLabels;
    private final String[] keyHighlightStyleValues;
    private final String trailWidthTitle;
    private final String trailWidthSummary;
    private final String trailFadeTitle;
    private final String trailFadeSummary;
    private final String rainbowSpeedTitle;
    private final String rainbowSpeedSummary;
    private final String particleCountTitle;
    private final String particleCountSummary;
    private final String glitterDensityTitle;
    private final String glitterDensitySummary;
    private final String particleSizeTitle;
    private final String particleSizeSummary;
    private final String particleLifetimeTitle;
    private final String particleLifetimeSummary;
    private final String particleSpeedTitle;
    private final String particleSpeedSummary;
    private final String keyHighlightDurationTitle;
    private final String keyHighlightDurationSummary;
    private final String warpStrengthTitle;
    private final String warpStrengthSummary;
    private final String warpRadiusTitle;
    private final String warpRadiusSummary;
    private final String windIntensityTitle;
    private final String windIntensitySummary;
    private final String windSpreadTitle;
    private final String windSpreadSummary;
    private final String defaultValueTemplate;
    private final String resetTitle;
    private final String resetSummary;
    private final String resetConfirmTitle;
    private final String resetConfirmMessage;
    private final String resetDone;
    private final String errorTitle;
    private final String errorSummary;

    public GboardTypingEffectsSettingsFeature(Context context) {
        title = text(context, R.string.gboard_patches_typing_effects_title);
        summary = text(context, R.string.gboard_patches_typing_effects_summary);
        sectionGeneral = text(context, R.string.gboard_patches_typing_effects_section_effects);
        sectionTrail = text(context, R.string.gboard_patches_typing_effects_section_trail);
        sectionGlitter = text(context, R.string.gboard_patches_typing_effects_section_style);
        sectionExplosions = text(context, R.string.gboard_patches_typing_effects_section_particles);
        sectionParticlePhysics =
                text(context, R.string.gboard_patches_typing_effects_section_particle_physics);
        sectionKeyGlow = text(context, R.string.gboard_patches_typing_effects_section_key_glow);
        sectionWarp = text(context, R.string.gboard_patches_typing_effects_section_warp);
        sectionWind = text(context, R.string.gboard_patches_typing_effects_section_wind);
        enabledTitle = text(context, R.string.gboard_patches_typing_effects_enabled_title);
        enabledSummary = text(context, R.string.gboard_patches_typing_effects_enabled_summary);
        rainbowTrailTitle = text(context, R.string.gboard_patches_typing_effects_rainbow_trail_title);
        rainbowTrailSummary = text(context, R.string.gboard_patches_typing_effects_rainbow_trail_summary);
        trailGlowTitle = text(context, R.string.gboard_patches_typing_effects_trail_glow_title);
        trailGlowSummary = text(context, R.string.gboard_patches_typing_effects_trail_glow_summary);
        glitterTitle = text(context, R.string.gboard_patches_typing_effects_glitter_title);
        glitterSummary = text(context, R.string.gboard_patches_typing_effects_glitter_summary);
        tapExplosionTitle = text(context, R.string.gboard_patches_typing_effects_tap_explosion_title);
        tapExplosionSummary = text(context, R.string.gboard_patches_typing_effects_tap_explosion_summary);
        releaseExplosionTitle =
                text(context, R.string.gboard_patches_typing_effects_release_explosion_title);
        releaseExplosionSummary =
                text(context, R.string.gboard_patches_typing_effects_release_explosion_summary);
        shockwaveRingTitle =
                text(context, R.string.gboard_patches_typing_effects_shockwave_ring_title);
        shockwaveRingSummary =
                text(context, R.string.gboard_patches_typing_effects_shockwave_ring_summary);
        keyHighlightTitle =
                text(context, R.string.gboard_patches_typing_effects_key_highlight_title);
        keyHighlightSummary =
                text(context, R.string.gboard_patches_typing_effects_key_highlight_summary);
        keyboardWarpTitle =
                text(context, R.string.gboard_patches_typing_effects_keyboard_warp_title);
        keyboardWarpSummary =
                text(context, R.string.gboard_patches_typing_effects_keyboard_warp_summary);
        windTitle = text(context, R.string.gboard_patches_typing_effects_wind_title);
        windSummary = text(context, R.string.gboard_patches_typing_effects_wind_summary);

        paletteTitle = text(context, R.string.gboard_patches_typing_effects_palette_title);
        paletteSummary = text(context, R.string.gboard_patches_typing_effects_palette_summary);
        paletteLabels = new String[] {
                text(context, R.string.gboard_patches_typing_effects_palette_rainbow),
                text(context, R.string.gboard_patches_typing_effects_palette_neon),
                text(context, R.string.gboard_patches_typing_effects_palette_fire),
                text(context, R.string.gboard_patches_typing_effects_palette_galaxy),
                text(context, R.string.gboard_patches_typing_effects_palette_pastel)
        };
        paletteValues = new String[] {
                TypingEffectsConfig.PALETTE_RAINBOW,
                TypingEffectsConfig.PALETTE_NEON,
                TypingEffectsConfig.PALETTE_FIRE,
                TypingEffectsConfig.PALETTE_GALAXY,
                TypingEffectsConfig.PALETTE_PASTEL
        };

        explosionStyleTitle =
                text(context, R.string.gboard_patches_typing_effects_explosion_style_title);
        explosionStyleSummary =
                text(context, R.string.gboard_patches_typing_effects_explosion_style_summary);
        explosionStyleLabels = new String[] {
                text(context, R.string.gboard_patches_typing_effects_explosion_style_sparks_ring),
                text(context, R.string.gboard_patches_typing_effects_explosion_style_sparkles),
                text(context, R.string.gboard_patches_typing_effects_explosion_style_confetti),
                text(context, R.string.gboard_patches_typing_effects_explosion_style_all_out)
        };
        explosionStyleValues = new String[] {
                TypingEffectsConfig.EXPLOSION_STYLE_SPARKS_RING,
                TypingEffectsConfig.EXPLOSION_STYLE_SPARKLES,
                TypingEffectsConfig.EXPLOSION_STYLE_CONFETTI,
                TypingEffectsConfig.EXPLOSION_STYLE_ALL_OUT
        };

        glitterStyleTitle =
                text(context, R.string.gboard_patches_typing_effects_glitter_style_title);
        glitterStyleSummary =
                text(context, R.string.gboard_patches_typing_effects_glitter_style_summary);
        glitterStyleLabels = new String[] {
                text(context, R.string.gboard_patches_typing_effects_glitter_style_sparkles),
                text(context, R.string.gboard_patches_typing_effects_glitter_style_sparks),
                text(context, R.string.gboard_patches_typing_effects_glitter_style_confetti),
                text(context, R.string.gboard_patches_typing_effects_glitter_style_mixed)
        };
        glitterStyleValues = new String[] {
                TypingEffectsConfig.GLITTER_STYLE_SPARKLES,
                TypingEffectsConfig.GLITTER_STYLE_SPARKS,
                TypingEffectsConfig.GLITTER_STYLE_CONFETTI,
                TypingEffectsConfig.GLITTER_STYLE_MIXED
        };

        keyHighlightStyleTitle =
                text(context, R.string.gboard_patches_typing_effects_key_highlight_style_title);
        keyHighlightStyleSummary =
                text(context, R.string.gboard_patches_typing_effects_key_highlight_style_summary);
        keyHighlightStyleLabels = new String[] {
                text(context, R.string.gboard_patches_typing_effects_key_highlight_style_neon_glow),
                text(context, R.string.gboard_patches_typing_effects_key_highlight_style_plasma_pulse),
                text(context, R.string.gboard_patches_typing_effects_key_highlight_style_soft_fill)
        };
        keyHighlightStyleValues = new String[] {
                TypingEffectsConfig.KEY_HIGHLIGHT_STYLE_NEON_GLOW,
                TypingEffectsConfig.KEY_HIGHLIGHT_STYLE_PLASMA_PULSE,
                TypingEffectsConfig.KEY_HIGHLIGHT_STYLE_SOFT_FILL
        };

        trailWidthTitle = text(context, R.string.gboard_patches_typing_effects_trail_width_title);
        trailWidthSummary = text(context, R.string.gboard_patches_typing_effects_trail_width_summary);
        trailFadeTitle = text(context, R.string.gboard_patches_typing_effects_trail_fade_title);
        trailFadeSummary = text(context, R.string.gboard_patches_typing_effects_trail_fade_summary);
        rainbowSpeedTitle = text(context, R.string.gboard_patches_typing_effects_rainbow_speed_title);
        rainbowSpeedSummary =
                text(context, R.string.gboard_patches_typing_effects_rainbow_speed_summary);
        particleCountTitle =
                text(context, R.string.gboard_patches_typing_effects_particle_count_title);
        particleCountSummary =
                text(context, R.string.gboard_patches_typing_effects_particle_count_summary);
        glitterDensityTitle =
                text(context, R.string.gboard_patches_typing_effects_glitter_density_title);
        glitterDensitySummary =
                text(context, R.string.gboard_patches_typing_effects_glitter_density_summary);
        particleSizeTitle = text(context, R.string.gboard_patches_typing_effects_particle_size_title);
        particleSizeSummary =
                text(context, R.string.gboard_patches_typing_effects_particle_size_summary);
        particleLifetimeTitle =
                text(context, R.string.gboard_patches_typing_effects_particle_lifetime_title);
        particleLifetimeSummary =
                text(context, R.string.gboard_patches_typing_effects_particle_lifetime_summary);
        particleSpeedTitle =
                text(context, R.string.gboard_patches_typing_effects_particle_speed_title);
        particleSpeedSummary =
                text(context, R.string.gboard_patches_typing_effects_particle_speed_summary);
        keyHighlightDurationTitle =
                text(context, R.string.gboard_patches_typing_effects_key_highlight_duration_title);
        keyHighlightDurationSummary =
                text(context, R.string.gboard_patches_typing_effects_key_highlight_duration_summary);
        warpStrengthTitle =
                text(context, R.string.gboard_patches_typing_effects_warp_strength_title);
        warpStrengthSummary =
                text(context, R.string.gboard_patches_typing_effects_warp_strength_summary);
        warpRadiusTitle =
                text(context, R.string.gboard_patches_typing_effects_warp_radius_title);
        warpRadiusSummary =
                text(context, R.string.gboard_patches_typing_effects_warp_radius_summary);
        windIntensityTitle =
                text(context, R.string.gboard_patches_typing_effects_wind_intensity_title);
        windIntensitySummary =
                text(context, R.string.gboard_patches_typing_effects_wind_intensity_summary);
        windSpreadTitle =
                text(context, R.string.gboard_patches_typing_effects_wind_spread_title);
        windSpreadSummary =
                text(context, R.string.gboard_patches_typing_effects_wind_spread_summary);
        defaultValueTemplate = text(context, R.string.gboard_patches_multiglide_value_default);
        resetTitle = text(context, R.string.gboard_patches_typing_effects_reset_title);
        resetSummary = text(context, R.string.gboard_patches_typing_effects_reset_summary);
        resetConfirmTitle = text(context, R.string.gboard_patches_typing_effects_reset_confirm_title);
        resetConfirmMessage =
                text(context, R.string.gboard_patches_typing_effects_reset_confirm_message);
        resetDone = text(context, R.string.gboard_patches_typing_effects_reset_done);
        errorTitle = text(context, R.string.gboard_patches_typing_effects_error_title);
        errorSummary = text(context, R.string.gboard_patches_typing_effects_error_summary);
    }

    @Override
    public String getEntryTitle() {
        return title;
    }

    @Override
    public String getEntrySummary() {
        return summary;
    }

    @Override
    public int getEntryIcon() {
        return GboardPatchesIcons.SPARKLE;
    }

    @Override
    public String getEntryTone() {
        return "amber";
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_TYPING_EFFECTS);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            SharedPreferences preferences = GboardPatchesSettings.preferences(host.getContext());
            GboardTypingEffectsSettings.ensureDefaults(preferences);
            TypingEffectsConfig cfg = GboardTypingEffectsSettings.readConfig(preferences);

            boolean master = cfg.enabled;
            boolean trailActive = master && cfg.rainbowTrailEnabled;
            boolean glitterActive = master && cfg.glitterEnabled;
            boolean anyExplosion = master && (cfg.tapExplosionEnabled || cfg.releaseExplosionEnabled);
            boolean anyParticle = glitterActive || anyExplosion;
            boolean keyGlowActive = master && cfg.keyHighlightEnabled;
            boolean warpActive = master && cfg.keyboardWarpEnabled;
            boolean windActive = master && cfg.windEnabled;

            // 1. General (Master toggle + global color theme & speed)
            List<GboardPatchesSettingsContract.Row> generalRows = new ArrayList<GboardPatchesSettingsContract.Row>(3);
            generalRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    enabledTitle,
                    enabledSummary,
                    true,
                    master,
                    checked -> saveBoolAndRefresh(host,
                            GboardTypingEffectsSettings.writeEnabled(preferences, checked))));
            generalRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    paletteTitle,
                    paletteSummary,
                    labelForValue(paletteLabels, paletteValues, cfg.colorPalette),
                    master,
                    () -> GboardPatchesSettingsContract.showSingleChoiceDialog(
                            host,
                            paletteTitle,
                            paletteLabels,
                            paletteValues,
                            cfg.colorPalette,
                            selected -> saveAndRefresh(host,
                                    GboardTypingEffectsSettings.writeColorPalette(preferences, selected)))));
            generalRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    rainbowSpeedTitle,
                    rainbowSpeedSummary,
                    formatUnit(cfg.rainbowSpeedPercent, GboardTypingEffectsSettings.DEFAULT_RAINBOW_SPEED_PERCENT, "%"),
                    master,
                    () -> showIntSliderDialog(
                            host,
                            rainbowSpeedTitle,
                            rainbowSpeedSummary,
                            GboardTypingEffectsSettings.MIN_RAINBOW_SPEED_PERCENT,
                            GboardTypingEffectsSettings.MAX_RAINBOW_SPEED_PERCENT,
                            RAINBOW_SPEED_STEP_PERCENT,
                            GboardTypingEffectsSettings.DEFAULT_RAINBOW_SPEED_PERCENT,
                            cfg.rainbowSpeedPercent,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_RAINBOW_SPEED_PERCENT, "%"),
                            v -> GboardTypingEffectsSettings.writeRainbowSpeedPercent(preferences, v))));

            // 2. Rainbow Swipe Trail (Toggle + glow + width + fade)
            List<GboardPatchesSettingsContract.Row> trailRows = new ArrayList<GboardPatchesSettingsContract.Row>(4);
            trailRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    rainbowTrailTitle,
                    rainbowTrailSummary,
                    master,
                    cfg.rainbowTrailEnabled,
                    checked -> saveBoolAndRefresh(host,
                            GboardTypingEffectsSettings.writeRainbowTrailEnabled(preferences, checked))));
            trailRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    trailGlowTitle,
                    trailGlowSummary,
                    trailActive,
                    cfg.trailGlowEnabled,
                    checked -> saveBoolAndRefresh(host,
                            GboardTypingEffectsSettings.writeTrailGlowEnabled(preferences, checked))));
            trailRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    trailWidthTitle,
                    trailWidthSummary,
                    formatUnit(cfg.trailWidthDp, GboardTypingEffectsSettings.DEFAULT_TRAIL_WIDTH_DP, "dp"),
                    trailActive,
                    () -> showIntSliderDialog(
                            host,
                            trailWidthTitle,
                            trailWidthSummary,
                            GboardTypingEffectsSettings.MIN_TRAIL_WIDTH_DP,
                            GboardTypingEffectsSettings.MAX_TRAIL_WIDTH_DP,
                            TRAIL_WIDTH_STEP_DP,
                            GboardTypingEffectsSettings.DEFAULT_TRAIL_WIDTH_DP,
                            cfg.trailWidthDp,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_TRAIL_WIDTH_DP, "dp"),
                            v -> GboardTypingEffectsSettings.writeTrailWidthDp(preferences, v))));
            trailRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    trailFadeTitle,
                    trailFadeSummary,
                    formatUnit(cfg.trailFadeMs, GboardTypingEffectsSettings.DEFAULT_TRAIL_FADE_MS, "ms"),
                    trailActive,
                    () -> showIntSliderDialog(
                            host,
                            trailFadeTitle,
                            trailFadeSummary,
                            GboardTypingEffectsSettings.MIN_TRAIL_FADE_MS,
                            GboardTypingEffectsSettings.MAX_TRAIL_FADE_MS,
                            TRAIL_FADE_STEP_MS,
                            GboardTypingEffectsSettings.DEFAULT_TRAIL_FADE_MS,
                            cfg.trailFadeMs,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_TRAIL_FADE_MS, "ms"),
                            v -> GboardTypingEffectsSettings.writeTrailFadeMs(preferences, v))));

            // 3. Swipe Glitter (Toggle + style + density)
            List<GboardPatchesSettingsContract.Row> glitterRows = new ArrayList<GboardPatchesSettingsContract.Row>(3);
            glitterRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    glitterTitle,
                    glitterSummary,
                    master,
                    cfg.glitterEnabled,
                    checked -> saveBoolAndRefresh(host,
                            GboardTypingEffectsSettings.writeGlitterEnabled(preferences, checked))));
            glitterRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    glitterStyleTitle,
                    glitterStyleSummary,
                    labelForValue(glitterStyleLabels, glitterStyleValues, cfg.glitterStyle),
                    glitterActive,
                    () -> GboardPatchesSettingsContract.showSingleChoiceDialog(
                            host,
                            glitterStyleTitle,
                            glitterStyleLabels,
                            glitterStyleValues,
                            cfg.glitterStyle,
                            selected -> saveAndRefresh(host,
                                    GboardTypingEffectsSettings.writeGlitterStyle(preferences, selected)))));
            glitterRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    glitterDensityTitle,
                    glitterDensitySummary,
                    formatUnit(cfg.glitterDensity, GboardTypingEffectsSettings.DEFAULT_GLITTER_DENSITY, "/10"),
                    glitterActive,
                    () -> showIntSliderDialog(
                            host,
                            glitterDensityTitle,
                            glitterDensitySummary,
                            GboardTypingEffectsSettings.MIN_GLITTER_DENSITY,
                            GboardTypingEffectsSettings.MAX_GLITTER_DENSITY,
                            GLITTER_DENSITY_STEP,
                            GboardTypingEffectsSettings.DEFAULT_GLITTER_DENSITY,
                            cfg.glitterDensity,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_GLITTER_DENSITY, "/10"),
                            v -> GboardTypingEffectsSettings.writeGlitterDensity(preferences, v))));

            // 4. Explosions (Tap & Release toggles + shockwave ring + style + count)
            List<GboardPatchesSettingsContract.Row> explosionRows = new ArrayList<GboardPatchesSettingsContract.Row>(5);
            explosionRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    tapExplosionTitle,
                    tapExplosionSummary,
                    master,
                    cfg.tapExplosionEnabled,
                    checked -> saveBoolAndRefresh(host,
                            GboardTypingEffectsSettings.writeTapExplosionEnabled(preferences, checked))));
            explosionRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    releaseExplosionTitle,
                    releaseExplosionSummary,
                    master,
                    cfg.releaseExplosionEnabled,
                    checked -> saveBoolAndRefresh(host,
                            GboardTypingEffectsSettings.writeReleaseExplosionEnabled(preferences, checked))));
            explosionRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    shockwaveRingTitle,
                    shockwaveRingSummary,
                    anyExplosion,
                    cfg.shockwaveRingEnabled,
                    checked -> saveBoolAndRefresh(host,
                            GboardTypingEffectsSettings.writeShockwaveRingEnabled(preferences, checked))));
            explosionRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    explosionStyleTitle,
                    explosionStyleSummary,
                    labelForValue(explosionStyleLabels, explosionStyleValues, cfg.explosionStyle),
                    anyExplosion,
                    () -> GboardPatchesSettingsContract.showSingleChoiceDialog(
                            host,
                            explosionStyleTitle,
                            explosionStyleLabels,
                            explosionStyleValues,
                            cfg.explosionStyle,
                            selected -> saveAndRefresh(host,
                                    GboardTypingEffectsSettings.writeExplosionStyle(preferences, selected)))));
            explosionRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    particleCountTitle,
                    particleCountSummary,
                    formatUnit(cfg.particleCount, GboardTypingEffectsSettings.DEFAULT_PARTICLE_COUNT, ""),
                    anyExplosion,
                    () -> showIntSliderDialog(
                            host,
                            particleCountTitle,
                            particleCountSummary,
                            GboardTypingEffectsSettings.MIN_PARTICLE_COUNT,
                            GboardTypingEffectsSettings.MAX_PARTICLE_COUNT,
                            PARTICLE_COUNT_STEP,
                            GboardTypingEffectsSettings.DEFAULT_PARTICLE_COUNT,
                            cfg.particleCount,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_PARTICLE_COUNT, ""),
                            v -> GboardTypingEffectsSettings.writeParticleCount(preferences, v))));

            // 5. Particle Physics (Shared size, lifetime, and speed for glitter & explosions)
            List<GboardPatchesSettingsContract.Row> physicsRows = new ArrayList<GboardPatchesSettingsContract.Row>(3);
            physicsRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    particleSizeTitle,
                    particleSizeSummary,
                    formatUnit(cfg.particleSizePercent, GboardTypingEffectsSettings.DEFAULT_PARTICLE_SIZE_PERCENT, "%"),
                    anyParticle,
                    () -> showIntSliderDialog(
                            host,
                            particleSizeTitle,
                            particleSizeSummary,
                            GboardTypingEffectsSettings.MIN_PARTICLE_SIZE_PERCENT,
                            GboardTypingEffectsSettings.MAX_PARTICLE_SIZE_PERCENT,
                            PARTICLE_SIZE_STEP_PERCENT,
                            GboardTypingEffectsSettings.DEFAULT_PARTICLE_SIZE_PERCENT,
                            cfg.particleSizePercent,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_PARTICLE_SIZE_PERCENT, "%"),
                            v -> GboardTypingEffectsSettings.writeParticleSizePercent(preferences, v))));
            physicsRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    particleLifetimeTitle,
                    particleLifetimeSummary,
                    formatUnit(cfg.particleLifetimeMs, GboardTypingEffectsSettings.DEFAULT_PARTICLE_LIFETIME_MS, "ms"),
                    anyParticle,
                    () -> showIntSliderDialog(
                            host,
                            particleLifetimeTitle,
                            particleLifetimeSummary,
                            GboardTypingEffectsSettings.MIN_PARTICLE_LIFETIME_MS,
                            GboardTypingEffectsSettings.MAX_PARTICLE_LIFETIME_MS,
                            PARTICLE_LIFETIME_STEP_MS,
                            GboardTypingEffectsSettings.DEFAULT_PARTICLE_LIFETIME_MS,
                            cfg.particleLifetimeMs,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_PARTICLE_LIFETIME_MS, "ms"),
                            v -> GboardTypingEffectsSettings.writeParticleLifetimeMs(preferences, v))));
            physicsRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    particleSpeedTitle,
                    particleSpeedSummary,
                    formatUnit(cfg.particleSpeedPercent, GboardTypingEffectsSettings.DEFAULT_PARTICLE_SPEED_PERCENT, "%"),
                    anyParticle,
                    () -> showIntSliderDialog(
                            host,
                            particleSpeedTitle,
                            particleSpeedSummary,
                            GboardTypingEffectsSettings.MIN_PARTICLE_SPEED_PERCENT,
                            GboardTypingEffectsSettings.MAX_PARTICLE_SPEED_PERCENT,
                            PARTICLE_SPEED_STEP_PERCENT,
                            GboardTypingEffectsSettings.DEFAULT_PARTICLE_SPEED_PERCENT,
                            cfg.particleSpeedPercent,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_PARTICLE_SPEED_PERCENT, "%"),
                            v -> GboardTypingEffectsSettings.writeParticleSpeedPercent(preferences, v))));

            // 6. Key Touch Glow (Toggle + style + duration)
            List<GboardPatchesSettingsContract.Row> keyGlowRows = new ArrayList<GboardPatchesSettingsContract.Row>(3);
            keyGlowRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    keyHighlightTitle,
                    keyHighlightSummary,
                    master,
                    cfg.keyHighlightEnabled,
                    checked -> saveBoolAndRefresh(host,
                            GboardTypingEffectsSettings.writeKeyHighlightEnabled(preferences, checked))));
            keyGlowRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    keyHighlightStyleTitle,
                    keyHighlightStyleSummary,
                    labelForValue(keyHighlightStyleLabels, keyHighlightStyleValues, cfg.keyHighlightStyle),
                    keyGlowActive,
                    () -> GboardPatchesSettingsContract.showSingleChoiceDialog(
                            host,
                            keyHighlightStyleTitle,
                            keyHighlightStyleLabels,
                            keyHighlightStyleValues,
                            cfg.keyHighlightStyle,
                            selected -> saveAndRefresh(host,
                                    GboardTypingEffectsSettings.writeKeyHighlightStyle(preferences, selected)))));
            keyGlowRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    keyHighlightDurationTitle,
                    keyHighlightDurationSummary,
                    formatUnit(cfg.keyHighlightDurationMs,
                            GboardTypingEffectsSettings.DEFAULT_KEY_HIGHLIGHT_DURATION_MS, "ms"),
                    keyGlowActive,
                    () -> showIntSliderDialog(
                            host,
                            keyHighlightDurationTitle,
                            keyHighlightDurationSummary,
                            GboardTypingEffectsSettings.MIN_KEY_HIGHLIGHT_DURATION_MS,
                            GboardTypingEffectsSettings.MAX_KEY_HIGHLIGHT_DURATION_MS,
                            KEY_HIGHLIGHT_DURATION_STEP_MS,
                            GboardTypingEffectsSettings.DEFAULT_KEY_HIGHLIGHT_DURATION_MS,
                            cfg.keyHighlightDurationMs,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_KEY_HIGHLIGHT_DURATION_MS, "ms"),
                            v -> GboardTypingEffectsSettings.writeKeyHighlightDurationMs(preferences, v))));

            // 7. Trampoline Keyboard Warp (Toggle + strength + radius)
            List<GboardPatchesSettingsContract.Row> warpRows = new ArrayList<GboardPatchesSettingsContract.Row>(3);
            warpRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    keyboardWarpTitle,
                    keyboardWarpSummary,
                    master,
                    cfg.keyboardWarpEnabled,
                    checked -> saveBoolAndRefresh(host,
                            GboardTypingEffectsSettings.writeKeyboardWarpEnabled(preferences, checked))));
            warpRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    warpStrengthTitle,
                    warpStrengthSummary,
                    formatUnit(cfg.warpStrengthPercent,
                            GboardTypingEffectsSettings.DEFAULT_WARP_STRENGTH_PERCENT, "%"),
                    warpActive,
                    () -> showIntSliderDialog(
                            host,
                            warpStrengthTitle,
                            warpStrengthSummary,
                            GboardTypingEffectsSettings.MIN_WARP_STRENGTH_PERCENT,
                            GboardTypingEffectsSettings.MAX_WARP_STRENGTH_PERCENT,
                            WARP_STRENGTH_STEP_PERCENT,
                            GboardTypingEffectsSettings.DEFAULT_WARP_STRENGTH_PERCENT,
                            cfg.warpStrengthPercent,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_WARP_STRENGTH_PERCENT, "%"),
                            v -> GboardTypingEffectsSettings.writeWarpStrengthPercent(preferences, v))));
            warpRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    warpRadiusTitle,
                    warpRadiusSummary,
                    formatUnit(cfg.warpRadiusDp,
                            GboardTypingEffectsSettings.DEFAULT_WARP_RADIUS_DP, "dp"),
                    warpActive,
                    () -> showIntSliderDialog(
                            host,
                            warpRadiusTitle,
                            warpRadiusSummary,
                            GboardTypingEffectsSettings.MIN_WARP_RADIUS_DP,
                            GboardTypingEffectsSettings.MAX_WARP_RADIUS_DP,
                            WARP_RADIUS_STEP_DP,
                            GboardTypingEffectsSettings.DEFAULT_WARP_RADIUS_DP,
                            cfg.warpRadiusDp,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_WARP_RADIUS_DP, "dp"),
                            v -> GboardTypingEffectsSettings.writeWarpRadiusDp(preferences, v))));

            // 8. Swipe Wind (Toggle + intensity + spread radius)
            List<GboardPatchesSettingsContract.Row> windRows = new ArrayList<GboardPatchesSettingsContract.Row>(3);
            windRows.add(new GboardPatchesSettingsContract.SwitchRow(
                    windTitle,
                    windSummary,
                    master,
                    cfg.windEnabled,
                    checked -> saveBoolAndRefresh(host,
                            GboardTypingEffectsSettings.writeWindEnabled(preferences, checked))));
            windRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    windIntensityTitle,
                    windIntensitySummary,
                    formatUnit(cfg.windIntensity, GboardTypingEffectsSettings.DEFAULT_WIND_INTENSITY, "/10"),
                    windActive,
                    () -> showIntSliderDialog(
                            host,
                            windIntensityTitle,
                            windIntensitySummary,
                            GboardTypingEffectsSettings.MIN_WIND_INTENSITY,
                            GboardTypingEffectsSettings.MAX_WIND_INTENSITY,
                            WIND_INTENSITY_STEP,
                            GboardTypingEffectsSettings.DEFAULT_WIND_INTENSITY,
                            cfg.windIntensity,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_WIND_INTENSITY, "/10"),
                            v -> GboardTypingEffectsSettings.writeWindIntensity(preferences, v))));
            windRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    windSpreadTitle,
                    windSpreadSummary,
                    formatUnit(cfg.windSpreadDp, GboardTypingEffectsSettings.DEFAULT_WIND_SPREAD_DP, "dp"),
                    windActive,
                    () -> showIntSliderDialog(
                            host,
                            windSpreadTitle,
                            windSpreadSummary,
                            GboardTypingEffectsSettings.MIN_WIND_SPREAD_DP,
                            GboardTypingEffectsSettings.MAX_WIND_SPREAD_DP,
                            WIND_SPREAD_STEP_DP,
                            GboardTypingEffectsSettings.DEFAULT_WIND_SPREAD_DP,
                            cfg.windSpreadDp,
                            v -> formatUnit(v, GboardTypingEffectsSettings.DEFAULT_WIND_SPREAD_DP, "dp"),
                            v -> GboardTypingEffectsSettings.writeWindSpreadDp(preferences, v))));

            // 9. Reset to defaults
            List<GboardPatchesSettingsContract.Row> resetRows = Collections.singletonList(
                    new GboardPatchesSettingsContract.DangerRow(
                            resetTitle,
                            resetSummary,
                            true,
                            () -> {
                                GboardTypingEffectsSettings.resetToDefaults(preferences);
                                GboardPatchesSettingsContract.refresh(host);
                                GboardPatchesSettingsContract.showMessage(host, resetDone);
                            },
                            resetConfirmTitle,
                            resetConfirmMessage));

            return new GboardPatchesSettingsContract.Screen(
                    title,
                    null,
                    title,
                    summary,
                    Collections.emptyList(),
                    Arrays.asList(
                            new GboardPatchesSettingsContract.Section(sectionGeneral, generalRows),
                            new GboardPatchesSettingsContract.Section(sectionTrail, trailRows),
                            new GboardPatchesSettingsContract.Section(sectionGlitter, glitterRows),
                            new GboardPatchesSettingsContract.Section(sectionWind, windRows),
                            new GboardPatchesSettingsContract.Section(sectionExplosions, explosionRows),
                            new GboardPatchesSettingsContract.Section(sectionParticlePhysics, physicsRows),
                            new GboardPatchesSettingsContract.Section(sectionKeyGlow, keyGlowRows),
                            new GboardPatchesSettingsContract.Section(sectionWarp, warpRows),
                            new GboardPatchesSettingsContract.Section(
                                    null,
                                    null,
                                    GboardPatchesSettingsContract.SectionStyle.ADVANCED,
                                    resetRows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to render Typing Effects settings screen", throwable);
            } catch (Throwable ignored) {
            }
            return buildErrorScreen();
        }
    }

    private void showIntSliderDialog(
            GboardPatchesSettingsContract.FeatureHost host,
            String dialogTitle,
            String description,
            int min,
            int max,
            int step,
            int defaultValue,
            int currentValue,
            IntFormatter formatter,
            IntSaver saver) {
        int totalSteps = Math.max(1, (max - min) / step);
        int initialProgress = sliderStepForInt(currentValue, min, max, step);
        int defaultProgress = sliderStepForInt(defaultValue, min, max, step);
        GboardPatchesSettingsContract.showSliderDialog(
                host,
                dialogTitle,
                description,
                totalSteps,
                initialProgress,
                defaultProgress,
                Integer.toString(min),
                Integer.toString(max),
                p -> formatter.format(intValueForSliderStep(p, min, max, step)),
                p -> {
                    int value = intValueForSliderStep(p, min, max, step);
                    if (!saver.save(value)) {
                        throw new IllegalStateException("Failed to persist " + dialogTitle);
                    }
                    GboardPatchesSettingsContract.refresh(host);
                });
    }

    private String formatUnit(int value, int defaultValue, String unit) {
        String formatted;
        if (unit.isEmpty()) {
            formatted = Integer.toString(value);
        } else if ("%".equals(unit) || "/10".equals(unit)) {
            formatted = value + unit;
        } else {
            formatted = value + " " + unit;
        }
        if (value == defaultValue) {
            return String.format(Locale.US, defaultValueTemplate, formatted);
        }
        return formatted;
    }

    private static String labelForValue(String[] labels, String[] values, String currentValue) {
        for (int i = 0; i < values.length; i++) {
            if (values[i].equals(currentValue)) {
                return labels[i];
            }
        }
        return labels[0];
    }

    private static void saveBoolAndRefresh(
            GboardPatchesSettingsContract.FeatureHost host,
            boolean ok) {
        if (!ok) {
            throw new IllegalStateException("Failed to persist Typing Effects toggle");
        }
        GboardPatchesSettingsContract.refresh(host);
    }

    private static void saveAndRefresh(
            GboardPatchesSettingsContract.FeatureHost host,
            boolean ok) {
        if (!ok) {
            throw new IllegalStateException("Failed to persist Typing Effects setting");
        }
        GboardPatchesSettingsContract.refresh(host);
    }

    static int sliderStepForInt(int value, int min, int max, int step) {
        int clamped = GboardTypingEffectsSettings.clamp(value, min, max);
        int totalSteps = Math.max(1, (max - min) / step);
        return GboardTypingEffectsSettings.clamp(Math.round((float) (clamped - min) / step), 0, totalSteps);
    }

    static int intValueForSliderStep(int progress, int min, int max, int step) {
        int totalSteps = Math.max(1, (max - min) / step);
        int clampedStep = GboardTypingEffectsSettings.clamp(progress, 0, totalSteps);
        return GboardTypingEffectsSettings.clamp(min + clampedStep * step, min, max);
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen() {
        return new GboardPatchesSettingsContract.Screen(
                title,
                null,
                title,
                summary,
                Collections.singletonList(new GboardPatchesSettingsContract.StatusBlock(
                        errorTitle,
                        errorSummary,
                        GboardPatchesSettingsContract.StatusTone.WARNING)),
                Collections.emptyList());
    }

    private static String text(Context context, int id) {
        return GboardSettingsText.get(context, id);
    }
}
