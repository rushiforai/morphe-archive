/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.privacy;

import android.content.Context;
import android.content.SharedPreferences;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.function.UnaryOperator;

import app.hushpinterest.extension.pinterest.actions.PinFacts;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * #48: a list on the phone of the pins you like and the comments and replies you post.
 *
 * <p>The patch calls the hooks here right before Pinterest sends a reaction, takes one back, or
 * posts a comment, with the pin's id and what was sent. While Like and comment history is on and
 * HushPinterest isn't paused, each one is noted in a preferences file of its own, newest first and
 * at most {@link #LIMIT} entries. It is separate from the settings store, so a settings export
 * never carries it, and nothing here sends anything anywhere.
 *
 * <p>Every hook swallows its own failure after counting it: a list that can't be written is never
 * worth failing Pinterest's like or comment over.
 */
public final class ActivityHistory {
    private ActivityHistory() {}

    /** The preferences file the list lives in, apart from the settings store. */
    static final String STORE = "hushpinterest_activity_history";
    static final String ENTRIES = "entries_v1";

    /** The most entries kept. The oldest go first. */
    public static final int LIMIT = 500;
    /** Pinterest caps a comment at 500 characters; a longer one is cut there. */
    static final int TEXT_LIMIT = 500;
    static final int TITLE_LIMIT = 120;
    /** The same comment on the same pin again this soon is Pinterest retrying it, not a second comment. */
    static final long SAME_COMMENT_MILLIS = 60_000L;

    private static final String FAMILY = FamilyNames.LIKE_COMMENT_HISTORY;
    private static final Object LOCK = new Object();

    /** The text last read or written, and the entries it holds, so a hook doesn't parse the list each time. */
    private static String parsedFrom;
    private static List<Entry> parsed = Collections.emptyList();

    /** What a test sets the clock to. Null reads the real one. */
    static volatile Long nowForTests;

    public enum Kind { LIKE, COMMENT, REPLY }

    /** One like, comment or reply. */
    public static final class Entry {
        public final Kind kind;
        public final String pinId;
        /** When it was sent, in milliseconds since 1970. */
        public final long time;
        /** Pinterest's reaction type for a like, 0 otherwise. */
        public final int reaction;
        /** The pin's title, when one was at hand. */
        @Nullable public final String title;
        /** What a comment or reply said. Null for a like and for a comment that was only a photo. */
        @Nullable public final String text;

        Entry(Kind kind, String pinId, long time, int reaction, @Nullable String title, @Nullable String text) {
            this.kind = kind;
            this.pinId = pinId;
            this.time = time;
            this.reaction = reaction;
            this.title = title;
            this.text = text;
        }

        public String pinUrl() { return "https://www.pinterest.com/pin/" + pinId + "/"; }

        JSONObject json() throws JSONException {
            JSONObject out = new JSONObject();
            out.put("kind", kind.name());
            out.put("pin", pinId);
            out.put("time", time);
            if (reaction != 0) out.put("reaction", reaction);
            if (title != null) out.put("title", title);
            if (text != null) out.put("text", text);
            return out;
        }

        @Nullable
        static Entry of(JSONObject in) {
            Kind kind;
            try {
                kind = Kind.valueOf(in.optString("kind"));
            } catch (IllegalArgumentException unknown) {
                return null;
            }
            String pin = in.optString("pin");
            if (!validId(pin)) return null;
            return new Entry(kind, pin, in.optLong("time"), in.optInt("reaction"),
                    clip(in.isNull("title") ? null : in.optString("title"), TITLE_LIMIT),
                    clip(in.isNull("text") ? null : in.optString("text"), TEXT_LIMIT));
        }
    }

    private static boolean active() {
        try {
            return Utils.settingsReady() && Settings.LIKE_COMMENT_HISTORY.get();
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "switch read", failure);
            return false;
        }
    }

    /**
     * Placed in front of Pinterest's call that sends a reaction on a pin: the pin model the
     * request was built for, the id it sends and the reaction type. A pin liked again moves to the
     * top instead of showing twice.
     */
    public static void likeSent(Object pin, String pinId, int reaction) {
        HookStatus.invoked(FAMILY);
        try {
            if (!active() || !validId(pinId)) return;
            String title = pinId.equals(PinFacts.id(pin)) ? clip(PinFacts.title(pin), TITLE_LIMIT) : null;
            long at = now();
            boolean noted = change(Utils.getContext(), list -> {
                String kept = title;
                List<Entry> next = new ArrayList<>(list.size() + 1);
                for (Entry entry : list) {
                    if (entry.kind == Kind.LIKE && entry.pinId.equals(pinId)) continue;
                    next.add(entry);
                }
                if (kept == null) kept = knownTitle(list, pinId);
                next.add(0, new Entry(Kind.LIKE, pinId, at, reaction, kept, null));
                return next;
            });
            if (noted) HookStatus.counted(FAMILY, "like noted");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "like sent", failure);
        }
    }

    /** Placed in front of Pinterest's call that takes a reaction back: the pin's like leaves the list. */
    public static void likeRemoved(String pinId) {
        HookStatus.invoked(FAMILY);
        try {
            if (!active() || !validId(pinId)) return;
            boolean removed = change(Utils.getContext(), list -> {
                List<Entry> next = new ArrayList<>(list.size());
                for (Entry entry : list) {
                    if (entry.kind == Kind.LIKE && entry.pinId.equals(pinId)) continue;
                    next.add(entry);
                }
                return next.size() == list.size() ? null : next;
            });
            if (removed) HookStatus.counted(FAMILY, "like taken back");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "like removed", failure);
        }
    }

    /** Placed in front of Pinterest's calls that post a comment on a pin: the pin's id and the comment. */
    public static void commentPosted(String pinId, String text) {
        HookStatus.invoked(FAMILY);
        try {
            if (noteComment(Kind.COMMENT, pinId, text)) HookStatus.counted(FAMILY, "comment noted");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "comment posted", failure);
        }
    }

    /** Placed in front of Pinterest's call that posts a reply to a comment: the pin's id and the reply. */
    public static void replyPosted(String pinId, String text) {
        HookStatus.invoked(FAMILY);
        try {
            if (noteComment(Kind.REPLY, pinId, text)) HookStatus.counted(FAMILY, "reply noted");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "reply posted", failure);
        }
    }

    private static boolean noteComment(Kind kind, String pinId, String text) throws JSONException {
        if (!active() || !validId(pinId)) return false;
        String said = clip(text, TEXT_LIMIT);
        long at = now();
        return change(Utils.getContext(), list -> {
            for (Entry entry : list) {
                if (entry.kind == kind && entry.pinId.equals(pinId) && Objects.equals(entry.text, said)
                        && Math.abs(at - entry.time) < SAME_COMMENT_MILLIS) return null;
            }
            List<Entry> next = new ArrayList<>(list.size() + 1);
            next.add(new Entry(kind, pinId, at, 0, knownTitle(list, pinId), said));
            next.addAll(list);
            return next;
        });
    }

    /**
     * The list, newest first, or null when it can't be read. Read on the caller's thread: the file
     * holds at most {@link #LIMIT} short entries.
     */
    @Nullable
    public static List<Entry> entries(@Nullable Context context) {
        try {
            SharedPreferences store = store(context);
            if (store == null) return null;
            synchronized (LOCK) {
                return read(store);
            }
        } catch (RuntimeException | JSONException failure) {
            HookStatus.threw(FAMILY, "list read", failure);
            return null;
        }
    }

    /** Empties the list. False when the file couldn't be changed. */
    public static boolean clear(@Nullable Context context) {
        try {
            SharedPreferences store = store(context);
            if (store == null) return false;
            synchronized (LOCK) {
                store.edit().remove(ENTRIES).apply();
                parsedFrom = null;
                parsed = Collections.emptyList();
            }
            return true;
        } catch (RuntimeException failure) {
            HookStatus.threw(FAMILY, "list clear", failure);
            return false;
        }
    }

    /**
     * Reads the list, hands it to [edit] and writes back what it returns, the newest {@link #LIMIT}
     * of it, all under one lock so two hooks at once can't drop each other's entry. A null answer
     * leaves the file as it was. A list that can't be read starts over rather than block every
     * later like.
     */
    private static boolean change(@Nullable Context context, UnaryOperator<List<Entry>> edit) throws JSONException {
        SharedPreferences store = store(context);
        if (store == null) return false;
        synchronized (LOCK) {
            List<Entry> now;
            try {
                now = read(store);
            } catch (JSONException | RuntimeException unreadable) {
                HookStatus.threw(FAMILY, "list read", unreadable);
                now = Collections.emptyList();
            }
            List<Entry> next = edit.apply(now);
            if (next == null) return false;
            if (next.size() > LIMIT) next = new ArrayList<>(next.subList(0, LIMIT));
            JSONArray array = new JSONArray();
            for (Entry entry : next) array.put(entry.json());
            String raw = array.toString();
            store.edit().putString(ENTRIES, raw).apply();
            parsedFrom = raw;
            parsed = Collections.unmodifiableList(new ArrayList<>(next));
            return true;
        }
    }

    /** Called under {@link #LOCK}. */
    private static List<Entry> read(SharedPreferences store) throws JSONException {
        String raw = store.getString(ENTRIES, null);
        if (raw == null) return Collections.emptyList();
        if (raw.equals(parsedFrom)) return parsed;
        JSONArray array = new JSONArray(raw);
        List<Entry> found = new ArrayList<>(Math.min(array.length(), LIMIT));
        for (int i = 0; i < array.length() && found.size() < LIMIT; i++) {
            JSONObject item = array.optJSONObject(i);
            Entry entry = item == null ? null : Entry.of(item);
            if (entry != null) found.add(entry);
        }
        parsedFrom = raw;
        parsed = Collections.unmodifiableList(found);
        return parsed;
    }

    @Nullable
    private static SharedPreferences store(@Nullable Context context) {
        if (context == null) return null;
        Context app = context.getApplicationContext();
        return (app != null ? app : context).getSharedPreferences(STORE, Context.MODE_PRIVATE);
    }

    /** The title an earlier entry for the pin already has, so a comment shows it too. */
    @Nullable
    private static String knownTitle(List<Entry> list, String pinId) {
        for (Entry entry : list) if (entry.title != null && entry.pinId.equals(pinId)) return entry.title;
        return null;
    }

    static boolean validId(@Nullable String pinId) {
        return pinId != null && pinId.matches("[0-9]{1,30}");
    }

    /** Trimmed and at most [limit] characters, never splitting a surrogate pair, or null when empty. */
    @Nullable
    static String clip(@Nullable String text, int limit) {
        if (text == null) return null;
        String trimmed = text.trim();
        if (trimmed.isEmpty()) return null;
        if (trimmed.length() <= limit) return trimmed;
        int end = Character.isHighSurrogate(trimmed.charAt(limit - 1)) ? limit - 1 : limit;
        return trimmed.substring(0, end).trim();
    }

    private static long now() {
        Long forced = nowForTests;
        return forced != null ? forced : System.currentTimeMillis();
    }
}
