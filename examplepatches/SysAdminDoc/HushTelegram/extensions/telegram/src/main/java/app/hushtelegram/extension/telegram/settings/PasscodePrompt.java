/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.text.InputFilter;
import android.text.InputType;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.telegram.misc.AppPasscode;
import app.hushtelegram.extension.telegram.misc.DuressWipe;

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

    /** The Set duress passcode dialog's message, which says what typing the code does with [action] picked. */
    static String duressMessage(String action) {
        if (DuressWipe.LOG_OUT_OPEN.equals(action)) {
            return L10n.t("Typing this on Telegram's lock screen logs out the open account. "
                    + "Pick one that's different from your Telegram passcode.");
        }
        if (DuressWipe.DELETE_ALL.equals(action)) {
            return L10n.t("Typing this twice on Telegram's lock screen deletes every account on this phone for good. "
                    + "Pick one that's different from your Telegram passcode.");
        }
        if (DuressWipe.DELETE_OPEN.equals(action)) {
            return L10n.t("Typing this twice on Telegram's lock screen deletes the open account for good. "
                    + "Pick one that's different from your Telegram passcode.");
        }
        return L10n.t("Typing this on Telegram's lock screen logs out every account on this phone. "
                + "Pick one that's different from your Telegram passcode.");
    }

    /**
     * Asks for a duress passcode (#79) twice, with the keyboard Telegram's own passcode uses. A code
     * that's empty, the wrong length for a PIN or Telegram's own passcode is refused and the dialog
     * stays, as it does when the two don't match. Only a salted hash of the code is saved, by
     * {@link DuressWipe}, and [saved] runs on the main thread once it is.
     */
    public static AlertDialog chooseDuress(Activity activity, Runnable saved) {
        EditText code = duressField(activity, android.R.id.edit, L10n.t("Duress passcode"));
        EditText again = duressField(activity, android.R.id.text2, L10n.t("Type it again"));
        EditorForm form = new EditorForm(code.getContext(), duressMessage(DuressWipe.action()));
        form.add(code, code.getHint().toString());
        form.add(again, again.getHint().toString());

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Set duress passcode"))
                .setView(form)
                .setPositiveButton(L10n.t("Save"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String typed = code.getText().toString();
            String refused = DuressWipe.refusal(typed);
            EditText wrong = code;
            if (refused == null && !typed.equals(again.getText().toString())) {
                refused = L10n.t("The two passcodes don't match.");
                wrong = again;
            }
            if (refused == null && !DuressWipe.save(typed)) refused = L10n.t("Couldn't complete that action. Try again.");
            if (refused != null) {
                form.refuse(wrong, refused);
                Utils.showToastLong(refused);
                return;
            }
            dialog.dismiss();
            Utils.showToastLong(L10n.t("Duress passcode saved."));
            saved.run();
        });
        again.setOnEditorActionListener((view, action, event) -> {
            if (action != EditorInfo.IME_ACTION_DONE) return false;
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            return true;
        });
        return dialog;
    }

    /** A hidden field for the duress passcode: a number pad of [DuressWipe.PIN_LENGTH] digits when Telegram's passcode is a PIN. */
    private static EditText duressField(Activity activity, int id, String hint) {
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(id);
        field.setSingleLine(true);
        if (AppPasscode.isPin()) {
            field.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_VARIATION_PASSWORD);
            field.setFilters(new InputFilter[]{new InputFilter.LengthFilter(DuressWipe.PIN_LENGTH)});
        } else {
            field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        }
        field.setHint(hint);
        field.setImeOptions((id == android.R.id.edit ? EditorInfo.IME_ACTION_NEXT : EditorInfo.IME_ACTION_DONE)
                | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        return field;
    }
}
