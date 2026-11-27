package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;

/** The layer-1 checker of AnalysisCases on hand-made readings (the real analyser: AnalysisCasesRealTest). */
public class AnalysisCasesTest {
    private static final AnalysisCases.Rules RULES = AnalysisCases.rules();

    private static AnalysisCases.Case named(String name) {
        for (AnalysisCases.Case c : AnalysisCases.cases()) if (c.name.equals(name)) return c;
        throw new AssertionError("no case " + name);
    }

    /** A reading that is the truth itself, shifted by [shift] s, with every beat but those [drop] says. */
    private static Analysis truth(AnalysisCases.Case c, double shift, double bpm, int dropEvery) {
        List<AnalysisSignals.Beat> beats = AnalysisSignals.beatTimes(c.song);
        double[] t = new double[beats.size()];
        int n = 0;
        double first = Double.NaN;
        for (int i = 0; i < beats.size(); i++) {
            if (dropEvery > 0 && i % dropEvery == dropEvery - 1) continue;
            t[n++] = beats.get(i).t + shift;
            if (Double.isNaN(first) && beats.get(i).beatInBar == 0) first = beats.get(i).t + shift;
        }
        Analysis a = new Analysis();
        a.headBeats = new Analysis.BeatSide();
        a.headBeats.beats = java.util.Arrays.copyOf(t, n);
        a.bpm = bpm;
        a.firstDownbeatSec = first;
        a.vocals.add(vocalWindow(c, 0, 1));
        return a;
    }

    /** A vocal window over the whole song: [inVoice] inside the voice sections, [outside] elsewhere. */
    private static Analysis.VocalWindow vocalWindow(AnalysisCases.Case c, float outside, float inVoice) {
        Analysis.VocalWindow w = new Analysis.VocalWindow();
        w.startSec = 0;
        w.fps = 44100 / 1024.0;
        w.curve = new float[(int) (c.song.sec * w.fps)];
        for (int i = 0; i < w.curve.length; i++) {
            double t = i / w.fps;
            boolean in = false;
            for (double[] v : c.song.voice) in |= t >= v[0] && t < v[1];
            w.curve[i] = in ? inVoice : outside;
        }
        return w;
    }

    @Test
    public void theTruthPassesEveryCase() {
        List<AnalysisCases.Case> cases = AnalysisCases.cases();
        assertEquals(12, cases.size());
        for (AnalysisCases.Case c : cases) {
            AnalysisCases.Result r = AnalysisCases.check(c, truth(c, 0, c.song.parts.get(0)[1], 0), RULES);
            assertEquals(c.name + " checks", c.check.size(), r.verdicts.size());
            for (AnalysisCases.Verdict v : r.verdicts) assertTrue(r.toString(), v.ok);
        }
    }

    @Test
    public void tempoWithinHalfABpmPassesAndHalfOrDoubleFails() {
        AnalysisCases.Case c = named("drums-174");
        assertTrue(AnalysisCases.check(c, truth(c, 0, 174.4, 0), RULES).get("tempo").ok);
        assertFalse(AnalysisCases.check(c, truth(c, 0, 174.6, 0), RULES).get("tempo").ok);
        AnalysisCases.Verdict half = AnalysisCases.check(c, truth(c, 0, 87, 0), RULES).get("tempo");
        assertFalse(half.ok);
        assertTrue(half.text, half.text.contains("half-time"));
        AnalysisCases.Case slow = named("drums-80");
        AnalysisCases.Verdict dbl = AnalysisCases.check(slow, truth(slow, 0, 160, 0), RULES).get("tempo");
        assertFalse(dbl.ok);
        assertTrue(dbl.text, dbl.text.contains("double-time"));
        assertFalse(AnalysisCases.check(c, truth(c, 0, Double.NaN, 0), RULES).get("tempo").ok);
    }

    @Test
    public void beatsWithin25msOn95PercentPass() {
        AnalysisCases.Case c = named("click-120");
        assertEquals(0.025, RULES.beatSec, 0);
        assertTrue(AnalysisCases.check(c, truth(c, 0.024, 120, 0), RULES).get("beats").ok);
        assertFalse(AnalysisCases.check(c, truth(c, 0.026, 120, 0), RULES).get("beats").ok);
        // one beat in 25 missing: 96% found
        AnalysisCases.Verdict few = AnalysisCases.check(c, truth(c, 0, 120, 25), RULES).get("beats");
        assertTrue(few.text, few.ok);
        // one in 10 missing: 90%
        assertFalse(AnalysisCases.check(c, truth(c, 0, 120, 10), RULES).get("beats").ok);
        // no beats at all
        Analysis none = truth(c, 0, 120, 0);
        none.headBeats = null;
        assertEquals(0, AnalysisCases.check(c, none, RULES).get("beats").value, 0);
    }

    @Test
    public void beatsCountTheOpeningsAndTheEndsBeatsOnce() {
        Analysis a = new Analysis();
        a.headBeats = new Analysis.BeatSide();
        a.headBeats.beats = new double[]{0.5, 1.0, 1.50001};
        a.tailBeats = new Analysis.BeatSide();
        a.tailBeats.beats = new double[]{1.5, 2.0};
        assertEquals(4, AnalysisCases.beatsOf(a).length);
    }

    @Test
    public void aBarStartHalfABarOffFailsTheDownbeat() {
        AnalysisCases.Case c = named("drums-128-late-start");
        Analysis a = truth(c, 0, 128, 0);
        assertTrue(AnalysisCases.check(c, a, RULES).get("downbeat").ok);
        a.firstDownbeatSec += 2 * 60 / 128.0; // beat 3 taken for the bar's start
        AnalysisCases.Result r = AnalysisCases.check(c, a, RULES);
        assertFalse(r.get("downbeat").ok);
        assertEquals(0, r.get("downbeat").value, 0);
        assertTrue(r.failed());
        // the bar starts reach back before the first downbeat reported
        a.firstDownbeatSec = 1.25 + 8 * 60 / 128.0;
        assertTrue(AnalysisCases.check(c, a, RULES).get("downbeat").ok);
    }

    @Test
    public void aKnownMissPrintsKnownAndDoesNotFail() {
        // no synthetic case has a downbeat miss now (drums-85's went with it): one marked here
        AnalysisCases.Case slow = named("drums-80"), c = new AnalysisCases.Case();
        c.name = slow.name;
        c.song = slow.song;
        c.check.addAll(slow.check);
        c.knownMiss.put("downbeat", "marked for this test");
        assertNotNull(c.knownMiss.get("downbeat"));
        Analysis a = truth(c, 0, 80, 0);
        a.firstDownbeatSec += 2 * 60 / 80.0;
        AnalysisCases.Result r = AnalysisCases.check(c, a, RULES);
        AnalysisCases.Verdict v = r.get("downbeat");
        assertFalse(v.ok);
        assertEquals("KNOWN", v.label());
        assertFalse(r.failed());
        assertTrue(r.toString(), r.toString().startsWith("ok*"));
        // a known miss that is right here says so
        AnalysisCases.Verdict right = AnalysisCases.check(c, truth(c, 0, 80, 0), RULES).get("downbeat");
        assertTrue(right.ok);
        assertTrue(right.toString(), right.toString().contains("right here"));
        // a check without a known miss still fails
        a.bpm = 160;
        assertTrue(AnalysisCases.check(c, a, RULES).failed());
    }

    @Test
    public void vocalsNeedAnIoUOf80PercentAwayFromTheEdges() {
        AnalysisCases.Case c = named("voice-section");
        Analysis a = truth(c, 0, 120, 0);
        assertEquals(1, AnalysisCases.check(c, a, RULES).get("vocals").value, 0);
        // everything sung: the voice is 22.2 of 50 s, so IoU about 44%
        a.vocals.clear();
        a.vocals.add(vocalWindow(c, 0.3f, 0.9f));
        AnalysisCases.Verdict all = AnalysisCases.check(c, a, RULES).get("vocals");
        assertFalse(all.ok);
        assertEquals(0.44, all.value, 0.02);
        // just under VOCAL_SUNG outside the voice: not sung
        a.vocals.clear();
        a.vocals.add(vocalWindow(c, 0.249f, 0.25f));
        assertTrue(AnalysisCases.check(c, a, RULES).get("vocals").ok);
        // a curve 0.2 s late only differs at the edges, which aren't counted
        a.vocals.clear();
        Analysis.VocalWindow late = vocalWindow(c, 0, 1);
        late.startSec = 0.2;
        a.vocals.add(late);
        assertEquals(1, AnalysisCases.check(c, a, RULES).get("vocals").value, 0);
    }

    @Test
    public void noVoiceAndNothingSungIsPerfectButAnySungFrameIsAMiss() {
        AnalysisCases.Case c = named("no-voice");
        Analysis a = truth(c, 0, 128, 0);
        assertEquals(1, AnalysisCases.check(c, a, RULES).get("vocals").value, 0);
        a.vocals.get(0).curve[100] = 0.5f;
        AnalysisCases.Result r = AnalysisCases.check(c, a, RULES);
        assertEquals(0, r.get("vocals").value, 0);
        assertEquals("KNOWN", r.get("vocals").label());
        assertFalse(r.failed());
    }
}
