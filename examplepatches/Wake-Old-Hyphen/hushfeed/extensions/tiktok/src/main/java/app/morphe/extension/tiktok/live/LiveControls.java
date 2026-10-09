/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.live;

import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

import java.text.NumberFormat;

/** The LIVE controls patch's switches, each read at the call it guards. */
@SuppressWarnings("unused")
public final class LiveControls {
    private LiveControls() {
    }

    /**
     * True while a LIVE preview in the feed should not start the countdown that takes you into
     * its room. TikTok already skips the countdown on the Following feed, so a preview without
     * one is a state it handles; tapping the preview still opens the room. Paused, the switch
     * answers off.
     */
    public static boolean skipAutoEnter() {
        return SettingsStatus.liveControlsEnabled && Settings.STOP_LIVE_AUTO_ENTER.get();
    }

    private static final long NONE = -1;
    private static long pendingViewers = NONE;

    /**
     * Called just before the room widget turns its viewer count into text, with the count. The
     * formatter overwrites the register the count sits in, so the patch hands it over here and
     * {@link #viewerCountText} picks it up from the same straight line of code on the main thread.
     */
    public static void noteViewerCount(long count) {
        pendingViewers = count;
    }

    /**
     * Called with TikTok's text for the count noted just before ("1.2K+"). Returns the exact
     * count, grouped the way the reader's locale writes numbers, while the switch is on, and
     * TikTok's own text otherwise. Paused, the switch answers off.
     */
    public static String viewerCountText(String tiktokText) {
        long count = pendingViewers;
        pendingViewers = NONE;
        if (tiktokText == null || count < 0 || !SettingsStatus.liveControlsEnabled
                || !Settings.SHOW_EXACT_LIVE_VIEWERS.get()) {
            return tiktokText;
        }
        return NumberFormat.getIntegerInstance().format(count);
    }
}
