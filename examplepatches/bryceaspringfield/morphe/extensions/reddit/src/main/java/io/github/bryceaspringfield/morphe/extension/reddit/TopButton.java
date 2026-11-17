package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.*;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Application;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;

/**
 * A floating return-to-top button over every screen whose list is scrolled down (a profile's Posts, Comments, and
 * other tabs, a community, Home). A tap scrolls that list to its first row. Settings: "Return-to-top button".
 */
final class TopButton {
    static final String OFF = "top_button_off";
    private static final long TICK_MS = 600;
    private static boolean started;
    private static final Handler HANDLER = new Handler(Looper.getMainLooper());

    private TopButton() {
    }

    static boolean enabled() {
        return !getBoolean(OFF);
    }

    /** Registers the activity callbacks once; called from the feed filter, which runs as soon as a feed loads. */
    @SuppressLint("PrivateApi")
    static synchronized void start() {
        if (started) return;
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (app == null) return;
            started = true;
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityResumed(Activity a) { attach(a); }
                @Override public void onActivityPaused(Activity a) { }
                @Override public void onActivityCreated(Activity a, Bundle b) { }
                @Override public void onActivityStarted(Activity a) { }
                @Override public void onActivityStopped(Activity a) { }
                @Override public void onActivitySaveInstanceState(Activity a, Bundle b) { }
                @Override public void onActivityDestroyed(Activity a) { }
            });
            // The activity already resumed (the first feed loads after it) gets its button at once.
            Class<?> thread = Class.forName("android.app.ActivityThread");
            Object current = thread.getMethod("currentActivityThread").invoke(null);
            java.lang.reflect.Field field = thread.getDeclaredField("mActivities");
            field.setAccessible(true);
            for (Object record : ((java.util.Map<?, ?>) field.get(current)).values()) {
                java.lang.reflect.Field activityField = record.getClass().getDeclaredField("activity");
                activityField.setAccessible(true);
                Activity activity = (Activity) activityField.get(record);
                if (activity != null) HANDLER.post(() -> attach(activity));
            }
        } catch (Exception ignored) {
        }
    }

    private static void attach(Activity activity) {
        ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
        if (decor.findViewWithTag("yx_top_button") != null) return;
        float d = activity.getResources().getDisplayMetrics().density;
        TextView button = new TextView(activity);
        button.setTag("yx_top_button");
        button.setText("↑");
        button.setTextColor(Color.WHITE);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        button.setGravity(Gravity.CENTER);
        button.setContentDescription(Strings.t("Return to top"));
        GradientDrawable disc = new GradientDrawable();
        disc.setShape(GradientDrawable.OVAL);
        disc.setColor(0xCC333333);
        button.setBackground(disc);
        button.setVisibility(View.GONE);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams((int) (48 * d), (int) (48 * d),
                Gravity.BOTTOM | Gravity.END);
        lp.setMargins(0, 0, (int) (16 * d), (int) (88 * d));
        decor.addView(button, lp);
        WeakReference<View> target = new WeakReference<>(null);
        final WeakReference<View>[] ref = new WeakReference[]{target};
        button.setOnClickListener(v -> {
            View list = ref[0].get();
            if (list != null) toTop(list);
        });
        HANDLER.postDelayed(new Runnable() {
            @Override public void run() {
                if (!decor.isAttachedToWindow()) return;
                View list = enabled() ? scrolledList(decor) : null;
                ref[0] = new WeakReference<>(list);
                button.setVisibility(list == null ? View.GONE : View.VISIBLE);
                HANDLER.postDelayed(this, TICK_MS);
            }
        }, TICK_MS);
    }

    /** The largest on-screen vertical list which can scroll up, or null. */
    private static View scrolledList(View root) {
        View best = null;
        long bestArea = 0;
        java.util.ArrayDeque<View> queue = new java.util.ArrayDeque<>();
        queue.add(root);
        while (!queue.isEmpty()) {
            View v = queue.poll();
            if (v.getVisibility() != View.VISIBLE) continue;
            if (v instanceof ViewGroup) {
                if ((v.getClass().getName().contains("RecyclerView") || v.getClass().getName().contains("ComposeView"))
                        && v.isShown() && v.canScrollVertically(-1)) {
                    int[] xy = new int[2];
                    v.getLocationOnScreen(xy);
                    long area = (long) v.getWidth() * v.getHeight();
                    if (xy[0] < v.getResources().getDisplayMetrics().widthPixels && xy[0] + v.getWidth() > 0
                            && area > bestArea) {
                        best = v;
                        bestArea = area;
                    }
                }
                ViewGroup g = (ViewGroup) v;
                for (int i = 0; i < g.getChildCount(); i++) queue.add(g.getChildAt(i));
            }
        }
        return best;
    }

    private static void toTop(View list) {
        try {
            Method m = list.getClass().getMethod("scrollToPosition", int.class);
            m.invoke(list, 0);
            return;
        } catch (Exception ignored) {
        }
        // A Compose list (Home, profile tabs) has no scroll call: drag it down with synthetic swipes until it stops.
        swipeUp(list, 0);
    }

    private static void swipeUp(View list, int round) {
        if (round > 80 || !list.isAttachedToWindow() || !list.canScrollVertically(-1)) return;
        int[] xy = new int[2];
        list.getLocationOnScreen(xy);
        float x = list.getWidth() / 2f;
        float from = list.getHeight() * 0.2f, to = list.getHeight() * 0.9f;
        long t = android.os.SystemClock.uptimeMillis();
        int steps = 6;
        for (int i = 0; i <= steps; i++) {
            int action = i == 0 ? android.view.MotionEvent.ACTION_DOWN
                    : i == steps ? android.view.MotionEvent.ACTION_UP : android.view.MotionEvent.ACTION_MOVE;
            android.view.MotionEvent e = android.view.MotionEvent.obtain(t, t + i * 8L, action, x, from + (to - from) * i / steps, 0);
            list.dispatchTouchEvent(e);
            e.recycle();
        }
        HANDLER.postDelayed(() -> swipeUp(list, round + 1), 90);
    }
}
