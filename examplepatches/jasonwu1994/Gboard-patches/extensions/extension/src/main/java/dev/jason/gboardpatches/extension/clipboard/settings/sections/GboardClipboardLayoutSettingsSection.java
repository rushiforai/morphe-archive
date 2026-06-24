package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

final class GboardClipboardLayoutSettingsSection {
    private static final String TITLE_COLUMN_COUNT = "Clipboard columns";
    private static final String SUMMARY_COLUMN_COUNT =
            "Controls how many columns the clipboard grid uses.";
    private static final String TITLE_PREVIEW_LINES = "Clipboard preview lines";
    private static final String SUMMARY_PREVIEW_LINES =
            "Controls how many preview lines each clipboard item can show before truncation.";
    private static final String LABEL_COLUMN_ONE = "1";
    private static final String LABEL_COLUMN_TWO_DEFAULT = "2 (Default)";
    private static final String LABEL_COLUMN_THREE = "3";
    private static final String LABEL_FIVE_DEFAULT = "5 (Default)";
    private static final String LABEL_TEN_PREVIEW = "10";
    private static final String LABEL_CUSTOM = "Custom";
    private static final String DIALOG_TITLE_CUSTOM_PREVIEW_LINES = "Custom preview lines";
    private static final String DIALOG_HINT_LINES = "Lines";

    void appendRows(List<GboardPatchesSettingsContract.Row> rows,
            GboardPatchesSettingsContract.Host host, SharedPreferences preferences,
            boolean clipboardEnabled) {
        Context context = host.getContext();
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_clipboard_columns,
                        TITLE_COLUMN_COUNT),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_clipboard_columns_summary,
                        SUMMARY_COLUMN_COUNT),
                currentColumnCountLabel(context, preferences),
                clipboardEnabled,
                () -> showColumnCountDialog(host, preferences),
                buildColumnCountPreview(context)));
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_content_max_lines,
                        TITLE_PREVIEW_LINES),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_content_max_lines_summary,
                        SUMMARY_PREVIEW_LINES),
                currentPreviewLinesLabel(context, preferences),
                clipboardEnabled,
                () -> showPreviewLinesDialog(host, preferences),
                buildPreviewLinesPreview(context)));
    }

    private void showColumnCountDialog(GboardPatchesSettingsContract.Host host,
            SharedPreferences preferences) {
        Context context = host.getContext();
        String[] labels = new String[] {
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_clipboard_columns_one,
                        LABEL_COLUMN_ONE),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_clipboard_columns_two_default,
                        LABEL_COLUMN_TWO_DEFAULT),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_clipboard_columns_three,
                        LABEL_COLUMN_THREE)
        };
        String[] values = new String[] {
                Integer.toString(GboardClipboardSettings.CLIPBOARD_COLUMN_COUNT_ONE),
                Integer.toString(GboardClipboardSettings.CLIPBOARD_COLUMN_COUNT_TWO),
                Integer.toString(GboardClipboardSettings.CLIPBOARD_COLUMN_COUNT_THREE)
        };
        host.showChoiceDialog(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_clipboard_columns,
                        TITLE_COLUMN_COUNT),
                labels,
                values,
                Integer.toString(GboardClipboardSettings.readClipboardColumnCount(preferences)),
                "",
                () -> {
                },
                value -> preferences.edit()
                        .putString(
                                GboardClipboardSettings.PREF_KEY_CLIPBOARD_COLUMN_COUNT,
                                value)
                        .apply());
    }

    private void showPreviewLinesDialog(GboardPatchesSettingsContract.Host host,
            SharedPreferences preferences) {
        Context context = host.getContext();
        String[] labels = new String[] {
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_content_max_lines_option_five_default,
                        LABEL_FIVE_DEFAULT),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_content_max_lines_option_ten,
                        LABEL_TEN_PREVIEW),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_option_custom,
                        LABEL_CUSTOM)
        };
        String[] values = new String[] {
                Integer.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_CONTENT_MAX_LINES),
                Integer.toString(GboardClipboardSettings.CLIPBOARD_CONTENT_MAX_LINES_EXTENDED),
                GboardClipboardSettings.PREF_VALUE_CUSTOM
        };
        host.showChoiceDialog(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_content_max_lines,
                        TITLE_PREVIEW_LINES),
                labels,
                values,
                GboardClipboardSettingsSupport.readSelectionValue(
                        preferences,
                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_CONTENT_MAX_LINES,
                        Integer.toString(
                                GboardClipboardSettings.DEFAULT_CLIPBOARD_CONTENT_MAX_LINES)),
                GboardClipboardSettings.PREF_VALUE_CUSTOM,
                () -> host.showPositiveIntegerDialog(
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_custom_content_max_lines_dialog_title,
                                DIALOG_TITLE_CUSTOM_PREVIEW_LINES),
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_custom_content_max_lines_dialog_hint,
                                DIALOG_HINT_LINES),
                        GboardClipboardSettings.readClipboardContentMaxLinesCustomValue(
                                preferences),
                        value -> preferences.edit()
                                .putString(
                                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_CONTENT_MAX_LINES,
                                        GboardClipboardSettings.PREF_VALUE_CUSTOM)
                                .putInt(
                                        GboardClipboardSettings.PREF_KEY_CLIPBOARD_CONTENT_MAX_LINES_CUSTOM,
                                        value)
                                .apply()),
                value -> preferences.edit()
                        .putString(
                                GboardClipboardSettings.PREF_KEY_CLIPBOARD_CONTENT_MAX_LINES,
                                value)
                        .apply());
    }

    private String currentColumnCountLabel(Context context, SharedPreferences preferences) {
        int selection = GboardClipboardSettings.readClipboardColumnCount(preferences);
        if (selection == GboardClipboardSettings.CLIPBOARD_COLUMN_COUNT_ONE) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_clipboard_columns_one,
                    LABEL_COLUMN_ONE);
        }
        if (selection == GboardClipboardSettings.CLIPBOARD_COLUMN_COUNT_THREE) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_clipboard_columns_three,
                    LABEL_COLUMN_THREE);
        }
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_clipboard_columns_two_default,
                LABEL_COLUMN_TWO_DEFAULT);
    }

    private String currentPreviewLinesLabel(Context context, SharedPreferences preferences) {
        String selection = GboardClipboardSettingsSupport.readSelectionValue(
                preferences,
                GboardClipboardSettings.PREF_KEY_CLIPBOARD_CONTENT_MAX_LINES,
                Integer.toString(GboardClipboardSettings.DEFAULT_CLIPBOARD_CONTENT_MAX_LINES));
        if (GboardClipboardSettings.PREF_VALUE_CUSTOM.equals(selection)) {
            return GboardClipboardSettingsSupport.formatCustomCountLabel(
                    context,
                    GboardClipboardSettings.readClipboardContentMaxLinesCustomValue(preferences));
        }
        if (Integer.toString(GboardClipboardSettings.CLIPBOARD_CONTENT_MAX_LINES_EXTENDED)
                .equals(selection)) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_content_max_lines_option_ten,
                    LABEL_TEN_PREVIEW);
        }
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_content_max_lines_option_five_default,
                LABEL_FIVE_DEFAULT);
    }

    private GboardPatchesSettingsContract.PreviewSpec buildColumnCountPreview(Context context) {
        return new GboardPatchesSettingsContract.PreviewSpec(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_clipboard_columns,
                        TITLE_COLUMN_COUNT),
                "",
                GboardPatchesSettingsContract.PreviewLayout.STACKED,
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/clipboard/column_count_one.png",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_preview_column_count_one_caption,
                                "1 column")),
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/clipboard/column_count_three.png",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_preview_column_count_three_caption,
                                "3 columns")));
    }

    private GboardPatchesSettingsContract.PreviewSpec buildPreviewLinesPreview(Context context) {
        return new GboardPatchesSettingsContract.PreviewSpec(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_content_max_lines,
                        TITLE_PREVIEW_LINES),
                "",
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/clipboard/preview_lines_default_5.png",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_preview_lines_default_caption,
                                "Default (5 lines)")),
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/clipboard/preview_lines_extended_8.png",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_preview_lines_extended_caption,
                                "Extended (8 lines)")));
    }
}
