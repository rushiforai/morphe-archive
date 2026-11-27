package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * analysis-cases.md "The curator blend [all]" (479a97ec), the PC's test_automix_plan.mjs case: Auto's
 * blend on Automix v2 sits 8 bars on the downbeat nearest 31 s before the end; key, length and
 * asked-for fallbacks.
 */
public class CuratorTest {
    private static Analysis keyed(Analysis a, String key, double conf) {
        a.keyName = key;
        a.keyConfidence = conf;
        return a;
    }

    private static Analysis cur() {
        return keyed(PlannerTest.song("a", 120, 200, 0.9), "C major", 0.9);
    }

    private static Analysis next(String key, double conf, double intro) {
        Analysis b = keyed(PlannerTest.song("b", 120, 200, 0.9), key, conf);
        b.introEndSec = intro;
        return b;
    }

    private static Planner.Plan ask(Analysis c, Analysis n, boolean curator, MixOverride ov) {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        return Planner.plan(s, "a", "b", c, n, c.durationSec, 20, 24.5, null, ov, 1, 1, curator);
    }

    @Test
    public void theCuratorBlendSitsEightBars31SecondsBeforeTheEnd() {
        Planner.Plan p = ask(cur(), next("C major", 0.9, 40), true, null);
        assertTrue(p.curator);
        assertEquals("blend", p.style);
        assertEquals(8, p.bars);
        assertEquals(168.5, p.mixOutTrackTime, 1e-6);   // 169 s, the nearest downbeat (0.5 + 2 s bars)
        assertEquals(32.5, p.mixInTrackTime, 1e-6);     // the phrase at 48.5 s less 16 s
    }

    @Test
    public void notAskedForItIsTheUsualBlend() {
        assertFalse(ask(cur(), next("C major", 0.9, 40), false, null).curator);
    }

    @Test
    public void itFallsBackToTheUsualBlendExactly() {
        // keys untrusted, keys clashing, a song under 2 min, no intro in the next song
        assertFalse(ask(cur(), next("C major", 0.3, 40), true, null).curator);
        assertFalse(ask(cur(), next("F# major", 0.9, 40), true, null).curator);
        assertFalse(ask(keyed(PlannerTest.song("a", 120, 110, 0.9), "C major", 0.9), next("C major", 0.9, 40), true, null).curator);
        assertFalse(ask(cur(), next("C major", 0.9, 0), true, null).curator);
        // a length asked for wins
        MixOverride ov = MixOverride.fromJson(Json.parse("{\"v\":1,\"bars\":4}"));
        assertFalse(ask(cur(), next("C major", 0.9, 40), true, ov).curator);
        // the fallback is the usual blend exactly
        assertEquals(ask(cur(), next("F# major", 0.9, 40), true, null).toString(), ask(cur(), next("F# major", 0.9, 40), false, null).toString());
        assertEquals(ask(cur(), next("F# major", 0.9, 40), true, null).mixOutTrackTime, ask(cur(), next("F# major", 0.9, 40), false, null).mixOutTrackTime, 0);
    }
}
