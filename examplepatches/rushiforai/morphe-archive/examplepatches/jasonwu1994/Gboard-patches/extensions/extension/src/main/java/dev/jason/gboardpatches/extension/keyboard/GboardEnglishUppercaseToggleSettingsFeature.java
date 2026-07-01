package dev.jason.gboardpatches.extension.keyboard;

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

public final class GboardEnglishUppercaseToggleSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String HEADER_BADGE = "Gboard";
    private static final String ENTRY_TITLE = "English Up-Flick Uppercase";
    private static final String ENTRY_SUMMARY =
            "Controls English keyboard letter-key up-flick uppercase behavior.";
    private static final String ERROR_TITLE =
            "English up-flick uppercase unavailable";
    private static final String ERROR_SUMMARY =
            "The English up-flick uppercase settings screen failed to load. Reopen Gboard settings and try again.";
    private static final String ENABLED_TITLE = "Enable English Up-Flick Uppercase";
    private static final String ENABLED_SUMMARY =
            "Flicking up on lowercase letters outputs uppercase, and flicking up on uppercase letters outputs lowercase.";
    private static final String SECTION_BEHAVIOR = "Behavior";

    private final String headerBadge;
    private final String entryTitle;
    private final String entrySummary;
    private final String errorTitle;
    private final String errorSummary;
    private final String enabledTitle;
    private final String enabledSummary;
    private final String sectionBehavior;

    public GboardEnglishUppercaseToggleSettingsFeature(Context context) {
        headerBadge = GboardSettingsText.get(context, R.string.gboard_patches_header_badge,
                HEADER_BADGE);
        entryTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_english_uppercase_toggle_title,
                ENTRY_TITLE);
        entrySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_english_uppercase_toggle_summary,
                ENTRY_SUMMARY);
        errorTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_english_uppercase_toggle_error_title,
                ERROR_TITLE);
        errorSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_english_uppercase_toggle_error_summary,
                ERROR_SUMMARY);
        enabledTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_english_uppercase_toggle_enabled_title,
                ENABLED_TITLE);
        enabledSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_english_uppercase_toggle_enabled_summary,
                ENABLED_SUMMARY);
        sectionBehavior = GboardSettingsText.get(context,
                R.string.gboard_patches_english_uppercase_toggle_section_behavior,
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
                GboardPatchesFeatureAvailability.FEATURE_ENGLISH_UPPERCASE_TOGGLE);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.Host host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            SharedPreferences preferences =
                    GboardEnglishUppercaseToggleSettings.preferences(host.getContext());
            GboardEnglishUppercaseToggleSettings.ensureDefaults(preferences);

            boolean enabled = GboardEnglishUppercaseToggleSettings.readEnabled(preferences);

            List<GboardPatchesSettingsContract.Row> behaviorRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            behaviorRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    enabledTitle,
                    enabledSummary,
                    true,
                    enabled,
                    value -> GboardEnglishUppercaseToggleSettings.writeEnabled(
                            preferences,
                            value)));

            return new GboardPatchesSettingsContract.Screen(
                    entryTitle,
                    headerBadge,
                    entryTitle,
                    "",
                    Collections.emptyList(),
                    Collections.singletonList(new GboardPatchesSettingsContract.Section(
                            sectionBehavior,
                            behaviorRows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render English uppercase toggle settings screen", throwable);
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
                "",
                statusBlocks,
                Collections.emptyList());
    }
}
