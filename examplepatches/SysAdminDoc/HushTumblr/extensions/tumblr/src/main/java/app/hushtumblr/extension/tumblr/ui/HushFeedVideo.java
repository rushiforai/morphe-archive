/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

/**
 * The controls drawn over a video in a feed. Tap to play feed videos adds this to Tumblr's own
 * class, whose play and replay handlers answer it.
 */
public interface HushFeedVideo {
    /**
     * Starts this video where it sits, from the top when it had finished. Answers non-zero when it
     * started, and zero when Tumblr's tap should go ahead: the video is playing, it's an ad, it
     * has no player yet, or a tap on it doesn't open the full-screen player.
     */
    int hushPlayInPlace();

    void hushPausePlayback();
}
