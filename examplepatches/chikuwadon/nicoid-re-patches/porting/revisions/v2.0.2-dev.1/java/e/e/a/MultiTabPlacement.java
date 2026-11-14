package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;

final class MultiTabPlacement {
    private static final String ENABLE = "multiple_video_tabs";
    private static final String POSITION = "multiple_video_tabs_at_bottom";
    private static final String HEIGHT = "multiple_video_tabs_height_dp";
    private static final String LAYOUT = "nicoid_app_tab_layout";
    static final int MIN_HEIGHT = 28, DEFAULT_HEIGHT = 32, MAX_HEIGHT = 64;
    // 0: app/tab top, 1: tab/app top, 2: app top/tab bottom,
    // 3: tab top/app bottom, 4: app/tab bottom, 5: tab/app bottom.
    static final String[] LABELS = {
        "上部：アプリバー → タブバー",
        "上部：タブバー → アプリバー",
        "アプリバーは上部・タブバーは下部",
        "タブバーは上部・アプリバーは下部",
        "下部：アプリバー → タブバー",
        "下部：タブバー → アプリバー"
    };

    private MultiTabPlacement() {}

    static String[] settingsOrder(PreferenceGroup group, String[] order) {
        if (group.findPreference(ENABLE) == null) return order;
        if (group.findPreference(LAYOUT) == null) addConfiguration(group);
        int index = java.util.Arrays.asList(order).indexOf(ENABLE) + 1;
        if (index < 1) return order;
        String[] result = new String[order.length + 1];
        System.arraycopy(order, 0, result, 0, index);
        result[index] = LAYOUT;
        System.arraycopy(order, index, result, index + 1, order.length - index);
        return result;
    }

    static SharedPreferences prefs(Context c) {
        return PreferenceManager.getDefaultSharedPreferences(c);
    }

    static int layout(SharedPreferences p) {
        int original = p.getBoolean(POSITION, false) ? 2 : 0;
        int saved = p.getInt(LAYOUT, original);
        return saved >= 0 && saved < LABELS.length ? saved : original;
    }

    static int heightDp(SharedPreferences p) {
        return Math.max(MIN_HEIGHT, Math.min(MAX_HEIGHT, p.getInt(HEIGHT, DEFAULT_HEIGHT)));
    }

    static boolean tabAtBottom(int mode) {
        return mode == 2 || mode == 4 || mode == 5;
    }

    private static void addConfiguration(PreferenceGroup group) {
        Context context = group.getContext();
        SharedPreferences preferences = prefs(context);
        Preference preference = new Preference(context);
        preference.setKey(LAYOUT);
        preference.setPersistent(false);
        preference.setTitle(PanelUi.tr(context, "アプリバーとタブバーの配置",
                "App bar and tab bar layout", "應用程式列與分頁列排列"));
        updateSummary(preference, preferences);
        preference.setOnPreferenceClickListener(ignored -> {
            showConfiguration(preference, preferences);
            return true;
        });
        preference.setDependency(ENABLE);
        group.addPreference(preference);
    }

    private static void updateSummary(Preference preference, SharedPreferences p) {
        int mode = layout(p);
        preference.setSummary(LABELS[mode] + " / " + heightDp(p) + " dp");
    }

    static void showConfiguration(Preference preference, SharedPreferences p) {
        Context c = UiTheme191.context(preference.getContext());
        final int[] selected = {layout(p)}, height = {heightDp(p)};
        LinearLayout panel = new LinearLayout(c);
        panel.setPadding(PanelUi.dp(c, 18), 0, PanelUi.dp(c, 18), PanelUi.dp(c, 12));
        panel.setOrientation(LinearLayout.VERTICAL);
        RadioGroup choices = new RadioGroup(c);
        choices.setOrientation(LinearLayout.VERTICAL);
        for (int i = 0; i < LABELS.length; i++) {
            RadioButton radio = new RadioButton(c);
            radio.setId(View.generateViewId());
            radio.setText(LABELS[i]);
            radio.setTextSize(13);
            radio.setTag(i);
            radio.setMinHeight(PanelUi.dp(c, 40));
            choices.addView(radio);
            if (i == selected[0]) radio.setChecked(true);
            radio.setOnClickListener(v -> {
                selected[0] = (Integer) v.getTag();
            });
        }
        panel.addView(choices);
        TextView heightLabel = label(c, "タブバーの高さ：" + height[0] + " dp");
        panel.addView(heightLabel);
        LinearLayout sliderRow = new LinearLayout(c);
        sliderRow.setGravity(Gravity.CENTER_VERTICAL);
        Button minus = button(c, "−"), plus = button(c, "＋");
        SeekBar slider = new SeekBar(c);
        slider.setTag("nicoid-managed-input");
        slider.setProgressTintList(ColorStateList.valueOf(UiDialogs.accent(c)));
        slider.setThumbTintList(ColorStateList.valueOf(UiDialogs.accent(c)));
        slider.setMax(MAX_HEIGHT - MIN_HEIGHT);
        slider.setProgress(height[0] - MIN_HEIGHT);
        sliderRow.addView(minus, new LinearLayout.LayoutParams(PanelUi.dp(c, 40), PanelUi.dp(c, 44)));
        sliderRow.addView(slider, new LinearLayout.LayoutParams(0, PanelUi.dp(c, 44), 1));
        sliderRow.addView(plus, new LinearLayout.LayoutParams(PanelUi.dp(c, 40), PanelUi.dp(c, 44)));
        panel.addView(sliderRow);
        TextView previewLabel = label(c, "配置プレビュー");
        panel.addView(previewLabel);
        LinearLayout preview = new LinearLayout(c);
        preview.setOrientation(LinearLayout.VERTICAL);
        preview.setBackgroundColor(UiDialogs.surface(c));
        panel.addView(preview, new LinearLayout.LayoutParams(-1, -2));
        Runnable refresh = () -> {
            heightLabel.setText("タブバーの高さ：" + height[0] + " dp");
            drawPreview(c, preview, selected[0], height[0]);
            minus.setEnabled(height[0] > MIN_HEIGHT);
            plus.setEnabled(height[0] < MAX_HEIGHT);
        };
        for (int i = 0; i < choices.getChildCount(); i++) {
            choices.getChildAt(i).setOnClickListener(v -> {
                selected[0] = (Integer)v.getTag();
                refresh.run();
            });
        }
        minus.setOnClickListener(v -> slider.setProgress(Math.max(0, slider.getProgress() - 1)));
        plus.setOnClickListener(v -> slider.setProgress(Math.min(slider.getMax(), slider.getProgress() + 1)));
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar b, int progress, boolean fromUser) {
                height[0] = progress + MIN_HEIGHT;
                refresh.run();
            }
            @Override public void onStartTrackingTouch(SeekBar b) {}
            @Override public void onStopTrackingTouch(SeekBar b) {}
        });
        refresh.run();
        ScrollView scroll = new ScrollView(c);
        scroll.addView(panel);
        AlertDialog dialog = UiDialogs.builder(c).setTitle(preference.getTitle()).setView(scroll)
                .setNeutralButton("初期値に戻す", null)
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("適用", (d, index) -> {
                    p.edit().putInt(LAYOUT, selected[0])
                            .putBoolean(POSITION, tabAtBottom(selected[0]))
                            .putInt(HEIGHT, height[0]).apply();
                    updateSummary(preference, p);
                    AppBarPlacement202.refreshCurrent();
                }).create();
        UiDialogs.show(dialog);
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(v -> {
            selected[0] = 0;
            height[0] = DEFAULT_HEIGHT;
            slider.setProgress(DEFAULT_HEIGHT - MIN_HEIGHT);
            ((RadioButton)choices.getChildAt(0)).setChecked(true);
            refresh.run();
        });
    }

    private static TextView label(Context c, String value) {
        TextView t = new TextView(c);
        t.setText(value);
        t.setTextColor(DynamicTheme.textColor(t));
        t.setTextSize(14);
        t.setPadding(0, PanelUi.dp(c, 7), 0, PanelUi.dp(c, 5));
        return t;
    }
    private static Button button(Context c, String text) {
        Button b = new Button(c);
        b.setText(text);
        b.setTextSize(16);
        b.setPadding(0, 0, 0, 0);
        b.setMinWidth(0);
        b.setMinimumWidth(0);
        return b;
    }

    private static void drawPreview(Context c, LinearLayout target, int mode, int tabDp) {
        target.removeAllViews();
        boolean topApp = mode == 0 || mode == 2;
        boolean topTab = mode == 1 || mode == 3;
        if (mode == 0) { previewBar(c,target,false,tabDp); previewBar(c,target,true,tabDp); }
        else if (mode == 1) { previewBar(c,target,true,tabDp); previewBar(c,target,false,tabDp); }
        else if (topApp) previewBar(c,target,false,tabDp);
        else if (topTab) previewBar(c,target,true,tabDp);
        TextView list = label(c, "▣　動画一覧\n\n▣　動画情報\n\n▣　動画一覧");
        list.setTextColor(DynamicTheme.secondaryTextColor(list));
        list.setGravity(Gravity.CENTER_VERTICAL);
        list.setPadding(PanelUi.dp(c, 12), 0, 0, 0);
        target.addView(list, new LinearLayout.LayoutParams(-1, PanelUi.dp(c, 110)));
        if (mode == 2) previewBar(c,target,true,tabDp);
        else if (mode == 3) previewBar(c,target,false,tabDp);
        else if (mode == 4) {previewBar(c,target,false,tabDp); previewBar(c,target,true,tabDp);}
        else if (mode == 5) {previewBar(c,target,true,tabDp); previewBar(c,target,false,tabDp);}
    }

    private static void previewBar(Context c, LinearLayout parent, boolean tabs, int dp) {
        TextView bar = label(c, tabs ? "⌕ 検索　│　履歴　│　マイリスト　＋"
                : "☰　動画タイトル　　　　　　　 ⌕　⋮");
        bar.setTextSize(12);
        bar.setSingleLine(true);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(PanelUi.dp(c, 9), 0, PanelUi.dp(c, 9), 0);
        bar.setTextColor(tabs ? DynamicTheme.textColor(bar) : 0xffffffff);
        if (!tabs) bar.setBackgroundColor(0xff203454);
        else bar.setBackgroundColor(UiDialogs.surface(c));
        parent.addView(bar, new LinearLayout.LayoutParams(-1, PanelUi.dp(c, tabs ? dp : 56)));
    }

    static void insert(LinearLayout parent, View bar, int topIndex, ViewGroup.LayoutParams params) {
        SharedPreferences p = prefs(bar.getContext());
        params.height = PanelUi.dp(bar.getContext(), heightDp(p));
        parent.addView(bar, tabAtBottom(layout(p)) ? parent.getChildCount() : topIndex, params);
        AppBarPlacement202.attach(parent, bar);
    }

    static void update(LinearLayout parent, View bar) {
        if (parent == null || bar == null || bar.getParent() != parent) return;
        SharedPreferences p = prefs(bar.getContext());
        int index = tabAtBottom(layout(p)) ? parent.getChildCount() - 1 : 0;
        ViewGroup.LayoutParams params = bar.getLayoutParams();
        int height = PanelUi.dp(bar.getContext(), heightDp(p));
        if (parent.indexOfChild(bar) != index) {
            params.height = height;
            parent.removeView(bar);
            parent.addView(bar, index, params);
        } else if (params.height != height) {
            params.height = height;
            bar.setLayoutParams(params);
        }
        AppBarPlacement202.attach(parent, bar);
    }
}
