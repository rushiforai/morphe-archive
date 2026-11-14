package app.morphe.extension.mapsautomotive.android9;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * Android 10's activity lifecycle callbacks on Android 9. Android 10 added per-activity callbacks
 * (Activity.registerActivityLifecycleCallbacks) and pre/post events (onActivityPreCreated, onActivityPostStarted, ...).
 * AndroidX's lifecycle (ReportFragment, ProcessLifecycleOwner) uses only those on Android 10, and R8 removed its
 * Android 9 path from Maps, so without them no Compose screen or LifecycleOwner would get past "initialized".
 * <p>
 * On Android 9 both go through the Application's callbacks: a per-activity callback becomes an Application callback
 * that only passes on that activity's events, and an Application callback that implements pre/post methods is
 * wrapped. Each Android 9 event (sent from inside the activity's onCreate, onStart, ... through super) becomes the
 * pre event, the event and the post event, in that order. A per-activity callback registered after its activity's
 * created event (AndroidX registers in onCreate, after super.onCreate) gets its post-created event right before the
 * next event. The pre/post methods are called through reflection, on the callback's own class only: Android 9's
 * interface does not have them.
 */
final class LifecycleBridge {
    static final String PRE_CREATED = "onActivityPreCreated", POST_CREATED = "onActivityPostCreated";
    static final String PRE_STARTED = "onActivityPreStarted", POST_STARTED = "onActivityPostStarted";
    static final String PRE_RESUMED = "onActivityPreResumed", POST_RESUMED = "onActivityPostResumed";
    static final String PRE_PAUSED = "onActivityPrePaused", POST_PAUSED = "onActivityPostPaused";
    static final String PRE_STOPPED = "onActivityPreStopped", POST_STOPPED = "onActivityPostStopped";
    static final String PRE_SAVE = "onActivityPreSaveInstanceState", POST_SAVE = "onActivityPostSaveInstanceState";
    static final String PRE_DESTROYED = "onActivityPreDestroyed", POST_DESTROYED = "onActivityPostDestroyed";
    private static final String[] WITH_BUNDLE = {PRE_CREATED, POST_CREATED, PRE_SAVE, POST_SAVE};
    private static final String[] WITHOUT_BUNDLE = {PRE_STARTED, POST_STARTED, PRE_RESUMED, POST_RESUMED, PRE_PAUSED,
            POST_PAUSED, PRE_STOPPED, POST_STOPPED, PRE_DESTROYED, POST_DESTROYED};
    private static final Method NONE;
    private static final Map<Class<?>, Map<String, Method>> methods = new HashMap<>();
    private static final Map<Application.ActivityLifecycleCallbacks, ApplicationWide> wrappers = new HashMap<>();

    static {
        try {
            NONE = Object.class.getMethod("hashCode");
        } catch (NoSuchMethodException exception) {
            throw new IllegalStateException(exception);
        }
    }

    private LifecycleBridge() {
    }

    /** The callback class's own public method for an Android 10 event, or null. */
    private static Method method(Class<?> type, String name, boolean withBundle) {
        synchronized (methods) {
            Map<String, Method> known = methods.get(type);
            if (known == null) {
                known = new HashMap<>();
                methods.put(type, known);
            }
            Method method = known.get(name);
            if (method == null) {
                try {
                    method = withBundle ? type.getMethod(name, Activity.class, Bundle.class) : type.getMethod(name, Activity.class);
                    method.setAccessible(true);
                } catch (NoSuchMethodException | SecurityException exception) {
                    method = NONE;
                }
                known.put(name, method);
            }
            return method == NONE ? null : method;
        }
    }

    static boolean implementsAny(Class<?> type) {
        for (String name : WITH_BUNDLE) if (method(type, name, true) != null) return true;
        for (String name : WITHOUT_BUNDLE) if (method(type, name, false) != null) return true;
        return false;
    }

    /** Calls the Android 10 event on the callback if its class implements it, as a direct call would. */
    static void dispatch(Application.ActivityLifecycleCallbacks callback, String name, Activity activity) {
        invoke(callback, method(callback.getClass(), name, false), activity, null, false);
    }

    static void dispatch(Application.ActivityLifecycleCallbacks callback, String name, Activity activity, Bundle bundle) {
        invoke(callback, method(callback.getClass(), name, true), activity, bundle, true);
    }

    private static void invoke(Object callback, Method method, Activity activity, Bundle bundle, boolean withBundle) {
        if (method == null) return;
        try {
            if (withBundle) method.invoke(callback, activity, bundle);
            else method.invoke(callback, activity);
        } catch (InvocationTargetException exception) {
            Throwable cause = exception.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new IllegalStateException(cause);
        } catch (IllegalAccessException exception) {
            throw new IllegalStateException(exception);
        }
    }

    static void registerForActivity(Activity activity, Application.ActivityLifecycleCallbacks callback) {
        activity.getApplication().registerActivityLifecycleCallbacks(new ActivityScoped(activity, callback));
    }

    static void registerApplicationWide(Application application, Application.ActivityLifecycleCallbacks callback) {
        if (callback == null || !implementsAny(callback.getClass())) {
            application.registerActivityLifecycleCallbacks(callback);
            return;
        }
        ApplicationWide wrapper = new ApplicationWide(callback);
        synchronized (wrappers) {
            wrappers.put(callback, wrapper);
        }
        application.registerActivityLifecycleCallbacks(wrapper);
    }

    static void unregisterApplicationWide(Application application, Application.ActivityLifecycleCallbacks callback) {
        ApplicationWide wrapper;
        synchronized (wrappers) {
            wrapper = wrappers.remove(callback);
        }
        application.unregisterActivityLifecycleCallbacks(wrapper != null ? wrapper : callback);
    }

    /** An Application callback with Android 10 pre/post methods. */
    private static final class ApplicationWide implements Application.ActivityLifecycleCallbacks {
        private final Application.ActivityLifecycleCallbacks callback;

        ApplicationWide(Application.ActivityLifecycleCallbacks callback) {
            this.callback = callback;
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            dispatch(callback, PRE_CREATED, activity, savedInstanceState);
            callback.onActivityCreated(activity, savedInstanceState);
            dispatch(callback, POST_CREATED, activity, savedInstanceState);
        }

        @Override
        public void onActivityStarted(Activity activity) {
            dispatch(callback, PRE_STARTED, activity);
            callback.onActivityStarted(activity);
            dispatch(callback, POST_STARTED, activity);
        }

        @Override
        public void onActivityResumed(Activity activity) {
            dispatch(callback, PRE_RESUMED, activity);
            callback.onActivityResumed(activity);
            dispatch(callback, POST_RESUMED, activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
            dispatch(callback, PRE_PAUSED, activity);
            callback.onActivityPaused(activity);
            dispatch(callback, POST_PAUSED, activity);
        }

        @Override
        public void onActivityStopped(Activity activity) {
            dispatch(callback, PRE_STOPPED, activity);
            callback.onActivityStopped(activity);
            dispatch(callback, POST_STOPPED, activity);
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
            dispatch(callback, PRE_SAVE, activity, outState);
            callback.onActivitySaveInstanceState(activity, outState);
            dispatch(callback, POST_SAVE, activity, outState);
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            dispatch(callback, PRE_DESTROYED, activity);
            callback.onActivityDestroyed(activity);
            dispatch(callback, POST_DESTROYED, activity);
        }
    }

    /** A per-activity callback, as an Application callback that passes on only that activity's events. */
    private static final class ActivityScoped implements Application.ActivityLifecycleCallbacks {
        private final Activity activity;
        private final Application.ActivityLifecycleCallbacks callback;
        private boolean created;

        ActivityScoped(Activity activity, Application.ActivityLifecycleCallbacks callback) {
            this.activity = activity;
            this.callback = callback;
        }

        private void ensureCreated() {
            if (created) return;
            created = true;
            dispatch(callback, POST_CREATED, activity, null);
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            if (activity != this.activity) return;
            created = true;
            dispatch(callback, PRE_CREATED, activity, savedInstanceState);
            callback.onActivityCreated(activity, savedInstanceState);
            dispatch(callback, POST_CREATED, activity, savedInstanceState);
        }

        @Override
        public void onActivityStarted(Activity activity) {
            if (activity != this.activity) return;
            ensureCreated();
            dispatch(callback, PRE_STARTED, activity);
            callback.onActivityStarted(activity);
            dispatch(callback, POST_STARTED, activity);
        }

        @Override
        public void onActivityResumed(Activity activity) {
            if (activity != this.activity) return;
            ensureCreated();
            dispatch(callback, PRE_RESUMED, activity);
            callback.onActivityResumed(activity);
            dispatch(callback, POST_RESUMED, activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
            if (activity != this.activity) return;
            ensureCreated();
            dispatch(callback, PRE_PAUSED, activity);
            callback.onActivityPaused(activity);
            dispatch(callback, POST_PAUSED, activity);
        }

        @Override
        public void onActivityStopped(Activity activity) {
            if (activity != this.activity) return;
            ensureCreated();
            dispatch(callback, PRE_STOPPED, activity);
            callback.onActivityStopped(activity);
            dispatch(callback, POST_STOPPED, activity);
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
            if (activity != this.activity) return;
            ensureCreated();
            dispatch(callback, PRE_SAVE, activity, outState);
            callback.onActivitySaveInstanceState(activity, outState);
            dispatch(callback, POST_SAVE, activity, outState);
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            if (activity != this.activity) return;
            ensureCreated();
            dispatch(callback, PRE_DESTROYED, activity);
            callback.onActivityDestroyed(activity);
            dispatch(callback, POST_DESTROYED, activity);
            activity.getApplication().unregisterActivityLifecycleCallbacks(this);
        }
    }
}
