/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.util.Set;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ThumbnailList;

/**
 * The player response the replay answers with for a video copy, in the shape of the response the app gets online:
 * the app's player selection selected no video track offline from the saved response of the saving client alone.
 * Each top-level field has one source:
 * <table>
 *   <caption>Field sources of an offline answer</caption>
 *   <tr><th>Field<th>With the app's online response of this video ({@link #LIVE})<th>With the app's template
 *       ({@link #TEMPLATE})
 *   <tr><td>1 response context, 2 playability status, 15 player configuration (whole), 16, 21, 22, 69, 71 and any
 *       other field both have<td>the online response<td>the template
 *   <tr><td>4 streaming data (the pair of the copy), 11 video details<td>the saved response<td>the saved response
 *   <tr><td>9 playback tracking, 10 captions<td>the online response<td>the saved response
 *   <tr><td>14 offline marker<td>(added on the way out by {@link OfflineReplayResponse})<td>same
 *   <tr><td>a field only the saved response has<td>kept<td>kept
 * </table>
 * With neither, the saved response is the answer ({@link #SAVED}).
 */
final class VideoCopyAnswer {
    static final String LIVE = "live";
    static final String TEMPLATE = "template";
    static final String SAVED = "saved";

    /** Fields the copy keeps of its own over the online response of the video: 4 streaming data, 11 details. */
    static final Set<Integer> OWN_OVER_LIVE = Set.of(4, 11);
    /** Fields the copy keeps of its own over the template: the per-video fields. */
    static final Set<Integer> OWN_OVER_TEMPLATE = LiveTemplateLogic.PER_VIDEO_FIELDS;

    /** The answer bytes and which of the three bases they are made on. */
    record Answer(byte[] bytes, String base) {}

    private VideoCopyAnswer() {}

    static Answer of(byte[] saved, @Nullable byte[] live, @Nullable byte[] template) throws IOException {
        if (live != null) return new Answer(ResponseFields.baseWithOwn(live, saved, OWN_OVER_LIVE), LIVE);
        if (template != null) {
            return new Answer(ResponseFields.baseWithOwn(template, saved, OWN_OVER_TEMPLATE), TEMPLATE);
        }
        return new Answer(saved, SAVED);
    }

    /**
     * The answer with the thumbnails of the song in its video details. The music video's own thumbnails are pictures
     * of the video, which the app has never loaded when the copy was saved and which show black offline in the Song
     * display; the song's cover (the one its audio copy knows, and the app has shown in the lists) loads from the
     * app's image cache. The video display shows the video itself and does not read them. The answer is returned as
     * it is when the song has no thumbnails.
     */
    static byte[] withSongArtwork(byte[] answer, byte[] songResponse) throws IOException {
        ThumbnailList artwork = PlayerResponse.parseFrom(songResponse).getVideoDetails().getThumbnail();
        if (artwork.getThumbnailsCount() == 0) return answer;

        PlayerResponse parsed = PlayerResponse.parseFrom(answer);
        return parsed.toBuilder()
                .setVideoDetails(parsed.getVideoDetails().toBuilder().setThumbnail(artwork)).build().toByteArray();
    }
}
