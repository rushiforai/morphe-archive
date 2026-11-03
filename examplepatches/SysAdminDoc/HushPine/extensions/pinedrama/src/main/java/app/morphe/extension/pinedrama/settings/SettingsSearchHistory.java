/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */

package app.morphe.extension.pinedrama.settings;

import org.json.JSONArray;
import org.json.JSONException;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;

/**
 * What settings search was used for, newest first, shown under the empty search box (#232, after
 * OmerKurdi79's version). A search counts once it's sent with the keyboard's search key or one of
 * its results is opened, so a half-typed word never lands here.
 */
public final class SettingsSearchHistory {
    static final int MAX_RECENTS = 10;

    private SettingsSearchHistory() {}

    public static List<String> recent() {
        List<String> list = new ArrayList<>();
        try {
            JSONArray array = new JSONArray(Settings.RECENT_SETTINGS_SEARCHES.get());
            for (int i = 0; i < array.length() && list.size() < MAX_RECENTS; i++) {
                String item = array.optString(i, "").trim();
                if (!item.isEmpty() && !list.contains(item)) list.add(item);
            }
        } catch (JSONException error) {
            Logger.printDebug(() -> "Settings search history unreadable, starting over: " + error);
        }
        return list;
    }

    /** Puts {@code query} first, dropping its older copy and anything past {@link #MAX_RECENTS}. */
    public static void add(String query) {
        String trimmed = query == null ? "" : query.trim();
        if (trimmed.isEmpty()) return;
        List<String> list = recent();
        list.remove(trimmed);
        list.add(0, trimmed);
        while (list.size() > MAX_RECENTS) list.remove(list.size() - 1);
        save(list);
    }

    public static void remove(String query) {
        if (query == null) return;
        List<String> list = recent();
        if (list.remove(query.trim())) save(list);
    }

    public static void clear() {
        Settings.RECENT_SETTINGS_SEARCHES.save("[]");
    }

    private static void save(List<String> list) {
        Settings.RECENT_SETTINGS_SEARCHES.save(new JSONArray(list).toString());
    }
}
