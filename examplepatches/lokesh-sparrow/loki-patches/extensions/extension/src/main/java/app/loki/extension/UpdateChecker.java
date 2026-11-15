/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.os.Handler;
import android.os.Looper;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

/**
 * Asks GitHub for the newest stable release of the patch bundle and reports whether the installed
 * one is behind. The request runs on a background thread and the answer is delivered on the main
 * thread, because the caller is a screen the user is looking at.
 */
public final class UpdateChecker {
    static final String REPO = "lokesh-sparrow/loki-patches";
    private static final String LATEST_RELEASE_URL = "https://api.github.com/repos/" + REPO + "/releases/latest";
    private static final String GITHUB_JSON_TYPE = "application/vnd.github+json";
    private static final int TIMEOUT_MS = 8000;
    private static final String THREAD_NAME = "LokiUpdateCheck";

    public enum Status {
        UPDATE_AVAILABLE,
        UP_TO_DATE,
        /** No stable release exists yet: GitHub answers 404 for the latest-release endpoint. */
        NO_RELEASE,
        FAILED
    }

    public interface Callback {
        void onResult(Status result, String latestVersion);
    }

    private UpdateChecker() {
    }

    /** Starts the check; {@code callback} is called exactly once, on the main thread. */
    static void check(Callback callback) {
        Handler mainThread = new Handler(Looper.getMainLooper());
        Thread worker = new Thread(() -> {
            Reply reply = askGitHub();
            mainThread.post(() -> callback.onResult(reply.status(), reply.tag));
        }, THREAD_NAME);
        worker.start();
    }

    private static final class Reply {
        final boolean reached;
        /** Release version without the leading "v"; null when there is no release yet. */
        final String tag;

        Reply(boolean reached, String tag) {
            this.reached = reached;
            this.tag = tag;
        }

        Status status() {
            if (!reached) return Status.FAILED;
            if (tag == null) return Status.NO_RELEASE;
            return isNewer(tag, MenuInfo.patchesVersion()) ? Status.UPDATE_AVAILABLE : Status.UP_TO_DATE;
        }
    }

    private static Reply askGitHub() {
        HttpURLConnection http = null;
        try {
            http = (HttpURLConnection) new URL(LATEST_RELEASE_URL).openConnection();
            http.setConnectTimeout(TIMEOUT_MS);
            http.setReadTimeout(TIMEOUT_MS);
            http.setRequestProperty("Accept", GITHUB_JSON_TYPE);
            int status = http.getResponseCode();
            if (status == 404) return new Reply(true, null);
            if (status != 200) return new Reply(false, null);
            try (InputStream body = http.getInputStream()) {
                ByteArrayOutputStream raw = new ByteArrayOutputStream();
                byte[] chunk = new byte[8192];
                int read;
                while ((read = body.read(chunk)) > 0) raw.write(chunk, 0, read);
                String tagName = new JSONObject(raw.toString(StandardCharsets.UTF_8.name()))
                        .optString("tag_name", "");
                if (tagName.isEmpty()) return new Reply(false, null);
                return new Reply(true, tagName.startsWith("v") ? tagName.substring(1) : tagName);
            }
        } catch (Throwable offline) {
            return new Reply(false, null);
        } finally {
            if (http != null) http.disconnect();
        }
    }

    /** Whether {@code candidate} is later than {@code current}; anything not major.minor.patch is never newer. */
    static boolean isNewer(String candidate, String current) {
        int[] theirs = triple(candidate);
        int[] ours = triple(current);
        if (theirs == null || ours == null) return false;
        for (int i = 0; i < 3; i++) {
            if (theirs[i] != ours[i]) return theirs[i] > ours[i];
        }
        return current.contains("-") && !candidate.contains("-");
    }

    private static int[] triple(String version) {
        if (version == null) return null;
        int dash = version.indexOf('-');
        String[] parts = (dash < 0 ? version : version.substring(0, dash)).split("\\.");
        if (parts.length <= 2) return null;
        try {
            return new int[]{
                    Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), Integer.parseInt(parts[2])};
        } catch (NumberFormatException notANumber) {
            return null;
        }
    }
}
