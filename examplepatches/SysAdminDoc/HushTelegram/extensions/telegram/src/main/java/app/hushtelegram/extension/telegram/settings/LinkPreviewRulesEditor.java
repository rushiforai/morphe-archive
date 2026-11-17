/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.preference.Preference;
import android.text.InputType;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.telegram.misc.LinkPreviewRules;

/**
 * The editor for Link preview rules (#79): one {@code original -> alternative} per line, which Fix
 * link previews follows. Save keeps the rules, leaves out the lines that aren't one and says how
 * many it left out. Default rules puts the starting rules back in the box without saving them.
 */
final class LinkPreviewRulesEditor {
    static final String KEY = "action_link_preview_rules";

    private LinkPreviewRulesEditor() {}

    /** What the row says under its title: how many rules there are, or how to add one. */
    static String summary() {
        int count = LinkPreviewRules.saved().rules.size();
        if (count == 0) return L10n.t("No rules yet. Add one per line, like x.com/*/status -> fixupx.com.");
        return L10n.f("Rules: %1$s. Fix link previews follows these for the links you send.", count);
    }

    /** Opens the editor over the settings page. The row's summary follows what's saved. */
    static AlertDialog open(Activity activity, Preference row) {
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(android.R.id.edit);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI
                | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        field.setSingleLine(false);
        field.setMinLines(3);
        field.setMaxLines(6);
        field.setHorizontallyScrolling(false);
        field.setHint(L10n.t("One rule per line, like x.com/*/status -> fixupx.com"));
        field.setText(LinkPreviewRules.saved().text());
        field.setImeOptions(EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        EditorForm form = new EditorForm(field.getContext(), L10n.t("Each line is a site, an arrow and the site its "
                + "previews come from. Put *. in front of both to cover subdomains too, like *.tiktok.com -> "
                + "*.kktiktok.com. A path after the first site covers only links that start with it, * standing "
                + "for any one part, like x.com/*/status -> fixupx.com. Lines that aren't rules are left out."));
        form.add(field, field.getHint().toString());

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Link preview rules"))
                .setView(form)
                .setPositiveButton(L10n.t("Save"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .setNeutralButton(L10n.t("Default rules"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Save and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        // Fills the box only: Save still decides whether they're kept.
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(v -> {
            field.setText(LinkPreviewRules.DEFAULT_RULES);
            field.setSelection(field.length());
        });
        // Set after show, so rules that can't be saved keep the dialog and what was typed.
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            LinkPreviewRules.Parsed parsed = LinkPreviewRules.parse(field.getText().toString());
            if (parsed.text().length() > LinkPreviewRules.MAX_TEXT) {
                refuse(form, field, L10n.t("Too many rules to keep. Take some out."));
                return;
            }
            HushTelegramPreferenceFragment.save(dialog, () -> LinkPreviewRules.save(parsed), landed -> {
                if (!landed) {
                    refuse(form, field, L10n.t("Couldn't save the rules. Try again in a moment."));
                    return;
                }
                row.setSummary(summary());
                dialog.dismiss();
                if (parsed.skipped > 0) {
                    Utils.showToastLong(L10n.f("Lines left out: %1$s. They aren't rules.", parsed.skipped));
                }
            });
        });
        return dialog;
    }

    private static void refuse(EditorForm form, EditText field, String reason) {
        form.refuse(field, reason);
        Utils.showToastLong(reason);
    }
}
