/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.net.Uri;
import android.text.InputType;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.telegram.misc.Accounts;
import app.hushtelegram.extension.telegram.misc.OpenById;

/**
 * The dialog behind Open a chat by ID ({@link OpenById}, #71). Open looks the number up in the
 * app's own tables, and keeps the dialog and what was typed when it isn't a number or this phone
 * hasn't seen it. A chat that's found opens through Telegram's own link, which closes these
 * settings on its way, the way a link from another app does.
 */
final class OpenByIdEditor {
    static final String KEY = "action_open_by_id";

    private OpenByIdEditor() {}

    static AlertDialog open(Activity activity) {
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(android.R.id.edit);
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_SIGNED);
        field.setHint(L10n.t("User or chat ID"));
        field.setImeOptions(EditorInfo.IME_ACTION_GO | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        EditorForm form = new EditorForm(field.getContext(), L10n.t("The number from a profile's ID row, or a chat ID"
                + " the way bots write it."));
        form.add(field, field.getHint().toString());

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Open a chat by ID"))
                .setView(form)
                .setPositiveButton(L10n.t("Open"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Open and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        Button go = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
        // Set after show, so a number that can't be opened keeps the dialog and what was typed.
        go.setOnClickListener(v -> {
            String typed = field.getText().toString();
            if (!OpenById.valid(typed)) {
                refuse(form, field, L10n.t("Type the ID in numbers"));
                return;
            }
            go.setEnabled(false);
            boolean started = OpenById.find(Accounts.selected(), typed, (link, failed) -> {
                go.setEnabled(true);
                // Cancel while it looked closes the dialog, and then nothing opens.
                if (!dialog.isShowing()) return;
                if (link == null) {
                    refuse(form, field, failed ? L10n.t("Couldn't open that. Try again.")
                            : L10n.t("This app hasn't seen that ID yet"));
                    return;
                }
                dialog.dismiss();
                try {
                    activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(link))
                            .setClassName(activity, SettingsEntry.LAUNCHER_ACTIVITY));
                } catch (RuntimeException failure) {
                    Logger.printException(() -> "Open by ID: Telegram didn't take the link", failure);
                    Utils.showToastLong(L10n.t("Couldn't open that. Try again."));
                }
            });
            if (!started) {
                go.setEnabled(true);
                refuse(form, field, L10n.t("Couldn't open that. Try again."));
            }
        });
        field.setOnEditorActionListener((view, action, event) -> {
            if (action != EditorInfo.IME_ACTION_GO) return false;
            // The keyboard's Go is the Open button, and an Open that's looking takes no second tap.
            if (go.isEnabled()) go.performClick();
            return true;
        });
        return dialog;
    }

    private static void refuse(EditorForm form, EditText field, String reason) {
        form.refuse(field, reason);
        Utils.showToastLong(reason);
    }
}
