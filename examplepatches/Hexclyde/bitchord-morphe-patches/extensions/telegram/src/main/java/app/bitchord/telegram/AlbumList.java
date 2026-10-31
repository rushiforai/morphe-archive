package app.bitchord.telegram;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.*;

/**
 * A chat's albums: songs Telegram posted together as one album, a zip's songs, and the tracks of a
 * cue sheet. Each lists its songs in order, so it can be saved as a playlist or downloaded.
 */
final class AlbumList {
    private AlbumList() {}

    /** At most this many of a chat's newest files are grouped into albums. */
    static final int LOOK_AT = 5000;

    /** Which album a file is part of, or "" for a single song. */
    static String key(JSONObject row) {
        long message = row.optLong("message");
        int entry = row.optInt("entry");
        if (CueAlbums.isTrack(entry)) return "cue:" + message + ":" + CueAlbums.albumEntry(entry);
        if (entry > 0) return "zip:" + message;
        long group = row.optLong("mediaAlbum");
        return group != 0 ? "group:" + group : "";
    }

    /**
     * Albums from a chat's files, newest first; each has "key", "title", "artist" and "songs"
     * (oldest first). Groups of one song aren't albums.
     */
    static List<JSONObject> albums(List<JSONObject> rows) throws Exception {
        Map<String, List<JSONObject>> groups = new LinkedHashMap<>();
        for (JSONObject row : rows) {
            String key = key(row);
            if (!key.isEmpty()) groups.computeIfAbsent(key, k -> new ArrayList<>()).add(row);
        }
        List<JSONObject> albums = new ArrayList<>();
        for (Map.Entry<String, List<JSONObject>> group : groups.entrySet()) {
            List<JSONObject> songs = group.getValue();
            if (songs.size() < 2) continue;
            songs.sort(
                    Comparator.comparingLong((JSONObject r) -> r.optLong("message"))
                            .thenComparingInt(r -> r.optInt("entry")));
            // In a zip with a cue sheet, the album file itself is left out: its tracks are there.
            if (group.getKey().startsWith("cue:")) songs.removeIf(r -> !r.has("cue"));
            String artist = common(songs, "artist");
            String title = common(songs, "album");
            if (title.isEmpty())
                title =
                        (artist.isEmpty() ? songs.get(0).optString("artist") : artist)
                                + " — "
                                + songs.get(0).optString("title");
            albums.add(
                    new JSONObject()
                            .put("key", group.getKey())
                            .put("title", title)
                            .put("artist", artist)
                            .put("songs", new JSONArray(songs)));
        }
        return albums;
    }

    /** A value all songs share, or "". */
    private static String common(List<JSONObject> songs, String field) {
        String value = songs.get(0).optString(field);
        for (JSONObject song : songs) if (!song.optString(field).equals(value)) return "";
        return value;
    }
}
