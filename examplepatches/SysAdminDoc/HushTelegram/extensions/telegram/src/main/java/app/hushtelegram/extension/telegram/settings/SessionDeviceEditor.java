/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.preference.Preference;
import android.text.InputFilter;
import android.text.InputType;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;

import java.util.LinkedHashMap;
import java.util.Map;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtelegram.extension.telegram.misc.SessionDevice;

/**
 * The editor for the device the other sessions see ({@link SessionDevice}, #79): a device name and
 * a system version, each saved as typed once {@link SessionDevice#clean} has made it one line. An
 * empty box sends Telegram's own. The write is done off the main thread, and the dialog closes
 * once it has landed.
 */
final class SessionDeviceEditor {
    static final String KEY = "action_session_device";
    static final int NAME_FIELD = android.R.id.edit;
    static final int SYSTEM_FIELD = android.R.id.input;

    /** Told both values before a save, so the page can say whether a restart is owed. */
    interface Saved {
        void saved(String nameBefore, String systemBefore);
    }

    private SessionDeviceEditor() {}

    /** A saved value as the other sessions see it, with an empty one read as Telegram's, kept in its own direction. */
    static String shown(String saved, String stock) {
        String value = SessionDevice.clean(saved);
        return L10n.isolate(value.isEmpty() ? stock : value);
    }

    /** What the row says under its title: the name and system version that go out. */
    static String summary(String name, String system) {
        return L10n.f("Your other sessions see %1$s, %2$s.", shown(name, SessionDevice.stockModel()),
                shown(system, SessionDevice.stockSystem()));
    }

    private static EditText field(Activity activity, int id, String saved, String stock) {
        EditText field = new EditText(HushTelegramPreferenceFragment.themed(activity));
        field.setId(id);
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_TEXT);
        field.setFilters(new InputFilter[]{new InputFilter.LengthFilter(SessionDevice.MAX_LENGTH)});
        // The hint is what goes out with the box empty.
        field.setHint(stock);
        field.setText(saved);
        field.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
        return field;
    }

    /** Opens the editor over the settings page. The row's summary follows what's saved. */
    static AlertDialog open(Activity activity, Preference row, Saved saved) {
        EditText name = field(activity, NAME_FIELD, Settings.SESSION_DEVICE_NAME.savedValue(), SessionDevice.stockModel());
        name.setImeOptions(EditorInfo.IME_ACTION_NEXT | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        EditText system = field(activity, SYSTEM_FIELD, Settings.SESSION_SYSTEM_VERSION.savedValue(), SessionDevice.stockSystem());
        system.setImeOptions(EditorInfo.IME_ACTION_DONE | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        EditorForm form = new EditorForm(name.getContext(), L10n.t("Settings > Devices on your other phones and computers"
                + " shows this phone with these. Leave a box empty for what Telegram sends, and restart Telegram after a change."));
        form.add(name, L10n.t("Device name"));
        form.add(system, L10n.t("System version"));

        AlertDialog dialog = new AlertDialog.Builder(HushTelegramPreferenceFragment.themed(activity))
                .setTitle(L10n.t("Device in Active sessions"))
                .setView(form)
                .setPositiveButton(L10n.t("Save"), null)
                .setNegativeButton(L10n.t("Cancel"), null)
                .show();
        ScreenColors.dialog(dialog);
        // The keyboard makes room rather than covering Save and Cancel.
        if (dialog.getWindow() != null) dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        // Set after show, so a save that didn't land keeps the dialog and what was typed.
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String nameValue = SessionDevice.clean(name.getText().toString());
            String systemValue = SessionDevice.clean(system.getText().toString());
            String[] before = new String[2];
            HushTelegramPreferenceFragment.save(dialog, () -> {
                // Read on the worker, behind any save asked for first, so they're the values these replace.
                before[0] = Settings.SESSION_DEVICE_NAME.savedValue();
                before[1] = Settings.SESSION_SYSTEM_VERSION.savedValue();
                if (!Settings.SESSION_DEVICE_NAME.saveCommitted(nameValue)) return false;
                if (!Settings.SESSION_SYSTEM_VERSION.saveCommitted(systemValue)) {
                    // Both or neither, so the row never shows half of a save.
                    Settings.SESSION_DEVICE_NAME.saveCommitted(before[0]);
                    return false;
                }
                // The restart they owe is on record even when the page went before the answer came back.
                Map<Setting<?>, Object> replaced = new LinkedHashMap<>();
                replaced.put(Settings.SESSION_DEVICE_NAME, before[0]);
                replaced.put(Settings.SESSION_SYSTEM_VERSION, before[1]);
                AbstractPreferenceFragment.noteRestartPending(replaced);
                return true;
            }, landed -> {
                if (!landed) {
                    String refused = L10n.t("Couldn't save the device. Try again in a moment.");
                    form.refuse(name, refused);
                    Utils.showToastLong(refused);
                    return;
                }
                row.setSummary(summary(nameValue, systemValue));
                dialog.dismiss();
                saved.saved(before[0], before[1]);
            });
        });
        system.setOnEditorActionListener((view, action, event) -> {
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
