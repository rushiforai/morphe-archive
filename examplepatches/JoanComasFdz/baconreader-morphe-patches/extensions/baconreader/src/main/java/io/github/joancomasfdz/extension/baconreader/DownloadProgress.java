// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * A progress bar with the downloaded size ("1.2 / 3.4 MB"), like the one of post media.
 * Without a known size, the bar stays animated and no size is shown.
 * When loading fails, the bar stops and turns red.
 */
public final class DownloadProgress {
    /** The color of a bar whose media could not be loaded. */
    public static final int FAILED_COLOR = 0xFFE53935;
    /** The progress drawable of bars shown as failed, to restore it on the next load. */
    private static final Map<ProgressBar, Drawable> ORIGINAL_DRAWABLES = new WeakHashMap<>();

    public final LinearLayout root;
    private final TextView label;
    private final ProgressBar bar;
    private final int accent;

    public DownloadProgress(Context context) {
        root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setVisibility(View.GONE);

        label = new TextView(context);
        label.setTextColor(Color.WHITE);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        int padH = dp(context, 8);
        int padV = dp(context, 3);
        label.setPadding(padH, padV, padH, padV);
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(0x99000000);
        pill.setCornerRadius(dp(context, 10));
        label.setBackground(pill);
        label.setVisibility(View.GONE);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        labelParams.setMargins(dp(context, 6), 0, 0, dp(context, 4));
        root.addView(label, labelParams);

        bar = new ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
        bar.setMax(1000);
        accent = accentColor(context);
        bar.setProgressTintList(ColorStateList.valueOf(accent));
        bar.setIndeterminateTintList(ColorStateList.valueOf(accent));
        bar.setProgressBackgroundTintList(ColorStateList.valueOf(0x33FFFFFF));
        root.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 4)));
    }

    public void start() {
        showLoading(bar, accent);
        label.setVisibility(View.GONE);
        root.setVisibility(View.VISIBLE);
    }

    public void update(long received, long total) {
        if (total <= 0) return; // Unknown size: keep the animated bar.
        bar.setIndeterminate(false);
        bar.setProgress((int) (1000L * received / total));
        label.setText(progressLabel(received, total));
        label.setVisibility(View.VISIBLE);
    }

    public void stop() {
        root.setVisibility(View.GONE);
    }

    /** A full red bar, without animation: the media could not be loaded. */
    public void fail() {
        showFailed(bar);
        label.setVisibility(View.GONE);
        root.setVisibility(View.VISIBLE);
    }

    /**
     * Stops the animation of a horizontal bar and shows it as a static red line, as thin as the moving one
     * (the indeterminate drawable draws a line half the height of the bar, centered).
     */
    public static void showFailed(ProgressBar bar) {
        if (!ORIGINAL_DRAWABLES.containsKey(bar)) ORIGINAL_DRAWABLES.put(bar, bar.getProgressDrawable());
        int height = bar.getLayoutParams() != null && bar.getLayoutParams().height > 0
                ? bar.getLayoutParams().height : dp(bar.getContext(), 4);
        int inset = height / 4;
        bar.setIndeterminate(false);
        bar.setProgressTintList(null);
        bar.setProgressDrawable(new InsetDrawable(new ColorDrawable(FAILED_COLOR), 0, inset, 0, inset));
        bar.setProgress(bar.getMax());
    }

    /** Shows a bar as loading again (animated, in the accent color), after showFailed(). */
    public static void showLoading(ProgressBar bar, int accent) {
        Drawable original = ORIGINAL_DRAWABLES.remove(bar);
        if (original != null) bar.setProgressDrawable(original);
        bar.setProgressTintList(ColorStateList.valueOf(accent));
        bar.setIndeterminate(true);
    }

    /** "1.2 / 3.4 MB". */
    static String progressLabel(long received, long total) {
        double mb = 1024 * 1024;
        return String.format(Locale.US, "%.1f / %.1f MB", received / mb, total / mb);
    }

    private static int accentColor(Context context) {
        TypedArray array = context.getTheme().obtainStyledAttributes(new int[]{android.R.attr.colorAccent});
        try {
            return array.getColor(0, 0xFF4F7EC4);
        } finally {
            array.recycle();
        }
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }
}
