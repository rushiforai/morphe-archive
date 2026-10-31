package com.laurencedawson.reddit_sync.ui.views.video;

import android.content.Context;
import android.widget.FrameLayout;

/**
 * Sync's video and GIF player. It holds the texture view the video is drawn on, and the player
 * behind it, and is the view the gesture handling is attached to.
 *
 * <p>Compile only, and named as the app names it: the patch refers to this class by the same
 * descriptor, so the name is not ours to choose. Only the members the extension uses are
 * declared.
 */
public class CustomExoPlayerView extends FrameLayout {
    public CustomExoPlayerView(Context context) {
        super(context);
        throw new UnsupportedOperationException("Stub");
    }

    /** How far into the video playback is, in milliseconds. */
    public int getProgress() {
        throw new UnsupportedOperationException("Stub");
    }

    /** The length of the video in milliseconds, or zero before it is known. */
    public int getDuration() {
        throw new UnsupportedOperationException("Stub");
    }

    public void seekTo(int milliseconds) {
        throw new UnsupportedOperationException("Stub");
    }

    public void setMuted(boolean muted) {
        throw new UnsupportedOperationException("Stub");
    }
}
