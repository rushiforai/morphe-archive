package app.wordfeudwordfinder.extension.play;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;
import org.junit.Test;

public class MessageCodecsTest {
    private static byte[] b(int... v) {
        byte[] out = new byte[v.length];
        for (int i = 0; i < v.length; i++) out[i] = (byte) v[i];
        return out;
    }

    @Test
    public void standardScalars() {
        assertArrayEquals(b(0x00), MessageCodecs.standard(null));
        assertArrayEquals(b(0x01), MessageCodecs.standard(Boolean.TRUE));
        assertArrayEquals(b(0x02), MessageCodecs.standard(Boolean.FALSE));
        // int32 and int64 little endian, like Flutter's StandardMessageCodec on Android
        assertArrayEquals(b(0x03, 0x01, 0x02, 0x00, 0x00), MessageCodecs.standard(Integer.valueOf(0x0201)));
        assertArrayEquals(b(0x03, 0xFF, 0xFF, 0xFF, 0xFF), MessageCodecs.standard(Integer.valueOf(-1)));
        assertArrayEquals(b(0x04, 0x08, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01),
                MessageCodecs.standard(Long.valueOf(0x0102030405060708L)));
        assertArrayEquals(b(0x07, 0x02, 'h', 'i'), MessageCodecs.standard("hi"));
        // UTF-8 byte length, not char count
        assertArrayEquals(b(0x07, 0x02, 0xC3, 0xA9), MessageCodecs.standard("é"));
    }

    @Test
    public void bannerShapeRoundTripsWithTheObservedDecoder() {
        // RouteTap's AdApi decoder: list (0x0C) of size 1 holding TRUE/FALSE. A pigeon call with one bool argument.
        assertArrayEquals(b(0x0C, 0x01, 0x01), MessageCodecs.standard(Collections.singletonList(Boolean.TRUE)));
        assertArrayEquals(b(0x0C, 0x01, 0x02), MessageCodecs.standard(Collections.singletonList(Boolean.FALSE)));
    }

    @Test
    public void standardMapsAndNestedLists() {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("a", null);
        m.put("b", Arrays.asList("x", Boolean.TRUE));
        assertArrayEquals(b(0x0D, 0x02, 0x07, 0x01, 'a', 0x00, 0x07, 0x01, 'b', 0x0C, 0x02, 0x07, 0x01, 'x', 0x01),
                MessageCodecs.standard(m));
    }

    @Test
    public void standardSizeEncoding() {
        // < 254: one byte; up to 0xFFFF: 254 + uint16 LE; larger: 255 + uint32 LE
        assertSizePrefix(253, b(0xFD));
        assertSizePrefix(254, b(0xFE, 0xFE, 0x00));
        assertSizePrefix(0xFFFF, b(0xFE, 0xFF, 0xFF));
        assertSizePrefix(0x10000, b(0xFF, 0x00, 0x00, 0x01, 0x00));
    }

    private static void assertSizePrefix(int n, byte[] prefix) {
        List<Object> list = new ArrayList<>(Collections.nCopies(n, (Object) null));
        byte[] out = MessageCodecs.standard(list);
        assertEquals(1 + prefix.length + n, out.length);
        assertEquals(0x0C, out[0]);
        assertArrayEquals(prefix, Arrays.copyOfRange(out, 1, 1 + prefix.length));
    }

    @Test
    public void standardRejectsUnsupportedTypes() {
        try {
            MessageCodecs.standard(Double.valueOf(1.5));
            fail();
        } catch (IllegalArgumentException expected) {
            // doubles need 8-byte alignment; not needed by any strategy
        }
    }

    @Test
    public void standardMethodCallIsMethodThenArguments() {
        // StandardMethodCodec.encodeMethodCall: writeValue(method), writeValue(arguments)
        assertArrayEquals(b(0x07, 0x01, 'm', 0x01), MessageCodecs.standardMethodCall("m", Boolean.TRUE));
        assertArrayEquals(b(0x07, 0x01, 'm', 0x00), MessageCodecs.standardMethodCall("m", null));
    }

    @Test
    public void jsonMethodCall() throws Exception {
        Map<String, Object> args = new LinkedHashMap<>();
        args.put("location", "/game/12");
        args.put("state", null);
        args.put("n", Long.valueOf(5));
        args.put("q", "a\"b\\c\n\u0001");
        byte[] out = MessageCodecs.jsonMethodCall("pushRouteInformation", args);
        String json = new String(out, StandardCharsets.UTF_8);
        assertEquals("{\"method\":\"pushRouteInformation\",\"args\":{\"location\":\"/game/12\",\"state\":null,"
                + "\"n\":5,\"q\":\"a\\\"b\\\\c\\n\\u0001\"}}", json);
        JSONObject o = new JSONObject(json); // parses as real JSON
        assertEquals("a\"b\\c\n\u0001", o.getJSONObject("args").getString("q"));
        assertEquals(true, o.getJSONObject("args").isNull("state"));
    }
}
