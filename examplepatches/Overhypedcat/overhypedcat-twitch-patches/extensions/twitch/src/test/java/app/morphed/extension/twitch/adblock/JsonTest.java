package app.morphed.extension.twitch.adblock;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class JsonTest {
    @Test
    public void quotesSpecialCharacters() {
        assertEquals("\"a\\\"b\\\\c\\n\"", Json.quote("a\"b\\c\n"));
    }

    @Test
    public void readsEscapedStringValues() {
        assertEquals("x\"yé", Json.stringValue("{\"k\" : \"x\\\"y\\u00e9\"}", "k", 0));
    }

    @Test
    public void searchesFromOffset() {
        String json = "{\"value\":\"first\",\"inner\":{\"value\":\"second\"}}";
        assertEquals("second", Json.stringValue(json, "value", json.indexOf("inner")));
    }

    @Test
    public void nonStringValueIsNull() {
        assertNull(Json.stringValue("{\"k\":null}", "k", 0));
        assertNull(Json.stringValue("{}", "k", 0));
    }
}
