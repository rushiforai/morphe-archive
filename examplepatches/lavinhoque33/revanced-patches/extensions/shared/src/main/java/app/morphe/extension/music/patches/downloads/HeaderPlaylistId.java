/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 * Reads the playlist or album id of a playlist/album header out of its serialized model.
 * The Download button of that header names its download-state entity by a base64 key whose field 4 is the
 * entity type (24 for a playlist, 17 for an album, whose id is the OLAK audio playlist id) and whose field 2 is the id.
 */
final class HeaderPlaylistId {
    private static final int PLAYLIST_DOWNLOAD_ENTITY = 24;
    private static final int ALBUM_DOWNLOAD_ENTITY = 17;
    private static final int MAX_DEPTH = 48;

    private HeaderPlaylistId() {}

    /** Every distinct playlist or album id the header names, in the order they appear. */
    static List<String> findAll(byte[] message) {
        List<String> ids = new ArrayList<>();
        collect(message, 0, ids);
        return ids;
    }

    private static void collect(byte[] message, int depth, List<String> ids) {
        if (depth > MAX_DEPTH) return;
        List<byte[]> children = NativeDownloads.lengthDelimited(message);
        if (children == null) return;
        for (byte[] child : children) {
            String id = playlistFromKey(child);
            if (id != null && !ids.contains(id)) ids.add(id);
        }
        for (byte[] child : children) collect(child, depth + 1, ids);
    }

    /** The id of a playlist or album download-state entity key, or null for any other string. */
    @Nullable
    static String playlistFromKey(byte[] value) {
        try {
            String text = new String(value, StandardCharsets.US_ASCII);
            if (!text.matches("[A-Za-z0-9_%=+/-]{8,}")) return null;
            byte[] key = Base64.getUrlDecoder().decode(URLDecoder.decode(text, "UTF-8"));
            int entityType = NativeDownloads.fieldNumber(key, 4);
            if (entityType != PLAYLIST_DOWNLOAD_ENTITY && entityType != ALBUM_DOWNLOAD_ENTITY) return null;
            byte[] id = NativeDownloads.fieldBytes(key, 2);
            return id == null ? null : new String(id, StandardCharsets.UTF_8);
        } catch (IllegalArgumentException | IOException ex) {
            return null;
        }
    }
}
