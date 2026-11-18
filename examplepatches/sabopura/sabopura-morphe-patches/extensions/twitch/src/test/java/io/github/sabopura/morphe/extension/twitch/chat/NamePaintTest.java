package io.github.sabopura.morphe.extension.twitch.chat;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;

import static org.junit.Assert.*;

public class NamePaintTest {
    private static final int RED = 0xFF0000FF, BLUE = 0x0000FFFF, WHITE = -1;
    private static final float NEAR = 1e-3f;

    private static String stops(Object... atAndColour) {
        StringBuilder out = new StringBuilder("[");
        for (int i = 0; i < atAndColour.length; i += 2)
            out.append(i == 0 ? "" : ",").append("{\"at\":").append(atAndColour[i]).append(",\"color\":")
                    .append(atAndColour[i + 1]).append('}');
        return out.append(']').toString();
    }

    private static NamePaint paint(String fields) {
        try {
            return NamePaint.parse(new JSONObject("{\"id\":\"p1\",\"name\":\"Test\",\"color\":null," + fields + "}"));
        } catch (JSONException failure) {
            throw new AssertionError(failure);
        }
    }

    private static NamePaint linear(int angle, boolean repeat, String stops) {
        return paint("\"function\":\"LINEAR_GRADIENT\",\"angle\":" + angle + ",\"repeat\":" + repeat + ",\"stops\":" + stops);
    }

    private static NamePaint radial(String shape, boolean repeat, String stops) {
        return paint("\"function\":\"RADIAL_GRADIENT\",\"shape\":\"" + shape + "\",\"repeat\":" + repeat + ",\"stops\":" + stops);
    }

    @Test public void coloursAreRgbaWithTheAlphaLast() {
        assertEquals(0xFFD2D2D2, NamePaint.argb(-757935361));
        assertEquals(0x66000000, NamePaint.argb(102));
        assertEquals(0xFFFF0000, NamePaint.argb(RED));
        NamePaint paint = linear(90, false, stops(0, RED, 1, BLUE));
        assertArrayEquals(new int[] {0xFFFF0000, 0xFF0000FF}, paint.colors);
    }

    @Test public void aLinearGradientCrossesTheBoxAtItsCssAngle() {
        String ends = stops(0, RED, 1, BLUE);
        assertArrayEquals(new float[] {0, 10, 100, 10}, linear(90, false, ends).line(100, 20), NEAR);
        assertArrayEquals(new float[] {50, 20, 50, 0}, linear(0, false, ends).line(100, 20), NEAR);
        assertArrayEquals(new float[] {50, 0, 50, 20}, linear(180, false, ends).line(100, 20), NEAR);
        assertArrayEquals(new float[] {100, 10, 0, 10}, linear(270, false, ends).line(100, 20), NEAR);
        assertArrayEquals(new float[] {50, 20, 50, 0}, linear(360, false, ends).line(100, 20), NEAR);
        // 45 degrees points at the top right corner and reaches from corner to corner.
        assertArrayEquals(new float[] {0, 10, 10, 0}, linear(45, false, ends).line(10, 10), NEAR);
    }

    @Test public void theGradientLineIsDrawnBetweenTheFirstAndTheLastStop() {
        NamePaint paint = linear(90, false, stops(0.25, RED, 0.5, WHITE, 0.75, BLUE));
        assertArrayEquals(new float[] {25, 10, 75, 10}, paint.line(100, 20), NEAR);
        assertArrayEquals(new float[] {0, .5f, 1}, paint.positions, NEAR);
        assertFalse(paint.repeat);
    }

    @Test public void aRepeatingGradientRepeatsTheStretchItsStopsCover() {
        NamePaint candy = linear(90, true, stops(0.1, RED, 0.2, RED, 0.2, BLUE, 0.3, BLUE));
        assertTrue(candy.repeat);
        assertArrayEquals(new float[] {10, 10, 30, 10}, candy.line(100, 20), NEAR);
        assertArrayEquals(new float[] {0, .5f, .5f, 1}, candy.positions, NEAR);
    }

    @Test public void aStopBeforeItsPredecessorIsMovedUpToIt() {
        NamePaint paint = linear(90, false, stops(0, RED, 0.5, WHITE, 0.2, BLUE, 1, RED));
        assertArrayEquals(new float[] {0, .5f, .5f, 1}, paint.positions, NEAR);
    }

    @Test public void stopsAtOnePlaceAreAHardEdgeThere() {
        NamePaint heart = linear(270, true, stops(0.5, RED, 0.5, WHITE));
        assertFalse("nothing to repeat", heart.repeat);
        float[] line = heart.line(100, 20);
        assertEquals(50, line[0], NEAR);
        assertTrue("the last colour begins just past the middle, to the left", line[2] < 50 && line[2] > 49);
        assertArrayEquals(new int[] {0xFFFF0000, 0xFFFFFFFF, 0xFFFFFFFF}, heart.colors);
        assertArrayEquals(new float[] {0, 0, 1}, heart.positions, NEAR);
    }

    @Test public void aRadialGradientReachesTheFarthestCorner() {
        assertEquals(50, radial("circle", false, stops(0, RED, 1, BLUE)).radius(60, 80), NEAR);
        assertEquals(100 / Math.sqrt(2), radial("ellipse", false, stops(0, RED, 1, BLUE)).radius(100, 20), NEAR);
        assertTrue(radial("ellipse", false, stops(0, RED, 1, BLUE)).ellipse);
        assertFalse(radial("circle", false, stops(0, RED, 1, BLUE)).ellipse);
    }

    @Test public void aRadialGradientKeepsItsFirstColourFromTheCentreToTheFirstStop() {
        NamePaint ice = radial("circle", false, stops(0.2, RED, 0.4, WHITE, 0.8, BLUE));
        assertEquals(40, ice.radius(60, 80), NEAR);
        assertArrayEquals(new float[] {0, .25f, .5f, 1}, ice.positions, NEAR);
        assertArrayEquals(new int[] {0xFFFF0000, 0xFFFF0000, 0xFFFFFFFF, 0xFF0000FF}, ice.colors);
    }

    @Test public void aRepeatingRadialGradientBeginsPartWayIntoItsPattern() {
        // CSS repeats red at 25% to blue at 75% both ways, so the centre is half way from red to blue.
        NamePaint rings = radial("circle", true, stops(0.25, RED, 0.75, BLUE));
        assertTrue(rings.repeat);
        assertEquals(25, rings.radius(60, 80), NEAR);
        assertArrayEquals(new float[] {0, .5f, .5f, 1}, rings.positions, NEAR);
        assertArrayEquals(new int[] {0xFF800080, 0xFF0000FF, 0xFFFF0000, 0xFF800080}, rings.colors);

        NamePaint fromCentre = radial("circle", true, stops(0, RED, 0.5, BLUE));
        assertEquals(25, fromCentre.radius(60, 80), NEAR);
        assertArrayEquals(new float[] {0, 1}, fromCentre.positions, NEAR);
    }

    @Test public void theTurnedStopsOfARepeatingRadialGradientNeverGoBackwards() {
        // The stops of the published paint "Bismuth", whose seam rounds to either side of one place.
        NamePaint bismuth = radial("circle", true,
                stops(0.15, RED, 0.32, BLUE, 0.49, WHITE, 0.58, RED, 0.79, BLUE, 0.82, WHITE));
        assertEquals(8, bismuth.positions.length);
        assertEquals(0, bismuth.positions[0], 0);
        assertEquals(1, bismuth.positions[7], 0);
        for (int i = 1; i < bismuth.positions.length; i++)
            assertTrue("stop " + i, bismuth.positions[i] >= bismuth.positions[i - 1]);
        // The pattern's end meets its beginning where the centre's share of a period is used up.
        assertEquals(0.15f / 0.67f, bismuth.positions[2], NEAR);
        assertEquals(0xFFFFFFFF, bismuth.colors[2]);
        assertEquals(0xFFFF0000, bismuth.colors[3]);
    }

    @Test public void onlyAGradientWithoutTransparencyHidesTheNameColour() {
        assertTrue(linear(90, false, stops(0, RED, 1, BLUE)).opaque());
        assertFalse(linear(90, false, stops(0, RED, 1, 0x0000FF80)).opaque());
        assertFalse(paint("\"function\":\"URL\",\"image_url\":\"https://cdn.7tv.app/paint/p1/layer/l1/1x.webp\"").opaque());
    }

    @Test public void aPaintOfOneColourOrOfShadowsAloneIsSolid() throws Exception {
        NamePaint colour = NamePaint.parse(new JSONObject().put("function", "LINEAR_GRADIENT").put("color", RED));
        assertEquals(NamePaint.SOLID, colour.function);
        assertEquals(0xFFFF0000, colour.base);

        NamePaint outline = paint("\"function\":\"LINEAR_GRADIENT\",\"stops\":[],"
                + "\"shadows\":[{\"x_offset\":1,\"y_offset\":0,\"radius\":0,\"color\":255}]");
        assertEquals(NamePaint.SOLID, outline.function);
        assertEquals("the chatter's own colour", 0, outline.base);

        assertNull(paint("\"function\":\"LINEAR_GRADIENT\",\"stops\":[],\"shadows\":[]"));
    }

    @Test public void anUnknownFunctionFallsBackToTheNameColour() {
        assertNull(paint("\"function\":\"CONIC_GRADIENT\",\"stops\":" + stops(0, RED, 1, BLUE)));
        assertNull(paint("\"stops\":" + stops(0, RED, 1, BLUE)));
    }

    @Test public void anImageComesOnlyFrom7tvsOwnHost() {
        NamePaint image = paint("\"function\":\"URL\",\"image_url\":\"https://cdn.7tv.app/paint/p1/layer/l1/1x.webp\"");
        assertEquals(NamePaint.IMAGE, image.function);
        assertEquals("https://cdn.7tv.app/paint/p1/layer/l1/1x.webp", image.image);
        assertEquals("https://cdn.7tv.app/paint/p1/1x.webp",
                paint("\"function\":\"URL\",\"image_url\":\"//cdn.7tv.app/paint/p1/1x.webp\"").image);
        assertNull(paint("\"function\":\"URL\",\"image_url\":\"https://evil.example/1x.webp\""));
        assertNull(paint("\"function\":\"URL\",\"image_url\":\"http://cdn.7tv.app/paint/p1/1x.webp\""));
    }

    @Test public void shadowsKeepTheirOrderAndInvisibleOnesAreLeftOut() {
        NamePaint paint = linear(90, false, stops(0, RED, 1, BLUE) + ",\"shadows\":["
                + "{\"x_offset\":-1,\"y_offset\":0.5,\"radius\":0.7,\"color\":102},"
                + "{\"x_offset\":3,\"y_offset\":3,\"radius\":2,\"color\":-256},"
                + "{\"x_offset\":0,\"y_offset\":0,\"radius\":0,\"color\":255},"
                + "{\"x_offset\":0,\"y_offset\":2,\"radius\":40,\"color\":-1}]");
        assertArrayEquals(new float[] {-1, .5f, .7f, 0, 2, 8}, paint.shadows, NEAR);
        assertArrayEquals(new int[] {0x66000000, 0xFFFFFFFF}, paint.shadowColors);
    }

    @Test public void noMoreThanFourShadowsAreDrawn() {
        StringBuilder shadows = new StringBuilder();
        for (int i = 1; i <= 6; i++)
            shadows.append(i == 1 ? "" : ",").append("{\"x_offset\":").append(i).append(",\"y_offset\":0,\"radius\":1,\"color\":255}");
        NamePaint paint = linear(90, false, stops(0, RED, 1, BLUE) + ",\"shadows\":[" + shadows + "]");
        assertEquals(4, paint.shadowColors.length);
        assertEquals(4, paint.shadows[9], NEAR);
    }

    @Test public void aPaintIsTheSameOnlyWhileItsLookIs() {
        NamePaint paint = linear(90, false, stops(0, RED, 1, BLUE));
        assertTrue(paint.same(linear(90, false, stops(0, RED, 1, BLUE))));
        assertFalse(paint.same(linear(91, false, stops(0, RED, 1, BLUE))));
        assertFalse(paint.same(linear(90, false, stops(0, RED, 1, WHITE))));
        assertFalse(paint.same(radial("circle", false, stops(0, RED, 1, BLUE))));
    }

    @Test public void theNameIsTheFirstTextColouredAndBoldFromOnePlace() {
        // A timestamp is coloured but not bold; a mention in the message is bold but comes later.
        assertEquals(1, NamePaint.nameSpan(new int[] {0, 6, 20}, new int[] {6, 20}));
        assertEquals(2, NamePaint.nameSpan(new int[] {30, 12, 3}, new int[] {-1, 3, 12}));
        assertEquals(-1, NamePaint.nameSpan(new int[] {0, 6}, new int[] {4}));
        assertEquals(-1, NamePaint.nameSpan(new int[] {0, 6}, new int[0]));
        assertEquals(-1, NamePaint.nameSpan(new int[0], new int[] {0}));
    }
}
