/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-01.
 */
package app.morphe.extension.music.patches.androidauto;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/** Local browse identifiers and the ordered snapshot shared by browsing and playback. */
final class AndroidAutoDownloadsData {
    static final String PREFIX = "morphe-aa-downloads://";
    static final String ROOT_ID = PREFIX + "playlists";
    static final String LIBRARY_ID = PREFIX + "library";
    static final String UNSORTED_KEY = "rvx:not_in_playlist";

    record Track(long mediaId, long position, String title, String artist, String album, long durationMs,
                 long modifiedSeconds, long fileSize) {}

    record Playlist(long id, String title, List<Track> tracks) {}
    record PlayRequest(long playlistId, int index, int count) {}

    private AndroidAutoDownloadsData() {}

    static boolean needsRootFallback(boolean rootRequest, int stockItemCount, boolean alreadyPrepared) {
        return rootRequest && stockItemCount == 0 && !alreadyPrepared;
    }

    static String playlistId(long id) {
        if (id < 0) throw new IllegalArgumentException("Negative playlist ID");
        return PREFIX + "playlist/" + id;
    }

    static long parsePlaylistId(String mediaId) {
        String prefix = PREFIX + "playlist/";
        if (mediaId == null || !mediaId.startsWith(prefix)) return -1;
        String value = mediaId.substring(prefix.length());
        if (value.isEmpty()) return -1;
        for (int index = 0; index < value.length(); index++) {
            if (value.charAt(index) < '0' || value.charAt(index) > '9') return -1;
        }
        try {
            return Long.parseLong(value);
        } catch (NumberFormatException ignored) {
            return -1;
        }
    }

    static String playId(long playlistId, int index, int count) {
        if (playlistId < 0 || index < 0 || count <= index) throw new IllegalArgumentException("Invalid local queue");
        return PREFIX + "play/" + playlistId + "/" + index + "/" + count;
    }

    static PlayRequest parsePlayId(String mediaId) {
        String prefix = PREFIX + "play/";
        if (mediaId == null || !mediaId.startsWith(prefix)) return null;
        String[] parts = mediaId.substring(prefix.length()).split("/", -1);
        if (parts.length != 3) return null;
        for (String part : parts) {
            if (part.isEmpty()) return null;
            for (int index = 0; index < part.length(); index++) {
                if (part.charAt(index) < '0' || part.charAt(index) > '9') return null;
            }
        }
        try {
            long playlistId = Long.parseLong(parts[0]);
            int index = Integer.parseInt(parts[1]);
            int count = Integer.parseInt(parts[2]);
            return count > index ? new PlayRequest(playlistId, index, count) : null;
        } catch (NumberFormatException ignored) {
            return null;
        }
    }

    static String playlistUri(long playlistId) {
        if (playlistId < 0) throw new IllegalArgumentException("Negative playlist ID");
        return "ytm://music.youtube.com/sideloaded/internal/playlists/" + playlistId;
    }

    /** Stock sideloaded-watch extension, verified in 9.40.51, 9.15.51 and 8.30.54. */
    static byte[] playCommand(PlayRequest request) {
        byte[] container = playlistUri(request.playlistId()).getBytes(StandardCharsets.UTF_8);
        ByteArrayOutputStream payload = new ByteArrayOutputStream(container.length + 12);
        payload.write(0x12); // Field 2: container URI. Leave field 1 (starting track URI) absent.
        writeVarint(payload, container.length);
        payload.write(container, 0, container.length);
        payload.write(0x18); // Field 3: index. No field 4 means ordered playback, not shuffle.
        writeVarint(payload, request.index());

        ByteArrayOutputStream command = new ByteArrayOutputStream(payload.size() + 10);
        writeVarint(command, (163_005_413 << 3) | 2);
        writeVarint(command, payload.size());
        byte[] bytes = payload.toByteArray();
        command.write(bytes, 0, bytes.length);
        return command.toByteArray();
    }

    private static void writeVarint(ByteArrayOutputStream output, int value) {
        while ((value & ~0x7f) != 0) {
            output.write((value & 0x7f) | 0x80);
            value >>>= 7;
        }
        output.write(value);
    }

    static Playlist playlist(long id, String sourceKey, String databaseTitle, String unsortedTitle,
                             List<Track> tracks) {
        List<Track> ordered = new ArrayList<>(tracks);
        ordered.sort(Comparator.comparingLong(Track::position));
        return new Playlist(id, UNSORTED_KEY.equals(sourceKey) ? unsortedTitle : databaseTitle,
                List.copyOf(ordered));
    }

    static List<Playlist> nonemptyPlaylists(List<Playlist> playlists) {
        List<Playlist> visible = new ArrayList<>();
        for (Playlist playlist : playlists) {
            if (!playlist.tracks().isEmpty()) visible.add(playlist);
        }
        visible.sort(Comparator.comparing(Playlist::title, String.CASE_INSENSITIVE_ORDER)
                .thenComparingLong(Playlist::id));
        return visible;
    }
}
