/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.interaction;

import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.HapticFeedbackConstants;
import android.view.View;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor;
import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.L10n;
import java.lang.ref.WeakReference;

public final class TapConfirmation {
    /**
     * How long a first tap stays armed. The settings rows say this number, formatted in from
     * here, so a change to it never leaves five languages describing the old window.
     */
    public static final int CONFIRM_WINDOW_SECONDS = 4;
    private static final long CONFIRM_WINDOW_MS = CONFIRM_WINDOW_SECONDS * 1000L;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static WeakReference<View> armed = new WeakReference<>(null);
    private static String armedKey;
    private static long armedAt;
    private static Drawable previousForeground;
    private static Drawable ring;
    private static int generation;
    private TapConfirmation() {}

    public static void onVideoChanged() {
        if (Looper.myLooper() == Looper.getMainLooper()) clear();
        else MAIN.post(TapConfirmation::clear);
    }

    public static boolean follow(View view) {
        Object video = CurrentVideoAuthor.getAweme();
        Object user = Reflect.property(video, "getAuthor", "author");
        Object status = Reflect.property(user, "getFollowStatus", "followStatus");
        // The same native control can turn into a message button after following.
        boolean enabled = Settings.CONFIRM_FOLLOW.get()
                && (!(status instanceof Number) || ((Number) status).intValue() == 0);
        return allow(view, "follow", Reflect.string(video, "getAid", "aid"), enabled);
    }

    public static boolean like(View view) {
        Object video = CurrentVideoAuthor.getAweme();
        boolean enabled = Settings.CONFIRM_LIKE.get() && !Boolean.TRUE.equals(Reflect.invoke(video, "isLike"));
        return allow(view, "like", Reflect.string(video, "getAid", "aid"), enabled);
    }

    static boolean allow(View view, String action, String id, boolean enabled) {
        if (!enabled || view == null) {
            clear();
            return true;
        }
        String key = action + ":" + id;
        long now = SystemClock.uptimeMillis();
        if (id != null && armed.get() == view && key.equals(armedKey)
                && now - armedAt < CONFIRM_WINDOW_MS) {
            clear();
            return true;
        }
        clear();
        armed = new WeakReference<>(view);
        armedKey = key;
        armedAt = now;
        previousForeground = view.getForeground();
        ring = armedRing(view);
        view.setForeground(ring);
        view.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
        int token = generation;
        MAIN.postDelayed(() -> { if (token == generation) clear(); }, CONFIRM_WINDOW_MS);
        // Two whole sentences rather than a verb spliced into one. The verb was an English
        // literal, so a German phone read "Noch einmal tippen zum follow".
        // Chosen before the call, because the translation gate reads every literal inside a
        // toast's brackets and "follow" here is a branch, not something anybody sees.
        String message = "follow".equals(action)
                ? L10n.t("Tap again to follow")
                : L10n.t("Tap again to like");
        Utils.showToastShort(message);
        return false;
    }

    public static Drawable armedRing(View anchor) {
        float density = anchor.getResources().getDisplayMetrics().density;
        int radius = app.morphe.extension.tiktok.settings.preference.SettingsUi.dp(
                anchor.getContext(),
                app.morphe.extension.tiktok.settings.preference.SettingsUi.RADIUS_OVERLAY);
        GradientDrawable inner = new GradientDrawable();
        inner.setColor(Color.TRANSPARENT);
        inner.setCornerRadius(radius);
        inner.setStroke(Math.max(1, Math.round(1 * density)),
                app.morphe.extension.tiktok.settings.preference.SettingsUi.OVERLAY_SCRIM);
        GradientDrawable outer = new GradientDrawable();
        outer.setColor(Color.TRANSPARENT);
        outer.setCornerRadius(radius);
        outer.setStroke(Math.max(2, Math.round(2 * density)),
                app.morphe.extension.tiktok.settings.preference.SettingsUi.OVERLAY_TEXT);
        LayerDrawable result = new LayerDrawable(new Drawable[]{outer, inner});
        int inset = Math.max(2, Math.round(2 * density));
        result.setLayerInset(1, inset, inset, inset, inset);
        return result;
    }

    private static void clear() {
        View view = armed.get();
        if (view != null && view.getForeground() == ring) view.setForeground(previousForeground);
        armed.clear();
        armedKey = null;
        previousForeground = null;
        ring = null;
        generation++;
    }
}
