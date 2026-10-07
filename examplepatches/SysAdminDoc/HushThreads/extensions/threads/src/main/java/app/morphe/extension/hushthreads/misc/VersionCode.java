/*
 * Forked from https://github.com/SysAdminDoc/HushGram at b0a3eca5 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.extension.hushthreads.misc;

import android.content.pm.PackageInfo;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Change version code" patch.
 *
 * <p>The patch raises the version code in Threads' manifest so Google Play stops offering Meta's
 * updates over the patched build. Threads reads its own version code back: it compares it with the
 * code built into its own dex at start and in its job scheduler, and puts it in its logs and crash
 * reports. The patch sends each of those reads, the ones it can prove ask about Threads' own
 * package, through here, so they see the code Meta built.
 *
 * <p>These reads start in the application's own start, before HushThreads' settings can be read, so
 * nothing here reads a switch, and Pause doesn't change it: the manifest was changed when you
 * patched. A code other than the raised one passes through as it is.
 */
@SuppressWarnings("deprecation")
public final class VersionCode {
    private VersionCode() {
    }

    /**
     * In place of Threads' own read of {@code info.versionCode}. Throws only where that read would,
     * on a null {@code info}.
     */
    public static int read(PackageInfo info) {
        int code = info.versionCode;
        try {
            HookStatus.invoked(FamilyNames.VERSION_CODE);
            return code == raised() ? real() : code;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VERSION_CODE, "version code read", failure);
            return code;
        }
    }

    /** In place of Threads' own {@code info.getLongVersionCode()}, the same way as {@link #read}. */
    public static long readLong(PackageInfo info) {
        long code = info.getLongVersionCode();
        try {
            HookStatus.invoked(FamilyNames.VERSION_CODE);
            return code == raised() ? real() : code;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VERSION_CODE, "long version code read", failure);
            return code;
        }
    }

    /** The version code Meta built this Threads with. The patch fills it in; 0 without it. */
    static int real() {
        return 0;
    }

    /** The version code the patched manifest carries. The patch fills it in; 0 without it. */
    static int raised() {
        return 0;
    }
}
