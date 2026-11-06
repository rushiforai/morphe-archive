/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.text.InputType;
import android.util.TypedValue;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.Setting;

import static app.hushpinterest.extension.pinterest.settings.SaveButtonColorSetting.SAVE_BUTTON_COLOR;

/**
 * Save button color: a row on the Interface page that opens a text box for a hex color. Save keeps
 * a color typed as "#3366FF" or "#36F", and a toast says what was kept. Anything else is refused
 * with a toast and nothing changes. Clear goes back to Pinterest's red.
 */
@SuppressWarnings("deprecation") // Framework preferences are what the shared settings page builds on.
public final class SaveButtonColorPreference extends Preference {
    /** The rows on the page right now, so a save shows on them at once. */
    private static final List<WeakReference<SaveButtonColorPreference>> ROWS = new CopyOnWriteArrayList<>();

    @Nullable private static SharedPreferences observedStore;
    private static final SharedPreferences.OnSharedPreferenceChangeListener LISTENER = (store, key) -> {
        if (key == null || key.equals(SAVE_BUTTON_COLOR.key)) Utils.runOnMainThread(SaveButtonColorPreference::refreshRows);
    };

    /** The dialog on screen, for tests. */
    @Nullable static AlertDialog shown;

    SaveButtonColorPreference(Context context) {
        super(HushPinterestPreferenceFragment.themed(context));
        setKey("action_save_button_color");
        setPersistent(false);
        setTitle(L10n.t(context, "Save button color"));
        setOnPreferenceClickListener(preference -> {
            edit();
            return true;
        });
        ROWS.add(new WeakReference<>(this));
        observe();
    }

    @Override public CharSequence getSummary() {
        return summary();
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        HushPinterestPreferenceFragment.showAllText(view);
        ScreenColors.row(view, this);
        view.setAccessibilityDelegate(new HushPinterestPreferenceFragment.RowSemantics(this, Button.class));
    }

    /** What the row says: what it does, or the color saved. Saved, so a pause doesn't change it. */
    static String summary() {
        String saved = SAVE_BUTTON_COLOR.savedValue();
        if (saved.isEmpty()) {
            return L10n.t("Paints the red Save button on a pin you open in a color you pick. It's Pinterest's red "
                    + "for now.");
        }
        return L10n.f("Painting the Save button %1$s. Tap to change it. The change shows on the next pin you open.",
                saved);
    }

    private void edit() {
        Context context = HushPinterestPreferenceFragment.themed(getContext());
        EditText field = new EditText(context);
        field.setId(android.R.id.edit);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS
                | InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS);
        field.setSingleLine(true);
        field.setHint("#E60023");
        String saved = SAVE_BUTTON_COLOR.savedValue();
        field.setText(saved);
        field.setSelection(field.getText().length());
        FrameLayout holder = new FrameLayout(context);
        int side = Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, ScreenColors.SIDE_DP,
                context.getResources().getDisplayMetrics()));
        holder.setPaddingRelative(side, side / 2, side, 0);
        holder.addView(field, new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.WRAP_CONTENT));
        AlertDialog.Builder builder = new AlertDialog.Builder(context)
                .setTitle(getTitle())
                .setMessage(L10n.t("Type a hex color, like #3366FF, or three digits, like #36F. A light color gets "
                        + "dark text so the button stays readable."))
                .setView(holder)
                .setPositiveButton(L10n.t("Save"), (dialog, which) -> save(String.valueOf(field.getText())))
                .setNegativeButton(L10n.t("Cancel"), null);
        if (!saved.isEmpty()) {
            builder.setNeutralButton(L10n.t("Clear"), (dialog, which) -> save(""));
        }
        try {
            AlertDialog dialog = builder.create();
            dialog.setOnDismissListener(gone -> {
                if (shown == gone) shown = null;
            });
            dialog.create();
            ScreenColors.dialog(dialog);
            dialog.show();
            shown = dialog;
        } catch (RuntimeException failure) {
            Logger.printInfo(() -> "Could not show the Save button color: " + failure.getClass().getSimpleName());
            Utils.showToastLong(L10n.t("Couldn't open the Save button color. Try again."));
        }
    }

    /** Saves [typed] when it's a color or blank, and says what happened. */
    static void save(String typed) {
        String cleaned = SaveButtonColorSetting.clean(typed);
        if (cleaned == null) {
            Utils.showToastLong(L10n.t("Not a hex color, so nothing changed. Try one like #3366FF."));
            return;
        }
        try {
            SAVE_BUTTON_COLOR.save(cleaned);
        } catch (RuntimeException failure) {
            Logger.printInfo(() -> "Could not save the Save button color: " + failure.getClass().getSimpleName());
            Utils.showToastLong(L10n.t("Couldn't save the Save button color. Try again."));
            return;
        }
        refreshRows();
        Utils.showToastLong(cleaned.isEmpty()
                ? L10n.t("The Save button goes back to Pinterest's red on your next pin.")
                : L10n.f("The Save button turns %1$s on the next pin you open.", cleaned));
    }

    private static void refreshRows() {
        for (WeakReference<SaveButtonColorPreference> reference : ROWS) {
            SaveButtonColorPreference row = reference.get();
            if (row == null) ROWS.remove(reference);
            else row.notifyChanged();
        }
    }

    private static void observe() {
        SharedPreferences current = Setting.preferences.preferences;
        if (observedStore == current) return;
        if (observedStore != null) observedStore.unregisterOnSharedPreferenceChangeListener(LISTENER);
        observedStore = current;
        current.registerOnSharedPreferenceChangeListener(LISTENER);
    }
}
