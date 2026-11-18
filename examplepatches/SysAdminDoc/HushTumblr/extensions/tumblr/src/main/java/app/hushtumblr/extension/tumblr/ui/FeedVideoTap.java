/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import java.lang.ref.WeakReference;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Tap to play feed videos. Tumblr sends any tap on a video in a feed to the full-screen player, so
 * with auto-play off, or on a video auto-play has passed over, there's no way to watch it in place.
 * With the switch on, a tap on a stopped video starts it where it sits, and a tap while it plays
 * still opens the full-screen player.
 */
public final class FeedVideoTap {
    static final String STEP = "feed video tap";
    static final String PAUSE_STEP = "pausing the last tapped feed video";
    static final String PLAYED = "feed video played in place";

    /** The video the last tap started. Taps arrive on the main thread, so this needs no lock. */
    private static WeakReference<HushFeedVideo> lastStarted;

    private FeedVideoTap() {
    }

    /** Non-zero when the tap started the video, so Tumblr's own handling of it is skipped. */
    public static int onTap(Object overlay) {
        try {
            if (!(overlay instanceof HushFeedVideo) || !on()) return 0;
            HushFeedVideo video = (HushFeedVideo) overlay;
            if (video.hushPlayInPlace() == 0) return 0;
            pauseLastStarted(video);
            HookStatus.counted(FamilyNames.TAP_TO_PLAY_FEED_VIDEOS, PLAYED);
            return 1;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_TO_PLAY_FEED_VIDEOS, STEP, failure);
            return 0;
        }
    }

    /** Tumblr only stops other videos as the feed scrolls, so two taps would play two at once. */
    private static void pauseLastStarted(HushFeedVideo video) {
        HushFeedVideo last = lastStarted == null ? null : lastStarted.get();
        lastStarted = new WeakReference<>(video);
        if (last == null || last == video) return;
        try {
            last.hushPausePlayback();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAP_TO_PLAY_FEED_VIDEOS, PAUSE_STEP, failure);
        }
    }

    private static boolean on() {
        if (!Utils.settingsReady() || !PatchFamily.Capability.FEED_VIDEO_TAP.installed()) return false;
        HookStatus.invoked(FamilyNames.TAP_TO_PLAY_FEED_VIDEOS);
        return Settings.TAP_TO_PLAY_FEED_VIDEOS.get();
    }
}
