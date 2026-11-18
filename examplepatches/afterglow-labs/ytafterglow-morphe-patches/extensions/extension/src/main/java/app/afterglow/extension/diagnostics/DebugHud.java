package app.afterglow.extension.diagnostics;

import android.app.Activity;
import android.app.Application;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.List;
import app.afterglow.extension.settings.AfterglowPrefs;

/** An app-local, draggable HUD; touches outside its bounds pass to native YouTube. */
final class DebugHud implements Application.ActivityLifecycleCallbacks {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final DebugHud INSTANCE = new DebugHud();
    private static final Runnable REFRESH = INSTANCE::refresh;
    private static final Runnable HIDE = () -> AfterglowPrefs.setBool("debugHUDEnabled", false);
    private WeakReference<Activity> foreground = new WeakReference<>(null);
    private TextView panel;
    private float savedX = -1, savedY = -1;
    private long readyAt;

    static void install(Application app) {
        if (AfterglowPrefs.getBool("debugHUDEnabled")) INSTANCE.readyAt = SystemClock.uptimeMillis() + 2000;
        app.registerActivityLifecycleCallbacks(INSTANCE);
    }
    static void preferencesChanged() { MAIN.removeCallbacks(REFRESH); MAIN.post(REFRESH); }
    static void logChanged() { if (!MAIN.hasCallbacks(REFRESH)) MAIN.postDelayed(REFRESH, 50); }

    private void refresh() {
        Activity activity = foreground.get();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()
                || !AfterglowPrefs.getBool("debugHUDEnabled")) { detach(); return; }
        long delay = readyAt - SystemClock.uptimeMillis();
        if (delay > 0) { MAIN.postDelayed(REFRESH, delay); return; }
        View decor = activity.getWindow().getDecorView();
        if (!(decor instanceof FrameLayout)) return;
        FrameLayout host = (FrameLayout) decor;
        if (panel == null) {
            float density = activity.getResources().getDisplayMetrics().density;
            int width = Math.max(1, Math.min(dp(density, 320), host.getWidth() - dp(density, 24)));
            int height = Math.max(1, Math.min(dp(density, 180), host.getHeight() - dp(density, 8)));
            if (host.getWidth() == 0 || host.getHeight() == 0) { MAIN.postDelayed(REFRESH, 100); return; }
            panel = new TextView(activity);
            panel.setTag("afterglow-debug-hud");
            panel.setContentDescription("Afterglow debug HUD");
            panel.setTextColor(0xF2FFFFFF);
            panel.setTextSize(9);
            panel.setTypeface(Typeface.MONOSPACE);
            panel.setPadding(dp(density, 8), dp(density, 8), dp(density, 8), dp(density, 8));
            panel.setGravity(Gravity.BOTTOM);
            GradientDrawable background = new GradientDrawable();
            background.setColor(0xB8000000); background.setCornerRadius(dp(density, 10));
            background.setStroke(Math.max(1, dp(density, .5f)), 0x26FFFFFF);
            panel.setBackground(background); panel.setElevation(dp(density, 24));
            host.addView(panel, new FrameLayout.LayoutParams(width, height, Gravity.TOP | Gravity.LEFT));
            panel.setX(savedX < 0 ? dp(density, 12) : savedX);
            panel.setY(savedY < 0 ? dp(density, 52) : savedY);
            GestureDetector gestures = new GestureDetector(activity, new GestureDetector.SimpleOnGestureListener() {
                @Override public boolean onDown(MotionEvent event) { return true; }
                @Override public boolean onScroll(MotionEvent first, MotionEvent last, float dx, float dy) {
                    return true;
                }
                @Override public boolean onDoubleTap(MotionEvent event) { DebugLog.clear(); return true; }
            });
            gestures.setIsLongpressEnabled(false);
            float[] origin = new float[4];
            int slop = ViewConfiguration.get(activity).getScaledTouchSlop();
            panel.setOnTouchListener((view, event) -> {
                if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                    origin[0] = event.getRawX(); origin[1] = event.getRawY();
                    origin[2] = view.getX(); origin[3] = view.getY();
                    MAIN.removeCallbacks(HIDE); MAIN.postDelayed(HIDE, 600);
                } else if (event.getActionMasked() == MotionEvent.ACTION_UP
                        || event.getActionMasked() == MotionEvent.ACTION_CANCEL || event.getPointerCount() != 1
                        || Math.hypot(event.getRawX() - origin[0], event.getRawY() - origin[1]) > slop) MAIN.removeCallbacks(HIDE);
                if ((event.getActionMasked() == MotionEvent.ACTION_MOVE || event.getActionMasked() == MotionEvent.ACTION_UP)
                        && event.getPointerCount() == 1
                        && Math.hypot(event.getRawX() - origin[0], event.getRawY() - origin[1]) > slop) {
                    view.setX(origin[2] + event.getRawX() - origin[0]);
                    view.setY(origin[3] + event.getRawY() - origin[1]);
                    clamp(host);
                }
                gestures.onTouchEvent(event); return true;
            });
            host.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
                @Override public void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
                    if (panel == null || panel.getParent() != host) { host.removeOnLayoutChangeListener(this); return; }
                    FrameLayout.LayoutParams p = (FrameLayout.LayoutParams) panel.getLayoutParams();
                    int w = Math.max(1, Math.min(dp(density, 320), host.getWidth() - dp(density, 24)));
                    int h = Math.max(1, Math.min(dp(density, 180), host.getHeight() - dp(density, 8)));
                    if (p.width != w || p.height != h) { p.width = w; p.height = h; panel.setLayoutParams(p); }
                    clamp(host);
                }
            });
            panel.post(() -> clamp(host));
        }
        List<String> entries = DebugLog.recent();
        panel.setText(String.join("\n", entries.subList(Math.max(0, entries.size() - 25), entries.size())));
        panel.post(() -> {
            if (panel != null && panel.getLayout() != null) panel.scrollTo(0,
                    Math.max(0, panel.getLayout().getHeight() - panel.getHeight() + panel.getPaddingTop() + panel.getPaddingBottom()));
        });
    }

    private static int dp(float density, float value) { return Math.round(density * value); }

    private void clamp(FrameLayout host) {
        if (panel == null || panel.getParent() != host) return;
        float margin = 4 * host.getResources().getDisplayMetrics().density;
        panel.setX(Math.max(margin, Math.min(host.getWidth() - panel.getWidth() - margin, panel.getX())));
        panel.setY(Math.max(margin, Math.min(host.getHeight() - panel.getHeight() - margin, panel.getY())));
        savedX = panel.getX(); savedY = panel.getY();
    }

    private void detach() {
        MAIN.removeCallbacks(HIDE);
        if (panel != null && panel.getParent() instanceof ViewGroup) ((ViewGroup) panel.getParent()).removeView(panel);
        panel = null;
    }

    @Override public void onActivityResumed(Activity activity) {
        detach(); foreground = new WeakReference<>(activity); MAIN.removeCallbacks(REFRESH); MAIN.post(REFRESH);
    }
    @Override public void onActivityPaused(Activity activity) {
        if (foreground.get() == activity) { foreground.clear(); detach(); MAIN.removeCallbacks(REFRESH); }
    }
    @Override public void onActivityDestroyed(Activity activity) { onActivityPaused(activity); }
    @Override public void onActivityCreated(Activity activity, Bundle state) {}
    @Override public void onActivityStarted(Activity activity) {}
    @Override public void onActivityStopped(Activity activity) {}
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
}
