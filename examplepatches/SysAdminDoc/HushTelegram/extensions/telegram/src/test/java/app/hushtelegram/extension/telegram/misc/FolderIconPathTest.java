/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;

public class FolderIconPathTest {
    /** Records each drawing call as text. */
    private static final class Log implements FolderIconPath.Sink {
        final List<String> calls = new ArrayList<>();
        float minX = Float.MAX_VALUE;
        float minY = Float.MAX_VALUE;
        float maxX = -Float.MAX_VALUE;
        float maxY = -Float.MAX_VALUE;

        private void see(float x, float y) {
            minX = Math.min(minX, x);
            minY = Math.min(minY, y);
            maxX = Math.max(maxX, x);
            maxY = Math.max(maxY, y);
        }

        @Override public void moveTo(float x, float y) { calls.add("M" + x + "," + y); see(x, y); }
        @Override public void lineTo(float x, float y) { calls.add("L" + x + "," + y); see(x, y); }
        @Override public void cubicTo(float a, float b, float c, float d, float x, float y) { calls.add("C" + x + "," + y); see(x, y); }
        @Override public void close() { calls.add("Z"); }
    }

    private static Log parse(String data) {
        Log log = new Log();
        FolderIconPath.parse(data, log);
        return log;
    }

    @Test public void absoluteAndRelativeLinesLandOnTheSamePoints() {
        assertEquals(parse("M10,10L20,10L20,20Z").calls, parse("m10 10l10 0l0 10z").calls);
        assertEquals(parse("M10,10L20,10L20,20Z").calls, parse("M10 10H20V20Z").calls);
    }

    @Test public void morePairsAfterAMoveAreLines() {
        assertEquals(Arrays.asList("M1.0,2.0", "L3.0,4.0", "L5.0,6.0"), parse("M1,2 3,4 5,6").calls);
    }

    @Test public void numbersRunTogetherTheWayIconSetsWriteThem() {
        assertEquals(Arrays.asList("M1.5,-2.5", "L0.5,0.25"), parse("M1.5-2.5L.5.25").calls);
    }

    @Test public void anArcBecomesCubicsEndingOnItsPoint() {
        Log half = parse("M0,0A10,10,0,0,1,20,0");
        assertEquals("M0.0,0.0", half.calls.get(0));
        assertEquals("a half turn is two quarter curves", 3, half.calls.size());
        assertEquals("C20.0,0.0", half.calls.get(2));
        // The sweep flag picks the side: sweep 1 from (0,0) to (20,0) bulges up (negative y) in SVG's y-down space.
        assertTrue(half.minY < -9f);
        Log other = parse("M0,0A10,10,0,0,0,20,0");
        assertTrue(other.maxY > 9f);
    }

    @Test public void arcFlagsMayRunIntoTheNumberAfterThem() {
        assertEquals(parse("M0,0a5,5,0,0,1,10,0").calls, parse("M0,0a5 5 0 0110 0").calls);
    }

    @Test public void aTooSmallArcRadiusIsScaledUp() {
        Log log = parse("M0,0A1,1,0,0,1,20,0");
        assertEquals("C20.0,0.0", log.calls.get(log.calls.size() - 1));
    }

    @Test public void smoothCurvesMirrorTheLastControlPoint() {
        Log log = parse("M0,0C0,10,10,10,10,0S20,-10,20,0");
        assertEquals(Arrays.asList("M0.0,0.0", "C10.0,0.0", "C20.0,0.0"), log.calls);
    }

    @Test public void badDataIsRefused() {
        for (String bad : new String[] {"", "L1,1", "M1,2Q3,4,5,6", "M1", "M1,2 L", "M0,0A1,1,0,2,1,5,5", "1,2"}) {
            try {
                parse(bad);
                fail("accepted: " + bad);
            } catch (IllegalArgumentException expected) {
                assertTrue(expected.getMessage() != null);
            }
        }
    }

    @Test public void everyIconOfEveryPackParsesAndStaysInsideItsDrawing() {
        assertEquals(FolderIconData.NAMES.length, FolderIconData.REGULAR.length);
        assertEquals(FolderIconData.NAMES.length, FolderIconData.BOLD.length);
        assertEquals(FolderIconData.NAMES.length, FolderIconData.FILL.length);
        for (String[] pack : new String[][] {FolderIconData.REGULAR, FolderIconData.BOLD, FolderIconData.FILL}) {
            for (int i = 0; i < pack.length; i++) {
                Log log = parse(pack[i]);
                String why = FolderIconData.NAMES[i];
                assertTrue(why, log.calls.size() > 4);
                // Curve endpoints and corners sit inside the 256 unit drawing.
                assertTrue(why, log.minX >= -8f && log.minY >= -8f && log.maxX <= 264f && log.maxY <= 264f);
                // And an icon fills most of its box rather than a corner of it.
                assertTrue(why, log.maxX - log.minX > 120f && log.maxY - log.minY > 100f);
            }
        }
    }
}
