package app.morphed.extension.twitch.musicfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import app.morphed.extension.twitch.net.JsonParser;
import app.morphed.extension.twitch.net.Web;

/** Shazam's and YouTube's answers, the song library and the resampler. */
public class SongSourcesTest {
    @Rule
    public TemporaryFolder folder = new TemporaryFolder();

    @Test
    public void readsShazamsAnswer() {
        Object answer = JsonParser.parse("{\"matches\":[{\"offset\":40.005}],\"track\":{\"key\":\"678505149\","
                + "\"title\":\"Blank Space\",\"subtitle\":\"Taylor Swift\"}}");
        Song song = ShazamClient.songOf(answer);
        assertEquals("678505149", song.key);
        assertEquals("Taylor Swift - Blank Space", song.toString());
        assertEquals(40.005, song.offset, 1e-9);
        assertNull(ShazamClient.songOf(JsonParser.parse("{\"matches\":[]}")));
        assertTrue(Double.isNaN(ShazamClient.songOf(JsonParser.parse("{\"track\":{\"key\":\"1\",\"title\":\"t\"}}")).offset));
    }

    @Test
    public void shazamFailuresSayWhatHappened() {
        Web refusing = request -> new Web.Response(429, Collections.emptyMap(), new byte[0]);
        try {
            new ShazamClient(refusing).recognize(new float[48000 * 10]);
            fail();
        } catch (SongProblem.RateLimited expected) {
            assertEquals("Shazam is getting too many requests from this connection", expected.getMessage());
        } catch (SongProblem other) {
            fail(other.getMessage());
        }
        Web down = request -> {
            throw new java.net.UnknownHostException("amp.shazam.com");
        };
        try {
            new ShazamClient(down).recognize(new float[48000 * 10]);
            fail();
        } catch (SongProblem expected) {
            assertEquals("Shazam couldn't be asked what's playing: no internet connection", expected.getMessage());
        }
    }

    @Test
    public void downsamplesForShazam() {
        float[] tone = new float[48000];
        for (int i = 0; i < tone.length; i++) tone[i] = (float) Math.sin(2 * Math.PI * 1000 * i / 48000.0) * 0.5f;
        short[] out = ShazamClient.to16k(tone);
        assertEquals(16000, out.length);
        int peak = 0;
        for (int i = 100; i < out.length - 100; i++) peak = Math.max(peak, Math.abs(out[i]));
        assertTrue("1 kHz kept at its level: " + peak, peak > 15000 && peak < 17500);
    }

    @Test
    public void readsYouTubeSearchesAndPicksOpus() throws SongProblem {
        Object music = JsonParser.parse("{\"contents\":{\"x\":[{\"musicResponsiveListItemRenderer\":{\"a\":{\"videoId\":\"A1\"},"
                + "\"b\":{\"videoId\":\"A1\"}}},{\"musicResponsiveListItemRenderer\":{\"videoId\":\"B2\"}},"
                + "{\"musicResponsiveListItemRenderer\":{\"videoId\":\"C3\"}},{\"musicResponsiveListItemRenderer\":{\"videoId\":\"D4\"}}]}}");
        assertEquals(Arrays.asList("A1", "B2", "C3"), YouTubeClient.videoIds(music, "musicResponsiveListItemRenderer"));

        Object player = JsonParser.parse("{\"playabilityStatus\":{\"status\":\"OK\"},\"streamingData\":{\"adaptiveFormats\":["
                + "{\"mimeType\":\"video/mp4\",\"url\":\"v\",\"bitrate\":900000},"
                + "{\"mimeType\":\"audio/mp4; codecs=\\\"mp4a.40.2\\\"\",\"url\":\"m4a\",\"bitrate\":130000,\"contentLength\":\"100\"},"
                + "{\"mimeType\":\"audio/webm; codecs=\\\"opus\\\"\",\"url\":\"opus\",\"bitrate\":120000,\"contentLength\":\"200\"}]},"
                + "\"adPlacements\":[{\"adPlacementRenderer\":{\"config\":{\"adPlacementConfig\":{\"kind\":\"AD_PLACEMENT_KIND_START\"}},"
                + "\"renderer\":{\"instreamVideoAdRenderer\":{\"playerVars\":\"a=1&length_seconds=5\"}}}}]}");
        YouTubeClient.Stream stream = YouTubeClient.pick(player);
        assertEquals("opus", stream.url);
        assertEquals("webm", stream.extension);
        assertEquals(200, stream.length);
        assertEquals(5000, stream.waitMs);

        try {
            YouTubeClient.pick(JsonParser.parse("{\"playabilityStatus\":{\"status\":\"LOGIN_REQUIRED\",\"reason\":\"Sign in to confirm your age\"}}"));
            fail();
        } catch (SongProblem expected) {
            assertEquals("YouTube wants a login for this one", expected.getMessage());
        }
    }

    @Test
    public void downloadsInPiecesWithAPreRollWait() throws Exception {
        String player = "{\"playabilityStatus\":{\"status\":\"OK\"},\"streamingData\":{\"adaptiveFormats\":["
                + "{\"mimeType\":\"audio/webm; codecs=\\\"opus\\\"\",\"url\":\"https://g/v?x=1\",\"bitrate\":1,\"contentLength\":\"6\"}]},"
                + "\"adPlacements\":[{\"adPlacementRenderer\":{\"config\":{\"adPlacementConfig\":{\"kind\":\"AD_PLACEMENT_KIND_START\"}},"
                + "\"renderer\":{\"instreamVideoAdRenderer\":{\"skipOffsetMilliseconds\":2500}}}}]}";
        List<String> asked = new ArrayList<>();
        Web web = request -> {
            asked.add(request.url);
            if (request.url.contains("/player")) return new Web.Response(200, Collections.emptyMap(), player.getBytes(StandardCharsets.UTF_8));
            return new Web.Response(200, Collections.emptyMap(), "abcdef".getBytes(StandardCharsets.UTF_8));
        };
        long[] slept = {0};
        File file = new YouTubeClient(web, ms -> slept[0] = ms).download("vid", folder.getRoot());
        assertEquals(2500, slept[0]);
        assertEquals("vid.webm", file.getName());
        assertEquals(6, file.length());
        assertTrue(asked.get(1), asked.get(1).endsWith("&range=0-5"));
    }

    private static final class FakeSource implements SongLibrary.Source {
        final List<String> searches = new ArrayList<>();

        @Override
        public List<String> search(Song song, boolean music) throws SongProblem {
            searches.add(music ? "music" : "youtube");
            if (!music) throw new SongProblem("Searching YouTube for x failed: refused (403)");
            return Arrays.asList("m1", "m2");
        }

        @Override
        public File download(String videoId, File into) throws SongProblem {
            File file = new File(into, videoId + ".webm");
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(new byte[10]);
            } catch (IOException e) {
                throw new SongProblem(e.getMessage());
            }
            return file;
        }
    }

    @Test
    public void libraryTriesTheKnownCopyFirstAndSearchesOnlyWhenNeeded() throws Exception {
        FakeSource source = new FakeSource();
        SongLibrary library = new SongLibrary(folder.getRoot(), source, (id, file) -> new SongCopy(id, new short[4], new short[4]));
        Song song = new Song("k", "Title", "Artist");
        library.remember(song, "known");
        Iterator<String> candidates = library.candidates(song);
        assertEquals("known", candidates.next());
        assertTrue(source.searches.isEmpty());
        assertEquals("m1", candidates.next());
        assertEquals(Collections.singletonList("music"), source.searches);
        assertEquals("m2", candidates.next());
        try {
            candidates.hasNext();
            fail("the failed YouTube search wasn't told");
        } catch (Tracker.SearchFailed expected) {
            assertTrue(expected.problem.getMessage().contains("refused"));
        }

        SongCopy copy = library.load("m1");
        assertEquals("m1", copy.videoId);
        library.keepPrint("m1", new float[]{1, 2, 3});
        library.remember(song, "m1");
        List<Tracker.Known> known = new SongLibrary(folder.getRoot(), source, null).heardBefore();
        assertEquals(1, known.size());
        assertEquals("m1", known.get(0).videoId);
        assertEquals(3, known.get(0).print.read().length);
        Object index = JsonParser.parse(new String(java.nio.file.Files.readAllBytes(
                new File(folder.getRoot(), "songs.json").toPath()), StandardCharsets.UTF_8));
        assertEquals("m1", JsonParser.string(index, "k", "id"));
        assertTrue(index instanceof Map);
    }

    @Test
    public void libraryMakesRoomOldestFirst() throws Exception {
        SongLibrary library = new SongLibrary(folder.getRoot(), new FakeSource(), null);
        for (String id : new String[]{"old", "new"}) {
            File file = new File(folder.getRoot(), id + ".webm");
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(new byte[100]);
            }
        }
        assertTrue(new File(folder.getRoot(), "old.webm").setLastModified(1_000_000L));
        library.makeRoom(150);
        assertFalse(new File(folder.getRoot(), "old.webm").exists());
        assertTrue(new File(folder.getRoot(), "new.webm").exists());
    }

    @Test
    public void resamplesToFortyEightKilohertzCleanly() {
        short[] in = new short[44100];
        for (int i = 0; i < in.length; i++) in[i] = (short) (Math.sin(2 * Math.PI * 440 * i / 44100.0) * 16000);
        short[] out = Resampler.resample(in, 44100, 48000);
        assertEquals(48000, out.length);
        double worst = 0;
        for (int i = 200; i < out.length - 200; i++) {
            double expected = Math.sin(2 * Math.PI * 440 * i / 48000.0) * 16000;
            worst = Math.max(worst, Math.abs(out[i] - expected));
        }
        assertTrue("worst error " + worst, worst < 80);
    }

    @Test
    public void aBrokenIndexIsToldOnceSomeoneListens() throws Exception {
        try (FileOutputStream out = new FileOutputStream(new File(folder.getRoot(), "songs.json"))) {
            out.write("[1, 2".getBytes(StandardCharsets.UTF_8));
        }
        SongLibrary library = new SongLibrary(folder.getRoot(), new FakeSource(), null);
        List<String> told = new ArrayList<>();
        library.onProblem(told::add);
        assertEquals(1, told.size());
        assertTrue(told.get(0), told.get(0).startsWith("The list of songs found before couldn't be read"));
        library.onProblem(told::add);
        assertEquals("told once", 1, told.size());
    }

    @Test
    public void aSaveThatFailsIsToldOnce() throws Exception {
        File notAFolder = folder.newFile("songs"); // the library's folder can't be made: every save fails
        SongLibrary library = new SongLibrary(notAFolder, new FakeSource(), null);
        List<String> told = new ArrayList<>();
        library.onProblem(told::add);
        library.keepPrint("a", new float[]{1});
        library.keepPrint("b", new float[]{1});
        library.remember(new Song("k", "T", "A"), "a");
        assertEquals(told.toString(), 1, told.size());
        assertTrue(told.get(0), told.get(0).startsWith("Songs can't be kept"));
    }

    @Test
    public void onlyTheLatestSongsHeardBeforeAreLookedThrough() throws Exception {
        SongLibrary library = new SongLibrary(folder.getRoot(), new FakeSource(), null);
        for (int i = 0; i < Tracker.KNOWN_MAX + 10; i++) {
            String id = "v" + i;
            try (FileOutputStream out = new FileOutputStream(new File(folder.getRoot(), id + ".webm"))) {
                out.write(new byte[10]);
            }
            library.keepPrint(id, new float[]{i});
            library.remember(new Song("k" + i, "T" + i, "A"), id);
        }
        List<Tracker.Known> known = library.heardBefore();
        assertEquals(Tracker.KNOWN_MAX, known.size());
        assertEquals("the latest first", "v" + (Tracker.KNOWN_MAX + 9), known.get(0).videoId);
    }
}
