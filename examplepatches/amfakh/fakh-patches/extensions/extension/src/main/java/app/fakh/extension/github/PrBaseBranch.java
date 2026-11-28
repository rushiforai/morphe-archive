/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;

/**
 * Shows a pull request's base branch chip in PR lists whenever it targets a non-default branch. The patch adds
 * {@code baseRef { name repository { defaultBranchRef { name } } }} to {@code PullRequestItemFragment}.
 */
@SuppressWarnings("unused")
public final class PrBaseBranch {
    private static final ThreadLocal<String> ID = new ThreadLocal<>();

    private PrBaseBranch() {
    }

    /**
     * Appends {@code fakhPrId} and {@code fakhPrBranch} to the PR fragment parser's field names.
     *
     * @param names The app's field names.
     * @return Those names followed by the two added fields.
     */
    public static List<Object> names(List<?> names) {
        List<Object> all = new ArrayList<>(names);
        all.add("fakhPrId");
        all.add("fakhPrBranch");
        return all;
    }

    /** Records the PR node id whose base branch follows. */
    public static void id(Object id) {
        ID.set(id instanceof String ? (String) id : null);
    }

    /**
     * Saves the PR's base branch if it differs from the repository's default branch.
     *
     * @param raw The parsed JSON map for {@code baseRef}.
     */
    public static void branch(Object raw) {
        String id = ID.get();
        SharedPreferences saved = saved();
        if (id == null || saved == null) return;
        String base = null;
        String defaultBranch = null;
        if (raw instanceof Map) {
            Map<?, ?> ref = (Map<?, ?>) raw;
            if (ref.get("name") instanceof String) base = (String) ref.get("name");
            Object repoObj = ref.get("repository");
            if (repoObj instanceof Map) {
                Object defObj = ((Map<?, ?>) repoObj).get("defaultBranchRef");
                if (defObj instanceof Map && ((Map<?, ?>) defObj).get("name") instanceof String) {
                    defaultBranch = (String) ((Map<?, ?>) defObj).get("name");
                }
            }
        }
        if (base != null && defaultBranch != null && !base.equals(defaultBranch)) {
            if (!base.equals(saved.getString(id, null))) saved.edit().putString(id, base).apply();
        } else if (saved.contains(id)) {
            saved.edit().remove(id).apply();
        }
    }

    /**
     * The non-default base branch name for a PR, or null when it targets the default branch or the switch is off.
     *
     * @param id The PR's GraphQL node id.
     * @return The base branch name, or null.
     */
    public static String text(String id) {
        if (id == null || !Features.on("fakh_pr_base_branch")) return null;
        SharedPreferences saved = saved();
        return saved == null ? null : saved.getString(id, null);
    }

    /** Drawable resource id for the 12dp git branch icon used in PR list metadata chips. */
    @SuppressWarnings("DiscouragedApi")
    public static int icon() {
        Application app = AppRuntime.application();
        return app.getResources().getIdentifier("ic_git_branch_12", "drawable", app.getPackageName());
    }

    /** Where PR base branches are cached, or null before the app has started. */
    private static SharedPreferences saved() {
        Application app = AppRuntime.application();
        return app == null ? null : app.getSharedPreferences("fakh_pr_base_branch", Context.MODE_PRIVATE);
    }
}
