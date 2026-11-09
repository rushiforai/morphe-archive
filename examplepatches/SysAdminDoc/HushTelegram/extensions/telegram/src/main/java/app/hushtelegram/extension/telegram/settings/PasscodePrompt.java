/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.text.InputType;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.telegram.misc.AppPasscode;

/**
 * Asks for Telegram's app passcode before something HushTelegram keeps out of sight opens. A right
 * answer runs the action once and closes the prompt. A wrong one says so and keeps the prompt, and
 * after a few in a row it waits a moment, so a PIN can't be guessed by tapping through it.
 */
public final class PasscodePrompt {
    private PasscodePrompt() {}

    /**
     * Shows the prompt over [activity]. [granted] runs on the main thread after the right passcode.
     * Without a passcode set it runs at once, since there's nothing to ask.
     *
     * @return the prompt, or null when none was needed
     */
    public static AlertDialog ask(Activity activity, String title, Runnable granted) {
        if (!AppPasscode.isSet()) {
            granted.run();
            return null;
        }
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(android.R.id.edit);
        field.setSingleLine(true);
        field.setInputType(AppPasscode.isPin()
                ? InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_VARIATION_PASSWORD
                : InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        field.setHint(L10n.t("Telegram passcode"));
        field.setImeOptions(EditorInfo.IME_ACTION_DONE | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        EditorForm form = new EditorForm(field.getContext(), L10n.t("Type the passcode you use to unlock Telegram."));
        form.add(field, field.getHint().toString());

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(title)
                .setView(form)
                .setPositiveButton(L10n.t("Unlock"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Unlock and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        // Set after show, so a wrong passcode keeps the prompt and what was typed.
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String typed = field.getText().toString();
            if (AppPasscode.matches(typed)) {
                dialog.dismiss();
                granted.run();
                return;
            }
            long wait = AppPasscode.waitMillis();
            String refused = wait > 0
                    ? L10n.f("Too many tries. Wait %1$s seconds and try again.", String.valueOf((wait + 999) / 1000))
                    : L10n.t("That's not your passcode.");
            form.refuse(field, refused);
            Utils.showToastLong(refused);
        });
        field.setOnEditorActionListener((view, action, event) -> {
            if (action != EditorInfo.IME_ACTION_DONE) return false;
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            return true;
        });
        return dialog;
    }
}
