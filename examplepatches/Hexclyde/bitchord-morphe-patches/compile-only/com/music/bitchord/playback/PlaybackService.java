package com.music.bitchord.playback;

import androidx.media3.common.MediaItem;
import androidx.media3.common.Player;

/** Compile-only host signature; the method is added by the patch. Never packaged. */
public final class PlaybackService {
    /** Starts BitChord's two-player version swap; false when it can't run right now. */
    public static boolean bitchordSmoothSwap(
            Object service, Player player, int index, MediaItem target) {
        return false;
    }
}
