package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.io.File;
import java.nio.file.Files;
import java.util.*;

public final class TrackDetailsTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static void name(String file, String artist, String title, String expectedArtist) {
        String[] got = TrackDetails.fromFileName(file, artist);
        check(
                got[0].equals(title) && got[1].equals(expectedArtist),
                file + " -> " + got[0] + " / " + got[1]);
    }

    public static void main(String[] args) throws Exception {
        // Quality labels
        int minutes4 = 240;
        check(
                TrackDetails.quality("flac", "audio/flac", 30_000_000, minutes4).equals("LOSSLESS"),
                "CD-quality FLAC");
        check(
                TrackDetails.quality("flac", "", 90_000_000, minutes4).equals("HI_RES_LOSSLESS"),
                "24-bit FLAC by bitrate");
        check(TrackDetails.quality("wav", "", 0, 0).equals("LOSSLESS"), "WAV without length");
        check(TrackDetails.quality("aif", "", 0, 0).equals("LOSSLESS"), "AIFF");
        check(TrackDetails.quality("", "audio/x-flac", 0, 0).equals("LOSSLESS"), "FLAC by type");
        check(
                TrackDetails.quality("m4a", "audio/mp4", 25_000_000, minutes4).equals("LOSSLESS"),
                "ALAC in m4a");
        check(
                TrackDetails.quality("m4a", "audio/mp4", 7_700_000, minutes4).equals("HIGH"),
                "256 kbps AAC");
        check(
                TrackDetails.quality("mp3", "audio/mpeg", 9_600_000, minutes4).equals("HIGH"),
                "320 kbps MP3");
        check(
                TrackDetails.quality("mp3", "audio/mpeg", 3_840_000, minutes4).equals("LOW"),
                "128 kbps MP3");
        check(
                TrackDetails.quality("mp3", "audio/mpeg", 6_000_000, minutes4).isEmpty(),
                "200 kbps is left to BitChord");
        check(TrackDetails.quality("mp3", "audio/mpeg", 3_840_000, 0).isEmpty(), "No length");
        check(TrackDetails.kbps(9_600_000, 240) == 320, "Bitrate");
        check(TrackDetails.kbps(0, 240) == 0 && TrackDetails.kbps(10, 0) == 0, "No bitrate");

        // Names from file names
        name("Linkin Park - Numb.mp3", "", "Numb", "Linkin Park");
        name("03 - Linkin Park - Numb.flac", "", "Numb", "Linkin Park");
        name("03. Numb.flac", "", "Numb", "");
        name("01 Numb.flac", "Linkin Park", "Numb", "Linkin Park");
        name("linkin_park_-_numb.mp3", "", "numb", "linkin park");
        name("Linkin Park - Numb (Official Music Video) [320kbps].mp3", "", "Numb", "Linkin Park");
        name("Linkin Park - Numb (Live).mp3", "", "Numb (Live)", "Linkin Park");
        name("7 Rings.mp3", "", "7 Rings", "");
        name("1979.flac", "", "1979", "");
        name("Linkin Park – One More Light.flac", "", "One More Light", "Linkin Park");
        name("Linkin Park - Numb.mp3", "LINKIN PARK", "Numb", "LINKIN PARK");
        name("Jay-Z - Numb - Encore.mp3", "Linkin Park", "Jay-Z - Numb - Encore", "Linkin Park");
        name("Artist - Title - Remix.flac", "", "Title - Remix", "Artist");
        name(".flac", "", ".flac", "");

        JSONObject untagged =
                TrackMetadata.from(TestMessages.document(10, 21, "02 - Some Band - A Song.flac"));
        check(!untagged.getBoolean("tagged"), "Documents are untagged");
        JSONObject named = TrackDetails.withFileName(untagged);
        check(
                named.getString("title").equals("A Song")
                        && named.getString("artist").equals("Some Band"),
                "Untagged row gets names from the file name");
        check(
                untagged.getString("title").equals("02 - Some Band - A Song.flac"),
                "The cached row isn't changed");
        JSONObject tagged = TrackMetadata.from(TestMessages.audio(10, 20, "Test Song"));
        check(
                tagged.getBoolean("tagged") && TrackDetails.withFileName(tagged) == tagged,
                "Tagged rows keep their names");

        // Covers
        TdApi.Message withCover = TestMessages.audio(10, 22, "Covered");
        TdApi.Audio audio = ((TdApi.MessageAudio) withCover.content).audio;
        audio.externalAlbumCovers = new TdApi.Thumbnail[] {thumbnail(31, 100), thumbnail(32, 600)};
        JSONObject covered = TrackMetadata.from(withCover);
        check(covered.getInt("cover") == 32, "Largest external cover");
        audio.albumCoverThumbnail = thumbnail(30, 300);
        check(TrackMetadata.from(withCover).getInt("cover") == 30, "The file's own cover first");
        check(!tagged.has("cover"), "No cover");

        File dir = Files.createTempDirectory("artwork").toFile();
        File source = new File(dir, "source.jpg");
        Files.write(source.toPath(), new byte[] {(byte) 0xff, (byte) 0xd8, 1, 2, 3});
        Artwork artwork = new Artwork(new File(dir, "covers"));
        List<JSONObject> rows = Arrays.asList(covered, tagged);
        List<Integer> asked = new ArrayList<>();
        artwork.fill(
                rows,
                (file, done) -> {
                    asked.add(file);
                    done.finished(source.getAbsolutePath());
                },
                1000);
        check(asked.equals(Collections.singletonList(32)), "Only rows with covers download");
        String url = covered.optString("artworkURL");
        check(url.startsWith("file://") && new File(url.substring(7)).length() == 5, "Cover saved");
        check(!url.matches(".*w\\d+-h\\d+.*"), "No size hint BitChord would rewrite");
        check(!tagged.has("artworkURL"), "No artwork without a cover");
        asked.clear();
        artwork.fill(rows, (file, done) -> asked.add(file), 0);
        check(
                asked.isEmpty() && covered.optString("artworkURL").equals(url),
                "Saved covers reused");
        JSONObject slow = new JSONObject(covered.toString()).put("coverKey", "slow");
        slow.remove("artworkURL");
        artwork.fill(Collections.singletonList(slow), (file, done) -> {}, 10);
        check(!slow.has("artworkURL"), "Covers that don't arrive in time are left out");
        artwork.fill(Collections.singletonList(slow), (file, done) -> done.finished(null), 10);
        check(!slow.has("artworkURL"), "Failed downloads are left out");
        artwork.clear();
        check(artwork.cached(covered) == null, "Sign-out removes covers");

        System.out.println("PASS: " + checks + " quality, file-name and album-cover checks.");
    }

    static TdApi.Thumbnail thumbnail(int id, int width) {
        TdApi.File file = new TdApi.File();
        file.id = id;
        file.remote = new TdApi.RemoteFile();
        file.remote.uniqueId = "u" + id;
        TdApi.Thumbnail thumbnail = new TdApi.Thumbnail();
        thumbnail.file = file;
        thumbnail.width = width;
        thumbnail.height = width;
        return thumbnail;
    }
}
