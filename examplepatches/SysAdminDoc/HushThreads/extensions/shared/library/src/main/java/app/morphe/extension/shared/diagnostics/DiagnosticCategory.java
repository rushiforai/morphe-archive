/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.shared.diagnostics;

public enum DiagnosticCategory {
    CRASH_REPORTS("crash"),
    FEED("feed"),
    SETTINGS("settings"),
    PATCH_ERRORS("errors"),
    OTHER("other");

    public final String value;

    DiagnosticCategory(String value) {
        this.value = value;
    }
}
