package dev.jason.gboardpatches.extension.textexpander;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardTextExpanderSettingsFeature implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardTextExpander";
    private static final String EDIT = "edit";
    private static final String DELETE = "delete";
    private final Context context;

    public GboardTextExpanderSettingsFeature(Context context) {
        this.context = context;
    }

    @Override public String getEntryTitle() {
        return text(R.string.gboard_patches_text_expander_title);
    }

    @Override public String getEntrySummary() {
        return text(R.string.gboard_patches_text_expander_entry_summary);
    }

    @Override public boolean isAvailable(Context host) {
        return GboardPatchesFeatureAvailability.hasFeature(host,
                GboardPatchesFeatureAvailability.FEATURE_TEXT_EXPANDER);
    }

    @Override public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            return buildSettingsScreen(host);
        } catch (Throwable failure) {
            try {
                Log.w(TAG, "Failed to render text expander settings", failure);
            } catch (Throwable ignored) {
                // The warning screen below is still returned.
            }
            return new GboardPatchesSettingsContract.Screen(
                    getEntryTitle(), text(R.string.gboard_patches_header_badge), getEntryTitle(),
                    text(R.string.gboard_patches_text_expander_summary),
                    List.of(new GboardPatchesSettingsContract.StatusBlock(
                            text(R.string.gboard_patches_flag_patch_error_title),
                            text(R.string.gboard_patches_flag_patch_error_summary),
                            GboardPatchesSettingsContract.StatusTone.WARNING)), List.of());
        }
    }

    private GboardPatchesSettingsContract.Screen buildSettingsScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        SharedPreferences preferences = GboardPatchesSettings.preferencesOrNull(host.getContext());
        boolean writable = preferences != null;
        var toggle = new GboardPatchesSettingsContract.ToggleRow(
                getEntryTitle(), "", writable,
                GboardTextExpanderSettings.enabled(preferences),
                value -> {
                    if (!preferences.edit().putBoolean(GboardTextExpanderSettings.ENABLED, value)
                            .commit()) {
                        throw new IllegalStateException("Unable to save text expander");
                    }
                })
                .setMasterToggle(true);

        Map<String, String> shortcuts = GboardTextExpanderSettings.shortcuts(preferences);
        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
        for (Map.Entry<String, String> entry : shortcuts.entrySet()) {
            rows.add(new GboardPatchesSettingsContract.ActionRow(entry.getKey(),
                    preview(entry.getValue()), writable,
                    () -> chooseAction(host, preferences, entry.getKey())));
        }
        rows.add(new GboardPatchesSettingsContract.CommandRow(
                text(R.string.gboard_patches_text_expander_add),
                shortcuts.isEmpty() ? text(R.string.gboard_patches_text_expander_empty) : "",
                writable, () -> addShortcut(host, preferences)));

        return new GboardPatchesSettingsContract.Screen(
                getEntryTitle(), text(R.string.gboard_patches_header_badge), getEntryTitle(),
                text(R.string.gboard_patches_text_expander_summary), List.of(),
                List.of(new GboardPatchesSettingsContract.Section(
                                text(R.string.gboard_patches_flag_patch_section_feature),
                                List.of(toggle)),
                        new GboardPatchesSettingsContract.Section(
                                text(R.string.gboard_patches_text_expander_section_shortcuts),
                                rows)),
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT);
    }

    private void addShortcut(GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences) {
        GboardPatchesSettingsContract.showTextInputDialog(host,
                text(R.string.gboard_patches_text_expander_add),
                text(R.string.gboard_patches_text_expander_shortcut_hint), "",
                shortcut -> {
                    String trimmed = shortcut == null ? "" : shortcut.trim();
                    if (!GboardTextExpander.validShortcut(trimmed)) {
                        GboardPatchesSettingsContract.showMessage(host,
                                text(R.string.gboard_patches_text_expander_invalid_shortcut));
                        return;
                    }
                    String existing = GboardTextExpanderSettings.shortcuts(preferences).get(trimmed);
                    editExpansion(host, preferences, trimmed, existing == null ? "" : existing);
                });
    }

    private void chooseAction(GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences, String shortcut) {
        GboardPatchesSettingsContract.showChoiceDialog(host, shortcut,
                new String[] {text(R.string.gboard_patches_text_expander_edit),
                        text(R.string.gboard_patches_text_expander_delete)},
                new String[] {EDIT, DELETE}, null, null, null,
                choice -> {
                    Map<String, String> current = GboardTextExpanderSettings.shortcuts(preferences);
                    if (EDIT.equals(choice)) {
                        String value = current.get(shortcut);
                        editExpansion(host, preferences, shortcut, value == null ? "" : value);
                    } else if (DELETE.equals(choice)) {
                        current.remove(shortcut);
                        save(host, preferences, current);
                    }
                });
    }

    private void editExpansion(GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences, String shortcut, String initial) {
        GboardPatchesSettingsContract.showTextInputDialog(host, shortcut,
                text(R.string.gboard_patches_text_expander_expansion_hint), initial,
                expansion -> {
                    if (expansion == null || expansion.isEmpty()) return;
                    Map<String, String> current =
                            new LinkedHashMap<>(GboardTextExpanderSettings.shortcuts(preferences));
                    current.put(shortcut, expansion);
                    save(host, preferences, current);
                });
    }

    @SuppressLint("ApplySharedPref")
    private void save(GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences, Map<String, String> shortcuts) {
        if (!GboardTextExpanderSettings.writeShortcuts(preferences, shortcuts)) {
            GboardPatchesSettingsContract.showMessage(host,
                    text(R.string.gboard_patches_text_expander_save_failed));
        }
        GboardPatchesSettingsContract.refresh(host);
    }

    private static String preview(String expansion) {
        String line = expansion.replace('\n', ' ');
        return line.length() > 80 ? line.substring(0, 80) + "…" : line;
    }

    private String text(int id) {
        return GboardSettingsText.get(context, id);
    }
}
