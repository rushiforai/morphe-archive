package app.morphe.extension.twitch.player;

import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Locale;

/** Shows Amazon IVS live latency and lets the viewer seek back to the live edge. */
@SuppressWarnings("unused")
public final class PlayerLatencyPatch {
    private static final String BADGE_TAG = "morphe_stream_latency_badge";
    private static final long UPDATE_INTERVAL_MS = 1_000L;
    private static final long MAX_REASONABLE_LATENCY_MS = 60L * 60L * 1_000L;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static volatile WeakReference<Object> playerWrapper = new WeakReference<>(null);
    private static volatile WeakReference<Object> mediaPlayer = new WeakReference<>(null);
    private static volatile WeakReference<TextView> badge = new WeakReference<>(null);
    private static volatile boolean badgeInStatsRow;
    private static volatile boolean updateScheduled;

    private PlayerLatencyPatch() {}

    /** Called after Twitch creates its gq9 wrapper and Amazon IVS MediaPlayer. */
    public static void registerPlayer(Object wrapper, Object player) {
        playerWrapper = new WeakReference<>(wrapper);
        mediaPlayer = new WeakReference<>(player);
        try {
            // Future network stalls should discard stale buffered content and resume at the live edge.
            invokePlayer(player, "setRebufferToLive", new Class<?>[]{boolean.class}, true);
        } catch (Throwable ignored) {}
        scheduleUpdate();
    }

    /** Called with the root view of Twitch's main player view delegate. */
    public static void attachBadge(Object rootObject) {
        if (!(rootObject instanceof View)) return;
        View root = (View) rootObject;
        root.post(() -> attachBadgeOnMain(root));
    }

    private static void attachBadgeOnMain(View root) {
        try {
            int controlsId = root.getResources().getIdentifier("bottom_overlay_controls", "id", root.getContext().getPackageName());
            int wrapperId = root.getResources().getIdentifier("player_wrapper", "id", root.getContext().getPackageName());
            int overlayId = root.getResources().getIdentifier("player_overlay_container", "id", root.getContext().getPackageName());
            View parentView = controlsId == 0 ? null : root.findViewById(controlsId);
            boolean inStatsRow = parentView instanceof ViewGroup;
            if (!(parentView instanceof ViewGroup) && wrapperId != 0) parentView = root.findViewById(wrapperId);
            if (!(parentView instanceof ViewGroup) && overlayId != 0) parentView = root.findViewById(overlayId);
            if (!(parentView instanceof ViewGroup)) return;
            ViewGroup parent = (ViewGroup) parentView;

            View existing = parent.findViewWithTag(BADGE_TAG);
            TextView view;
            if (existing instanceof TextView) {
                view = (TextView) existing;
            } else {
                view = new TextView(parent.getContext());
                view.setTag(BADGE_TAG);
                view.setTextColor(Color.WHITE);
                view.setTextSize(12f);
                view.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
                view.setGravity(Gravity.CENTER);
                view.setMinHeight(dp(view, 32));
                view.setPadding(dp(view, 10), dp(view, 5), dp(view, 10), dp(view, 5));
                view.setElevation(dp(view, 8));
                view.setText("↻ …");
                view.setVisibility(inStatsRow ? View.VISIBLE : View.GONE);
                view.setContentDescription("Live latency. Tap to return to live.");
                view.setOnClickListener(PlayerLatencyPatch::goLive);
                if (inStatsRow) {
                    view.setId(View.generateViewId());
                    parent.addView(view);
                    placeAfterStreamStats(root, view);
                } else {
                    parent.addView(view, createLayoutParams(parent, view));
                }
            }
            badgeInStatsRow = inStatsRow;
            badge = new WeakReference<>(view);
            scheduleUpdate();
        } catch (Throwable ignored) {}
    }

    /** Places the badge directly after Twitch's uptime and viewer-count controls. */
    private static void placeAfterStreamStats(View root, TextView view) {
        int statsId = root.getResources().getIdentifier("stream_stats_text", "id", root.getContext().getPackageName());
        int tooltipId = root.getResources().getIdentifier("tooltip_container", "id", root.getContext().getPackageName());
        int progressId = root.getResources().getIdentifier("progress_text", "id", root.getContext().getPackageName());

        ViewGroup.LayoutParams params = view.getLayoutParams();
        setConstraint(params, "startToEnd", statsId);
        setConstraint(params, "bottomToBottom", 0);
        setConstraint(params, "topToBottom", tooltipId);
        setMarginStart(params, dp(view, 4));
        view.setLayoutParams(params);

        View progress = progressId == 0 ? null : root.findViewById(progressId);
        if (progress != null) {
            ViewGroup.LayoutParams progressParams = progress.getLayoutParams();
            setConstraint(progressParams, "startToEnd", view.getId());
            progress.setLayoutParams(progressParams);
        }
    }

    private static void setConstraint(ViewGroup.LayoutParams params, String name, int value) {
        if (params == null || value == 0 && !"bottomToBottom".equals(name)) return;
        try {
            Field field = params.getClass().getField(name);
            field.setInt(params, value);
        } catch (Throwable ignored) {}
    }

    private static void setMarginStart(ViewGroup.LayoutParams params, int margin) {
        if (params instanceof ViewGroup.MarginLayoutParams) {
            ((ViewGroup.MarginLayoutParams) params).setMarginStart(margin);
        }
    }

    private static ViewGroup.LayoutParams createLayoutParams(ViewGroup parent, View view) {
        int margin = dp(view, 10);
        int controlsClearance = dp(view, 52);
        if (parent instanceof RelativeLayout) {
            RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-2, -2);
            params.addRule(RelativeLayout.ALIGN_PARENT_END);
            params.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM);
            params.setMargins(margin, margin, margin, controlsClearance);
            return params;
        }
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-2, -2, Gravity.END | Gravity.BOTTOM);
        params.setMargins(margin, margin, margin, controlsClearance);
        return params;
    }

    private static void scheduleUpdate() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(PlayerLatencyPatch::scheduleUpdate);
            return;
        }
        if (updateScheduled) return;
        updateScheduled = true;
        MAIN.post(PlayerLatencyPatch::update);
    }

    private static void update() {
        TextView view = badge.get();
        Object player = mediaPlayer.get();
        if (view == null && player == null) {
            updateScheduled = false;
            return;
        }
        if (view != null) {
            long latency = readLatency(player);
            boolean usable = view.isAttachedToWindow() && latency > 0 && latency < MAX_REASONABLE_LATENCY_MS;
            if (!usable) {
                view.setVisibility(badgeInStatsRow && view.isAttachedToWindow() ? View.VISIBLE : View.GONE);
                if (badgeInStatsRow) {
                    view.setText("↻ …");
                    view.setBackground(createBackground(-1L));
                }
            } else {
                view.setVisibility(View.VISIBLE);
                view.setText("↻ " + formatLatency(latency));
                view.setContentDescription("Live latency " + formatLatency(latency) + ". Tap to return to live.");
                view.setBackground(createBackground(latency));
            }
        }
        MAIN.postDelayed(PlayerLatencyPatch::update, UPDATE_INTERVAL_MS);
    }

    private static long readLatency(Object player) {
        Object wrapper = playerWrapper.get();
        try {
            // gq9 is public and exposes the IVS live latency through its k() implementation.
            if (wrapper != null) return ((Number) wrapper.getClass().getMethod("k").invoke(wrapper)).longValue();
        } catch (Throwable ignored) {}
        try {
            Object value = invokePlayer(player, "getLiveLatency", new Class<?>[0]);
            return value instanceof Number ? ((Number) value).longValue() : -1L;
        } catch (Throwable ignored) {}
        return -1L;
    }

    private static String formatLatency(long milliseconds) {
        double seconds = milliseconds / 1_000.0;
        return seconds < 10.0
            ? String.format(Locale.getDefault(), "%.1f s", seconds)
            : String.format(Locale.getDefault(), "%.0f s", seconds);
    }

    private static GradientDrawable createBackground(long latency) {
        int color = latency < 0L
            ? Color.rgb(80, 80, 90)
            : latency < 5_000L
            ? Color.rgb(20, 150, 80)
            : latency < 10_000L ? Color.rgb(210, 135, 20) : Color.rgb(190, 45, 55);
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(1_000f);
        return drawable;
    }

    private static void goLive(View clicked) {
        clicked.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
        if (clicked instanceof TextView) ((TextView) clicked).setText("↻ Sync…");
        Object wrapper = playerWrapper.get();
        Object player = mediaPlayer.get();
        try {
            if (player != null) {
                invokePlayer(player, "setRebufferToLive", new Class<?>[]{boolean.class}, true);
            }

            boolean sought = false;
            if (wrapper != null) {
                Method durationMethod = wrapper.getClass().getMethod("getDuration");
                int duration = ((Number) durationMethod.invoke(wrapper)).intValue();
                if (duration > 0) {
                    // Twitch's gq9 implementation clamps this to duration - 1 and records a normal seek.
                    wrapper.getClass().getMethod("seekTo", int.class).invoke(wrapper, duration);
                    wrapper.getClass().getMethod("start").invoke(wrapper);
                    sought = true;
                }
            }

            if (!sought && player != null) {
                // Conservative fallback for a future wrapper change; no manifest/token reload is needed.
                long duration = ((Number) invokePlayer(player, "getDuration", new Class<?>[0])).longValue();
                if (duration > 0) invokePlayer(player, "seekTo", new Class<?>[]{long.class}, duration - 1L);
                invokePlayer(player, "play", new Class<?>[0]);
            }
        } catch (Throwable ignored) {}
    }

    /** Invokes IVS through its public Player interface; CorePlayerImpl itself is package-private. */
    private static Object invokePlayer(Object player, String methodName, Class<?>[] parameterTypes, Object... args) throws Exception {
        if (player == null) return null;
        ClassLoader loader = player.getClass().getClassLoader();
        Class<?> playerInterface = Class.forName("com.amazonaws.ivs.player.Player", false, loader);
        return playerInterface.getMethod(methodName, parameterTypes).invoke(player, args);
    }

    private static int dp(View view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }
}
