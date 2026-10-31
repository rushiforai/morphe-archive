package app.syncpatches.predictiveback;

import android.app.Activity;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.View;

import androidx.drawerlayout.widget.DrawerLayout;

import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/**
 * Central coordinator (Android 14+ only).
 *
 * The callback is registered ONLY while MainActivity actually has in-app back
 * state (drawer, panel, tap bar state, home feed switch) to consume, and it
 * draws no animation of its own; the app's own transitions provide visuals.
 * At the root screen the callback is removed, which hands the gesture to the
 * system: the system then plays its native predictive back-to-home transition
 * into the launcher and finishes the app on commit, all by itself.
 *
 * State changes are tracked through four hooks installed by
 * PredictiveBackPatch:
 * <ul>
 *   <li>{@code register} from MainActivity.onCreate (plus a retry after the
 *       window attaches, since the system dispatcher drops pre-attach
 *       registrations).</li>
 *   <li>{@code onResumed} from BaseMaterialActivity.onResume.</li>
 *   <li>{@code onViewAttached} from SyncDrawerLayout.onAttachedToWindow, which
 *       attaches a drawer state listener covering drawer opens by button,
 *       menu, and drag alike.</li>
 *   <li>{@code onOverlayUpdate} at the end of
 *       OverlappingPanelsLayout.w(F,F), the main choke point of panel state
 *       changes.</li>
 *   <li>{@code onFeedChanged} from VerticalPostsFragment.I3(String), the
 *       single choke point of home feed changes in "posts home" mode
 *       (including the back-press feed reset).</li>
 * </ul>
 *
 * This class does not reference API 34+ classes directly so the guard runs
 * first; {@link BackCallbackHelper} does the actual registering.
 */
public final class PredictiveBackFix {
    private static final String MAIN_ACTIVITY =
            "com.laurencedawson.reddit_sync.ui.activities.MainActivity";

    private static final WeakHashMap<View, Boolean> TRACKED_DRAWERS = new WeakHashMap<>();

    /**
     * Re-probes after a register decision. During activity launch the app's
     * panel layout settles through animation frames, and probes that run
     * mid-transition can legitimately see in-app back state that no longer
     * exists once the settle finishes. Nothing re-fires after the settle, so
     * the final launch-time decision could leave the back callback registered
     * on a root screen - and a callback with PRIORITY_DEFAULT outranks the
     * framework's own system-priority default, which stops the shell from
     * ever starting its predictive back-to-home transition (the window is
     * then classified as TYPE_CALLBACK). These delayed re-checks converge
     * registration to the settled state well before a real gesture happens
     * (gestures land seconds after launch).
     */
    private static final long[] SETTLE_RECHECK_DELAYS_MS = {600L, 1500L};
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<Activity, List<PendingRecheck>> PENDING_RECHECKS =
            new WeakHashMap<>();

    private PredictiveBackFix() {
    }

    /** Hooked into MainActivity.onCreate, right after super.onCreate. */
    public static void register(Activity activity) {
        if (Build.VERSION.SDK_INT < 34) {
            return;
        }
        updateRegistration(activity);

        // Activity onCreate runs before the window is attached. On Android 13+
        // the system dispatcher DROPS registrations that arrive pre-attach, so
        // the first registration alone can be lost. A post on the decor view
        // is flushed during the window's first traversal, which is after the
        // window is attached, so this retry is the one that sticks.
        activity.getWindow().getDecorView().post(() -> {
            if (!activity.isFinishing()) {
                updateRegistration(activity);
            }
        });
    }

    /** Hooked into BaseMaterialActivity.onResume. */
    public static void onResumed(Activity activity) {
        if (Build.VERSION.SDK_INT < 34) {
            return;
        }
        updateRegistration(activity);
    }

    /** Hooked into SyncDrawerLayout.onAttachedToWindow. */
    public static void onViewAttached(View view) {
        if (Build.VERSION.SDK_INT < 34) {
            return;
        }
        Activity owner = activityOf(view);
        if (owner == null) {
            return;
        }
        if (TRACKED_DRAWERS.put(view, Boolean.TRUE) != null) {
            return; // Already listening on this drawer instance
        }
        if (!(view instanceof DrawerLayout)) {
            return;
        }
        final Activity activity = owner;
        ((DrawerLayout) view).addDrawerListener(new DrawerLayout.SimpleDrawerListener() {
            @Override
            public void onDrawerSlide(View drawerView, float slideOffset) {
                if (slideOffset > 0.02f && !BackCallbackHelper.isRegisteredFor(activity)) {
                    BackCallbackHelper.register(activity);
                }
            }

            @Override
            public void onDrawerOpened(View drawerView) {
                BackCallbackHelper.register(activity);
            }

            @Override
            public void onDrawerClosed(View drawerView) {
                // The drawer closing may have returned the app to root state;
                // hand the gesture to the system again.
                updateRegistration(activity);
            }
        });
    }

    /** Hooked into the end of OverlappingPanelsLayout.w(F,F). */
    public static void onOverlayUpdate(View view) {
        if (Build.VERSION.SDK_INT < 34) {
            return;
        }
        updateRegistration(activityOf(view));
    }

    /** Hooked into BaseActivity.onDestroy for every activity in the app. */
    public static void unregister(Activity activity) {
        if (Build.VERSION.SDK_INT < 34) {
            return;
        }
        cancelSettleRechecks(activity);
        BackCallbackHelper.unregisterFor(activity);
    }

    /**
     * Registers or removes the back callback depending on MainActivity's back
     * state. Fail-safe: anything uncertain keeps the app callback registered.
     * A register decision schedules delayed re-checks that re-run this method
     * once the launch settle has finished; a re-check that still lands on
     * "register" does not re-schedule (the state is settled - the callback
     * legitimately stays on, and later hook events cover real changes).
     */
    static void updateRegistration(Activity activity) {
        updateRegistration(activity, false);
    }

    private static void updateRegistration(Activity activity, boolean fromRecheck) {
        if (activity == null
                || !MAIN_ACTIVITY.equals(activity.getClass().getName())) {
            return;
        }
        if (MainActivityState.isRootState(activity)) {
            cancelSettleRechecks(activity);
            BackCallbackHelper.unregisterAny();
        } else {
            BackCallbackHelper.register(activity);
            if (!fromRecheck) {
                scheduleSettleRechecks(activity);
            }
        }
    }

    /**
     * Hooked into the posts-fragment feed switch
     * (VerticalPostsFragment.I3(String)) - the single choke point every home
     * feed change goes through, including the back-press feed reset. Feed
     * changes can flip MainActivity between "feed reset consumes back" and
     * "root screen", so the registration decision is re-run immediately.
     */
    public static void onFeedChanged(Object postsFragment) {
        if (Build.VERSION.SDK_INT < 34) {
            return;
        }
        Activity activity = activityOfFragment(postsFragment);
        if (activity == null) {
            activity = BackCallbackHelper.registeredActivityOf();
        }
        updateRegistration(activity);
    }

    private static Activity activityOfFragment(Object fragment) {
        try {
            return (Activity) fragment.getClass().getMethod("getActivity").invoke(fragment);
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Schedules one pending re-check per delay. Direct registers that bypass
     * this path (the drawer slide listener keeps the callback registered on
     * purpose while a drawer drag is in progress) never schedule re-checks,
     * so no removal can land in the middle of a live gesture.
     */
    private static void scheduleSettleRechecks(Activity activity) {
        if (activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        List<PendingRecheck> pending = PENDING_RECHECKS.get(activity);
        if (pending == null) {
            pending = new ArrayList<>();
            PENDING_RECHECKS.put(activity, pending);
        }
        for (long delayMs : SETTLE_RECHECK_DELAYS_MS) {
            boolean alreadyScheduled = false;
            for (PendingRecheck existing : pending) {
                if (existing.delayMs == delayMs) {
                    alreadyScheduled = true;
                    break;
                }
            }
            if (!alreadyScheduled) {
                PendingRecheck recheck = new PendingRecheck(activity, delayMs);
                pending.add(recheck);
                MAIN_HANDLER.postDelayed(recheck, delayMs);
            }
        }
    }

    private static void cancelSettleRechecks(Activity activity) {
        List<PendingRecheck> pending = PENDING_RECHECKS.remove(activity);
        if (pending == null) {
            return;
        }
        for (PendingRecheck recheck : pending) {
            MAIN_HANDLER.removeCallbacks(recheck);
        }
        pending.clear();
    }

    private static final class PendingRecheck implements Runnable {
        final Activity activity;
        final long delayMs;

        PendingRecheck(Activity activity, long delayMs) {
            this.activity = activity;
            this.delayMs = delayMs;
        }

        @Override
        public void run() {
            List<PendingRecheck> pending = PENDING_RECHECKS.get(activity);
            if (pending != null) {
                pending.remove(this);
            }
            if (activity.isFinishing() || activity.isDestroyed()) {
                return;
            }
            // Re-run the full decision. If the settled state is still root the
            // callback comes off; if in-app state genuinely exists it stays on
            // and the re-check chain stops (later hook events cover changes).
            updateRegistration(activity, true);
        }
    }

    /** Walks a view's context up to its hosting activity, or returns null. */
    private static Activity activityOf(View view) {
        android.content.Context ctx = view == null ? null : view.getContext();
        while (ctx instanceof android.content.ContextWrapper) {
            if (ctx instanceof Activity) {
                return (Activity) ctx;
            }
            ctx = ((android.content.ContextWrapper) ctx).getBaseContext();
        }
        return null;
    }
}
