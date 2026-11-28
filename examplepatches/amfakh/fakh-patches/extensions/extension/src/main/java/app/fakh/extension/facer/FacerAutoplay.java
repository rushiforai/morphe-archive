/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.facer;

/**
 * Runtime flags set by `Stop Featured Looks autoplay` and `Stop video autoplay` so both patches
 * can independently control the shared `ExoPlayerPool` without conflicting.
 */
@SuppressWarnings("unused")
public final class FacerAutoplay {
    public static volatile boolean stopFeaturedLooks;
    public static volatile boolean stopFeedVideos;

    private FacerAutoplay() {
    }

    /** Enables pausing Featured Looks videos on the home screen. */
    public static void disableFeaturedLooks() {
        stopFeaturedLooks = true;
    }

    /** Enables pausing Looks feed videos (while leaving Looks detail playback active). */
    public static void disableFeedVideos() {
        stopFeedVideos = true;
    }

    /**
     * Returns whether a pooled Media3 ExoPlayer should start playing automatically.
     *
     * @param key the pool item key (`"looks_external_*"` for Featured Looks on Home)
     * @param isFeedPool true when the player belongs to the `"feed"` pool
     */
    public static boolean shouldPlay(String key, boolean isFeedPool) {
        if (!isFeedPool) return true;
        if (key != null && key.startsWith("looks_external_")) {
            return !stopFeaturedLooks;
        }
        return !stopFeedVideos;
    }
}
