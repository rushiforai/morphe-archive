/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.music.layout.sponsorblock

import app.morphe.patcher.Fingerprint

/**
 * Matches {@code MusicPlaybackControlsTimeBar.draw(Canvas)}.
 * Draws segment markers on the compact/mini player seekbar.
 */
internal object MusicTimeBarDrawFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/music/watchpage/MusicPlaybackControlsTimeBar;",
    name = "draw",
    returnType = "V"
)

/**
 * Matches {@code MusicPlaybackControlsTimeBar.onMeasure(int, int)}.
 * Resolves the Rect field used for seekbar bounds.
 */
internal object MusicTimeBarOnMeasureFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/music/watchpage/MusicPlaybackControlsTimeBar;",
    name = "onMeasure",
    returnType = "V"
)
