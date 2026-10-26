package app.pixkk.extension.core;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import java.lang.ref.WeakReference;

/** The application context the hooks hand over, and a few helpers that need it. */
public final class Utils {
    private static volatile Context context;
    private static volatile WeakReference<Activity> activity = new WeakReference<>(null);

    private Utils() {
    }

    /** Called from the patched application and main activity. An activity is kept weakly. */
    public static void setContext(Context given) {
        if (given == null) return;
        if (given instanceof Activity) {
            activity = new WeakReference<>((Activity) given);
            Context application = given.getApplicationContext();
            context = application != null ? application : given;
        } else {
            context = given;
        }
    }

    /** The application context, or null before the first hook has run. */
    public static Context getContext() {
        return context;
    }

    /** The main activity last handed over, or null once it is gone. */
    public static Activity getActivity() {
        return activity.get();
    }

    public static boolean isCurrentlyOnMainThread() {
        return Looper.getMainLooper() == Looper.myLooper();
    }

    public static void runOnMainThread(Runnable runnable) {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                runnable.run();
            } catch (Throwable failure) {
                Logger.printException(() -> "A task on the main thread failed", failure);
            }
        });
    }

    public static void showToastShort(String message) {
        Context current = context;
        if (current == null) return;
        runOnMainThread(() -> Toast.makeText(current, message, Toast.LENGTH_SHORT).show());
    }
}
