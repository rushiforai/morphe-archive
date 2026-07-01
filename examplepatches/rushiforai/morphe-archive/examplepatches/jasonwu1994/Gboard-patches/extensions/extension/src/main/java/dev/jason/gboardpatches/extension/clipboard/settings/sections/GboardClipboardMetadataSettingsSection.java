package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

final class GboardClipboardMetadataSettingsSection {
    private static final String TITLE_SHOW_EXPIRY_COUNTDOWN = "Show expiry countdown";
    private static final String SUMMARY_SHOW_EXPIRY_COUNTDOWN =
            "Shows the remaining retention time above each clipboard item.";
    private static final String TITLE_SHOW_CREATION_TIME = "Show creation time";
    private static final String SUMMARY_SHOW_CREATION_TIME =
            "Shows when each clipboard item was created in the current device time zone.";
    private static final String TITLE_SHOW_ORDER_INDEX = "Show order index";
    private static final String SUMMARY_SHOW_ORDER_INDEX =
            "Shows [1], [2], and so on above each clipboard item.";
    private static final String TITLE_ORDER_INDEX_DIRECTION = "Order index direction";
    private static final String SUMMARY_ORDER_INDEX_DIRECTION =
            "Controls whether [1] marks the newest or oldest clipboard item.";
    private static final String LABEL_NEWEST_FIRST_DEFAULT = "Newest first (Default)";
    private static final String LABEL_OLDEST_FIRST = "Oldest first";

    void appendRows(List<GboardPatchesSettingsContract.Row> rows,
            GboardPatchesSettingsContract.Host host, SharedPreferences preferences,
            boolean clipboardEnabled) {
        Context context = host.getContext();
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_expiry_countdown,
                        TITLE_SHOW_EXPIRY_COUNTDOWN),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_expiry_countdown_summary,
                        SUMMARY_SHOW_EXPIRY_COUNTDOWN),
                clipboardEnabled,
                GboardClipboardSettings.readClipboardShowCountdown(preferences),
                value -> preferences.edit()
                        .putBoolean(
                                GboardClipboardSettings.PREF_KEY_CLIPBOARD_SHOW_COUNTDOWN,
                                value)
                        .apply(),
                buildExpiryCountdownPreview(context)));
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_creation_time,
                        TITLE_SHOW_CREATION_TIME),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_creation_time_summary,
                        SUMMARY_SHOW_CREATION_TIME),
                clipboardEnabled,
                GboardClipboardSettings.readClipboardShowCreationTime(preferences),
                value -> preferences.edit()
                        .putBoolean(
                                GboardClipboardSettings.PREF_KEY_CLIPBOARD_SHOW_CREATION_TIME,
                                value)
                        .apply(),
                buildCreationTimePreview(context)));

        boolean showOrderIndex = GboardClipboardSettings.readClipboardShowOrderIndex(preferences);
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_order_index,
                        TITLE_SHOW_ORDER_INDEX),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_order_index_summary,
                        SUMMARY_SHOW_ORDER_INDEX),
                clipboardEnabled,
                showOrderIndex,
                value -> preferences.edit()
                        .putBoolean(
                                GboardClipboardSettings.PREF_KEY_CLIPBOARD_SHOW_ORDER_INDEX,
                                value)
                        .apply(),
                buildOrderIndexPreview(context)));
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_order_index_direction,
                        TITLE_ORDER_INDEX_DIRECTION),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_order_index_direction_summary,
                        SUMMARY_ORDER_INDEX_DIRECTION),
                currentOrderIndexDirectionLabel(context, preferences),
                clipboardEnabled && showOrderIndex,
                () -> showOrderIndexDirectionDialog(host, preferences)));
    }

    private void showOrderIndexDirectionDialog(GboardPatchesSettingsContract.Host host,
            SharedPreferences preferences) {
        Context context = host.getContext();
        String[] labels = new String[] {
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_order_index_newest_first_default,
                        LABEL_NEWEST_FIRST_DEFAULT),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_order_index_oldest_first,
                        LABEL_OLDEST_FIRST)
        };
        String[] values = new String[] {
                GboardClipboardSettings.CLIPBOARD_ORDER_INDEX_MODE_NEWEST_FIRST,
                GboardClipboardSettings.CLIPBOARD_ORDER_INDEX_MODE_OLDEST_FIRST
        };
        host.showChoiceDialog(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_order_index_direction,
                        TITLE_ORDER_INDEX_DIRECTION),
                labels,
                values,
                GboardClipboardSettings.readClipboardOrderIndexMode(preferences),
                "",
                () -> {
                },
                value -> preferences.edit()
                        .putString(
                                GboardClipboardSettings.PREF_KEY_CLIPBOARD_ORDER_INDEX_MODE,
                                value)
                        .apply());
    }

    private String currentOrderIndexDirectionLabel(Context context,
            SharedPreferences preferences) {
        String selection = GboardClipboardSettings.readClipboardOrderIndexMode(preferences);
        if (GboardClipboardSettings.CLIPBOARD_ORDER_INDEX_MODE_OLDEST_FIRST.equals(selection)) {
            return GboardSettingsText.get(
                    context,
                    R.string.gboard_patches_order_index_oldest_first,
                    LABEL_OLDEST_FIRST);
        }
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_order_index_newest_first_default,
                LABEL_NEWEST_FIRST_DEFAULT);
    }

    private GboardPatchesSettingsContract.PreviewSpec buildExpiryCountdownPreview(Context context) {
        return new GboardPatchesSettingsContract.PreviewSpec(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_expiry_countdown,
                        TITLE_SHOW_EXPIRY_COUNTDOWN),
                "",
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/clipboard/show_expiry_countdown.png",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_preview_countdown_caption,
                                "Countdown example")));
    }

    private GboardPatchesSettingsContract.PreviewSpec buildCreationTimePreview(Context context) {
        return new GboardPatchesSettingsContract.PreviewSpec(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_creation_time,
                        TITLE_SHOW_CREATION_TIME),
                "",
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/clipboard/show_creation_time.png",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_preview_creation_time_caption,
                                "Creation time example")));
    }

    private GboardPatchesSettingsContract.PreviewSpec buildOrderIndexPreview(Context context) {
        return new GboardPatchesSettingsContract.PreviewSpec(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_order_index,
                        TITLE_SHOW_ORDER_INDEX),
                "",
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/clipboard/show_order_index.png",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_preview_order_index_caption,
                                "Order index example")));
    }
}
