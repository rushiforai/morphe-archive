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
                R.string.gboard_patches_zhuyin_bottom_row_title,
                "Zhuyin Bottom Row Key Sizes");
        headerBadge = GboardSettingsText.get(context,
                R.string.gboard_patches_header_badge,
                "Gboard");
        entrySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_summary,
                "Adjust the seven bottom-row slot weights on the Zhuyin keyboard.");
        headerSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_header_summary,
                "Adjust the seven bottom-row slot weights on the Zhuyin keyboard.");
        errorTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_error_title,
                "Zhuyin bottom row key sizes unavailable");
        errorSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_error_summary,
                "The Zhuyin bottom row settings screen failed to load. Reopen Gboard settings and try again.");
        enabledTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_enabled_title,
                "Enabled");
        enabledSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_enabled_summary,
                "Enable custom weight override.");
        sectionBehavior = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_section_behavior,
                "Behavior");
        sectionWeights = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_section_weights,
                "Weights");
        sectionAdvanced = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_section_advanced,
                "Advanced");
        applyRecommendedTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_apply_recommended_title,
                "Apply Recommended Values");
        applyRecommendedSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_apply_recommended_summary,
                "Recommended: set Space to 200 and Delete to 200; keep all other slots at their stock defaults.");
        applyRecommendedConfirmTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_apply_recommended_confirm_title,
                "Apply recommended values?");
        applyRecommendedConfirmMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_apply_recommended_confirm_message,
                "This sets Space and Delete to 200, and restores the other five slots to stock defaults.");
        resetTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_reset_title,
                "Reset to Default");
        resetSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_reset_summary,
                "Restore all 7 bottom-row slot weights to the stock layout values.");
        resetConfirmTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_reset_confirm_title,
                "Reset all Zhuyin bottom-row weights?");
        resetConfirmMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_reset_confirm_message,
                "This restores the seven bottom-row slot weights to the stock Zhuyin normal layout.");
        dialogHint = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_dialog_hint,
                "1-500");
        dialogError = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_dialog_error,
                "Enter a value from 1 to 500.");
        switchToSymbolTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_switch_to_symbol_title,
                "?123");
        a02Title = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_a02_title,
                "Comma");
        switchToNextLanguageTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_switch_to_next_language_title,
                "Globe");
        spaceTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_space_title,
                "Space");
        a06Title = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_a06_title,
                "A06 / ㄦ");
        a08Title = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_a08_title,
                "Delete");
        imeActionTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_ime_action_title,
                "Search / Enter");
        weightSummaryTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_summary,
                "Range: 1-500. Stock default: %1$d.");
        weightValueTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_value,
                "%1$d");
        weightValueDefaultTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_weight_value_default,
                "%1$d (Default)");
        dialogTitleTemplate = GboardSettingsText.get(context,
                R.string.gboard_patches_zhuyin_bottom_row_dialog_title,
                "%1$s");
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
            GboardPatchesSettingsContract.Host host) {
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
            GboardPatchesSettingsContract.Host host,
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

    private void showWeightDialog(GboardPatchesSettingsContract.Host host, String rowTitle,
            int currentWeight, WeightWriter writer) {
        if (host == null || host.getContext() == null || writer == null) {
            return;
        }
        host.showTextInputDialog(
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
        private final GboardPatchesSettingsContract.Host host;

        ResetWeightsAction(GboardPatchesSettingsContract.Host host) {
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
        private final GboardPatchesSettingsContract.Host host;

        ApplyRecommendedWeightsAction(GboardPatchesSettingsContract.Host host) {
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

    private static void safeRefresh(GboardPatchesSettingsContract.Host host) {
        if (host == null) {
            return;
        }
        try {
            host.refresh();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to refresh Zhuyin bottom row weight settings", throwable);
        }
    }
}
