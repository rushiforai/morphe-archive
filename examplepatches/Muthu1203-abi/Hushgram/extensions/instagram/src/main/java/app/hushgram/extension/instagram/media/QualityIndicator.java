/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.media;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Utils;

/** Shows a short resolution badge when Instagram's active player reports a changed video format. */
public final class QualityIndicator {
    private static final long SHOW_MS = 2600L;
    private static final Pattern DIMENSIONS = Pattern.compile("\\[\\s*(\\d{2,5})\\s*,\\s*(\\d{2,5})\\s*,");
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static WeakReference<Activity> owner = new WeakReference<>(null);
    private static WeakReference<TextView> badge = new WeakReference<>(null);
    private static final Runnable HIDE = QualityIndicator::hide;

    private QualityIndicator() { }

    /** Called from Instagram's downstream video-format callback. Never lets an error reach the player. */
    public static void onFormat(@Nullable Object format) {
        try {
            if (format == null || !Utils.settingsReady() || !Settings.MEDIA_QUALITY_INDICATOR.get()) return;
            String quality = quality(format.toString());
            if (quality == null) return;
            MAIN.post(() -> {
                try {
                    show(quality);
                } catch (Throwable ignored) {
                    // Keep UI attachment failures isolated from Instagram's playback thread.
                }
            });
        } catch (Throwable ignored) {
            // Display-only diagnostics must never interrupt playback.
        }
    }

    @Nullable static String quality(@Nullable String format) {
        if (format == null) return null;
        Matcher match = DIMENSIONS.matcher(format);
        if (!match.find()) return null;
        try {
            int width = Integer.parseInt(match.group(1));
            int height = Integer.parseInt(match.group(2));
            if (width < 144 || height < 144 || width > 8192 || height > 8192) return null;
            // Both portrait and landscape use the longer side for the familiar 720p/1080p label.
            return Math.max(width, height) + "p";
        } catch (RuntimeException malformed) {
            return null;
        }
    }

    private static void show(String quality) {
        Activity activity = Utils.getActivity();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        View content = activity.findViewById(android.R.id.content);
        // android.R.id.content is a FrameLayout on Instagram activities; use matching layout
        // params so a future host layout change cannot cause a ClassCastException.
        if (!(content instanceof FrameLayout)) return;
        FrameLayout root = (FrameLayout) content;
        TextView text = badge.get();
        Activity previousOwner = owner.get();
        if (text == null || previousOwner != activity || text.getParent() != root) {
            if (text != null && text.getParent() instanceof ViewGroup) ((ViewGroup) text.getParent()).removeView(text);
            text = makeBadge(activity);
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.TOP | Gravity.END);
            float density = activity.getResources().getDisplayMetrics().density;
            params.setMargins(0, Math.round(92f * density), Math.round(12f * density), 0);
            root.addView(text, params);
            owner = new WeakReference<>(activity);
            badge = new WeakReference<>(text);
        }
        text.setText(quality);
        text.setVisibility(View.VISIBLE);
        MAIN.removeCallbacks(HIDE);
        MAIN.postDelayed(HIDE, SHOW_MS);
    }

    private static TextView makeBadge(Activity activity) {
        TextView text = new TextView(activity);
        float density = activity.getResources().getDisplayMetrics().density;
        text.setTextColor(Color.WHITE);
        text.setTextSize(12f);
        text.setTypeface(android.graphics.Typeface.DEFAULT, android.graphics.Typeface.BOLD);
        text.setPadding(Math.round(10f * density), Math.round(6f * density),
                Math.round(10f * density), Math.round(6f * density));
        GradientDrawable background = new GradientDrawable();
        background.setColor(0xCC17171B);
        background.setCornerRadius(24f * density);
        background.setStroke(Math.max(1, Math.round(density)), 0x66FFFFFF);
        text.setBackground(background);
        text.setElevation(8f * density);
        return text;
    }

    private static void hide() {
        TextView text = badge.get();
        if (text != null) text.setVisibility(View.GONE);
    }
}
