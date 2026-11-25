/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.text.InputFilter;
import android.text.InputType;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;

import java.util.function.Consumer;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.telegram.misc.LocalNames;

/**
 * The prompt Rename on this phone opens (#104): a field holding the name shown now, with Save,
 * Cancel, and Remove when this phone already gave a name. Saving an empty field removes the name.
 */
public final class RenamePrompt {
    private RenamePrompt() {}

    /**
     * Shows the prompt over [activity], filled with [shown]. [given] says whether that is a name
     * this phone gave, which offers Remove. [save] hears the typed name, or an empty one for Remove.
     */
    public static AlertDialog ask(Activity activity, String shown, boolean given, Consumer<String> save) {
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(android.R.id.edit);
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_WORDS);
        // The keyboard learns nothing from it: a name given here is the person's own business.
        field.setImeOptions(EditorInfo.IME_ACTION_DONE | EditorInfo.IME_FLAG_NO_EXTRACT_UI
                | EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
        field.setFilters(new InputFilter[] {new InputFilter.LengthFilter(LocalNames.MAX_NAME_CHARS)});
        field.setSaveEnabled(false);
        field.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
        field.setHint(L10n.t("Name"));
        field.setText(shown);
        field.selectAll();
        EditorForm form = new EditorForm(field.getContext(),
                L10n.t("Only this phone shows this name. Telegram and the other person never see it."));
        form.add(field, field.getHint().toString());

        AlertDialog.Builder builder = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Rename on this phone"))
                .setView(form)
                .setPositiveButton(L10n.t("Save"), (dialog, which) -> save.accept(field.getText().toString()))
                .setNegativeButton(L10n.t("Cancel"), null);
        if (given) builder.setNeutralButton(L10n.t("Remove"), (dialog, which) -> save.accept(""));
        AlertDialog dialog = builder.show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering the buttons.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        field.setOnEditorActionListener((view, action, event) -> {
            if (action != EditorInfo.IME_ACTION_DONE) return false;
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            return true;
        });
        field.requestFocus();
        return dialog;
    }
}
