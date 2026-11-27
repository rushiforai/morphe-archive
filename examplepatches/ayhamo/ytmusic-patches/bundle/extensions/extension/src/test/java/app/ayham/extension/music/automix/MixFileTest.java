package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assume;
import org.junit.Test;

/** Mix files (spec/automix/mix-file.md): reading, writing, the round trip of the ready-made mixes. */
public class MixFileTest {
    /**
     * The ready-made mixes: spec/automix/mixes/ (mirrored from the extension), and the user's own
     * folder when the run can see it (AYHAM_MIXES_DIR, D:\Programs\Projects\YT Clients\mixes).
     */
    private static List<File> readyMade() {
        List<File> dirs = new ArrayList<>();
        String env = System.getenv("AYHAM_MIXES_DIR");
        if (env != null) dirs.add(new File(env));
        for (File d = new File("").getAbsoluteFile(); d != null; d = d.getParentFile()) dirs.add(new File(d, "spec/automix/mixes"));
        List<File> files = new ArrayList<>();
        for (File d : dirs) {
            File[] fs = d.listFiles((x, n) -> n.endsWith(".json"));
            if (fs != null) files.addAll(Arrays.asList(fs));
        }
        return files;
    }

    private static String read(File f) throws Exception {
        return new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8);
    }

    @Test
    @SuppressWarnings("unchecked")
    public void theReadyMadeMixesRoundTrip() throws Exception {
        List<File> files = readyMade();
        // spec/automix/mixes/ is in the repo: none found is a wrong folder, not a skip
        assertTrue("no ready-made mixes found", !files.isEmpty());
        for (File f : files) {
            String text = read(f);
            MixFile.Read r = MixFile.read(text);
            assertNull(f.getName(), r.refused);
            assertEquals(f.getName() + " skipped " + r.skipped, 0, r.skipped.size());
            List<Object> raw = (List<Object>) ((Map<String, Object>) Json.parse(text)).get("mixes");
            assertEquals(raw.size(), r.mixes.size());
            for (int i = 0; i < raw.size(); i++) {
                // the override comes back as the file has it (it is saved normalized)
                Object want = ((Map<String, Object>) raw.get(i)).get("override");
                assertEquals(f.getName(), canon(want), canon(r.mixes.get(i).override.toJson()));
                // drawn lanes come back drawn (the Spotify mixes have none)
                if (Json.write(want).contains("\"points\"")) assertTrue(r.mixes.get(i).override.hasDrawing());
            }
            // written and read again: the same overrides, songs and file
            String again = MixFile.text(MixFile.write(r.mixes));
            MixFile.Read r2 = MixFile.read(again);
            assertNull(r2.refused);
            assertEquals(r.mixes.size(), r2.mixes.size());
            for (int i = 0; i < r.mixes.size(); i++) {
                MixFile.Mix a = r.mixes.get(i), b = r2.mixes.get(i);
                assertEquals(a.key, b.key);
                assertEquals(a.from.title, b.from.title);
                assertEquals(a.to.artist, b.to.artist);
                assertTrue(MixFile.same(a.override, b.override));
            }
            assertEquals(f.getName(), canon(Json.parse(text)), canon(Json.parse(again)));
            // saved as the app saves it, then imported again: the same, nothing to confirm
            Map<String, MixOverride> saved = new HashMap<>();
            for (MixFile.Mix m : r.mixes) {
                MixOverride s = MixOverride.fromJson(m.override.toJson());
                s.engine = 2;
                s.savedAt = 1764000000000L;
                saved.put(m.key, s);
            }
            MixFile.Plan p = MixFile.plan(r.mixes, saved);
            assertEquals(r.mixes.size(), p.same.size());
            assertTrue(p.replace.isEmpty());
        }
    }

    /** JSON text with each object's keys sorted: the same data whatever order a writer used. */
    @SuppressWarnings("unchecked")
    private static String canon(Object v) {
        if (v instanceof Map) {
            Map<String, Object> m = new java.util.TreeMap<>();
            for (Map.Entry<String, Object> e : ((Map<String, Object>) v).entrySet()) m.put(e.getKey(), Json.parse(canon(e.getValue())));
            return Json.write(m);
        }
        if (v instanceof List) {
            List<Object> l = new ArrayList<>();
            for (Object x : (List<Object>) v) l.add(Json.parse(canon(x)));
            return Json.write(l);
        }
        // a whole number the same whether a writer wrote 98 or 98.0
        if (v instanceof Number && !(v instanceof Long) && ((Number) v).doubleValue() == Math.rint(((Number) v).doubleValue())
                && Math.abs(((Number) v).doubleValue()) < 1e15) return Json.write(((Number) v).longValue());
        return Json.write(v);
    }

    private static final String A = "rCwSRV7P6hY", B = "0X3Y2m9wj5c";

    private static String file(String mixes) {
        return "{\"format\":\"vivi-mix\",\"version\":1,\"mixes\":[" + mixes + "]}";
    }

    private static String mix(String from, String to, String override) {
        return "{\"from\":{\"videoId\":\"" + from + "\"},\"to\":{\"videoId\":\"" + to + "\"},\"override\":" + override + "}";
    }

    @Test
    public void aFileThatIsntOneIsRefused() {
        assertEquals("not a Vivimusic mix file: it is not JSON", MixFile.read("{nope").refused);
        assertEquals("not a Vivimusic mix file", MixFile.read("{\"format\":\"other\"}").refused);
        assertEquals("the mix file has no valid version", MixFile.read("{\"format\":\"vivi-mix\",\"version\":1.5,\"mixes\":[]}").refused);
        assertEquals("this mix file is version 2, newer than this app reads (1): update the app to import it",
                MixFile.read("{\"format\":\"vivi-mix\",\"version\":2,\"mixes\":[]}").refused);
        assertEquals("the mix file has no mixes", MixFile.read(file("")).refused);
        String one = mix(A, B, "{\"bars\":8}");
        String many = String.join(",", Collections.nCopies(301, one));
        assertEquals("the mix file has 301 mixes: 300 is the most", MixFile.read(file(many)).refused);
        // a BOM and unknown fields are fine
        MixFile.Read r = MixFile.read("\uFEFF" + "{\"format\":\"vivi-mix\",\"version\":1,\"by\":\"x\",\"mixes\":[" + one + "]}");
        assertNull(r.refused);
        assertEquals(1, r.mixes.size());
    }

    @Test
    public void aMixItCantUseIsSkippedTheRestImported() {
        MixFile.Read r = MixFile.read(file(String.join(",",
                mix("short", B, "{\"bars\":8}"),
                mix(A, A, "{\"bars\":8}"),
                mix(A, B, "{\"preset\":\"auto\"}"),
                mix(A, B, "{\"preset\":\"echo\"}"),
                mix(A, B, "{\"preset\":\"custom\",\"lanes\":{\"volume\":\"wobble\",\"eq\":\"none\",\"effect\":\"none\"}}"),
                mix(A, B, "{\"preset\":\"smooth\",\"bars\":4}"),
                mix(A, B, "{\"preset\":\"rise\",\"engine\":3,\"savedAt\":5}"))));
        assertNull(r.refused);
        assertEquals(Arrays.asList(
                "mix 1 skipped: a song has no valid videoId",
                "mix 2 skipped: the same song on both sides",
                "mix 3 skipped: nothing but Auto in it",
                "mix 4 skipped: the preset \"echo\" is unknown here",
                "mix 5 skipped: its lanes are not valid",
                "mix 6 skipped: the same pair again in mix 7: the later one is used"), r.skipped);
        assertEquals(1, r.mixes.size());
        MixOverride o = r.mixes.get(0).override;
        assertEquals("rise", o.preset);
        assertEquals(0, o.engine);
        assertEquals(0, o.savedAt);
        assertEquals(A + ">" + B, r.mixes.get(0).key);
    }

    @Test
    public void aReplacementSaysWhatChanges() {
        MixOverride was = MixOverride.fromJson(Json.parse("{\"preset\":\"custom\",\"lanes\":{\"volume\":\"crossfade\",\"eq\":\"none\",\"effect\":\"none\"}}"));
        MixOverride now = MixOverride.fromJson(Json.parse("{\"preset\":\"custom\",\"lanes\":{\"volume\":{\"unit\":\"beat\",\"out\":[[0,1],[8,0]],\"in\":[[0,0],[8,1]]},"
                + "\"eq\":\"none\",\"effect\":\"none\"},\"bars\":16,\"window\":{\"out\":{\"bar\":40,\"beat\":2,\"nudgeMs\":-20,\"sec\":90.5}},\"lock\":true}"));
        assertEquals(Arrays.asList("volume: crossfade → drawn", "length: auto → 16 bars", "mix-out: auto → bar 40.3 -20 ms", "lock: off → on"),
                MixFile.changes(was, now));
        MixOverride other = MixOverride.fromJson(Json.parse("{\"preset\":\"custom\",\"lanes\":{\"volume\":{\"unit\":\"beat\",\"out\":[[0,1],[4,0]],\"in\":[[0,0],[8,1]]},"
                + "\"eq\":\"none\",\"effect\":\"none\"},\"bars\":16,\"window\":{\"out\":{\"bar\":40,\"beat\":2,\"nudgeMs\":-20,\"sec\":90.5}},\"lock\":true}"));
        assertEquals(Collections.singletonList("volume: drawn → another drawing"), MixFile.changes(now, other));
        assertEquals(Arrays.asList("preset: custom → smooth", "volume: drawn → smooth's", "eq: none → smooth's", "effect: none → smooth's"),
                MixFile.changes(now, MixOverride.fromJson(Json.parse("{\"preset\":\"smooth\",\"bars\":16,\"window\":{\"out\":{\"bar\":40,\"beat\":2,\"nudgeMs\":-20,\"sec\":90.5}},\"lock\":true}"))));

        Map<String, MixOverride> saved = new HashMap<>();
        saved.put(A + ">" + B, was);
        MixFile.Read r = MixFile.read(file(mix(A, B, Json.write(now.toJson())) + "," + mix(B, A, "{\"bars\":4}")));
        MixFile.Plan p = MixFile.plan(r.mixes, saved);
        assertEquals(1, p.add.size());
        assertEquals(1, p.replace.size());
        assertNotNull(p.replace.get(0).changes);
        assertEquals("Imported 1 mix · 1 kept as saved.", MixFile.summary(r, p, 1, 1, Collections.emptyList(), Collections.emptyList()));
    }

    @Test
    public void halfAndDoubleTimeFoldTheBeats() {
        MixOverride o = MixOverride.fromJson(Json.parse("{\"preset\":\"custom\",\"lanes\":{\"volume\":{\"unit\":\"beat\",\"out\":[[0,1],[16,1],[31.9,0]],\"in\":[[0,0],[32,1]]},"
                + "\"eq\":\"none\",\"effect\":\"none\"},\"bars\":8,\"beatMatch\":\"glide\",\"gridBpm\":130}"));
        assertEquals(130, o.gridBpm, 0);
        // the same grid (within 4%): as it is
        MixOverride.Fold same = MixOverride.fold(o, 127);
        assertEquals(1, same.k, 0);
        assertTrue(same.ov == o);
        // A read at half time: half the beats, the same seconds
        MixOverride.Fold half = MixOverride.fold(o, 65.2);
        assertEquals(0.5, half.k, 0);
        assertEquals(4, half.ov.bars);
        assertEquals(65, half.ov.gridBpm, 0);
        assertNull(half.note);
        double[][] out = half.ov.drawn[0].out.get("gain");
        assertEquals(8, out[1][0], 0);
        assertEquals(15.95, out[2][0], 1e-9);
        assertEquals(16, half.ov.drawn[0].in.get("gain")[1][0], 0);
        assertEquals(31.9, o.drawn[0].out.get("gain")[2][0], 0); // the saved one unchanged
        // double time: a length past 32 plays as 32, and says so
        MixOverride big = o.copy();
        big.bars = 32;
        MixOverride.Fold dbl = MixOverride.fold(big, 260);
        assertEquals(32, dbl.ov.bars);
        assertEquals("64 bars on this song's grid: 32 play", dbl.note);
        // tempos that don't fold, or no gridBpm: the beats as they are, with a note
        assertEquals("drawn at 130 BPM, this song reads 100 BPM: its beats are taken as they are", MixOverride.fold(o, 100).note);
        MixOverride none = o.copy();
        none.gridBpm = 0;
        assertEquals("no gridBpm: its beats are taken as they are", MixOverride.foldNote(none, 65));
        assertNull(MixOverride.foldNote(o, 130));
        // gridBpm alone is no edit, and no change (rules 2, 5)
        assertNull(MixOverride.normalize(MixOverride.fromJson(Json.parse("{\"gridBpm\":130}"))));
        assertTrue(MixFile.same(o, none));
    }

    @Test
    public void exportNamesTheFile() {
        List<MixFile.Mix> one = Collections.singletonList(new MixFile.Mix(new MixFile.Song(A, "Cinderella", "Future"),
                new MixFile.Song(B, "Drowning (feat. Kodak Black)", null), MixOverride.fromJson(Json.parse("{\"bars\":8,\"engine\":2,\"savedAt\":9}"))));
        Map<String, Object> f = MixFile.write(one);
        assertEquals("cinderella-drowningfeatkodakblack.json", MixFile.fileName(f, "2026-11-25"));
        String t = MixFile.text(f);
        assertTrue(t, !t.contains("engine") && !t.contains("savedAt"));
        List<MixFile.Mix> two = new ArrayList<>(one);
        two.add(new MixFile.Mix(new MixFile.Song(B, null, null), new MixFile.Song(A, null, null), MixOverride.fromJson(Json.parse("{\"bars\":4}"))));
        assertEquals("mixes-2026-11-25.json", MixFile.fileName(MixFile.write(two), "2026-11-25"));
    }

    private static MixFile.Mix pair(String a, String b) {
        return new MixFile.Mix(new MixFile.Song(a, null, null), new MixFile.Song(b, null, null), MixOverride.fromJson(Json.parse("{\"bars\":8}")));
    }

    /** Play these mixes: from then to per mix, in the file's order, a song already next in line not added twice. */
    @Test
    public void playOrderQueuesFromThenToWithoutRepeats() {
        String a = "aaaaaaaaaaa", b = "bbbbbbbbbbb", c = "ccccccccccc", d = "ddddddddddd";
        assertEquals(Arrays.asList(a, b, c), MixFile.playOrder(Arrays.asList(pair(a, b), pair(b, c))));
        assertEquals(Arrays.asList(a, b, c, d), MixFile.playOrder(Arrays.asList(pair(a, b), pair(c, d))));
        // only the song next in line is skipped: a later return to a song plays it again
        assertEquals(Arrays.asList(a, b, a, c), MixFile.playOrder(Arrays.asList(pair(a, b), pair(b, a), pair(a, c))));
        assertEquals(Collections.emptyList(), MixFile.playOrder(Collections.emptyList()));
        List<MixFile.Mix> many = new ArrayList<>();
        for (int i = 0; i < 40; i++) many.add(pair(String.format("x%010d", 2 * i), String.format("x%010d", 2 * i + 1)));
        // no cap here: Play next takes them all (only the temporary-list fallback stops at PLAY_MAX)
        List<String> ids = MixFile.playOrder(many);
        assertEquals(80, ids.size());
        assertEquals("x0000000000", ids.get(0));
    }

    /**
     * Rule 7's fresh queue: everything but the playing song goes, then the file's songs behind it; a
     * first song that is the playing one plays on, and a second press makes the same queue again.
     */
    @Test
    public void freshQueueKeepsOnlyAPlayingFirstSong() {
        String a = "aaaaaaaaaaa", b = "bbbbbbbbbbb", c = "ccccccccccc", x = "xxxxxxxxxxx";
        List<String> none = Collections.emptyList();
        assertEquals(Arrays.asList(b, c), MixFile.freshAdds(Arrays.asList(a, b, c), a));
        // another song playing: all the file's songs go behind it, the first is skipped to
        assertEquals(Arrays.asList(a, b, c), MixFile.freshAdds(Arrays.asList(a, b, c), x));
        assertEquals(Arrays.asList(a, b, c), MixFile.freshAdds(Arrays.asList(a, b, c), b));
        assertEquals(none, MixFile.freshAdds(Collections.singletonList(a), a));
        // a second press, a playing: b and c are cleared and added again, not left as they were
        assertEquals(Arrays.asList(b, c), MixFile.freshAdds(Arrays.asList(a, b, c), a));
        // the old queue goes, last first, all but the playing item (history before it too)
        assertEquals(Arrays.asList(4, 3, 1, 0), MixFile.clearOrder(5, 2));
        assertEquals(Arrays.asList(2, 1), MixFile.clearOrder(3, 0));
        assertEquals(none, MixFile.clearOrder(1, 0));
    }

    /** Seconds-only positions (editor.md §6, mix-file.md rule 2): read, kept without a bar, played at the nearest beat. */
    @Test
    public void secondsOnlyPositions() {
        MixFile.Read r = MixFile.read(file(mix(A, B, "{\"v\":1,\"bars\":4,\"window\":{\"out\":{\"sec\":218.142},\"in\":{\"sec\":0,\"nudgeMs\":20}},\"gridBpm\":96.78}")));
        assertNull(r.refused);
        assertEquals(1, r.mixes.size());
        MixOverride o = r.mixes.get(0).override;
        assertTrue(o.out.secOnly);
        assertTrue(o.in.secOnly);
        // written back without a bar
        assertEquals("{\"v\":1,\"bars\":4,\"window\":{\"out\":{\"sec\":218.142},\"in\":{\"nudgeMs\":20,\"sec\":0}},\"gridBpm\":96.78}",
                Json.write(o.toJson()));
        // the nearest beat to sec - nudge, the nudge on top, never moved
        double beat = 60 / 96.78, down = 0.4;
        MixOverride.Resolved w = MixOverride.resolveWindow(o.out, down, beat);
        long j = Math.round((218.142 - down) / beat);
        assertEquals(down + j * beat, w.sec, 1e-6);
        assertTrue(!w.moved);
        assertTrue(Math.abs(w.sec - 218.142) <= beat / 2 + 1e-9);
        MixOverride.Resolved in = MixOverride.resolveWindow(o.in, down, beat);
        assertEquals(down + Math.round((0 - 0.02 - down) / beat) * beat + 0.02, in.sec, 1e-6);
        // no grid: at sec
        assertEquals(218.142, MixOverride.resolveWindow(o.out, Double.NaN, Double.NaN).sec, 1e-9);
        // a bar-only change line names the seconds
        MixOverride bar = MixOverride.fromJson(Json.parse("{\"bars\":4,\"window\":{\"out\":{\"bar\":84,\"sec\":218.1},\"in\":{\"bar\":0,\"sec\":0}}}"));
        assertTrue(MixFile.changes(bar, o).contains("mix-out: bar 84 → 218.142 s"));
        // a beat given without a bar is ignored (only with a bar)
        MixOverride b = MixOverride.fromJson(Json.parse("{\"bars\":4,\"window\":{\"out\":{\"beat\":2,\"sec\":10}}}"));
        assertEquals(0, b.out.beat);
        assertTrue(b.out.secOnly);
    }

    /**
     * Spotify mix exports (spotify-mixes.md) read as the PC reads them: every override, skip, queue
     * entry and note the same as automix.js readMixFile's, written by a node run of it beside each
     * export. AYHAM_SPOTIFY_DIR: the exports (D:\Programs\Projects\YT Clients\research\spotify-mixes);
     * AYHAM_SPOTIFY_PC_DIR: the PC's reading of each, by default its pc-readmixfile folder.
     */
    @Test
    @SuppressWarnings("unchecked")
    public void spotifyExportsReadAsThePcReadsThem() throws Exception {
        String dir = System.getenv("AYHAM_SPOTIFY_DIR"), pc = System.getenv("AYHAM_SPOTIFY_PC_DIR");
        Assume.assumeTrue("no Spotify exports here", dir != null && new File(dir).isDirectory());
        if (pc == null) pc = new File(dir, "pc-readmixfile").getPath();
        // mixes, queue, mixes with a Looping lane, mixes with a speed
        Map<String, int[]> want = new HashMap<>();
        want.put("budget-dj-mix.json", new int[]{133, 134, 7, 7});
        want.put("heavenly-transitions.json", new int[]{27, 28, 3, 0});
        want.put("dj-club-mixes.json", new int[]{96, 103, 11, 0});
        want.put("rap-mixes.json", new int[]{121, 126, 4, 0});
        // the four exports only: the folder holds other research beside them (spotify-analysis.json)
        File[] files = new File(dir).listFiles((x, n) -> want.containsKey(n));
        Assume.assumeTrue(files != null && files.length > 0);
        for (File f : files) {
            MixFile.Read r = MixFile.read(read(f));
            Map<String, Object> p = (Map<String, Object>) Json.parse(read(new File(pc, f.getName())));
            String name = f.getName();
            assertNull(name + ": " + r.refused, r.refused);
            assertNull(p.get("refused"));
            List<Object> mixes = (List<Object>) p.get("mixes");
            assertEquals(name, mixes.size(), r.mixes.size());
            int looping = 0, speeds = 0;
            for (int i = 0; i < mixes.size(); i++) {
                Map<String, Object> m = (Map<String, Object>) mixes.get(i);
                assertEquals(name + " #" + i, m.get("key"), r.mixes.get(i).key);
                Map<String, Object> ov = (Map<String, Object>) m.get("override");
                if (r.mixes.get(i).override.looping != null) looping++;
                if (r.mixes.get(i).override.hasSpeed()) speeds++;
                assertEquals(name + " " + m.get("key"), canon(ov), canon(r.mixes.get(i).override.toJson()));
            }
            List<String> skipped = new ArrayList<>();
            for (Object o : (List<Object>) p.get("skipped")) {
                Map<String, Object> k = (Map<String, Object>) o;
                skipped.add("mix " + ((Number) k.get("n")).intValue() + " skipped: " + k.get("why"));
            }
            assertEquals(name, skipped, r.skipped);
            assertEquals(name, p.get("queue"), r.queue);
            // the notes as the PC's (rule 9: the speeds play here too, so no x1 line)
            assertEquals(name, p.get("notes"), r.notes);
            if (want.containsKey(name)) {
                assertEquals(name, want.get(name)[0], r.mixes.size());
                assertEquals(name, want.get(name)[1], MixFile.playQueue(r).size());
                assertEquals(name, want.get(name)[2], looping);
                assertEquals(name, want.get(name)[3], speeds);
            }
        }
    }

    /** spotify-mixes.md rules 2, 3, 7: versions, a wrapped negative start, skips. */
    @Test
    public void spotifyExportRules() {
        String t1 = "{\"title\":\"One\",\"artists\":[\"X\",\"Y\"],\"youtubeVideoId\":\"" + A + "\"}";
        String t2 = "{\"title\":\"Two\",\"youtubeVideoId\":\"" + B + "\"}";
        String t3 = "{\"title\":\"Gone\"}";
        java.util.function.Function<String, String> exp = mixes -> "{\"format\":\"spotify-mix-export\",\"version\":3,\"playlist\":{\"name\":\"T\",\"tracks\":["
                + t1 + "," + t2 + "," + t2 + "," + t3 + "]},\"mixes\":[" + mixes + "]}";
        assertEquals("this Spotify mix file is version 2: it has no YouTube ids yet (version 3 has them)",
                MixFile.read(exp.apply("{}").replace("\"version\":3", "\"version\":2")).refused);
        assertEquals("this Spotify mix file is version 4, newer than this app reads (3): update the app to import it",
                MixFile.read(exp.apply("{}").replace("\"version\":3", "\"version\":4")).refused);
        MixFile.Read r = MixFile.read(exp.apply(
                "{\"index\":1,\"from\":" + t1 + ",\"to\":" + t2 + ",\"fromStartMs\":218142,\"toStartMs\":18446744073709549644,\"durationMs\":9919,\"bars\":4,\"fromBpm\":98,\"style\":{\"volume\":7,\"eq\":4,\"filter\":0}},"
                        + "{\"index\":2,\"from\":" + t2 + ",\"to\":" + t1 + ",\"durationMs\":1,\"style\":{}},"
                        + "{\"index\":3,\"from\":" + t2 + ",\"to\":" + t3 + ",\"fromStartMs\":1000,\"durationMs\":8000,\"style\":{}}"));
        assertNull(r.refused);
        assertEquals(2, r.mixes.size());
        // the straight cut: Spotify's No transition (rule 3)
        assertEquals("none", r.mixes.get(1).override.preset);
        assertTrue(r.mixes.get(1).override.noTransition());
        MixOverride o = r.mixes.get(0).override;
        assertEquals("X, Y", r.mixes.get(0).from.artist);
        assertEquals(4, o.bars);
        assertEquals(98, o.gridBpm, 1e-9);
        assertTrue(o.out.secOnly && o.in.secOnly);
        assertEquals(218.142, o.out.sec, 1e-9);
        // the wrapped negative start: B from 0, with the mix (too far off to read back)
        assertEquals(0, o.in.sec, 1e-9);
        assertEquals(0, o.in.delaySec, 0);
        assertEquals(Collections.singletonList("mix 3 skipped: no YouTube id for Gone"), r.skipped);
        // the unset lanes, by basePresetId (rule 4)
        assertEquals(Arrays.asList("fadeInCutOut", "endBassSwap", "hpHalfOut", "reverbOutEnd", "none"), Arrays.asList(SpotifyMixes.baseLanes(21)));
        assertEquals(Arrays.asList(MixOverride.lanesOf("melt")), Arrays.asList(SpotifyMixes.baseLanes(4)));
        assertEquals(Arrays.asList(MixOverride.lanesOf("wave")), Arrays.asList(SpotifyMixes.baseLanes(17)));
        assertEquals(Arrays.asList(MixOverride.lanesOf("afterglow")), Arrays.asList(SpotifyMixes.baseLanes(22)));
        assertEquals(Arrays.asList("fadeInCutOut", "centerBassSwap", "none", "none", "none"), Arrays.asList(SpotifyMixes.baseLanes(5.0)));
        assertEquals(Arrays.asList("overlap", "centerBassSwap", "hpBoth", "none", "none"), Arrays.asList(SpotifyMixes.baseLanes(10)));
        assertEquals(Arrays.asList("overlap", "centerBassSwap", "lpBoth", "none", "none"), Arrays.asList(SpotifyMixes.baseLanes(19)));
        assertEquals(Arrays.asList("overlap", "centerBassSwap", "none", "none", "none"), Arrays.asList(SpotifyMixes.baseLanes(18)));
        assertEquals(Arrays.asList("overlap", "centerBassSwap", "none", "none", "none"), Arrays.asList(SpotifyMixes.baseLanes(0)));
        assertEquals(Arrays.asList("overlap", "centerBassSwap", "none", "none", "none"), Arrays.asList(SpotifyMixes.baseLanes(null)));
        assertEquals("smooth", SpotifyMixes.baseLanes(1)[0]);
        // the playlist in order, the same song twice in a row once, a track with no id left out
        assertEquals(Arrays.asList(A, B), r.queue);
        assertEquals(Collections.singletonList("1 mix brings B in late in an older export's unsigned time: here B starts with the mix"), r.notes);
    }
}
