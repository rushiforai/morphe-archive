package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.widget.FrameLayout;
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
        "上部：アプリバー・下部：タブバー",
        "上部：タブバー・下部：アプリバー",
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
        // A newly created Preference has not yet been attached to the
        // PreferenceManager. Registering its dependency before insertion
        // raises IllegalStateException on Android 16 during settings startup.
        group.addPreference(preference);
        preference.setDependency(ENABLE);
    }

    private static void updateSummary(Preference preference, SharedPreferences p) {
        int mode = layout(p);
        preference.setSummary(LABELS[mode] + " / " + heightDp(p) + " dp");
    }

    static void showConfiguration(Preference preference, SharedPreferences p) {
        Context c = UiTheme191.context(preference.getContext());
        final int[] selected = {layout(p)}, height = {heightDp(p)};
        LinearLayout panel = new LinearLayout(c);
        int pad = PanelUi.dp(c, 16);
        // Leave a small breathing gap below the AlertDialog's title.
        panel.setPadding(pad, PanelUi.dp(c, 8), pad, PanelUi.dp(c, 12));
        panel.setOrientation(LinearLayout.VERTICAL);

        RadioGroup choices = new RadioGroup(c);
        choices.setOrientation(LinearLayout.VERTICAL);
        for (int i = 0; i < LABELS.length; i++) {
            RadioButton radio = new RadioButton(c);
            radio.setId(View.generateViewId());
            radio.setText(LABELS[i]);
            radio.setTextSize(13);
            radio.setTag(i);
            radio.setMinHeight(PanelUi.dp(c, 38));
            choices.addView(radio);
            if (i == selected[0]) radio.setChecked(true);
        }
        panel.addView(choices);

        // Match the compact, flat comment-style adjustment rows:
        // title on the left, "initial | current" on the right, and
        // simple teal - / slider / + controls without filled buttons.
        LinearLayout headingRow = new LinearLayout(c);
        headingRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView heading = label(c, "タブバーの高さ");
        headingRow.addView(heading, new LinearLayout.LayoutParams(0, -2, 1));
        TextView heightValue = label(c, "");
        heightValue.setTextSize(12);
        heightValue.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        headingRow.addView(heightValue, new LinearLayout.LayoutParams(-2, -2));
        panel.addView(headingRow);

        LinearLayout sliderRow = new LinearLayout(c);
        sliderRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView minus = button(c, "−"), plus = button(c, "＋");
        SeekBar slider = new SeekBar(c);
        slider.setTag("nicoid-managed-input");
        ColorStateList accent = ColorStateList.valueOf(UiDialogs.accent(c));
        slider.setProgressTintList(accent);
        slider.setThumbTintList(accent);
        slider.setMax(MAX_HEIGHT - MIN_HEIGHT);
        slider.setProgress(height[0] - MIN_HEIGHT);
        FrameLayout sliderContainer = new FrameLayout(c);
        sliderContainer.addView(slider, new FrameLayout.LayoutParams(-1, PanelUi.dp(c, 48)));
        // The small vertical mark indicates the current default (32 dp).
        View defaultMark = new View(c);
        defaultMark.setBackgroundColor(DynamicTheme.textColor(defaultMark));
        defaultMark.setAlpha(.65f);
        defaultMark.setClickable(false);
        FrameLayout.LayoutParams markParams = new FrameLayout.LayoutParams(
                PanelUi.dp(c, 2), PanelUi.dp(c, 17), Gravity.TOP | Gravity.START);
        markParams.topMargin = PanelUi.dp(c, 15);
        sliderContainer.addView(defaultMark, markParams);
        slider.addOnLayoutChangeListener((v,left,top,right,bottom,ol,ot,oright,obottom) -> {
            if (right - left == oright - ol) return;
            int track = Math.max(0, slider.getWidth() - slider.getPaddingLeft()
                    - slider.getPaddingRight());
            int defaultX = slider.getLeft() + slider.getPaddingLeft()
                    + Math.round(track * (DEFAULT_HEIGHT - MIN_HEIGHT)
                    / (float)(MAX_HEIGHT - MIN_HEIGHT));
            FrameLayout.LayoutParams layoutParams =
                    (FrameLayout.LayoutParams)defaultMark.getLayoutParams();
            layoutParams.leftMargin = Math.max(0, defaultX - PanelUi.dp(c, 1));
            defaultMark.setLayoutParams(layoutParams);
        });
        sliderRow.addView(minus, new LinearLayout.LayoutParams(
                PanelUi.dp(c, 44), PanelUi.dp(c, 48)));
        sliderRow.addView(sliderContainer, new LinearLayout.LayoutParams(
                0, PanelUi.dp(c, 48), 1));
        sliderRow.addView(plus, new LinearLayout.LayoutParams(
                PanelUi.dp(c, 44), PanelUi.dp(c, 48)));
        panel.addView(sliderRow);

        TextView previewLabel = label(c, "配置プレビュー");
        panel.addView(previewLabel);
        LinearLayout preview = new LinearLayout(c);
        preview.setOrientation(LinearLayout.VERTICAL);
        preview.setBackgroundColor(UiDialogs.surface(c));
        panel.addView(preview, new LinearLayout.LayoutParams(-1, -2));

        Runnable refresh = () -> {
            heightValue.setText("初期値 " + DEFAULT_HEIGHT + " dp  │  " + height[0] + " dp");
            drawPreview(c, preview, selected[0], height[0]);
            minus.setEnabled(height[0] > MIN_HEIGHT);
            plus.setEnabled(height[0] < MAX_HEIGHT);
            minus.setAlpha(minus.isEnabled() ? 1f : .35f);
            plus.setAlpha(plus.isEnabled() ? 1f : .35f);
        };
        for (int i = 0; i < choices.getChildCount(); i++) {
            choices.getChildAt(i).setOnClickListener(v -> {
                selected[0] = (Integer)v.getTag();
                refresh.run();
            });
        }
        minus.setOnClickListener(v -> slider.setProgress(Math.max(0, slider.getProgress() - 1)));
        plus.setOnClickListener(v -> slider.setProgress(Math.min(slider.getMax(),
                slider.getProgress() + 1)));
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
        scroll.setFillViewport(false);
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
        TextView text = new TextView(c);
        text.setText(value);
        text.setTextColor(DynamicTheme.textColor(text));
        text.setTextSize(14);
        text.setPadding(0, PanelUi.dp(c, 7), 0, PanelUi.dp(c, 5));
        return text;
    }

    private static TextView button(Context c, String label) {
        TextView text = new TextView(c);
        text.setText(label);
        text.setGravity(Gravity.CENTER);
        text.setTextColor(UiDialogs.accent(c));
        text.setTextSize(24);
        text.setMinWidth(PanelUi.dp(c, 44));
        text.setMinHeight(PanelUi.dp(c, 44));
        text.setContentDescription(label.equals("＋") ? "高さを1dp増やす" : "高さを1dp減らす");
        return text;
    }

    private static void drawPreview(Context c, LinearLayout target, int mode, int tabDp) {
        target.removeAllViews();
        if (mode == 0) { previewBar(c,target,false,tabDp); previewBar(c,target,true,tabDp); }
        else if (mode == 1) { previewBar(c,target,true,tabDp); previewBar(c,target,false,tabDp); }
        else if (mode == 2) previewBar(c,target,false,tabDp);
        else if (mode == 3) previewBar(c,target,true,tabDp);

        TextView videoInfo = label(c, "▣　動画情報");
        videoInfo.setTextColor(DynamicTheme.secondaryTextColor(videoInfo));
        videoInfo.setGravity(Gravity.CENTER_VERTICAL);
        videoInfo.setPadding(PanelUi.dp(c, 12), 0, 0, 0);
        target.addView(videoInfo, new LinearLayout.LayoutParams(-1, PanelUi.dp(c, 95)));

        if (mode == 2) previewBar(c,target,true,tabDp);
        else if (mode == 3) previewBar(c,target,false,tabDp);
        else if (mode == 4) {previewBar(c,target,false,tabDp); previewBar(c,target,true,tabDp);}
        else if (mode == 5) {previewBar(c,target,true,tabDp); previewBar(c,target,false,tabDp);}
    }

    private static TextView part(Context c, String text, int size, int color) {
        TextView t = new TextView(c);
        t.setText(text);
        t.setTextSize(size);
        t.setTextColor(color);
        t.setGravity(Gravity.CENTER_VERTICAL);
        t.setSingleLine(true);
        return t;
    }

    private static void previewBar(Context c, LinearLayout parent, boolean tabs, int tabDp) {
        int height = PanelUi.dp(c, tabs ? tabDp : 56);
        LinearLayout row = new LinearLayout(c);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(PanelUi.dp(c, 9), 0, PanelUi.dp(c, 9), 0);
        if (tabs) {
            GradientDrawable border = new GradientDrawable();
            border.setColor(UiDialogs.surface(c));
            border.setStroke(PanelUi.dp(c, 1), UiDialogs.accent(c));
            row.setBackground(border);
            row.addView(part(c, "⌕ 検索", 12, DynamicTheme.textColor(row)),
                    new LinearLayout.LayoutParams(0, -1, 1));
            row.addView(part(c, "履歴", 12, DynamicTheme.textColor(row)),
                    new LinearLayout.LayoutParams(0, -1, 1));
            row.addView(part(c, "マイリスト", 12, DynamicTheme.textColor(row)),
                    new LinearLayout.LayoutParams(0, -1, 1));
            row.addView(part(c, "＋", 16, UiDialogs.accent(c)),
                    new LinearLayout.LayoutParams(-2, -1));
        } else {
            row.setBackgroundColor(0xff203454);
            TextView hamburger=part(c,"☰",19,Color.WHITE);
            row.addView(hamburger,new LinearLayout.LayoutParams(PanelUi.dp(c,28),-1));
            LinearLayout titles = new LinearLayout(c);
            titles.setOrientation(LinearLayout.VERTICAL);
            titles.setGravity(Gravity.CENTER_VERTICAL);
            titles.addView(part(c,"名作淫夢",13,Color.WHITE));
            titles.addView(part(c,"タグ検索 コメントが新しい順",10,0xffbdc7d7));
            LinearLayout.LayoutParams titleParams=new LinearLayout.LayoutParams(0,-1,1);
            titleParams.leftMargin=PanelUi.dp(c,7);
            row.addView(titles,titleParams);
            TextView search=part(c,"⌕",20,Color.WHITE);
            search.setGravity(Gravity.CENTER);
            row.addView(search,new LinearLayout.LayoutParams(PanelUi.dp(c,27),-1));
            TextView more=part(c,"⋮",22,Color.WHITE);
            more.setGravity(Gravity.CENTER);
            row.addView(more,new LinearLayout.LayoutParams(PanelUi.dp(c,23),-1));
        }
        parent.addView(row,new LinearLayout.LayoutParams(-1,height));
    }

    static void insert(LinearLayout parent, View bar, int topIndex, ViewGroup.LayoutParams params) {
        SharedPreferences p = prefs(bar.getContext());
        params.height = PanelUi.dp(bar.getContext(), heightDp(p));
        parent.addView(bar, tabAtBottom(layout(p)) ? parent.getChildCount() : topIndex, params);
        AppBarPlacement202.attach(parent, bar);
    }

    static void update(LinearLayout parent, View bar) {
        if (parent == null || bar == null) return;
        // The actual bar can live inside the transparent decor overlay;
        // AppBarPlacement202 owns its native height-preserving spacer.
        if (bar.getParent() == parent) {
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
        }
        AppBarPlacement202.attach(parent, bar);
    }
}
