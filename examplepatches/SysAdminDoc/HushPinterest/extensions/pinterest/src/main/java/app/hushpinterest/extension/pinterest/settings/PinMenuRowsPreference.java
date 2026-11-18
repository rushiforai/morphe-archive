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
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import app.hushpinterest.extension.pinterest.ui.PinMenuRows;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.Setting;

/** Pick pin menu rows (#43): a list of the menu's rows, each ticked to take it out of the menu. */
@SuppressWarnings("deprecation") // Framework preferences are what the shared settings page builds on.
public final class PinMenuRowsPreference extends Preference {
    /** The rows on the page right now, so a change shows at once. */
    private static final List<WeakReference<PinMenuRowsPreference>> ROWS = new CopyOnWriteArrayList<>();

    @Nullable private static SharedPreferences observedStore;
    private static final SharedPreferences.OnSharedPreferenceChangeListener LISTENER = (store, key) -> {
        if (key == null || key.equals(PinMenuRows.PICKED.key) || key.equals(Settings.HIDE_PIN_MENU_ROWS.key)) {
            Utils.runOnMainThread(PinMenuRowsPreference::refreshRows);
        }
    };

    private final HushPinterestPreferenceFragment page;

    PinMenuRowsPreference(HushPinterestPreferenceFragment page, Context context) {
        super(HushPinterestPreferenceFragment.themed(context));
        this.page = page;
        setKey("action_pin_menu_rows");
        setPersistent(false);
        setTitle(L10n.t(context, "Pick pin menu rows"));
        setOnPreferenceClickListener(preference -> {
            tapped();
            return true;
        });
        ROWS.add(new WeakReference<>(this));
        observe();
    }

    @Override public CharSequence getSummary() {
        return summary(getContext());
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        HushPinterestPreferenceFragment.showAllText(view);
        ScreenColors.row(view, this);
        view.setAccessibilityDelegate(new HushPinterestPreferenceFragment.RowSemantics(this, Button.class));
    }

    static String summary(Context context) {
        List<String> labels = PinMenuRows.pickedLabels(context);
        if (labels.isEmpty()) return L10n.t("Pick the rows to take out of a pin's menu.");
        String names = TextUtils.join(", ", labels);
        return Settings.HIDE_PIN_MENU_ROWS.savedValue() ? L10n.f("Hidden from pin menus: %s. Tap to change.", names)
                : L10n.f("Picked: %s. Hide pin menu rows is off, so they still show.", names);
    }

    private void tapped() {
        Context context = getContext();
        List<PinMenuRows.Choice> choices = PinMenuRows.choices(context);
        Set<String> picked = PinMenuRows.picked();
        CharSequence[] names = new CharSequence[choices.size()];
        boolean[] ticked = new boolean[choices.size()];
        for (int index = 0; index < names.length; index++) {
            names[index] = choices.get(index).label;
            ticked[index] = picked.contains(choices.get(index).key);
        }
        AlertDialog dialog = HushDialogs.builder(context)
                .setTitle(getTitle())
                .setMultiChoiceItems(names, ticked, (shown, which, tick) -> choose(choices.get(which).key, tick))
                .setPositiveButton(L10n.t("Close"), null)
                .create();
        HushDialogs.prepareChoices(dialog);
        dialog.show();
        HushDialogs.paint(dialog);
    }

    /** Takes effect at once. A row just ticked is one people expect gone, so its switch comes on with it. */
    void choose(String key, boolean hide) {
        PinMenuRows.pick(key, hide);
        if (hide && !Settings.HIDE_PIN_MENU_ROWS.savedValue()) {
            Settings.HIDE_PIN_MENU_ROWS.save(true);
            page.refreshSwitches();
        }
        refreshRows();
    }

    private static void refreshRows() {
        for (WeakReference<PinMenuRowsPreference> reference : ROWS) {
            PinMenuRowsPreference row = reference.get();
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
