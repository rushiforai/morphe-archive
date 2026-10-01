package app.ahmedyarub.extension.x;

import android.app.Activity;

import java.lang.ref.WeakReference;

/** The app's one activity, which dialogs the patches show are attached to. */
@SuppressWarnings("unused")
public final class MainActivity {

    private static volatile WeakReference<Activity> activity = new WeakReference<>(null);

    /** Called when the activity is created. */
    public static void set(Activity created) {
        activity = new WeakReference<>(created);
    }

    /** The activity, or null if it is gone. */
    public static Activity get() {
        Activity current = activity.get();
        return current == null || current.isFinishing() || current.isDestroyed() ? null : current;
    }
}
