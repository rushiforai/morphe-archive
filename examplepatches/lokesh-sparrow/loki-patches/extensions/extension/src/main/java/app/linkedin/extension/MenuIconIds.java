/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Gives the items added to a post's &#8943; menu their own icon.
 * <p>
 * The items are copies of the Save row. Its bookmark is a DesignSystemImage, a small message holding the id of a
 * design system icon (field 3); the app looks that id up in its own table (Mercado's imageLookup, ids to drawables)
 * when it draws the row. So the icon is changed by changing the id: no image, no drawing, and it follows the theme and
 * the tint of the other rows because the app draws it.
 * <p>
 * The ids are those of 4.1.1270, read from imageLookup. An id the table does not know draws nothing, so a row stays
 * valid even if a later version renumbers them; it would only lose its icon.
 */
final class MenuIconIds {
    /** DesignSystemImage: 2 = color, 3 = id, 4 = a11yLabel. */
    private static final int COLOR = 2;
    private static final int ID = 3;
    private static final int LABEL = 4;
    private static final int MAX_DEPTH = 24;

    private static final int SMALL = 0;
    private static final int MEDIUM = 1;

    /** Bookmark icon id -> its size, in both icon families (DSSystemIcons and DSSystemIconsV2). */
    private static final Map<Integer, Integer> BOOKMARK_SIZE = new HashMap<>();
    /** Bookmark ids of the V2 family, whose copy and document icons are the outlined ones. */
    private static final Map<Integer, Boolean> BOOKMARK_V2 = new HashMap<>();

    static {
        bookmark(SMALL, false, 190, 301);
        bookmark(MEDIUM, false, 148, 149, 865, 866, 1829, 1830, 1861, 1862);
        bookmark(SMALL, true, 1124, 1127);
        bookmark(MEDIUM, true, 1122, 1123, 1125, 1126, 1834, 1835, 1872, 1873);
    }

    private MenuIconIds() {
    }

    private static void bookmark(int size, boolean v2, int... ids) {
        for (int id : ids) {
            BOOKMARK_SIZE.put(id, size);
            BOOKMARK_V2.put(id, v2);
        }
    }

    /** The icon id for an item, given the bookmark id it replaces; 0 when that id is not a bookmark. */
    static int target(int bookmarkId, String action) {
        Integer size = BOOKMARK_SIZE.get(bookmarkId);
        if (size == null) return 0;
        boolean small = size == SMALL;
        boolean v2 = Boolean.TRUE.equals(BOOKMARK_V2.get(bookmarkId));
        switch (action) {
            case "copy":
                // Document copy / File copy outline.
                return v2 ? (small ? 1292 : 1291) : (small ? 559 : 558);
            case "download":
                // Download (the V2 family has none; ids are global, so the V1 one is used).
                return small ? 561 : 136;
            case "pdf":
                // Document / File outline.
                return v2 ? (small ? 1300 : 1299) : (small ? 454 : 455);
            default:
                return 0;
        }
    }

    /** What a pass over a row found and did. */
    static final class Result {
        /** The ids of every DesignSystemImage in the row, as found. */
        final StringBuilder seen = new StringBuilder();
        int swapped;
    }

    /** The row's bytes with every bookmark replaced by the item's icon. Unchanged when there is none. */
    static byte[] swap(byte[] data, String action, Result result) {
        return walk(data, action, result, 0);
    }

    private static byte[] walk(byte[] data, String action, Result result, int depth) {
        if (depth > MAX_DEPTH) return data;
        List<ProtoEdit.Field> fields = ProtoEdit.parse(data);
        if (fields == null) return data;
        boolean changed = false;
        for (ProtoEdit.Field field : fields) {
            if (field.wireType != 2 || field.data.length == 0) continue;
            long id = designSystemId(field.data);
            if (id >= 0) {
                if (result.seen.length() > 0) result.seen.append(',');
                result.seen.append(id);
                int target = target((int) id, action);
                if (target != 0) {
                    field.data = withId(field.data, target);
                    result.swapped++;
                    changed = true;
                }
                continue;
            }
            byte[] inner = walk(field.data, action, result, depth + 1);
            if (inner != field.data) {
                field.data = inner;
                changed = true;
            }
        }
        return changed ? ProtoEdit.write(fields) : data;
    }

    /**
     * The id when the bytes are a DesignSystemImage: only fields 2, 3 and 4, with a varint id. -1 otherwise. Strict, so
     * that a text that happens to parse as a message is not taken for one.
     */
    static long designSystemId(byte[] data) {
        List<ProtoEdit.Field> fields = ProtoEdit.parse(data);
        if (fields == null || fields.isEmpty() || fields.size() > 3) return -1;
        long id = -1;
        for (ProtoEdit.Field field : fields) {
            if (field.number == ID && field.wireType == 0) {
                id = varint(field.data);
            } else if (!((field.number == COLOR || field.number == LABEL) && field.wireType == 2)) {
                return -1;
            }
        }
        return id;
    }

    private static byte[] withId(byte[] image, int id) {
        List<ProtoEdit.Field> fields = ProtoEdit.parse(image);
        List<ProtoEdit.Field> out = new java.util.ArrayList<>();
        for (ProtoEdit.Field field : fields) {
            out.add(field.number == ID && field.wireType == 0 ? ProtoEdit.varintField(ID, id) : field);
        }
        return ProtoEdit.write(out);
    }

    private static long varint(byte[] data) {
        long value = 0;
        for (int i = 0, shift = 0; i < data.length && shift < 64; i++, shift += 7) {
            value |= (long) (data[i] & 0x7F) << shift;
            if (data[i] >= 0) break;
        }
        return value;
    }

    /**
     * A compact picture of a message: field numbers, varint values, and the nesting, with text left out. Written to
     * the log when no icon was found, so the next step can be exact instead of a guess.
     */
    static String describe(byte[] data, int depth, int[] budget) {
        List<ProtoEdit.Field> fields = depth > 10 ? null : ProtoEdit.parse(data);
        if (fields == null) return "s";
        StringBuilder sb = new StringBuilder("{");
        for (ProtoEdit.Field field : fields) {
            if (budget[0]-- <= 0) return sb.append("...}").toString();
            sb.append(field.number);
            if (field.wireType == 0) {
                sb.append('=').append(varint(field.data));
            } else if (field.wireType == 2) {
                sb.append(printable(field.data) ? "\"" + new String(field.data, java.nio.charset.StandardCharsets.UTF_8)
                        .substring(0, Math.min(field.data.length, 8)) + "\"" : describe(field.data, depth + 1, budget));
            }
            sb.append(' ');
        }
        return sb.append('}').toString();
    }

    private static boolean printable(byte[] data) {
        if (data.length == 0) return true;
        for (byte b : data) if (b < 0x20 || b > 0x7e) return false;
        return true;
    }
}
