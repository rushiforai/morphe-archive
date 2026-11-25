/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches.notifications;

import java.io.IOException;
import java.util.List;

import app.morphe.extension.youtube.patches.utils.ProtoNode;

/** Synthetic Elements renderers and models, with the same wire paths as the inbox. */
public final class InboxProtoFixture {
    private static final String ROW_TEMPLATE = "inbox_notification.eml|default";
    private static final String GROUP_TEMPLATE = "expandable_inbox_notification.eml|default";
    public static final String INBOX = "GetNotificationsInbox";
    public static final String GROUP_KEY = "synthetic-group-dot";
    public static final String AVATAR = "https://example.invalid/channel-avatar";
    public static final String CHANNEL = "Fixture channel";

    private InboxProtoFixture() {
    }

    public static byte[] response(String request, byte[]... items) throws IOException {
        return withEntities(request, null, items);
    }

    public static byte[] withEntities(String request, byte[][] mutations, byte[]... items) throws IOException {
        byte[] context = message(1, message(2, text(1, request)), text(19, "x".repeat(140)));
        byte[] section = message(3, items);
        return ProtoNode.encode(output -> {
            output.writeRawBytes(context);
            output.writeRawBytes(section);
            if (mutations != null) {
                output.writeRawBytes(message(777, message(1, mutations)));
            }
            output.writeString(741, "keep unrelated root metadata");
        });
    }

    public static byte[] group(boolean unread, byte[]... entries) throws IOException {
        byte[] header = message(6, varint(1, unread ? 0 : 1), message(2, text(1, AVATAR)),
                message(3, text(4, CHANNEL)), message(15, text(1, GROUP_KEY)));
        byte[] model = ProtoNode.encode(output -> {
            for (byte[] entry : entries) {
                output.writeByteArray(1, entry);
            }
            output.writeRawBytes(header);
        });
        return element(GROUP_TEMPLATE, message(457625295, model));
    }

    public static byte[] single(String videoId, long id, String title) throws IOException {
        return element(ROW_TEMPLATE, message(363936123, message(1, video(videoId, id, title, false, null))));
    }

    public static byte[] nonVideo(long id) throws IOException {
        byte[] model = message(1, message(3, text(1, "Comment reply")), identity(id),
                message(5, message(169495254, message(9981, text(1, "comment endpoint")))));
        return element(ROW_TEMPLATE, message(363936123, model));
    }

    public static byte[] unknown(String template) throws IOException {
        return element(template, text(8, "unknown renderer metadata"));
    }

    public static byte[] video(String videoId, long id, String title, boolean shorts, String seenKey)
            throws IOException {
        return ProtoNode.encode(output -> {
            output.writeRawBytes(message(3, text(1, title)));
            output.writeRawBytes(message(4, text(1, thumbnail(videoId))));
            output.writeRawBytes(message(5, message(169495254,
                    message(shorts ? 139608561 : 48687757, text(1, videoId), text(9, "navigation extras")))));
            output.writeRawBytes(identity(id));
            output.writeFixed32(31, 0xabcdef00);
            if (seenKey != null) {
                output.writeRawBytes(message(15, text(1, seenKey), text(2, "keep unrelated entity key")));
            }
        });
    }

    public static String thumbnail(String videoId) {
        return "https://example.invalid/thumbnails/" + videoId;
    }

    public static byte[] mutation(String key, boolean unseen) throws IOException {
        return message(1, text(1, key), varint(2, 1),
                message(3, message(266, text(1, key), varint(2, unseen ? 1 : 0))));
    }

    public static List<ProtoNode> items(byte[] body) {
        return ProtoNode.message(ProtoNode.parse(body), 3);
    }

    public static List<ProtoNode> model(ProtoNode item) {
        return ProtoNode.message(item.children, 4, 1, 168777401, 5, 363936123, 1);
    }

    public static Long notificationId(List<ProtoNode> model) {
        return ProtoNode.field(ProtoNode.message(model, 7, 169495254, 78414307, 1, 2, 14, 1), 1).getVarint();
    }

    public static List<ProtoNode> navigation(List<ProtoNode> model, boolean shorts) {
        return ProtoNode.message(model, 5, 169495254, shorts ? 139608561 : 48687757);
    }

    private static byte[] identity(long id) throws IOException {
        return message(7, message(169495254, message(78414307,
                message(1, message(2, message(14, message(1, varint(1, id))))))));
    }

    private static byte[] element(String template, byte[] model) throws IOException {
        byte[] renderer = message(168777401, message(3, message(172035250, text(1, template))), message(5, model));
        return message(1, message(4, message(1, renderer)));
    }

    public static byte[] message(int field, byte[]... children) throws IOException {
        byte[] payload = ProtoNode.encode(output -> {
            for (byte[] child : children) {
                output.writeRawBytes(child);
            }
        });
        return ProtoNode.encode(output -> output.writeByteArray(field, payload));
    }

    private static byte[] text(int field, String value) throws IOException {
        return ProtoNode.encode(output -> output.writeString(field, value));
    }

    private static byte[] varint(int field, long value) throws IOException {
        return ProtoNode.encode(output -> output.writeUInt64(field, value));
    }
}
