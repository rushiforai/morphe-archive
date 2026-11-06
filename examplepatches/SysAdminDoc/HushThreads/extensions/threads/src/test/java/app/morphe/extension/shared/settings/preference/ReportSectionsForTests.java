/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.shared.settings.preference;

/**
 * The diagnostic report's registered sections, for a test in another package. {@link LogBufferManager}
 * keeps these hooks package-private, and what registers its sections lives in the Threads packages.
 */
public final class ReportSectionsForTests {
    private ReportSectionsForTests() {
    }

    /** Forgets every registered section, as in a new process. */
    public static void clear() {
        LogBufferManager.clearReportSectionsForTests();
    }

    /** The sections a crash report keeps, as {@link JavaCrashReport} reads them. */
    public static String keptWithACrash() {
        return LogBufferManager.patchSectionsText();
    }
}
