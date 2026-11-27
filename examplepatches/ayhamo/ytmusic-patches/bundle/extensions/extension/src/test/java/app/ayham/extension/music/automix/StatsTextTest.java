package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/** The stats-for-nerds Automix line, in BitChord's wording (CrossfadeController describeAutomix). */
public class StatsTextTest {

    private static Planner.LoopSide side(int bars, double bpm, String by) {
        Planner.LoopSide s = new Planner.LoopSide();
        s.bars = bars;
        s.bpm = bpm;
        s.checkedBy = by;
        return s;
    }

    private static Planner.LoopPlan loop(double outBpm, double inBpm, double fold, int ramp) {
        Planner.LoopPlan p = new Planner.LoopPlan();
        p.out = side(8, outBpm, "lyrics");
        p.in = side(4, inBpm, "mask");
        p.fold = fold;
        p.rampBars = ramp;
        return p;
    }

    @Test
    public void loopWithATempoRamp() {
        assertEquals("out 8-bar, clear by lyrics · in 4-bar, clear by mask · 94 → 100 BPM over 3 bars",
                Automix.describeLoop(loop(94.2, 100.1, 1, 3)));
    }

    @Test
    public void loopAtTheSameTempoAndInDoubleTime() {
        assertEquals("out 8-bar, clear by lyrics · in 4-bar, clear by mask · 120 BPM",
                Automix.describeLoop(loop(120, 120.3, 1, 2)));
        assertEquals("out 8-bar, clear by lyrics · in 4-bar, clear by mask · 85 BPM (next in double time)",
                Automix.describeLoop(loop(85, 170, 2, 2)));
    }

    private static Planner.Plan plan(String style, int bars, double seconds, double rate) {
        Planner.Plan p = new Planner.Plan();
        p.style = style;
        p.bars = bars;
        p.durationSec = seconds;
        p.rate = rate;
        return p;
    }

    @Test
    public void plannedMixes() {
        assertEquals("mixing in 13 s · 8 bars · next at 1.034×", Automix.describePlan(plan("blend", 8, 16, 1.0341), 12.2, null));
        assertEquals("mixing now · 16 bars · same tempo", Automix.describePlan(plan("blend", 16, 30, 1.0002), 0, null));
        Planner.Plan f = plan("filter", 4, 9.6, 1);
        f.reason = "keys clash";
        assertEquals("filter mix in 5 s · 4 bars · keys clash · no loop: no instrumental bars",
                Automix.describePlan(f, 4.5, "no instrumental bars"));
        assertEquals("crossfading now · 12 s", Automix.describePlan(plan("crossfade", 0, 12, 1), 0, null));
    }
}
