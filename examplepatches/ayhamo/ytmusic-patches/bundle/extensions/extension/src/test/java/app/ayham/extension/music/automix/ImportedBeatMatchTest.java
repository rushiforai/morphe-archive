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
    private static MixOverride roundTrip(MixOverride saved, double aBpm) {
        MixOverride o = MixFile.forExport(saved, aBpm);
        String file = MixFile.text(MixFile.write(java.util.Collections.singletonList(
                new MixFile.Mix(new MixFile.Song("rCwSRV7P6hY", null, null), new MixFile.Song("0X3Y2m9wj5c", null, null), o))));
        return MixFile.read(file).mixes.get(0).override;
    }

    /** Rule 8 (2026-11-27): a mix is written with its beat match as it plays, so the file's gridBpm doesn't turn Auto into Sync. */
    @Test
    public void anExportKeepsTheBeatMatchItPlaysWith() {
        // made here with Auto: the file carries A's tempo and "auto", and it comes back as Auto
        MixOverride own = MixOverride.fromJson(Json.parse("{\"v\":1,\"preset\":\"blend\",\"bars\":8}"));
        MixOverride back = roundTrip(own, 120);
        assertEquals(120, back.gridBpm, 0);
        assertEquals("auto", back.beatMatchOf());
        assertNull("the saved mix itself is left as it was", own.beatMatch);
        assertEquals(0, own.gridBpm, 0);
        // imported with none: written as "sync", still Sync
        MixOverride imported = MixOverride.fromJson(Json.parse("{\"v\":1,\"preset\":\"blend\",\"bars\":8,\"gridBpm\":98}"));
        assertEquals("sync", MixFile.forExport(imported, 120).beatMatch);
        assertEquals("sync", roundTrip(imported, 120).beatMatchOf());
        // A not analysed: no gridBpm to write, and Auto stays Auto
        MixOverride bare = roundTrip(own, Double.NaN);
        assertEquals(0, bare.gridBpm, 0);
        assertEquals("auto", bare.beatMatchOf());
        // a picked one is kept
        assertEquals("glide", roundTrip(MixOverride.fromJson(Json.parse("{\"v\":1,\"bars\":8,\"beatMatch\":\"glide\"}")), 120).beatMatchOf());
    }
    /** Rule 5 (2026-11-27): the beat match is compared as it plays, so a re-imported own export is the same as saved. */
    @Test
    public void aReimportedOwnExportIsTheSameAsSaved() {
        MixOverride own = MixOverride.fromJson(Json.parse("{\"v\":1,\"preset\":\"blend\",\"bars\":8}"));
        assertTrue("own Auto vs its own export", MixFile.same(own, roundTrip(own, 120)));
        MixOverride imported = MixOverride.fromJson(Json.parse("{\"v\":1,\"preset\":\"blend\",\"bars\":8,\"gridBpm\":98}"));
        assertTrue("imported vs its export (\"sync\")", MixFile.same(imported, roundTrip(imported, 120)));
        MixOverride synced = MixOverride.fromJson(Json.parse("{\"v\":1,\"preset\":\"blend\",\"bars\":8,\"beatMatch\":\"sync\"}"));
        assertTrue("own Auto vs a file with Sync", !MixFile.same(own, synced));
        assertTrue(String.valueOf(MixFile.changes(own, synced)), MixFile.changes(own, synced).contains("beat match: auto → sync"));
        // a loop mix has no beat match to compare
        MixOverride loop = MixOverride.fromJson(Json.parse("{\"v\":1,\"preset\":\"loop\"}"));
        assertTrue(MixFile.same(loop, roundTrip(loop, 120)));
    }
}
