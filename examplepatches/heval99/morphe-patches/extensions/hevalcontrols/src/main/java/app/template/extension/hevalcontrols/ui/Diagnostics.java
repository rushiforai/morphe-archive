package app.template.extension.hevalcontrols.ui;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Build;

import app.template.extension.hevalcontrols.CrashGuard;
import app.template.extension.hevalcontrols.Feature;
import app.template.extension.hevalcontrols.HevalSettings;
import app.template.extension.hevalcontrols.Registry;

/**
 * The "Copy diagnostics" report. Privacy-safe by construction: versions, device model, flags and
 * feature states only. Failures are an exception class and an extension frame, never a message.
 * No account, content, file path or identifier of the user is included. List settings are counts
 * only: never the picked keys or the option labels.
 */
final class Diagnostics {
    static String report(Context context) {
        Registry registry = Registry.get();
        StringBuilder out = new StringBuilder(1024);
        out.append("Patch settings diagnostics\n");
        line(out, "app", context.getPackageName() + " " + runningVersion(context));
        line(out, "patched_for", orUnknown(Registry.patchedAppVersion()));
        line(out, "bundle", orUnknown(Registry.bundleVersion()));
        line(out, "android", Build.VERSION.RELEASE + " (SDK " + Build.VERSION.SDK_INT + ")");
        line(out, "device", Build.MANUFACTURER + " " + Build.MODEL);
        line(out, "registry", "v" + registry.decoded.version + (registry.decoded.supported ? "" : " unsupported")
                + ", " + registry.features().size() + " features, " + registry.decoded.skipped + " skipped");
        line(out, "engine", (HevalSettings.isReady() ? "ready" : "not initialised") + " via " + HevalSettings.initSource()
                + (HevalSettings.isEngineFailed() ? ", failed: " + HevalSettings.engineError() : ""));
        line(out, "paused", String.valueOf(HevalSettings.isPaused()));
        line(out, "safe_mode", String.valueOf(HevalSettings.isSafeMode()));
        line(out, "crash_streak", String.valueOf(CrashGuard.crashStreak()));
        line(out, "restart_pending", String.valueOf(HevalSettings.pendingRestartCount()));
        out.append("features:\n");
        for (Feature feature : registry.features()) {
            out.append("  ").append(feature.id).append(": ").append(HevalSettings.stateOf(feature).name().toLowerCase(java.util.Locale.ROOT));
            if (feature.isList()) {
                out.append(", list, picked=").append(HevalSettings.pickedHidden(feature.id).size())
                        .append(", hidden_now=").append(HevalSettings.getHidden(feature.id).size())
                        .append(", options=").append(HevalSettings.options(feature.id).size());
            } else {
                out.append(", chosen=").append(HevalSettings.isChosen(feature.id))
                        .append(", default=").append(feature.defaultEnabled);
            }
            if (feature.restartRequired) out.append(", restart");
            String failure = HevalSettings.failureOf(feature.id);
            if (failure != null) out.append(", failure=").append(failure);
            String missing = HevalSettings.missingDependency(feature);
            if (missing != null) out.append(", missing=").append(missing);
            out.append('\n');
        }
        return out.toString();
    }

    @SuppressWarnings("deprecation")
    static String runningVersion(Context context) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            long code = Build.VERSION.SDK_INT >= 28 ? info.getLongVersionCode() : info.versionCode;
            return info.versionName + " (" + code + ")";
        } catch (Throwable unavailable) {
            return "unknown";
        }
    }

    static String orUnknown(String value) {
        return value == null || value.isEmpty() ? "unknown" : value;
    }

    private static void line(StringBuilder out, String key, String value) {
        out.append(key).append(": ").append(value).append('\n');
    }

    private Diagnostics() { }
}
