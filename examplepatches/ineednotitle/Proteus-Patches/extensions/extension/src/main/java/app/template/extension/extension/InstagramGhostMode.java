/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/crimera/piko (GPL-3.0).
 * See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.extension.extension;

/**
 * Runtime decisions for Ghost Mode.
 *
 * <p>Ghost Mode combines three independent switches:</p>
 * <ul>
 *   <li>hide typing indicators (MobileConfig)</li>
 *   <li>do not send DM read receipts ({@code mark_thread_seen-})</li>
 *   <li>best-effort story seen request blocking</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class InstagramGhostMode {

    private InstagramGhostMode() {
    }

    public static boolean isEnabled() {
        return InstagramRuntimeFlags.isGhostModeEnabled();
    }

    public static boolean shouldHideTyping() {
        return InstagramRuntimeFlags.shouldHideTyping();
    }

    public static boolean shouldHideDmSeen() {
        return InstagramRuntimeFlags.shouldHideDmSeen();
    }

    public static boolean shouldHideStorySeen() {
        return InstagramRuntimeFlags.shouldHideStorySeen();
    }

    /**
     * Injection point for the Tigon request blocker.
     *
     * <p>Blocking the story-seen endpoint is intentionally conservative. The
     * request is only cancelled while Ghost Mode is enabled; Instagram keeps
     * showing the story locally, and the server never receives the view.</p>
     */
    public static boolean shouldBlockUrl(String url) {
        refreshRequestFilter();
        return InstagramGhostRequestFilter.shouldBlockUrl(url);
    }

    /**
     * Keeps the Android-free request filter in sync with the preference. Called
     * after settings changes and when the action bar is first created.
     */
    public static void refreshRequestFilter() {
        InstagramGhostRequestFilter.setBlockStorySeen(shouldHideStorySeen());
    }
}
