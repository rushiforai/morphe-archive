/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.privacy;

import android.content.Context;

import org.robolectric.RuntimeEnvironment;

import java.util.List;

/** What tests in other packages may ask of Like and comment history's list. */
public final class ActivityHistoryForTests {
    private ActivityHistoryForTests() {}

    /** Whether [hook] leaves an entry in an empty list. The list is empty again afterwards. */
    public static boolean notes(Runnable hook) {
        Context app = RuntimeEnvironment.getApplication();
        ActivityHistory.clear(app);
        try {
            hook.run();
            List<ActivityHistory.Entry> found = ActivityHistory.entries(app);
            return found != null && !found.isEmpty();
        } finally {
            ActivityHistory.clear(app);
        }
    }

    /** Puts [raw] in the list's file as it is, the way a damaged file would read. */
    public static void replaceFile(String raw) {
        Context app = RuntimeEnvironment.getApplication();
        ActivityHistory.clear(app);
        app.getSharedPreferences(ActivityHistory.STORE, Context.MODE_PRIVATE).edit()
                .putString(ActivityHistory.ENTRIES, raw).commit();
    }

    /** Whether unliking [pinId] takes its like off a list that holds only that like. The list is empty afterwards. */
    public static boolean unlikes(String pinId) {
        Context app = RuntimeEnvironment.getApplication();
        ActivityHistory.clear(app);
        try {
            app.getSharedPreferences(ActivityHistory.STORE, Context.MODE_PRIVATE).edit()
                    .putString(ActivityHistory.ENTRIES, "[{\"kind\":\"LIKE\",\"pin\":\"" + pinId + "\",\"time\":1}]").commit();
            ActivityHistory.likeRemoved(pinId);
            List<ActivityHistory.Entry> found = ActivityHistory.entries(app);
            return found != null && found.isEmpty();
        } finally {
            ActivityHistory.clear(app);
        }
    }
}
