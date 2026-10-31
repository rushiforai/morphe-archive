package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.util.*;
import java.util.concurrent.atomic.AtomicLong;
import java.util.zip.ZipOutputStream;

/**
 * Albums kept as one file with a cue sheet. The decoder itself was checked against ffmpeg on FLAC
 * files of every compression level, 16 and 24 bits, mono to 5.1; these tests use FLAC files made by
 * {@link TestFlac}, so no audio is kept in the repo.
 */
public final class CueTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static ZipDirectory.Range over(byte[] b) {
        return (o, n) -> Arrays.copyOfRange(b, (int) o, (int) Math.min(b.length, o + n));
    }

    /** All of a source's bytes from a position on. */
    static byte[] all(ZipDirectory.Source source, long from) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[7000];
        long at = from;
        int n;
        while ((n = source.read(at, buf, 0, buf.length)) > 0) {
            out.write(buf, 0, n);
            at += n;
        }
        return out.toByteArray();
    }

    /** Little-endian PCM of samples [from, to), as the WAV holds it. */
    static byte[] pcm(int[][] s, int bits, int from, int to) {
        int bytes = CueAudio.container(bits) / 8;
        byte[] out = new byte[(to - from) * s.length * bytes];
        int p = 0;
        for (int i = from; i < to; i++)
            for (int[] channel : s)
                for (int k = 0; k < bytes; k++) out[p++] = (byte) (channel[i] >> (8 * k));
        return out;
    }

    static JSONObject cue(CueAlbums.Media m, long start, long end) throws Exception {
        return new JSONObject()
                .put("source", m.source)
                .put("start", start)
                .put("end", end)
                .put("rate", m.rate)
                .put("channels", m.channels)
                .put("bits", m.bits)
                .put("first", m.first)
                .put("total", m.size)
                .put("samples", m.samples)
                .put("minBlock", m.minBlock)
                .put("maxBlock", m.maxBlock)
                .put("maxFrame", m.maxFrame);
    }

    static final String SHEET =
            "﻿REM GENRE Jazz\r\n"
                    + "PERFORMER \"The Trio\"\r\n"
                    + "TITLE \"Night Sessions\"\r\n"
                    + "FILE \"The Trio - Night Sessions.flac\" WAVE\r\n"
                    + "  TRACK 01 AUDIO\r\n"
                    + "    TITLE \"Opening\"\r\n"
                    + "    INDEX 01 00:00:00\r\n"
                    + "  TRACK 02 AUDIO\r\n"
                    + "    TITLE \"Blue Hour\"\r\n"
                    + "    PERFORMER \"The Trio feat. Ana\"\r\n"
                    + "    INDEX 00 00:01:00\r\n"
                    + "    INDEX 01 00:01:30\r\n"
                    + "  TRACK 03 AUDIO\r\n"
                    + "    TITLE \"Closing\"\r\n"
                    + "    INDEX 01 00:03:00\r\n";

    public static void main(String[] args) throws Exception {
        // The decoder, through a whole file and from anywhere in it.
        int rate = 44100, seconds = 5, samples = rate * seconds;
        int[][] stereo = TestFlac.signal(2, samples, 16, 1);
        byte[] flac = TestFlac.encode(stereo, rate, 16, null);
        CueAlbums.Media media = CueAlbums.media(over(flac), flac.length);
        check(
                media.source.equals("flac") && media.samples == samples && media.channels == 2,
                "STREAMINFO read");
        CueAudio whole = new CueAudio(over(flac), cue(media, 0, samples));
        byte[] wav = all(whole, 0);
        byte[] expected = pcm(stereo, 16, 0, samples);
        int header = wav.length - expected.length;
        check(header == 44, "Plain WAV header for stereo 16-bit: " + header);
        check(
                Arrays.equals(Arrays.copyOfRange(wav, header, wav.length), expected),
                "Every sample decodes as encoded: verbatim, fixed, LPC, mid/side");
        check(
                CueAudio.size(samples, 2, 16) == wav.length,
                "The size given to the player is the size read");
        Random random = new Random(3);
        for (int i = 0; i < 50; i++) {
            long at = header + random.nextInt(expected.length - 4000);
            CueAudio fresh = new CueAudio(over(flac), cue(media, 0, samples));
            byte[] buf = new byte[3000];
            int n = fresh.read(at, buf, 0, buf.length);
            check(
                    n > 0
                            && Arrays.equals(
                                    Arrays.copyOf(buf, n),
                                    Arrays.copyOfRange(
                                            expected, (int) at - header, (int) at - header + n)),
                    "Seek " + i + " lands on the right sample");
        }

        // 24-bit mono at 96 kHz gets an extensible header and 3-byte samples.
        int[][] mono = TestFlac.signal(1, 96000, 24, 2);
        byte[] flac24 = TestFlac.encode(mono, 96000, 24, null);
        CueAlbums.Media m24 = CueAlbums.media(over(flac24), flac24.length);
        byte[] wav24 = all(new CueAudio(over(flac24), cue(m24, 1000, 50000)), 0);
        byte[] want24 = pcm(mono, 24, 1000, 50000);
        check(
                wav24.length - want24.length == 68,
                "Extensible header: " + (wav24.length - want24.length));
        check(
                Arrays.equals(Arrays.copyOfRange(wav24, 68, wav24.length), want24),
                "A slice starts and ends on the exact sample");

        // The sheet.
        CueSheet sheet = CueSheet.parse(CueSheet.text(SHEET.getBytes("UTF-8")));
        check(sheet != null && sheet.tracks.size() == 3, "Three tracks");
        check(
                sheet.title.equals("Night Sessions")
                        && sheet.performer.equals("The Trio")
                        && sheet.file.equals("The Trio - Night Sessions.flac"),
                "Album details");
        long[][] ranges = sheet.ranges(rate, samples);
        check(
                ranges[0][0] == 0 && ranges[0][1] == rate && ranges[1][0] == rate * 105 / 75,
                "Track 1 ends where track 2's pregap starts; 00:01:30 is 1 s and 30/75: "
                        + Arrays.toString(ranges[0]));
        check(ranges[2][1] == samples, "The last track ends with the file");
        check(
                CueSheet.parse(SHEET + "FILE \"other.flac\" WAVE\r\n") == null,
                "A file per track isn't one album");
        check(CueSheet.text(new byte[] {(byte) 0xe9}).equals("é"), "Windows-1252 when not UTF-8");

        // Its tracks, from a post of the album file.
        JSONObject album =
                new JSONObject()
                        .put("chat", -100)
                        .put("message", 40)
                        .put("file", 9)
                        .put("size", flac.length)
                        .put("artist", "")
                        .put("fileName", "The Trio - Night Sessions.flac")
                        .put("unique", "AQAD");
        List<JSONObject> tracks = CueAlbums.tracks(sheet, media, album, 0, "x");
        check(tracks.size() == 3, "Three songs");
        JSONObject second = tracks.get(1);
        check(
                second.getString("id").equals("-100_40_100002")
                        && ZipAlbums.validId(second.getString("id"))
                        && TrackNames.validId(second.getString("id")),
                "Id with the track: " + second.getString("id"));
        check(
                second.getString("title").equals("Blue Hour")
                        && second.getString("artist").equals("The Trio feat. Ana")
                        && second.getString("album").equals("Night Sessions"),
                "Named from the sheet: " + second);
        check(
                tracks.get(0).getString("artist").equals("The Trio"),
                "The album's performer when a track has none");
        check(
                second.getInt("duration") == 2 && second.getString("unique").equals("AQAD#2"),
                "Length and key");
        check(
                InternalAddon.quality(second).equals("LOSSLESS"),
                "Counts as lossless: " + InternalAddon.quality(second));
        byte[] track2 = all(new CueAudio(over(flac), second.getJSONObject("cue")), 0);
        check(
                Arrays.equals(
                        Arrays.copyOfRange(track2, 44, track2.length),
                        pcm(stereo, 16, rate * 105 / 75, rate * 3)),
                "Track 2 plays from its INDEX 01 to track 3's start");
        check(track2.length == second.getLong("size"), "Its size");

        // A cue sheet the FLAC file carries itself.
        byte[] tagged = TestFlac.encode(stereo, rate, 16, SHEET);
        CueAlbums.Media taggedMedia = CueAlbums.media(over(tagged), tagged.length);
        CueSheet own = CueAlbums.embeddedSheet(taggedMedia.flac);
        check(own != null && own.tracks.size() == 3, "CUESHEET tag read");
        check(
                CueAlbums.embedded(
                                        new JSONObject()
                                                .put("chat", -1)
                                                .put("message", 2)
                                                .put("file", 3)
                                                .put("size", 4)
                                                .put("format", "flac")
                                                .put("duration", 2400))
                                != null
                        && CueAlbums.embedded(
                                        new JSONObject().put("format", "flac").put("duration", 300))
                                == null,
                "Only long FLAC files are looked into");

        // WAV albums: the track's bytes, passed on.
        byte[] wavAlbum = all(whole, 0);
        CueAlbums.Media wavMedia = CueAlbums.media(over(wavAlbum), wavAlbum.length);
        check(
                wavMedia != null && wavMedia.source.equals("wav") && wavMedia.first == 44,
                "WAV album");
        byte[] wavTrack = all(new CueAudio(over(wavAlbum), cue(wavMedia, rate, rate * 2)), 0);
        check(
                Arrays.equals(
                        Arrays.copyOfRange(wavTrack, 44, wavTrack.length),
                        pcm(stereo, 16, rate, rate * 2)),
                "WAV track bytes");

        // In a zip: the album and its sheet side by side.
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ZipOutputStream zip = new ZipOutputStream(bytes)) {
            ZipDirectoryTest.add(zip, "Night Sessions/The Trio - Night Sessions.flac", flac, true);
            ZipDirectoryTest.add(
                    zip,
                    "Night Sessions/The Trio - Night Sessions.cue",
                    SHEET.getBytes("UTF-8"),
                    false);
            ZipDirectoryTest.add(zip, "Night Sessions/cover.jpg", new byte[500], false);
        }
        byte[] zipped = bytes.toByteArray();
        JSONObject descriptor =
                new JSONObject()
                        .put("chat", -100)
                        .put("message", 50)
                        .put("file", 11)
                        .put("size", zipped.length)
                        .put("fileName", "Night Sessions.zip")
                        .put("unique", "ZIP");
        List<JSONObject> songs = ZipAlbums.songs(descriptor, over(zipped));
        List<String> titles = new ArrayList<>();
        for (JSONObject s : songs) titles.add(s.getString("title"));
        check(
                titles.equals(List.of("Night Sessions", "Opening", "Blue Hour", "Closing")),
                "The album file and its three tracks: " + titles);
        JSONObject zipTrack = songs.get(2);
        check(zipTrack.getString("id").equals("-100_50_100102"), zipTrack.getString("id"));
        JSONObject part = zipTrack.getJSONObject("zip");
        byte[] fromZip =
                all(
                        new CueAudio(
                                ZipAlbums.entryRange(
                                        over(zipped),
                                        part.getLong("data"),
                                        part.getInt("method"),
                                        part.getLong("compressed"),
                                        zipTrack.getJSONObject("cue").getLong("total")),
                                zipTrack.getJSONObject("cue")),
                        0);
        check(
                Arrays.equals(
                        Arrays.copyOfRange(fromZip, 44, fromZip.length),
                        pcm(stereo, 16, rate * 105 / 75, rate * 3)),
                "Played through the zip");

        // A .cue post beside the album's post, found by the index; posted after the album, so
        // the index reaches it first and sets it aside until the album is in.
        Chat chat = new Chat();
        chat.add(-200, 10, "The Trio - Night Sessions.flac", 21, flac);
        chat.add(-200, 11, "The Trio - Night Sessions.cue", 22, SHEET.getBytes("UTF-8"));
        TelegramIndex index =
                new TelegramIndex(new IndexStore.Memory(), chat, new AtomicLong(1)::get);
        Set<Long> chats = Collections.singleton(-200L);
        for (int i = 0; i < 30 && index.step(chats); i++) {}
        check(index.row(-200, 10, 100003) != null, "Track 3 of the album post indexed");
        check(
                index.search(chats, "blue hour", true).size() == 1
                        && index.search(chats, "night sessions", true).size() >= 3,
                "Found by title and album");
        System.out.println(
                "PASS: " + checks + " cue sheet, FLAC decode, seek, zip and index checks.");
    }

    /** Documents in a chat, with their bytes. */
    static final class Chat implements TelegramIndex.Pages {
        final List<TdApi.Message> documents = new ArrayList<>();
        final Map<Integer, byte[]> files = new HashMap<>();

        void add(long chat, long id, String name, int file, byte[] bytes) {
            TdApi.Message m = TestMessages.document(chat, id, name);
            TdApi.Document d = ((TdApi.MessageDocument) m.content).document;
            d.document.id = file;
            d.document.size = bytes.length;
            d.document.remote = new TdApi.RemoteFile();
            d.document.remote.uniqueId = "U" + file;
            documents.add(m);
            files.put(file, bytes);
        }

        @Override
        public TdApi.FoundChatMessages page(long chat, int kind, long from) {
            List<TdApi.Message> page = new ArrayList<>();
            if (kind == 1)
                for (TdApi.Message m : documents)
                    if (m.chatId == chat && (from == 0 || m.id < from)) page.add(m);
            page.sort((a, b) -> Long.compare(b.id, a.id));
            TdApi.FoundChatMessages found = new TdApi.FoundChatMessages();
            found.messages = page.toArray(new TdApi.Message[0]);
            return found;
        }

        @Override
        public int count(long chat, int kind) {
            return kind == 1 ? documents.size() : 0;
        }

        @Override
        public int position(long chat, int kind, long messageId) {
            return 0;
        }

        @Override
        public byte[] range(int file, long offset, int length) {
            byte[] b = files.get(file);
            return Arrays.copyOfRange(b, (int) offset, (int) Math.min(b.length, offset + length));
        }
    }
}
