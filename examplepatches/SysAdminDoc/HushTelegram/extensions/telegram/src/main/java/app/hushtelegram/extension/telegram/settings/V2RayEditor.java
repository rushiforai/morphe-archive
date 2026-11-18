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
import app.hushtelegram.extension.telegram.misc.V2RayProxies;

/**
 * The two rows under V2Ray-style servers (#71): Your V2Ray links, a box for vmess://, vless://,
 * trojan:// and ss:// links, one a line, and V2Ray server, which picks the server Telegram goes
 * through or leaves it to the fastest that answers, and tests them all again.
 */
final class V2RayEditor {
    static final String LINKS_KEY = "action_v2ray_links";
    static final String SERVER_KEY = "action_v2ray_server";

    private V2RayEditor() {}

    /** Opens the links box over the settings page. The row's summary follows what's saved. */
    static AlertDialog openLinks(Activity activity, Preference row) {
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(android.R.id.edit);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI
                | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        field.setSingleLine(false);
        field.setMinLines(3);
        field.setMaxLines(6);
        field.setHorizontallyScrolling(false);
        field.setHint(L10n.t("One link a line"));
        field.setText(String.join("\n", V2RayProxies.pastedLinks()));
        field.setImeOptions(EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        EditorForm form = new EditorForm(field.getContext(), L10n.t("VMess, VLESS, Trojan and Shadowsocks links work, over TCP or"
                + " WebSocket, with or without TLS. They stay on this phone and out of settings files."));
        form.add(field, field.getHint().toString());

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Your V2Ray links"))
                .setView(form)
                .setPositiveButton(L10n.t("Save"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Save and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        // Set after show, so links that can't be saved keep the dialog and what was typed.
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            List<String> links = FreeProxies.lines(field.getText().toString());
            int wrong = V2RayProxies.notALink(links);
            if (wrong > 0) {
                refuse(form, field, L10n.f("Line %1$s isn't a link this can use", wrong));
                return;
            }
            if (links.size() > V2RayProxies.MAX_PASTED) {
                refuse(form, field, L10n.f("Up to %1$s links", V2RayProxies.MAX_PASTED));
                return;
            }
            HushTelegramPreferenceFragment.save(dialog, () -> V2RayProxies.saveLinks(links), landed -> {
                if (!landed) {
                    refuse(form, field, L10n.t("Couldn't save the links. Try again in a moment."));
                    return;
                }
                row.setSummary(V2RayProxies.linksSummary());
                dialog.dismiss();
            });
        });
        return dialog;
    }

    /** Opens the server picker: the fastest that answers first, then every server with its last time. */
    static AlertDialog openServers(Activity activity, Preference row) {
        List<V2RayProxies.Choice> choices = V2RayProxies.choices();
        String[] labels = new String[choices.size() + 1];
        labels[0] = L10n.t("The fastest that answers");
        int index = 0;
        String picked = V2RayProxies.picked();
        boolean tested = V2RayProxies.tested();
        for (int i = 0; i < choices.size(); i++) {
            V2RayProxies.Choice choice = choices.get(i);
            String name = V2RayProxies.label(choice);
            if (choice.ms > 0) {
                labels[i + 1] = L10n.f("%1$s, %2$s ms", name, choice.ms);
            } else {
                labels[i + 1] = tested ? L10n.f("%1$s, no answer", name) : name;
            }
            if (choice.id.equals(picked)) index = i + 1;
        }
        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("V2Ray server"))
                .setSingleChoiceItems(labels, index, (shown, which) -> {
                    V2RayProxies.pick(which == 0 ? "" : choices.get(which - 1).id);
                    row.setSummary(V2RayProxies.serverSummary());
                    shown.dismiss();
                })
                .setNeutralButton(L10n.t("Test again"), (shown, which) -> {
                    if (!V2RayProxies.testNow()) Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
                    row.setSummary(V2RayProxies.serverSummary());
                })
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        return dialog;
    }

    private static void refuse(EditorForm form, EditText field, String reason) {
        form.refuse(field, reason);
        Utils.showToastLong(reason);
    }
}
