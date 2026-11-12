/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import org.json.JSONObject;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;

import app.morphe.extension.music.patches.misc.requests.MusicBrowseRequest;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Asks the network for the song of a music video, see {@link SongIdResolver} for how the answers are read.
 * The watch queue is asked with the app's own client; the song search is a public web request, because the app's
 * own client has no song filter. A failed request is the same as no answer: the caller then saves the video itself.
 */
final class SongIdLookup {
    private static final String SEARCH_URL = "https://music.youtube.com/youtubei/v1/search?prettyPrint=false";
    /** The "Songs" filter of the search: only audio tracks, never the music videos. */
    private static final String SONGS_FILTER = "EgWKAQIIAWoKEAkQBRAKEAMQBA==";
    private static final String WEB_CLIENT_VERSION = "1.20250310.01.00";
    private static final String USER_AGENT = "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36";
    private static final int CONNECT_TIMEOUT_MILLISECONDS = 15_000;
    private static final int READ_TIMEOUT_MILLISECONDS = 30_000;

    private SongIdLookup() {}

    /**
     * The id of the song of the video, or null when it is not a music video or no source names a song. Off the main
     * thread only. {@code playerSaysVideo} is what the player response's type said; the watch queue's own type, when
     * it has one, decides over it.
     */
    @Nullable
    static String songOf(SongIdResolver.Video video, boolean playerSaysVideo) {
        Utils.verifyOffMainThread();

        List<WatchQueueLogic.NextItem> queue = queueOf(video);
        String fromQueue = queue == null ? null : SongIdResolver.fromQueue(video.videoId(), queue);
        if (fromQueue != null) {
            Logger.printInfo(() -> "SongId: v=" + video.videoId() + " -> " + fromQueue + " by the watch queue");
            return fromQueue;
        }
        if (!SongIdResolver.isMusicVideo(video.videoId(), queue, playerSaysVideo)) {
            Logger.printDebug(() -> "SongId: v=" + video.videoId() + " is not a music video");
            return null;
        }

        String fromSearch = fromSearch(video);
        Logger.printInfo(() -> "SongId: v=" + video.videoId() + (fromSearch == null
                ? " has no song counterpart" : " -> " + fromSearch + " by the song search"));
        return fromSearch;
    }

    @Nullable
    private static List<WatchQueueLogic.NextItem> queueOf(SongIdResolver.Video video) {
        try {
            JSONObject response = MusicBrowseRequest.nextWith(Utils.getContext(),
                    new JSONObject().put("videoId", video.videoId()));
            return WatchQueueLogic.readNext(response, 0).items();
        } catch (Exception ex) {
            Logger.printDebug(() -> "SongId: watch queue failed v=" + video.videoId(), ex);
            return null;
        }
    }

    @Nullable
    private static String fromSearch(SongIdResolver.Video video) {
        try {
            JSONObject response = search(SongIdResolver.query(video));
            return SongIdResolver.fromSearch(video, SongIdResolver.readSearch(response));
        } catch (Exception ex) {
            Logger.printDebug(() -> "SongId: song search failed v=" + video.videoId(), ex);
            return null;
        }
    }

    private static JSONObject search(String query) throws Exception {
        JSONObject client = new JSONObject().put("clientName", "WEB_REMIX").put("clientVersion", WEB_CLIENT_VERSION)
                .put("hl", "en").put("gl", "US");
        JSONObject body = new JSONObject().put("context", new JSONObject().put("client", client))
                .put("query", query).put("params", SONGS_FILTER);

        HttpURLConnection connection = (HttpURLConnection) new URL(SEARCH_URL).openConnection();
        try {
            connection.setRequestMethod("POST");
            connection.setConnectTimeout(CONNECT_TIMEOUT_MILLISECONDS);
            connection.setReadTimeout(READ_TIMEOUT_MILLISECONDS);
            connection.setUseCaches(false);
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Origin", "https://music.youtube.com");
            connection.setRequestProperty("User-Agent", USER_AGENT);

            byte[] payload = body.toString().getBytes(StandardCharsets.UTF_8);
            connection.setFixedLengthStreamingMode(payload.length);
            try (OutputStream output = connection.getOutputStream()) {
                output.write(payload);
            }
            int status = connection.getResponseCode();
            if (status != HttpURLConnection.HTTP_OK) throw new java.io.IOException("search HTTP " + status);

            return Requester.parseJSONObject(connection);
        } finally {
            connection.disconnect();
        }
    }
}
