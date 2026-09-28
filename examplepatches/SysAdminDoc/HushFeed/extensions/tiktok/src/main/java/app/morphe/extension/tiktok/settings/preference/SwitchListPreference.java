/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.settings.preference;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;
import android.view.View;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Map;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.tiktok.Utils;
import app.morphe.extension.tiktok.settings.L10n;

/**
 * One row over a family of switches. The dialog is a list of check boxes, one per switch, and
 * the row's second line names the ones that are on. The six right column hides were six rows
 * in a row that each said "Hide the ... button"; one row whose second line says "Hidden: Like,
 * Share" is the same choice read at a glance, and the page is six rows shorter.
 *
 * <p>The row has a key of its own, so search can land on it, but no setting behind it: the
 * settings are the items'. The badge on the master menu counts them through {@link #settings()}.
 */
@SuppressWarnings("deprecation")
public final class SwitchListPreference extends Preference {
    /** One check box: a label already in the reader's language, and the switch it drives. */
    public static final class Item {
        final String label;
        final BooleanSetting setting;

        public Item(String label, BooleanSetting setting) {
            this.label = label;
            this.setting = setting;
        }
    }

    private final List<Item> items;
    private final String description;

    /**
     * @param title       the row's title, an English key
     * @param description the row's first summary line, an English key
     */
    public SwitchListPreference(Context context, String key, String title, String description,
            List<Item> items) {
        super(context);
        setKey(key);
        setTitle(L10n.t(context, title));
        this.description = L10n.t(context, description);
        this.items = Collections.unmodifiableList(new ArrayList<>(items));
    }

    /** The switches behind the row, for whatever counts settings by row. */
    public List<BooleanSetting> settings() {
        List<BooleanSetting> settings = new ArrayList<>();
        for (Item item : items) settings.add(item.setting);
        return settings;
    }

    /**
     * The description, then the state on a line of its own. Two lines rather than one sentence
     * with the labels written into it: the labels are entries of their own, and a line built
     * from them is read as parts by the translation sweep only when it stands on its own line.
     */
    @Override
    public CharSequence getSummary() {
        List<String> on = new ArrayList<>();
        for (Item item : items) if (item.setting.savedValue()) on.add(item.label);
        String joined = String.join(", ", on);
        String state = on.isEmpty()
                ? L10n.t(getContext(), "Nothing hidden.")
                : L10n.f(getContext(), "Hidden: %1$s", joined);
        return description + "\n" + state;
    }

    @Override
    protected void onClick() {
        Context context = getContext();
        CharSequence[] labels = new CharSequence[items.size()];
        boolean[] checked = new boolean[items.size()];
        for (int i = 0; i < items.size(); i++) {
            labels[i] = items.get(i).label;
            checked[i] = items.get(i).setting.savedValue();
        }
        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(getTitle())
                .setMultiChoiceItems(labels, checked, (ignored, which, isChecked) -> checked[which] = isChecked)
                // Apply, not Save: one of the boxes in this dialog is the save button itself,
                // and a dialog whose confirm action reads the same as one of its rows is a
                // dialog people misread. The diagnostics picker says Apply for the same reason.
                .setPositiveButton(L10n.t(context, "Apply"), null)
                .setNegativeButton(L10n.t(context, "Cancel"), null)
                .show();
        SettingsUi.styleStandardAlertDialog(dialog);
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
            if (!view.isEnabled()) return;
            Map<Setting<?>, Object> changes = new LinkedHashMap<>();
            for (int i = 0; i < items.size(); i++) {
                BooleanSetting setting = items.get(i).setting;
                if (setting.savedValue() != checked[i]) changes.put(setting, checked[i]);
            }
            if (changes.isEmpty()) {
                dialog.dismiss();
                return;
            }
            setChoicesEnabled(dialog, false);
            boolean accepted = app.morphe.extension.shared.Utils.runOnBackgroundThread(() -> {
                boolean saved = false;
                try {
                    Setting.saveAll(changes);
                    saved = true;
                } catch (java.io.IOException failure) {
                    app.morphe.extension.shared.Logger.printException(
                            () -> "Could not save checklist choices", failure);
                }
                boolean success = saved;
                app.morphe.extension.shared.Utils.runOnMainThread(() -> {
                    setChoicesEnabled(dialog, true);
                    if (success) {
                        notifyChanged();
                        dialog.dismiss();
                    } else reportSaveFailure();
                });
            });
            if (!accepted) {
                setChoicesEnabled(dialog, true);
                reportSaveFailure();
            }
        });
    }

    private static void setChoicesEnabled(AlertDialog dialog, boolean enabled) {
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(enabled);
        dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setEnabled(enabled);
        dialog.getListView().setEnabled(enabled);
    }

    private void reportSaveFailure() {
        app.morphe.extension.shared.Utils.showToastShort(L10n.t(getContext(),
                "Couldn't save these choices. Try again."));
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        Utils.setTitleAndSummaryColor(view);
    }
}
