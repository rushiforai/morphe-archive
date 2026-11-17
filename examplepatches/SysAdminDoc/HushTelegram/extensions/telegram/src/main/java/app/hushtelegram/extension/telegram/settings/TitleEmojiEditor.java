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

import java.util.Collections;
import java.util.Map;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.shared.settings.StringSetting;
import app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtelegram.extension.telegram.misc.TitleEmoji;

/**
 * The editors for the chat list's title ({@link TitleEmoji}): the text beside it, and the text
 * that takes the place of Telegram's name. Save cleans what was typed the way the title shows it
 * and keeps the dialog open on text that's too long. Empty saves as nothing at all. The write is
 * done off the main thread, and the dialog closes once it has landed.
 */
final class TitleEmojiEditor {
    static final String KEY = "action_title_emoji";
    /** The row for the text shown in place of Telegram's name. */
    static final String TITLE_KEY = "action_chat_list_title";

    /** Told the value before a save, so the page can say whether a restart is owed. */
    interface Saved {
        void saved(String before);
    }

    private TitleEmojiEditor() {}

    /** What the row says under its title: the saved text, or what the row is for. */
    static String summary(String saved) {
        return saved == null || saved.isEmpty()
                ? L10n.t("Add an emoji or a few letters after Telegram's name at the top of the chat list. It stays on "
                        + "this phone, and your Premium emoji status is left alone.")
                : L10n.f("%1$s shows after Telegram's name at the top of the chat list, on this phone only. Tap to change it.",
                        L10n.isolate(saved));
    }

    /** What the title text row says under its title: the saved text, or what the row is for. */
    static String titleSummary(String saved) {
        return saved == null || saved.isEmpty()
                ? L10n.t("Type what shows in place of Telegram's name while Your own chat list title is on. Empty keeps "
                        + "Telegram's name.")
                : L10n.f("%1$s shows in place of Telegram's name while Your own chat list title is on. Tap to change it.",
                        L10n.isolate(saved));
    }

    /** The text as a line of the import preview says it, kept in its own direction. */
    static String shown(String value) {
        return value == null || value.isEmpty() ? L10n.t("none") : L10n.isolate(value);
    }

    /** Opens the emoji's editor over the settings page. The row's summary follows what's saved. */
    static AlertDialog open(Activity activity, Preference row, Saved saved) {
        return open(activity, row, saved, false);
    }

    /** Opens the title text's editor over the settings page. The row's summary follows what's saved. */
    static AlertDialog openTitle(Activity activity, Preference row, Saved saved) {
        return open(activity, row, saved, true);
    }

    private static AlertDialog open(Activity activity, Preference row, Saved saved, boolean ownTitle) {
        StringSetting setting = ownTitle ? Settings.CHAT_LIST_TITLE_TEXT : Settings.TITLE_EMOJI;
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(android.R.id.edit);
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_TEXT);
        field.setHint(ownTitle ? L10n.t("A short name") : L10n.t("Emoji or a few letters"));
        field.setText(setting.savedValue());
        field.setImeOptions(EditorInfo.IME_ACTION_DONE | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        EditorForm form = new EditorForm(field.getContext(), ownTitle
                ? L10n.t("Shown in place of Telegram's name at the top of the chat list while Your own chat list title is on, "
                        + "in the title's own font and color. It stays on this phone, so nothing goes to Telegram. "
                        + "Leave it empty to keep Telegram's name, and restart Telegram to see a change.")
                : L10n.t("Shown after Telegram's name at the top of the chat list. "
                        + "It stays on this phone, so nothing goes to Telegram and your Premium emoji status is left alone. "
                        + "Leave it empty to show nothing, and restart Telegram to see a change."));
        form.add(field, field.getHint().toString());

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(ownTitle ? L10n.t("Text for the chat list title") : L10n.t("Emoji next to the chat list title"))
                .setView(form)
                .setPositiveButton(L10n.t("Save"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Save and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        // Set after show, so text that can't be saved keeps the dialog and what was typed.
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String value = TitleEmoji.clean(field.getText().toString());
            if (ownTitle ? !TitleEmoji.titleAllowed(value) : !TitleEmoji.allowed(value)) {
                String refused = ownTitle ? L10n.t("That's too long. Try a shorter name.")
                        : L10n.t("That's too long. Try an emoji or two, or a short word.");
                form.refuse(field, refused);
                Utils.showToastLong(refused);
                return;
            }
            String[] before = new String[1];
            HushTelegramPreferenceFragment.save(dialog, () -> {
                // Read on the worker, behind any save asked for first, so it's the value this one replaces.
                before[0] = setting.savedValue();
                if (!setting.saveCommitted(value)) return false;
                // The restart it owes is on record even when the page went before the answer came back.
                Map<Setting<?>, Object> replaced = Collections.<Setting<?>, Object>singletonMap(setting, before[0]);
                AbstractPreferenceFragment.noteRestartPending(replaced);
                return true;
            }, landed -> {
                if (!landed) {
                    String refused = ownTitle ? L10n.t("Couldn't save the title. Try again in a moment.")
                            : L10n.t("Couldn't save the emoji. Try again in a moment.");
                    form.refuse(field, refused);
                    Utils.showToastLong(refused);
                    return;
                }
                row.setSummary(ownTitle ? titleSummary(value) : summary(value));
                dialog.dismiss();
                saved.saved(before[0]);
            });
        });
        field.setOnEditorActionListener((view, action, event) -> {
            if (action != EditorInfo.IME_ACTION_DONE) return false;
            // The keyboard's Done is the Save button, and a Save that's waiting takes no second tap.
            if (dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled()) {
                dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            }
            return true;
        });
        return dialog;
    }
}
