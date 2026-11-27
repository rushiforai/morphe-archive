package dev.srwi.gintype.extension.thicctopbar;

import android.content.Context;
import android.content.SharedPreferences;
import dev.srwi.gintype.extension.R;
import dev.srwi.gintype.extension.settings.GboardPatchesFeatureAvailability;
import dev.srwi.gintype.extension.settings.GboardPatchesIcons;
import dev.srwi.gintype.extension.settings.GboardPatchesSettings;
import dev.srwi.gintype.extension.settings.GboardPatchesSettingsContract;
import dev.srwi.gintype.extension.settings.GboardSettingsText;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Settings screen and controls for Thicc Top Bar. */
public final class GboardThiccTopBarSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final float FACTOR_SLIDER_STEP = 0.05f;
    private static final int TOPBAR_SCALE_TOTAL_STEPS = Math.round(
            (GboardThiccTopBarSettings.MAX_TOPBAR_SCALE
                    - GboardThiccTopBarSettings.MIN_TOPBAR_SCALE) / FACTOR_SLIDER_STEP);
    private static final int SWIPE_SENSITIVITY_TOTAL_STEPS = Math.round(
            (GboardThiccTopBarSettings.MAX_SWIPE_SENSITIVITY
                    - GboardThiccTopBarSettings.MIN_SWIPE_SENSITIVITY) / FACTOR_SLIDER_STEP);

    private interface FloatValueWriter {
        void write(Context context, float value);
    }

    private final String title;
    private final String summary;
    private final String sectionTitle;
    private final String enableTitle;
    private final String topbarScaleTitle;
    private final String topbarScaleSummary;
    private final String swipeSensitivityTitle;
    private final String swipeSensitivitySummary;
    private final String topbarScaleValueTemplate;
    private final String topbarScaleDefaultTemplate;
    private final String invertSwipeTitle;
    private final String invertSwipeSummary;
    private final String multiWordSelectTitle;
    private final String multiWordSelectSummary;
    private final String errorTitle;
    private final String errorSummary;

    public GboardThiccTopBarSettingsFeature(Context context) {
        title = GboardSettingsText.get(context, R.string.gboard_patches_thicc_top_bar_title);
        summary = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_summary);
        sectionTitle = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_section);
        enableTitle = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_enable_title);
        topbarScaleTitle = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_topbar_scale_title);
        topbarScaleSummary = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_topbar_scale_summary);
        swipeSensitivityTitle = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_swipe_sensitivity_title);
        swipeSensitivitySummary = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_swipe_sensitivity_summary);
        topbarScaleValueTemplate = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_topbar_scale_value);
        topbarScaleDefaultTemplate = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_topbar_scale_value_default);
        invertSwipeTitle = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_invert_swipe_title);
        invertSwipeSummary = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_invert_swipe_summary);
        multiWordSelectTitle = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_multi_word_select_title);
        multiWordSelectSummary = GboardSettingsText.get(
                context, R.string.gboard_patches_thicc_top_bar_multi_word_select_summary);
        errorTitle = GboardSettingsText.get(
                context, R.string.gboard_patches_error_header_title);
        errorSummary = GboardSettingsText.get(
                context, R.string.gboard_patches_error_header_summary);
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
        return GboardPatchesIcons.TOP_BAR;
    }

    @Override
    public String getEntryTone() {
        return "teal";
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_THICC_TOP_BAR);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            Context context = host.getContext();
            SharedPreferences preferences = GboardPatchesSettings.preferences(context);
            GboardThiccTopBarSettings.ensureDefaults(preferences);
            boolean enabled = GboardThiccTopBarSettings.readEnabled(preferences);
            float topbarScale = GboardThiccTopBarSettings.readTopbarScale(preferences);
            float swipeSensitivity = GboardThiccTopBarSettings.readSwipeSensitivity(preferences);
            boolean invertSwipe = GboardThiccTopBarSettings.readInvertSwipe(preferences);
            boolean multiWordSelect =
                    GboardThiccTopBarSettings.readDoubleTapMultiWordSelect(preferences);

            List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
            rows.add(new GboardPatchesSettingsContract.ToggleRow(
                    enableTitle,
                    summary,
                    true,
                    enabled,
                    newValue -> {
                        GboardThiccTopBarSettings.writeEnabled(context, newValue);
                        GboardThiccTopBarRuntime.syncAllHeaderHeights(context);
                        GboardPatchesSettingsContract.refresh(host);
                    }));
            rows.add(new GboardPatchesSettingsContract.SelectorRow(
                    topbarScaleTitle,
                    topbarScaleSummary,
                    formatFactor(topbarScale, GboardThiccTopBarSettings.DEFAULT_TOPBAR_SCALE),
                    enabled,
                    () -> showTopbarScaleDialog(host, topbarScale)));
            rows.add(new GboardPatchesSettingsContract.SelectorRow(
                    swipeSensitivityTitle,
                    swipeSensitivitySummary,
                    formatFactor(
                            swipeSensitivity,
                            GboardThiccTopBarSettings.DEFAULT_SWIPE_SENSITIVITY),
                    enabled,
                    () -> showSwipeSensitivityDialog(host, swipeSensitivity)));
            rows.add(new GboardPatchesSettingsContract.ToggleRow(
                    invertSwipeTitle,
                    invertSwipeSummary,
                    enabled,
                    invertSwipe,
                    newValue -> {
                        GboardThiccTopBarSettings.writeInvertSwipe(context, newValue);
                        GboardThiccTopBarRuntime.syncAllHeaderHeights(context);
                        GboardPatchesSettingsContract.refresh(host);
                    }));
            rows.add(new GboardPatchesSettingsContract.ToggleRow(
                    multiWordSelectTitle,
                    multiWordSelectSummary,
                    enabled,
                    multiWordSelect,
                    newValue -> {
                        GboardThiccTopBarSettings.writeDoubleTapMultiWordSelect(context, newValue);
                        GboardThiccTopBarRuntime.syncAllHeaderHeights(context);
                        GboardPatchesSettingsContract.refresh(host);
                    }));

            return new GboardPatchesSettingsContract.Screen(
                    title,
                    null,
                    title,
                    summary,
                    Collections.emptyList(),
                    Collections.singletonList(
                            new GboardPatchesSettingsContract.Section(sectionTitle, rows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable ignored) {
            return buildErrorScreen();
        }
    }

    private void showTopbarScaleDialog(
            GboardPatchesSettingsContract.FeatureHost host,
            float currentValue) {
        showFactorSliderDialog(
                host,
                topbarScaleTitle,
                topbarScaleSummary,
                currentValue,
                GboardThiccTopBarSettings.MIN_TOPBAR_SCALE,
                GboardThiccTopBarSettings.MAX_TOPBAR_SCALE,
                GboardThiccTopBarSettings.DEFAULT_TOPBAR_SCALE,
                TOPBAR_SCALE_TOTAL_STEPS,
                GboardThiccTopBarSettings::writeTopbarScale);
    }

    private void showSwipeSensitivityDialog(
            GboardPatchesSettingsContract.FeatureHost host,
            float currentValue) {
        showFactorSliderDialog(
                host,
                swipeSensitivityTitle,
                swipeSensitivitySummary,
                currentValue,
                GboardThiccTopBarSettings.MIN_SWIPE_SENSITIVITY,
                GboardThiccTopBarSettings.MAX_SWIPE_SENSITIVITY,
                GboardThiccTopBarSettings.DEFAULT_SWIPE_SENSITIVITY,
                SWIPE_SENSITIVITY_TOTAL_STEPS,
                GboardThiccTopBarSettings::writeSwipeSensitivity);
    }

    private void showFactorSliderDialog(
            GboardPatchesSettingsContract.FeatureHost host,
            String dialogTitle,
            String description,
            float currentValue,
            float minValue,
            float maxValue,
            float defaultValue,
            int totalSteps,
            FloatValueWriter writer) {
        Context context = host.getContext();
        if (context == null) {
            return;
        }
        int initialProgress = valueToStep(currentValue, minValue, maxValue, defaultValue, totalSteps);
        int defaultProgress = valueToStep(defaultValue, minValue, maxValue, defaultValue, totalSteps);
        GboardPatchesSettingsContract.showSliderDialog(
                host,
                dialogTitle,
                description,
                totalSteps,
                initialProgress,
                defaultProgress,
                String.format(topbarScaleValueTemplate, minValue),
                String.format(topbarScaleValueTemplate, maxValue),
                step -> formatFactor(
                        stepToValue(step, minValue, maxValue, totalSteps), defaultValue),
                step -> {
                    writer.write(context, stepToValue(step, minValue, maxValue, totalSteps));
                    GboardThiccTopBarRuntime.syncAllHeaderHeights(context);
                });
    }

    private String formatFactor(float value, float defaultValue) {
        if (Math.abs(value - defaultValue) < 0.001f) {
            return String.format(topbarScaleDefaultTemplate, value);
        }
        return String.format(topbarScaleValueTemplate, value);
    }

    private static int valueToStep(
            float value, float minValue, float maxValue, float defaultValue, int totalSteps) {
        float clamped = Float.isFinite(value)
                ? Math.max(minValue, Math.min(maxValue, value))
                : defaultValue;
        int step = Math.round((clamped - minValue) / FACTOR_SLIDER_STEP);
        return Math.max(0, Math.min(totalSteps, step));
    }

    private static float stepToValue(int step, float minValue, float maxValue, int totalSteps) {
        int clamped = Math.max(0, Math.min(totalSteps, step));
        return Math.max(minValue, Math.min(maxValue, minValue + clamped * FACTOR_SLIDER_STEP));
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
                Collections.emptyList(),
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT);
    }
}
