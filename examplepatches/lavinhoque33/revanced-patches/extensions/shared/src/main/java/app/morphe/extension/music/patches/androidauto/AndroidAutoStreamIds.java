/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.androidauto;

import androidx.annotation.Nullable;

import java.util.regex.Pattern;

import static app.morphe.extension.music.patches.androidauto.AndroidAutoDownloadsData.PREFIX;

/**
 * Browse identifiers of the stream copies, a branch of the Downloaded playlists prefix that cannot be mistaken for
 * the device-file playlists ({@code playlist/<id>}, {@code play/...}): the folder, a list of songs and the play
 * requests. A source id is a playlist or album id (or {@code songs}), so it has no slash.
 */
final class AndroidAutoStreamIds {
    static final String FOLDER_ID = PREFIX + "stream";

    private static final String SOURCE = FOLDER_ID + "/source/";
    private static final String PLAY = FOLDER_ID + "/play/";
    private static final String PLAY_ALL = FOLDER_ID + "/all/";
    private static final Pattern SOURCE_ID = Pattern.compile("[A-Za-z0-9_-]{1,64}");
    private static final Pattern NUMBER = Pattern.compile("[0-9]{1,6}");

    /** Play the song at {@code index} of the list's offline queue; {@code count} is the length when it was listed. */
    record PlayRequest(String sourceId, int index, int count) {}

    private AndroidAutoStreamIds() {}

    /** Whether the id belongs to the stream branch, the folder included. */
    static boolean isStream(@Nullable String mediaId) {
        return mediaId != null && (mediaId.equals(FOLDER_ID) || mediaId.startsWith(FOLDER_ID + "/"));
    }

    /** Whether a source id can be part of an id; a list whose id cannot is not shown. */
    static boolean isValidSource(String sourceId) {
        return SOURCE_ID.matcher(sourceId).matches();
    }

    static String sourceId(String sourceId) {
        return SOURCE + requireSource(sourceId);
    }

    /** The source a list id names, or null when it is not a list id. */
    @Nullable
    static String parseSource(@Nullable String mediaId) {
        if (mediaId == null || !mediaId.startsWith(SOURCE)) return null;

        String sourceId = mediaId.substring(SOURCE.length());
        return SOURCE_ID.matcher(sourceId).matches() ? sourceId : null;
    }

    static String playId(String sourceId, int index, int count) {
        if (index < 0 || count <= index) throw new IllegalArgumentException("Invalid stream queue");

        return PLAY + requireSource(sourceId) + "/" + index + "/" + count;
    }

    /** The item that plays a whole list from its first song. */
    static String playAllId(String sourceId, int count) {
        if (count <= 0) throw new IllegalArgumentException("Invalid stream queue");

        return PLAY_ALL + requireSource(sourceId) + "/" + count;
    }

    /** The request a play id or a play-all id makes, or null when it is neither or malformed. */
    @Nullable
    static PlayRequest parsePlay(@Nullable String mediaId) {
        if (mediaId == null) return null;

        if (mediaId.startsWith(PLAY)) {
            String[] parts = mediaId.substring(PLAY.length()).split("/", -1);
            return parts.length == 3 ? request(parts[0], parts[1], parts[2]) : null;
        }
        if (mediaId.startsWith(PLAY_ALL)) {
            String[] parts = mediaId.substring(PLAY_ALL.length()).split("/", -1);
            return parts.length == 2 ? request(parts[0], "0", parts[1]) : null;
        }
        return null;
    }

    @Nullable
    private static PlayRequest request(String sourceId, String index, String count) {
        if (!SOURCE_ID.matcher(sourceId).matches() || !NUMBER.matcher(index).matches()
                || !NUMBER.matcher(count).matches()) return null;

        int first = Integer.parseInt(index);
        int total = Integer.parseInt(count);
        return total > first ? new PlayRequest(sourceId, first, total) : null;
    }

    private static String requireSource(String sourceId) {
        if (!SOURCE_ID.matcher(sourceId).matches()) throw new IllegalArgumentException("Invalid stream source");
        return sourceId;
    }
}
