package app.revanced.extension.rif;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Keeps rif's Submit page from losing a send half way.
 *
 * <p>Rotating the screen while a post is sent recreates SubmitActivity (it has no configChanges). rif
 * cancels its SubmitTask then, but the new form stays on screen and the post still goes out (the task
 * only notices the cancel when it is done), so a second tap makes a duplicate. Stock rif has this flaw
 * with a window of about a second; our image uploads stretch it to 5-15 s. Two parts:
 * <ul>
 * <li>{@link #lock} / {@link #unlock} (hooked at rif's overlay show and hide methods in
 * {@code submit.m}): the orientation is locked while the "sending" overlay shows, the way rif's own
 * media viewer locks it, and restored when the overlay hides.</li>
 * <li>{@link #throwIfCancelled} (after our uploads, in SubmitTask.d0): a send rif has cancelled (Back
 * and discard, or any recreation the lock doesn't catch) is dropped quietly instead of posted.</li>
 * </ul>
 */
public final class SubmitGuard {

    private static final String TAG = "RifSubmitGuard";

    /** rif's {@code x4.a.p()} (Platinum {@code y4.a.p()}): the task's isCancelled, public final, same name in both builds. */
    private static final String CANCELLED_METHOD = "p";

    /** Each locked activity's orientation request before the lock. */
    private static final Map<Activity, Integer> SAVED = Collections.synchronizedMap(new WeakHashMap<Activity, Integer>());

    private static final Map<Class<?>, Method> CANCEL_CHECKS = new HashMap<>();

    private SubmitGuard() {}

    /** Thrown to stop a cancelled SubmitTask's d0; rif turns any exception there into "no result" and shows nothing. */
    static final class Cancelled extends RuntimeException {
        Cancelled() {
            super("submit cancelled");
        }

        @Override
        public synchronized Throwable fillInStackTrace() {
            return this;
        }
    }

    /** Hook: rif shows its submit overlay. Locks the activity's orientation until {@link #unlock}. */
    public static void lock(Activity activity) {
        try {
            if (activity == null || activity.isFinishing()) return;
            synchronized (SAVED) {
                if (SAVED.containsKey(activity)) return;
                SAVED.put(activity, activity.getRequestedOrientation());
            }
            activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LOCKED);
        } catch (Throwable t) {
            Log.w(TAG, "orientation lock failed", t);
        }
    }

    /** Hook: rif hides its submit overlay. Gives the activity back the orientation it had before {@link #lock}. */
    public static void unlock(Activity activity) {
        try {
            if (activity == null) return;
            Integer saved = SAVED.remove(activity);
            if (saved == null) return;
            if (activity.isFinishing()) return;
            activity.setRequestedOrientation(saved);
        } catch (Throwable t) {
            Log.w(TAG, "orientation unlock failed", t);
        }
    }

    /**
     * Throws {@link Cancelled} when rif has cancelled {@code task} (a SubmitTask). Called on the task's
     * background thread, after the work that takes long and before the result is built.
     */
    static void throwIfCancelled(Object task) {
        if (isCancelled(task)) throw new Cancelled();
    }

    static boolean isCancelled(Object task) {
        try {
            if (task == null) return false;
            Method check = cancelCheck(task.getClass());
            return check != null && Boolean.TRUE.equals(check.invoke(task));
        } catch (Throwable t) {
            Log.w(TAG, "cancel check failed", t);
            return false;
        }
    }

    private static Method cancelCheck(Class<?> type) {
        synchronized (CANCEL_CHECKS) {
            if (CANCEL_CHECKS.containsKey(type)) return CANCEL_CHECKS.get(type);
            Method found = findCancelCheck(type);
            if (found == null) Log.w(TAG, "no cancel check on " + type.getName());
            CANCEL_CHECKS.put(type, found);
            return found;
        }
    }

    /** The public no-argument boolean method named {@link #CANCELLED_METHOD} that {@code type} has or inherits, or null. */
    static Method findCancelCheck(Class<?> type) {
        try {
            Method m = type.getMethod(CANCELLED_METHOD);
            if (m.getReturnType() != boolean.class) return null;
            m.setAccessible(true);
            return m;
        } catch (NoSuchMethodException e) {
            return null;
        }
    }
}
