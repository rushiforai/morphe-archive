package app.southstar21.extension.instagram;

import android.app.Activity;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver;

import java.util.WeakHashMap;

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

    public static void onMainActivityWindowFocusChanged(Activity activity) {
        try {
            Settings.init(activity);
            watch(activity);

            // Start patches here. Each checks it was included and is switched on.
            if (LiquidGlassNavBarPatch.SETTINGS.isActive()) {
                LiquidGlassNavBarPatch.onMainActivityReady(activity);
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
