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
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.telegram.misc.ApiCredentials;

/**
 * Asks for the API ID and hash from my.telegram.org/apps, from the sign-in refusal. Each field says
 * what's wrong with it under itself and keeps what was typed. Save keeps both on this phone and
 * restarts Telegram, which then signs in with them. With a pair saved already, Remove takes it out.
 */
public final class ApiIdPrompt {
    /** How long the toast gets before the process goes. */
    static final long RESTART_DELAY_MS = 1500;

    private ApiIdPrompt() {}

    /** What Save does once both fields check out, and what Remove does. A test answers it itself. */
    public interface Store {
        boolean saved();

        boolean save(String id, String hash);

        boolean clear();

        void restart();
    }

    public static AlertDialog ask(Activity activity) {
        return ask(activity, new Store() {
            @Override public boolean saved() { return ApiCredentials.hasSaved(activity); }
            @Override public boolean save(String id, String hash) { return ApiCredentials.save(activity, id, hash); }
            @Override public boolean clear() { return ApiCredentials.clear(activity); }
            @Override public void restart() {
                Utils.runOnMainThreadDelayed(() -> Utils.restartApp(activity), RESTART_DELAY_MS);
            }
        });
    }

    static AlertDialog ask(Activity activity, Store store) {
        EditText id = field(activity, android.R.id.text1, InputType.TYPE_CLASS_NUMBER, EditorInfo.IME_ACTION_NEXT,
                L10n.t("App api_id"));
        EditText hash = field(activity, android.R.id.text2, InputType.TYPE_CLASS_TEXT
                | InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS,
                EditorInfo.IME_ACTION_DONE, L10n.t("App api_hash"));
        EditorForm form = new EditorForm(id.getContext(),
                L10n.t("Type App api_id and App api_hash from my.telegram.org/apps. They stay on this phone, and Telegram restarts to sign in with them."));
        form.add(id, id.getHint().toString());
        form.add(hash, hash.getHint().toString());

        AlertDialog.Builder builder = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Enter your API ID"))
                .setView(form)
                .setPositiveButton(L10n.t("Save"), null)
                .setNegativeButton(L10n.t("Cancel"), null);
        if (store.saved()) builder.setNeutralButton(L10n.t("Remove"), null);
        AlertDialog dialog = builder.show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Save and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);

        Button save = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
        // Set after show, so a refused field keeps the prompt and what was typed.
        save.setOnClickListener(v -> {
            String typedId = id.getText().toString();
            String typedHash = hash.getText().toString();
            boolean idFits = ApiCredentials.validId(typedId);
            String refused = !idFits ? L10n.t("An API ID is only digits, like 1234567.")
                    : !ApiCredentials.validHash(typedHash) ? L10n.t("An API hash is 32 letters and numbers.") : null;
            if (refused != null) {
                form.refuse(idFits ? hash : id, refused);
                Utils.showToastLong(refused);
                return;
            }
            if (!store.save(typedId, typedHash)) {
                Utils.showToastLong(L10n.t("Couldn't save that. Try again."));
                return;
            }
            save.setEnabled(false);
            Utils.showToastLong(L10n.t("Saved. Telegram restarts now."));
            dialog.dismiss();
            store.restart();
        });
        Button remove = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
        if (remove != null && remove.getVisibility() == View.VISIBLE) {
            remove.setOnClickListener(v -> {
                if (!store.clear()) {
                    Utils.showToastLong(L10n.t("Couldn't save that. Try again."));
                    return;
                }
                Utils.showToastLong(L10n.t("Removed. Telegram restarts now."));
                dialog.dismiss();
                store.restart();
            });
        }
        hash.setOnEditorActionListener((view, action, event) -> {
            if (action != EditorInfo.IME_ACTION_DONE) return false;
            if (save.isEnabled()) save.performClick();
            return true;
        });
        return dialog;
    }

    private static EditText field(Activity activity, int viewId, int inputType, int imeAction, String hint) {
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(viewId);
        field.setSingleLine(true);
        field.setInputType(inputType);
        field.setImeOptions(imeAction | EditorInfo.IME_FLAG_NO_EXTRACT_UI
                | EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
        field.setSaveEnabled(false);
        field.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
        field.setHint(hint);
        return field;
    }
}
