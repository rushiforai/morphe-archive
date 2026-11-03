/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;

import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

import app.hushpinterest.extension.shared.Utils;

/**
 * The IDs of the pins saved with Download pins on, oldest first. The pin object a grid hands its menu
 * still reads as unsaved after its save, and most requests never ask, so that object alone would have
 * a saved pin saved again. {@link SaveAndDownload#saving} sees every save and adds it here.
 *
 * <p>A pin taken off a board later stays until it ages out, since nothing here sees that. It only
 * means one save that doesn't happen and one Home pin that stays away.
 */
public final class SavedRecord {
    private SavedRecord() {}

    static final int LIMIT = 2000;
    static final String STORE = "hushpinterest_saved_pins";
    static final String IDS = "ids_v1";

    private static String readFrom = "";
    private static Set<String> read = Collections.emptySet();

    /** Adds [id] as the newest, dropping the oldest past the limit. A null ID is left out. */
    static synchronized void add(String id) {
        SharedPreferences store = store();
        if (id == null || store == null) return;
        Set<String> next = new LinkedHashSet<>(ids(store));
        next.remove(id);
        next.add(id);
        Iterator<String> oldest = next.iterator();
        for (int over = next.size() - LIMIT; over > 0; over--) {
            oldest.next();
            oldest.remove();
        }
        store.edit().putString(IDS, TextUtils.join(",", next)).apply();
    }

    public static synchronized boolean has(String id) {
        SharedPreferences store = store();
        return id != null && store != null && ids(store).contains(id);
    }

    private static Set<String> ids(SharedPreferences store) {
        String raw = store.getString(IDS, "");
        if (!raw.equals(readFrom)) {
            readFrom = raw;
            read = raw.isEmpty() ? Collections.emptySet() : new LinkedHashSet<>(Arrays.asList(raw.split(",")));
        }
        return read;
    }

    private static SharedPreferences store() {
        Context context = Utils.getContext();
        return context == null ? null : context.getSharedPreferences(STORE, Context.MODE_PRIVATE);
    }
}
