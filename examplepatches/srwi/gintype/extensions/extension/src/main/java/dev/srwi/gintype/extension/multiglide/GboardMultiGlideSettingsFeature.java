package dev.srwi.gintype.extension.multiglide;

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
 * Settings screen for MultiGlide multi-finger swipe, auto-space, and navigation to
 * Kinetica algorithm and diagnostics sub-pages.
 */
public final class GboardMultiGlideSettingsFeature implements GboardPatchesSettingsContract.Feature {

    private static final String TAG = "GboardPatches";
    private static final int AUTO_SPACE_DELAY_STEP_MS = 25;
    private static final int COMBINE_DELAY_STEP_MS = 10;
    private static final int TAP_TO_MULTIGLIDE_DELAY_STEP_MS = 10;
    private static final String SPACE_PLACEMENT_BEFORE = "before";
    private static final String SPACE_PLACEMENT_AFTER = "after";

    private interface IntFormatter {
        String format(int value);
    }

    private interface IntSaver {
        boolean save(int value);
    }

    private final GboardKineticaSettingsFeature kineticaFeature;
    private final GboardMultiGlideDiagnosticsFeature diagnosticsFeature;
    private final String title;
    private final String summary;
    private final String sectionGestures;
    private final String sectionAutoSpace;
    private final String sectionAdvanced;
    private final String enabledTitle;
    private final String enabledSummary;
    private final String autoSpaceTitle;
    private final String autoSpaceSummary;
    private final String spacePlacementTitle;
    private final String spacePlacementSummary;
    private final String spacePlacementBeforeLabel;
    private final String spacePlacementAfterLabel;
    private final String delayTitle;
    private final String delaySummary;
    private final String delayValueTemplate;
    private final String delayValueDefaultTemplate;
    private final String combineEnabledTitle;
    private final String combineEnabledSummary;
    private final String combineDelayTitle;
    private final String combineDelaySummary;
    private final String tapToMultiGlideEnabledTitle;
    private final String tapToMultiGlideEnabledSummary;
    private final String tapToMultiGlideDelayTitle;
    private final String tapToMultiGlideDelaySummary;
    private final String smartTapSwipeSplitEnabledTitle;
    private final String smartTapSwipeSplitEnabledSummary;
    private final String spacebarTimerIndicatorTitle;
    private final String spacebarTimerIndicatorSummary;
    private final String wordReadyVibrationTitle;
    private final String wordReadyVibrationSummary;
    private final String backspaceModeTitle;
    private final String backspaceModeSummary;
    private final String backspaceModeWholeWordLabel;
    private final String backspaceModeLastInputLabel;
    private final String errorTitle;
    private final String errorSummary;

    public GboardMultiGlideSettingsFeature(Context context) {
        kineticaFeature = new GboardKineticaSettingsFeature(context);
        diagnosticsFeature = new GboardMultiGlideDiagnosticsFeature(context);
        title = text(context, R.string.gboard_patches_multiglide_title);
        summary = text(context, R.string.gboard_patches_multiglide_summary);
        sectionGestures = text(context, R.string.gboard_patches_multiglide_section_gestures);
        sectionAutoSpace = text(context, R.string.gboard_patches_multiglide_section_auto_space);
        sectionAdvanced = text(context, R.string.gboard_patches_multiglide_section_advanced);
        enabledTitle = text(context, R.string.gboard_patches_multiglide_enabled_title);
        enabledSummary = text(context, R.string.gboard_patches_multiglide_enabled_summary);
        autoSpaceTitle = text(context, R.string.gboard_patches_multiglide_auto_space_title);
        autoSpaceSummary = text(context, R.string.gboard_patches_multiglide_auto_space_summary);
        spacePlacementTitle =
                text(context, R.string.gboard_patches_multiglide_space_placement_title);
        spacePlacementSummary =
                text(context, R.string.gboard_patches_multiglide_space_placement_summary);
        spacePlacementBeforeLabel =
                text(context, R.string.gboard_patches_multiglide_space_placement_before);
        spacePlacementAfterLabel =
                text(context, R.string.gboard_patches_multiglide_space_placement_after);
        delayTitle = text(context, R.string.gboard_patches_multiglide_auto_space_delay_title);
        delaySummary = text(context, R.string.gboard_patches_multiglide_auto_space_delay_summary);
        delayValueTemplate =
                text(context, R.string.gboard_patches_multiglide_auto_space_delay_value);
        delayValueDefaultTemplate =
                text(context, R.string.gboard_patches_multiglide_auto_space_delay_value_default);
        combineEnabledTitle =
                text(context, R.string.gboard_patches_multiglide_combine_enabled_title);
        combineEnabledSummary =
                text(context, R.string.gboard_patches_multiglide_combine_enabled_summary);
        combineDelayTitle = text(context, R.string.gboard_patches_multiglide_combine_delay_title);
        combineDelaySummary =
                text(context, R.string.gboard_patches_multiglide_combine_delay_summary);
        tapToMultiGlideEnabledTitle =
                text(context, R.string.gboard_patches_multiglide_tap_to_multiglide_enabled_title);
        tapToMultiGlideEnabledSummary =
                text(context, R.string.gboard_patches_multiglide_tap_to_multiglide_enabled_summary);
        tapToMultiGlideDelayTitle =
                text(context, R.string.gboard_patches_multiglide_tap_to_multiglide_delay_title);
        tapToMultiGlideDelaySummary =
                text(context, R.string.gboard_patches_multiglide_tap_to_multiglide_delay_summary);
        smartTapSwipeSplitEnabledTitle =
                text(context, R.string.gboard_patches_multiglide_smart_tap_swipe_split_enabled_title);
        smartTapSwipeSplitEnabledSummary =
                text(context, R.string.gboard_patches_multiglide_smart_tap_swipe_split_enabled_summary);
        spacebarTimerIndicatorTitle =
                text(context, R.string.gboard_patches_multiglide_spacebar_timer_indicator_title);
        spacebarTimerIndicatorSummary =
                text(context, R.string.gboard_patches_multiglide_spacebar_timer_indicator_summary);
        wordReadyVibrationTitle =
                text(context, R.string.gboard_patches_multiglide_word_ready_vibration_title);
        wordReadyVibrationSummary =
                text(context, R.string.gboard_patches_multiglide_word_ready_vibration_summary);
        backspaceModeTitle = text(context, R.string.gboard_patches_multiglide_backspace_mode_title);
        backspaceModeSummary =
                text(context, R.string.gboard_patches_multiglide_backspace_mode_summary);
        backspaceModeWholeWordLabel =
                text(context, R.string.gboard_patches_multiglide_backspace_mode_whole_word);
        backspaceModeLastInputLabel =
                text(context, R.string.gboard_patches_multiglide_backspace_mode_last_input);
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
    public int getEntryIcon() {
        return GboardPatchesIcons.GESTURE;
    }

    @Override
    public String getEntryTone() {
        return "blue";
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_MULTIGLIDE);
    }

    @Override
    public List<GboardPatchesSettingsContract.Feature> getNavigationChildren() {
        return Arrays.asList(kineticaFeature, diagnosticsFeature);
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

            boolean enabled = GboardMultiGlideSettings.readEnabled(preferences);
            boolean autoSpaceEnabled = GboardMultiGlideSettings.readAutoSpaceEnabled(preferences);
            boolean autoSpaceBeforeWord =
                    GboardMultiGlideSettings.readAutoSpaceBeforeWord(preferences);
            int autoSpaceDelayMs = GboardMultiGlideSettings.readAutoSpaceDelayMs(preferences);
            boolean combineEnabled =
                    GboardMultiGlideSettings.readSingleTouchCombineEnabled(preferences);
            int combineDelayMs = GboardMultiGlideSettings.readSingleTouchCombineDelayMs(preferences);
            boolean tapToMultiGlideEnabled =
                    GboardMultiGlideSettings.readTapToMultiGlideEnabled(preferences);
            int tapToMultiGlideDelayMs =
                    GboardMultiGlideSettings.readTapToMultiGlideDelayMs(preferences);
            boolean smartTapSwipeSplitEnabled =
                    GboardMultiGlideSettings.readSmartTapSwipeSplitEnabled(preferences);
            boolean spacebarTimerIndicatorEnabled =
                    GboardMultiGlideSettings.readSpacebarTimerIndicatorEnabled(preferences);
            boolean wordReadyVibrationEnabled =
                    GboardMultiGlideSettings.readWordReadyVibrationEnabled(preferences);
            String backspaceMode = GboardMultiGlideSettings.readBackspaceMode(preferences);

            List<GboardPatchesSettingsContract.Row> gestureRows = buildGestureRows(
                    enabledTitle,
                    enabledSummary,
                    enabled,
                    value -> {
                        GboardMultiGlideSettings.writeEnabled(preferences, value);
                        GboardPatchesSettingsContract.refresh(host);
                    },
                    combineEnabledTitle,
                    combineEnabledSummary,
                    combineEnabled,
                    value -> {
                        GboardMultiGlideSettings.writeSingleTouchCombineEnabled(preferences, value);
                        GboardPatchesSettingsContract.refresh(host);
                    },
                    combineDelayTitle,
                    combineDelaySummary,
                    formatCombineDelayLabel(combineDelayMs),
                    () -> showIntSliderDialog(
                            host,
                            combineDelayTitle,
                            combineDelaySummary,
                            GboardMultiGlideSettings.MIN_SINGLE_TOUCH_COMBINE_DELAY_MS,
                            GboardMultiGlideSettings.MAX_SINGLE_TOUCH_COMBINE_DELAY_MS,
                            COMBINE_DELAY_STEP_MS,
                            GboardMultiGlideSettings.DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS,
                            combineDelayMs,
                            this::formatCombineDelayLabel,
                            v -> GboardMultiGlideSettings.writeSingleTouchCombineDelayMs(
                                    preferences, v)),
                    tapToMultiGlideEnabledTitle,
                    tapToMultiGlideEnabledSummary,
                    tapToMultiGlideEnabled,
                    value -> {
                        GboardMultiGlideSettings.writeTapToMultiGlideEnabled(preferences, value);
                        GboardPatchesSettingsContract.refresh(host);
                    },
                    tapToMultiGlideDelayTitle,
                    tapToMultiGlideDelaySummary,
                    formatTapToMultiGlideDelayLabel(tapToMultiGlideDelayMs),
                    () -> showIntSliderDialog(
                            host,
                            tapToMultiGlideDelayTitle,
                            tapToMultiGlideDelaySummary,
                            GboardMultiGlideSettings.MIN_TAP_TO_MULTIGLIDE_DELAY_MS,
                            GboardMultiGlideSettings.MAX_TAP_TO_MULTIGLIDE_DELAY_MS,
                            TAP_TO_MULTIGLIDE_DELAY_STEP_MS,
                            GboardMultiGlideSettings.DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS,
                            tapToMultiGlideDelayMs,
                            this::formatTapToMultiGlideDelayLabel,
                            v -> GboardMultiGlideSettings.writeTapToMultiGlideDelayMs(
                                    preferences, v)),
                    smartTapSwipeSplitEnabledTitle,
                    smartTapSwipeSplitEnabledSummary,
                    smartTapSwipeSplitEnabled,
                    value -> GboardMultiGlideSettings.writeSmartTapSwipeSplitEnabled(
                            preferences, value),
                    backspaceModeTitle,
                    backspaceModeSummary,
                    formatBackspaceModeLabel(backspaceMode),
                    () -> showBackspaceModeSelector(host, preferences, backspaceMode));

            List<GboardPatchesSettingsContract.Row> autoSpaceRows = buildAutoSpaceRows(
                    enabled,
                    autoSpaceTitle,
                    autoSpaceSummary,
                    autoSpaceEnabled,
                    value -> {
                        GboardMultiGlideSettings.writeAutoSpaceEnabled(preferences, value);
                        GboardPatchesSettingsContract.refresh(host);
                    },
                    spacePlacementTitle,
                    spacePlacementSummary,
                    formatSpacePlacementLabel(autoSpaceBeforeWord),
                    () -> showSpacePlacementSelector(host, preferences, autoSpaceBeforeWord),
                    delayTitle,
                    delaySummary,
                    formatDelayLabel(autoSpaceDelayMs),
                    () -> showIntSliderDialog(
                            host,
                            delayTitle,
                            delaySummary,
                            GboardMultiGlideSettings.MIN_AUTO_SPACE_DELAY_MS,
                            GboardMultiGlideSettings.MAX_AUTO_SPACE_DELAY_MS,
                            AUTO_SPACE_DELAY_STEP_MS,
                            GboardMultiGlideSettings.DEFAULT_AUTO_SPACE_DELAY_MS,
                            autoSpaceDelayMs,
                            this::formatDelayLabel,
                            v -> GboardMultiGlideSettings.writeAutoSpaceDelayMs(preferences, v)),
                    spacebarTimerIndicatorTitle,
                    spacebarTimerIndicatorSummary,
                    spacebarTimerIndicatorEnabled,
                    value -> GboardMultiGlideSettings.writeSpacebarTimerIndicatorEnabled(
                            preferences, value),
                    wordReadyVibrationTitle,
                    wordReadyVibrationSummary,
                    wordReadyVibrationEnabled,
                    value -> GboardMultiGlideSettings.writeWordReadyVibrationEnabled(
                            preferences, value));

            List<GboardPatchesSettingsContract.Row> advancedRows = Arrays.asList(
                    new GboardPatchesSettingsContract.NavigationRow(
                            kineticaFeature.getEntryTitle(),
                            kineticaFeature.getEntrySummary(),
                            enabled,
                            () -> GboardPatchesSettingsContract.openFeature(
                                    host, kineticaFeature)),
                    new GboardPatchesSettingsContract.NavigationRow(
                            diagnosticsFeature.getEntryTitle(),
                            diagnosticsFeature.getEntrySummary(),
                            true,
                            () -> GboardPatchesSettingsContract.openFeature(
                                    host, diagnosticsFeature)));

            return new GboardPatchesSettingsContract.Screen(
                    title,
                    null,
                    title,
                    summary,
                    Collections.emptyList(),
                    Arrays.asList(
                            new GboardPatchesSettingsContract.Section(
                                    sectionAutoSpace, autoSpaceRows),
                            new GboardPatchesSettingsContract.Section(sectionGestures, gestureRows),
                            new GboardPatchesSettingsContract.Section(
                                    sectionAdvanced, advancedRows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to render MultiGlide settings screen", throwable);
            } catch (Throwable ignored) {
                // Fallback error screen below handles recovery.
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
                formatter.format(min),
                formatter.format(max),
                p -> formatter.format(intValueForSliderStep(p, min, max, step)),
                p -> {
                    int value = intValueForSliderStep(p, min, max, step);
                    if (!saver.save(value)) {
                        throw new IllegalStateException("Failed to persist " + dialogTitle);
                    }
                });
    }

    private void showSpacePlacementSelector(
            GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences,
            boolean autoSpaceBeforeWord) {
        String[] labels = {spacePlacementBeforeLabel, spacePlacementAfterLabel};
        String[] values = {SPACE_PLACEMENT_BEFORE, SPACE_PLACEMENT_AFTER};
        String current = autoSpaceBeforeWord ? SPACE_PLACEMENT_BEFORE : SPACE_PLACEMENT_AFTER;
        GboardPatchesSettingsContract.showSingleChoiceDialog(
                host,
                spacePlacementTitle,
                labels,
                values,
                current,
                choice -> {
                    GboardMultiGlideSettings.writeAutoSpaceBeforeWord(
                            preferences, SPACE_PLACEMENT_BEFORE.equals(choice));
                    GboardPatchesSettingsContract.refresh(host);
                });
    }

    private String formatSpacePlacementLabel(boolean autoSpaceBeforeWord) {
        return autoSpaceBeforeWord ? spacePlacementBeforeLabel : spacePlacementAfterLabel;
    }

    private void showBackspaceModeSelector(
            GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences,
            String currentMode) {
        String[] labels = {backspaceModeWholeWordLabel, backspaceModeLastInputLabel};
        String[] values = {
                GboardMultiGlideSettings.BACKSPACE_MODE_WHOLE_WORD,
                GboardMultiGlideSettings.BACKSPACE_MODE_LAST_INPUT
        };
        GboardPatchesSettingsContract.showSingleChoiceDialog(
                host,
                backspaceModeTitle,
                labels,
                values,
                GboardMultiGlideSettings.sanitizeBackspaceMode(currentMode),
                choice -> {
                    GboardMultiGlideSettings.writeBackspaceMode(preferences, choice);
                    GboardPatchesSettingsContract.refresh(host);
                });
    }

    private String formatBackspaceModeLabel(String mode) {
        if (GboardMultiGlideSettings.BACKSPACE_MODE_LAST_INPUT.equals(mode)) {
            return backspaceModeLastInputLabel;
        }
        return backspaceModeWholeWordLabel;
    }

    static int sliderStepForInt(int value, int min, int max, int step) {
        int totalSteps = Math.max(1, (max - min) / step);
        return Math.max(0, Math.min(totalSteps, Math.round((value - min) / (float) step)));
    }

    static int intValueForSliderStep(int progress, int min, int max, int step) {
        return Math.max(min, Math.min(max, min + progress * step));
    }

    static int sliderStepForFloat(float value, float min, float max, float step) {
        int totalSteps = Math.max(1, Math.round((max - min) / step));
        return Math.max(0, Math.min(totalSteps, Math.round((value - min) / step)));
    }

    static float floatValueForSliderStep(int progress, float min, float max, float step) {
        float raw = min + progress * step;
        float clamped = Math.max(min, Math.min(max, raw));
        return Math.round(clamped * 100f) / 100f;
    }

    static int parseDelayMs(String value, String errorMessage) {
        return parseIntInRange(
                value,
                GboardMultiGlideSettings.MIN_AUTO_SPACE_DELAY_MS,
                GboardMultiGlideSettings.MAX_AUTO_SPACE_DELAY_MS,
                errorMessage);
    }

    static int parseIntInRange(String value, int min, int max, String errorMessage) {
        if (value == null) {
            throw new IllegalArgumentException(errorMessage);
        }
        final int parsed;
        try {
            parsed = Integer.parseInt(value.trim());
        } catch (NumberFormatException exception) {
            throw new IllegalArgumentException(errorMessage);
        }
        if (parsed < min || parsed > max) {
            throw new IllegalArgumentException(errorMessage);
        }
        return parsed;
    }

    static float parseFloatInRange(String value, float min, float max, String errorMessage) {
        if (value == null) {
            throw new IllegalArgumentException(errorMessage);
        }
        String normalized = value.trim().replace(',', '.');
        if (normalized.isEmpty()) {
            throw new IllegalArgumentException(errorMessage);
        }
        final float parsed;
        try {
            parsed = Float.parseFloat(normalized);
        } catch (NumberFormatException exception) {
            throw new IllegalArgumentException(errorMessage);
        }
        if (!Float.isFinite(parsed) || parsed < min || parsed > max) {
            throw new IllegalArgumentException(errorMessage);
        }
        return parsed;
    }

    private String formatDelayLabel(int delayMs) {
        if (delayMs == GboardMultiGlideSettings.DEFAULT_AUTO_SPACE_DELAY_MS) {
            return String.format(Locale.US, delayValueDefaultTemplate, delayMs);
        }
        return String.format(Locale.US, delayValueTemplate, delayMs);
    }

    private String formatCombineDelayLabel(int delayMs) {
        if (delayMs == GboardMultiGlideSettings.DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS) {
            return String.format(Locale.US, delayValueDefaultTemplate, delayMs);
        }
        return String.format(Locale.US, delayValueTemplate, delayMs);
    }

    private String formatTapToMultiGlideDelayLabel(int delayMs) {
        if (delayMs == GboardMultiGlideSettings.DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS) {
            return String.format(Locale.US, delayValueDefaultTemplate, delayMs);
        }
        return String.format(Locale.US, delayValueTemplate, delayMs);
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

    static List<GboardPatchesSettingsContract.Row> buildGestureRows(
            String enabledTitle,
            String enabledSummary,
            boolean enabled,
            GboardPatchesSettingsContract.ToggleAction onToggleEnabled,
            String combineEnabledTitle,
            String combineEnabledSummary,
            boolean combineEnabled,
            GboardPatchesSettingsContract.ToggleAction onToggleCombineEnabled,
            String combineDelayTitle,
            String combineDelaySummary,
            String combineValueLabel,
            Runnable onSelectCombineDelay,
            String tapToMultiGlideEnabledTitle,
            String tapToMultiGlideEnabledSummary,
            boolean tapToMultiGlideEnabled,
            GboardPatchesSettingsContract.ToggleAction onToggleTapToMultiGlideEnabled,
            String tapToMultiGlideDelayTitle,
            String tapToMultiGlideDelaySummary,
            String tapToMultiGlideValueLabel,
            Runnable onSelectTapToMultiGlideDelay,
            String backspaceModeTitle,
            String backspaceModeSummary,
            String backspaceModeValueLabel,
            Runnable onSelectBackspaceMode) {
        return buildGestureRows(
                enabledTitle,
                enabledSummary,
                enabled,
                onToggleEnabled,
                combineEnabledTitle,
                combineEnabledSummary,
                combineEnabled,
                onToggleCombineEnabled,
                combineDelayTitle,
                combineDelaySummary,
                combineValueLabel,
                onSelectCombineDelay,
                tapToMultiGlideEnabledTitle,
                tapToMultiGlideEnabledSummary,
                tapToMultiGlideEnabled,
                onToggleTapToMultiGlideEnabled,
                tapToMultiGlideDelayTitle,
                tapToMultiGlideDelaySummary,
                tapToMultiGlideValueLabel,
                onSelectTapToMultiGlideDelay,
                "",
                "",
                GboardMultiGlideSettings.DEFAULT_SMART_TAP_SWIPE_SPLIT_ENABLED,
                value -> {},
                backspaceModeTitle,
                backspaceModeSummary,
                backspaceModeValueLabel,
                onSelectBackspaceMode);
    }

    static List<GboardPatchesSettingsContract.Row> buildGestureRows(
            String enabledTitle,
            String enabledSummary,
            boolean enabled,
            GboardPatchesSettingsContract.ToggleAction onToggleEnabled,
            String combineEnabledTitle,
            String combineEnabledSummary,
            boolean combineEnabled,
            GboardPatchesSettingsContract.ToggleAction onToggleCombineEnabled,
            String combineDelayTitle,
            String combineDelaySummary,
            String combineValueLabel,
            Runnable onSelectCombineDelay,
            String tapToMultiGlideEnabledTitle,
            String tapToMultiGlideEnabledSummary,
            boolean tapToMultiGlideEnabled,
            GboardPatchesSettingsContract.ToggleAction onToggleTapToMultiGlideEnabled,
            String tapToMultiGlideDelayTitle,
            String tapToMultiGlideDelaySummary,
            String tapToMultiGlideValueLabel,
            Runnable onSelectTapToMultiGlideDelay,
            String smartTapSwipeSplitEnabledTitle,
            String smartTapSwipeSplitEnabledSummary,
            boolean smartTapSwipeSplitEnabled,
            GboardPatchesSettingsContract.ToggleAction onToggleSmartTapSwipeSplitEnabled,
            String backspaceModeTitle,
            String backspaceModeSummary,
            String backspaceModeValueLabel,
            Runnable onSelectBackspaceMode) {
        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>(7);
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                enabledTitle,
                enabledSummary,
                true,
                enabled,
                onToggleEnabled));
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                combineEnabledTitle,
                combineEnabledSummary,
                enabled,
                combineEnabled,
                onToggleCombineEnabled));
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                combineDelayTitle,
                combineDelaySummary,
                combineValueLabel,
                enabled && combineEnabled,
                onSelectCombineDelay));
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                tapToMultiGlideEnabledTitle,
                tapToMultiGlideEnabledSummary,
                enabled,
                tapToMultiGlideEnabled,
                onToggleTapToMultiGlideEnabled));
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                tapToMultiGlideDelayTitle,
                tapToMultiGlideDelaySummary,
                tapToMultiGlideValueLabel,
                enabled && tapToMultiGlideEnabled,
                onSelectTapToMultiGlideDelay));
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                smartTapSwipeSplitEnabledTitle,
                smartTapSwipeSplitEnabledSummary,
                enabled && tapToMultiGlideEnabled,
                smartTapSwipeSplitEnabled,
                onToggleSmartTapSwipeSplitEnabled));
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                backspaceModeTitle,
                backspaceModeSummary,
                backspaceModeValueLabel,
                enabled,
                onSelectBackspaceMode));
        return rows;
    }

    static List<GboardPatchesSettingsContract.Row> buildAutoSpaceRows(
            boolean multiGlideEnabled,
            String autoSpaceTitle,
            String autoSpaceSummary,
            boolean autoSpaceEnabled,
            GboardPatchesSettingsContract.ToggleAction onToggleAutoSpace,
            String spacePlacementTitle,
            String spacePlacementSummary,
            String spacePlacementValueLabel,
            Runnable onSelectSpacePlacement,
            String delayTitle,
            String delaySummary,
            String delayValueLabel,
            Runnable onSelectDelay,
            String spacebarTimerTitle,
            String spacebarTimerSummary,
            boolean spacebarTimerEnabled,
            GboardPatchesSettingsContract.ToggleAction onToggleSpacebarTimer,
            String wordReadyVibrationTitle,
            String wordReadyVibrationSummary,
            boolean wordReadyVibrationEnabled,
            GboardPatchesSettingsContract.ToggleAction onToggleWordReadyVibration) {
        boolean autoSpaceControlsEnabled = multiGlideEnabled && autoSpaceEnabled;
        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>(5);
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                autoSpaceTitle,
                autoSpaceSummary,
                multiGlideEnabled,
                autoSpaceEnabled,
                onToggleAutoSpace));
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                spacePlacementTitle,
                spacePlacementSummary,
                spacePlacementValueLabel,
                autoSpaceControlsEnabled,
                onSelectSpacePlacement));
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                delayTitle,
                delaySummary,
                delayValueLabel,
                autoSpaceControlsEnabled,
                onSelectDelay));
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                spacebarTimerTitle,
                spacebarTimerSummary,
                autoSpaceControlsEnabled,
                spacebarTimerEnabled,
                onToggleSpacebarTimer));
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                wordReadyVibrationTitle,
                wordReadyVibrationSummary,
                autoSpaceControlsEnabled,
                wordReadyVibrationEnabled,
                onToggleWordReadyVibration));
        return rows;
    }

    private static String text(Context context, int id) {
        return GboardSettingsText.get(context, id);
    }
}
