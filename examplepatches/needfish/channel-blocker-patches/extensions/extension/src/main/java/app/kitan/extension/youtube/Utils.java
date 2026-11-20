package app.kitan.extension.youtube;

import android.content.Context;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Helpers for resolving the current app context/activity.
 *
 * The base Morphe bundle extension provides its own context holder, but this
 * add-on stays self-contained: the context is resolved from the ActivityThread
 * singleton, which works whether or not the base bundle is loaded first.
 */
final class Utils {

    private static Context appContext;

    private Utils() {
    }

    public static Context getContext() {
        Context context = appContext;
        if (context != null) {
            return context;
        }
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method currentActivityThread = activityThread.getDeclaredMethod("currentActivityThread");
            currentActivityThread.setAccessible(true);
            Object current = currentActivityThread.invoke(null);
            if (current == null) {
                return null;
            }
            Method getApplication = activityThread.getDeclaredMethod("getApplication");
            getApplication.setAccessible(true);
            Object app = getApplication.invoke(current);
            if (app instanceof Context) {
                appContext = (Context) app;
                return appContext;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Could not resolve app context", ex);
        }
        return null;
    }

    public static android.app.Activity getActivity() {
        // Walk the current activity from the base bundle when available,
        // otherwise fall back to the app context.
        try {
            Class<?> clazz = Class.forName("app.morphe.extension.shared.Utils");
            Method method = clazz.getDeclaredMethod("getActivity");
            method.setAccessible(true);
            Object result = method.invoke(null);
            if (result instanceof android.app.Activity) {
                return (android.app.Activity) result;
            }
        } catch (Exception ignored) {
        }
        return null;
    }
}
