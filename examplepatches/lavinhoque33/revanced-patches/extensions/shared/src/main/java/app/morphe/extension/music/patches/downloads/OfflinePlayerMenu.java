/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import com.google.protobuf.CodedInputStream;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

/** The ordinary native rows that can run offline, without copying a connected Elements menu. */
final class OfflinePlayerMenu {
    record Labels(String playNext, String addToQueue, String share, String remove) {}

    private static final int MENU_ITEMS = 1;
    private static final int NAVIGATION_ITEM = 66_441_108;
    private static final int SERVICE_ITEM = 66_441_155;
    private static final int ADD_TO_QUEUE = 163_162_354;
    private static final int SHARE_VIDEO = 73_844_178;
    private static final int OFFLINE_UPSELL = 133_724_106;
    private static final int PLAY_NEXT_ICON = 251;
    private static final int ADD_TO_QUEUE_ICON = 520;
    private static final int SHARE_ICON = 48;
    private static final int DOWNLOAD_ICON = 147;
    private static final int UPSELL_VIDEO_ID = 4;
    private static final int REMOVE_MARKER_FIELD = 15;
    private static final String REMOVE_MARKER = "morphe_offline_player_remove";

    private OfflinePlayerMenu() {}

    static byte[] encode(String videoId, String title, String copyId, boolean canQueue, Labels labels) {
        ProtoWriter menu = new ProtoWriter();
        if (canQueue) {
            menu.message(MENU_ITEMS, queueItem(videoId, labels.playNext(), PLAY_NEXT_ICON, 1));
            menu.message(MENU_ITEMS, queueItem(videoId, labels.addToQueue(), ADD_TO_QUEUE_ICON, 2));
        }
        return menu.message(MENU_ITEMS, shareItem(videoId, title, labels.share()))
                .message(MENU_ITEMS, removeItem(copyId, labels.remove())).toByteArray();
    }

    private static byte[] queueItem(String videoId, String text, int icon, int position) {
        byte[] target = new ProtoWriter().string(1, videoId).toByteArray();
        byte[] payload = new ProtoWriter().message(1, target).int32(2, position)
                .bool(OfflineQueueCommand.PLAYER_ONLY_FIELD, true).toByteArray();
        return item(SERVICE_ITEM, text, icon, ADD_TO_QUEUE, payload);
    }

    private static byte[] shareItem(String videoId, String title, String text) {
        String url = "https://music.youtube.com/watch?v=" + videoId + "&feature=share";
        byte[] payload = new ProtoWriter().string(1, videoId).string(2, url).string(3, title).toByteArray();
        return item(NAVIGATION_ITEM, text, SHARE_ICON, SHARE_VIDEO, payload);
    }

    private static byte[] removeItem(String copyId, String text) {
        byte[] params = new ProtoWriter().string(UPSELL_VIDEO_ID, copyId)
                .string(REMOVE_MARKER_FIELD, REMOVE_MARKER).toByteArray();
        byte[] payload = new ProtoWriter()
                .string(1, Base64.getUrlEncoder().withoutPadding().encodeToString(params)).toByteArray();
        return item(SERVICE_ITEM, text, DOWNLOAD_ICON, OFFLINE_UPSELL, payload);
    }

    private static byte[] item(int renderer, String text, int icon, int endpoint, byte[] payload) {
        byte[] runs = new ProtoWriter().message(1, new ProtoWriter().string(1, text).toByteArray()).toByteArray();
        byte[] row = new ProtoWriter().message(1, runs)
                .message(2, new ProtoWriter().int32(1, icon).toByteArray())
                .message(3, new ProtoWriter().message(endpoint, payload).toByteArray()).toByteArray();
        return new ProtoWriter().message(renderer, row).toByteArray();
    }

    /** The dispatcher sees the command root before stock chooses a resolver or its executor. */
    @Nullable
    static String removalFromCommand(byte[] command) throws IOException {
        byte[] endpoint = NativeDownloads.fieldBytes(command, OFFLINE_UPSELL);
        if (endpoint == null) return null;

        byte[] params = NativeDownloads.fieldBytes(endpoint, 1);
        return params == null ? null : removalTarget(new String(params, StandardCharsets.UTF_8));
    }

    /** Recognizes only our typed upsell parameters, not a normal Download or a stock Premium offer. */
    @Nullable
    static String removalTarget(String encoded) {
        if (encoded.isEmpty()) return null;
        try {
            CodedInputStream params = CodedInputStream.newInstance(Base64.getUrlDecoder().decode(encoded));
            if (params.readTag() != (UPSELL_VIDEO_ID << 3 | 2)) return null;
            String copyId = params.readStringRequireUtf8();
            if (params.readTag() != (REMOVE_MARKER_FIELD << 3 | 2)
                    || !REMOVE_MARKER.equals(params.readStringRequireUtf8()) || !params.isAtEnd()) return null;

            return RawAudioFiles.validId(copyId) ? copyId : null;
        } catch (IOException | IllegalArgumentException ignored) {
            return null;
        }
    }
}
