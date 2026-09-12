package app.fdroidbackends.extension;

import android.content.Context;
import android.content.SharedPreferences;

/** Storage for the selected install backend. Lives outside org.fdroid.fdroid.* on purpose: it
 * doesn't need package-private access to anything, unlike the Installer subclasses. */
public final class InstallBackendPrefs {
    public static final String PREFS_NAME = "fdroidbackends";
    public static final String KEY_MODE = "installBackendMode";
    public static final String KEY_CUSTOM_PACKAGE = "installBackendCustomPackage";

    public static final String MODE_SYSTEM = "system";
    public static final String MODE_SHIZUKU = "shizuku";
    public static final String MODE_INSTALLERX = "installerx";
    public static final String MODE_CUSTOM = "custom";

    public static final String DEFAULT_INSTALLERX_PACKAGE = "com.rosan.installer.x.revived";

    private InstallBackendPrefs() {
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    public static String getMode(Context context) {
        return prefs(context).getString(KEY_MODE, MODE_SYSTEM);
    }

    public static void setMode(Context context, String mode) {
        prefs(context).edit().putString(KEY_MODE, mode).apply();
    }

    public static String getCustomPackage(Context context) {
        return prefs(context).getString(KEY_CUSTOM_PACKAGE, "");
    }

    public static void setCustomPackage(Context context, String packageName) {
        prefs(context).edit().putString(KEY_CUSTOM_PACKAGE, packageName).apply();
    }

    /** Resolves the target package to route installs to for the current mode, or null for modes
     * (system, shizuku) that don't target an external installer package. */
    public static String resolveTargetPackage(Context context) {
        String mode = getMode(context);
        if (MODE_INSTALLERX.equals(mode)) {
            return DEFAULT_INSTALLERX_PACKAGE;
        }
        if (MODE_CUSTOM.equals(mode)) {
            String custom = getCustomPackage(context);
            return custom == null || custom.isEmpty() ? null : custom;
        }
        return null;
    }
}
