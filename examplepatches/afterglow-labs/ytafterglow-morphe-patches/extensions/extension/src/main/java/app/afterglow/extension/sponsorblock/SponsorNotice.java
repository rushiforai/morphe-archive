package app.afterglow.extension.sponsorblock;

import android.app.Activity;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeRole;
import app.afterglow.extension.settings.ThemeStore;
import app.afterglow.extension.video.VideoState;

/** The iOS four-second skip notice, attached to the native player with a guarded undo action. */
final class SponsorNotice extends LinearLayout {
    private static WeakReference<SponsorNotice> current = new WeakReference<>(null);
    private final Runnable timeout = () -> hide(true);
    private Runnable undo;
    private boolean hiding;

    private SponsorNotice(Activity activity, String message, Runnable undo, int maxWidth) {
        super(activity);
        this.undo = undo;
        setOrientation(HORIZONTAL); setGravity(Gravity.CENTER_VERTICAL);
        setPadding(dp(16), dp(10), dp(12), dp(10));
        ThemePalette palette = ThemeStore.snapshot().palette;
        GradientDrawable background = new GradientDrawable();
        background.setColor(color(palette, ThemeRole.ELEVATED_SURFACE, 0xF51A1429));
        background.setCornerRadius(dp(14));
        background.setStroke(dp(1), color(palette, ThemeRole.BORDER, 0xB3FF7314));
        setBackground(background); setElevation(dp(13));
        int glow = color(palette, ThemeRole.GLOW, 0xFFAB5CFF);
        setOutlineAmbientShadowColor(glow); setOutlineSpotShadowColor(glow);

        TextView label = new TextView(activity);
        label.setText(message); label.setTextSize(14); label.setMaxLines(2);
        label.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        label.setTextColor(color(palette, ThemeRole.PRIMARY_TEXT, 0xFFFFFFFF));
        label.setMaxWidth(Math.max(dp(60), Math.min(dp(260), maxWidth - dp(120))));
        label.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        addView(label, new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));

        TextView button = new TextView(activity);
        button.setText("Undo"); button.setTextSize(14); button.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        button.setTextColor(color(palette, ThemeRole.ACCENT, 0xFFFF8C29));
        button.setGravity(Gravity.CENTER); button.setMinHeight(dp(32)); button.setMinWidth(dp(40));
        button.setContentDescription("Undo. Return to the beginning of the skipped segment");
        button.setFocusable(true);
        button.setOnClickListener(view -> {
            Runnable action = this.undo; this.undo = null;
            try { if (action != null) action.run(); }
            catch (Throwable error) { Afterglow.error("SponsorBlock.undo", error); }
            finally { hide(true); }
        });
        LayoutParams actionParams = new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        actionParams.leftMargin = dp(18); addView(button, actionParams);
    }

    static void show(String message, Runnable undo) {
        try {
            dismiss();
            Activity activity = Afterglow.mainActivity();
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
            FrameLayout host = null;
            if (!VideoState.isShortsPlayerInFront()) {
                for (String name : new String[]{"player_overlays_custom_views_container", "watch_player"}) {
                    int id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
                    View found = id == 0 ? null : activity.findViewById(id);
                    if (found instanceof FrameLayout && found.isShown()) { host = (FrameLayout) found; break; }
                }
            }
            View content = activity.findViewById(android.R.id.content);
            boolean fallback = host == null;
            if (fallback && content instanceof FrameLayout) host = (FrameLayout) content;
            if (host == null || !host.isAttachedToWindow()) return;
            SponsorNotice notice = new SponsorNotice(activity, message, undo, host.getWidth());
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                    LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
            params.leftMargin = params.rightMargin = notice.dp(16);
            params.bottomMargin = notice.dp(fallback && VideoState.isShortsPlayerInFront() ? 96 : 24);
            if (fallback) {
                WindowInsets insets = host.getRootWindowInsets();
                if (insets != null) params.bottomMargin += insets.getSystemWindowInsetBottom();
            }
            current = new WeakReference<>(notice); host.addView(notice, params);
            notice.setAlpha(0); notice.setTranslationY(notice.dp(18));
            notice.animate().alpha(1).translationY(0).setDuration(220).start();
            notice.postDelayed(notice.timeout, 4000);
        } catch (Throwable error) { Afterglow.error("SponsorBlock.notice", error); }
    }

    static void dismiss() {
        SponsorNotice notice = current.get();
        if (notice != null) notice.hide(false);
    }

    private void hide(boolean animated) {
        if (hiding && animated) return;
        hiding = true; undo = null; removeCallbacks(timeout); animate().cancel();
        if (current.get() == this) current.clear();
        if (animated) animate().alpha(0).translationY(dp(12)).setDuration(180).withEndAction(this::remove).start();
        else remove();
    }

    private void remove() {
        if (getParent() instanceof ViewGroup) ((ViewGroup) getParent()).removeView(this);
    }

    @Override protected void onDetachedFromWindow() {
        removeCallbacks(timeout); animate().cancel(); undo = null;
        if (current.get() == this) current.clear();
        super.onDetachedFromWindow();
    }

    private int dp(float value) { return Math.round(value * getResources().getDisplayMetrics().density); }
    private static int color(ThemePalette palette, ThemeRole role, int fallback) {
        Integer value = palette.color(role); return value == null ? fallback : value;
    }
}
