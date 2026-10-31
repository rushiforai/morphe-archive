package app.bitchord.telegram;

import org.json.JSONObject;

import java.util.*;

public final class AlbumListTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static JSONObject row(long message, int entry, String title, String artist, long group)
            throws Exception {
        JSONObject r =
                new JSONObject()
                        .put("chat", -1)
                        .put("message", message)
                        .put("entry", entry)
                        .put("title", title)
                        .put("artist", artist);
        if (group != 0) r.put("mediaAlbum", group);
        return r;
    }

    public static void main(String[] args) throws Exception {
        List<JSONObject> rows = new ArrayList<>();
        // Newest first, as the index gives them.
        rows.add(row(30, 0, "Single", "Solo", 0));
        rows.add(row(29, 0, "Track Three", "Band", 77));
        rows.add(row(28, 0, "Track Two", "Band", 77));
        rows.add(row(27, 0, "Track One", "Band", 77));
        JSONObject a = row(20, 1, "Zip One", "Zipper", 0).put("album", "Zipped");
        JSONObject b = row(20, 2, "Zip Two", "Zipper", 0).put("album", "Zipped");
        rows.add(b);
        rows.add(a);
        JSONObject t1 =
                row(10, CueAlbums.BASE + 1, "Opening", "Trio", 0)
                        .put("album", "Night")
                        .put("cue", new JSONObject());
        JSONObject t2 =
                row(10, CueAlbums.BASE + 2, "Closing", "Trio", 0)
                        .put("album", "Night")
                        .put("cue", new JSONObject());
        rows.add(t2);
        rows.add(t1);
        rows.add(row(9, 0, "Lonely", "Solo", 55)); // a group of one isn't an album
        List<JSONObject> albums = AlbumList.albums(rows);
        List<String> titles = new ArrayList<>();
        for (JSONObject album : albums) titles.add(album.getString("title"));
        check(
                titles.equals(List.of("Band — Track One", "Zipped", "Night")),
                "Newest album first, singles left out: " + titles);
        check(
                albums.get(0)
                        .getJSONArray("songs")
                        .getJSONObject(0)
                        .getString("title")
                        .equals("Track One"),
                "Songs oldest first");
        check(albums.get(2).getJSONArray("songs").length() == 2, "Cue tracks");
        System.out.println("PASS: " + checks + " album grouping checks.");
    }
}
