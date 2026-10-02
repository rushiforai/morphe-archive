/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushtelegram.extension.telegram.settings;

/**
 * Which patches and individual targets this build carries.
 *
 * <p>Every method answers false here. A patch that adds a feature rewrites its method to answer
 * true, so the settings screen offers only the switches this APK backs and the diagnostic report
 * lists only the patches it carries. Target flags are set only after their hook was inserted.
 * These are build facts, not preferences: Pause, switch changes and settings imports don't alter
 * them.
 */
@SuppressWarnings({"unused", "SameReturnValue"})
public final class SettingsStatus {
    private SettingsStatus() {
    }

    public static boolean hideAds() {
        return false;
    }

    public static boolean hideStories() { return false; }
    public static boolean hideRecommendations() { return false; }
    public static boolean channelRecommendations() { return false; }
    public static boolean cachedRecommendations() { return false; }
    public static boolean storyRequests() { return false; }
    public static boolean storyBar() { return false; }
    public static boolean storyCamera() { return false; }
    public static boolean storyAvatars() { return false; }
    public static boolean storyTouches() { return false; }

    public static boolean disableAnalytics() {
        return false;
    }

    public static boolean disableCallDebug() { return false; }
    public static boolean callDebugUpload() { return false; }
    public static boolean callLogFileUpload() { return false; }
    public static boolean callLogUpload() { return false; }

    public static boolean disableUpdateChecks() {
        return false;
    }

    public static boolean channelAds() {
        return false;
    }

    public static boolean videoAds() {
        return false;
    }

    public static boolean searchAds() {
        return false;
    }

    public static boolean deviceStats() {
        return false;
    }

    public static boolean readMetrics() {
        return false;
    }
}
