package biz.kushan.ltkey;

import android.app.Application;
import android.content.Context;

/**
 * Side-by-side support (process identity).
 *
 * SmartThings hardcodes its process identity to the original package: {@code ProcessConfig} compares
 * the running process name against baked-in literals like
 * {@code "com.samsung.android.oneconnect:Core"} and {@code BuildConfig.APPLICATION_ID}. When the app
 * is renamed so it can install next to stock, its processes become {@code "<clone>:Core"} etc., so
 * every "which process am I" check returns UNKNOWN and the app throws
 * {@code IllegalStateException: not core process} on launch (and the main process fails WorkManager
 * init).
 *
 * This replaces {@code ContextUtil.getCurrentProcessName(Context)} — the single source those checks
 * read — returning the real process name with the clone's application id mapped back to the original
 * package. ProcessConfig then sees exactly what it expects, with the manifest process names left
 * untouched (renaming them in the manifest trips an Android install-parser bug).
 */
public final class DtProc {

    /** What ProcessConfig and BuildConfig.APPLICATION_ID expect the process names to be based on. */
    private static final String ORIGINAL_PACKAGE = "com.samsung.android.oneconnect";

    /**
     * Injected to replace {@code ContextUtil.getCurrentProcessName(Context)}.
     * Maps {@code <clone>} -> {@code com.samsung.android.oneconnect} and
     * {@code <clone>:suffix} -> {@code com.samsung.android.oneconnect:suffix}.
     */
    public static String currentProcessName(Context context) {
        String real = realProcessName();
        if (real == null) {
            // Can't tell the process — assume main; better than UNKNOWN, which disables core init.
            return ORIGINAL_PACKAGE;
        }
        String pkg = null;
        try {
            if (context != null) pkg = context.getPackageName();
        } catch (Throwable ignored) {
        }
        if (pkg == null || pkg.length() == 0) return real;
        if (real.equals(pkg)) return ORIGINAL_PACKAGE;
        if (real.startsWith(pkg + ":")) return ORIGINAL_PACKAGE + real.substring(pkg.length());
        return real; // already not a clone-package process name — leave it as-is
    }

    private static String realProcessName() {
        try {
            String name = Application.getProcessName(); // static, API 28+ (app minSdk 31)
            if (name != null && name.length() > 0) return name;
        } catch (Throwable ignored) {
        }
        return null;
    }

    private DtProc() {
    }
}
