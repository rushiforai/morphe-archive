/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

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
 * thread, because the caller is a settings screen the user is looking at.
 */
final class UpdateChecker {
    static final String REPO = "lokesh-sparrow/loki-patches";
    private static final String LATEST_RELEASE_URL = "https://api.github.com/repos/" + REPO + "/releases/latest";
    private static final String GITHUB_JSON_TYPE = "application/vnd.github+json";
    private static final int TIMEOUT_MS = 8000;
    private static final String THREAD_NAME = "LokiUpdateCheck";

    enum Status {
        /** A newer stable release exists. */
        UPDATE_AVAILABLE,
        UP_TO_DATE,
        /** No stable release exists yet: GitHub answers 404 for the latest-release endpoint. */
        NO_RELEASE,
        /** The request never produced an answer: offline, timed out, or an unexpected status. */
        FAILED
    }

    interface Callback {
        /** latestVersion is null for NO_RELEASE and FAILED. */
        void onResult(Status result, String latestVersion);
    }

    private UpdateChecker() {
    }

    /** Starts the check; {@code callback} is called exactly once, on the main thread. */
    static void check(Callback callback) {
        Handler mainThread = new Handler(Looper.getMainLooper());
        Runnable work = () -> {
            Reply reply = askGitHub();
            String version = reply.tag;
            Status status = reply.status();
            mainThread.post(() -> callback.onResult(status, version));
        };
        Thread worker = new Thread(work, THREAD_NAME);
        worker.start();
    }

    /** What the GitHub request produced: a release tag, no release at all, or a failure. */
    private static final class Reply {
        /** False when the request failed (offline, wrong status, unreadable body). */
        final boolean reached;
        /** Release version without the leading "v"; null when the repository has no release yet. */
        final String tag;

        Reply(boolean reached, String tag) {
            this.reached = reached;
            this.tag = tag;
        }

        Status status() {
            if (!reached) return Status.FAILED;
            if (tag == null) return Status.NO_RELEASE;
            if (isNewer(tag, Settings.patchesVersion())) return Status.UPDATE_AVAILABLE;
            return Status.UP_TO_DATE;
        }
    }

    private static Reply askGitHub() {
        HttpURLConnection http = null;
        try {
            URL endpoint = new URL(LATEST_RELEASE_URL);
            http = (HttpURLConnection) endpoint.openConnection();
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
                JSONObject release = new JSONObject(raw.toString(StandardCharsets.UTF_8.name()));
                String tagName = release.optString("tag_name", "");
                if (tagName.isEmpty()) return new Reply(false, null);
                boolean tagged = tagName.startsWith("v");
                return new Reply(true, tagged ? tagName.substring(1) : tagName);
            }
        } catch (Throwable offline) {
            return new Reply(false, null);
        } finally {
            if (http != null) http.disconnect();
        }
    }

    /**
     * Whether {@code candidate} is a later release than {@code current}, comparing
     * major.minor.patch only. Equal numbers still count when the installed build is a pre-release
     * of them, so 1.1.0 replaces 1.1.0-dev.3.
     *
     * <p>Anything that is not three numbers is never newer: a tag GitHub returns in an unexpected
     * shape must not offer a downgrade or hide an update.
     */
    static boolean isNewer(String candidate, String current) {
        int[] theirs = triple(candidate);
        int[] ours = triple(current);
        if (theirs == null || ours == null) return false;
        if (theirs[0] != ours[0]) return theirs[0] > ours[0];
        if (theirs[1] != ours[1]) return theirs[1] > ours[1];
        if (theirs[2] != ours[2]) return theirs[2] > ours[2];
        boolean currentIsPreRelease = current.contains("-");
        boolean candidateIsPreRelease = candidate.contains("-");
        return currentIsPreRelease && !candidateIsPreRelease;
    }

    /** Major, minor and patch of a version such as 1.2.5-dev.1, or null when it has another shape. */
    private static int[] triple(String version) {
        if (version == null) return null;
        int dash = version.indexOf('-');
        String numbered = dash < 0 ? version : version.substring(0, dash);
        String[] parts = numbered.split("\\.");
        if (parts.length <= 2) return null;
        try {
            int major = Integer.parseInt(parts[0]);
            int minor = Integer.parseInt(parts[1]);
            int patch = Integer.parseInt(parts[2]);
            return new int[]{major, minor, patch};
        } catch (NumberFormatException notANumber) {
            return null;
        }
    }
}
