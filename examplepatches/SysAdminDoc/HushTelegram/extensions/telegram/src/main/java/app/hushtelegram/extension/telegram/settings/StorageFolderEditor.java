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
import app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtelegram.extension.telegram.misc.StorageFolder;

/**
 * The editor for the folder Telegram's own files move to ({@link StorageFolder}, #7). Save cleans
 * what was typed and keeps the dialog open on a name that won't work. Empty saves as Telegram's
 * own name. The write is done off the main thread, and the dialog closes once it has landed.
 */
final class StorageFolderEditor {
    static final String KEY = "action_storage_folder_name";

    /** Told the value before a save, so the page can say whether a restart is owed. */
    interface Saved {
        void saved(String before);
    }

    private StorageFolderEditor() {}

    /** The folder as a name, with an empty one read as Telegram's, kept in its own direction. */
    static String shown(String name) {
        return L10n.isolate(name == null || name.isEmpty() ? StorageFolder.DEFAULT_NAME : name);
    }

    /** What the row says under its title: the whole path, the way a file manager shows it. */
    static String summary(String saved) {
        return L10n.f("Internal storage/%1$s", shown(saved));
    }

    /** Opens the editor over the settings page. The row's summary follows what's saved. */
    static AlertDialog open(Activity activity, Preference row, Saved saved) {
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(android.R.id.edit);
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_TEXT);
        field.setHint(L10n.t("Folder name"));
        field.setText(Settings.STORAGE_FOLDER_NAME.savedValue());
        field.setImeOptions(EditorInfo.IME_ACTION_DONE | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        EditorForm form = new EditorForm(field.getContext(), L10n.t("Telegram's files go in this folder in Internal storage,"
                + " and it's made if it isn't there. Leave it empty for Telegram, and restart Telegram after a change."));
        form.add(field, field.getHint().toString());

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Folder in internal storage"))
                .setView(form)
                .setPositiveButton(L10n.t("Save"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Save and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        // Set after show, so a name that can't be saved keeps the dialog and what was typed.
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String value = StorageFolder.cleanName(field.getText().toString());
            if (!StorageFolder.allowedName(value)) {
                String refused = L10n.t("That name won't work. Try letters and numbers.");
                form.refuse(field, refused);
                Utils.showToastLong(refused);
                return;
            }
            String[] before = new String[1];
            HushTelegramPreferenceFragment.save(dialog, () -> {
                // Read on the worker, behind any save asked for first, so it's the value this one replaces.
                before[0] = Settings.STORAGE_FOLDER_NAME.savedValue();
                if (!Settings.STORAGE_FOLDER_NAME.saveCommitted(value)) return false;
                // The restart it owes is on record even when the page went before the answer came back.
                Map<Setting<?>, Object> replaced = Collections.<Setting<?>, Object>singletonMap(Settings.STORAGE_FOLDER_NAME, before[0]);
                AbstractPreferenceFragment.noteRestartPending(replaced);
                return true;
            }, landed -> {
                if (!landed) {
                    String refused = L10n.t("Couldn't save the folder. Try again in a moment.");
                    form.refuse(field, refused);
                    Utils.showToastLong(refused);
                    return;
                }
                row.setSummary(summary(value));
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
