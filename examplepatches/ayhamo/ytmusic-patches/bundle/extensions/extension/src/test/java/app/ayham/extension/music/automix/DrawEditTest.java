package app.ayham.extension.music.automix;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** The drawing editor's rules (editor.md §10 rule 6, automix-overview.js), apart from the screen. */
public class DrawEditTest {
    private static double[][] pts(double... xv) {
        double[][] r = new double[xv.length / 2][];
        for (int i = 0; i < r.length; i++) r[i] = new double[]{xv[2 * i], xv[2 * i + 1]};
        return r;
    }

    private static void same(double[][] want, double[][] got) {
        assertEquals(want.length, got.length);
        for (int i = 0; i < want.length; i++) assertArrayEquals("point " + i, want[i], got[i], 1e-9);
    }

    @Test
    public void xSnapsToAQuarterBeatOrTenMs() {
        assertEquals(2.25, DrawEdit.snap(2.2, "beat", false), 0);
        assertEquals(2.5, DrawEdit.snap(2.4, "beat", false), 0);
        assertEquals(1.23, DrawEdit.snap(1.234, "sec", false), 0);
        assertEquals(2.2, DrawEdit.snap(2.2, "beat", true), 0);
        assertEquals(0, DrawEdit.snap(-1, "beat", false), 0);
    }

    @Test
    public void heightsAndValuesAsThePc() {
        assertEquals(1, DrawEdit.norm("bassDb", 0), 1e-9);
        assertEquals(0, DrawEdit.norm("bassDb", -18), 1e-9);
        assertEquals(-9, DrawEdit.value("highDb", 0.5), 1e-9);
        assertEquals(20000, DrawEdit.value("lowpassHz", 1), 0);
        assertEquals(20, DrawEdit.value("highpassHz", 1), 0);
        assertEquals(632, DrawEdit.value("lowpassHz", 0.5), 0);
        assertEquals(1, DrawEdit.value("gain", 1.4), 0);
        assertEquals(0.5, DrawEdit.norm("highpassHz", DrawEdit.value("highpassHz", 0.5)), 1e-3);
    }

    @Test
    public void drawStartsFromTheShapeWithTheOtherCurvesOpen() {
        MixOverride.Drawing shape = new MixOverride.Drawing("beat");
        shape.out.put("bass", pts(0, 0, 8, -18));
        MixOverride.Drawing d = DrawEdit.start(1, shape, "beat");
        same(pts(0, 0, 8, -18), DrawEdit.points(d, "bassDb", true));
        same(pts(0, 0), DrawEdit.points(d, "bassDb", false));
        same(pts(0, 0), DrawEdit.points(d, "highDb", true));
        assertEquals(1, shape.out.size()); // the shape itself unchanged
        MixOverride.Drawing fx = DrawEdit.start(2, "none", "sec");
        assertEquals("sec", fx.unit);
        same(pts(0, 20000), DrawEdit.points(fx, "lowpassHz", false));
        same(pts(0, 20), DrawEdit.points(fx, "highpassHz", true));
        // a volume lane gets no open point: its shape has both decks
        assertTrue(DrawEdit.start(0, null, "beat").out.isEmpty());
    }

    /** editor.md §12 rule 6: a drawing keeps the time it came with, through Draw… and every edit. */
    @Test
    public void anEffectsDrawingKeepsItsEchoAndDelayTime() {
        MixOverride.Drawing fx = new MixOverride.Drawing("beat");
        fx.out.put("echo", pts(0, 0, 8, 1));
        fx.echoBeats = 0.5;
        fx.delayBeats = 0.75;
        MixOverride.Drawing c = DrawEdit.copy(fx);
        assertEquals(0.5, c.echoBeats, 0);
        assertEquals(0.75, c.delayBeats, 0);
        MixOverride.Drawing started = DrawEdit.start(3, fx, "beat");
        assertEquals(0.5, started.echoBeats, 0);
        assertEquals(0.75, started.delayBeats, 0);
        MixOverride.Drawing edited = DrawEdit.withPoints(started, "echoSend", true, pts(0, 0, 4, 1));
        assertEquals(0.5, edited.echoBeats, 0);
        assertEquals(0.75, edited.delayBeats, 0);
    }

    @Test
    public void addingKeepsOrderStepsAndTheLimit() {
        DrawEdit.Edit e = DrawEdit.add(pts(0, 1, 8, 0), new double[]{4, 0.5});
        assertEquals(1, e.i);
        same(pts(0, 1, 4, 0.5, 8, 0), e.pts);
        // a second at one x is a step (after the first), a third is nothing
        e = DrawEdit.add(e.pts, new double[]{4, 0});
        assertEquals(2, e.i);
        same(pts(0, 1, 4, 0.5, 4, 0, 8, 0), e.pts);
        DrawEdit.Edit third = DrawEdit.add(e.pts, new double[]{4, 1});
        assertNull(third.pts);
        assertNull(third.refused);
        double[][] full = new double[128][];
        for (int i = 0; i < 128; i++) full[i] = new double[]{i, 1};
        DrawEdit.Edit over = DrawEdit.add(full, new double[]{200, 0});
        assertNull(over.pts);
        assertEquals("128 points is the most for one line", over.refused);
    }

    @Test
    public void aDraggedPointStaysBetweenItsNeighbours() {
        double[][] p = pts(0, 1, 4, 0.5, 8, 0);
        same(pts(0, 1, 8, 0.2, 8, 0), DrawEdit.move(p, 1, new double[]{11, 0.2}).pts);
        same(pts(0, 1, 0, 0.2, 8, 0), DrawEdit.move(p, 1, new double[]{-3, 0.2}).pts);
        // next to a step: 1 ms off it, never a third at one x
        double[][] s = pts(0, 1, 2, 1, 4, 1, 4, 0, 8, 0);
        same(pts(0, 1, 3.999, 0.3, 4, 1, 4, 0, 8, 0), DrawEdit.move(s, 1, new double[]{5, 0.3}).pts);
        same(pts(0, 1, 2, 1, 4, 1, 4, 0, 4.001, 0.3), DrawEdit.move(s, 4, new double[]{2, 0.3}).pts);
        // a step's own point dragged onto its pair stays a step
        same(pts(0, 1, 2, 1, 4, 0.3, 4, 0, 8, 0), DrawEdit.move(s, 2, new double[]{5, 0.3}).pts);
    }

    @Test
    public void aVolumeDeckKeepsItsLastPoint() {
        DrawEdit.Edit e = DrawEdit.delete("gain", pts(0, 1), 0);
        assertNull(e.pts);
        assertEquals("A volume line keeps at least one point", e.refused);
        same(pts(0, 1), DrawEdit.delete("gain", pts(0, 1, 4, 0), 1).pts);
        assertEquals(0, DrawEdit.delete("bassDb", pts(0, -3), 0).pts.length);
    }

    @Test
    public void repeatCopiesTheSpanAlongTheWindow() {
        MixOverride.Drawing d = new MixOverride.Drawing("beat");
        // a gate in beats 0-2, then a point past the window's end (16 beats)
        d.out.put("gain", pts(0, 1, 1, 1, 1, 0, 1.5, 0, 1.5, 1, 5, 0.4, 20, 0));
        d.in.put("gain", pts(0, 0, 16, 1));
        DrawEdit.Repeated r = DrawEdit.repeat(d, "gain", 0, 2, 16);
        assertNull(r.refused);
        double[][] out = DrawEdit.points(r.d, "gain", true);
        assertEquals(8 * 5 + 1, out.length);
        same(pts(1, 1, 1, 0, 1.5, 0, 1.5, 1, 2, 1), java.util.Arrays.copyOfRange(out, 1, 6));
        same(pts(14, 1, 15, 1, 15, 0, 15.5, 0, 15.5, 1, 20, 0), java.util.Arrays.copyOfRange(out, 35, 41));
        // B's point at 0 copied too, its point at 16 (the end) kept
        double[][] in = DrawEdit.points(r.d, "gain", false);
        assertEquals(9, in.length);
        same(pts(14, 0, 16, 1), java.util.Arrays.copyOfRange(in, 7, 9));
        // the drawing it came from unchanged
        assertEquals(7, DrawEdit.points(d, "gain", true).length);
    }

    @Test
    public void repeatIsRefusedPastTheLimit() {
        MixOverride.Drawing d = new MixOverride.Drawing("beat");
        d.out.put("gain", pts(0, 1, 0.25, 0, 0.5, 1, 0.75, 0));
        d.in.put("gain", pts(0, 0));
        DrawEdit.Repeated r = DrawEdit.repeat(d, "gain", 0, 1, 64);
        assertNull(r.d);
        assertEquals("128 points is the most for one line", r.refused);
        assertNull(DrawEdit.repeat(d, "gain", 0, 0, 64).d);
        assertNull(DrawEdit.repeat(d, "gain", 30, 2, 64).d); // nothing in the span
    }

    @Test
    public void aDrawingKeepsTheLengthShown() {
        assertEquals(8, DrawEdit.barsToSave(8, 4, "blend"));
        assertEquals(4, DrawEdit.barsToSave(0, 4, "blend"));
        assertEquals(0, DrawEdit.barsToSave(0, 6, "blend"));
        assertEquals(0, DrawEdit.barsToSave(0, 4, "crossfade"));
    }

    @Test
    public void undoGoesBackPerPairAndKeepsAHandPickedLength() {
        DrawEdit.Undo u = new DrawEdit.Undo();
        String[] smooth = MixOverride.lanesOf("smooth");
        MixOverride.Drawing d1 = DrawEdit.start(0, MixOverride.shapeDrawing("volume", "smooth", 8, 0.5, null, "beat"), "beat");
        assertNotNull(d1);
        u.push("a|b", null, 4);
        MixOverride first = DrawEdit.withDrawing(null, smooth, 0, d1, 4);
        assertEquals("custom", first.preset);
        assertEquals("draw", first.volume);
        assertEquals("centerBassSwap", first.eq);
        assertTrue(first.hasDrawing());
        MixOverride.Drawing d2 = DrawEdit.withPoints(d1, "gain", true, pts(0, 1, 8, 0));
        u.push("a|b", first, 4);
        MixOverride second = DrawEdit.withDrawing(first, first.lanes(), 0, d2, 4);
        assertFalse(first.drawn[0] == second.drawn[0]);
        // another pair's step is dropped on the way back
        u.push("c|d", null, 2);
        MixOverride back = u.undo("a|b", second);
        assertTrue(back.drawn[0] == d1);
        assertEquals(4, back.bars);
        // a length picked by hand since stays
        back.bars = 16;
        MixOverride auto = u.undo("a|b", back);
        assertNull(auto.preset);
        assertFalse(auto.hasDrawing());
        assertEquals(16, auto.bars);
        assertNull(u.undo("a|b", auto));
        assertFalse(u.has("c|d"));
    }

    @Test
    public void undoKeepsFiftySteps() {
        DrawEdit.Undo u = new DrawEdit.Undo();
        for (int i = 0; i < 60; i++) u.push("p", null, i);
        int n = 0;
        MixOverride o = new MixOverride();
        while ((o = u.undo("p", o)) != null) n++;
        assertEquals(50, n);
    }
}
