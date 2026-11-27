package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;

import app.ayham.extension.music.automix.MixOverride;
import app.ayham.extension.music.automix.Overview;
import app.ayham.extension.music.automix.Planner;

import org.junit.Test;

/** MixOverview.windowWith (editor.md §6): a window edit of one side saves the other where the plan has it. */
public class WindowWithTest {
    private static Overview overview() {
        Overview s = new Overview();
        s.plan = new Planner.Plan();
        s.plan.mixOutTrackTime = 180.25;
        s.plan.mixInTrackTime = 12.5;
        s.outGrid = new double[]{0.5, 0.5}; // first downbeat, beat
        s.inGrid = new double[]{0.0, 0.48};
        return s;
    }

    @Test
    public void anOutEditSavesTheInWhereThePlanHasIt() {
        Overview s = overview();
        MixOverride o = new MixOverride();
        MixOverride.Position p = new MixOverride.Position(90, 0, 0, 178.5);
        MixOverview.windowWith(s, o, true, p);
        assertSame(p, o.out);
        assertNotNull(o.in);
        assertEquals(12.5, o.in.sec, 1e-9);
    }

    @Test
    public void anInEditSavesTheOutWhereThePlanHasIt() {
        Overview s = overview();
        MixOverride o = new MixOverride();
        MixOverride.Position p = new MixOverride.Position(4, 0, 0, 7.68);
        MixOverview.windowWith(s, o, false, p);
        assertSame(p, o.in);
        assertNotNull(o.out);
        assertEquals(180.25, o.out.sec, 1e-9);
    }

    @Test
    public void aSavedOtherSideStays() {
        Overview s = overview();
        MixOverride o = new MixOverride();
        MixOverride.Position in = new MixOverride.Position(2, 1, 0, 4.32);
        o.in = in;
        MixOverview.windowWith(s, o, true, new MixOverride.Position(90, 0, 0, 178.5));
        assertSame(in, o.in);
    }

    @Test
    public void withoutAGridTheSecondsAreKept() {
        Overview s = overview();
        s.inGrid = null;
        MixOverride o = new MixOverride();
        MixOverview.windowWith(s, o, true, new MixOverride.Position(90, 0, 0, 178.5));
        assertEquals(12.5, o.in.sec, 1e-9);
    }
}
