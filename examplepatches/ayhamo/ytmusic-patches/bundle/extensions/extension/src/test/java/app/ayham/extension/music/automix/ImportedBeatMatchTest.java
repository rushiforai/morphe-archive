package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** An imported mix beat-matches as Sync (mix-file.md rule 6, ruled 2026-11-26 [all]). */
public class ImportedBeatMatchTest {
    /** A at 120 BPM, B at 131: 9% apart, past Automix v2's 8%. */
    private static Planner.Plan plan(String override) {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        Analysis a = PlannerTest.song("a", 120, 200, 0.9), b = PlannerTest.song("b", 131, 200, 0.9);
        return Planner.plan(s, "a", "b", a, b, a.durationSec, 20, 24.5, null, MixOverride.fromJson(Json.parse(override)));
    }

    private static boolean warns(Planner.Plan p, String what) {
        if (p.warnings != null) for (String w : p.warnings) if (w.contains(what)) return true;
        return false;
    }

    @Test
    public void anImportedMixBeatMatchesHoweverFarApart() {
        Planner.Plan p = plan("{\"v\":1,\"preset\":\"blend\",\"bars\":8,\"gridBpm\":120}");
        assertEquals("blend", p.style);
        assertTrue(String.valueOf(p.warnings), !warns(p, "apart"));
    }

    @Test
    public void aFilesOffStaysOff() {
        Planner.Plan p = plan("{\"v\":1,\"preset\":\"blend\",\"bars\":8,\"beatMatch\":\"off\",\"gridBpm\":120}");
        assertEquals("crossfade", p.style);
    }

    @Test
    public void autoPickedOnAnImportedMixGetsAutomixsLimit() {
        Planner.Plan p = plan("{\"v\":1,\"preset\":\"blend\",\"bars\":8,\"beatMatch\":\"auto\",\"gridBpm\":120}");
        assertTrue(String.valueOf(p.warnings), warns(p, "apart"));
    }

    @Test
    public void anEditorMixKeepsAutomixsLimit() {
        Planner.Plan p = plan("{\"v\":1,\"preset\":\"blend\",\"bars\":8}");
        assertTrue(String.valueOf(p.warnings), warns(p, "apart"));
    }

    @Test
    public void aLoopMixStaysAuto() {
        MixOverride o = MixOverride.fromJson(Json.parse("{\"v\":1,\"preset\":\"loop\",\"gridBpm\":120}"));
        assertEquals("auto", o.beatMatchOf());
    }

    @Test
    public void theNormalizerKeepsAutoOnlyOnAnImportedMix() {
        MixOverride kept = MixOverride.normalize(MixOverride.fromJson(Json.parse("{\"v\":1,\"bars\":8,\"beatMatch\":\"auto\",\"gridBpm\":120}")));
        assertEquals("auto", kept.beatMatch);
        assertEquals(120, kept.gridBpm, 1e-9);
        MixOverride dropped = MixOverride.normalize(MixOverride.fromJson(Json.parse("{\"v\":1,\"bars\":8,\"beatMatch\":\"auto\"}")));
        assertNull(dropped.beatMatch);
    }

    @Test
    public void anImportedMixReadsSyncInTheEditor() {
        assertEquals("sync", MixOverride.fromJson(Json.parse("{\"v\":1,\"bars\":8,\"gridBpm\":120}")).beatMatchOf());
        assertEquals("auto", MixOverride.fromJson(Json.parse("{\"v\":1,\"bars\":8}")).beatMatchOf());
    }
}
