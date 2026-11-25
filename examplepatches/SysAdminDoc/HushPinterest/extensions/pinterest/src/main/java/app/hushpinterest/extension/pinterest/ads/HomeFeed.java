/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import java.util.Map;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Holds the Home feed refreshes Pinterest starts on its own, so coming back to the app or to the
 * Home tab finds the same pins at the same spot. Pull-to-refresh, the new pins prompt, the empty
 * feed's Refresh and a notification that opens Home with a pin all still refresh.
 */
public final class HomeFeed {
    private HomeFeed() {}

    /** The default-argument bit that drops the map: only the new pins prompt sets it alone. */
    static final int NO_MAP = 0x2;

    /** How long away, in milliseconds, before Home refreshes on return. The patch finds the check by it. */
    static final long AWAY_MS = 300_000L;

    static boolean active() {
        HookStatus.invoked(FamilyNames.KEEP_HOME_FEED);
        try {
            return Utils.settingsReady() && Settings.KEEP_HOME_FEED.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.KEEP_HOME_FEED, "switch read", t);
            return false;
        }
    }

    /**
     * True skips the refresh Home runs when the app comes back after five minutes away. A shorter
     * time away, [awayMs], refreshes nothing in Pinterest either, so it runs as Pinterest wrote it.
     */
    public static boolean holdResumeRefresh(long awayMs) {
        if (awayMs <= AWAY_MS || !active()) return false;
        HookStatus.counted(FamilyNames.KEEP_HOME_FEED, "refresh on return held");
        Logger.printDebug(() -> "Home feed: held the refresh on return");
        return true;
    }

    /**
     * True skips one call to the Home presenter's refresh. [mask] is its Kotlin default-argument
     * mask. Only the sticky refresh event passes its map through (the bit [NO_MAP] clear), and it
     * comes without one when Pinterest sends it on its own: the Home tab picked after five minutes,
     * Back out of search results, or the server's auto-refresh test. A map means a notification
     * opened Home with a pin to put on top, and that refresh stays.
     */
    public static boolean holdHomeRefresh(Map<?, ?> pins, int mask) {
        if ((mask & NO_MAP) != 0 || (pins != null && !pins.isEmpty())) return false;
        if (!active()) return false;
        HookStatus.counted(FamilyNames.KEEP_HOME_FEED, "automatic refresh held");
        Logger.printDebug(() -> "Home feed: held an automatic refresh, mask " + mask);
        return true;
    }

    /**
     * True lets Back go on out of Home. Home's Back handler asks only once the feed is scrolled
     * past Pinterest's own mark, right before it would scroll to the top and refresh instead, and
     * true takes the path Back takes at the top of the feed. Its own switch, apart from
     * {@link Settings#KEEP_HOME_FEED}.
     */
    public static boolean leave() {
        HookStatus.invoked(FamilyNames.KEEP_HOME_FEED);
        boolean on;
        try {
            on = Utils.settingsReady() && Settings.BACK_LEAVES_HOME.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.KEEP_HOME_FEED, "Back switch read", t);
            return false;
        }
        if (!on) return false;
        HookStatus.counted(FamilyNames.KEEP_HOME_FEED, "Back left Home");
        Logger.printDebug(() -> "Home feed: Back left Home without the jump to the top");
        return true;
    }

    /**
     * Injected into Home's handler for the time-away event, right after Pinterest takes the event
     * off the bus (#48). True returns there, so the pill that offers new pins never inflates, and
     * neither its analytics nor its 15 second hide timer start. Off, paused or unreadable, the pill
     * shows as before. Never throws.
     */
    public static boolean hideRefreshPill() {
        HookStatus.invoked(FamilyNames.KEEP_HOME_FEED);
        boolean on;
        try {
            on = Utils.settingsReady() && Settings.HIDE_REFRESH_PILL.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.KEEP_HOME_FEED, "refresh pill switch read", t);
            return false;
        }
        if (!on) return false;
        HookStatus.counted(FamilyNames.KEEP_HOME_FEED, "refresh pill hidden");
        return true;
    }
}
