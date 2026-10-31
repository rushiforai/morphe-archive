package app.bitchord.telegram;

import org.json.JSONObject;

import java.util.*;

public final class DuplicatesTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static JSONObject row(
            String id, String title, String artist, int seconds, String format, long size)
            throws Exception {
        return new JSONObject()
                .put("id", id)
                .put("title", title)
                .put("artist", artist)
                .put("duration", seconds)
                .put("format", format)
                .put("size", size);
    }

    static List<String> ids(List<JSONObject> rows) {
        List<String> out = new ArrayList<>();
        for (JSONObject row : rows) out.add(row.optString("id"));
        return out;
    }

    public static void main(String[] args) throws Exception {
        Map<String, JSONObject> headers = new HashMap<>();
        headers.put("-1_2", new JSONObject().put("bits", 16).put("rate", 44100));
        JSONObject zip24 =
                row("-1_9_3", "Hey You", "Pink Floyd", 280, "flac", 80_000_000)
                        .put("header", new JSONObject().put("bits", 24).put("rate", 96000));
        List<JSONObject> rows =
                List.of(
                        row("-1_1", "Hey You", "Pink Floyd", 281, "mp3", 11_000_000),
                        row("-1_2", "Hey You", "Pink Floyd", 280, "flac", 30_000_000),
                        zip24,
                        row("-1_4", "Hey You", "Pink Floyd", 300, "flac", 30_000_000),
                        row("-1_5", "Hey You", "Some Cover Band", 280, "flac", 30_000_000),
                        row("-1_6", "Comfortably Numb", "Pink Floyd", 382, "mp3", 9_000_000),
                        row("-1_7", "Hey You", "Pink Floyd", 0, "flac", 30_000_000));
        List<JSONObject> kept = Duplicates.best(rows, headers::get);
        check(
                ids(kept).equals(List.of("-1_9_3", "-1_4", "-1_5", "-1_6", "-1_7")),
                "One Hey You, as the 24-bit copy, where the first copy was: " + ids(kept));
        check(
                Duplicates.compare(rows.get(1), rows.get(0), headers::get) > 0,
                "Lossless beats a 320 kbps MP3");
        check(Duplicates.compare(zip24, rows.get(1), headers::get) > 0, "24-bit beats 16-bit");
        check(Duplicates.best(List.of(), headers::get).isEmpty(), "Nothing in, nothing out");
        System.out.println("PASS: " + checks + " duplicate song and best copy checks.");
    }
}
