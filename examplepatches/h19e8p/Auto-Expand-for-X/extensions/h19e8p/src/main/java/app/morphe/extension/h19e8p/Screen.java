/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.h19e8p;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Insets;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * h19e8p Patches の画面 (設定・フラグの結果) の共通の土台。
 *
 * <p>X の画面の部品を借りず、Android の標準の部品だけで組み立てる。標準の見出し (ActionBar) は
 * 使わない。Android 15 以降は画面が上下のバーの裏まで広がり、見出しと中身が重なるので、見出しも
 * 自分で並べ、バーの分の余白を取る。
 */
public abstract class Screen extends Activity {
    /** X のテーマ。明るい・ダークブルー (dim)・ブラック (lights out)。 */
    protected enum Theme { LIGHT, DIM, BLACK }

    protected boolean dark;
    protected Theme theme;
    protected LinearLayout root;
    private TextView titleView;

    /**
     * X のアプリの今のテーマ。X は設定を &lt;パッケージ名&gt;_preferences に保存している。
     * three_state_night_mode が "0" なら明るい、"1" ならダーク、"2" なら端末の設定に従う。
     * ダークの時の見た目は dark_mode_appearance ("dim" か "lights_out")。
     */
    private Theme readTheme() {
        boolean systemDark = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        try {
            android.content.SharedPreferences prefs =
                    getSharedPreferences(getPackageName() + "_preferences", MODE_PRIVATE);
            String nightMode = prefs.getString("three_state_night_mode", "2");
            String appearance = prefs.getString("dark_mode_appearance", "lights_out");
            boolean darkTheme = "1".equals(nightMode) || ("2".equals(nightMode) && systemDark);
            if (!darkTheme) return Theme.LIGHT;
            return "dim".equals(appearance) ? Theme.DIM : Theme.BLACK;
        } catch (Throwable ex) {
            return systemDark ? Theme.BLACK : Theme.LIGHT;
        }
    }

    /** 見出しの文字。 */
    protected abstract String screenTitle();

    /** 見出しの下に入れる中身。高さは残りいっぱいになる。 */
    protected abstract View createContent();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        theme = readTheme();
        dark = theme != Theme.LIGHT;
        setTheme(dark ? android.R.style.Theme_Material_NoActionBar
                : android.R.style.Theme_Material_Light_NoActionBar);
        super.onCreate(savedInstanceState);
        Prefs.init(this);
        setTitle(screenTitle());

        root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(background());

        titleView = text(screenTitle(), 20, primary());
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setGravity(Gravity.CENTER_VERTICAL);
        titleView.setPadding(dp(16), 0, dp(16), 0);
        root.addView(titleView, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(56)));
        root.addView(divider(), new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(1)));
        root.addView(createContent(), new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        setContentView(root);

        // ステータスバーとナビゲーションバーの分だけ、上下に余白を取る。
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int top;
            int bottom;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                top = bars.top;
                bottom = bars.bottom;
            } else {
                top = insets.getSystemWindowInsetTop();
                bottom = insets.getSystemWindowInsetBottom();
            }
            view.setPadding(0, top, 0, bottom);
            return insets;
        });
        setBarColors();
    }

    protected void setScreenTitle(String title) {
        if (titleView != null) titleView.setText(title);
    }

    /** バーを画面の色に合わせ、明るい時はバーのアイコンを暗くする。 */
    @SuppressWarnings("deprecation")
    private void setBarColors() {
        Window window = getWindow();
        window.setStatusBarColor(Color.TRANSPARENT);
        window.setNavigationBarColor(Color.TRANSPARENT);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false);
            WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                int light = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                        | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                controller.setSystemBarsAppearance(dark ? 0 : light, light);
            }
        } else {
            int flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;
            if (!dark) flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
            window.getDecorView().setSystemUiVisibility(flags);
        }
    }

    /** 画面の色に合わせたダイアログを作る。show() の後に {@link #styleButtons} を呼ぶ。 */
    protected AlertDialog.Builder dialog() {
        return new AlertDialog.Builder(this, dark
                ? android.R.style.Theme_Material_Dialog_Alert
                : android.R.style.Theme_Material_Light_Dialog_Alert);
    }

    /**
     * X のアプリの色の設定を引き継ぐと、ダイアログのボタンの文字が背景と同じ色になって見えないことが
     * あるので、文字の色を自分で決める。
     */
    protected void styleButtons(AlertDialog dialog) {
        for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEGATIVE,
                AlertDialog.BUTTON_NEUTRAL}) {
            if (dialog.getButton(which) != null) dialog.getButton(which).setTextColor(accent());
        }
        // ダイアログの背景と文字も X のテーマの色にそろえる (ダークブルーなら紺色)。
        if (dialog.getWindow() != null) {
            android.graphics.drawable.GradientDrawable shape = new android.graphics.drawable.GradientDrawable();
            shape.setColor(background());
            shape.setCornerRadius(dp(16));
            if (theme != Theme.LIGHT) shape.setStroke(dp(1), dividerColor());
            dialog.getWindow().setBackgroundDrawable(shape);
        }
        TextView message = dialog.findViewById(android.R.id.message);
        if (message != null) message.setTextColor(primary());
        int titleId = getResources().getIdentifier("alertTitle", "id", "android");
        TextView title = titleId == 0 ? null : dialog.findViewById(titleId);
        if (title != null) title.setTextColor(primary());
        if (dialog.getListView() != null) dialog.getListView().setBackgroundColor(background());
    }

    protected View divider() {
        View divider = new View(this);
        divider.setBackgroundColor(dividerColor());
        return divider;
    }

    protected int dividerColor() {
        switch (theme) {
            case DIM:
                return Color.rgb(0x38, 0x44, 0x4D);
            case BLACK:
                return Color.rgb(0x2F, 0x33, 0x36);
            default:
                return Color.rgb(0xEF, 0xF3, 0xF4);
        }
    }

    protected View header(String title) {
        TextView view = text(title, 14, accent());
        view.setPadding(dp(16), dp(20), dp(16), dp(6));
        return view;
    }

    protected TextView note(String message) {
        TextView view = text(message, 13, secondary());
        view.setPadding(dp(16), dp(12), dp(16), dp(8));
        return view;
    }

    protected TextView text(String value, int sp, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        return view;
    }

    // 色は X の3つのテーマ (明るい・ダークブルー・ブラック) と同じ値にする。

    protected int background() {
        switch (theme) {
            case DIM:
                return Color.rgb(0x15, 0x20, 0x2B);
            case BLACK:
                return Color.BLACK;
            default:
                return Color.WHITE;
        }
    }

    protected int primary() {
        switch (theme) {
            case DIM:
                return Color.rgb(0xF7, 0xF9, 0xF9);
            case BLACK:
                return Color.rgb(0xE7, 0xE9, 0xEA);
            default:
                return Color.rgb(0x0F, 0x14, 0x19);
        }
    }

    protected int secondary() {
        switch (theme) {
            case DIM:
                return Color.rgb(0x8B, 0x98, 0xA5);
            case BLACK:
                return Color.rgb(0x71, 0x76, 0x7B);
            default:
                return Color.rgb(0x53, 0x64, 0x71);
        }
    }

    protected int accent() {
        return Color.rgb(0x1D, 0x9B, 0xF0);
    }

    /** 選んだ行の背景。 */
    protected int selectedBackground() {
        switch (theme) {
            case DIM:
                return Color.rgb(0x1E, 0x2D, 0x3C);
            case BLACK:
                return Color.rgb(0x03, 0x18, 0x26);
            default:
                return Color.rgb(0xE8, 0xF5, 0xFD);
        }
    }

    protected int selectable() {
        TypedValue value = new TypedValue();
        getTheme().resolveAttribute(android.R.attr.selectableItemBackground, value, true);
        return value.resourceId;
    }

    protected int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
