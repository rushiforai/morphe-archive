package dev.jason.gboardpatches.extension.splitkeyboard;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardSplitKeyboardSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String PREVIEW_IMAGE =
            "settings-previews/splitkeyboard/08_split_keyboard.png";

    private final String entryTitle;
    private final String masterTitle;
    private final String autoTitle;
    private final String autoSummary;
    private final String headerBadge;
    private final String errorTitle;
    private final String errorSummary;
    private final String sectionTitle;
    private final String previewCaption;

    public GboardSplitKeyboardSettingsFeature(Context context) {
        entryTitle = text(context, R.string.gboard_patches_split_keyboard_title);
        masterTitle = text(context, R.string.gboard_patches_split_keyboard_toggle_title);
        autoTitle = text(context, R.string.gboard_patches_split_keyboard_auto_title);
        autoSummary = text(context, R.string.gboard_patches_split_keyboard_auto_summary);
        headerBadge = text(context, R.string.gboard_patches_header_badge);
        errorTitle = text(context, R.string.gboard_patches_flag_patch_error_title);
        errorSummary = text(context, R.string.gboard_patches_flag_patch_error_summary);
        sectionTitle = text(context, R.string.gboard_patches_flag_patch_section_feature);
        previewCaption = text(context, R.string.gboard_patches_split_keyboard_preview_layout);
    }

    @Override
    public String getEntryTitle() {
        return entryTitle;
    }

    @Override
    public String getEntrySummary() {
        return "";
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context,
                GboardPatchesFeatureAvailability.FEATURE_SPLIT_KEYBOARD);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            SharedPreferences preferences =
                    GboardPatchesSettings.preferences(host.getContext());
            GboardSplitKeyboardSettings.ensureDefault(preferences);
            return buildScreenForState(
                    GboardSplitKeyboardSettings.readEnabled(preferences),
                    GboardSplitKeyboardSettings.readAutoSplitEnabled(preferences),
                    enabled -> {
                        if (GboardSplitKeyboardSettings.writeEnabled(preferences, enabled)) {
                            GboardPatchesSettingsContract.refresh(host);
                        }
                    },
                    enabled -> GboardSplitKeyboardSettings.writeAutoSplitEnabled(
                            preferences, enabled));
        } catch (Throwable failure) {
            Log.w(TAG, "Failed to render split keyboard settings", failure);
            return buildErrorScreen();
        }
    }

    public GboardPatchesSettingsContract.Screen buildScreenForState(
            boolean masterEnabled,
            boolean autoSplitEnabled,
            GboardPatchesSettingsContract.ToggleAction masterToggle,
            GboardPatchesSettingsContract.ToggleAction autoSplitToggle) {
        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                masterTitle,
                "",
                true,
                masterEnabled,
                masterToggle,
                buildPreview()));
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                autoTitle,
                autoSummary,
                masterEnabled,
                autoSplitEnabled,
                autoSplitToggle));
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                headerBadge,
                entryTitle,
                "",
                Collections.emptyList(),
                Collections.singletonList(new GboardPatchesSettingsContract.Section(
                        sectionTitle,
                        rows)),
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT);
    }

    private GboardPatchesSettingsContract.PreviewSpec buildPreview() {
        return new GboardPatchesSettingsContract.PreviewSpec(
                entryTitle,
                "",
                GboardPatchesSettingsContract.PreviewLayout.STACKED,
                new GboardPatchesSettingsContract.PreviewImage(
                        PREVIEW_IMAGE,
                        previewCaption));
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen() {
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                headerBadge,
                entryTitle,
                "",
                Collections.singletonList(new GboardPatchesSettingsContract.StatusBlock(
                        errorTitle,
                        errorSummary,
                        GboardPatchesSettingsContract.StatusTone.WARNING)),
                Collections.emptyList());
    }

    private static String text(Context context, int resourceId) {
        return GboardSettingsText.get(context, resourceId);
    }
}
