/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import okhttp3.Call;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/** An anonymous probe through this app's network path, not Android's system-UID validation. */
final class OfflineWatchProbe {
    static final long TIMEOUT_MS = 1_500L;

    private static final Request REQUEST = new Request.Builder()
            .url("https://www.youtube.com/generate_204")
            .header("Cache-Control", "no-cache, no-store")
            .build();

    private static final OkHttpClient CLIENT = new OkHttpClient.Builder()
            .callTimeout(TIMEOUT_MS, TimeUnit.MILLISECONDS)
            .connectTimeout(TIMEOUT_MS, TimeUnit.MILLISECONDS)
            .readTimeout(TIMEOUT_MS, TimeUnit.MILLISECONDS)
            .followRedirects(false)
            .followSslRedirects(false)
            .retryOnConnectionFailure(false)
            .build();

    private OfflineWatchProbe() {
    }

    /** Call only on a worker thread. No auth, cookies or download identity are sent. */
    static boolean isReachable() {
        return isReachable(CLIENT.newCall(REQUEST));
    }

    static boolean isReachable(Call call) {
        try (Response response = call.execute()) {
            // A redirect, proxy login page, or other body is not an affirmative answer.
            return response.code() == 204;
        } catch (IOException | RuntimeException ex) {
            return false;
        }
    }
}
