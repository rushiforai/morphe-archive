package de.robv.android.xposed.callbacks;

import android.content.pm.ApplicationInfo;

/**
 * Compile-only stub mirroring the legacy Xposed API shipped by LSPosed 1.9.x.
 * Only the members used by this module are declared; field names and types
 * must match the runtime class exactly (bytecode-level linkage).
 */
public abstract class XC_LoadPackage {

    public static class LoadPackageParam {

        /** The name of the package being loaded. */
        public String packageName;

        /** The process in which the package is executed. */
        public String processName;

        /** The ClassLoader used for this package. */
        public ClassLoader classLoader;

        /** More information about the application being loaded. */
        public ApplicationInfo appInfo;

        /** Set to true if this is the first (and main) application for this process. */
        public boolean isFirstApplication;
    }
}
