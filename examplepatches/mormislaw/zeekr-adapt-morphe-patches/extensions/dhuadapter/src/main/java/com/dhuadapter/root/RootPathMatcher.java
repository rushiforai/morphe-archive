package com.dhuadapter.root;

/**
 * Pure, dependency-free root-path matching (no android / Pine imports) so it is
 * unit-testable on a bare JVM. Used by the File.exists hook in RootBypass.
 *
 * ICU-free by design: no String.toLowerCase (that touches locale/ICU which can
 * be uninitialised at pre-Application start and was part of the Telegram
 * SIGSEGV). Matches common su / root-manager artefacts by ASCII
 * case-insensitive substring via a manual scan.
 */
public final class RootPathMatcher {

    private RootPathMatcher() {}

    /** True if the path looks like a su binary / root-manager artefact. */
    public static boolean isRootPath(String path) {
        if (path == null) {
            return false;
        }
        return containsIgnoreCase(path, "/su")
                || containsIgnoreCase(path, "magisk")
                || containsIgnoreCase(path, "superuser")
                || containsIgnoreCase(path, "supersu")
                || containsIgnoreCase(path, "daemonsu")
                || containsIgnoreCase(path, "busybox")
                || containsIgnoreCase(path, "/xbin/");
    }

    /** ASCII case-insensitive substring — no String.toLowerCase (no ICU/locale). */
    public static boolean containsIgnoreCase(String hay, String needle) {
        int n = needle.length();
        int max = hay.length() - n;
        for (int i = 0; i <= max; i++) {
            boolean ok = true;
            for (int j = 0; j < n; j++) {
                char a = hay.charAt(i + j);
                char b = needle.charAt(j);
                if (a >= 'A' && a <= 'Z') { a += 32; }
                if (b >= 'A' && b <= 'Z') { b += 32; }
                if (a != b) { ok = false; break; }
            }
            if (ok) { return true; }
        }
        return false;
    }
}
