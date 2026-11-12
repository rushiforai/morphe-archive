/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

/**
 * The ordinary online watch command: the command message carrying the app's watch endpoint (extension field
 * 48,687,757) with the video id (1), the playlist id (2) and the position in the playlist (3). Playing a downloaded
 * song through it keeps every online feature (radio, lyrics, related) while the swap still serves the local copy.
 *
 * <p>Field 3 is the index: in the app's watch endpoint message it is the only integer next to the playlist id, and
 * the code that starts playback from the endpoint reads it together with the playlist id.
 */
final class OnlineWatchCommand {
    static final int PLAYLIST_ID_FIELD = 2;
    static final int INDEX_FIELD = 3;

    private OnlineWatchCommand() {}

    /**
     * The command bytes that play {@code videoId}. Without a playlist the command plays the song alone; with one the
     * song is track {@code index} of it.
     */
    static byte[] build(String videoId, @Nullable String playlistId, int index) {
        if (videoId == null || videoId.isEmpty()) throw new IllegalArgumentException("videoId is empty");
        if (index < 0) throw new IllegalArgumentException("index is negative: " + index);

        ProtoWriter endpoint = new ProtoWriter().string(CommandRewrite.VIDEO_ID_FIELD, videoId);
        if (playlistId != null && !playlistId.isEmpty()) {
            endpoint.string(PLAYLIST_ID_FIELD, playlistId).int32(INDEX_FIELD, index);
        }
        return new ProtoWriter()
                .message(CommandRewrite.WATCH_ENDPOINT_FIELD, endpoint.toByteArray())
                .toByteArray();
    }
}
