package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

/** The window's limits a drag stops at (editor.md §6, automix.js windowLimits). */
public class WindowLimitsTest {
    private static Planner.Plan blend() {
        Planner.Plan p = new Planner.Plan();
        p.style = "blend";
        p.beatSec = 0.5;
        p.bars = 4;          // 8 s of A
        p.rate = 1.1;
        p.outRate = 1;
        p.rampSongSec = 2;
        p.durationSec = 8;
        return p;
    }

    @Test
    public void aBlendsLimits() {
        double[] l = Planner.windowLimits(blend(), 200, 180, 50);
        assertEquals(52, l[0], 1e-9);              // earliest + the tempo ramp
        assertEquals(200 - 0.3 - 8, l[1], 1e-9);   // the window ends 0.3 s before A's real end
        assertEquals(0, l[2], 1e-9);
        assertEquals(180 - 0.3 - 8 * 1.1, l[3], 1e-9); // B's span at its rate, 0.3 s before its end
    }

    @Test
    public void aGlidesSpanOnB() {
        Planner.Plan p = blend();
        p.glide = new Planner.Glide(0.9, 16, 0.5);
        assertEquals(180 - 0.3 - 8 / 0.9, Planner.windowLimits(p, 200, 180, 0)[3], 1e-9);
    }

    @Test
    public void aCrossfadeEndsBeforeASEndLessItsLength() {
        Planner.Plan p = new Planner.Plan();
        p.style = "crossfade";
        p.durationSec = 12;
        double[] l = Planner.windowLimits(p, 200, 150, 30);
        assertEquals(30, l[0], 1e-9);              // no ramp outside a blend
        assertEquals(200 - 0.3 - 12, l[1], 1e-9);
        assertEquals(150 - 0.3 - 12, l[3], 1e-9);
    }

    @Test
    public void pastTheEarliestTheSongStaysAtIt() {
        // the earliest past where the window can end: held at the earliest, not inverted
        double[] l = Planner.windowLimits(blend(), 200, 180, 195);
        assertEquals(l[0], l[1], 1e-9);
    }

    private static Planner.Plan lushLife(String override) {
        // Lush Life's shape: its music ends at 183 s, the file at 200.6 s
        Analysis a = PlannerTest.song("a", 120, 200.6, 0.9), b = PlannerTest.song("b", 120, 180, 0.9);
        a.contentEndSec = 183;
        return Planner.plan(new Planner.Settings(), "a", "b", a, b, a.durationSec, 20, 24.5, null,
                MixOverride.fromJson(Json.parse(override)));
    }

    /** Ruled 2026-11-26 [all]: Spotify's Lush Life → Lean On mix-out at 176.4 s was moved to 163.4 s. */
    @Test
    public void aPlacedWindowRunsThroughAsFadingOutro() {
        // bar 88 of a 2 s bar from 0.5 s: 176.5 s, its 8 bars end at 192.5 s, past the music end
        Planner.Plan p = lushLife("{\"v\":1,\"preset\":\"blend\",\"bars\":8,\"window\":{\"out\":{\"bar\":88,\"sec\":176.5}}}");
        assertEquals(176.5, p.mixOutTrackTime, 1e-6);
        if (p.warnings != null) for (String w : p.warnings) assertTrue(w, !w.contains("end"));
        // with beat match Off too (the overlap)
        Planner.Plan q = lushLife("{\"v\":1,\"beatMatch\":\"off\",\"bars\":8,\"window\":{\"out\":{\"bar\":88,\"sec\":176.5}}}");
        assertEquals(176.5, q.mixOutTrackTime, 1e-6);
    }

    @Test
    public void pastASRealEndItStillMovesInside() {
        Planner.Plan r = lushLife("{\"v\":1,\"preset\":\"blend\",\"bars\":8,\"window\":{\"out\":{\"bar\":97,\"sec\":194.5}}}");
        assertTrue(r.mixOutTrackTime + 16 <= 200.6 - 0.3 + 1e-6);
        assertTrue(String.valueOf(r.mixOutTrackTime), r.mixOutTrackTime > 183 - 16);
    }

    private static Planner.Plan picked(double conf, String override) {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        Analysis a = PlannerTest.song("a", 120, 150, conf), b = PlannerTest.song("b", 120, 150, conf);
        return Planner.plan(s, "a", "b", a, b, a.durationSec, 20, 24.5, null, MixOverride.fromJson(Json.parse(override)));
    }

    /** Only Automix has rules (editor.md §6): a picked length isn't cut to a third of a song. */
    @Test
    public void aPickedLengthIsNotCutToAThirdOfASong() {
        // 32 bars of 2 s: 64 s, past a third of these 150 s songs (50 s)
        Planner.Plan p = picked(0.9, "{\"v\":1,\"preset\":\"blend\",\"bars\":32}");
        assertEquals(32, p.bars);
        if (p.warnings != null) for (String w : p.warnings) assertTrue(w, !w.contains("shortened") && !w.contains("not used"));
    }

    @Test
    public void aWeakGridKeepsAPickedLength() {
        // a grid under 0.45 cuts Automix's own blends to 4 bars; a length picked is kept and plays
        // without beat match there (editor.md §6, ruled 2026-11-26)
        Planner.Plan p = picked(0.3, "{\"v\":1,\"preset\":\"blend\",\"bars\":16}");
        assertEquals("crossfade", p.style);
        assertEquals(32, p.durationSec, 1e-6);   // 16 bars of 2 s
        assertTrue(String.valueOf(p.warnings), p.warnings != null && p.warnings.get(0).startsWith("the beat grid is too weak to beat-match 16 bars: plays without beat match"));
    }

    @Test
    public void loopDropsASavedBeatMatch() {
        Map<String, Object> j = new HashMap<>();
        j.put("v", 1);
        j.put("preset", "loop");
        j.put("beatMatch", "sync");
        MixOverride o = MixOverride.normalize(MixOverride.fromJson(j));
        assertNull(o == null ? null : o.beatMatch);
    }
}
