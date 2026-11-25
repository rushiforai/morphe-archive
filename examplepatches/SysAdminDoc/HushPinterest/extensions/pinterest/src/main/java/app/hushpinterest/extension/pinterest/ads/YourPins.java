/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Field;
import java.util.Map;

import app.hushpinterest.extension.shared.Utils;

/**
 * Pins you saved stay where you saved them (#49). Hide AI-labeled pins, Hide pins that say they're AI,
 * Hide shopping and product pins, Hide video pins and Muted words are about what Pinterest puts in
 * front of you. The list hook can't tell your board from a search, so without this a board of yours
 * lost every pin they matched, and one that lost most of them looked like it held only a few.
 *
 * <p>A pin is yours when Pinterest says you own it, when you're its pinner, or when its board is one
 * you own or collaborate on. Who you are is the id Pinterest keeps for the signed-in account, read
 * again for each page so a switch to another account is followed. Ads never count as yours.
 */
public final class YourPins {
    private YourPins() {}

    static final String OWNED = "is_owned_by_viewer";
    static final String PINNER = "pinner";
    static final String BOARD = "board";
    static final String OWNER = "owner";
    static final String COLLABORATED = "collaborated_by_me";

    /** Pinterest's own preferences and the key it keeps the signed-in account's id under. */
    static final String PREFERENCES = "pinterest";
    static final String MY_ID = "PREF_MY_ID";

    /** The signed-in account's id, or null when there's none or it can't be read. Never throws. */
    static String viewer() {
        try {
            Context context = Utils.getContext();
            if (context == null) return null;
            SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            Object id = preferences.getAll().get(MY_ID);
            return id instanceof String && !((String) id).isEmpty() ? (String) id : null;
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Why [item] is a pin of yours, or null when it isn't one or nothing says so. [viewer] is the
     * signed-in account's id, or null. Never throws.
     */
    static String why(Object item, String viewer) {
        try {
            if (item == null) return null;
            Map<String, Field> fields = ModelFields.of(item.getClass());
            if (!PinWords.isPin(fields)) return null;
            if (ModelFields.isTrue(fields, item, OWNED)) return "you own it";
            if (isViewer(ModelFields.read(fields, item, PINNER), viewer)) return "you saved it";
            Object board = ModelFields.read(fields, item, BOARD);
            if (board == null) return null;
            Map<String, Field> boardFields = ModelFields.of(board.getClass());
            if (isViewer(ModelFields.read(boardFields, board, OWNER), viewer)) return "it's on your board";
            if (ModelFields.isTrue(boardFields, board, COLLABORATED)) return "it's on a board you collaborate on";
            return null;
        } catch (Throwable t) {
            return null;
        }
    }

    /** True when [user] is a model whose id is [viewer]. */
    private static boolean isViewer(Object user, String viewer) {
        if (user == null || viewer == null) return false;
        Object id = ModelFields.read(ModelFields.of(user.getClass()), user, "id");
        return viewer.equals(id);
    }

    /** For a report: which of the fields [why] reads [item] has, so a pin that wasn't seen as yours says why. */
    static String signals(Object item, String viewer) {
        try {
            Map<String, Field> fields = ModelFields.of(item.getClass());
            Object board = ModelFields.read(fields, item, BOARD);
            Map<String, Field> boardFields = board == null ? null : ModelFields.of(board.getClass());
            return "[" + OWNED + "=" + ModelFields.read(fields, item, OWNED)
                    + "," + PINNER + "=" + who(ModelFields.read(fields, item, PINNER), viewer)
                    + "," + BOARD + "." + OWNER + "=" + (board == null ? "no board"
                        : who(ModelFields.read(boardFields, board, OWNER), viewer))
                    + "," + BOARD + "." + COLLABORATED + "=" + (board == null ? null
                        : ModelFields.read(boardFields, board, COLLABORATED))
                    + ",viewer=" + (viewer == null ? "unknown" : "known") + "]";
        } catch (Throwable t) {
            return "[unreadable]";
        }
    }

    private static String who(Object user, String viewer) {
        if (user == null) return "none";
        Object id = ModelFields.read(ModelFields.of(user.getClass()), user, "id");
        return id == null ? "no id" : viewer != null && viewer.equals(id) ? "you" : "someone else";
    }
}
