/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;

/**
 * How often each file of a release was downloaded, shown next to its size. The app does not ask GitHub for the count, so
 * the patch adds it to the release query, reads it while the app parses the answer and keeps it under the file's id. It
 * is saved because the app can draw a release from its own cache, which does not hold the count.
 */
@SuppressWarnings("unused")
public final class DownloadCount {
    // The id read just before a count, on the thread that parses that answer.
    private static final ThreadLocal<String> ID = new ThreadLocal<>();

    private DownloadCount() {
    }

    /**
     * Adds the two fields of the patched query to the names a response parser looks for.
     *
     * @param names The app's field names.
     * @return Those names, then the id's alias and the count.
     */
    public static List<Object> names(List<?> names) {
        List<Object> all = new ArrayList<>(names);
        all.add("fakhKey");
        all.add("downloadCount");
        return all;
    }

    /**
     * Takes the id of the file whose count comes next.
     *
     * @param id The value of {@code fakhKey}.
     */
    public static void id(Object id) {
        ID.set(id instanceof String ? (String) id : null);
    }

    /**
     * Saves the count of the file last given to {@link #id}.
     *
     * @param count The value of {@code downloadCount}, read as text.
     */
    public static void count(Object count) {
        String id = ID.get();
        SharedPreferences saved = saved();
        if (id == null || saved == null || !(count instanceof String)) return;
        if (!count.equals(saved.getString(id, null))) saved.edit().putString(id, (String) count).apply();
    }

    /**
     * The size line of a release file.
     *
     * @param id   The file's id.
     * @param size The app's size text.
     * @return The size followed by the download count, or the size alone while the count is unknown.
     */
    public static String label(String id, String size) {
        SharedPreferences saved = saved();
        String count = saved == null ? null : saved.getString(id, null);
        if (count == null || !Features.on("fakh_download_count")) return size;
        try {
            long downloads = Long.parseLong(count);
            return size + " \u00b7 " + NumberFormat.getIntegerInstance().format(downloads)
                    + (downloads == 1 ? " download" : " downloads");
        } catch (NumberFormatException e) {
            return size;
        }
    }

    /** Where the counts are kept, or null before the app has started. */
    private static SharedPreferences saved() {
        Application app = AppRuntime.application();
        return app == null ? null : app.getSharedPreferences("fakh_download_count", Context.MODE_PRIVATE);
    }
}
