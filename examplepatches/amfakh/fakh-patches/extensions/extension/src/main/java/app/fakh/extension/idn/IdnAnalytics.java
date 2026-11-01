package app.fakh.extension.idn;

import android.app.Application;
import android.content.Context;
import android.util.Log;

/** Switches the SDKs off that have no manifest switch. The SDK classes are reached by name, since the extension does not link to them. */
@SuppressWarnings("unused")
public final class IdnAnalytics {
    private IdnAnalytics() {
    }

    private static Application application() throws ReflectiveOperationException {
        return (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
    }

    /** Stops AppsFlyer for good: a stopped SDK sends nothing and ignores start(). */
    public static void stopAppsFlyer() {
        try {
            Class<?> lib = Class.forName("com.appsflyer.AppsFlyerLib");
            Object instance = lib.getMethod("getInstance").invoke(null);
            lib.getMethod("stop", boolean.class, Context.class).invoke(instance, true, application());
        } catch (Throwable t) {
            Log.w(IdnSettings.TAG, "Could not stop AppsFlyer", t);
        }
    }

    /** Opts the user out of CleverTap: events and profile data are no longer recorded, push and popups still work. */
    public static void optOutCleverTap() {
        try {
            Class<?> api = Class.forName("com.clevertap.android.sdk.CleverTapAPI");
            Object instance = api.getMethod("getDefaultInstance", Context.class).invoke(null, application());
            if (instance != null) api.getMethod("setOptOut", boolean.class).invoke(instance, true);
        } catch (Throwable t) {
            Log.w(IdnSettings.TAG, "Could not opt out of CleverTap", t);
        }
    }
}
