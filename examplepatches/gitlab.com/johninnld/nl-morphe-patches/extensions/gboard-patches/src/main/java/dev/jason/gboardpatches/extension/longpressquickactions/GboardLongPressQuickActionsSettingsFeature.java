package dev.jason.gboardpatches.extension.longpressquickactions;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardLongPressQuickActionsSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String PREVIEW_VIDEO_ENABLED_ASSET =
            "settings-previews/keyboard/"
                    + "gboard_long_press_quick_actions_enabled_preview.mp4";

    private final String entryTitle;
    private final String entrySummary;
    private final String headerBadge;
    private final String errorTitle;
    private final String errorSummary;
    private final String enabledTitle;
    private final String enabledSummary;
    private final String selectAllTitle;
    private final String selectAllSummary;
    private final String featureSectionTitle;
    private final String mappingsSectionTitle;

    public GboardLongPressQuickActionsSettingsFeature(Context context) {
        this(
                GboardSettingsText.get(context,
                        R.string.gboard_patches_long_press_quick_actions_title),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_long_press_quick_actions_summary),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_header_badge),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_long_press_quick_actions_error_title),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_long_press_quick_actions_error_summary),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_long_press_quick_actions_enabled_title),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_long_press_quick_actions_enabled_summary),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_long_press_quick_actions_select_all_title),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_long_press_quick_actions_select_all_summary),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_long_press_quick_actions_section_feature),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_long_press_quick_actions_section_mappings));
    }

    GboardLongPressQuickActionsSettingsFeature(String entryTitle, String entrySummary,
            String headerBadge, String errorTitle, String errorSummary, String enabledTitle,
            String enabledSummary, String selectAllTitle, String selectAllSummary,
            String featureSectionTitle, String mappingsSectionTitle) {
        this.entryTitle = entryTitle;
        this.entrySummary = entrySummary;
        this.headerBadge = headerBadge;
        this.errorTitle = errorTitle;
        this.errorSummary = errorSummary;
        this.enabledTitle = enabledTitle;
        this.enabledSummary = enabledSummary;
        this.selectAllTitle = selectAllTitle;
        this.selectAllSummary = selectAllSummary;
        this.featureSectionTitle = featureSectionTitle;
        this.mappingsSectionTitle = mappingsSectionTitle;
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
                GboardPatchesFeatureAvailability.FEATURE_LONG_PRESS_QUICK_ACTIONS);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            Context context = host.getContext();
            SharedPreferences preferences = GboardPatchesSettings.preferences(context);
            GboardLongPressQuickActionsSettings.ensureDefault(preferences);
            boolean enabled = GboardLongPressQuickActionsSettings.readEnabled(preferences);
            boolean selectAllWhenUnselected =
                    GboardLongPressQuickActionsSettings.readSelectAllWhenUnselected(preferences);
            List<GboardPatchesSettingsContract.Row> mappings = new ArrayList<>();
            for (GboardEditingShortcutPolicy.Shortcut shortcut
                    : GboardEditingShortcutPolicy.Shortcut.values()) {
                String key = Character.toUpperCase(shortcut.latinKey) + " · " + shortcut.debugName;
                mappings.add(placementRow(host, preferences, shortcut, key, enabled));
            }
            List<GboardPatchesSettingsContract.Row> featureRows = List.of(
                    new GboardPatchesSettingsContract.ToggleRow(
                            enabledTitle, enabledSummary, true, enabled,
                            value -> GboardLongPressQuickActionsSettings.writeEnabled(preferences, value),
                            buildEnabledPreview()),
                    new GboardPatchesSettingsContract.SwitchRow(
                            selectAllTitle, selectAllSummary, enabled, selectAllWhenUnselected,
                            value -> GboardLongPressQuickActionsSettings.writeSelectAllWhenUnselected(
                                    preferences, value)),
                    placementRow(host, preferences, null, "Default menu position", enabled));
            return new GboardPatchesSettingsContract.Screen(
                    entryTitle, headerBadge, entryTitle, "", Collections.emptyList(),
                    List.of(new GboardPatchesSettingsContract.Section(featureSectionTitle, featureRows),
                            new GboardPatchesSettingsContract.Section(mappingsSectionTitle, mappings)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render long-press quick action settings", throwable);
            return buildErrorScreen();
        }
    }

    private GboardPatchesSettingsContract.Row placementRow(
            GboardPatchesSettingsContract.FeatureHost host, SharedPreferences preferences,
            GboardEditingShortcutPolicy.Shortcut shortcut, String title, boolean enabled) {
        String first = GboardLongPressShortcutPlacement.FIRST;
        String last = GboardLongPressShortcutPlacement.LAST;
        String inherit = GboardLongPressQuickActionsSettings.INHERIT_PLACEMENT;
        String[] labels = shortcut == null ? new String[]{"First", "Last"}
                : new String[]{"Use default", "First", "Last"};
        String[] values = shortcut == null ? new String[]{first, last}
                : new String[]{inherit, first, last};
        String selected = GboardLongPressQuickActionsSettings.readPlacement(preferences, shortcut);
        String current = first.equals(selected) ? "First" : last.equals(selected) ? "Last" : "Use default";
        String key = GboardLongPressQuickActionsSettings.placementKey(shortcut);
        return new GboardPatchesSettingsContract.SelectorRow(
                title, "Restart Gboard to apply placement changes.", current, enabled,
                () -> GboardPatchesSettingsContract.showChoiceDialog(
                        host, title, labels, values, selected, "unused", () -> {},
                        value -> {
                            if (preferences.edit().putString(key, value).commit()) {
                                GboardPatchesSettingsContract.refresh(host);
                            }
                        })).setRestartRequired(key);
    }

    private GboardPatchesSettingsContract.PreviewSpec buildEnabledPreview() {
        return new GboardPatchesSettingsContract.PreviewSpec(
                entryTitle,
                "",
                GboardPatchesSettingsContract.PreviewLayout.STACKED,
                GboardPatchesSettingsContract.PreviewVideo.fromAsset(
                        PREVIEW_VIDEO_ENABLED_ASSET,
                        ""));
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


}
