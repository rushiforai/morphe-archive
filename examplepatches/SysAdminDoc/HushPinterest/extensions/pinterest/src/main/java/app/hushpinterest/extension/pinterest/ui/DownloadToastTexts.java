/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.content.Context;
import android.content.res.Resources;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Tells the message Pinterest shows when a picture or video finishes downloading. Several screens
 * show it and none has a toast of its own: most hand the finished words to the plain text toast,
 * and one hands a toast the text's id. So a toast is one of these when a field of it holds those
 * words, in the language the app is showing, or that id.
 */
final class DownloadToastTexts {
    private DownloadToastTexts() {}

    /** Pinterest's "Image downloaded!" and "Video downloaded!" by resource name. */
    static final String[] NAMES = {"pin_image_download_success", "pin_video_download_success"};

    /** The fields of each toast class that could hold a text or a text's id, opened for reading once. */
    private static final Map<Class<?>, Field[]> FIELDS = new ConcurrentHashMap<>();

    /** True when [toast] holds a finished download's words or text id as one of [sources] has them. A null source is skipped. */
    static boolean holdsDownload(Object toast, Context... sources) {
        if (toast == null) return false;
        Field[] fields = textFields(toast.getClass());
        if (fields.length == 0) return false;
        for (Context source : sources) {
            if (source == null) continue;
            Resources resources = source.getResources();
            String owner = source.getPackageName();
            for (String name : NAMES) {
                int id = resources.getIdentifier(name, "string", owner);
                if (id != 0 && carries(toast, fields, id, SaveToastTexts.plain(resources.getString(id)))) return true;
            }
        }
        return false;
    }

    private static boolean carries(Object toast, Field[] fields, int id, String words) {
        for (Field field : fields) {
            Object value;
            try {
                value = field.get(toast);
            } catch (IllegalAccessException | RuntimeException closed) {
                continue;
            }
            if (value instanceof Integer && (Integer) value == id) return true;
            if (value instanceof CharSequence && !words.isEmpty() && words.equals(SaveToastTexts.plain(value.toString()))) return true;
        }
        return false;
    }

    private static Field[] textFields(Class<?> type) {
        Field[] known = FIELDS.get(type);
        if (known != null) return known;
        List<Field> found = new ArrayList<>();
        for (Class<?> at = type; at != null && at != Object.class; at = at.getSuperclass()) {
            for (Field field : at.getDeclaredFields()) {
                Class<?> held = field.getType();
                if (Modifier.isStatic(field.getModifiers()) || held != int.class && !CharSequence.class.isAssignableFrom(held)) continue;
                try {
                    field.setAccessible(true);
                    found.add(field);
                } catch (RuntimeException closed) {
                    // A field the runtime won't open can't be read. The toast shows as Pinterest meant.
                }
            }
        }
        Field[] fields = found.toArray(new Field[0]);
        FIELDS.put(type, fields);
        return fields;
    }
}
