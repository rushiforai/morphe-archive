package com.travianpatch.notifier;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

/**
 * The look of the Travian Tools screens, shared so they stay consistent: a warm Travian-red accent,
 * rounded cards, and light or dark colours following the phone's setting. Everything is built in
 * code, so the game's APK needs no layout or colour resources from us.
 */
final class UiKit {

    /** Fill for buttons and the switched-on state; reads on both light and dark backgrounds. */
    static final int ACCENT = 0xFF9B2C2C;

    private UiKit() {
    }

    // ------------------------------------------------------------------
    // colours
    // ------------------------------------------------------------------

    static boolean dark(Context ctx) {
        int mode = ctx.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }

    static int background(Context ctx) {
        return dark(ctx) ? 0xFF141312 : 0xFFF5F2EE;
    }

    static int surface(Context ctx) {
        return dark(ctx) ? 0xFF211F1E : Color.WHITE;
    }

    static int textColor(Context ctx) {
        return dark(ctx) ? 0xFFEEE9E4 : 0xFF1C1B1A;
    }

    static int mutedColor(Context ctx) {
        return dark(ctx) ? 0xFFA9A29B : 0xFF6B645D;
    }

    /** The accent as text: a little lighter on dark backgrounds so it stays readable. */
    static int accentText(Context ctx) {
        return dark(ctx) ? 0xFFE58A83 : ACCENT;
    }

    // ------------------------------------------------------------------
    // text
    // ------------------------------------------------------------------

    static int dp(Context ctx, float value) {
        return (int) (value * ctx.getResources().getDisplayMetrics().density + 0.5f);
    }

    static TextView text(Context ctx, String value, float sp, boolean bold, int color) {
        TextView view = new TextView(ctx);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (bold) {
            view.setTypeface(Typeface.DEFAULT_BOLD);
        }
        return view;
    }

    static TextView title(Context ctx, String value) {
        TextView view = text(ctx, value, 28, true, textColor(ctx));
        view.setPadding(0, dp(ctx, 8), 0, dp(ctx, 4));
        return view;
    }

    static TextView body(Context ctx, String value) {
        return text(ctx, value, 15, false, textColor(ctx));
    }

    static TextView muted(Context ctx, String value) {
        return text(ctx, value, 13, false, mutedColor(ctx));
    }

    /** A small accent-coloured heading above a group of cards. */
    static TextView section(Context ctx, String value) {
        TextView view = text(ctx, value.toUpperCase(java.util.Locale.ROOT), 12, true, accentText(ctx));
        view.setLetterSpacing(0.1f);
        view.setPadding(dp(ctx, 4), dp(ctx, 24), 0, dp(ctx, 8));
        return view;
    }

    // ------------------------------------------------------------------
    // containers and controls
    // ------------------------------------------------------------------

    static GradientDrawable rounded(int color, float radiusDp, Context ctx) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(color);
        shape.setCornerRadius(dp(ctx, radiusDp));
        return shape;
    }

    /** Rounded background with a touch ripple on top. */
    private static RippleDrawable pressable(int color, float radiusDp, Context ctx) {
        int ripple = dark(ctx) ? 0x33FFFFFF : 0x22000000;
        return new RippleDrawable(ColorStateList.valueOf(ripple), rounded(color, radiusDp, ctx), null);
    }

    static LinearLayout.LayoutParams cardParams(Context ctx) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        params.bottomMargin = dp(ctx, 10);
        return params;
    }

    /** A rounded white (or dark grey) block that groups related content; add it with cardParams. */
    static LinearLayout card(Context ctx) {
        LinearLayout card = new LinearLayout(ctx);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(rounded(surface(ctx), 16, ctx));
        int pad = dp(ctx, 16);
        card.setPadding(pad, pad, pad, pad);
        return card;
    }

    /** A tappable card with a title, a one-line hint and an arrow. */
    static LinearLayout menuRow(Context ctx, String title, String hint, View.OnClickListener onClick) {
        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setBackground(pressable(surface(ctx), 16, ctx));
        int pad = dp(ctx, 16);
        row.setPadding(pad, pad, pad, pad);
        row.setClickable(true);
        row.setOnClickListener(onClick);

        LinearLayout words = new LinearLayout(ctx);
        words.setOrientation(LinearLayout.VERTICAL);
        words.addView(text(ctx, title, 17, true, textColor(ctx)));
        words.addView(muted(ctx, hint));
        row.addView(words, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(text(ctx, "›", 28, false, accentText(ctx)));
        return row;
    }

    static Button primaryButton(Context ctx, String label, View.OnClickListener onClick) {
        Button button = new Button(ctx);
        button.setText(label);
        button.setAllCaps(false);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        button.setTypeface(Typeface.DEFAULT_BOLD);
        button.setTextColor(Color.WHITE);
        button.setStateListAnimator(null);
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(0x33FFFFFF), rounded(ACCENT, 12, ctx), null));
        button.setOnClickListener(onClick);
        return button;
    }

    /** A switch whose on state uses the accent colour. */
    static Switch accentSwitch(Context ctx, String label, boolean checked) {
        Switch toggle = new Switch(ctx);
        toggle.setText(label);
        toggle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        toggle.setTypeface(Typeface.DEFAULT_BOLD);
        toggle.setTextColor(textColor(ctx));
        toggle.setChecked(checked);
        int[][] states = new int[][]{new int[]{android.R.attr.state_checked}, new int[0]};
        toggle.setTrackTintList(new ColorStateList(states, new int[]{ACCENT, dark(ctx) ? 0xFF55504B : 0xFFB9B2AB}));
        toggle.setThumbTintList(new ColorStateList(states, new int[]{Color.WHITE, dark(ctx) ? 0xFFCFC8C1 : Color.WHITE}));
        return toggle;
    }

    static LinearLayout column(Context ctx) {
        LinearLayout column = new LinearLayout(ctx);
        column.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(ctx, 16);
        column.setPadding(pad, pad, pad, pad);
        return column;
    }

    /**
     * Wraps a column in a scrolling page. The game targets a recent Android where windows draw edge
     * to edge, so the column is kept clear of the status and navigation bars, whose icons are set to
     * contrast with the page colour.
     */
    static ScrollView page(final Activity activity, final LinearLayout column) {
        final int pad = dp(activity, 16);
        ScrollView scroll = new ScrollView(activity);
        scroll.setBackgroundColor(background(activity));
        scroll.setFillViewport(true);
        scroll.addView(column);
        scroll.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override
            public WindowInsets onApplyWindowInsets(View v, WindowInsets insets) {
                column.setPadding(pad + insets.getSystemWindowInsetLeft(), pad + insets.getSystemWindowInsetTop(),
                        pad + insets.getSystemWindowInsetRight(), pad + insets.getSystemWindowInsetBottom());
                return insets;
            }
        });
        // The window's decor view doesn't exist yet while the content is still being built, so this
        // waits until the page is on screen. It is cosmetic, so it must never be able to crash a screen.
        scroll.post(new Runnable() {
            @Override
            public void run() {
                styleSystemBars(activity);
            }
        });
        return scroll;
    }

    /** Dark icons on the light page, light icons on the dark page. */
    private static void styleSystemBars(Activity activity) {
        try {
            boolean lightPage = !dark(activity);
            if (Build.VERSION.SDK_INT >= 30) {
                WindowInsetsController controller = activity.getWindow().getInsetsController();
                if (controller != null) {
                    int mask = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                            | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                    controller.setSystemBarsAppearance(lightPage ? mask : 0, mask);
                }
            } else {
                View decor = activity.getWindow().getDecorView();
                int flags = decor.getSystemUiVisibility();
                int light = View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                decor.setSystemUiVisibility(lightPage ? (flags | light) : (flags & ~light));
            }
        } catch (Throwable ignored) {
            // leave the system bars as they are
        }
    }
}
