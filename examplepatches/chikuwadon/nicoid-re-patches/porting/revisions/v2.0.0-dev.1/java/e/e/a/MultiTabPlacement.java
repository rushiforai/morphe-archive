package e.e.a;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

final class MultiTabPlacement {
    private static final String ENABLE = "multiple_video_tabs";
    private static final String POSITION = "multiple_video_tabs_at_bottom";
    private static final String HEIGHT = "multiple_video_tabs_height_dp";
    static final int MIN_HEIGHT = 28;
    static final int DEFAULT_HEIGHT = 32;
    static final int MAX_HEIGHT = 64;

    // The general settings screen explicitly sorts its rows after the preference installers run.
    static String[] settingsOrder(PreferenceGroup group, String[] order) {
        Preference enabled = group.findPreference(ENABLE);
        if (enabled == null) return order;
        if (group.findPreference(POSITION) == null) addPlacement(group);
        if (group.findPreference(HEIGHT) == null) addHeight(group);

        int index = java.util.Arrays.asList(order).indexOf(ENABLE) + 1;
        String[] updated = new String[order.length + 2];
        System.arraycopy(order, 0, updated, 0, index);
        updated[index] = POSITION;
        updated[index + 1] = HEIGHT;
        System.arraycopy(order, index, updated, index + 2, order.length - index);
        return updated;
    }

    private static Preference preference(Context context, String key, CharSequence title) {
        Preference row = new Preference(context);
        row.setKey(key);
        row.setPersistent(false);
        row.setTitle(title);
        return row;
    }

    private static void addPlacement(PreferenceGroup group) {
        Context context = group.getContext();
        SharedPreferences preferences = prefs(context);
        Preference placement = preference(context, POSITION,
                PanelUi.tr(context, "複数タブの配置位置", "Multiple tab position", "多分頁列位置"));
        String[] positions = {
            PanelUi.tr(context, "上", "Top", "上方"),
            PanelUi.tr(context, "下", "Bottom", "下方")
        };
        String current = PanelUi.tr(context, "現在値：", "Current: ", "目前：");
        String description = PanelUi.tr(context,
                "複数タブのタブバーを画面の上または下に表示します",
                "Show the multiple-tab bar at the top or bottom of the screen",
                "將多分頁列顯示在畫面的上方或下方");
        placement.setSummary(current + positions[preferences.getBoolean(POSITION, false) ? 1 : 0] + "\n" + description);
        placement.setOnPreferenceClickListener(row -> {
            UiDialogs.show(UiDialogs.builder(context).setTitle(placement.getTitle())
                    .setSingleChoiceItems(positions, preferences.getBoolean(POSITION, false) ? 1 : 0, (dialog, index) -> {
                        preferences.edit().putBoolean(POSITION, index == 1).apply();
                        placement.setSummary(current + positions[index] + "\n" + description);
                        dialog.dismiss();
                    }).setNegativeButton(android.R.string.cancel, null).create());
            return true;
        });
        group.addPreference(placement);
        placement.setDependency(ENABLE);
    }

    private static void addHeight(PreferenceGroup group) {
        Context context = group.getContext();
        SharedPreferences preferences = prefs(context);
        Preference height = preference(context, HEIGHT,
                PanelUi.tr(context, "複数タブの高さ", "Multiple tab bar height", "多分頁列高度"));
        updateHeightSummary(height, heightDp(preferences));
        height.setOnPreferenceClickListener(row -> {
            showHeight(height, preferences);
            return true;
        });
        group.addPreference(height);
        height.setDependency(ENABLE);
    }

    private static void updateHeightSummary(Preference row, int dp) {
        Context context = row.getContext();
        String current = PanelUi.tr(context, "現在値：", "Current: ", "目前：");
        row.setSummary(current + dp + " dp\n" + PanelUi.tr(context,
                "複数タブのタブバーの高さを調整します", "Adjust the height of the multiple-tab bar", "調整多分頁列的高度"));
    }

    private static void showHeight(Preference row, SharedPreferences preferences) {
        Context context = UiTheme191.context(row.getContext());
        LinearLayout panel = new LinearLayout(context);
        panel.setOrientation(LinearLayout.VERTICAL);
        int inset = PanelUi.dp(context, 20);
        panel.setPadding(inset, 0, inset, 0);
        TextView value = new TextView(context);
        value.setTextColor(DynamicTheme.textColor(value));
        value.setTextSize(16);
        panel.addView(value);

        SeekBar slider = new SeekBar(context);
        slider.setContentDescription(row.getTitle());
        slider.setMax(MAX_HEIGHT - MIN_HEIGHT);
        slider.setProgress(heightDp(preferences) - MIN_HEIGHT);
        ColorStateList tint = ColorStateList.valueOf(UiDialogs.accent(context));
        slider.setProgressTintList(tint);
        slider.setThumbTintList(tint);
        panel.addView(slider, new LinearLayout.LayoutParams(-1, PanelUi.dp(context, 48)));
        String initial = PanelUi.tr(context, "初期値", "Default", "預設");
        value.setText(initial + " " + DEFAULT_HEIGHT + " dp  |  " + heightDp(preferences) + " dp");
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                value.setText(initial + " " + DEFAULT_HEIGHT + " dp  |  " + (MIN_HEIGHT + progress) + " dp");
            }
            @Override public void onStartTrackingTouch(SeekBar bar) {}
            @Override public void onStopTrackingTouch(SeekBar bar) {}
        });

        AlertDialog dialog = UiDialogs.builder(context).setTitle(row.getTitle()).setView(panel)
                .setNeutralButton(PanelUi.tr(context, "初期値に戻す", "Restore default", "恢復預設"), null)
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton(PanelUi.tr(context, "適用", "Apply", "套用"), (d, which) -> {
                    int dp = MIN_HEIGHT + slider.getProgress();
                    preferences.edit().putInt(HEIGHT, dp).apply();
                    updateHeightSummary(row, dp);
                }).create();
        UiDialogs.show(dialog);
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL)
                .setOnClickListener(v -> slider.setProgress(DEFAULT_HEIGHT - MIN_HEIGHT));
    }

    static void insert(LinearLayout parent, View bar, int topIndex, ViewGroup.LayoutParams params) {
        SharedPreferences preferences = prefs(bar.getContext());
        params.height = PanelUi.dp(bar.getContext(), heightDp(preferences));
        parent.addView(bar, preferences.getBoolean(POSITION, false) ? parent.getChildCount() : topIndex, params);
    }

    static void update(LinearLayout parent, View bar) {
        if (parent == null || bar == null || bar.getParent() != parent) return;
        SharedPreferences preferences = prefs(bar.getContext());
        boolean bottom = preferences.getBoolean(POSITION, false);
        int desiredIndex = bottom ? parent.getChildCount() - 1 : 0;
        ViewGroup.LayoutParams params = bar.getLayoutParams();
        int height = PanelUi.dp(bar.getContext(), heightDp(preferences));
        if (parent.indexOfChild(bar) != desiredIndex) {
            params.height = height;
            parent.removeView(bar);
            parent.addView(bar, desiredIndex, params);
        } else if (params.height != height) {
            params.height = height;
            bar.setLayoutParams(params);
        }
    }

    private static int heightDp(SharedPreferences preferences) {
        return Math.max(MIN_HEIGHT, Math.min(MAX_HEIGHT, preferences.getInt(HEIGHT, DEFAULT_HEIGHT)));
    }

    private static SharedPreferences prefs(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context);
    }
}
