package dev.srwi.gintype.extension.customholdpopups;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.junit.Test;

public class GboardCustomHoldPopupsSettingsTest {

    @Test
    public void testNormalizeBaseKeyIsLanguageIndependent() {
        assertEquals("a", GboardCustomHoldPopupsSettings.normalizeBaseKey("A"));
        assertEquals("a", GboardCustomHoldPopupsSettings.normalizeBaseKey(" a "));
        assertEquals("ä", GboardCustomHoldPopupsSettings.normalizeBaseKey("Ä"));
        assertEquals(".", GboardCustomHoldPopupsSettings.normalizeBaseKey("."));
        assertEquals("1", GboardCustomHoldPopupsSettings.normalizeBaseKey("1"));
        assertEquals("", GboardCustomHoldPopupsSettings.normalizeBaseKey("   "));
        assertEquals("", GboardCustomHoldPopupsSettings.normalizeBaseKey(null));
    }

    @Test
    public void testShiftCaseHandlingForSingleLetterAndSnippets() {
        assertTrue(GboardCustomHoldPopupsSettings.isShiftedKeyLabel("A", "a"));
        assertFalse(GboardCustomHoldPopupsSettings.isShiftedKeyLabel("a", "a"));
        assertFalse(GboardCustomHoldPopupsSettings.isShiftedKeyLabel("1", "1"));

        assertEquals("Ä", GboardCustomHoldPopupsSettings.applyShiftCaseIfSingleLetter("ä", true));
        assertEquals("ä", GboardCustomHoldPopupsSettings.applyShiftCaseIfSingleLetter("ä", false));
        // Multi-character snippets and emojis remain verbatim even when Shift is active
        assertEquals("¯\\_(ツ)_/¯",
                GboardCustomHoldPopupsSettings.applyShiftCaseIfSingleLetter("¯\\_(ツ)_/¯", true));
        assertEquals("🚀",
                GboardCustomHoldPopupsSettings.applyShiftCaseIfSingleLetter("🚀", true));
    }

    @Test
    public void testSanitizeSymbolRejectsEmptyAndPencilSentinel() {
        assertEquals("", GboardCustomHoldPopupsSettings.sanitizeSymbol(null));
        assertEquals("", GboardCustomHoldPopupsSettings.sanitizeSymbol("   "));
        assertEquals("", GboardCustomHoldPopupsSettings.sanitizeSymbol("\u270E"));
        assertEquals("€", GboardCustomHoldPopupsSettings.sanitizeSymbol("€"));
        assertEquals("hello world", GboardCustomHoldPopupsSettings.sanitizeSymbol("hello\n world"));
    }

    @Test
    public void testSerializeAndParseRulesJsonRoundTrip() {
        Map<String, String> aMod = new LinkedHashMap<String, String>();
        aMod.put("ä", "æ");
        aMod.put("á", "α");
        List<String> aAdd = Arrays.asList("@", "🚀", "mail@example.com");

        Map<String, GboardCustomHoldPopupsSettings.KeyHoldRules> rules =
                new LinkedHashMap<String, GboardCustomHoldPopupsSettings.KeyHoldRules>();
        rules.put("a", new GboardCustomHoldPopupsSettings.KeyHoldRules("a", aMod, aAdd));
        rules.put(".", new GboardCustomHoldPopupsSettings.KeyHoldRules(
                ".",
                Collections.emptyMap(),
                Collections.singletonList("…")));

        String json = GboardCustomHoldPopupsSettings.serializeRulesJson(rules);
        Map<String, GboardCustomHoldPopupsSettings.KeyHoldRules> parsed =
                GboardCustomHoldPopupsSettings.parseRulesJson(json);

        assertEquals(2, parsed.size());
        GboardCustomHoldPopupsSettings.KeyHoldRules parsedA = parsed.get("a");
        assertNotNull(parsedA);
        assertEquals("æ", parsedA.modifiedDefaults.get("ä"));
        assertEquals("α", parsedA.modifiedDefaults.get("á"));
        assertEquals(Arrays.asList("@", "🚀", "mail@example.com"), parsedA.addedSymbols);

        GboardCustomHoldPopupsSettings.KeyHoldRules parsedDot = parsed.get(".");
        assertNotNull(parsedDot);
        assertTrue(parsedDot.modifiedDefaults.isEmpty());
        assertEquals(Collections.singletonList("…"), parsedDot.addedSymbols);
    }

    @Test
    public void testEligibleBaseKeyFilterExcludesFunctionKeysAndIncludesNormalKeys() {
        // Normal letters, digits, punctuation, and symbols are eligible
        assertTrue(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("a", -10043)); // ALPHABET
        assertTrue(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("Z", -10043)); // ALPHABET
        assertTrue(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("ä", -10009)); // PLAIN_TEXT
        assertTrue(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("5", '5'));
        assertTrue(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString(".", 56));     // PERIOD
        assertTrue(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString(",", 55));     // COMMA
        assertTrue(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("?", -10009));
        assertTrue(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("@", -10009));
        assertTrue(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("€", -10027)); // SHORT_TEXT

        // Function and special keys are excluded
        assertFalse(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString(" ", 62));     // Spacebar
        assertFalse(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("a", 67));     // Backspace keyCode
        assertFalse(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("a", 66));     // Enter keyCode
        assertFalse(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("a", 59));     // Shift keyCode
        assertFalse(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("?123", -10009)); // Multi-char label
        assertFalse(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("a", -10000)); // SWITCH_LANGUAGE
        assertFalse(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("a", -10127)); // Negative IME action
        assertFalse(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString("", 'a'));
        assertFalse(GboardCustomHoldPopupsRuntime.isEligibleBaseKeyString(null, 'a'));
    }

    @Test
    public void testHoldDurationClamp() {
        assertEquals(1000, GboardCustomHoldPopupsSettings.clamp(
                500,
                GboardCustomHoldPopupsSettings.MIN_HOLD_DURATION_MS,
                GboardCustomHoldPopupsSettings.MAX_HOLD_DURATION_MS));
        assertEquals(2000, GboardCustomHoldPopupsSettings.clamp(
                2000,
                GboardCustomHoldPopupsSettings.MIN_HOLD_DURATION_MS,
                GboardCustomHoldPopupsSettings.MAX_HOLD_DURATION_MS));
        assertEquals(4000, GboardCustomHoldPopupsSettings.clamp(
                5500,
                GboardCustomHoldPopupsSettings.MIN_HOLD_DURATION_MS,
                GboardCustomHoldPopupsSettings.MAX_HOLD_DURATION_MS));
    }
}
