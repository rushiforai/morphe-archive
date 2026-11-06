/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-05.
 * Written by lavinhoque33, 2026-10-10.
 * Modified by lavinhoque33, 2026-10-25.
 */

package app.morphe.extension.youtube.patches.general.offline;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * One download as stored in the offline index: a video, or the audio of a video.
 */
public final class OfflineVideo {
    /**
     * Appended to the video id to form the key of an audio-only download, so a video and its
     * audio can both be in the library. A video's key is its plain video id, as in older indexes.
     */
    private static final String AUDIO_KEY_SUFFIX = "_audio";

    public final String videoId;
    public final String title;
    public final String author;
    public final String channelId;
    public final long lengthMs;
    public final String contentUri;
    public final String displayName;
    public final long sizeBytes;
    public final String qualityLabel;
    public final String codec;
    /**
     * Format id of the downloaded stream, 0 for entries made before it was stored.
     * The library shows it next to the codec.
     */
    public final int itag;
    /** Bitrate of the downloaded audio in kbps, 0 for entries that do not store it. */
    public final int bitrateKbps;
    public final long downloadedAt;
    public final String thumbnailPath;
    public final boolean audioOnly;
    public volatile long lastPositionMs;
    /** Public sidecars plus a private cue copy; public file moves do not break playback. */
    final List<OfflineCaptions.Saved> subtitles = new ArrayList<>();
    boolean sponsorChecked;
    long sponsorDurationMs;
    List<String> sponsorCategories = List.of();
    List<OfflineSponsorSegments.Segment> sponsorSegments = List.of();

    public OfflineVideo(@NonNull String videoId, @NonNull String title, @NonNull String author,
                        @NonNull String channelId, long lengthMs, @NonNull String contentUri,
                        @NonNull String displayName, long sizeBytes, @NonNull String qualityLabel,
                        @NonNull String codec, int itag, int bitrateKbps, long downloadedAt,
                        @NonNull String thumbnailPath, boolean audioOnly, long lastPositionMs) {
        this.videoId = videoId;
        this.title = title;
        this.author = author;
        this.channelId = channelId;
        this.lengthMs = lengthMs;
        this.contentUri = contentUri;
        this.displayName = displayName;
        this.sizeBytes = sizeBytes;
        this.qualityLabel = qualityLabel;
        this.codec = codec;
        this.itag = itag;
        this.bitrateKbps = bitrateKbps;
        this.downloadedAt = downloadedAt;
        this.thumbnailPath = thumbnailPath;
        this.audioOnly = audioOnly;
        this.lastPositionMs = lastPositionMs;
    }

    /** Identifies the entry in the index, the player queue and the download queue. */
    static String keyOf(String videoId, boolean audioOnly) {
        return audioOnly ? videoId + AUDIO_KEY_SUFFIX : videoId;
    }

    String key() {
        return keyOf(videoId, audioOnly);
    }

    JSONObject toJson() throws JSONException {
        JSONObject json = new JSONObject();
        json.put("videoId", videoId);
        json.put("title", title);
        json.put("author", author);
        json.put("channelId", channelId);
        json.put("lengthMs", lengthMs);
        json.put("contentUri", contentUri);
        json.put("displayName", displayName);
        json.put("sizeBytes", sizeBytes);
        json.put("qualityLabel", qualityLabel);
        json.put("codec", codec);
        json.put("itag", itag);
        json.put("bitrateKbps", bitrateKbps);
        json.put("downloadedAt", downloadedAt);
        json.put("thumbnailPath", thumbnailPath);
        json.put("audioOnly", audioOnly);
        json.put("lastPositionMs", lastPositionMs);
        JSONArray tracks = new JSONArray();
        for (OfflineCaptions.Saved subtitle : subtitles) tracks.put(subtitle.toJson());
        json.put("subtitles", tracks);
        json.put("sponsorChecked", sponsorChecked);
        json.put("sponsorDurationMs", sponsorDurationMs);
        json.put("sponsorCategories", String.join(",", sponsorCategories));
        json.put("sponsorSegments", OfflineSponsorSegments.toJson(sponsorSegments));
        return json;
    }

    @Nullable
    static OfflineVideo fromJson(JSONObject json) {
        String videoId = json.optString("videoId", "");
        String contentUri = json.optString("contentUri", "");
        if (videoId.isEmpty() || contentUri.isEmpty()) return null;
        OfflineVideo video = new OfflineVideo(
                videoId,
                json.optString("title", videoId),
                json.optString("author", ""),
                json.optString("channelId", ""),
                json.optLong("lengthMs", 0),
                contentUri,
                json.optString("displayName", ""),
                json.optLong("sizeBytes", 0),
                json.optString("qualityLabel", ""),
                json.optString("codec", ""),
                json.optInt("itag", 0),
                json.optInt("bitrateKbps", 0),
                json.optLong("downloadedAt", 0),
                json.optString("thumbnailPath", ""),
                json.optBoolean("audioOnly", false),
                json.optLong("lastPositionMs", 0)
        );
        JSONArray tracks = json.optJSONArray("subtitles");
        if (tracks != null) {
            for (int index = 0; index < tracks.length(); index++) {
                JSONObject track = tracks.optJSONObject(index);
                if (track != null) video.subtitles.add(OfflineCaptions.Saved.fromJson(track));
            }
        }
        video.sponsorChecked = json.optBoolean("sponsorChecked", false);
        video.sponsorDurationMs = json.optLong("sponsorDurationMs", 0);
        video.sponsorCategories = OfflineSponsorSegments.categories(json.optString("sponsorCategories", ""));
        video.sponsorSegments = OfflineSponsorSegments.fromJson(json.optJSONArray("sponsorSegments"), false);
        return video;
    }
}
