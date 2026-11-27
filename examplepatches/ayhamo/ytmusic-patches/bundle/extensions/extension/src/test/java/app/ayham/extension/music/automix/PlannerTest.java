package app.ayham.extension.music.automix;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class PlannerTest {
    static final double EARLIEST_LEAD = Mix.HAND_LEAD + 2.5; // as Automix plans

    /** A song with a steady grid from 0.5 s (the same at its end), no energy curve. */
    static Analysis song(String id, double bpm, double dur, double conf) {
        Analysis a = new Analysis();
        a.fileKey = id;
        a.durationSec = dur;
        a.bpm = bpm;
        a.beatIntervalSec = 60 / bpm;
        a.firstDownbeatSec = 0.5;
        a.gridConfidence = conf;
        a.tailGrid = new Analysis.LocalGrid();
        a.tailGrid.bpm = bpm;
        a.tailGrid.beatIntervalSec = 60 / bpm;
        a.tailGrid.firstDownbeatSec = 0.5;
        a.tailGrid.gridConfidence = conf;
        a.energy = 0.5;
        a.introEndSec = 8;
        return a;
    }

    static Planner.Plan plan(Planner.Settings s, Analysis from, Analysis to, double pos) {
        return Planner.plan(s, "a", "b", from, to, from == null ? 200 : from.durationSec, pos, pos + EARLIEST_LEAD, null);
    }

    /**
     * spotify-mixes.md rule 10: B stays at speedIn through the mix, so tempos too far apart at
     * playlist speeds get no echo out (a blend at x1); BitChord audit 1a #1.
     */
    @Test
    public void noEchoOutAtPlaylistSpeeds() {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        // a filter mix the last two times: the echo out is next in line
        Planner.forgetMoves();
        Planner.heard("filter");
        Planner.heard("filter");
        int echoes = 0;
        try {
            for (double bpm = 60; bpm <= 200; bpm += 3) {
                Analysis a = song("a", 124, 200, 0.9), b = song("b", bpm, 180, 0.9);
                Planner.Plan x1 = Planner.plan(s, "a", "b", a, b, 200, 60, 60 + EARLIEST_LEAD, null, null, 1, 1);
                if (!"echo".equals(x1.shape)) continue;
                echoes++;
                Planner.Plan sp = Planner.plan(s, "a", "b", a, b, 200, 60, 60 + EARLIEST_LEAD, null, null, 0.97, 1.03);
                assertFalse(bpm + " bpm: " + sp.reason, "echo".equals(sp.shape));
                if (!"blend".equals(sp.style)) assertEquals(1.03, sp.rate, 1e-9);
                // the hand-over says why (spotify-mixes.md rule 10's wording, as automix.js)
                if (sp.handoff) assertTrue(sp.reason, sp.reason.contains("and no filter mix (no echo out at a playlist speed) fits"));
            }
        } finally {
            Planner.forgetMoves();
        }
        assertTrue("an echo out to test against", echoes > 0);
    }

    @Test
    public void sameTempoBlendEndsOnTheBarGridBeforeTheEnd() {
        Planner.Plan p = plan(new Planner.Settings(), song("a", 120, 200, 0.9), song("b", 120, 180, 0.9), 60);
        assertEquals("blend", p.style);
        assertFalse(p.fallback);
        assertEquals(1, p.rate, 0);
        assertEquals(1, p.outRate, 0);
        assertEquals(0, p.rampBeats);
        // auto length: 16 beats capped at 12 s -> 4 bars of 2 s
        assertEquals(4, p.bars);
        assertEquals(8, p.durationSec, 1e-9);
        // the last downbeat that leaves a bar after the blend: 200 - 2 - 8 = 190 -> 188.5
        assertEquals(188.5, p.mixOutTrackTime, 1e-9);
        assertEquals(0, ((p.mixOutTrackTime - 0.5) / 2) % 1, 1e-9);
        assertTrue(p.mixOutTrackTime + p.durationSec <= 200 - 0.3);
        // the next song arrives so its first full-energy phrase (16.5 s) lands at the blend's end
        assertEquals(8.5, p.mixInTrackTime, 1e-9);
        assertEquals(Planner.SHORT_BLEND_KILL_DB, p.swapDb, 0);
    }

    @Test
    public void fixedBarsAreHonouredAndConfidenceLimitsThem() {
        Planner.Settings s = new Planner.Settings();
        s.bars = 16;
        Planner.Plan p = plan(s, song("a", 120, 200, 0.9), song("b", 120, 180, 0.9), 60);
        assertEquals(16, p.bars);
        assertEquals(Planner.KILL_DB, p.swapDb, 0);
        p = plan(s, song("a", 120, 200, 0.5), song("b", 120, 180, 0.9), 60);
        assertEquals(8, p.bars); // confidence 0.45-0.6: at most 8
        p = plan(s, song("a", 120, 200, 0.3), song("b", 120, 180, 0.9), 60);
        assertEquals(4, p.bars); // under 0.45: at most 4
    }

    @Test
    public void slowerNextSongSpeedsThePlayingSongUpOverARamp() {
        // 120 into 126: the playing song goes up 5% in 0.75% steps per beat
        Planner.Plan p = plan(new Planner.Settings(), song("a", 120, 200, 0.9), song("b", 126, 180, 0.9), 60);
        assertEquals("blend", p.style);
        assertEquals(1, p.rate, 0);
        assertEquals(1.05, p.outRate, 1e-9);
        assertEquals(7, p.rampBeats);
        assertEquals(7 * 0.5, p.rampSongSec, 1e-9);
        assertEquals(126, p.bpm, 1e-9);
    }

    @Test
    public void temposTooFarApartGiveAFilterMix() {
        Planner.Plan p = plan(new Planner.Settings(), song("a", 120, 200, 0.9), song("b", 90, 180, 0.9), 60);
        assertEquals("filter", p.style);
        assertTrue(p.reason, p.reason.contains("apart"));
        assertEquals(1, p.rate, 0);
        assertEquals(0.5, p.mixInTrackTime, 1e-9); // on its own first downbeat
    }

    @Test
    public void halfTimeFoldsBeforeStretching() {
        assertEquals(1.0, Planner.foldRate(2.0), 1e-12);
        assertEquals(1.0, Planner.foldRate(0.5), 1e-12);
        assertEquals(1.1, Planner.foldRate(1.1), 1e-12);
        assertTrue(Planner.stretchAllowed(1.25));
        assertFalse(Planner.stretchAllowed(1.26));
        assertTrue(Planner.stretchAllowed(0.9));
        assertFalse(Planner.stretchAllowed(0.89));
    }

    @Test
    public void unanalysedSongsFallBackToACrossfade() {
        Planner.Plan p = Planner.plan(new Planner.Settings(), "a", "b", null, null, 200, 60, 60 + EARLIEST_LEAD, null);
        assertEquals("crossfade", p.style);
        assertTrue(p.fallback);
        assertEquals(200 - 0.3 - Planner.FALLBACK_SEC, p.mixOutTrackTime, 1e-9);
        assertEquals(Planner.FALLBACK_SEC, p.durationSec, 1e-9);
    }

    @Test
    public void noGridAtTheEndFallsBack() {
        Analysis a = song("a", 120, 200, 0.9);
        a.tailGrid = null; // known: no beat at its end
        Planner.Plan p = plan(new Planner.Settings(), a, song("b", 120, 180, 0.9), 60);
        assertTrue(p.fallback);
        assertTrue(p.reason, p.reason.contains("end"));
    }

    @Test
    public void tooLateForABlendGivesShorterOrNoMix() {
        Planner.Plan p = plan(new Planner.Settings(), song("a", 120, 200, 0.9), song("b", 120, 180, 0.9), 195);
        assertTrue(p.style.equals("crossfade") || p.mixOutTrackTime + p.durationSec <= 200);
        assertTrue(p.durationSec >= 0);
    }

    @Test
    public void advancedAutoDjPlanIsMarkedAndBuildsAMix() {
        Planner.Settings s = new Planner.Settings();
        s.version = 2;
        Planner.Sung sung = new Planner.Sung();
        sung.out = new double[0][];
        sung.in = new double[0][];
        Planner.Plan p = Planner.plan(s, "a", "b", song("a", 120, 200, 0.9), song("b", 120, 180, 0.9), 200, 60, 60 + EARLIEST_LEAD, sung);
        assertEquals("blend", p.style);
        assertTrue(p.v2);
        assertEquals(0, p.clash, 0);
        Mix m = Mix.blend(p, "a", "b", 200);
        assertTrue(m.v2);
        assertEquals(1, m.out.gain.at(m.t0), 1e-3);
        assertEquals(1, m.in.gain.at(m.t0 + m.D + 0.01), 1e-9);
    }

    @Test
    public void keyClashRule() {
        Analysis a = new Analysis(), b = new Analysis();
        a.camelotNum = 8;
        a.camelotLetter = 'A';
        a.keyConfidence = 0.8;
        b.camelotNum = 9;
        b.camelotLetter = 'A';
        b.keyConfidence = 0.8;
        assertNull(Planner.keysClash(a, b)); // neighbours
        b.camelotNum = 7;
        assertNull(Planner.keysClash(a, b));
        b.camelotNum = 8;
        b.camelotLetter = 'B';
        assertNull(Planner.keysClash(a, b)); // relative major
        a.camelotNum = 12;
        a.camelotLetter = 'B';
        b.camelotNum = 1;
        assertNull(Planner.keysClash(a, b)); // 12 and 1 are neighbours on the wheel
        b.camelotNum = 3;
        assertNotNull(Planner.keysClash(a, b));
        b.keyConfidence = 0.4;
        assertNull(Planner.keysClash(a, b)); // a weak key never clashes
    }

    @Test
    public void vocalOverlapFromLyricSpans() {
        Analysis a = song("a", 120, 200, 0.9), b = song("b", 120, 180, 0.9);
        Planner.Sung sung = new Planner.Sung();
        sung.out = new double[][]{{0, 1000}};
        sung.in = new double[][]{{0, 1000}};
        assertEquals(1, Planner.vocalOverlap(a, b, 100, 8, 0, 1, sung), 1e-9);
        sung.in = new double[0][];
        assertEquals(0, Planner.vocalOverlap(a, b, 100, 8, 0, 1, sung), 1e-9);
        // neither lyrics nor a mask: unknown
        assertTrue(Double.isNaN(Planner.vocalOverlap(a, b, 100, 8, 0, 1, new Planner.Sung())));
    }

    /** The loop reads lines as the baseline does: padded -0.15 / +0.35 s, to the last word, its end, the next line, 10 s at most. */
    @Test
    public void theLoopReadsLyricLinesAsTheBaseline() {
        java.util.List<Planner.LineShape> l = java.util.Arrays.asList(
                new Planner.LineShape(10, Double.NaN, 3, new double[][]{{10.1, 10.5}, {10.6, 11.2}}),
                new Planner.LineShape(12, 13.5, 4, null),
                new Planner.LineShape(15, Double.NaN, 4, null),
                new Planner.LineShape(40, Double.NaN, 2, null));
        double[][] s = Planner.loopSpansFromLines(l);
        assertEquals(4, s.length);
        assertArrayEquals(new double[]{9.85, 11.55}, s[0], 1e-9);   // the last word's end
        assertArrayEquals(new double[]{11.85, 13.85}, s[1], 1e-9);  // its own end
        assertArrayEquals(new double[]{14.85, 25.35}, s[2], 1e-9);  // the next line, cut at 10 s
        assertArrayEquals(new double[]{39.85, 50.35}, s[3], 1e-9);  // the last line: 10 s
    }

    /** Credit and tag lines aren't sung: titles, artists, credits in several languages, symbols only. */
    @Test
    public void creditLinesAreKnown() {
        String title = "SI NO ES CONTIGO", artist = "Cris Mj";
        for (String t : new String[]{"作曲: Cristopher Andrés Álvarez Garcia", "作词 : Maksym Kondratenko", "作詞：someone", "编曲: x",
                "Letra: Juan", "Lyrics by Someone", "Written by A & B", "Prod. by Tainy", "Producer: X", "Composer - Y",
                "♪", "...", " ♫ ♪ ", "Cris Mj", "SI NO ES CONTIGO", "Cris MJ - Si No Es Contigo", "(Mixed by Z)"}) {
            assertTrue(t, Planner.creditLine(t, title, artist));
        }
        for (String t : new String[]{"Ey, ey", "Si no e' contigo, amor", "Yo no quiero a nadie má' (Má')", "Music is my life",
                "Written in the stars", "Producer of my dreams", "Letra de amor", "曲终人散"}) {
            assertFalse(t, Planner.creditLine(t, title, artist));
        }
    }

    /** versions.md "The loop mix's baseline" rule 6: every credit word, "prod. " alone, titles without accents. */
    @Test
    public void creditLinesFollowTheBaselineWords() {
        String title = "Música Ligera", artist = "Soda Stéreo";
        for (String t : new String[]{"母帶: x", "和聲：y", "錄音: z", "出品: a", "发行: b", "發行: c", "Música: d", "Compositores: e",
                "Autor: f", "Autores - g", "Lyric: h", "Writers: i", "Composition: j", "Arranger: k", "Mixing: l",
                "Engineered by m", "Prod. Metro Boomin", "PROD. Tainy", "Musica ligera", "soda stereo", "Soda Stereo - Musica Ligera"}) {
            assertTrue(t, Planner.creditLine(t, title, artist));
        }
        for (String t : new String[]{"Prod Metro", "Mixing it up tonight", "Autoridad: total", "Productor de sueños", "Música en la piel"}) {
            assertFalse(t, Planner.creditLine(t, title, artist));
        }
    }

    /** The loop leaves credit lines and lines before the song out, and a sung line never ends at a credit. */
    @Test
    public void theLoopLeavesCreditLinesOut() {
        java.util.List<Planner.LineShape> l = java.util.Arrays.asList(
                new Planner.LineShape(-1, Double.NaN, 2, null),               // a line before the song
                new Planner.LineShape(0, Double.NaN, 4, null, true),          // 作曲: ... at 0:00, no end
                new Planner.LineShape(14.41, Double.NaN, 2, null),            // a sung ad-lib
                new Planner.LineShape(18, Double.NaN, 3, null, true),         // a credit in between
                new Planner.LineShape(20.09, Double.NaN, 5, null));
        double[][] s = Planner.loopSpansFromLines(l);
        assertEquals(2, s.length);
        assertArrayEquals(new double[]{14.26, 20.44}, s[0], 1e-9);  // to the next sung line, past the credit
        assertArrayEquals(new double[]{19.94, 30.44}, s[1], 1e-9);
    }

    @Test
    public void maskStatsNeedsCoverage() {
        Analysis.VocalWindow w = new Analysis.VocalWindow();
        w.startSec = 10;
        w.fps = 10;
        w.curve = new float[100]; // 10 s to 20 s
        for (int i = 50; i < 60; i++) w.curve[i] = 1; // sung 15-16 s
        double[] m = Planner.maskStats(java.util.Collections.singletonList(w), 12, 18);
        assertNotNull(m);
        assertEquals(10 / 60.0, m[0], 1e-9);
        assertEquals(1.0, m[1], 1e-9);
        assertNull(Planner.maskStats(java.util.Collections.singletonList(w), 0, 12)); // covers 2 of 12 s
    }

    static Planner.Audio flat(double duration) {
        return new Planner.Audio() {
            @Override
            public double duration() {
                return duration;
            }

            @Override
            public double rms(double from, double to) {
                return 0.5;
            }
        };
    }

    static Planner.LoopPlan loopPlan() {
        Planner.Sung sung = new Planner.Sung();
        sung.out = new double[0][];
        sung.in = new double[0][];
        return Planner.planLoopMix(song("a", 120, 200, 0.9), flat(200), song("b", 120, 180, 0.9), flat(180), 100, sung);
    }

    @Test
    public void loopMixPicksTheLastCleanLoopOutAndTheFirstIn() {
        Planner.LoopPlan lp = loopPlan();
        assertNotNull(lp);
        assertNull(lp.none);
        assertEquals(190.5, lp.out.loopStart, 1e-9);
        assertEquals(198.5, lp.out.loopEnd, 1e-9);
        assertEquals(0.5, lp.in.loopStart, 1e-9);
        assertEquals(8.5, lp.in.loopEnd, 1e-9);
        assertEquals(1, lp.fold, 0);
        assertEquals(Planner.MIN_RAMP_BARS, lp.rampBars);
        assertEquals(8, lp.totalBars);
        assertEquals("lyrics", lp.out.checkedBy);
    }

    @Test
    public void loopMixSkipsSungBarsAndMusicVideos() {
        Planner.Sung sung = new Planner.Sung();
        sung.out = new double[][]{{186, 199}}; // the last loops are sung
        sung.in = new double[0][];
        Planner.LoopPlan lp = Planner.planLoopMix(song("a", 120, 200, 0.9), flat(200), song("b", 120, 180, 0.9), flat(180), 100, sung);
        assertNotNull(lp);
        assertTrue(lp.out.loopEnd <= 186);

        Analysis video = song("a", 120, 200, 0.9);
        video.musicVideo = true;
        assertNull(Planner.planLoopMix(video, flat(200), song("b", 120, 180, 0.9), flat(180), 100, sung));
    }

    @Test
    public void loopScheduleKeepsBeatsInOrder() {
        Planner.LoopPlan lp = loopPlan();
        Planner.LoopSchedule x = Planner.loopSchedule(lp, 0);
        assertEquals(32, x.beats);
        assertEquals(x.beats + x.settleBeats + 1, x.beatTimes.length);
        for (int k = 1; k < x.beatTimes.length; k++) assertTrue(x.beatTimes[k] > x.beatTimes[k - 1]);
        assertEquals(16, x.releaseAt, 1e-9); // 32 beats at 120 BPM
        assertEquals(20, x.elementAt, 1e-9);
        assertTrue(x.enterEnd < x.rampEnd && x.rampEnd <= x.releaseAt);
    }

    @Test
    public void tempoRampIsMonotonic() {
        double last = Planner.tempo(0, 16, 24, 120, 128);
        assertEquals(120, last, 0);
        for (int k = 1; k < 40; k++) {
            double t = Planner.tempo(k, 16, 24, 120, 128);
            assertTrue(t >= last);
            last = t;
        }
        assertEquals(128, last, 0);
    }
}
