/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.music.patches.crossfade;

import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;

import app.morphe.extension.music.patches.crossfade.CrossfadeEngine.NextAvailability;

/** Native MEDIA_NEXT capability, before notification presentation filters, never a gapless preload hint. */
public final class QueueAdvanceBridge {
    private static MediaSession session;
    private static MediaController controller;
    private static String tag;
    private static boolean local;
    private static PlaybackState playbackState;

    private QueueAdvanceBridge() { }

    /** Receives the native immutable state immediately before notification filtering/platform publication. */
    public static synchronized void capture(MediaSession owner, PlaybackState state) {
        if (owner != session) {
            session = owner;
            controller = owner == null ? null : owner.getController();
            tag = controller == null ? null : controller.getTag();
        }
        MediaController.PlaybackInfo info = "YouTube playerlib".equals(tag) ? controller.getPlaybackInfo() : null;
        local = localPlayer(tag, info == null ? 0 : info.getPlaybackType());
        playbackState = state;
    }

    public static synchronized void release(MediaSession owner) {
        if (owner != session) return;
        session = null;
        controller = null;
        tag = null;
        local = false;
        playbackState = null;
    }

    /** A publication for the preceding load is not a no-next proof for its replacement. */
    public static synchronized void invalidate() {
        playbackState = null;
    }

    public static synchronized NextAvailability availability() {
        PlaybackState state = playbackState;
        return fromPlaybackState(local && session != null && session.isActive(), state != null,
                state == null ? PlaybackState.STATE_NONE : state.getState(), state == null ? 0 : state.getActions());
    }

    static boolean localPlayer(String tag, int playbackType) {
        return "YouTube playerlib".equals(tag) && playbackType == MediaController.PlaybackInfo.PLAYBACK_TYPE_LOCAL;
    }

    static NextAvailability fromPlaybackState(boolean active, boolean published, int state, long actions) {
        if (!active || !published || actions == 0 || state == PlaybackState.STATE_NONE
                || state == PlaybackState.STATE_STOPPED || state == PlaybackState.STATE_ERROR
                || state == PlaybackState.STATE_CONNECTING) return NextAvailability.UNKNOWN;
        return (actions & PlaybackState.ACTION_SKIP_TO_NEXT) != 0
                ? NextAvailability.AVAILABLE : NextAvailability.UNAVAILABLE;
    }
}
