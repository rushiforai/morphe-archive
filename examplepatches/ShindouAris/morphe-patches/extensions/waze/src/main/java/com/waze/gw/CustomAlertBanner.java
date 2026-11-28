package com.waze.gw;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;

/**
 * Map overlay for WazeMod alerts that have no route position (Waze's own alert panel does not present them).
 * Styled like Waze's alert card: dark card above the bottom sheet, so it neither flashes on a night map nor
 * sits against the top edge.
 */
final class CustomAlertBanner {
    static final String TAG = "wazemod_custom_alert_banner";
    private static final String LOG_TAG = "WazeGW-CustomAlert";
    private static final android.os.Handler MAIN =
            new android.os.Handler(android.os.Looper.getMainLooper());

    private static WeakReference<FrameLayout> rootRef = new WeakReference<FrameLayout>(null);
    private static int generation;

    private CustomAlertBanner() { }

    static void attach(FrameLayout root) {
        if (root != null) rootRef = new WeakReference<FrameLayout>(root);
    }

    static boolean show(final String title, final String description, final int timeoutSeconds) {
        return show(title, description, timeoutSeconds, null);
    }

    /** {@code iconDrawable}: name of a drawable resource for the icon, or null for the light-bulb emoji. */
    static boolean show(final String title, final String description, final int timeoutSeconds,
                        final String iconDrawable) {
        final FrameLayout root = rootRef.get();
        if (root == null || !root.isAttachedToWindow()) {
            Log.w(LOG_TAG, "No map root for custom alert banner");
            return false;
        }
        final int token = ++generation;
        MAIN.post(new Runnable() {
            @Override public void run() {
                showOnMain(root, title, description, timeoutSeconds, iconDrawable, token);
            }
        });
        return true;
    }

    static void dismiss() {
        final FrameLayout root = rootRef.get();
        ++generation;
        if (root == null) return;
        MAIN.post(new Runnable() {
            @Override public void run() {
                View old = root.findViewWithTag(TAG);
                if (old != null) hide(root, old);
            }
        });
    }

    private static void showOnMain(final FrameLayout root, String title, String description,
                                   int timeoutSeconds, String iconDrawable, final int token) {
        if (!root.isAttachedToWindow() || token != generation) return;
        View old = root.findViewWithTag(TAG);
        if (old != null) root.removeView(old);

        final LinearLayout card = new LinearLayout(root.getContext());
        card.setTag(TAG);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setPadding(dp(card, 16), dp(card, 12), dp(card, 18), dp(card, 12));
        card.setElevation(dp(card, 8));
        card.setClickable(true);
        card.setContentDescription(title);

        GradientDrawable background = new GradientDrawable();
        background.setShape(GradientDrawable.RECTANGLE);
        background.setColor(0xFF000000);
        background.setCornerRadius(dp(card, 28));
        card.setBackground(background);

        card.addView(icon(card, iconDrawable), new LinearLayout.LayoutParams(dp(card, 52), dp(card, 52)));

        LinearLayout copy = new LinearLayout(card.getContext());
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams copyParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        copyParams.leftMargin = dp(card, 12);
        card.addView(copy, copyParams);

        TextView headline = new TextView(card.getContext());
        headline.setText(title == null ? "" : title);
        headline.setTextColor(0xFFFFFFFF);
        headline.setTextSize(18f);
        headline.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        headline.setMaxLines(2);
        headline.setEllipsize(android.text.TextUtils.TruncateAt.END);
        copy.addView(headline, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        if (description != null && !description.trim().isEmpty()) {
            TextView detail = new TextView(card.getContext());
            detail.setText(description.trim());
            detail.setTextColor(0xFFB4B8C2);
            detail.setTextSize(14f);
            detail.setMaxLines(3);      // never clip the tail of a longer text in a narrow window
            detail.setEllipsize(android.text.TextUtils.TruncateAt.END);
            LinearLayout.LayoutParams detailParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            detailParams.topMargin = dp(card, 2);
            copy.addView(detail, detailParams);
        }

        boolean landscape = root.getWidth() > root.getHeight();
        int horizontal = dp(card, 16);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                landscape ? Math.min(root.getWidth() - 2 * horizontal, dp(card, 460))
                        : ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
        params.leftMargin = horizontal;
        params.rightMargin = horizontal;
        params.bottomMargin = dp(card, landscape ? 20 : 190);   // clears the bottom sheet / ETA bar
        root.addView(card, params);

        card.setAlpha(0f);
        card.setTranslationY(dp(card, 20));
        card.animate().alpha(1f).translationY(0f).setDuration(260).start();
        card.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                if (token == generation) ++generation;
                hide(root, view);
            }
        });
        Log.i(LOG_TAG, "Banner shown token=" + token);

        long duration = Math.max(3, Math.min(60, timeoutSeconds)) * 1000L;
        MAIN.postDelayed(new Runnable() {
            @Override public void run() {
                if (token != generation) return;
                ++generation;
                View current = root.findViewWithTag(TAG);
                if (current != null) hide(root, current);
            }
        }, duration);
    }

    private static View icon(View card, String drawableName) {
        Context context = card.getContext();
        if (drawableName != null) {
            try {
                // The arsc package stays com.waze in the Dual build, so resolve with that when the app id differs.
                int id = context.getResources().getIdentifier(drawableName, "drawable",
                        Gateway.resPackage(context.getPackageName()));
                if (id != 0) {
                    ImageView image = new ImageView(context);
                    image.setImageResource(id);
                    image.setScaleType(ImageView.ScaleType.FIT_CENTER);
                    return image;
                }
            } catch (Throwable ignored) { }
        }
        TextView emoji = new TextView(context);
        emoji.setText("💡");
        emoji.setTextSize(30f);
        emoji.setGravity(Gravity.CENTER);
        return emoji;
    }

    private static void hide(final FrameLayout root, final View view) {
        if (view.getParent() != root) return;
        view.animate().alpha(0f).translationY(dp(view, 14)).setDuration(180)
                .withEndAction(new Runnable() {
                    @Override public void run() {
                        if (view.getParent() == root) root.removeView(view);
                    }
                }).start();
    }

    private static int dp(View view, int value) {
        Context context = view.getContext();
        return (int) (value * context.getResources().getDisplayMetrics().density + 0.5f);
    }
}
