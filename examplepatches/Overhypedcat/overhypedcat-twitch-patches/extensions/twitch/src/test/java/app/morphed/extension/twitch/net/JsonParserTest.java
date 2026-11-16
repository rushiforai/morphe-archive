package app.morphed.extension.twitch.net;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class JsonParserTest {
    @Test
    public void readsNestedValues() {
        Object root = JsonParser.parse("{\"a\":[1, 2.5, -3e2, true, false, null, \"x\\\"y\\u00e9\\n\"], \"b\":{\"c\":\"d\"}}");
        assertEquals(2.5, (Double) JsonParser.at(root, "a", 1), 0);
        assertEquals(-300.0, (Double) JsonParser.at(root, "a", 2), 0);
        assertEquals(Boolean.TRUE, JsonParser.at(root, "a", 3));
        assertNull(JsonParser.at(root, "a", 5));
        assertEquals("x\"yé\n", JsonParser.string(root, "a", 6));
        assertEquals("d", JsonParser.string(root, "b", "c"));
        assertNull(JsonParser.string(root, "b", "missing"));
        assertNull(JsonParser.at(root, "a", 99));
    }

    @Test
    public void collectsKeysAnywhere() {
        Object root = JsonParser.parse("{\"x\":{\"id\":1},\"y\":[{\"id\":2},{\"z\":{\"id\":3}}]}");
        List<Object> ids = new ArrayList<>();
        JsonParser.collect(root, "id", ids);
        assertEquals(Arrays.asList(1.0, 2.0, 3.0), ids);
    }

    @Test
    public void quotesStrings() {
        assertEquals("\"a\\\"b\\\\c\\n\\u0001\"", JsonParser.quote("a\"b\\c\n\u0001"));
        assertEquals("a\"b\\c\n\u0001", JsonParser.parse(JsonParser.quote("a\"b\\c\n\u0001")));
    }

    @Test(expected = IllegalArgumentException.class)
    public void refusesBrokenText() {
        JsonParser.parse("{\"a\":}");
    }
}
