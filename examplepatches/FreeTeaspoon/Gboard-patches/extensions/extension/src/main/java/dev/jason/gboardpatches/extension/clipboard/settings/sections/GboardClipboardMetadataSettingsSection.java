package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

final class GboardClipboardMetadataSettingsSection {
    void appendRows(List<GboardPatchesSettingsContract.Row> rows,
            GboardPatchesSettingsContract.FeatureHost host, SharedPreferences preferences,
            boolean clipboardEnabled) {
        Context context = host.getContext();
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_expiry_countdown),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_expiry_countdown_summary),
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
                        R.string.gboard_patches_pref_show_creation_time),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_creation_time_summary),
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
                        R.string.gboard_patches_pref_show_order_index),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_order_index_summary),
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
                        R.string.gboard_patches_pref_order_index_direction),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_order_index_direction_summary),
                currentOrderIndexDirectionLabel(context, preferences),
                clipboardEnabled && showOrderIndex,
                () -> showOrderIndexDirectionDialog(host, preferences)));
    }

    private void showOrderIndexDirectionDialog(GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences) {
        Context context = host.getContext();
        String[] labels = new String[] {
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_order_index_newest_first_default),
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_order_index_oldest_first)
        };
        String[] values = new String[] {
                GboardClipboardSettings.CLIPBOARD_ORDER_INDEX_MODE_NEWEST_FIRST,
                GboardClipboardSettings.CLIPBOARD_ORDER_INDEX_MODE_OLDEST_FIRST
        };
        GboardPatchesSettingsContract.showChoiceDialog(host,
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_order_index_direction),
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
                    R.string.gboard_patches_order_index_oldest_first);
        }
        return GboardSettingsText.get(
                context,
                R.string.gboard_patches_order_index_newest_first_default);
    }

    private GboardPatchesSettingsContract.PreviewSpec buildExpiryCountdownPreview(Context context) {
        return new GboardPatchesSettingsContract.PreviewSpec(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_expiry_countdown),
                "",
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/clipboard/show_expiry_countdown.png",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_preview_countdown_caption)));
    }

    private GboardPatchesSettingsContract.PreviewSpec buildCreationTimePreview(Context context) {
        return new GboardPatchesSettingsContract.PreviewSpec(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_creation_time),
                "",
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/clipboard/show_creation_time.png",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_preview_creation_time_caption)));
    }

    private GboardPatchesSettingsContract.PreviewSpec buildOrderIndexPreview(Context context) {
        return new GboardPatchesSettingsContract.PreviewSpec(
                GboardSettingsText.get(
                        context,
                        R.string.gboard_patches_pref_show_order_index),
                "",
                new GboardPatchesSettingsContract.PreviewImage(
                        "settings-previews/clipboard/show_order_index.png",
                        GboardSettingsText.get(
                                context,
                                R.string.gboard_patches_preview_order_index_caption)));
    }
}
