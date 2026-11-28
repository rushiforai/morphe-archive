/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;

/**
 * Which rows of the commit, issue and pull request lists and which events of a timeline belong to bots, so they can be
 * drawn faded. A commit and an event name their author. The list queries do not ask who opened an issue or pull request,
 * so the patch adds that to them, reads it while the app parses the answer and keeps the ids that bots opened. They are
 * saved because the app can draw a list from its own cache.
 */
@SuppressWarnings("unused")
public final class Bots {
    // Bots without the "[bot]" ending: accounts that commit like bots, as listed by Refined GitHub, and coding agents
    // under the names their commits and events show. The case matters, as claude and codex are other accounts.
    private static final List<String> NAMED_BOTS = Arrays.asList(
            "actions-user", "bors", "ImgBotApp", "renovate-bot", "rust-highfive", "scala-steward", "weblate",
            "Claude", "Codex", "Copilot");

    // The author in the toString of a commit model.
    private static final Pattern COMMIT_AUTHOR = Pattern.compile(", author=Author\\(loginString=([^,]*),");

    // The id in the toString of an issue or pull request row.
    private static final Pattern ROW_ID = Pattern.compile(", id=([\\w=-]+), url=");

    // The actor in the id of a timeline event's line, as in cross_referenced_event_span:renovate[bot]:2026-01-01.
    private static final Pattern EVENT_ACTOR =
            Pattern.compile("^ListItemSpannableText\\(uniqueId=\\w+_span:([^:,]+):");

    // The login and the shown name of a bot in the author of the card under an event.
    private static final Pattern CARD_ACTOR = Pattern.compile("^ListItemCrossReference\\(reference=\\w+\\(author="
            + "Author\\(loginString=([^,]*), .*?botDisplayName=([^,]*),");

    // For each class of timeline item, whether it is an event's line or card.
    private static final Map<Class<?>, Boolean> EVENTS = new HashMap<>();

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
     * Fades the line or the card of a timeline event by a bot.
     *
     * @param row  The view of the row, which may have shown another event before.
     * @param item The app's model of the row.
     */
    public static void event(View row, Object item) {
        Boolean event = EVENTS.get(item.getClass());
        if (event == null) {
            String text = String.valueOf(item);
            event = text.startsWith("ListItemSpannableText(") || text.startsWith("ListItemCrossReference(");
            EVENTS.put(item.getClass(), event);
        }
        if (!event) return;
        float alpha = Features.on("fakh_dim_bots") && isBot(actor(String.valueOf(item))) ? 0.5f : 1;
        // The list animates the alpha of the row itself, so what the row holds is faded.
        if (row instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) row;
            for (int i = 0; i < group.getChildCount(); i++) group.getChildAt(i).setAlpha(alpha);
        } else {
            row.setAlpha(alpha);
        }
    }

    /** Who made a timeline event, or null when its item does not say. */
    private static String actor(String item) {
        Matcher line = EVENT_ACTOR.matcher(item);
        if (line.find()) return line.group(1);
        Matcher card = CARD_ACTOR.matcher(item);
        if (!card.find()) return null;
        String shown = card.group(2);
        return shown.isEmpty() || shown.equals("null") ? card.group(1) : shown;
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
        if (author.find()) return isBot(author.group(1));
        Matcher id = ROW_ID.matcher(text);
        SharedPreferences saved = saved();
        return saved != null && id.find() && saved.contains(id.group(1));
    }

    /** Whether the author of a commit or an event is a bot or a coding agent. */
    private static boolean isBot(String login) {
        return login != null && (login.endsWith("[bot]") || NAMED_BOTS.contains(login));
    }

    /** Where the ids are kept, or null before the app has started. */
    private static SharedPreferences saved() {
        Application app = AppRuntime.application();
        return app == null ? null : app.getSharedPreferences("fakh_bots", Context.MODE_PRIVATE);
    }
}
