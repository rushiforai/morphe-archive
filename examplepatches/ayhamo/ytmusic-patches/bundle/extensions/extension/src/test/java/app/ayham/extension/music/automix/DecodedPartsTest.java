package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

/** A placed window anywhere in a song reads its decoded audio (audit 2026-11-27 P1-2, editor.md §6). */
public class DecodedPartsTest {
    @Rule
    public TemporaryFolder tmp = new TemporaryFolder();

    /** A part of 10 frames a second whose left sample is its frame number / 32768. */
    private Analyzer.Pcm part(String name, long first, long count) throws IOException {
        File f = tmp.newFile(name);
        try (DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(f)))) {
            Analyzer.Pcm.writeHeader(out, 10, first);
            for (long k = first; k < first + count; k++) {
                out.writeShort(Short.reverseBytes((short) k));
                out.writeShort(Short.reverseBytes((short) -k));
            }
        }
        return Analyzer.Pcm.open(f);
    }

    @Test
    public void anOpeningAndAnEndThatMeetReadAsOneWithoutADoubledFrame() throws IOException {
        // a 25 s song: the opening holds 0-15 s, the end 12-25 s
        Analyzer.Pcm head = part("s.head", 0, 150), tail = part("s.tail", 120, 130);
        Analyzer.Pcm j = Analyzer.Pcm.joined(head, tail);
        assertNotNull(j);
        assertEquals(0, j.start(), 1e-9);
        assertEquals(25, j.end(), 1e-9);
        float[][] lr = j.read(10, 20);
        assertEquals(100, lr[0].length);
        for (int i = 0; i < 100; i++) {
            assertEquals((100 + i) / 32768f, lr[0][i], 1e-9);
            assertEquals(-(100 + i) / 32768f, lr[1][i], 1e-9);
        }
    }

    @Test
    public void partsWithAGapAreNotJoined() throws IOException {
        // a long song: the opening ends at 15 s, the end starts at 30 s
        Analyzer.Pcm head = part("l.head", 0, 150), tail = part("l.tail", 300, 100);
        assertNull(Analyzer.Pcm.joined(head, tail));
        // a window in the opening reads the opening; one in the end, the end; one in the gap: the preferred part
        assertSame(head, Analyzer.Pcm.covering(tail, head, head, tail, 2, 10));
        assertSame(tail, Analyzer.Pcm.covering(tail, head, head, tail, 31, 39));
        assertSame(tail, Analyzer.Pcm.covering(tail, head, head, tail, 18, 26));
    }

    private static Planner.Plan placed(double aDur, double bDur, double outSec, double inSec) {
        Analysis a = PlannerTest.song("a", 120, aDur, 0.9), b = PlannerTest.song("b", 120, bDur, 0.9);
        return Planner.plan(new Planner.Settings(), "a", "b", a, b, a.durationSec, 20, 24.5, null,
                MixOverride.fromJson(Json.parse("{\"v\":1,\"preset\":\"blend\",\"bars\":8,\"window\":{\"out\":{\"sec\":" + outSec
                        + "},\"in\":{\"sec\":" + inSec + "}}}")));
    }

    private static boolean warns(Planner.Plan p, String what) {
        if (p.warnings != null) for (String w : p.warnings) if (w.contains(what)) return true;
        return false;
    }

    @Test
    public void aWindowInASongUpToFourAndAHalfMinutesIsKept() {
        Planner.Plan p = placed(260, 260, 60, 100);
        assertTrue(String.valueOf(p.warnings), !warns(p, "kept decoded"));
    }

    @Test
    public void aWindowInTheMiddleOfALongSongSaysSo() {
        Planner.Plan p = placed(400, 200, 200, 10);
        assertTrue(String.valueOf(p.warnings), warns(p, "the mix-out at 3:20 is in the middle of a long song"));
        Planner.Plan q = placed(200, 400, 150, 200);
        assertTrue(String.valueOf(q.warnings), warns(q, "the mix-in at 3:20 is in the middle of a long song"));
    }

    @Test
    public void aWindowEndingAtTheNextSongsEndSaysSo() {
        // 8 bars of 2 s from 180 s of a 197 s song: 1 s left
        Planner.Plan p = placed(200, 197, 150, 180);
        assertTrue(String.valueOf(p.warnings), warns(p, "too close to hand it over"));
    }
}
