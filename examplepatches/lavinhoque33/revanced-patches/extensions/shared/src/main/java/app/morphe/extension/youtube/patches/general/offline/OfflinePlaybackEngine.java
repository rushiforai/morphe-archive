/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline;

import android.net.Uri;
import android.view.Surface;

/** Engine contract shared with the optional Downloads playback extension. */
public interface OfflinePlaybackEngine {
    interface Listener {
        void onReady();
        void onPlayingChanged();
        void onVideoSizeChanged(int width, int height);
        void onEnded();
        void onError(Exception error);
    }

    void prepare(Uri uri, Surface surface);
    long getPosition();
    long getDuration();
    boolean isPlaying();
    boolean isPlayRequested();
    void play();
    void pause();
    void seekTo(long positionMs);
    void setSpeed(float speed);
    float getSpeed();
    void setVolume(float volume);
    void setSurface(Surface surface);
    void release();
}
