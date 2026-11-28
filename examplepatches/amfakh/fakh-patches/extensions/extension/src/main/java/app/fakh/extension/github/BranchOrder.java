/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.format.DateUtils;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.I18n;

/**
 * Puts the pinned and the recently pushed branches at the top of the branch picker, after the default branch the app
 * already lists first. The app reads branches in alphabetical pages, so the extension asks GitHub for these branches,
 * and for the repository's latest activity, itself, with the account's token.
 */
@SuppressWarnings("unused")
public final class BranchOrder {
    private static final String TAG = "FakhBranches";
    private static final String API = "https://api.github.com";
    private static final int TIMEOUT_MS = 10_000;
    private static final String PINNED_FEATURE = "fakh_pinned_branches";
    static final String RECENT_FEATURE = "fakh_recent_branches";
    private static final String RECENT_COUNT = "fakh_recent_branches_count";
    // In the order they are listed.
    private static final List<String> PINNED = Arrays.asList("develop", "main", "master", "staging");

    // Per "owner/repository", the branches that go on top.
    private static final Map<String, Top> TOPS = new ConcurrentHashMap<>();
    // Per list of an open picker, whose branches it holds. Used on the main thread only.
    private static final Map<Object, Open> OPEN = new WeakHashMap<>();
    // The notes of the rows, per row id.
    private static final Map<Long, String> NOTES = new ConcurrentHashMap<>();
    // The settings the cached branches were read with. Used on the main thread only.
    private static String settings;

    private BranchOrder() {
    }

    /** The app's model of one branch. The patch makes the app's class implement it. */
    public interface Branch {
        /** The node id of the branch's repository. */
        String fakhRepositoryId();

        /** The branch's name. */
        String fakhName();

        /** Another branch of the same repository. */
        Object fakhCopy(String id, String oid, String name);
    }

    /** The app's view model of a branch picker. The patch makes the app's class implement it. */
    public interface Picker {
        /** What the user searches for, empty when listing every branch. */
        String fakhQuery();

        /** Arranges the listed branches again. */
        void fakhRefresh();
    }

    /** A branch that goes on top. */
    private static final class Entry {
        final String name;
        final String id;
        final String oid;
        // When it was last pushed to, or 0 when the latest activity does not say.
        final long pushed;

        Entry(String name, String id, String oid, long pushed) {
            this.name = name;
            this.id = id;
            this.oid = oid;
            this.pushed = pushed;
        }
    }

    /** The branches that go on top of one repository's list. */
    private static final class Top {
        final String repositoryId;
        final List<Entry> entries;

        Top(String repositoryId, List<Entry> entries) {
            this.repositoryId = repositoryId;
            this.entries = entries;
        }
    }

    /** An open picker. */
    private static final class Open {
        // Weak, since the picker holds the list that is the key of this entry.
        final WeakReference<Picker> picker;
        final String repository;

        Open(Picker picker, String repository) {
            this.picker = new WeakReference<>(picker);
            this.repository = repository;
        }
    }

    /** A list that equals only itself, so the app's state flow takes every arrangement as a new value. */
    private static final class Arranged extends ArrayList<Object> {
        @Override
        public boolean equals(Object other) {
            return this == other;
        }

        @Override
        public int hashCode() {
            return System.identityHashCode(this);
        }
    }

    /**
     * Reads the branches that go on top when a picker opens, and arranges its list once they arrive.
     *
     * @param picker The picker's view model.
     * @param list   The flow that holds the listed branches.
     * @param owner  The repository's owner.
     * @param name   The repository's name.
     */
    public static void load(Picker picker, Object list, String owner, String name) {
        boolean pinned = Features.on(PINNED_FEATURE);
        int recent = recentCount();
        // What was read with other settings must not show.
        if (!(pinned + " " + recent).equals(settings)) {
            TOPS.clear();
            settings = pinned + " " + recent;
        }
        if (!pinned && recent == 0) return;
        String repository = owner + "/" + name;
        OPEN.put(list, new Open(picker, repository));
        String token = NativeAssetDownload.token(Uri.parse(API));
        if (token == null) return;
        WeakReference<Picker> open = new WeakReference<>(picker);
        new Thread(() -> {
            try {
                Top top = fetch(owner, name, token, pinned ? PINNED : Collections.<String>emptyList(), recent);
                if (top == null) return;
                TOPS.put(repository, top);
                new Handler(Looper.getMainLooper()).post(() -> {
                    Picker current = open.get();
                    if (current != null) current.fakhRefresh();
                });
            } catch (Exception error) {
                Log.w(TAG, "Branches of " + repository, error);
            }
        }).start();
    }

    /**
     * Arranges the branches the app is about to list. Search results stay as GitHub sends them.
     *
     * @param list     The flow that will hold the branches.
     * @param branches The app's branches.
     * @return The branches with the top ones first, or the given list when there is nothing to arrange.
     */
    public static List<?> arrange(Object list, List<?> branches) {
        Open open = OPEN.get(list);
        if (open == null || branches == null || branches.isEmpty()) return branches;
        Picker picker = open.picker.get();
        Top top = TOPS.get(open.repository);
        if (picker == null || top == null || !picker.fakhQuery().isEmpty()) return branches;
        Branch first = (Branch) branches.get(0);
        // A GitHub Enterprise repository may share its name with one on github.com.
        if (!top.repositoryId.equals(first.fakhRepositoryId())) return branches;

        Map<String, Object> byName = new LinkedHashMap<>();
        for (Object branch : branches) {
            byName.put(((Branch) branch).fakhName(), branch);
        }
        Arranged arranged = new Arranged();
        for (Entry entry : top.entries) {
            Object listed = byName.remove(entry.name);
            arranged.add(listed != null ? listed : first.fakhCopy(entry.id, entry.oid, entry.name));
        }
        arranged.addAll(byName.values());
        return arranged;
    }

    /**
     * The id of a branch's row. It changes with the row's note, so the app draws the row again when the note arrives.
     *
     * @param branch The app's branch.
     * @return The hash of the name, which the app uses, or one that includes the note.
     */
    public static int key(Object branch) {
        String name = ((Branch) branch).fakhName();
        String note = note((Branch) branch);
        if (note == null) return name.hashCode();
        int key = Objects.hash(name, note);
        NOTES.put((long) key, note);
        return key;
    }

    /**
     * Whether a row shows a badge.
     *
     * @param row          The row's id.
     * @param defaultBadge Whether the app shows its badge of the default branch.
     */
    public static boolean badge(long row, boolean defaultBadge) {
        return defaultBadge || NOTES.containsKey(row);
    }

    /**
     * The text of a row's badge, shown and read aloud.
     *
     * @param row      The row's id.
     * @param original The app's text for the default branch.
     * @return The row's note, or the app's text.
     */
    public static String label(long row, String original) {
        String note = NOTES.get(row);
        return note != null ? note : original;
    }

    /** How many recently pushed branches go on top: 0 for none, 5 until the user picks. */
    static int recentCount() {
        if (!Features.has(RECENT_FEATURE)) return 0;
        try {
            return Integer.parseInt(Features.text(RECENT_COUNT, "5"));
        } catch (NumberFormatException error) {
            return 5;
        }
    }

    /** Saves how many recently pushed branches go on top. */
    static void setRecentCount(int count) {
        Features.setText(RECENT_COUNT, String.valueOf(count));
    }

    /** What a top branch's row says: how long ago it was pushed to, or that it is pinned. Null for other branches. */
    private static String note(Branch branch) {
        for (Top top : TOPS.values()) {
            if (!top.repositoryId.equals(branch.fakhRepositoryId())) continue;
            for (Entry entry : top.entries) {
                if (!entry.name.equals(branch.fakhName())) continue;
                if (entry.pushed == 0) return I18n.tr("Pinned");
                return DateUtils.getRelativeTimeSpanString(entry.pushed, System.currentTimeMillis(),
                        DateUtils.MINUTE_IN_MILLIS, DateUtils.FORMAT_ABBREV_RELATIVE).toString();
            }
        }
        return null;
    }

    /**
     * The pinned branches that exist, then up to {@code count} recently pushed ones, or null when GitHub does not
     * answer.
     */
    private static Top fetch(String owner, String name, String token, List<String> pinned, int count)
            throws Exception {
        Map<String, Long> pushed = new LinkedHashMap<>();
        // Without the activity, which some tokens may not read, the pinned branches still go on top.
        String activity = count == 0 ? null : request(API + "/repos/" + Uri.encode(owner) + "/" + Uri.encode(name)
                + "/activity?per_page=100", token, null);
        if (activity != null) {
            JSONArray events = new JSONArray(activity);
            Set<String> seen = new LinkedHashSet<>();
            // Newest first, so the first event of a branch says when it was pushed to, or that it is gone.
            for (int i = 0; i < events.length(); i++) {
                JSONObject event = events.getJSONObject(i);
                String ref = event.optString("ref");
                if (!ref.startsWith("refs/heads/") || !seen.add(ref)
                        || "branch_deletion".equals(event.optString("activity_type"))) continue;
                pushed.put(ref.substring("refs/heads/".length()),
                        Instant.parse(event.getString("timestamp")).toEpochMilli());
            }
        }

        List<String> asked = new ArrayList<>(pinned);
        // Recently pushed branches are checked for existence, so ask for some more than are listed.
        for (String branch : pushed.keySet()) {
            if (asked.size() >= pinned.size() + 3 * count) break;
            if (!pinned.contains(branch)) asked.add(branch);
        }
        StringBuilder query = new StringBuilder("query($owner:String!,$name:String!");
        StringBuilder refs = new StringBuilder();
        JSONObject variables = new JSONObject().put("owner", owner).put("name", name);
        for (int i = 0; i < asked.size(); i++) {
            query.append(",$b").append(i).append(":String!");
            refs.append(" b").append(i).append(":ref(qualifiedName:$b").append(i).append("){id target{oid}}");
            variables.put("b" + i, "refs/heads/" + asked.get(i));
        }
        query.append("){repository(owner:$owner,name:$name){id defaultBranchRef{name}").append(refs).append("}}");
        String answer = request(API + "/graphql", token,
                new JSONObject().put("query", query.toString()).put("variables", variables).toString());
        if (answer == null) return null;
        JSONObject data = new JSONObject(answer).optJSONObject("data");
        JSONObject repository = data == null ? null : data.optJSONObject("repository");
        if (repository == null) return null;
        JSONObject defaultRef = repository.optJSONObject("defaultBranchRef");
        String defaultName = defaultRef == null ? null : defaultRef.optString("name");

        List<Entry> entries = new ArrayList<>();
        int recent = 0;
        for (int i = 0; i < asked.size(); i++) {
            String branch = asked.get(i);
            JSONObject ref = repository.optJSONObject("b" + i);
            // The app lists the default branch first on its own.
            if (ref == null || branch.equals(defaultName)) continue;
            if (!pinned.contains(branch) && recent++ >= count) break;
            Long when = pushed.get(branch);
            entries.add(new Entry(branch, ref.getString("id"), ref.getJSONObject("target").getString("oid"),
                    when == null ? 0 : when));
        }
        return new Top(repository.getString("id"), entries);
    }

    /** The body of a successful answer, or null. A request with a body is a POST. */
    private static String request(String url, String token, String body) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(TIMEOUT_MS);
        connection.setReadTimeout(TIMEOUT_MS);
        connection.setRequestProperty("Authorization", "Bearer " + token);
        connection.setRequestProperty("Accept", "application/vnd.github+json");
        try {
            if (body != null) {
                connection.setDoOutput(true);
                try (OutputStream out = connection.getOutputStream()) {
                    out.write(body.getBytes(StandardCharsets.UTF_8));
                }
            }
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) {
                Log.w(TAG, "HTTP " + code + " for " + connection.getURL().getPath());
                return null;
            }
            try (InputStream in = connection.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int read;
                while ((read = in.read(buffer)) >= 0) out.write(buffer, 0, read);
                return out.toString(StandardCharsets.UTF_8.name());
            }
        } finally {
            connection.disconnect();
        }
    }
}
