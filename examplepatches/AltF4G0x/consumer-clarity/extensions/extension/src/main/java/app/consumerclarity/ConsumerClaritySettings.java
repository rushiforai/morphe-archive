package app.consumerclarity;

import android.content.Context;
import android.content.SharedPreferences;

public final class ConsumerClaritySettings {
    private static final String PREFS = "consumerclarity";
    private static volatile SharedPreferences preferences;
    private static volatile Context application;

    private ConsumerClaritySettings() {}

    public static SharedPreferences get(Context context) {
        SharedPreferences current = preferences;
        if (current == null) {
            synchronized (ConsumerClaritySettings.class) {
                current = preferences;
                if (current == null) {
                    current = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
                    preferences = current;
                }
            }
        }
        return current;
    }

    private static Context appContext() {
        Context current = application;
        if (current == null) {
            try {
                current = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
                application = current;
            } catch (ReflectiveOperationException error) {
                throw new IllegalStateException(error);
            }
        }
        return current;
    }

    public static boolean enabled(String key) {
        Context context = appContext();
        return context == null || get(context).getBoolean(key, true);
    }

    public static boolean reduceTracking() {
        Context context = appContext();
        return context == null || reduceTracking(context);
    }

    public static boolean hideBrazePopups() {
        Context context = appContext();
        return context == null || hideBrazePopups(context);
    }

    public static boolean disableLicenseGate() {
        Context context = appContext();
        return context == null || disableLicenseGate(context);
    }

    public static boolean openLinksExternally() {
        Context context = appContext();
        return context != null && openLinksExternally(context);
    }

    public static boolean reduceTracking(Context context) {
        return get(context).getBoolean("reduce_tracking", true);
    }

    public static boolean hideBrazePopups(Context context) {
        return get(context).getBoolean("hide_braze_popups", true);
    }

    public static boolean disableLicenseGate(Context context) {
        return get(context).getBoolean("disable_license_gate", true);
    }

    public static boolean openLinksExternally(Context context) {
        return get(context).getBoolean("open_links_externally", false);
    }
}
