/*
 * Meta Patches — shared UI helpers.
 *
 * Forked from the InstaFL UI kit (https://github.com/mamiiblt/instafel) by
 * mamiiblt (Muhammed Ali Bulut), reduced to what Meta Patches needs.
 * The menu UI is built programmatically so the extension does not have to
 * ship compiled resources.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * Theme colors and view factories shared by every menu screen.
 */
public final class ModsUi {

    public static final int COLOR_DARK_BACKGROUND = Color.parseColor("#141516");
    public static final int COLOR_DARK_TILE = Color.parseColor("#25282d");
    public static final int COLOR_DARK_TEXT = Color.WHITE;
    public static final int COLOR_DARK_SUB_TEXT = Color.parseColor("#8e9298");

    public static final int COLOR_LIGHT_BACKGROUND = Color.parseColor("#f5f4f3");
    public static final int COLOR_LIGHT_TILE = Color.WHITE;
    public static final int COLOR_LIGHT_TEXT = Color.parseColor("#1b1b1b");
    public static final int COLOR_LIGHT_SUB_TEXT = Color.parseColor("#8e9298");

    public static final int COLOR_ACCENT = Color.parseColor("#E1306C");

    private final Context ctx;
    private final boolean dark;

    public ModsUi(Context ctx) {
        this.ctx = ctx;
        int nightMode = ctx.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK;
        this.dark = nightMode == Configuration.UI_MODE_NIGHT_YES;
    }

    public boolean isDark() {
        return dark;
    }

    public int background() {
        return dark ? COLOR_DARK_BACKGROUND : COLOR_LIGHT_BACKGROUND;
    }

    public int tileColor() {
        return dark ? COLOR_DARK_TILE : COLOR_LIGHT_TILE;
    }

    public int textColor() {
        return dark ? COLOR_DARK_TEXT : COLOR_LIGHT_TEXT;
    }

    public int subTextColor() {
        return dark ? COLOR_DARK_SUB_TEXT : COLOR_LIGHT_SUB_TEXT;
    }

    public int dp(int value) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value,
                ctx.getResources().getDisplayMetrics());
    }

    /** Rounded tile background, matching the InstaFL tile look. */
    public GradientDrawable tileBackground() {
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(tileColor());
        bg.setCornerRadius(dp(16));
        return bg;
    }

    /** The scrollable content column every menu page uses. */
    public ScrollView pageContent(LinearLayout content) {
        ScrollView scroll = new ScrollView(ctx);
        scroll.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.MATCH_PARENT));
        scroll.setFillViewport(true);
        scroll.addView(content);
        return scroll;
    }

    /**
     * Pads the page root by the system bar insets so titles and tiles never
     * sit under the status bar or navigation bar.
     *
     * Android 15 (SDK 35) enforces edge-to-edge: the window content is laid
     * out behind the system bars, so without this every page title touched
     * the status bar (reported on device). Call once after building the root
     * view, before {@code setContentView}.
     */
    public static void applySystemBarInsets(View root) {
        if (Build.VERSION.SDK_INT >= 30) {
            root.setOnApplyWindowInsetsListener((v, insets) -> {
                android.graphics.Insets bars = insets.getInsets(
                        WindowInsets.Type.statusBars()
                                | WindowInsets.Type.navigationBars()
                                | WindowInsets.Type.displayCutout());
                v.setPadding(bars.left, bars.top, bars.right, bars.bottom);
                return WindowInsets.CONSUMED;
            });
        } else {
            // Older releases lay the window out below the bars as soon as the
            // root asks to fit system windows.
            root.setFitsSystemWindows(true);
        }
    }

    /** Page title above the content column. */
    public TextView pageTitle(String text) {
        TextView title = new TextView(ctx);
        title.setText(text);
        title.setTextColor(textColor());
        title.setTextSize(24);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setGravity(Gravity.CENTER_VERTICAL);
        title.setPadding(dp(20), dp(16), dp(20), dp(10));
        return title;
    }

    /**
     * A single tap row of a menu page: an optional leading glyph, a title,
     * an optional subtitle and an optional trailing glyph.
     */
    public LinearLayout tile(String leading, String title, String subtitle,
                             String trailing, View.OnClickListener onClick) {
        LinearLayout tile = new LinearLayout(ctx);
        tile.setOrientation(LinearLayout.HORIZONTAL);
        tile.setGravity(Gravity.CENTER_VERTICAL);
        tile.setPadding(dp(18), dp(14), dp(18), dp(14));
        tile.setBackground(tileBackground());
        tile.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));
        ((LinearLayout.LayoutParams) tile.getLayoutParams()).setMargins(0, dp(6), 0, dp(6));

        if (leading != null && !leading.isEmpty()) {
            TextView icon = new TextView(ctx);
            icon.setText(leading);
            icon.setTextColor(textColor());
            icon.setTextSize(18);
            icon.setGravity(Gravity.CENTER);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(26), dp(26));
            lp.rightMargin = dp(14);
            icon.setLayoutParams(lp);
            tile.addView(icon);
        }

        LinearLayout textBox = new LinearLayout(ctx);
        textBox.setOrientation(LinearLayout.VERTICAL);
        textBox.setLayoutParams(new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        TextView titleView = new TextView(ctx);
        titleView.setText(title);
        titleView.setTextColor(textColor());
        titleView.setTextSize(16);
        textBox.addView(titleView);

        if (subtitle != null && !subtitle.isEmpty()) {
            TextView subtitleView = new TextView(ctx);
            subtitleView.setText(subtitle);
            subtitleView.setTextColor(subTextColor());
            subtitleView.setTextSize(13);
            textBox.addView(subtitleView);
        }

        tile.addView(textBox);

        if (trailing != null && !trailing.isEmpty()) {
            TextView trailingView = new TextView(ctx);
            trailingView.setText(trailing);
            trailingView.setTextColor(subTextColor());
            trailingView.setTextSize(16);
            trailingView.setGravity(Gravity.CENTER);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(26), dp(26));
            lp.leftMargin = dp(10);
            trailingView.setLayoutParams(lp);
            tile.addView(trailingView);
        }

        if (onClick != null) {
            tile.setClickable(true);
            tile.setFocusable(true);
            tile.setOnClickListener(onClick);
        }

        return tile;
    }

    /** A section heading between tiles. */
    public TextView sectionTitle(String text) {
        TextView title = new TextView(ctx);
        title.setText(text);
        title.setTextColor(subTextColor());
        title.setTextSize(13);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setPadding(dp(20), dp(16), dp(20), dp(4));
        return title;
    }

    /** Multi-line text block used on the about and credits screens. */
    public TextView paragraph(String text) {
        TextView view = new TextView(ctx);
        view.setText(text);
        view.setTextColor(textColor());
        view.setTextSize(14);
        view.setLineSpacing(dp(2), 1f);
        view.setPadding(dp(20), dp(8), dp(20), dp(8));
        return view;
    }
}
