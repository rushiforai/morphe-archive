package app.template.extension.extension;

/**
 * RefreshRateHelper — runtime helper that opts NYT Games into the display's
 * high / variable refresh rate.
 *
 * Why this is needed:
 *   The NYT Games app never votes for a frame rate (no setFrameRate /
 *   preferredRefreshRate / preferredDisplayModeId anywhere in its own code).
 *   On high-refresh (90/120 Hz) and VRR panels, Android's power-saving
 *   "frame rate override" therefore pins the app to 60 Hz — the panel drops
 *   to 60 Hz and the app's Choreographer is only serviced 60 times/sec,
 *   producing the 60 fps judder. Casting a refresh-rate vote from the app's
 *   own window lifts that override so the UI can render up to the panel's
 *   maximum (and adapt below it on VRR displays).
 *
 * Strategy:
 *   install() is invoked once from the Application's onCreate. It registers a
 *   process-wide ActivityLifecycleCallbacks that, for every Activity window,
 *   sets ONLY WindowManager.LayoutParams.preferredRefreshRate to the highest
 *   refresh rate the display offers at the current resolution.
 *
 *   It deliberately does NOT set preferredDisplayModeId. That field pins a
 *   specific, non-seamless display mode; on Adaptive Refresh Rate (ARR) panels
 *   it fights the platform's fling enhancement — which smoothly lowers the rate
 *   as a scroll decelerates — so frames land off-cadence and scrolling
 *   oscillates between smooth and juddery. preferredRefreshRate is the
 *   platform-recommended, seamless-friendly hint: it lifts the 60 Hz cap while
 *   letting ARR adapt during scroll.
 *
 * Everything is wrapped in try/catch so a failure can never crash the host app.
 */

import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.view.Display;
import android.view.Window;
import android.view.WindowManager;

public final class RefreshRateHelper {

    private static volatile boolean installed = false;

    private RefreshRateHelper() {
    }

    /** Called once from the Application's onCreate. p0 == the Application. */
    public static void install(final Application app) {
        if (app == null || installed) {
            return;
        }
        installed = true;
        try {
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                    apply(activity);
                }

                @Override
                public void onActivityStarted(Activity activity) {
                }

                @Override
                public void onActivityResumed(Activity activity) {
                    // Re-apply on resume: covers windows recreated after config changes.
                    apply(activity);
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

                @Override
                public void onActivityDestroyed(Activity activity) {
                }
            });
        } catch (Throwable ignored) {
        }
    }

    /** Hint the given Activity's window toward the display's highest refresh rate. */
    public static void apply(Activity activity) {
        try {
            if (activity == null) {
                return;
            }
            Window window = activity.getWindow();
            if (window == null) {
                return;
            }
            Display display = displayOf(activity);
            if (display == null) {
                return;
            }

            Display.Mode current = display.getMode();
            Display.Mode[] modes = display.getSupportedModes();

            float bestRate = current != null ? current.getRefreshRate() : 0f;
            if (modes != null && current != null) {
                // Highest refresh rate available at the current resolution.
                for (Display.Mode m : modes) {
                    if (m.getPhysicalWidth() == current.getPhysicalWidth()
                            && m.getPhysicalHeight() == current.getPhysicalHeight()
                            && m.getRefreshRate() > bestRate + 0.1f) {
                        bestRate = m.getRefreshRate();
                    }
                }
            }
            if (bestRate <= 0f) {
                return;
            }

            WindowManager.LayoutParams lp = window.getAttributes();
            boolean changed = false;

            // Soft, seamless hint only.
            if (Math.abs(lp.preferredRefreshRate - bestRate) > 0.1f) {
                lp.preferredRefreshRate = bestRate;
                changed = true;
            }
            // Never pin a fixed mode; clear one if an earlier build set it.
            if (lp.preferredDisplayModeId != 0) {
                lp.preferredDisplayModeId = 0;
                changed = true;
            }
            if (changed) {
                window.setAttributes(lp);
            }
        } catch (Throwable ignored) {
        }
    }

    private static Display displayOf(Activity activity) {
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                Display d = activity.getDisplay();
                if (d != null) {
                    return d;
                }
            }
        } catch (Throwable ignored) {
        }
        try {
            return activity.getWindowManager().getDefaultDisplay();
        } catch (Throwable ignored) {
            return null;
        }
    }
}
