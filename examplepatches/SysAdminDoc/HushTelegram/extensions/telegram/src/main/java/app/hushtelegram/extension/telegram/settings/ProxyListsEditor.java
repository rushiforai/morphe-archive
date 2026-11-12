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

import java.util.List;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.telegram.misc.FreeProxies;

/**
 * The editor for Your proxy lists (#71): the addresses of MTProto proxy lists someone trusts, one a
 * line, which Free proxies reads instead of the public ones. Save keeps the dialog and what was
 * typed when a line isn't an https address or there are too many, and an empty box goes back to the
 * public lists.
 */
final class ProxyListsEditor {
    static final String KEY = "action_free_proxies_lists";

    private ProxyListsEditor() {}

    /** What the row says under its title: how many lists are added, or what adding one does. */
    static String summary() {
        int count = FreeProxies.ownLists().size();
        if (count == 0) {
            return L10n.t("Add the addresses of proxy lists you trust, and Free proxies reads those instead of the public ones.");
        }
        return L10n.f("Lists added: %1$s. Free proxies reads these instead of the public ones.", count);
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
        field.setHint(L10n.t("One https address a line"));
        field.setText(String.join("\n", FreeProxies.ownLists()));
        field.setImeOptions(EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        EditorForm form = new EditorForm(field.getContext(), L10n.t("Each list is a page of t.me/proxy or tg://proxy links."
                + " Free proxies times them and adds the 10 fastest. Leave it empty to use the public lists again."));
        form.add(field, field.getHint().toString());

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Your proxy lists"))
                .setView(form)
                .setPositiveButton(L10n.t("Save"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Save and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        // Set after show, so lists that can't be saved keep the dialog and what was typed.
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            List<String> lists = FreeProxies.lines(field.getText().toString());
            for (String line : lists) {
                if (!FreeProxies.listAddress(line)) {
                    refuse(form, field, L10n.t("Each line needs an https address"));
                    return;
                }
            }
            if (lists.size() > FreeProxies.MAX_OWN_LISTS) {
                refuse(form, field, L10n.f("Up to %1$s lists", FreeProxies.MAX_OWN_LISTS));
                return;
            }
            HushTelegramPreferenceFragment.save(dialog, () -> FreeProxies.saveLists(lists), landed -> {
                if (!landed) {
                    refuse(form, field, L10n.t("Couldn't save the lists. Try again in a moment."));
                    return;
                }
                row.setSummary(summary());
                dialog.dismiss();
            });
        });
        return dialog;
    }

    private static void refuse(EditorForm form, EditText field, String reason) {
        form.refuse(field, reason);
        Utils.showToastLong(reason);
    }
}
