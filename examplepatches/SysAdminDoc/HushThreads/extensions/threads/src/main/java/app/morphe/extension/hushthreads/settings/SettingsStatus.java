/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.hushthreads.settings;

/**
 * Which patches were selected for this build.
 *
 * <p>Every feature method answers false here. A patch that adds a feature rewrites its method to answer
 * true, so the settings screen offers only the switches this APK backs and the diagnostic report
 * lists only the patches it carries.
 */
@SuppressWarnings({"unused", "SameReturnValue"})
public final class SettingsStatus {
    private SettingsStatus() {
    }

    public static boolean hideAds() {
        return false;
    }

    public static boolean hideSuggestedUsers() {
        return false;
    }

    public static boolean returnRefresh() {
        return false;
    }

    public static boolean disableVideoAutoplay() {
        return false;
    }

    public static boolean sanitizeSharingLinks() {
        return false;
    }

    public static boolean openLinksExternally() {
        return false;
    }

    public static boolean disableAnalytics() {
        return false;
    }

    /** Patched address kinds: PIGEON=1, DEFAULT=2, MQTT=4. Zero means coverage wasn't recorded. */
    public static int analyticsAddressMask() {
        return 0;
    }

    public static boolean removeAdId() {
        return false;
    }

    public static boolean restoreTrust() {
        return false;
    }
}
