package local.maps.cluster;

import android.app.*;
import android.content.*;
import android.content.res.*;
import android.os.*;

/** Google Maps chooses its own UI language (its language setting, else the system's); this app's panel stays English. */
public final class AppLanguage {
    /** The cluster projection uses the same language as the running app. */
    public static void configure(Configuration config) {
        LocaleList locales = LocaleList.getDefault();
        config.setLocales(locales);
        if (!locales.isEmpty()) config.setLayoutDirection(locales.get(0));
    }
    /** Application.attachBaseContext hook: no longer forces English; wakes a stopped microG before Maps' first binds. */
    public static Context wrap(Context base) { MicrogWakeup.early(base); return base; }
    /** Kept for the Application.onCreate hook; Maps' own language handling applies unchanged. */
    public static void install(Application app) {}
}
