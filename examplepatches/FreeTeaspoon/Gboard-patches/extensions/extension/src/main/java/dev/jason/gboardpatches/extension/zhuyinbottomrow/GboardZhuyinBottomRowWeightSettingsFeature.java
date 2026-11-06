package dev.jason.gboardpatches.extension.zhuyinbottomrow;

import android.content.Context;
import android.util.Log;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardZhuyinBottomRowWeightSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String PREVIEW_IMAGE_ENABLED =
            "settings-previews/zhuyinbottomrow/enabled.png";

    private final String entryTitle;
    private final String headerBadge;
    private final String entrySummary;
    private final String headerSummary;
    private final String errorTitle;
    private final String errorSummary;
    private final String enabledTitle;
    private final String enabledSummary;
    private final String sectionBehavior;
    private final String sectionWeights;
    private final String sectionAdvanced;
    private final String applyRecommendedTitle;
    private final String applyRecommendedSummary;
    private final String applyRecommendedConfirmTitle;
    private final String applyRecommendedConfirmMessage;
    private final String resetTitle;
    private final String resetSummary;
    private final String resetConfirmTitle;
    private final String resetConfirmMessage;
    private final String dialogHint;
    private final String dialogError;
    private final String switchToSymbolTitle;
    private final String a02Title;
    private final String switchToNextLanguageTitle;
    private final String spaceTitle;
    private final String a06Title;
    private final String a08Title;
    private final String imeActionTitle;
    private final String weightSummaryTemplate;
    private final String weightValueTemplate;
    private final String weightValueDefaultTemplate;
    private final String dialogTitleTemplate;

    public GboardZhuyinBottomRowWeightSettingsFeature(Context context) {
        entryTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_title);
        headerBadge = GboardSettingsText.get(context,
                R.string.gboard_patches_header_badge);
        entrySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_summary);
        headerSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_header_summary);
        errorTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_error_title);
        errorSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_error_summary);
        enabledTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_enabled_title);
        enabledSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_enabled_summary);
        sectionBehavior = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_section_behavior);
        sectionWeights = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_section_weights);
        sectionAdvanced = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_section_advanced);
        applyRecommendedTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_apply_recommended_title);
        applyRecommendedSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_apply_recommended_summary);
        applyRecommendedConfirmTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_apply_recommended_confirm_title);
        applyRecommendedConfirmMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_apply_recommended_confirm_message);
        resetTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_reset_title);
        resetSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_reset_summary);
        resetConfirmTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_reset_confirm_title);
        resetConfirmMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_reset_confirm_message);
        dialogHint = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_dialog_hint);
        dialogError = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_dialog_error);
        switchToSymbolTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_switch_to_symbol_title);
        a02Title = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_a02_title);
        switchToNextLanguageTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_switch_to_next_language_title);
        spaceTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_space_title);
        a06Title = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_a06_title);
        a08Title = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_a08_title);
        imeActionTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_ime_action_title);
        weightSummaryTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_summary);
        weightValueTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_value);
        weightValueDefaultTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_value_default);
        dialogTitleTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_dialog_title);
    }

    @Override
    public String getEntryTitle() {
        return entryTitle;
    }

    @Override
    public String getEntrySummary() {
        return entrySummary;
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context,
                GboardPatchesFeatureAvailability.FEATURE_ZHUYIN_BOTTOM_ROW_WEIGHT);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            Context context = host.getContext();
            GboardZhuyinBottomRowWeightSettings.ensureDefaults(context);
            GboardZhuyinBottomRowWeightSettings.SettingsSnapshot snapshot =
                    new GboardZhuyinBottomRowWeightSettings.SettingsSnapshot(
                            GboardZhuyinBottomRowWeightSettings.readEnabled(
                                    GboardZhuyinBottomRowWeightSettings.preferences(context)),
                            GboardZhuyinBottomRowWeightSettings.readWeightSwitchToSymbol(
                                    GboardZhuyinBottomRowWeightSettings.preferences(context)),
                            GboardZhuyinBottomRowWeightSettings.readWeightA02(
                                    GboardZhuyinBottomRowWeightSettings.preferences(context)),
                            GboardZhuyinBottomRowWeightSettings.readWeightSwitchToNextLanguage(
                                    GboardZhuyinBottomRowWeightSettings.preferences(context)),
                            GboardZhuyinBottomRowWeightSettings.readWeightSpace(
                                    GboardZhuyinBottomRowWeightSettings.preferences(context)),
                            GboardZhuyinBottomRowWeightSettings.readWeightA06(
                                    GboardZhuyinBottomRowWeightSettings.preferences(context)),
                            GboardZhuyinBottomRowWeightSettings.readWeightA08(
                                    GboardZhuyinBottomRowWeightSettings.preferences(context)),
                            GboardZhuyinBottomRowWeightSettings.readWeightImeAction(
                                    GboardZhuyinBottomRowWeightSettings.preferences(context)));

            List<GboardPatchesSettingsContract.Row> behaviorRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            behaviorRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    enabledTitle,
                    enabledSummary,
                    true,
                    snapshot.enabled,
                    value -> GboardZhuyinBottomRowWeightSettings.writeEnabled(context, value),
                    buildEnabledPreview()));

            boolean subordinateRowsEnabled = snapshot.enabled;
            List<GboardPatchesSettingsContract.Row> weightRows = Arrays.asList(
                    buildWeightRow(host, switchToSymbolTitle, subordinateRowsEnabled,
                            GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_SWITCH_TO_SYMBOL,
                            snapshot.switchToSymbolWeight,
                            GboardZhuyinBottomRowWeightSettings::writeWeightSwitchToSymbol),
                    buildWeightRow(host, a02Title, subordinateRowsEnabled,
                            GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_A02,
                            snapshot.a02Weight,
                            GboardZhuyinBottomRowWeightSettings::writeWeightA02),
                    buildWeightRow(host, switchToNextLanguageTitle, subordinateRowsEnabled,
                            GboardZhuyinBottomRowWeightSettings
                                    .DEFAULT_WEIGHT_SWITCH_TO_NEXT_LANGUAGE,
                            snapshot.switchToNextLanguageWeight,
                            GboardZhuyinBottomRowWeightSettings::writeWeightSwitchToNextLanguage),
                    buildWeightRow(host, spaceTitle, subordinateRowsEnabled,
                            GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_SPACE,
                            snapshot.spaceWeight,
                            GboardZhuyinBottomRowWeightSettings::writeWeightSpace),
                    buildWeightRow(host, a06Title, subordinateRowsEnabled,
                            GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_A06,
                            snapshot.a06Weight,
                            GboardZhuyinBottomRowWeightSettings::writeWeightA06),
                    buildWeightRow(host, a08Title, subordinateRowsEnabled,
                            GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_A08,
                            snapshot.a08Weight,
                            GboardZhuyinBottomRowWeightSettings::writeWeightA08),
                    buildWeightRow(host, imeActionTitle, subordinateRowsEnabled,
                            GboardZhuyinBottomRowWeightSettings.DEFAULT_WEIGHT_IME_ACTION,
                            snapshot.imeActionWeight,
                            GboardZhuyinBottomRowWeightSettings::writeWeightImeAction));

            List<GboardPatchesSettingsContract.Row> advancedRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            advancedRows.add(new GboardPatchesSettingsContract.DangerRow(
                    applyRecommendedTitle,
                    applyRecommendedSummary,
                    subordinateRowsEnabled,
                    new ApplyRecommendedWeightsAction(host),
                    applyRecommendedConfirmTitle,
                    applyRecommendedConfirmMessage));
            advancedRows.add(new GboardPatchesSettingsContract.DangerRow(
                    resetTitle,
                    resetSummary,
                    subordinateRowsEnabled,
                    new ResetWeightsAction(host),
                    resetConfirmTitle,
                    resetConfirmMessage));

            return new GboardPatchesSettingsContract.Screen(
                    entryTitle,
                    headerBadge,
                    entryTitle,
                    headerSummary,
                    Collections.emptyList(),
                    Arrays.asList(
                            new GboardPatchesSettingsContract.Section(
                                    sectionBehavior,
                                    behaviorRows),
                            new GboardPatchesSettingsContract.Section(
                                    sectionWeights,
                                    weightRows),
                            new GboardPatchesSettingsContract.Section(
                                    sectionAdvanced,
                                    null,
                                    GboardPatchesSettingsContract.SectionStyle.ADVANCED,
                                    advancedRows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render Zhuyin bottom row weight settings screen", throwable);
            return buildErrorScreen();
        }
    }

    private GboardPatchesSettingsContract.Row buildWeightRow(
            GboardPatchesSettingsContract.FeatureHost host,
            String rowTitle,
            boolean enabled,
            int defaultWeight,
            int currentWeight,
            WeightWriter writer) {
        return new GboardPatchesSettingsContract.SelectorRow(
                rowTitle,
                weightSummary(defaultWeight),
                weightValue(currentWeight, defaultWeight),
                enabled,
                () -> showWeightDialog(host, rowTitle, currentWeight, writer));
    }

    private void showWeightDialog(GboardPatchesSettingsContract.FeatureHost host, String rowTitle,
            int currentWeight, WeightWriter writer) {
        if (host == null || host.getContext() == null || writer == null) {
            return;
        }
        GboardPatchesSettingsContract.showTextInputDialog(host,
                String.format(Locale.US, dialogTitleTemplate, rowTitle),
                dialogHint,
                Integer.toString(currentWeight),
                value -> {
                    int parsed = parseWeightValue(value);
                    if (!writer.write(host.getContext(), parsed)) {
                        throw new IllegalStateException("Failed to save Zhuyin bottom row weight");
                    }
                    safeRefresh(host);
                });
    }

    private int parseWeightValue(String value) {
        if (value == null) {
            throw new IllegalArgumentException(dialogError);
        }
        final int parsed;
        try {
            parsed = Integer.parseInt(value.trim());
        } catch (NumberFormatException exception) {
            throw new IllegalArgumentException(dialogError);
        }
        if (parsed < GboardZhuyinBottomRowWeightSettings.MIN_WEIGHT
                || parsed > GboardZhuyinBottomRowWeightSettings.MAX_WEIGHT) {
            throw new IllegalArgumentException(dialogError);
        }
        return parsed;
    }

    private String weightSummary(int defaultWeight) {
        return String.format(Locale.US, weightSummaryTemplate, defaultWeight);
    }

    private String weightValue(int currentWeight, int defaultWeight) {
        if (currentWeight == defaultWeight) {
            return String.format(Locale.US, weightValueDefaultTemplate, currentWeight);
        }
        return String.format(Locale.US, weightValueTemplate, currentWeight);
    }

    private GboardPatchesSettingsContract.PreviewSpec buildEnabledPreview() {
        return new GboardPatchesSettingsContract.PreviewSpec(
                entryTitle,
                "",
                new GboardPatchesSettingsContract.PreviewImage(
                        PREVIEW_IMAGE_ENABLED,
                        ""));
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen() {
        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks =
                new ArrayList<GboardPatchesSettingsContract.StatusBlock>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                errorTitle,
                errorSummary,
                GboardPatchesSettingsContract.StatusTone.WARNING));
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                headerBadge,
                entryTitle,
                headerSummary,
                statusBlocks,
                Collections.emptyList());
    }

    private interface WeightWriter {
        boolean write(Context context, int value);
    }

    private static final class ResetWeightsAction implements Runnable {
        private final GboardPatchesSettingsContract.FeatureHost host;

        ResetWeightsAction(GboardPatchesSettingsContract.FeatureHost host) {
            this.host = host;
        }

        @Override
        public void run() {
            if (host == null || host.getContext() == null) {
                return;
            }
            try {
                GboardZhuyinBottomRowWeightSettings.writeDefaultWeights(host.getContext());
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to reset Zhuyin bottom row weights", throwable);
            }
            safeRefresh(host);
        }
    }

    private static final class ApplyRecommendedWeightsAction implements Runnable {
        private final GboardPatchesSettingsContract.FeatureHost host;

        ApplyRecommendedWeightsAction(GboardPatchesSettingsContract.FeatureHost host) {
            this.host = host;
        }

        @Override
        public void run() {
            if (host == null || host.getContext() == null) {
                return;
            }
            try {
                GboardZhuyinBottomRowWeightSettings.writeRecommendedWeights(host.getContext());
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to apply recommended Zhuyin bottom row weights", throwable);
            }
            safeRefresh(host);
        }
    }

    private static void safeRefresh(GboardPatchesSettingsContract.FeatureHost host) {
        if (host == null) {
            return;
        }
        try {
            GboardPatchesSettingsContract.refresh(host);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to refresh Zhuyin bottom row weight settings", throwable);
        }
    }
}
