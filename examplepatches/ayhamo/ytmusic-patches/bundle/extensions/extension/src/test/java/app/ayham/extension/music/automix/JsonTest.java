package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

public class JsonTest {

    @Test
    public void parsesNestedValues() {
        Object v = Json.parse(" { \"a\" : [1, 2.5, -3e2, true, false, null], \"b\": {\"c\": \"x\\\"y\\\\z\\n\\u00e9\"}, \"e\": {}, \"f\": [] } ");
        @SuppressWarnings("unchecked") Map<String, Object> m = (Map<String, Object>) v;
        List<?> a = (List<?>) m.get("a");
        assertEquals(Arrays.asList(1.0, 2.5, -300.0, true, false, null), a);
        @SuppressWarnings("unchecked") Map<String, Object> b = (Map<String, Object>) m.get("b");
        assertEquals("x\"y\\z\né", b.get("c"));
        assertTrue(((Map<?, ?>) m.get("e")).isEmpty());
        assertTrue(((List<?>) m.get("f")).isEmpty());
    }

    @Test
    public void writesWholeNumbersWithoutFraction() {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("i", 3.0);
        m.put("d", 0.25);
        m.put("n", Double.NaN);
        m.put("inf", Double.POSITIVE_INFINITY);
        m.put("s", "q\"\\\n\u0001");
        m.put("arr", new double[]{1, 1.5});
        assertEquals("{\"i\":3,\"d\":0.25,\"n\":null,\"inf\":null,\"s\":\"q\\\"\\\\\\n\\u0001\",\"arr\":[1,1.5]}", Json.write(m));
    }

    @Test
    public void roundTripsStrings() {
        String s = "tab\there \u0001 é \"quoted\" back\\slash";
        assertEquals(s, Json.parse(Json.write(s)));
    }

    @Test
    public void floatArrayNaNIsWrittenAsNullAndReadsBack() {
        // A NaN in the vocal curve used to be written as "NaN", which made the saved analysis unreadable.
        String text = Json.write(new float[]{0.5f, Float.NaN, Float.POSITIVE_INFINITY, 0.12345f});
        assertEquals("[0.5000,null,null,0.1235]", text);
        float[] back = Json.floats(Json.parse(text));
        assertEquals(4, back.length);
        assertEquals(0.5f, back[0], 1e-6);
        assertEquals(0f, back[1], 0);
        assertEquals(0f, back[2], 0);
        assertEquals(0.1235f, back[3], 1e-6);
    }

    @Test(expected = IllegalArgumentException.class)
    public void trailingTextIsRejected() {
        Json.parse("{} x");
    }

    @Test
    public void readingHelpers() {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("x", 2.0);
        m.put("s", "no");
        assertEquals(2.0, Json.num(m, "x"), 0);
        assertTrue(Double.isNaN(Json.num(m, "s")));
        assertTrue(Double.isNaN(Json.num(m, "missing")));
        assertNull(Json.nums("not a list"));
        double[] d = Json.nums(Arrays.asList(1.0, null, 3.0));
        assertEquals(1.0, d[0], 0);
        assertTrue(Double.isNaN(d[1]));
        assertEquals(0, Json.floats(null).length);
    }
}
