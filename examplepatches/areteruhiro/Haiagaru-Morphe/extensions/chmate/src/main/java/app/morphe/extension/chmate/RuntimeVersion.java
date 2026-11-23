package app.morphe.extension.chmate;

import android.content.Context;
import android.content.pm.PackageInfo;

/** Optional process-local reuse for repeated hot-path package version checks. */
final class RuntimeVersion {
    static final String OPTIMIZE = "optimizeRuntimeVersionLookup";

    private static volatile Snapshot cached;

    private static final class Snapshot {
        final String packageName;
        final String versionName;
        Snapshot(String packageName, String versionName) {
            this.packageName = packageName;
            this.versionName = versionName;
        }
    }

    static String get(Context context) {
        if (context == null) return null;
        Context app = context.getApplicationContext();
        if (app != null) context = app;
        String packageName = context.getPackageName();
        if (!SettingsProfiles.prefs(context).getBoolean(OPTIMIZE, true))
            return read(context);
        Snapshot value = cached;
        if (value != null && packageName.equals(value.packageName)) return value.versionName;
        synchronized (RuntimeVersion.class) {
            value = cached;
            if (value != null && packageName.equals(value.packageName)) return value.versionName;
            String versionName = read(context);
            if (versionName != null) cached = new Snapshot(packageName, versionName);
            return versionName;
        }
    }

    private static String read(Context context) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            return info == null ? null : info.versionName;
        } catch (Exception unavailable) {
            return null;
        }
    }

    private RuntimeVersion() {}
}
