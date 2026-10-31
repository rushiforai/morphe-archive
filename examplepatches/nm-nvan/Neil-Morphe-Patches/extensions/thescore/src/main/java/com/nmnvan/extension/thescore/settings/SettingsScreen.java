package com.nmnvan.extension.thescore.settings;

import android.app.Activity;
import android.app.Dialog;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import com.nmnvan.extension.thescore.Utils;

/**
 * Full-screen settings page, shown as a Dialog so no new Activity needs to be declared in the manifest.
 */
final class SettingsScreen {

    private SettingsScreen() {
    }

    static void show(Activity activity) {
        boolean dark = (activity.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;

        Dialog dialog = new Dialog(activity, dark
                ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar);

        int background = dark ? Color.rgb(0x1B, 0x1C, 0x1E) : Color.WHITE;
        int primaryText = dark ? Color.WHITE : Color.rgb(0x1B, 0x1C, 0x1E);
        int secondaryText = dark ? Color.rgb(0xA0, 0xA3, 0xA8) : Color.rgb(0x5F, 0x63, 0x68);
        int divider = dark ? Color.rgb(0x2C, 0x2E, 0x32) : Color.rgb(0xE3, 0xE5, 0xE8);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(background);
        root.setFitsSystemWindows(true);

        // Header: back arrow and title.
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(dp(activity, 8), dp(activity, 8), dp(activity, 16), dp(activity, 8));

        TextView back = new TextView(activity);
        back.setText("←");
        back.setTextSize(TypedValue.COMPLEX_UNIT_SP, 26);
        back.setTextColor(primaryText);
        back.setPadding(dp(activity, 12), dp(activity, 4), dp(activity, 12), dp(activity, 4));
        back.setContentDescription("Back");
        back.setOnClickListener(v -> dialog.dismiss());
        header.addView(back);

        TextView title = new TextView(activity);
        title.setText(SettingsMenuPatch.ROW_TITLE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(primaryText);
        header.addView(title);
        root.addView(header);

        TextView note = new TextView(activity);
        note.setText("Changes apply after you restart the app.");
        note.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        note.setTextColor(secondaryText);
        note.setPadding(dp(activity, 20), dp(activity, 4), dp(activity, 20), dp(activity, 12));
        root.addView(note);

        ScrollView scroll = new ScrollView(activity);
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list);
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        int shown = 0;
        for (Settings.Section section : Settings.SECTIONS) {
            boolean sectionShown = false;
            for (Settings.Group group : section.groups) {
                int shownInGroup = 0;
                for (BooleanSetting setting : group.settings) {
                    if (!setting.isAvailable()) continue;
                    if (!sectionShown) {
                        list.addView(sectionHeader(activity, section, accent(dark), secondaryText));
                        sectionShown = true;
                    }
                    if (shownInGroup == 0) {
                        if (group.title != null) list.addView(groupHeader(activity, group.title, primaryText));
                    } else {
                        list.addView(divider(activity, divider));
                    }
                    list.addView(settingRow(activity, setting, primaryText, secondaryText));
                    shownInGroup++;
                }
                shown += shownInGroup;
            }
        }
        if (shown == 0) {
            TextView empty = new TextView(activity);
            empty.setText("No settings available. Include patches that have settings when patching the app.");
            empty.setTextColor(secondaryText);
            empty.setPadding(dp(activity, 20), dp(activity, 16), dp(activity, 20), dp(activity, 16));
            list.addView(empty);
        }

        Button restart = new Button(activity);
        restart.setText("Restart app now");
        restart.setOnClickListener(v -> Utils.restartApp(activity));
        LinearLayout.LayoutParams restartParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        restartParams.setMargins(dp(activity, 16), dp(activity, 8), dp(activity, 16), dp(activity, 16));
        root.addView(restart, restartParams);

        dialog.setContentView(root);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(background));
        }
        dialog.show();
    }

    private static View settingRow(Activity activity, BooleanSetting setting, int primaryText, int secondaryText) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(activity, 20), dp(activity, 14), dp(activity, 16), dp(activity, 14));

        LinearLayout texts = new LinearLayout(activity);
        texts.setOrientation(LinearLayout.VERTICAL);

        TextView title = new TextView(activity);
        title.setText(setting.title);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        title.setTextColor(primaryText);
        texts.addView(title);

        if (setting.summary != null) {
            TextView summary = new TextView(activity);
            summary.setText(setting.summary);
            summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            summary.setTextColor(secondaryText);
            summary.setPadding(0, dp(activity, 2), 0, 0);
            texts.addView(summary);
        }

        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Switch toggle = new Switch(activity);
        toggle.setChecked(setting.getStoredValue(activity));
        toggle.setContentDescription(setting.title);
        toggle.setOnCheckedChangeListener((button, checked) -> setting.save(activity, checked));
        row.addView(toggle);

        row.setOnClickListener(v -> toggle.toggle());
        return row;
    }

    private static View sectionHeader(Activity activity, Settings.Section section, int titleColor, int noteColor) {
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.VERTICAL);
        header.setPadding(dp(activity, 20), dp(activity, 20), dp(activity, 20), dp(activity, 4));

        TextView title = new TextView(activity);
        title.setText(section.title.toUpperCase(java.util.Locale.ROOT));
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setLetterSpacing(0.05f);
        title.setTextColor(titleColor);
        header.addView(title);

        if (section.note != null) {
            TextView note = new TextView(activity);
            note.setText(section.note);
            note.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            note.setTextColor(noteColor);
            note.setPadding(0, dp(activity, 4), 0, 0);
            header.addView(note);
        }
        return header;
    }

    private static View groupHeader(Activity activity, String title, int color) {
        TextView header = new TextView(activity);
        header.setText(title);
        header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setTextColor(color);
        header.setPadding(dp(activity, 20), dp(activity, 14), dp(activity, 20), dp(activity, 2));
        return header;
    }

    /** theScore's blue. */
    private static int accent(boolean dark) {
        return dark ? Color.rgb(0x3D, 0x8B, 0xFF) : Color.rgb(0x00, 0x66, 0xE0);
    }

    private static View divider(Activity activity, int color) {
        View view = new View(activity);
        view.setBackgroundColor(color);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(activity, 1) / 2));
        params.setMargins(dp(activity, 20), 0, 0, 0);
        view.setLayoutParams(params);
        return view;
    }

    private static int dp(Activity activity, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, activity.getResources().getDisplayMetrics()));
    }
}
