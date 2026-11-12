/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

/**
 * The offline watch command: the command message carrying the app's offline watch endpoint (extension field
 * 57,703,777). Every command with this endpoint is an offline-only request for the app, so its player and queue
 * requests take the offline route and a replay hook can answer them without a network.
 *
 * <p>Payload fields (decoded from the app's message info): 1 video id, 2 playlist id, 3 index, 10 a config message
 * whose field 6 is the music video type. The start time (7), the single-offline-video flag (config field 5) and the
 * wait flag (config field 7) are never written: the first would seek, the other two change how the app resolves the
 * endpoint. The type is the song (ATV) so the replay never resolves to the video mode, except for the command of a
 * song's music video (OMV), which names the video copy and is the counterpart of the song in a wrapper queue item.
 */
final class OfflineWatchCommand {
    static final int ENDPOINT_FIELD = 57_703_777;
    static final int VIDEO_ID_FIELD = 1;
    static final int PLAYLIST_ID_FIELD = 2;
    static final int INDEX_FIELD = 3;
    static final int CONFIG_FIELD = 10;
    static final int MUSIC_VIDEO_TYPE_FIELD = 6;

    private OfflineWatchCommand() {}

    /** The command bytes that start track {@code index} of {@code playlistId}, beginning with {@code videoId}. */
    static byte[] build(String videoId, String playlistId, int index) {
        return build(videoId, playlistId, index, CommandRewrite.TYPE_ATV);
    }

    /** The same for a video of the given music video type: the song (ATV) or its music video (OMV). */
    static byte[] build(String videoId, String playlistId, int index, int musicVideoType) {
        if (videoId == null || videoId.isEmpty()) throw new IllegalArgumentException("videoId is empty");
        if (playlistId == null || playlistId.isEmpty()) throw new IllegalArgumentException("playlistId is empty");
        if (index < 0) throw new IllegalArgumentException("index is negative: " + index);

        byte[] config = new ProtoWriter()
                .int32(MUSIC_VIDEO_TYPE_FIELD, musicVideoType)
                .toByteArray();
        byte[] endpoint = new ProtoWriter()
                .string(VIDEO_ID_FIELD, videoId)
                .string(PLAYLIST_ID_FIELD, playlistId)
                .int32(INDEX_FIELD, index)
                .message(CONFIG_FIELD, config)
                .toByteArray();
        return new ProtoWriter().message(ENDPOINT_FIELD, endpoint).toByteArray();
    }
}
