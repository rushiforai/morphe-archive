package app.sledgesune.extension.syncme;

import android.content.Context;
import android.util.Log;

import java.lang.reflect.Method;

@SuppressWarnings("unused")
public final class DisableTrackingPatch {

    private static final String TAG = "DisableTrackingPatch";

    /**
     * Injection point. Replaces Analytics.init().
     * Turns off collection inside the Firebase and Facebook SDKs, which the app also calls directly.
     * Reflection is used so the extension does not need the SDKs on its compile classpath.
     */
    public static void disableSdkCollection(Context context) {
        // FirebaseAnalytics.getInstance(context).setAnalyticsCollectionEnabled(false)
        try {
            Class<?> firebase = Class.forName("com.google.firebase.analytics.FirebaseAnalytics");
            Object instance = firebase.getMethod("getInstance", Context.class).invoke(null, context);
            firebase.getMethod("setAnalyticsCollectionEnabled", boolean.class).invoke(instance, false);
        } catch (Throwable t) {
            Log.w(TAG, "Firebase Analytics not disabled", t);
        }

        // FacebookSdk.setAutoLogAppEventsEnabled(false) / setAdvertiserIDCollectionEnabled(false)
        try {
            Class<?> facebook = Class.forName("com.facebook.FacebookSdk");
            invokeStatic(facebook, "setAutoLogAppEventsEnabled");
            invokeStatic(facebook, "setAdvertiserIDCollectionEnabled");
        } catch (Throwable t) {
            Log.w(TAG, "Facebook app events not disabled", t);
        }
    }

    private static void invokeStatic(Class<?> clazz, String name) throws Exception {
        Method method = clazz.getMethod(name, boolean.class);
        method.invoke(null, false);
    }
}
