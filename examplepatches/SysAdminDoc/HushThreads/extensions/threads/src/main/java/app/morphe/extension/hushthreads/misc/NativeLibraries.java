/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.misc;

import android.content.Context;
import android.content.pm.ApplicationInfo;

/**
 * Helper for keeping the native libraries of a merged build loadable.
 *
 * <p>Threads asks SoLoader to load its libraries straight out of the APK. The ARMv7 and x86 bundles
 * whose base manifest asks for extracted libraries merge into one APK whose libraries are compressed,
 * so that read throws and Threads crashes on launch. Android has already extracted them on such a
 * build, and SoLoader falls back to that folder once it isn't asked for the direct read.
 *
 * <p>This runs on SoLoader's own thread, before the extension has a context and before any
 * HushThreads setting can be read, so it reads no switch, logs nothing and Pause doesn't change it.
 */
public final class NativeLibraries {
    /** SoLoader's flag for loading libraries straight out of the APK. */
    static final int DIRECT_APK_LOADING = 0x400;

    private NativeLibraries() {
    }

    /**
     * The flags SoLoader should start with: {@code flags} without the direct read on a single APK
     * Android extracts libraries from, and as they came everywhere else, split installs included.
     */
    public static int soLoaderFlags(Context context, int flags) {
        if ((flags & DIRECT_APK_LOADING) == 0 || context == null) return flags;
        ApplicationInfo info = context.getApplicationInfo();
        boolean extracted = (info.flags & ApplicationInfo.FLAG_EXTRACT_NATIVE_LIBS) != 0;
        return extracted && info.splitSourceDirs == null ? flags & ~DIRECT_APK_LOADING : flags;
    }
}
