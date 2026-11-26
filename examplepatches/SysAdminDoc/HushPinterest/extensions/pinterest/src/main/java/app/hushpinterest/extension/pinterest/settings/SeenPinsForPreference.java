/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;
import android.view.View;
import android.widget.Button;

import java.util.Arrays;

import app.hushpinterest.extension.pinterest.ads.SeenPins;
import app.hushpinterest.extension.shared.L10n;

/** Hide seen pins for (#52): how long a pin you've seen stays out before it can show again. */
@SuppressWarnings("deprecation") // Framework preferences are what the shared settings page builds on.
public final class SeenPinsForPreference extends Preference {
    SeenPinsForPreference(Context context) {
        super(HushPinterestPreferenceFragment.themed(context));
        setKey("action_seen_pins_for");
        setPersistent(false);
        setTitle(L10n.t(context, "Hide seen pins for"));
        setOnPreferenceClickListener(preference -> {
            tapped();
            return true;
        });
    }

    @Override public CharSequence getSummary() {
        String chosen = SeenPins.FOR.savedValue();
        if (!Arrays.asList(SeenPins.DAY, SeenPins.WEEK, SeenPins.MONTH).contains(chosen)) {
            return L10n.t("Forever. A pin you've seen stays out until you forget it.");
        }
        return L10n.f("%s. After that, a pin you've seen can show up again.", label(chosen));
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        HushPinterestPreferenceFragment.showAllText(view);
        ScreenColors.row(view, this);
        view.setAccessibilityDelegate(new HushPinterestPreferenceFragment.RowSemantics(this, Button.class));
    }

    static String label(String duration) {
        switch (duration) {
            case SeenPins.DAY: return L10n.t("A day");
            case SeenPins.WEEK: return L10n.t("A week");
            case SeenPins.MONTH: return L10n.t("A month");
            default: return L10n.t("Forever");
        }
    }

    private void tapped() {
        String[] durations = SeenPins.DURATIONS;
        CharSequence[] names = new CharSequence[durations.length];
        for (int index = 0; index < names.length; index++) names[index] = label(durations[index]);
        int checked = Arrays.asList(durations).indexOf(SeenPins.FOR.savedValue());
        if (checked < 0) checked = durations.length - 1;
        AlertDialog dialog = HushDialogs.builder(getContext())
                .setTitle(getTitle())
                .setSingleChoiceItems(names, checked, (shown, which) -> {
                    choose(durations[which]);
                    shown.dismiss();
                })
                .setNegativeButton(L10n.t("Cancel"), null)
                .create();
        HushDialogs.prepareChoices(dialog);
        dialog.show();
        HushDialogs.paint(dialog);
    }

    void choose(String duration) {
        SeenPins.FOR.save(duration);
        notifyChanged();
    }
}
