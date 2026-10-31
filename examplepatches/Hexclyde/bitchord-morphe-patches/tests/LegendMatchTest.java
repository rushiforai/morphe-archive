package app.bitchord.telegram;

import org.json.JSONObject;

import java.util.Arrays;
import java.util.List;

public final class LegendMatchTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static JSONObject row(
            String id, String title, String artist, int duration, String format, long size)
            throws Exception {
        return new JSONObject()
                .put("id", id)
                .put("title", title)
                .put("artist", artist)
                .put("duration", duration)
                .put("format", format)
                .put("size", size);
    }

    public static void main(String[] args) throws Exception {
        check(LegendMatch.label("flac", 24, 2100).equals("FLAC 24bit"), "Lossless shows bits");
        check(LegendMatch.label("flac", null, null).equals("FLAC"), "Lossless without bits");
        check(LegendMatch.label("mp3", null, 320).equals("MP3 320kbps"), "Lossy shows bitrate");
        check(LegendMatch.label("opus", null, 160).equals("OPUS 160kbps"), "YouTube Opus");
        check(LegendMatch.label("mp4a", 16, 256).equals("AAC 256kbps"), "AAC ignores bits");
        check(LegendMatch.label("aac", null, null).equals("AAC"), "Lossy without bitrate");
        check(LegendMatch.label("eac3-joc", null, 768).equals("Dolby Atmos"), "Atmos");
        check(LegendMatch.label("eac3", null, 640).equals("DD+ 640kbps"), "Dolby Digital Plus");
        check(LegendMatch.label("ac3", null, 448).equals("DD 448kbps"), "Dolby Digital");
        check(
                LegendMatch.label("xyz", 16, 100).isEmpty()
                        && LegendMatch.label(null, 1, 1).isEmpty(),
                "Unknown codecs get nothing");

        JSONObject mp3 = row("10_1", "Crawling", "Linkin Park", 209, "mp3", 8_360_000);
        check(
                LegendMatch.row(mp3, null).equals("MP3 320kbps"),
                "Telegram MP3 from size and length");
        JSONObject flac = row("10_2", "Crawling", "Linkin Park", 209, "flac", 30_000_000);
        check(LegendMatch.row(flac, null).equals("FLAC"), "FLAC before its header is read");
        check(
                LegendMatch.row(flac, new JSONObject().put("codec", "flac").put("bits", 24))
                        .equals("FLAC 24bit"),
                "FLAC with header");
        check(
                LegendMatch.row(row("10_3", "x", "", 200, "m4a", 25_000_000), null).equals("ALAC"),
                "High-bitrate m4a is ALAC");
        check(
                LegendMatch.row(row("10_4", "x", "", 200, "m4a", 6_400_000), null)
                        .equals("AAC 256kbps"),
                "Ordinary m4a is AAC");

        check(
                LegendMatch.seconds("3:29") == 209 && LegendMatch.seconds("1:00:01") == 3601,
                "Lengths");
        check(LegendMatch.seconds(null) == 0 && LegendMatch.seconds("live") == 0, "No length");

        JSONObject live = row("10_5", "Crawling (Live In Texas)", "Linkin Park", 221, "flac", 1);
        JSONObject other = row("10_6", "Crawling", "Some Cover Band", 209, "flac", 1);
        List<JSONObject> rows = Arrays.asList(live, other, flac);
        check(
                LegendMatch.match("Crawling", "Linkin Park", "3:29", rows) == flac,
                "Same song matched");
        check(
                LegendMatch.match("Crawling", "Linkin Park", "3:35", rows) == null,
                "Six seconds apart is another recording");
        check(
                LegendMatch.match("Crawling (Live In Texas)", "Linkin Park", "3:41", rows) == live,
                "Live version matched to the live file");
        check(
                LegendMatch.match("Crawling", "Linkin Park, Mike Shinoda", "3:29", rows) == flac,
                "Featured artists still match");
        check(LegendMatch.match("Crawling", "Linkin Park", null, rows) == flac, "Unknown length");
        check(LegendMatch.match("Numb", "Linkin Park", "3:07", rows) == null, "Different title");
        check(LegendMatch.match("", "Linkin Park", "3:29", rows) == null, "No title");
        System.out.println("PASS: " + checks + " format legend label and search-match checks.");
    }
}
