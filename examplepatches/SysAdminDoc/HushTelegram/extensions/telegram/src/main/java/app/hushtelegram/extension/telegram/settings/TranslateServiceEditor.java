/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.preference.Preference;
import android.text.InputType;
import android.view.View;
import android.view.WindowManager;
import android.widget.EditText;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.telegram.misc.AiTranslate;
import app.hushtelegram.extension.telegram.misc.OutsideTranslate;

/**
 * The editor for the outside translate's service: Google's web translate, or an AI service with
 * the person's own key, and optionally their own words on how to translate. Save checks the
 * fields first and keeps the dialog open on one that can't be used. Use Google forgets the key.
 * Either write is done off the main thread, and the dialog closes once it has landed.
 */
final class TranslateServiceEditor {
    static final String KEY = "action_translate_service";

    private TranslateServiceEditor() {}

    /** What the row says under its title: which service the text goes to. */
    static String summary(AiTranslate.Service service) {
        return service.enabled()
                ? L10n.f("Your AI service at %1$s, model %2$s.", service.host(), service.model)
                : L10n.t("Google's web translate. Tap to use an AI service with your own key.");
    }

    /** Opens the editor over the settings page. The row's summary follows what's saved. */
    static AlertDialog open(Activity activity, Preference row) {
        AiTranslate.Service saved = OutsideTranslate.service();
        EditText address = field(activity, android.R.id.text1, L10n.t("Service address"), saved.address,
                InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        EditText model = field(activity, android.R.id.text2, L10n.t("Model"), saved.model,
                InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        // Optional, in the person's own words: a tone, names to keep, slang to leave as it is.
        EditText style = field(activity, android.R.id.summary, L10n.t("How to translate (optional)"), saved.style,
                InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
        style.setSingleLine(false);
        style.setMaxLines(4);
        EditText key = field(activity, android.R.id.edit, L10n.t("API key"), saved.key,
                InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        // A password field invites an autofill service to save it to the cloud; the key stays on this phone.
        key.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
        key.setSaveEnabled(false);
        key.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_DONE | android.view.inputmethod.EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        address.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_NEXT);
        model.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_NEXT);
        EditorForm fields = new EditorForm(address.getContext(), L10n.t("With a key, the text you translate goes to this AI service instead of Google. Any "
                + "service that takes OpenAI's chat format works, like OpenAI, OpenRouter, DeepSeek or Groq. "
                + "The key stays on this phone and never goes in a settings file."));
        for (EditText field : new EditText[]{address, model, style, key}) {
            fields.add(field, field.getHint().toString());
        }

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Translation service"))
                .setView(fields)
                .setPositiveButton(L10n.t("Save"), null)
                .setNeutralButton(L10n.t("Use Google"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Save and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        // Set after show, so a service that can't be saved keeps the dialog and what was typed.
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String a = address.getText().toString(), m = model.getText().toString(), k = key.getText().toString();
            String s = style.getText().toString();
            AiTranslate.Validation refused = AiTranslate.validate(a, m, k, s);
            if (refused != null) {
                fields.refuse(new EditText[]{address, model, key, style}[refused.field], refused.message);
                Utils.showToastLong(refused.message);
                return;
            }
            HushTelegramPreferenceFragment.save(dialog, () -> OutsideTranslate.saveService(a, m, k, s), landed -> {
                if (!landed) {
                    String reason = L10n.t("Couldn't save the translation service. Try again in a moment.");
                    fields.refuse(key, reason);
                    Utils.showToastLong(reason);
                    return;
                }
                row.setSummary(summary(OutsideTranslate.service()));
                Utils.showToastShort(L10n.t("Translation service saved."));
                dialog.dismiss();
            });
        });
        key.setOnEditorActionListener((view, action, event) -> {
            if (action != android.view.inputmethod.EditorInfo.IME_ACTION_DONE) return false;
            // The keyboard's Done is the Save button, and a Save that's waiting takes no second tap.
            if (dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled()) {
                dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            }
            return true;
        });
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(v -> {
            String a = address.getText().toString(), m = model.getText().toString();
            HushTelegramPreferenceFragment.save(dialog, () -> OutsideTranslate.saveService(a, m, ""), landed -> {
                if (!landed) {
                    String reason = L10n.t("Couldn't save the translation service. Try again in a moment.");
                    fields.refuse(key, reason);
                    Utils.showToastLong(reason);
                    return;
                }
                row.setSummary(summary(OutsideTranslate.service()));
                Utils.showToastShort(L10n.t("Back to Google's web translate."));
                dialog.dismiss();
            });
        });
        return dialog;
    }

    private static EditText field(Activity activity, int id, String hint, String text, int type) {
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(id);
        field.setSingleLine(true);
        // A password type turns a field monospace, so the key's hint read unlike the labels and
        // fields around it. The dots don't need it.
        android.graphics.Typeface face = field.getTypeface();
        field.setInputType(type);
        field.setTypeface(face);
        field.setHint(hint);
        field.setText(text);
        return field;
    }
}
