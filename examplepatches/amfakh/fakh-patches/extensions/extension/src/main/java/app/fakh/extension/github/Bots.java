/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;

/**
 * Which rows of the commit, issue and pull request lists belong to bots, so they can be drawn faded. A commit names its
 * author. The list queries do not ask who opened an issue or pull request, so the patch adds that to them, reads it while
 * the app parses the answer and keeps the ids that bots opened. They are saved because the app can draw a list from its
 * own cache.
 */
@SuppressWarnings("unused")
public final class Bots {
    // Accounts that commit like bots without the "[bot]" ending, as listed by Refined GitHub.
    private static final List<String> NAMED_BOTS = Arrays.asList(
            "actions-user", "bors", "ImgBotApp", "renovate-bot", "rust-highfive", "scala-steward", "weblate");

    // The author in the toString of a commit model.
    private static final Pattern COMMIT_AUTHOR = Pattern.compile(", author=Author\\(loginString=([^,]*),");

    // The id in the toString of an issue or pull request row.
    private static final Pattern ROW_ID = Pattern.compile(", id=([\\w=-]+), url=");

    // The id read just before an author, on the thread that parses that answer.
    private static final ThreadLocal<String> ID = new ThreadLocal<>();

    // The row being composed.
    private static Object row;

    private Bots() {
    }

    /**
     * Adds the two fields of the patched query to the names a response parser looks for.
     *
     * @param names The app's field names.
     * @return Those names, then the id's alias and the author's.
     */
    public static List<Object> names(List<?> names) {
        List<Object> all = new ArrayList<>(names);
        all.add("fakhKey");
        all.add("fakhAuthor");
        return all;
    }

    /**
     * Takes the id of the issue or pull request whose author comes next.
     *
     * @param id The value of {@code fakhKey}.
     */
    public static void id(Object id) {
        ID.set(id instanceof String ? (String) id : null);
    }

    /**
     * Saves whether a bot opened the issue or pull request last given to {@link #id}.
     *
     * @param author The value of {@code fakhAuthor}: a map with the author's kind, or null for a deleted account.
     */
    public static void author(Object author) {
        String id = ID.get();
        SharedPreferences saved = saved();
        if (id == null || saved == null) return;
        boolean bot = author instanceof Map && "Bot".equals(String.valueOf(((Map<?, ?>) author).get("__typename")));
        if (bot == saved.contains(id)) return;
        if (bot) saved.edit().putBoolean(id, true).apply();
        else saved.edit().remove(id).apply();
    }

    /**
     * Remembers the row composed next.
     *
     * @param model The app's model of the row: a commit, an issue or a pull request.
     */
    public static void row(Object model) {
        row = model;
    }

    /**
     * Whether the row last given to {@link #row} should be faded.
     *
     * @return True for a bot's row.
     */
    public static boolean fades() {
        if (!Features.on("fakh_dim_bots")) return false;
        String text = String.valueOf(row);
        Matcher author = COMMIT_AUTHOR.matcher(text);
        if (author.find()) return isBotCommitter(author.group(1));
        Matcher id = ROW_ID.matcher(text);
        SharedPreferences saved = saved();
        return saved != null && id.find() && saved.contains(id.group(1));
    }

    /** Whether a commit author is a bot. Copilot writes the changes themselves, so its commits stay as they are. */
    private static boolean isBotCommitter(String login) {
        if (login.toLowerCase().contains("copilot")) return false;
        return login.endsWith("[bot]") || NAMED_BOTS.contains(login);
    }

    /** Where the ids are kept, or null before the app has started. */
    private static SharedPreferences saved() {
        Application app = AppRuntime.application();
        return app == null ? null : app.getSharedPreferences("fakh_bots", Context.MODE_PRIVATE);
    }
}
