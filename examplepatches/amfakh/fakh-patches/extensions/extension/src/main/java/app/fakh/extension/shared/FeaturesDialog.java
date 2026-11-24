/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.shared;

import android.app.Activity;
import android.app.AlertDialog;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Consumer;

/**
 * The Fakh Patches dialog: one switch for each feature of {@link Features}, under a title per section when there is
 * more than one. A switch whose dependency is off is greyed out. Closing it after a change that needs a restart shows
 * the {@link RestartBar}.
 */
public final class FeaturesDialog {
    private FeaturesDialog() {
    }

    /**
     * Shows the dialog.
     *
     * @param activity the activity to show it over
     * @param style    colors each switch the way the app would; called again on every change, since a theme switch can
     *                 change the colors
     */
    public static void show(Activity activity, Consumer<Switch> style) {
        float density = activity.getResources().getDisplayMetrics().density;
        int pad = Math.round(24 * density);
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(pad, Math.round(8 * density), pad, 0);

        boolean sections = Features.all().stream().map(f -> f.section).distinct().count() > 1;
        Map<Features.Feature, Switch> switches = new HashMap<>();
        boolean[] restart = {false};
        String section = null;
        for (Features.Feature feature : Features.all()) {
            if (sections && !feature.section.equals(section)) {
                TextView header = new TextView(activity);
                header.setText(I18n.tr(feature.section));
                header.setTextSize(13);
                header.setAlpha(0.7f);
                header.setPadding(0, Math.round((section == null ? 4 : 16) * density), 0, Math.round(4 * density));
                list.addView(header);
            }
            section = feature.section;

            Switch row = new Switch(activity);
            row.setText(I18n.tr(feature.title));
            row.setTextSize(16);
            row.setMinHeight(Math.round(56 * density));
            row.setChecked(Features.saved(feature.id));
            row.setOnCheckedChangeListener((button, on) -> {
                Features.set(feature.id, on);
                if (feature.restart) restart[0] = true;
                refresh(switches, style);
            });
            switches.put(feature, row);
            list.addView(row);
            if (!feature.description.isEmpty()) {
                TextView about = new TextView(activity);
                about.setText(I18n.tr(feature.description));
                about.setTextSize(13);
                about.setAlpha(0.7f);
                about.setPadding(0, 0, Math.round(56 * density), Math.round(8 * density));
                list.addView(about);
            }
        }
        refresh(switches, style);

        new AlertDialog.Builder(activity, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setTitle("Fakh Patches")
                .setView(list)
                .setOnDismissListener(d -> {
                    if (restart[0]) RestartBar.show(activity, 0, Features.on("material_you"));
                })
                .show();
    }

    private static void refresh(Map<Features.Feature, Switch> switches, Consumer<Switch> style) {
        switches.forEach((feature, row) -> {
            row.setEnabled(feature.dependsOn.isEmpty() || Features.on(feature.dependsOn));
            style.accept(row);
        });
    }
}
