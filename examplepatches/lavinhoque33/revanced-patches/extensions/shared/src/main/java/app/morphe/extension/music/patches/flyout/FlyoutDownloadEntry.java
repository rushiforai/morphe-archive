/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-10.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.flyout;

import static app.morphe.extension.shared.utils.StringRef.str;

import androidx.annotation.Nullable;

import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.MessageLite;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import app.morphe.extension.music.patches.downloads.LocalDownloadManager;
import app.morphe.extension.music.patches.downloads.SongDownloadRoute;
import app.morphe.extension.shared.utils.Logger;

/**
 * Gives the menu of a song one Download/Remove download action for the selected global method. Known stock download
 * rows are replaced in place; every unrelated row stays intact. If the server offers none, the action follows Add
 * to queue. Its canonical offline-upsell parameters name the opened song, so the existing native hook dispatches
 * the action without consulting the current player.
 */
final class FlyoutDownloadEntry {
    private static final int MENU_SERVICE_ITEM = 66441155;
    private static final int SERVICE_TEXT = 1;
    private static final int SERVICE_ICON = 2;
    private static final int SERVICE_ENDPOINT = 3;
    private static final int OFFLINE_UPSELL_ENDPOINT = 133724106;
    /** Field of the runs of a text, and of the text of a run. */
    private static final int RUNS = 1;
    private static final int RUN_TEXT = 1;
    /** Wire value of the OFFLINE_DOWNLOAD icon. */
    private static final int OFFLINE_DOWNLOAD_ICON = 147;
    private static final int ICON_TYPE = 1;

    private FlyoutDownloadEntry() {
    }

    /** The full menu with one owned Download action, or the original list for stock delegation/unknown targets. */
    static List<?> withDownloadItem(List<?> items) {
        try {
            SongDownloadRoute route = LocalDownloadManager.menuRoute();
            Logger.printDebug(() -> "FlyoutDownloadEntry: menu of " + items.size() + " items, route " + route);
            if (items.isEmpty()) return items;

            FlyoutMenuScan.Result scan = scan(items);
            String songId = SongMenus.targetOfMenu(scan.songId());
            if (route == SongDownloadRoute.STOCK && !SongMenus.isOpenFor(songId)) return items;

            FlyoutPatch.ItemFactory factory = firstFactory(items);
            if (factory == null) {
                Logger.printDebug(() -> "FlyoutDownloadEntry: no item can build a Download item, first is "
                        + items.get(0).getClass().getName());
                return items;
            }

            Logger.printDebug(() -> "FlyoutDownloadEntry: song " + songId + ", has Download "
                    + scan.hasDownload() + ", queue item " + scan.insertAfter());
            if (songId == null) return items;

            String label = labelOf(songId);
            Object item = factory.rvxWithBytes(itemBytes(songId, label));
            if (item == null) return items;

            List<Object> extended = scan.withDownload(items, item);
            Logger.printDebug(() -> "FlyoutDownloadEntry: item \"" + label + "\" added for " + songId);
            return extended;
        } catch (Exception ex) {
            Logger.printException(() -> "FlyoutDownloadEntry: could not add the Download item", ex);
            return items;
        }
    }

    @Nullable
    private static FlyoutPatch.ItemFactory firstFactory(List<?> items) {
        for (Object item : items) {
            if (item instanceof FlyoutPatch.ItemFactory factory) return factory;
        }
        return null;
    }

    private static FlyoutMenuScan.Result scan(List<?> items) {
        List<byte[]> serialized = new ArrayList<>(items.size());
        for (Object item : items) {
            serialized.add(item instanceof MessageLite message ? message.toByteArray() : null);
        }
        return FlyoutMenuScan.scan(serialized);
    }

    /** The text of the item: Remove download when the song has a stream copy, else Download. */
    private static String labelOf(String songId) {
        return LocalDownloadManager.offersRemove(songId)
                ? str("morphe_music_remove_download") : str("morphe_music_download_item");
    }

    /** A menu service item: the Download text and icon, and the offline upsell command of the song. */
    private static byte[] itemBytes(String songId, String text) throws IOException {
        byte[] service = concat(
                message(SERVICE_TEXT, message(RUNS, string(RUN_TEXT, text))),
                message(SERVICE_ICON, varint(ICON_TYPE, OFFLINE_DOWNLOAD_ICON)),
                message(SERVICE_ENDPOINT, message(OFFLINE_UPSELL_ENDPOINT,
                        string(1, Base64.getUrlEncoder().withoutPadding().encodeToString(string(4, songId))))));
        return message(MENU_SERVICE_ITEM, service);
    }

    private static byte[] string(int field, String value) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream out = CodedOutputStream.newInstance(bytes);
        out.writeString(field, value);
        out.flush();
        return bytes.toByteArray();
    }

    private static byte[] varint(int field, int value) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream out = CodedOutputStream.newInstance(bytes);
        out.writeInt32(field, value);
        out.flush();
        return bytes.toByteArray();
    }

    private static byte[] message(int field, byte[] encoded) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream out = CodedOutputStream.newInstance(bytes);
        out.writeByteArray(field, encoded);
        out.flush();
        return bytes.toByteArray();
    }

    private static byte[] concat(byte[]... parts) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        for (byte[] part : parts) bytes.write(part, 0, part.length);
        return bytes.toByteArray();
    }
}
