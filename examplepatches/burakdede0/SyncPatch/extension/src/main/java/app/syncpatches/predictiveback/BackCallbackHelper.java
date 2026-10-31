package app.syncpatches.predictiveback;

import android.app.Activity;
import android.view.KeyEvent;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

/**
 * Registers the back callback that replays the app's own back handling from
 * {@code MainActivity.onKeyUp}: dismiss panels, reset the home feed, close the
 * drawer, and - with the "Exit on single back press" patch applied - finish
 * the app on the first back at the root screen.
 *
 * The callback is ONLY registered when MainActivity actually has in-app back
 * state (drawer, panel, feed switch) to consume. At the root screen no
 * callback is registered, which hands the gesture to the system: it plays its
 * native predictive back-to-home transition and finishes the app on commit.
 * No custom animation is drawn anywhere; the system's own animations and the
 * app's own transitions provide the visuals.
 */
final class BackCallbackHelper {
    private static Activity registeredActivity;
    private static OnBackInvokedCallback registeredCallback;

    private BackCallbackHelper() {
    }

    /**
     * Registers the callback on MainActivity, replacing any previous
     * registration (also one on a stale instance of a recreated MainActivity).
     * A no-op when this exact instance already owns the callback, so repeated
     * probes from hooks or settle re-checks cannot churn the window's
     * OnBackInvokedCallbackInfo (every rebind pushes a new top callback to
     * the system).
     */
    static void register(Activity activity) {
        if (isRegisteredFor(activity)) {
            return;
        }
        unregisterAny();

        OnBackInvokedCallback callback = () -> {
            try {
                // Replay the app's own BACK handling. MainActivity.onKeyUp
                // runs the whole back sequence and, at the root screen,
                // finishes the activity.
                activity.onKeyUp(KeyEvent.KEYCODE_BACK,
                        new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_BACK));
            } catch (Throwable t) {
                // Swallowed on purpose: a system back callback must never
                // crash the app.
            }
            // A back press may have consumed the last in-app state (closed
            // the drawer); re-check whether the callback can go away.
            PredictiveBackFix.updateRegistration(activity);
        };

        try {
            activity.getOnBackInvokedDispatcher()
                    .registerOnBackInvokedCallback(OnBackInvokedDispatcher.PRIORITY_DEFAULT, callback);
        } catch (Throwable t) {
            // Swallowed on purpose: stay app-owned rather than crash.
            return;
        }

        registeredActivity = activity;
        registeredCallback = callback;
    }

    /** Removes any registered callback, whatever activity instance it is on. */
    static void unregisterAny() {
        OnBackInvokedCallback callback = registeredCallback;
        if (callback == null) {
            return;
        }
        try {
            registeredActivity.getOnBackInvokedDispatcher()
                    .unregisterOnBackInvokedCallback(callback);
        } catch (Throwable t) {
            // Swallowed on purpose: the removal is retried on the next
            // re-check hook if the callback is still registered.
        }
        registeredCallback = null;
        registeredActivity = null;
    }

    /** Removes the callback only if it is registered on this activity instance. */
    static void unregisterFor(Activity activity) {
        OnBackInvokedCallback callback = registeredCallback;
        if (callback == null || registeredActivity != activity) {
            // Not the activity we registered on (this hook is reachable from
            // BaseActivity.onDestroy for every activity in the app).
            return;
        }
        unregisterAny();
    }

    static boolean isRegisteredFor(Activity activity) {
        return registeredActivity == activity && registeredCallback != null;
    }

    /** The activity the callback is currently registered on, or null. */
    static Activity registeredActivityOf() {
        return registeredCallback == null ? null : registeredActivity;
    }
}
