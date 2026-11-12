/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import org.json.JSONException;
import org.json.JSONObject;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ThumbnailEntry;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;

/**
 * What the offline list and the replay show of a stored copy. {@code album} and {@code thumbnailUrl} are null when
 * unknown. {@code responseSource} says where the stored response came from: {@link #SOURCE_DOWNLOAD} (built from
 * the downloader's resolved format, poorer) or {@link #SOURCE_ONLINE} (the app's own response of a play).
 */
record OfflineCopyMetadata(String videoId, String title, String artist, @Nullable String album, long durationMs,
                           @Nullable String thumbnailUrl, long storedAt, String responseSource) {
    static final String SOURCE_DOWNLOAD = "download";
    static final String SOURCE_ONLINE = "online";

    boolean fromOnlineResponse() {
        return SOURCE_ONLINE.equals(responseSource);
    }

    /**
     * The record of the app's own response of a play. What the download knew (the lock-screen title, artist, album
     * and cover url) is richer than the response's details and is kept; only what it lacked is filled in.
     */
    static OfflineCopyMetadata online(@Nullable OfflineCopyMetadata previous, String videoId, VideoDetails details,
                                      String artist, long now) {
        String title = previous != null && !previous.title().isEmpty() ? previous.title() : details.getTitle();
        String kept = previous != null && !previous.artist().isEmpty() ? previous.artist() : artist;
        String thumbnail = previous != null && previous.thumbnailUrl() != null
                ? previous.thumbnailUrl() : largestThumbnail(details);
        long duration = previous != null && previous.durationMs() > 0
                ? previous.durationMs() : details.getLengthSeconds() * 1000L;
        return new OfflineCopyMetadata(videoId, title, kept, previous == null ? null : previous.album(), duration,
                thumbnail, now, SOURCE_ONLINE);
    }

    /** The widest thumbnail url of the details, or null. */
    @Nullable
    static String largestThumbnail(VideoDetails details) {
        String url = null;
        int width = 0;
        for (ThumbnailEntry entry : details.getThumbnail().getThumbnailsList()) {
            if (!entry.getUrl().isEmpty() && entry.getWidth() >= width) {
                width = entry.getWidth();
                url = entry.getUrl();
            }
        }
        return url;
    }

    JSONObject toJson() throws JSONException {
        return new JSONObject().put("videoId", videoId).put("title", title).put("artist", artist)
                .put("album", album).put("durationMs", durationMs).put("thumbnailUrl", thumbnailUrl)
                .put("storedAt", storedAt).put("responseSource", responseSource);
    }

    static OfflineCopyMetadata fromJson(JSONObject json) throws JSONException {
        return new OfflineCopyMetadata(json.getString("videoId"), json.getString("title"),
                json.optString("artist", ""), optString(json, "album"), json.optLong("durationMs"),
                optString(json, "thumbnailUrl"), json.getLong("storedAt"),
                json.optString("responseSource", SOURCE_DOWNLOAD));
    }

    /** A missing or null key is null; org.json would turn a null into the text "null". */
    @Nullable
    private static String optString(JSONObject json, String key) {
        return json.isNull(key) ? null : json.optString(key);
    }
}
