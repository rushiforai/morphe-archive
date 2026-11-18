package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/** The main activity while it is resumed (2026-11-18: all that remains of the removed Keep Home going feature). */
final class ResumedActivity {

    private static boolean registered;
    private static Activity resumed;

    private ResumedActivity() {
    }

    static synchronized void register() {
        if (registered) return;
        registered = true;
        try {
            ((Application) Utils.getContext().getApplicationContext()).registerActivityLifecycleCallbacks(new Callbacks());
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: activity tracking not registered", t);
        }
    }

    /** The main activity while it is resumed, else null. */
    static Activity main() {
        return resumed;
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity a) {
            if (a.getClass().getName().endsWith("MainActivity")) resumed = a;
        }

        @Override
        public void onActivityPaused(Activity a) {
            if (resumed == a) resumed = null;
        }

        @Override public void onActivityCreated(Activity a, Bundle b) {}
        @Override public void onActivityStarted(Activity a) {}
        @Override public void onActivityStopped(Activity a) {}
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
        @Override public void onActivityDestroyed(Activity a) {}
    }
}
