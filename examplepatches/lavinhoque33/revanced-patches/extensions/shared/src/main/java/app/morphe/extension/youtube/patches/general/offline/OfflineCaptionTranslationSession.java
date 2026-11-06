/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-31.
 */

package app.morphe.extension.youtube.patches.general.offline;

import android.os.SystemClock;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.List;
import java.util.concurrent.CancellationException;

import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.youtube.patches.general.offline.OfflineCaptionChoices.Track;

/** One ephemeral, signed-out browser session for the selected translations of a download. */
final class OfflineCaptionTranslationSession {
    private static final long PREPARATION_MS = 65_000;
    private static final long REQUEST_INTERVAL_MS = 4_000;
    private static final String BROWSER_USER_AGENT = "Mozilla/5.0 (X11; Linux x86_64) "
            + "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36";

    private final String referer;
    private final String cookies;
    private final List<Track> tracks;
    private long nextRequestAtMs;

    private OfflineCaptionTranslationSession(String referer, String cookies, List<Track> tracks) {
        this.referer = referer;
        this.cookies = cookies;
        this.tracks = tracks;
        nextRequestAtMs = SystemClock.elapsedRealtime() + PREPARATION_MS;
    }

    static OfflineCaptionTranslationSession create(String videoId, List<Track> tracks) throws IOException {
        String referer = "https://www.youtube.com/watch?v=" + videoId + "&hl=en";
        HttpURLConnection connection = Requester.openConnection(referer);
        try {
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(15_000);
            connection.setUseCaches(false);
            connection.setRequestProperty("User-Agent", BROWSER_USER_AGENT);
            connection.setRequestProperty("Cookie", "");
            int status = connection.getResponseCode();
            Logger.printDebug(() -> "Offline caption translation session HTTP " + status);
            if (status != 200) throw new IOException("Translation session HTTP " + status);
            String cookies = OfflineSubtitle.visitorCookies(connection.getHeaderFields());
            if (cookies.isEmpty()) throw new IOException("Translation session has no visitor cookies");
            // Only response headers are needed. Do not allocate or parse the watch-page HTML.
            connection.getInputStream().close();
            return new OfflineCaptionTranslationSession(referer, cookies, tracks);
        } finally {
            connection.disconnect();
        }
    }

    Track currentTrack(Track selected) throws IOException {
        for (Track track : tracks) {
            if (track.key().equals(selected.key())) return track;
        }
        throw new IOException("Translation target is no longer available: " + selected.translation());
    }

    void awaitReady(OfflineDownloader.Task task) throws InterruptedException {
        synchronized (task) {
            while (true) {
                if (task.cancelled) throw new CancellationException();
                long remaining = nextRequestAtMs - SystemClock.elapsedRealtime();
                if (remaining <= 0) return;
                task.wait(remaining);
            }
        }
    }

    void requestFinished() {
        nextRequestAtMs = SystemClock.elapsedRealtime() + REQUEST_INTERVAL_MS;
    }

    void applyHeaders(HttpURLConnection connection) {
        connection.setRequestProperty("Cookie", cookies);
        connection.setRequestProperty("Origin", "https://www.youtube.com");
        connection.setRequestProperty("Referer", referer);
    }
}
