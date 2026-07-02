package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

final class GboardClipboardRetentionSettingsSection {
    private static final String TITLE_TTL = "Retention TTL";
    private static final String SUMMARY_TTL =
            "Controls how long unpinned clipboard items are retained.";
    private static final String TITLE_MAX_COUNT = "Max count";
    private static final String SUMMARY_MAX_COUNT =
            "Limits how many unpinned clipboard items stay visible at the same time.";
    private static final String LABEL_CUSTOM = "Custom";
    private static final String LABEL_INFINITE = "Infinite";
    private static final String LABEL_ONE_MINUTE = "1 minute";
    private static final String LABEL_ONE_HOUR_DEFAULT = "1 hour (Default)";
    private static final String LABEL_TEN = "10";
    private static final String LABEL_HUNDRED_DEFAULT = "100 (Default)";
    private static final String DIALOG_TITLE_CUSTOM_TTL = "Custom retention TTL";
    private static final String DIALOG_HINT_MINUTES = "Minutes";
    private static final String DIALOG_TITLE_CUSTOM_MAX_COUNT = "Custom max count";
    private static final String DIALOG_HINT_COUNT = "Count";

    void appendRows(List<GboardPatchesSettingsContract.Row> rows,
            GboardPatchesSettingsContract.Host host, SharedPreferences preferences,
            boolean clipboardEnabled) {
        Context context = host.getContext();
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                GboardSettingsText.get(context, R.string.gboard_patches_pref_ttl, TITLE_TTL),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_ttl_summary,
                        SUMMARY_TTL),
                currentTtlLabel(context, preferences),
                clipboardEnabled,
                () -> showTtlDialog(host, preferences)));
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_max_count,
                        TITLE_MAX_COUNT),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_max_count_summary,
                        SUMMARY_MAX_COUNT),
                currentMaxCountLabel(context, preferences),
                clipboardEnabled,
                () -> showMaxCountDialog(host, preferences)));
    }

    private void showTtlDialog(GboardPatchesSettingsContract.Host host,
            SharedPreferences preferences) {
        Context context = host.getContext();
        String[] labels = new String[] {
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_ttl_option_one_minute,
                        LABEL_ONE_MINUTE),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_ttl_option_one_hour_default,
                        LABEL_ONE_HOUR_DEFAULT),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_option_infinite,
                        LABEL_INFINITE),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_option_custom,
                        LABEL_CUSTOM)
        };
        String[] values = new String[] {
                Long.toString(GboardClipboardSettings.TTL_ONE_MINUTE_MS),
                Long.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_TTL_MS),
                Long.toString(GboardClipboardSettings.INFINITE_TTL_MS),
                GboardClipboardSettings.PREF_VALUE_CUSTOM
        };
        host.showChoiceDialog(
                GboardSettingsText.get(context, R.string.gboard_patches_pref_ttl, TITLE_TTL),
                labels,
                values,
                GboardClipboardSettingsSupport.readSelectionValue(
                        preferences,
                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_TTL_MS,
                        Long.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_TTL_MS)),
                GboardClipboardSettings.PREF_VALUE_CUSTOM,
                () -> host.showPositiveIntegerDialog(
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_custom_ttl_dialog_title,
                                DIALOG_TITLE_CUSTOM_TTL),
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_custom_ttl_dialog_hint,
                                DIALOG_HINT_MINUTES),
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

    private void showMaxCountDialog(GboardPatchesSettingsContract.Host host,
            SharedPreferences preferences) {
        Context context = host.getContext();
        String[] labels = new String[] {
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_max_count_option_ten,
                        LABEL_TEN),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_max_count_option_hundred_default,
                        LABEL_HUNDRED_DEFAULT),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_option_infinite,
                        LABEL_INFINITE),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_option_custom,
                        LABEL_CUSTOM)
        };
        String[] values = new String[] {
                Integer.toString(GboardClipboardSettings.MAX_COUNT_TEN),
                Integer.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_MAX_COUNT),
                Integer.toString(GboardClipboardSettings.INFINITE_MAX_COUNT),
                GboardClipboardSettings.PREF_VALUE_CUSTOM
        };
        host.showChoiceDialog(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_max_count,
                        TITLE_MAX_COUNT),
                labels,
                values,
                GboardClipboardSettingsSupport.readSelectionValue(
                        preferences,
                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_MAX_COUNT,
                        Integer.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_MAX_COUNT)),
                GboardClipboardSettings.PREF_VALUE_CUSTOM,
                () -> host.showPositiveIntegerDialog(
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_custom_max_count_dialog_title,
                                DIALOG_TITLE_CUSTOM_MAX_COUNT),
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_custom_max_count_dialog_hint,
                                DIALOG_HINT_COUNT),
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
                    R.string.gboard_patches_ttl_option_one_minute,
                    LABEL_ONE_MINUTE);
        }
        if (Long.toString(GboardClipboardSettings.INFINITE_TTL_MS).equals(selection)) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_option_infinite,
                    LABEL_INFINITE);
        }
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_ttl_option_one_hour_default,
                LABEL_ONE_HOUR_DEFAULT);
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
                    R.string.gboard_patches_max_count_option_ten,
                    LABEL_TEN);
        }
        if (Integer.toString(GboardClipboardSettings.INFINITE_MAX_COUNT).equals(selection)) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_option_infinite,
                    LABEL_INFINITE);
        }
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_max_count_option_hundred_default,
                LABEL_HUNDRED_DEFAULT);
    }
}
