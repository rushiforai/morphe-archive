package app.noam.extension.chesscom;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import app.noam.extension.chesscom.settings.Welcome;
import app.noam.extension.chesscom.theme.Recolor;

public final class Utils {
    public static final String TAG = "MorpheChessCom";

    private static Application application;
    private static String resourcePackage;
    private static WeakReference<Activity> resumedActivity = new WeakReference<>(null);
    private static final List<WeakReference<Activity>> LIVE_ACTIVITIES = new ArrayList<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private Utils() {}

    /** Called by the patches at the start of MainApplication.onCreate(). */
    public static void onApplicationCreate(Application app) {
        if (application != null || app == null) return;
        application = app;
        app.registerActivityLifecycleCallbacks(new ActivityTracker());
    }

    public static Context context() {
        return application;
    }

    public static Activity resumedActivity() {
        return resumedActivity.get();
    }

    /** The resumed activity, else the newest one still alive (one being created), or null. */
    public static Activity topActivity() {
        Activity resumed = resumedActivity.get();
        if (resumed != null) return resumed;
        synchronized (LIVE_ACTIVITIES) {
            for (int i = LIVE_ACTIVITIES.size() - 1; i >= 0; i--) {
                Activity activity = LIVE_ACTIVITIES.get(i).get();
                if (activity != null && !activity.isFinishing()) return activity;
            }
        }
        return null;
    }

    public static Activity activityOwning(Object fragmentManager) {
        if (fragmentManager == null) return null;
        synchronized (LIVE_ACTIVITIES) {
            for (WeakReference<Activity> reference : LIVE_ACTIVITIES) {
                Activity activity = reference.get();
                if (activity == null) continue;
                try {
                    Method getter = activity.getClass().getMethod("getSupportFragmentManager");
                    if (getter.invoke(activity) == fragmentManager) return activity;
                } catch (Throwable ignored) {
                    // Not a FragmentActivity.
                }
            }
        }
        return null;
    }

    /** A short toast on the main thread; never throws. */
    public static void toast(CharSequence text) {
        if (application == null || text == null || text.length() == 0) return;
        Runnable show = () -> {
            try {
                Toast.makeText(application, text, Toast.LENGTH_SHORT).show();
            } catch (Throwable t) {
                logError("toast failed", t);
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) show.run();
        else MAIN.post(show);
    }

    public static String appString(String name, String fallback) {
        Context c = application;
        if (c == null) return fallback;
        try {
            int id = c.getResources().getIdentifier(name, "string", resourcePackage(c));
            return id == 0 ? fallback : c.getString(id);
        } catch (Throwable t) {
            return fallback;
        }
    }

    public static int resourceId(String name, String type) {
        Context c = application;
        if (c == null) return 0;
        return c.getResources().getIdentifier(name, type, resourcePackage(c));
    }

    /** The package the app's resources live under, which a renamed clone may keep as com.chess. */
    public static String resourcePackage(Context c) {
        if (resourcePackage == null) {
            String name = c.getPackageName();
            try {
                int label = c.getApplicationInfo().labelRes;
                if (label != 0) name = c.getResources().getResourcePackageName(label);
            } catch (Throwable ignored) {
                // The package's own name, then.
            }
            resourcePackage = name;
        }
        return resourcePackage;
    }

    public static int dp(float value) {
        Context c = application;
        float density = c == null ? 2.75f : c.getResources().getDisplayMetrics().density;
        return Math.round(value * density);
    }

    public static void log(String message) {
        Log.d(TAG, message);
    }

    public static void logError(String message, Throwable throwable) {
        Log.e(TAG, message, throwable);
    }

    private static final class ActivityTracker implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            synchronized (LIVE_ACTIVITIES) {
                LIVE_ACTIVITIES.add(new WeakReference<>(activity));
            }
            try {
                Recolor.onActivityCreated(activity);
            } catch (Throwable throwable) {
                logError("Recolouring failed", throwable);
            }
        }

        @Override
        public void onActivityStarted(Activity activity) {}

        @Override
        public void onActivityResumed(Activity activity) {
            resumedActivity = new WeakReference<>(activity);
            Welcome.onScreenShown(activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (resumedActivity.get() == activity) resumedActivity = new WeakReference<>(null);
        }

        @Override
        public void onActivityStopped(Activity activity) {}

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}

        @Override
        public void onActivityDestroyed(Activity activity) {
            synchronized (LIVE_ACTIVITIES) {
                Iterator<WeakReference<Activity>> iterator = LIVE_ACTIVITIES.iterator();
                while (iterator.hasNext()) {
                    Activity live = iterator.next().get();
                    if (live == null || live == activity) iterator.remove();
                }
            }
        }
    }
}
