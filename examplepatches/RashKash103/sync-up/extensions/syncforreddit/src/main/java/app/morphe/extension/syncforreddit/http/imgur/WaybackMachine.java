/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.extension.syncforreddit.http.imgur;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONException;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.http.ArchiveRequests;

/**
 * Looks up archived copies of URLs the origin no longer serves.
 *
 * <p>Ported from Patcheddit's Boost implementation, using org.json rather than Jackson and an
 * in memory cache rather than a Room database.
 */
public class WaybackMachine {
    private static final String TIMEMAP_URL = "https://web.archive.org/web/timemap/json/";

    /** The "if_" modifier serves the archived bytes without the Wayback page furniture. */
    private static final String CONTENT_URL = "https://web.archive.org/web/%sif_/%s";

    private static final int CACHE_SIZE = 128;

    /** Empty value means the lookup was made and the archive had nothing. */
    private static final Map<String, String> cache =
            Collections.synchronizedMap(new LinkedHashMap<String, String>(CACHE_SIZE + 1, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > CACHE_SIZE;
                }
            });

    private WaybackMachine() {}

    /**
     * @return A URL serving the archived copy, or null if there is no usable snapshot.
     */
    @Nullable
    public static String findSnapshot(String contentUrl) throws IOException, JSONException {
        return findSnapshot(contentUrl, false);
    }

    /**
     * @param mediaOnly Ignore snapshots of a page rather than of the file itself. Imgur answers
     *                  a link to something it no longer holds with an ordinary HTML page, and
     *                  the archive captured plenty of those. Serving one where an image or a
     *                  video is expected fails in the decoder instead of here, which reads as
     *                  a blank thumbnail or a video that will not play.
     * @return A URL serving the archived copy, or null if there is no usable snapshot.
     */
    @Nullable
    public static String findSnapshot(String contentUrl, boolean mediaOnly)
            throws IOException, JSONException {
        String key = (mediaOnly ? "media:" : "any:") + contentUrl;
        String cached = cache.get(key);
        if (cached != null) {
            return cached.isEmpty() ? null : cached;
        }

        List<String> snapshots = lookUp(contentUrl, 1, mediaOnly);
        String snapshot = snapshots.isEmpty() ? null : snapshots.get(0);
        cache.put(key, snapshot == null ? "" : snapshot);
        return snapshot;
    }

    /**
     * Several snapshots, oldest first, for callers that have to read the page rather than just
     * serve it. An album page archived recently is a script shell with nothing in it, whereas
     * older captures still carry the list of images, so it is worth trying more than one.
     */
    public static List<String> findSnapshots(String contentUrl, int limit)
            throws IOException, JSONException {
        return lookUp(contentUrl, limit, false);
    }

    private static List<String> lookUp(String contentUrl, int limit, boolean mediaOnly)
            throws IOException, JSONException {
        Logger.printDebug(() -> "Wayback Machine: " + contentUrl);

        List<String> snapshots = new ArrayList<>();
        String body = ArchiveRequests.get(TIMEMAP_URL + contentUrl, "application/json");
        if (body == null || body.isEmpty()) {
            return snapshots;
        }

        JSONArray rows = new JSONArray(body);

        // Row 0 is the column header. Later rows are snapshots, oldest first, and many of them
        // are the redirects Imgur served on its way to removing something, so the status has to
        // be checked rather than simply taking the first.
        for (int i = 1; i < rows.length() && snapshots.size() < limit; i++) {
            JSONArray row = rows.optJSONArray(i);
            if (row == null || row.length() < 5) continue;

            // A large file is often captured from a ranged request and stored as a 206. It
            // replays in full regardless, and for video it is frequently the only capture
            // there is.
            String status = row.optString(4, "");
            if (!"200".equals(status) && !"206".equals(status)) continue;
            if (mediaOnly && row.optString(3, "").startsWith("text/")) continue;

            String timestamp = row.optString(1, null);
            if (timestamp != null) {
                snapshots.add(String.format(CONTENT_URL, timestamp, contentUrl));
            }
        }
        return snapshots;
    }
}
