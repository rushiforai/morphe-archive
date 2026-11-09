package app.fblite.extension.clone;

import android.content.Context;

/**
 * Clone installs only (package name changed by the "Clone install" patch). Called by MorpheSettings at the very
 * start of Application.attachBaseContext, before the app loads its code.
 */
public final class CloneSupport {
    /** The package the patched app was built from. */
    static final String ORIGINAL = "com.facebook.lite";

    private CloneSupport() {
    }

    public static Context wrap(Context base) {
        try {
            if (!ORIGINAL.equals(base.getPackageName())) {
                CloneDexFix.apply(base);
                CloneGuard.install();
                CloneGuard.keepInstalled();
            }
        } catch (Throwable ignored) {
            // Never break app startup.
        }
        return base;
    }
}
