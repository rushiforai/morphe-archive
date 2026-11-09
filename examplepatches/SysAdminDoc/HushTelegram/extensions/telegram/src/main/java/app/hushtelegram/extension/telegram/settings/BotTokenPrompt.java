/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.text.InputType;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;

/**
 * The bot token box the phone number screen opens for Bot token sign-in. It hands what was typed to
 * a [Sender] and stays open until Telegram signs the bot in, so a refused token can be fixed in
 * place. The field keeps no history: no suggestions, no autofill, no saved state.
 */
public final class BotTokenPrompt {
    private BotTokenPrompt() {}

    /** Sends a token. */
    public interface Sender {
        /** Null when [token] went to Telegram and [answer] will hear back; else the refusal to show. */
        String send(String token, Answer answer);
    }

    /** Telegram's reply to a sent token, on the main thread. */
    public interface Answer {
        void signedIn();

        void refused(String refused);
    }

    public static AlertDialog ask(Activity activity, Sender sender) {
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(android.R.id.edit);
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        field.setImeOptions(EditorInfo.IME_ACTION_DONE | EditorInfo.IME_FLAG_NO_EXTRACT_UI
                | EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
        field.setSaveEnabled(false);
        field.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
        field.setHint(L10n.t("Bot token"));
        EditorForm form = new EditorForm(field.getContext(),
                L10n.t("Paste the token @BotFather gave your bot. It goes only to Telegram, which keeps it with the account like any sign-in."));
        form.add(field, field.getHint().toString());
        TextView waiting = form.answer();

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Sign in with a bot token"))
                .setView(form)
                .setPositiveButton(L10n.t("Sign in"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Sign in and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        Button signIn = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
        Answer answer = new Answer() {
            @Override public void signedIn() {
                if (dialog.isShowing()) dialog.dismiss();
            }

            @Override public void refused(String refused) {
                signIn.setEnabled(true);
                waiting.setVisibility(View.GONE);
                if (!dialog.isShowing()) return;
                form.refuse(field, refused);
                Utils.showToastLong(refused);
            }
        };
        // Set after show, so a refused token keeps the prompt and what was typed.
        signIn.setOnClickListener(v -> {
            String refused = sender.send(field.getText().toString(), answer);
            if (refused != null) {
                form.refuse(field, refused);
                Utils.showToastLong(refused);
                return;
            }
            signIn.setEnabled(false);
            waiting.setText(L10n.t("Waiting for Telegram."));
            waiting.setVisibility(View.VISIBLE);
        });
        field.setOnEditorActionListener((view, action, event) -> {
            if (action != EditorInfo.IME_ACTION_DONE) return false;
            if (signIn.isEnabled()) signIn.performClick();
            return true;
        });
        return dialog;
    }
}
