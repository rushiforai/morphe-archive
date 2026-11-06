/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-05.
 * Written by lavinhoque33, 2026-10-31.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.ColorStateList;
import android.graphics.drawable.ColorDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import java.util.Locale;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.utils.ThemeUtils;

/** Compact picker controls; long language lists scroll in a separate, themed checkbox dialog. */
final class OfflineSubtitlePicker {
    private OfflineSubtitlePicker() {
    }

    static void add(Activity activity, LinearLayout parent, OfflineCaptions.Catalog catalog, int foreground) {
        boolean available = !catalog.tracks.isEmpty();
        Switch include = OfflineUi.toggleRow(activity, parent, "closed_captions",
                str("revanced_offline_subtitles_include"),
                available ? "" : str("revanced_offline_subtitles_none"), foreground, available, catalog.include);
        if (!available) {
            return;
        }

        LinearLayout options = new LinearLayout(activity);
        options.setOrientation(LinearLayout.VERTICAL);
        options.setVisibility(include.isChecked() ? View.VISIBLE : View.GONE);
        parent.addView(options);
        TextView languages = label(activity, "", foreground);
        Runnable updateCount = () -> languages.setText(str("revanced_offline_subtitles_languages",
                catalog.selected.size(), OfflineSubtitle.MAX_TRACKS));
        updateCount.run();
        languages.setOnClickListener(v -> showLanguages(activity, catalog, false, foreground, updateCount));
        options.addView(languages);

        boolean translated = catalog.tracks.stream().anyMatch(track -> !track.translation().isEmpty());
        if (translated) {
            TextView automatic = label(activity, str("revanced_offline_subtitles_translated"), foreground);
            automatic.setOnClickListener(v -> showLanguages(activity, catalog, true, foreground, updateCount));
            options.addView(automatic);
        }
        TextView format = label(activity, "", foreground);
        Runnable updateFormat = () -> format.setText(
                str("revanced_offline_subtitles_format", catalog.format.toUpperCase(Locale.ROOT)));
        updateFormat.run();
        format.setOnClickListener(v -> OfflineUi.showChoices(activity, str("revanced_offline_subtitles_format_title"),
                new String[]{"SRT", "VTT"}, "vtt".equals(catalog.format) ? 1 : 0, foreground, which -> {
                    catalog.format = which == 1 ? "vtt" : "srt";
                    catalog.remember();
                    updateFormat.run();
                }));
        options.addView(format);
        include.setOnCheckedChangeListener((button, checked) -> {
            catalog.include = checked;
            catalog.remember();
            options.setVisibility(checked ? View.VISIBLE : View.GONE);
        });
    }

    private static TextView label(Activity activity, String text, int foreground) {
        TextView label = new TextView(activity);
        label.setText(text);
        label.setTextColor(foreground);
        label.setTextSize(14);
        int padding = Utils.dipToPixels(16);
        label.setPadding(padding, Utils.dipToPixels(10), padding, Utils.dipToPixels(10));
        label.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        return label;
    }

    private static void showLanguages(Activity activity, OfflineCaptions.Catalog catalog, boolean translated,
                                      int foreground, Runnable onChanged) {
        LinearLayout rows = new LinearLayout(activity);
        rows.setOrientation(LinearLayout.VERTICAL);
        rows.addView(label(activity, str("revanced_offline_subtitles_cap", OfflineSubtitle.MAX_TRACKS), foreground));
        for (OfflineCaptionChoices.Track track : catalog.tracks) {
            if (translated == track.translation().isEmpty()) continue;
            CheckBox box = new CheckBox(activity);
            box.setText(track.name());
            box.setTextColor(foreground);
            box.setButtonTintList(ColorStateList.valueOf(foreground));
            box.setPadding(Utils.dipToPixels(16), Utils.dipToPixels(8), Utils.dipToPixels(16), Utils.dipToPixels(8));
            box.setChecked(catalog.selected.contains(track.key()));
            box.setOnClickListener(v -> {
                if (!OfflineSubtitle.select(catalog.selected, track.key(), box.isChecked())) {
                    box.setChecked(false);
                    Utils.showToastShort(str("revanced_offline_subtitles_cap", OfflineSubtitle.MAX_TRACKS));
                } else {
                    catalog.remember();
                    onChanged.run();
                }
            });
            rows.addView(box);
        }
        ScrollView scroll = new ScrollView(activity);
        scroll.addView(rows);
        AlertDialog dialog = Utils.getDialogBuilder(activity)
                .setTitle(str(translated ? "revanced_offline_subtitles_translated"
                        : "revanced_offline_subtitles_languages_title"))
                .setView(scroll)
                .setPositiveButton(android.R.string.ok, null)
                .create();
        dialog.show();
        if (dialog.getWindow() != null) {
            dialog.getWindow().setBackgroundDrawable(new ColorDrawable(ThemeUtils.getDialogBackgroundColor()));
        }
    }
}
