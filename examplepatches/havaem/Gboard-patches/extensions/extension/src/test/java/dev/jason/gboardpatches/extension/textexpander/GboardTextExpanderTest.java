package dev.jason.gboardpatches.extension.textexpander;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.LinkedHashMap;
import java.util.Map;

import org.junit.Test;

public final class GboardTextExpanderTest {
    private static final GboardTextExpander.Variables VARIABLES = new GboardTextExpander.Variables() {
        @Override public String date() { return "27/11/2026"; }
        @Override public String time() { return "09:30"; }
        @Override public String clipboard() { return "copied"; }
    };

    @Test
    public void trailingTokenIsTheWordBeforeTheCursor() {
        assertEquals(";addr", GboardTextExpander.trailingToken("Ship to ;addr"));
        assertEquals("brb", GboardTextExpander.trailingToken("brb"));
        assertNull(GboardTextExpander.trailingToken("ends with space "));
        assertNull(GboardTextExpander.trailingToken(""));
        assertNull(GboardTextExpander.trailingToken(null));
    }

    @Test
    public void expandReplacesVariablesAndFindsTheCursor() {
        GboardTextExpander.Expansion plain =
                GboardTextExpander.expand("Today {date} {time}: {clipboard}", VARIABLES);
        assertEquals("Today 27/11/2026 09:30: copied", plain.text);
        assertEquals(-1, plain.cursor);

        GboardTextExpander.Expansion cursor = GboardTextExpander.expand("<b>{cursor}</b>", VARIABLES);
        assertEquals("<b></b>", cursor.text);
        assertEquals(3, cursor.cursor);
    }

    @Test
    public void unusedVariablesAreNeverRead() {
        GboardTextExpander.Variables failing = new GboardTextExpander.Variables() {
            @Override public String date() { throw new AssertionError(); }
            @Override public String time() { throw new AssertionError(); }
            @Override public String clipboard() { throw new AssertionError(); }
        };
        assertEquals("plain", GboardTextExpander.expand("plain", failing).text);
    }

    @Test
    public void shortcutsRoundTripWithEscapedCharacters() {
        Map<String, String> shortcuts = new LinkedHashMap<>();
        shortcuts.put(";addr", "12 Main St\tUnit 3\nCity \\ State");
        shortcuts.put("brb", "be right back");
        Map<String, String> decoded = GboardTextExpander.decode(GboardTextExpander.encode(shortcuts));
        assertEquals(shortcuts, decoded);
        assertEquals(";addr", decoded.keySet().iterator().next());
    }

    @Test
    public void decodeSkipsMalformedLinesAndInvalidShortcuts() {
        Map<String, String> decoded = GboardTextExpander.decode("no tab\n\tempty key\nok\tfine\n");
        assertEquals(1, decoded.size());
        assertEquals("fine", decoded.get("ok"));
    }

    @Test
    public void shortcutMustBeOneShortWord() {
        assertTrue(GboardTextExpander.validShortcut(";addr"));
        assertFalse(GboardTextExpander.validShortcut("two words"));
        assertFalse(GboardTextExpander.validShortcut(""));
        assertFalse(GboardTextExpander.validShortcut("x".repeat(33)));
    }
}
