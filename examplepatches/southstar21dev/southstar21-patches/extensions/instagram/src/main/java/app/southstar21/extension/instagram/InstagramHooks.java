package app.southstar21.extension.instagram;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

import app.southstar21.extension.instagram.consciousgate.ConsciousGatePatch;
import app.southstar21.extension.instagram.liquidglass.LiquidGlassNavBarPatch;
import app.southstar21.extension.instagram.settings.ProfileSettingsButton;
import app.southstar21.extension.instagram.settings.Settings;

/**
 * Shared entry point, called from InstagramMainActivity.onWindowFocusChanged by the
 * shared extension patch. Sets up settings and the menu button, then starts each patch.
 */
@SuppressWarnings("unused")
public final class InstagramHooks {
    public static final String TAG = "southstar21";
    private static final long WATCH_INTERVAL_MS = 500;

    private static final WeakHashMap<Activity, Boolean> watched = new WeakHashMap<>();

    private InstagramHooks() {
    }

    /**
     * Called at the end of InstagramMainActivity's constructor, before the activity is created.
     * Waits for it to start (its layout is set by then, and nothing has been drawn yet) so
     * patches can change views before the first frame. onMainActivityWindowFocusChanged only
     * runs once that frame is already on screen.
     */
    public static void onMainActivityConstructed(Activity activity) {
        try {
            if (!(Settings.applicationOrNull() instanceof Application)) return;
            Application app = (Application) Settings.applicationOrNull();
            app.registerActivityLifecycleCallbacks(new BeforeFirstFrame(app, activity));
        } catch (Throwable t) {
            Log.e(TAG, "Main activity constructor hook failed", t);
        }
    }

    /** Runs the early setup once, when the one activity it was made for starts. */
    private static final class BeforeFirstFrame implements Application.ActivityLifecycleCallbacks {
        private final Application app;
        private final WeakReference<Activity> target;

        BeforeFirstFrame(Application app, Activity activity) {
            this.app = app;
            this.target = new WeakReference<>(activity);
        }

        @Override
        public void onActivityStarted(Activity activity) {
            if (activity != target.get()) return;
            app.unregisterActivityLifecycleCallbacks(this);
            try {
                Settings.init(activity);
                if (LiquidGlassNavBarPatch.SETTINGS.isActive()) {
                    LiquidGlassNavBarPatch.installBeforeFirstDraw(activity);
                }
            } catch (Throwable t) {
                Log.e(TAG, "Early main activity setup failed", t);
            }
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            // Destroyed without ever starting (or the activity is gone): stop listening.
            Activity wanted = target.get();
            if (wanted == null || activity == wanted) app.unregisterActivityLifecycleCallbacks(this);
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityResumed(Activity activity) {
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }
    }

    public static void onMainActivityWindowFocusChanged(Activity activity) {
        try {
            Settings.init(activity);
            watch(activity);

            // Start patches here. Each checks it was included and is switched on.
            // The navigation bar and the other glass are two entries of one patch.
            if (LiquidGlassNavBarPatch.SETTINGS.isActive() || LiquidGlassNavBarPatch.EFFECTS.isActive()) {
                LiquidGlassNavBarPatch.onMainActivityReady(activity);
            }
            if (ConsciousGatePatch.SETTINGS.isActive()) {
                ConsciousGatePatch.onMainActivityFocusChanged(activity);
            }
        } catch (Throwable t) {
            // Never take the app down over a patch.
            Log.e(TAG, "Main activity hook failed", t);
        }
    }

    /** Keeps the menu button on the profile page, which Instagram builds and rebuilds lazily. */
    private static void watch(Activity activity) {
        if (watched.containsKey(activity)) return;
        watched.put(activity, Boolean.TRUE);
        View decor = activity.getWindow().getDecorView();
        decor.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            private long last;
            private boolean pending;
            private final Runnable check = this::check;

            @Override
            public boolean onPreDraw() {
                long wait = WATCH_INTERVAL_MS - (SystemClock.uptimeMillis() - last);
                if (wait <= 0) {
                    check();
                } else if (!pending) {
                    // The screen may go still before the next frame; look again once it has.
                    pending = true;
                    decor.postDelayed(check, wait);
                }
                return true;
            }

            private void check() {
                pending = false;
                last = SystemClock.uptimeMillis();
                try {
                    ProfileSettingsButton.ensureInstalled(activity);
                } catch (Throwable t) {
                    decor.getViewTreeObserver().removeOnPreDrawListener(this);
                    Log.e(TAG, "Profile button failed", t);
                }
            }
        });
    }
}
