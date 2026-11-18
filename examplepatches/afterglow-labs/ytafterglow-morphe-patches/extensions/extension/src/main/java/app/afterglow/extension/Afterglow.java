package app.afterglow.extension;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.ref.WeakReference;
import app.afterglow.extension.diagnostics.DebugLog;

/**
 * Process-wide entry point for the Afterglow extension. Patches call
 * {@link #onApplicationCreate} and {@link #onMainActivityCreate} from YouTube's
 * own startup code; everything else reads the context through {@link #context()}.
 */
public final class Afterglow {
    public static final String TAG = "YTAfterglow";

    @SuppressLint("StaticFieldLeak")
    private static volatile Context appContext;
    private static volatile WeakReference<Activity> mainActivity = new WeakReference<>(null);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private Afterglow() {}

    /** Injected at the start of YouTube's Application.onCreate. */
    public static void onApplicationCreate(Application application) {
        setContext(application);
    }

    /** Theme hooks run before Application.onCreate, when preferences already need a base context. */
    public static void onBaseContext(Context context) {
        if (appContext == null) setContext(context);
    }

    /** Injected at the start of YouTube's main activity onCreate. */
    public static void onMainActivityCreate(Activity activity) {
        setContext(activity);
        mainActivity = new WeakReference<>(activity);
        DebugLog.initialize(activity);
    }

    public static Activity mainActivity() {
        return mainActivity.get();
    }

    public static Context context() {
        Context context = appContext;
        if (context == null) {
            context = currentApplication();
            if (context != null) appContext = context;
        }
        return context;
    }

    public static void runOnMain(Runnable runnable) {
        if (Looper.myLooper() == Looper.getMainLooper()) runnable.run();
        else MAIN.post(runnable);
    }

    public static void runOnMainDelayed(Runnable runnable, long delayMillis) {
        MAIN.postDelayed(runnable, delayMillis);
    }

    private static void setContext(Context context) {
        if (context == null) return;
        Context application = context.getApplicationContext();
        appContext = application != null ? application : context;
    }

    @SuppressLint("PrivateApi")
    private static Context currentApplication() {
        try {
            Object app = Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            return app instanceof Context ? (Context) app : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Logs an exception without ever throwing back into YouTube's code. */
    public static void error(String where, Throwable error) {
        Log.e(TAG, where, error);
        DebugLog.error(where, error);
    }
}
