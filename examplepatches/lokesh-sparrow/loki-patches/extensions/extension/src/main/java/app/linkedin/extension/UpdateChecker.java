/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.os.Handler;
import android.os.Looper;

import org.json.JSONObject;

import android.content.Context;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Asks GitHub for the newest stable release of the patch bundle and reports whether the installed
 * one is behind for <b>this app</b>. The request runs on a background thread and the answer is
 * delivered on the main thread, because the caller is a settings screen the user is looking at.
 *
 * <p>One bundle serves several apps, so a release may change nothing for the app this menu is in.
 * Like Morphe Manager's update badge, the check reads CHANGELOG.md on main and offers an update
 * only when a release newer than the installed one names this app: a {@code - **Truecaller:** ...}
 * bullet, or the app's name in a bullet's text. When the changelog cannot be read it falls back to
 * comparing the latest release's version, as before.
 */
final class UpdateChecker {
    static final String REPO = "lokesh-sparrow/loki-patches";
    private static final String LATEST_RELEASE_URL = "https://api.github.com/repos/" + REPO + "/releases/latest";
    /** The file Morphe Manager reads for its per-app update badge. */
    private static final String CHANGELOG_URL = "https://raw.githubusercontent.com/" + REPO + "/main/CHANGELOG.md";
    private static final Pattern VERSION_HEADING = Pattern.compile("^##\\s+\\[?v?(\\d+\\.\\d+\\.\\d+[^\\]\\s]*)");
    private static final Pattern SCOPED_BULLET = Pattern.compile("^[*+-] \\*\\*(.+?):\\*\\*");
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
            Status status;
            String version;
            Changes changes = readChangelog();
            if (changes != null) {
                version = changes.latest;
                status = changes.latest == null ? Status.NO_RELEASE
                        : changes.forThisApp ? Status.UPDATE_AVAILABLE : Status.UP_TO_DATE;
            } else {
                Reply reply = askGitHub();
                version = reply.tag;
                status = reply.status();
            }
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

    /** What the changelog says: the newest version in it, and whether a newer one names this app. */
    static final class Changes {
        final String latest;
        final boolean forThisApp;

        Changes(String latest, boolean forThisApp) {
            this.latest = latest;
            this.forThisApp = forThisApp;
        }
    }

    /** Null when the changelog could not be read or this app's names are unknown: the caller falls back. */
    private static Changes readChangelog() {
        HttpURLConnection http = null;
        try {
            List<String> names = appNames();
            if (names.isEmpty()) return null;
            http = (HttpURLConnection) new URL(CHANGELOG_URL).openConnection();
            http.setConnectTimeout(TIMEOUT_MS);
            http.setReadTimeout(TIMEOUT_MS);
            if (http.getResponseCode() != 200) return null;
            String text;
            try (InputStream body = http.getInputStream()) {
                ByteArrayOutputStream raw = new ByteArrayOutputStream();
                byte[] chunk = new byte[8192];
                int read;
                while ((read = body.read(chunk)) > 0) raw.write(chunk, 0, read);
                text = raw.toString(StandardCharsets.UTF_8.name());
            }
            return changesFor(text, Settings.patchesVersion(), names);
        } catch (Throwable offline) {
            return null;
        } finally {
            if (http != null) http.disconnect();
        }
    }

    /**
     * Reads {@code changelog} (newest release first) and decides whether a release newer than
     * {@code installed} has a bullet for one of {@code names}. Package-private for tests.
     */
    static Changes changesFor(String changelog, String installed, List<String> names) {
        String latest = null;
        boolean newer = false;
        boolean found = false;
        for (String line : changelog.split("\n")) {
            String trimmed = line.trim();
            Matcher heading = VERSION_HEADING.matcher(trimmed);
            if (heading.find()) {
                String version = heading.group(1);
                if (latest == null) latest = version;
                newer = isNewer(version, installed);
                if (!newer) break; // releases are listed newest first
                continue;
            }
            if (!newer || found || !(trimmed.startsWith("- ") || trimmed.startsWith("* ") || trimmed.startsWith("+ "))) {
                continue;
            }
            Matcher scoped = SCOPED_BULLET.matcher(trimmed);
            if (scoped.find()) {
                String scope = compact(scoped.group(1));
                for (String name : names) if (compact(name).equals(scope)) found = true;
            } else {
                for (String name : names) if (mentions(trimmed, name)) found = true;
            }
        }
        return new Changes(latest, found);
    }

    /** The names a changelog uses for the app this menu is in. */
    private static List<String> appNames() {
        List<String> names = new ArrayList<>();
        Context context = app.loki.extension.LokiLog.application();
        if (context == null) return names;
        String pkg = context.getPackageName().toLowerCase(Locale.ROOT);
        // Clones get a changed package name; the original stays inside it.
        if (pkg.contains("linkedin")) names.add("LinkedIn");
        if (pkg.contains("splitwise")) names.add("Splitwise");
        if (pkg.contains("truecaller")) names.add("Truecaller");
        if (pkg.contains("docscanner")) names.add("Doc Scanner");
        return names;
    }

    private static String compact(String text) {
        StringBuilder out = new StringBuilder();
        for (char c : text.toCharArray()) if (Character.isLetterOrDigit(c)) out.append(Character.toLowerCase(c));
        return out.toString();
    }

    /** The name as a whole word, so "Truecaller" does not match inside a longer word. */
    private static boolean mentions(String bullet, String name) {
        return Pattern.compile("(?<![\\p{L}\\p{N}])" + Pattern.quote(name) + "(?![\\p{L}\\p{N}])",
                Pattern.CASE_INSENSITIVE).matcher(bullet).find();
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
