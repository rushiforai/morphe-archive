package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.view.Gravity;
import android.widget.Button;
import android.widget.TextView;

/** Visual primitives scoped to Local Downloads and matched to Nuvio's TV dialogs. */
final class LocalDownloadsTvUi {
    static final int CARD = Color.rgb(35, 35, 35);
    static final int SELECTED = Color.rgb(58, 58, 58);
    static final int BUTTON = Color.rgb(43, 43, 43);
    static final int TEXT_PRIMARY = Color.rgb(245, 245, 245);
    static final int TEXT_SECONDARY = Color.rgb(184, 184, 184);
    static final int FOCUS_TEXT = Color.rgb(25, 25, 25);

    private LocalDownloadsTvUi() {}

    static TextView text(Activity activity, float sp, int color) {
        TextView view = new TextView(activity);
        view.setTextSize(sp);
        view.setTextColor(color);
        view.setGravity(Gravity.START);
        view.setIncludeFontPadding(false);
        view.setTypeface(Typeface.DEFAULT, Typeface.NORMAL);
        return view;
    }

    static Button button(Activity activity, String label) {
        Button button = new Button(activity);
        button.setText(label);
        button.setTextSize(17);
        button.setAllCaps(false);
        button.setGravity(Gravity.CENTER);
        button.setIncludeFontPadding(false);
        button.setFocusable(true);
        button.setFocusableInTouchMode(true);
        button.setSoundEffectsEnabled(true);
        button.setMinWidth(dp(activity, 132));
        button.setMinHeight(dp(activity, 56));
        button.setPadding(dp(activity, 26), 0, dp(activity, 26), 0);
        button.setElevation(0);
        button.setStateListAnimator(null);

        int[][] states = {
                {android.R.attr.state_focused, android.R.attr.state_enabled},
                {android.R.attr.state_pressed, android.R.attr.state_enabled},
                {-android.R.attr.state_enabled},
                {}
        };
        button.setTextColor(new ColorStateList(states, new int[]{
                FOCUS_TEXT, FOCUS_TEXT, Color.rgb(115, 115, 115), TEXT_PRIMARY
        }));

        StateListDrawable backgrounds = new StateListDrawable();
        backgrounds.addState(new int[]{android.R.attr.state_focused, android.R.attr.state_enabled},
                shape(TEXT_PRIMARY, dp(activity, 28), 0, 0));
        backgrounds.addState(new int[]{android.R.attr.state_pressed, android.R.attr.state_enabled},
                shape(TEXT_PRIMARY, dp(activity, 28), 0, 0));
        backgrounds.addState(new int[]{-android.R.attr.state_enabled},
                shape(Color.rgb(38, 38, 38), dp(activity, 28), 0, 0));
        backgrounds.addState(new int[]{}, shape(BUTTON, dp(activity, 28), 0, 0));
        button.setBackground(backgrounds);
        return button;
    }

    static GradientDrawable shape(int fill, float radius, int strokeWidth, int strokeColor) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(fill);
        drawable.setCornerRadius(radius);
        if (strokeWidth > 0) drawable.setStroke(strokeWidth, strokeColor);
        return drawable;
    }

    static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }
}
