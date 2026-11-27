package dev.srwi.gintype.extension.multiglide;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import dev.srwi.gintype.extension.R;
import dev.srwi.gintype.extension.settings.GboardPatchesFeatureAvailability;
import dev.srwi.gintype.extension.settings.GboardPatchesSettings;
import dev.srwi.gintype.extension.settings.GboardPatchesSettingsContract;
import dev.srwi.gintype.extension.settings.GboardSettingsText;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/** Sub-page for tuning Kinetica decoder algorithm parameters and resetting them to defaults. */
public final class GboardKineticaSettingsFeature implements GboardPatchesSettingsContract.Feature {

    private static final String TAG = "GboardPatches";
    private static final int BEAM_WIDTH_STEP = 16;
    private static final float FREQ_WEIGHT_FLOOR_STEP = 0.01f;
    private static final float GEO_EXPONENT_STEP = 0.05f;
    private static final float BEAM_FREQ_WEIGHT_STEP = 0.05f;
    private static final float FLOAT_MATCH_EPS = 0.0005f;

    private interface IntSaver {
        boolean save(int value);
    }

    private interface FloatSaver {
        boolean save(float value);
    }

    private final String title;
    private final String summary;
    private final String headerSummary;
    private final String sectionParameters;
    private final String beamWidthTitle;
    private final String beamWidthSummary;
    private final String freqWeightFloorTitle;
    private final String freqWeightFloorSummary;
    private final String geoExponentTitle;
    private final String geoExponentSummary;
    private final String beamFreqWeightTitle;
    private final String beamFreqWeightSummary;
    private final String defaultValueTemplate;
    private final String resetTitle;
    private final String resetSummary;
    private final String resetConfirmTitle;
    private final String resetConfirmMessage;
    private final String resetDone;
    private final String errorTitle;
    private final String errorSummary;

    public GboardKineticaSettingsFeature(Context context) {
        title = text(context, R.string.gboard_patches_kinetica_title);
        summary = text(context, R.string.gboard_patches_kinetica_summary);
        headerSummary = text(context, R.string.gboard_patches_kinetica_header_summary);
        sectionParameters = text(context, R.string.gboard_patches_kinetica_section_parameters);
        beamWidthTitle = text(context, R.string.gboard_patches_multiglide_beam_width_title);
        beamWidthSummary = text(context, R.string.gboard_patches_multiglide_beam_width_summary);
        freqWeightFloorTitle = text(context, R.string.gboard_patches_multiglide_freq_weight_floor_title);
        freqWeightFloorSummary =
                text(context, R.string.gboard_patches_multiglide_freq_weight_floor_summary);
        geoExponentTitle = text(context, R.string.gboard_patches_multiglide_geo_exponent_title);
        geoExponentSummary = text(context, R.string.gboard_patches_multiglide_geo_exponent_summary);
        beamFreqWeightTitle = text(context, R.string.gboard_patches_multiglide_beam_freq_weight_title);
        beamFreqWeightSummary =
                text(context, R.string.gboard_patches_multiglide_beam_freq_weight_summary);
        defaultValueTemplate = text(context, R.string.gboard_patches_multiglide_value_default);
        resetTitle = text(context, R.string.gboard_patches_kinetica_reset_title);
        resetSummary = text(context, R.string.gboard_patches_kinetica_reset_summary);
        resetConfirmTitle = text(context, R.string.gboard_patches_kinetica_reset_confirm_title);
        resetConfirmMessage = text(context, R.string.gboard_patches_kinetica_reset_confirm_message);
        resetDone = text(context, R.string.gboard_patches_kinetica_reset_done);
        errorTitle = text(context, R.string.gboard_patches_multiglide_error_title);
        errorSummary = text(context, R.string.gboard_patches_multiglide_error_summary);
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
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_MULTIGLIDE);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            SharedPreferences preferences = GboardPatchesSettings.preferences(host.getContext());
            GboardMultiGlideSettings.ensureDefaults(preferences);
            GboardMultiGlideSettings.syncDecoderConstants(preferences);

            boolean multiGlideEnabled = GboardMultiGlideSettings.readEnabled(preferences);
            int beamWidth = GboardMultiGlideSettings.readBeamWidth(preferences);
            float freqWeightFloor = GboardMultiGlideSettings.readFreqWeightFloor(preferences);
            float geoExponent = GboardMultiGlideSettings.readGeoExponent(preferences);
            float beamFreqWeight = GboardMultiGlideSettings.readBeamFreqWeight(preferences);

            List<GboardPatchesSettingsContract.Row> parameterRows = new ArrayList<>(4);
            parameterRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    beamWidthTitle,
                    beamWidthSummary,
                    formatBeamWidthLabel(beamWidth),
                    multiGlideEnabled,
                    () -> showIntSliderDialog(
                            host,
                            beamWidthTitle,
                            beamWidthSummary,
                            GboardMultiGlideSettings.MIN_BEAM_WIDTH,
                            GboardMultiGlideSettings.MAX_BEAM_WIDTH,
                            BEAM_WIDTH_STEP,
                            GboardMultiGlideSettings.DEFAULT_BEAM_WIDTH,
                            beamWidth,
                            v -> syncAfterSave(preferences,
                                    GboardMultiGlideSettings.writeBeamWidth(preferences, v)))));
            parameterRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    freqWeightFloorTitle,
                    freqWeightFloorSummary,
                    formatFloatLabel(freqWeightFloor, GboardMultiGlideSettings.DEFAULT_FREQ_WEIGHT_FLOOR),
                    multiGlideEnabled,
                    () -> showFloatSliderDialog(
                            host,
                            freqWeightFloorTitle,
                            freqWeightFloorSummary,
                            GboardMultiGlideSettings.MIN_FREQ_WEIGHT_FLOOR,
                            GboardMultiGlideSettings.MAX_FREQ_WEIGHT_FLOOR,
                            FREQ_WEIGHT_FLOOR_STEP,
                            GboardMultiGlideSettings.DEFAULT_FREQ_WEIGHT_FLOOR,
                            freqWeightFloor,
                            v -> syncAfterSave(preferences,
                                    GboardMultiGlideSettings.writeFreqWeightFloor(preferences, v)))));
            parameterRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    geoExponentTitle,
                    geoExponentSummary,
                    formatFloatLabel(geoExponent, GboardMultiGlideSettings.DEFAULT_GEO_EXPONENT),
                    multiGlideEnabled,
                    () -> showFloatSliderDialog(
                            host,
                            geoExponentTitle,
                            geoExponentSummary,
                            GboardMultiGlideSettings.MIN_GEO_EXPONENT,
                            GboardMultiGlideSettings.MAX_GEO_EXPONENT,
                            GEO_EXPONENT_STEP,
                            GboardMultiGlideSettings.DEFAULT_GEO_EXPONENT,
                            geoExponent,
                            v -> syncAfterSave(preferences,
                                    GboardMultiGlideSettings.writeGeoExponent(preferences, v)))));
            parameterRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    beamFreqWeightTitle,
                    beamFreqWeightSummary,
                    formatFloatLabel(beamFreqWeight, GboardMultiGlideSettings.DEFAULT_BEAM_FREQ_WEIGHT),
                    multiGlideEnabled,
                    () -> showFloatSliderDialog(
                            host,
                            beamFreqWeightTitle,
                            beamFreqWeightSummary,
                            GboardMultiGlideSettings.MIN_BEAM_FREQ_WEIGHT,
                            GboardMultiGlideSettings.MAX_BEAM_FREQ_WEIGHT,
                            BEAM_FREQ_WEIGHT_STEP,
                            GboardMultiGlideSettings.DEFAULT_BEAM_FREQ_WEIGHT,
                            beamFreqWeight,
                            v -> syncAfterSave(preferences,
                                    GboardMultiGlideSettings.writeBeamFreqWeight(preferences, v)))));

            List<GboardPatchesSettingsContract.Row> resetRows = Collections.singletonList(
                    new GboardPatchesSettingsContract.DangerRow(
                            resetTitle,
                            resetSummary,
                            true,
                            () -> {
                                GboardMultiGlideSettings.resetDecoderToDefaults(preferences);
                                GboardPatchesSettingsContract.refresh(host);
                                GboardPatchesSettingsContract.showMessage(host, resetDone);
                            },
                            resetConfirmTitle,
                            resetConfirmMessage));

            return new GboardPatchesSettingsContract.Screen(
                    title,
                    null,
                    title,
                    headerSummary,
                    Collections.emptyList(),
                    Arrays.asList(
                            new GboardPatchesSettingsContract.Section(
                                    sectionParameters, parameterRows),
                            new GboardPatchesSettingsContract.Section(
                                    null,
                                    null,
                                    GboardPatchesSettingsContract.SectionStyle.ADVANCED,
                                    resetRows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to render Kinetica settings screen", throwable);
            } catch (Throwable ignored) {
                // Fallback error screen below handles recovery.
            }
            return buildErrorScreen();
        }
    }

    private static boolean syncAfterSave(SharedPreferences preferences, boolean ok) {
        if (ok) {
            GboardMultiGlideSettings.syncDecoderConstants(preferences);
        }
        return ok;
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
            IntSaver saver) {
        int totalSteps = Math.max(1, (max - min) / step);
        int initialProgress = GboardMultiGlideSettingsFeature.sliderStepForInt(
                currentValue, min, max, step);
        int defaultProgress = GboardMultiGlideSettingsFeature.sliderStepForInt(
                defaultValue, min, max, step);
        GboardPatchesSettingsContract.showSliderDialog(
                host,
                dialogTitle,
                description,
                totalSteps,
                initialProgress,
                defaultProgress,
                Integer.toString(min),
                Integer.toString(max),
                p -> formatBeamWidthLabel(
                        GboardMultiGlideSettingsFeature.intValueForSliderStep(p, min, max, step)),
                p -> {
                    int value = GboardMultiGlideSettingsFeature.intValueForSliderStep(
                            p, min, max, step);
                    if (!saver.save(value)) {
                        throw new IllegalStateException("Failed to persist " + dialogTitle);
                    }
                });
    }

    private void showFloatSliderDialog(
            GboardPatchesSettingsContract.FeatureHost host,
            String dialogTitle,
            String description,
            float min,
            float max,
            float step,
            float defaultValue,
            float currentValue,
            FloatSaver saver) {
        int totalSteps = Math.max(1, Math.round((max - min) / step));
        int initialProgress = GboardMultiGlideSettingsFeature.sliderStepForFloat(
                currentValue, min, max, step);
        int defaultProgress = GboardMultiGlideSettingsFeature.sliderStepForFloat(
                defaultValue, min, max, step);
        GboardPatchesSettingsContract.showSliderDialog(
                host,
                dialogTitle,
                description,
                totalSteps,
                initialProgress,
                defaultProgress,
                String.format(Locale.US, "%.2f", min),
                String.format(Locale.US, "%.2f", max),
                p -> formatFloatLabel(
                        GboardMultiGlideSettingsFeature.floatValueForSliderStep(
                                p, min, max, step),
                        defaultValue),
                p -> {
                    float value = GboardMultiGlideSettingsFeature.floatValueForSliderStep(
                            p, min, max, step);
                    if (!saver.save(value)) {
                        throw new IllegalStateException("Failed to persist " + dialogTitle);
                    }
                });
    }

    private String formatBeamWidthLabel(int beamWidth) {
        String num = Integer.toString(beamWidth);
        if (beamWidth == GboardMultiGlideSettings.DEFAULT_BEAM_WIDTH) {
            return String.format(Locale.US, defaultValueTemplate, num);
        }
        return num;
    }

    private String formatFloatLabel(float value, float defaultValue) {
        String num = String.format(Locale.US, "%.2f", value);
        if (Math.abs(value - defaultValue) < FLOAT_MATCH_EPS) {
            return String.format(Locale.US, defaultValueTemplate, num);
        }
        return num;
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
