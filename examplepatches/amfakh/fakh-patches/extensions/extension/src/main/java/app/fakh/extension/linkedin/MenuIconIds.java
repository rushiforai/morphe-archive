/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Gives the items Fakh Patches adds to a post's menu an icon of their own.
 *
 * <p>An item is a copy of a row that already has an icon (Save, or Send in a comment's menu). That icon is a
 * DesignSystemImage message whose field 3 is an id in the app's icon table, so changing the id changes the icon, and
 * the app still draws and tints it like the other rows. An id the table does not know draws nothing, so a later
 * LinkedIn version that renumbers the table costs an item its icon and breaks nothing else. Ids are from 4.1.1270.
 */
final class MenuIconIds {
    private static final int ID = 3;
    private static final int MAX_DEPTH = 24;

    private static final int SMALL = 1;
    private static final int V2 = 2;

    /** The id of an icon a row can be copied from, to {@link #SMALL} and {@link #V2} flags describing it. */
    private static final Map<Integer, Integer> SOURCES = new HashMap<>();

    static {
        source(0, 190, 301);
        source(0, 148, 149, 865, 866, 1829, 1830, 1861, 1862, 426);
        source(SMALL | V2, 1124, 1127);
        source(V2, 1122, 1123, 1125, 1126, 1834, 1835, 1872, 1873);
    }

    private MenuIconIds() {
    }

    private static void source(int flags, int... ids) {
        for (int id : ids) SOURCES.put(id, flags);
    }

    /**
     * The icon for an item.
     *
     * @param sourceId the id of the icon of the row the item is copied from
     * @param action   {@code copy} or {@code download}
     * @return the id to use, or 0 when the source is not a known icon or the action has no icon
     */
    static int iconFor(int sourceId, String action) {
        Integer flags = SOURCES.get(sourceId);
        if (flags == null) return 0;
        boolean small = (flags & SMALL) != 0;
        boolean v2 = (flags & V2) != 0;
        switch (action) {
            case "copy":
                return v2 ? (small ? 1292 : 1291) : (small ? 559 : 558);
            case "download":
                // The V2 family has no download icon, and ids are global, so the V1 one serves both.
                return small ? 561 : 136;
            default:
                return 0;
        }
    }

    /**
     * Replaces the icon of every row in a message that is a known source with the icon for the action.
     *
     * @param message the row's bytes
     * @param action  {@code copy} or {@code download}
     * @return the new bytes, or {@code message} itself when nothing was replaced
     */
    static byte[] swap(byte[] message, String action) {
        return swap(message, action, 0);
    }

    private static byte[] swap(byte[] message, String action, int depth) {
        List<ProtoEdit.Field> fields = depth > MAX_DEPTH ? null : ProtoEdit.parse(message);
        if (fields == null) return message;
        boolean changed = false;
        for (ProtoEdit.Field field : fields) {
            if (field.wireType != 2 || field.data.length == 0) continue;
            List<ProtoEdit.Field> image = ProtoEdit.parse(field.data);
            int icon = isImage(image) ? iconFor((int) idOf(image), action) : 0;
            byte[] replaced = icon != 0 ? withId(image, icon) : swap(field.data, action, depth + 1);
            if (replaced != field.data) {
                field.data = replaced;
                changed = true;
            }
        }
        return changed ? ProtoEdit.write(fields) : message;
    }

    /**
     * Whether a parsed message is a DesignSystemImage: at most three fields, a varint id, and no field but the color
     * (2) and the label (4) besides it. Strict, so text that happens to parse as a message is not taken for one.
     */
    private static boolean isImage(List<ProtoEdit.Field> fields) {
        if (fields == null || fields.isEmpty() || fields.size() > 3) return false;
        boolean hasId = false;
        for (ProtoEdit.Field field : fields) {
            if (field.number == ID && field.wireType == 0) {
                hasId = true;
            } else if ((field.number != 2 && field.number != 4) || field.wireType != 2) {
                return false;
            }
        }
        return hasId;
    }

    private static long idOf(List<ProtoEdit.Field> image) {
        for (ProtoEdit.Field field : image) {
            if (field.number == ID && field.wireType == 0) return varint(field.data);
        }
        return -1;
    }

    private static byte[] withId(List<ProtoEdit.Field> image, int id) {
        List<ProtoEdit.Field> out = new ArrayList<>();
        for (ProtoEdit.Field field : image) {
            out.add(field.number == ID && field.wireType == 0 ? ProtoEdit.varintField(ID, id) : field);
        }
        return ProtoEdit.write(out);
    }

    private static long varint(byte[] data) {
        long value = 0;
        for (int i = 0; i < data.length && i < 10; i++) {
            value |= (long) (data[i] & 0x7F) << (7 * i);
            if (data[i] >= 0) break;
        }
        return value;
    }
}
