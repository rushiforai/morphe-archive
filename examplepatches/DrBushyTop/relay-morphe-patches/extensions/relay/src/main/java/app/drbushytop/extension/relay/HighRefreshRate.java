package app.drbushytop.extension.relay;

import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * Asks for the display's highest refresh rate while a Relay window is drawing (scrolling,
 * flinging, animating), and drops the request once it has been still for a moment, so the phone
 * can lower the rate again for static content.
 *
 * <p>Relay never asks for a refresh rate, and on adaptive refresh rate phones the system then
 * keeps it at 60 Hz, scrolling included.
 */
@SuppressWarnings("unused")
public final class HighRefreshRate {
    private static final String TAG = "RelayRefreshRate";
    /** How long a window must not draw before it stops asking for the high rate. */
    private static final long IDLE_MS = 600;
    /**
     * Changing the request makes the window lay out and draw again. Draws this soon after a
     * change are that, not the user, so they do not count.
     */
    private static final long OWN_DRAW_MS = 150;

    private static final WeakHashMap<Activity, Booster> BOOSTERS = new WeakHashMap<>();
    private static boolean installed;

    private HighRefreshRate() {
    }

    /** Hook: Relay's Application#onCreate. */
    public static void install(Application application) {
        try {
            if (application == null || installed) return;
            installed = true;
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity activity) {
                    attach(activity);
                }

                @Override
                public void onActivityPaused(Activity activity) {
                    Booster booster = BOOSTERS.get(activity);
                    if (booster != null) booster.lower();
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                    Booster booster = BOOSTERS.remove(activity);
                    if (booster != null) booster.detach();
                }

                @Override public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}
                @Override public void onActivityStarted(Activity activity) {}
                @Override public void onActivityStopped(Activity activity) {}
                @Override public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}
            });
        } catch (Throwable t) {
            Log.e(TAG, "install", t);
        }
    }

    private static void attach(Activity activity) {
        try {
            if (BOOSTERS.containsKey(activity)) return;
            Window window = activity.getWindow();
            if (window == null) return;
            Booster booster = new Booster(activity, window.getDecorView());
            BOOSTERS.put(activity, booster);
            window.getDecorView().getViewTreeObserver().addOnDrawListener(booster);
        } catch (Throwable t) {
            Log.e(TAG, "attach", t);
        }
    }

    /** Watches one window's draws and raises or lowers its refresh rate request. */
    private static final class Booster implements ViewTreeObserver.OnDrawListener {
        private final WeakReference<Activity> activity;
        private final View decor;
        private boolean high;
        private long lastDraw;
        private long changedAt;
        private boolean idleCheckPosted;

        private final Runnable raise = new Runnable() {
            @Override
            public void run() {
                request(highestRefreshRate());
            }
        };

        private final Runnable idleCheck = new Runnable() {
            @Override
            public void run() {
                idleCheckPosted = false;
                if (!high) return;
                long still = SystemClock.uptimeMillis() - lastDraw;
                if (still >= IDLE_MS) {
                    lower();
                } else {
                    decor.postDelayed(this, IDLE_MS - still);
                    idleCheckPosted = true;
                }
            }
        };

        Booster(Activity activity, View decor) {
            this.activity = new WeakReference<>(activity);
            this.decor = decor;
        }

        @Override
        public void onDraw() {
            long now = SystemClock.uptimeMillis();
            if (now - changedAt < OWN_DRAW_MS) return;
            lastDraw = now;
            if (!high) {
                high = true;
                // The view tree must not change while it draws.
                decor.post(raise);
            }
            if (!idleCheckPosted) {
                decor.postDelayed(idleCheck, IDLE_MS);
                idleCheckPosted = true;
            }
        }

        void lower() {
            high = false;
            decor.removeCallbacks(raise);
            request(0f);
        }

        void detach() {
            decor.removeCallbacks(raise);
            decor.removeCallbacks(idleCheck);
            try {
                decor.getViewTreeObserver().removeOnDrawListener(this);
            } catch (Throwable ignored) {
            }
        }

        /** Sets the window's refresh rate request; 0 means none, so the system decides. */
        private void request(float rate) {
            try {
                Activity owner = activity.get();
                if (owner == null) return;
                Window window = owner.getWindow();
                WindowManager.LayoutParams attributes = window.getAttributes();
                if (Math.abs(attributes.preferredRefreshRate - rate) < 0.01f) return;
                attributes.preferredRefreshRate = rate;
                changedAt = SystemClock.uptimeMillis();
                window.setAttributes(attributes);
                if (Log.isLoggable(TAG, Log.DEBUG)) {
                    Log.d(TAG, owner.getClass().getSimpleName() + ": refresh rate request " + rate);
                }
            } catch (Throwable t) {
                Log.e(TAG, "request", t);
            }
        }

        /** The highest refresh rate the window's display offers at its current resolution. */
        @SuppressWarnings("deprecation")
        private float highestRefreshRate() {
            try {
                Activity owner = activity.get();
                if (owner == null) return 0f;
                Display display = Build.VERSION.SDK_INT >= 30
                        ? owner.getDisplay()
                        : owner.getWindowManager().getDefaultDisplay();
                if (display == null) return 0f;
                Display.Mode current = display.getMode();
                float highest = 0f;
                for (Display.Mode mode : display.getSupportedModes()) {
                    if (mode.getPhysicalWidth() == current.getPhysicalWidth()
                            && mode.getPhysicalHeight() == current.getPhysicalHeight()) {
                        highest = Math.max(highest, mode.getRefreshRate());
                    }
                }
                return highest;
            } catch (Throwable t) {
                Log.e(TAG, "highestRefreshRate", t);
                return 0f;
            }
        }
    }
}
