/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;

/**
 * Displays git tag badges next to commits in commit lists. The patch adds a {@code refs(refPrefix: "refs/tags/", ...)}
 * field to the Commits query and hands the parsed result to {@link #tags(Object)}, which maps each commit node id to
 * its tag name(s).
 */
@SuppressWarnings("unused")
public final class CommitTags {
    // Starts the key that lists the commits saved for a repository. No commit id starts with it.
    private static final String REPOSITORY = "repo:";

    // The tag chips drawn under commits, kept only while the app keeps them.
    private static final Map<Object, Boolean> CHIPS = new WeakHashMap<>();

    private CommitTags() {
    }

    /**
     * Appends {@code fakhTags} to the repository parser's field list.
     *
     * @param names The app's field names.
     * @return Those names followed by {@code fakhTags}.
     */
    public static List<Object> names(List<?> names) {
        List<Object> all = new ArrayList<>(names);
        all.add("fakhTags");
        return all;
    }

    /**
     * Records the mapping from commit node id to tag name(s) from the parsed {@code fakhTags} GraphQL response.
     *
     * @param raw The parsed JSON map for {@code refs(...)}.
     */
    public static void tags(Object raw) {
        if (!(raw instanceof Map)) return;
        Object nodesObj = ((Map<?, ?>) raw).get("nodes");
        if (!(nodesObj instanceof List)) return;
        Map<String, List<String>> byCommit = new LinkedHashMap<>();
        String repository = null;
        for (Object item : (List<?>) nodesObj) {
            if (!(item instanceof Map)) continue;
            Map<?, ?> node = (Map<?, ?>) item;
            Object nameObj = node.get("name");
            Object targetObj = node.get("target");
            if (!(nameObj instanceof String) || !(targetObj instanceof Map)) continue;
            Object repositoryObj = node.get("repository");
            if (repositoryObj instanceof Map && ((Map<?, ?>) repositoryObj).get("id") instanceof String) {
                repository = (String) ((Map<?, ?>) repositoryObj).get("id");
            }
            String commitId = commitIdOf((Map<?, ?>) targetObj);
            if (commitId == null) continue;
            List<String> list = byCommit.get(commitId);
            if (list == null) {
                list = new ArrayList<>();
                byCommit.put(commitId, list);
            }
            if (!list.contains(nameObj)) list.add((String) nameObj);
        }
        SharedPreferences saved = saved();
        // Only a tag says which repository answered, so one whose last tag was deleted keeps what is saved.
        if (saved == null || repository == null) return;
        SharedPreferences.Editor editor = saved.edit();
        // A deleted or moved tag leaves its commit, so what was saved for the repository goes first.
        for (String commit : saved.getStringSet(REPOSITORY + repository, Collections.<String>emptySet())) {
            editor.remove(commit);
        }
        for (Map.Entry<String, List<String>> entry : byCommit.entrySet()) {
            StringBuilder joined = new StringBuilder();
            for (String tag : entry.getValue()) {
                if (joined.length() > 0) joined.append(", ");
                joined.append(tag);
            }
            editor.putString(entry.getKey(), joined.toString());
        }
        editor.putStringSet(REPOSITORY + repository, new HashSet<>(byCommit.keySet())).apply();
    }

    /**
     * The tag label to display for a commit, or null when it has no tags or the switch is off.
     *
     * @param commitId The commit's GraphQL node id.
     * @return The formatted tag name(s), or null.
     */
    public static String text(String commitId) {
        if (commitId == null || !Features.on("fakh_commit_tags")) return null;
        SharedPreferences saved = saved();
        return saved == null ? null : saved.getString(commitId, null);
    }

    /**
     * Remembers a tag chip, which {@link #inset} lines up with the avatar above it.
     *
     * @param item The chip's model.
     */
    public static void chip(Object item) {
        CHIPS.put(item, Boolean.TRUE);
    }

    /**
     * The room the app leaves on both sides of a chip. The patch has the app ask for it before drawing one.
     *
     * @param item     The chip's model.
     * @param original The app's room, in dp.
     * @return No room for a tag chip, the app's for any other.
     */
    public static float inset(Object item, float original) {
        return CHIPS.containsKey(item) ? 0 : original;
    }

    /** Drawable resource id for the git tag icon. */
    @SuppressWarnings("DiscouragedApi")
    public static int icon() {
        Application app = AppRuntime.application();
        return app.getResources().getIdentifier("ic_tag_16", "drawable", app.getPackageName());
    }

    /** Extracts the target commit id from either a direct Commit target or an annotated Tag target. */
    private static String commitIdOf(Map<?, ?> target) {
        Object id = target.get("id");
        if (id instanceof String) return (String) id;
        Object inner = target.get("target");
        if (inner instanceof Map) {
            Object innerId = ((Map<?, ?>) inner).get("id");
            if (innerId instanceof String) return (String) innerId;
        }
        return null;
    }

    /** Where commit-to-tag mappings are cached, or null before the app has started. */
    private static SharedPreferences saved() {
        Application app = AppRuntime.application();
        return app == null ? null : app.getSharedPreferences("fakh_commit_tags", Context.MODE_PRIVATE);
    }
}
