/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Finds the song (audio track) of a music video, so a single download made from the video display, or from an
 * album row that carries the music video's id, is saved as the song under the song's id. Two sources are read, in
 * this order; the first that names a song decides:
 * <ol>
 *   <li>the watch queue of the video: an item that pairs the video with a counterpart of the audio type;</li>
 *   <li>the song search: a row with the same title and about the same length whose artist is the video's artist,
 *   or the artist its title starts with.</li>
 * </ol>
 * Contains no Android code.
 */
final class SongIdResolver {
    /** The app's type of a song (an audio track) and of a music video. */
    static final int TYPE_SONG = CommandRewrite.TYPE_ATV;
    static final int TYPE_VIDEO = CommandRewrite.TYPE_OMV;

    private static final String COUNTERPART_SONG = "ATV";
    private static final String VIDEO_TYPE = "OMV";
    private static final Pattern CHANNEL_NOISE = Pattern.compile("vevo|topic|official|records|music");
    private static final Pattern SPACES = Pattern.compile("\\s+");

    private SongIdResolver() {}

    /** What is known of the music video: the details of its player response. */
    record Video(String videoId, String title, String channel, long lengthSeconds) {}

    /** One result row of the song search: the id, the title, the artist line (the first part), and the length. */
    record Row(String videoId, String title, String artist, long lengthSeconds) {}

    /** Whether a player response of this type is a music video that has a song. */
    static boolean isMusicVideo(boolean hasType, int type) {
        return hasType && type == TYPE_VIDEO;
    }

    /**
     * Whether the video is a music video, by what the sources say, the watch queue first: its own item names the
     * type the app itself uses. Without that, the type of the player response decides.
     */
    static boolean isMusicVideo(String videoId, @Nullable List<WatchQueueLogic.NextItem> queue,
                                boolean playerSaysVideo) {
        if (queue != null) {
            for (WatchQueueLogic.NextItem item : queue) {
                if (videoId.equals(item.videoId()) && !item.type().isEmpty()) return VIDEO_TYPE.equals(item.type());
            }
        }
        return playerSaysVideo;
    }

    /**
     * The song the watch queue pairs with the video: the first item that names the video and carries a counterpart
     * of the audio type. Null when the queue pairs nothing (the usual answer for a lone video).
     */
    @Nullable
    static String fromQueue(String videoId, List<WatchQueueLogic.NextItem> queue) {
        for (WatchQueueLogic.NextItem item : queue) {
            if (!item.hasCounterpart() || !VideoPairingLogic.isVideoId(item.counterpartId())) continue;

            if (videoId.equals(item.videoId()) && COUNTERPART_SONG.equals(item.counterpartType())
                    && !videoId.equals(item.counterpartId())) {
                return item.counterpartId();
            }
        }
        return null;
    }

    /** The text to search for: the title as the title match reads it, without the video's marks. */
    static String query(Video video) {
        String title = VideoPairingLogic.normalizeTitle(video.title());
        return title.isEmpty() ? video.title().trim() : title;
    }

    /**
     * The first search row that is the song of the video: not the video itself, the same title (the video's title may
     * start with the artist: "Artist - Song") and about the same length, with an artist that agrees. A row that
     * fails any of these is not taken, so a cover or a look-alike never replaces the song.
     */
    @Nullable
    static String fromSearch(Video video, List<Row> rows) {
        String title = VideoPairingLogic.normalizeTitle(video.title());
        String channel = compact(stripNoise(VideoPairingLogic.normalizeTitle(video.channel())));
        for (Row row : rows) {
            if (!VideoPairingLogic.isVideoId(row.videoId()) || row.videoId().equals(video.videoId())) continue;
            if (video.lengthSeconds() <= 0 || row.lengthSeconds() <= 0
                    || !VideoPairingLogic.similarLength(video.lengthSeconds(), row.lengthSeconds())) continue;

            String rowTitle = VideoPairingLogic.normalizeTitle(row.title());
            String artist = compact(VideoPairingLogic.normalizeTitle(row.artist()));
            if (rowTitle.isEmpty() || artist.isEmpty()) continue;

            if (title.equals(rowTitle) && agrees(channel, artist)) return row.videoId();
            if (title.endsWith(" " + rowTitle)) {
                String prefix = compact(title.substring(0, title.length() - rowTitle.length()));
                if (agrees(prefix, artist)) return row.videoId();
            }
        }
        return null;
    }

    /** Two artist names agree when one contains the other, ignoring case, accents, spaces and channel noise. */
    private static boolean agrees(String first, String second) {
        if (first.isEmpty() || second.isEmpty()) return false;

        return first.contains(second) || second.contains(first);
    }

    private static String stripNoise(String channel) {
        return CHANNEL_NOISE.matcher(channel).replaceAll(" ");
    }

    private static String compact(String text) {
        return SPACES.matcher(text).replaceAll("");
    }

    /**
     * The rows of a song search response: every {@code musicResponsiveListItemRenderer} that names a video, with the
     * title of its first column and the artist and length of its second ({@code Artist • Album • m:ss}).
     */
    static List<Row> readSearch(JSONObject response) {
        List<Row> rows = new ArrayList<>();
        collect(response, rows);
        return rows;
    }

    private static void collect(Object node, List<Row> rows) {
        if (node instanceof JSONObject object) {
            JSONObject renderer = object.optJSONObject("musicResponsiveListItemRenderer");
            if (renderer != null) {
                Row row = readRow(renderer);
                if (row != null) rows.add(row);
                return;
            }
            java.util.Iterator<String> keys = object.keys();
            while (keys.hasNext()) collect(object.opt(keys.next()), rows);
        } else if (node instanceof JSONArray array) {
            for (int index = 0; index < array.length(); index++) collect(array.opt(index), rows);
        }
    }

    @Nullable
    private static Row readRow(JSONObject renderer) {
        JSONObject data = renderer.optJSONObject("playlistItemData");
        String videoId = data == null ? "" : data.optString("videoId");
        JSONArray columns = renderer.optJSONArray("flexColumns");
        if (videoId.isEmpty() || columns == null || columns.length() < 2) return null;

        String title = columnText(columns.optJSONObject(0));
        String[] parts = columnText(columns.optJSONObject(1)).split(" \u2022 ");
        if (parts.length < 2) return null;

        long length = VideoPairingLogic.lengthSeconds(parts[parts.length - 1]);
        return new Row(videoId, title, parts[0], length);
    }

    private static String columnText(@Nullable JSONObject column) {
        JSONObject holder = column == null ? null : column.optJSONObject("musicResponsiveListItemFlexColumnRenderer");
        JSONObject text = holder == null ? null : holder.optJSONObject("text");
        JSONArray runs = text == null ? null : text.optJSONArray("runs");
        StringBuilder joined = new StringBuilder();
        for (int index = 0; runs != null && index < runs.length(); index++) {
            JSONObject run = runs.optJSONObject(index);
            if (run != null) joined.append(run.optString("text"));
        }
        return joined.toString();
    }
}
