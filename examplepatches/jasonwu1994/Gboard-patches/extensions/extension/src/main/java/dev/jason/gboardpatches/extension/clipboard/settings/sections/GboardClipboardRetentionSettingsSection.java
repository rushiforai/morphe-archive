package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

final class GboardClipboardRetentionSettingsSection {
    void appendRows(List<GboardPatchesSettingsContract.Row> rows,
            GboardPatchesSettingsContract.FeatureHost host, SharedPreferences preferences,
            boolean clipboardEnabled) {
        Context context = host.getContext();
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                GboardSettingsText.get(context, R.string.gboard_patches_pref_ttl),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_ttl_summary),
                currentTtlLabel(context, preferences),
                clipboardEnabled,
                () -> showTtlDialog(host, preferences)));
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_max_count),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_max_count_summary),
                currentMaxCountLabel(context, preferences),
                clipboardEnabled,
                () -> showMaxCountDialog(host, preferences)));
    }

    private void showTtlDialog(GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences) {
        Context context = host.getContext();
        String[] labels = new String[] {
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_ttl_option_one_minute),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_ttl_option_one_hour_default),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_option_infinite),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_option_custom)
        };
        String[] values = new String[] {
                Long.toString(GboardClipboardSettings.TTL_ONE_MINUTE_MS),
                Long.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_TTL_MS),
                Long.toString(GboardClipboardSettings.INFINITE_TTL_MS),
                GboardClipboardSettings.PREF_VALUE_CUSTOM
        };
        GboardPatchesSettingsContract.showChoiceDialog(host,
                GboardSettingsText.get(context, R.string.gboard_patches_pref_ttl),
                labels,
                values,
                GboardClipboardSettingsSupport.readSelectionValue(
                        preferences,
                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_TTL_MS,
                        Long.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_TTL_MS)),
                GboardClipboardSettings.PREF_VALUE_CUSTOM,
                () -> GboardPatchesSettingsContract.showPositiveIntegerDialog(host,
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_custom_ttl_dialog_title),
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_custom_ttl_dialog_hint),
                        GboardClipboardSettings.readClipboardTtlCustomMinutes(preferences),
                        value -> preferences.edit()
                                .putString(
                                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_TTL_MS,
                                        GboardClipboardSettings.PREF_VALUE_CUSTOM)
                                .putInt(
                                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_TTL_CUSTOM_MINUTES,
                                        value)
                                .apply()),
                value -> preferences.edit()
                        .putString(GboardClipboardSettings.PREF_KEY_CLIPBOARD_TTL_MS, value)
                        .apply());
    }

    private void showMaxCountDialog(GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences) {
        Context context = host.getContext();
        String[] labels = new String[] {
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_max_count_option_ten),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_max_count_option_hundred_default),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_option_infinite),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_option_custom)
        };
        String[] values = new String[] {
                Integer.toString(GboardClipboardSettings.MAX_COUNT_TEN),
                Integer.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_MAX_COUNT),
                Integer.toString(GboardClipboardSettings.INFINITE_MAX_COUNT),
                GboardClipboardSettings.PREF_VALUE_CUSTOM
        };
        GboardPatchesSettingsContract.showChoiceDialog(host,
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_max_count),
                labels,
                values,
                GboardClipboardSettingsSupport.readSelectionValue(
                        preferences,
                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_MAX_COUNT,
                        Integer.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_MAX_COUNT)),
                GboardClipboardSettings.PREF_VALUE_CUSTOM,
                () -> GboardPatchesSettingsContract.showPositiveIntegerDialog(host,
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_custom_max_count_dialog_title),
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_custom_max_count_dialog_hint),
                        GboardClipboardSettings.readClipboardMaxCountCustomValue(preferences),
                        value -> preferences.edit()
                                .putString(
                                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_MAX_COUNT,
                                        GboardClipboardSettings.PREF_VALUE_CUSTOM)
                                .putInt(
                                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_MAX_COUNT_CUSTOM,
                                        value)
                                .apply()),
                value -> preferences.edit()
                        .putString(GboardClipboardSettings.PREF_KEY_CLIPBOARD_MAX_COUNT, value)
                        .apply());
    }

    private String currentTtlLabel(Context context, SharedPreferences preferences) {
        String selection = GboardClipboardSettingsSupport.readSelectionValue(
                preferences,
                GboardClipboardSettings.PREF_KEY_CLIPBOARD_TTL_MS,
                Long.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_TTL_MS));
        if (GboardClipboardSettings.PREF_VALUE_CUSTOM.equals(selection)) {
            return GboardClipboardSettingsSupport.formatCustomMinutesLabel(
                    context,
                    GboardClipboardSettings.readClipboardTtlCustomMinutes(preferences));
        }
        if (Long.toString(GboardClipboardSettings.TTL_ONE_MINUTE_MS).equals(selection)) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_ttl_option_one_minute);
        }
        if (Long.toString(GboardClipboardSettings.INFINITE_TTL_MS).equals(selection)) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_option_infinite);
        }
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_ttl_option_one_hour_default);
    }

    private String currentMaxCountLabel(Context context, SharedPreferences preferences) {
        String selection = GboardClipboardSettingsSupport.readSelectionValue(
                preferences,
                GboardClipboardSettings.PREF_KEY_CLIPBOARD_MAX_COUNT,
                Integer.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_MAX_COUNT));
        if (GboardClipboardSettings.PREF_VALUE_CUSTOM.equals(selection)) {
            return GboardClipboardSettingsSupport.formatCustomCountLabel(
                    context,
                    GboardClipboardSettings.readClipboardMaxCountCustomValue(preferences));
        }
        if (Integer.toString(GboardClipboardSettings.MAX_COUNT_TEN).equals(selection)) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_max_count_option_ten);
        }
        if (Integer.toString(GboardClipboardSettings.INFINITE_MAX_COUNT).equals(selection)) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_option_infinite);
        }
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_max_count_option_hundred_default);
    }
}
