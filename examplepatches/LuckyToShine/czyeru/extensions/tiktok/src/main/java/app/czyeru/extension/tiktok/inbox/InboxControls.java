/*
 * Adapted from Hushfeed (https://github.com/SysAdminDoc/hushfeed), GPL-3.0.
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 * Follows hxreborn/hxreborn-tiktok-patches (GPL-3.0).
 */
package app.czyeru.extension.tiktok.inbox;

import app.czyeru.extension.tiktok.settings.Settings;

/** Answers TikTok's Inbox widget containers. */
public final class InboxControls {
    private InboxControls() {
    }

    /** Whether the Activity / New followers list stops at a few rows behind View all. */
    public static boolean shouldCollapseActivityList(boolean original) {
        return original && !Settings.EXPAND_ACTIVITY_LIST.get();
    }
}
