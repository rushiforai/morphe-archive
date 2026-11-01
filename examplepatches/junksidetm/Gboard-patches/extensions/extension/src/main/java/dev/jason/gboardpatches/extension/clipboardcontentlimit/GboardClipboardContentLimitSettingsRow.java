package dev.jason.gboardpatches.extension.clipboardcontentlimit;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardClipboardContentLimitSettingsRow {
    public void appendRow(List<GboardPatchesSettingsContract.Row> rows,
            GboardPatchesSettingsContract.FeatureHost host) {
        Context context = host.getContext();
        SharedPreferences preferences =
                GboardClipboardContentLimitSettings.preferences(context);
        GboardClipboardContentLimitSettings.ensureDefault(preferences);
        int currentValue =
                GboardClipboardContentLimitSettings.readMaxCharacters(preferences);
        rows.add(new GboardPatchesSettingsContract.SelectorRow(
                GboardSettingsText.get(context,
                        R.string.gboard_patches_clipboard_content_limit_title),
                GboardSettingsText.get(context,
                        R.string.gboard_patches_clipboard_content_limit_summary),
                Integer.toString(currentValue),
                true,
                () -> GboardPatchesSettingsContract.showPositiveIntegerDialog(
                        host,
                        GboardSettingsText.get(context,
                                R.string.gboard_patches_clipboard_content_limit_dialog_title),
                        GboardSettingsText.get(context,
                                R.string.gboard_patches_clipboard_content_limit_dialog_hint),
                        currentValue,
                        value -> GboardClipboardContentLimitSettings.writeMaxCharacters(
                                context, value))));
    }
}
