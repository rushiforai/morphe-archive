package app.tikkamasalla.stremio.introskip;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import java.lang.ref.WeakReference;

/**
 * Skip-overlay host for the Stremio phone app (2.x): there is no player Fragment to wrap, so the
 * anchor view the skip engine needs (a {@link PortHooks.PortHost}) lives in the Activity content
 * from stream load until unload. The engine adds its own pill/card to the same content and closes
 * its session when the anchor detaches.
 *
 * The anchor is 1x1 px, invisible, not clickable and not focusable: it never takes a touch or the
 * focus from Stremio's own player controls. Only active once the phone MainActivity hook ran
 * ({@link #isPhone()}); on TV builds every entry point returns at once.
 */
final class PhoneOverlay {
    private static final String TAG = "IntroSkipPort";
    private static final int ATTACH_RETRIES = 6;
    private static final long ATTACH_RETRY_MS = 200L;
    private static final long OUTGOING_WAIT_MS = 3000L;
    private static final long OUTGOING_POLL_MS = 100L;
    /** dp the pill is raised while Stremio's controls are up (TV 56, phone 84: the phone seek row is taller). */
    private static final int LIFT_DP_TV = 56;
    private static final int LIFT_DP_PHONE = 84;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile boolean phone;

    // Main thread only.
    private static WeakReference<Activity> activity;
    private static WeakReference<PortHooks.PortHost> host;
    private static WeakReference<Activity> outgoing;
    private static int attachRetries;

    private static final Runnable ATTACH = new Runnable() {
        @Override
        public void run() {
            try {
                Activity a = activity != null ? activity.get() : null;
                if (a == null) a = PortHooks.currentActivity();
                boolean alive = a != null && !a.isFinishing()
                        && !(Build.VERSION.SDK_INT >= 17 && a.isDestroyed());
                if (!wouldAttach(phone, PortHooks.isLoaded(), alive)) return;
                View content = a.findViewById(android.R.id.content);
                if (!(content instanceof ViewGroup)) {
                    if (attachRetries++ < ATTACH_RETRIES) MAIN.postDelayed(this, ATTACH_RETRY_MS);
                    return;
                }
                detach(); // a new load always gets a new anchor
                PortHooks.PortHost anchor = new PortHooks.PortHost(a);
                anchor.setClickable(false);
                anchor.setFocusable(false);
                anchor.setFocusableInTouchMode(false);
                anchor.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                anchor.setVisibility(View.INVISIBLE);
                ((ViewGroup) content).addView(anchor, new FrameLayout.LayoutParams(1, 1));
                host = new WeakReference<PortHooks.PortHost>(anchor);
                Log.i(TAG, "phone anchor attached");
                PortHooks.setHost(anchor, a);
            } catch (Throwable t) {
                Log.w(TAG, "phone anchor attach failed", t);
            }
        }
    };

    private PhoneOverlay() {
    }

    /** The decision table for attaching the anchor. */
    static boolean wouldAttach(boolean phone, boolean loaded, boolean activityAlive) {
        return phone && loaded && activityAlive;
    }

    /** True once the phone MainActivity hook ran (never on TV builds). */
    static boolean isPhone() {
        return phone;
    }

    static int liftDp(boolean touchUi) {
        return touchUi ? LIFT_DP_PHONE : LIFT_DP_TV;
    }

    /** True when {@code c} is an Activity in Picture-in-Picture mode. */
    static boolean inPip(Context c) {
        try {
            return c instanceof Activity && Build.VERSION.SDK_INT >= 24
                    && ((Activity) c).isInPictureInPictureMode();
        } catch (Throwable t) {
            return false;
        }
    }

    /** Phone MainActivity.onCreate; again when the Activity is recreated (the anchor then moves to the new content). */
    static void onMainActivity(final Activity a) {
        phone = true;
        post(new Runnable() {
            @Override
            public void run() {
                Activity previous = activity != null ? activity.get() : null;
                if (previous == a) return;
                activity = new WeakReference<Activity>(a);
                // A finishing previous activity: a deep link restarted this single-task activity, its player
                // ends with it, and this activity's own load brings the anchor. Recreated: the player goes on.
                boolean restarted = previous != null && previous.isFinishing();
                if (restarted) outgoing = new WeakReference<Activity>(previous);
                if (PortHooks.isLoaded() && !restarted) attach();
            }
        });
    }

    /**
     * Runs r on the main thread once the activity a deep link replaced is destroyed (capped): its player screen
     * unloads the core player when it goes, and that must not land after the load of a player started now.
     */
    static void afterOutgoingGone(final Runnable r) {
        final long until = SystemClock.uptimeMillis() + OUTGOING_WAIT_MS;
        post(new Runnable() {
            @Override
            public void run() {
                Activity old = outgoing != null ? outgoing.get() : null;
                boolean alive = old != null && !(Build.VERSION.SDK_INT >= 17 && old.isDestroyed());
                if (phone && alive && SystemClock.uptimeMillis() < until) {
                    final Runnable again = this;
                    MAIN.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            post(again);
                        }
                    }, OUTGOING_POLL_MS);
                    return;
                }
                r.run();
            }
        });
    }

    static void onLoad() {
        if (!phone) return;
        post(new Runnable() {
            @Override
            public void run() {
                attach();
            }
        });
    }

    static void onUnload() {
        if (!phone) return;
        post(new Runnable() {
            @Override
            public void run() {
                detach();
            }
        });
    }

    private static void post(final Runnable r) {
        try {
            MAIN.post(new Runnable() {
                @Override
                public void run() {
                    try {
                        r.run();
                    } catch (Throwable t) {
                        Log.w(TAG, "phone overlay failed", t);
                    }
                }
            });
        } catch (Throwable t) {
            Log.w(TAG, "phone overlay post failed", t);
        }
    }

    private static void attach() {
        MAIN.removeCallbacks(ATTACH);
        attachRetries = 0;
        ATTACH.run();
    }

    private static void detach() {
        MAIN.removeCallbacks(ATTACH);
        PortHooks.PortHost h = host != null ? host.get() : null;
        host = null;
        if (h == null) return;
        if (h.getParent() instanceof ViewGroup) ((ViewGroup) h.getParent()).removeView(h);
        PortHooks.clearHost(h);
        Log.i(TAG, "phone anchor removed");
    }
}
