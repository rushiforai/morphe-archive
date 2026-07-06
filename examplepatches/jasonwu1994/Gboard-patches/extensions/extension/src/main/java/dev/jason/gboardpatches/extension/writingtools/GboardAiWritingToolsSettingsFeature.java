package dev.jason.gboardpatches.extension.writingtools;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardAiWritingToolsSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String HEADER_BADGE = "Gboard";
    private static final String ENTRY_TITLE = "AI Writing Tools";
    private static final String ENTRY_SUMMARY =
            "Controls whether to force-show the stock AI Writing Tools switches.";
    private static final String ERROR_TITLE = "AI Writing Tools unavailable";
    private static final String ERROR_SUMMARY =
            "The AI Writing Tools settings screen failed to load. Reopen Gboard settings and try again.";
    private static final String ENABLED_TITLE = "Enable AI Writing Tools";
    private static final String ENABLED_SUMMARY =
            "Force-shows the stock four switches in \"Corrections & suggestions\" -> "
                    + "\"Writing tools\". If your phone does not have AI Core, turn on "
                    + "\"Use Google servers\" for it to work.";
    private static final String ALL_KEYBOARDS_TITLE = "Support All Keyboards";
    private static final String ALL_KEYBOARDS_SUMMARY =
            "When enabled, force writing tools to work on every keyboard. Force-stop "
                    + "and restart Gboard for the change to take effect.";
    private static final String SECTION_BEHAVIOR = "Behavior";

    private final String headerBadge;
    private final String entryTitle;
    private final String entrySummary;
    private final String headerSummary;
    private final String errorTitle;
    private final String errorSummary;
    private final String enabledTitle;
    private final String enabledSummary;
    private final String allKeyboardsTitle;
    private final String allKeyboardsSummary;
    private final String sectionBehavior;

    public GboardAiWritingToolsSettingsFeature(Context context) {
        headerBadge = GboardSettingsText.get(context, R.string.gboard_patches_header_badge,
                HEADER_BADGE);
        entryTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_title,
                ENTRY_TITLE);
        entrySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_summary,
                ENTRY_SUMMARY);
        headerSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_header_summary,
                "");
        errorTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_error_title,
                ERROR_TITLE);
        errorSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_error_summary,
                ERROR_SUMMARY);
        enabledTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_enabled_title,
                ENABLED_TITLE);
        enabledSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_enabled_summary,
                ENABLED_SUMMARY);
        allKeyboardsTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_all_keyboards_title,
                ALL_KEYBOARDS_TITLE);
        allKeyboardsSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_all_keyboards_summary,
                ALL_KEYBOARDS_SUMMARY);
        sectionBehavior = GboardSettingsText.get(context,
                R.string.gboard_patches_ai_writing_tools_section_behavior,
                SECTION_BEHAVIOR);
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
                GboardPatchesFeatureAvailability.FEATURE_AI_WRITING_TOOLS);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.Host host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }

            SharedPreferences preferences =
                    GboardAiWritingToolsSettings.preferences(host.getContext());
            GboardAiWritingToolsSettings.ensureDefaults(preferences);

            boolean enabled = GboardAiWritingToolsSettings.readEnabled(preferences);
            boolean allKeyboardsEnabled =
                    GboardAiWritingToolsSettings.readAllKeyboardsEnabled(preferences);

            List<GboardPatchesSettingsContract.Row> behaviorRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            behaviorRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    enabledTitle,
                    enabledSummary,
                    true,
                    enabled,
                    value -> GboardAiWritingToolsSettings.writeEnabled(preferences, value)));
            behaviorRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    allKeyboardsTitle,
                    allKeyboardsSummary,
                    enabled,
                    allKeyboardsEnabled,
                    value -> GboardAiWritingToolsSettings.writeAllKeyboardsEnabled(
                            preferences,
                            value)));

            return new GboardPatchesSettingsContract.Screen(
                    entryTitle,
                    headerBadge,
                    entryTitle,
                    headerSummary,
                    Collections.emptyList(),
                    Collections.singletonList(new GboardPatchesSettingsContract.Section(
                            sectionBehavior,
                            behaviorRows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render AI Writing Tools settings screen", throwable);
            return buildErrorScreen();
        }
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
}
