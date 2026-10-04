package app.hushtelegram.extension.shared.settings;

import app.hushtelegram.extension.shared.fuzz.BoundedJsonGrammar;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

/** The generated Java value tree is an independent oracle for escaped, reordered JSON text. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SettingsJsonPropertyTest {
    private static final SettingsJson.Limits LIMITS = new SettingsJson.Limits(8, 128, 1024, 256,
            BoundedJsonGrammar.MAX_BYTES);

    @Test public void nonJsonStringEscapesAndUnescapedControlsHaveCheckedRefusals() throws Exception {
        StringBuilder missed = new StringBuilder();
        String[] values = {"\\q", "\\v", "\\'", "\\u12xz", "\\u123", "line\nnext", "line\tend", "line\rend"};
        for (String value : values) {
            String input = "{\"bad\":\"" + value + "\"}";
            try {
                SettingsJson.parseObject(input, LIMITS);
                missed.append(" accepted ").append(input.replace("\n", "[LF]").replace("\r", "[CR]").replace("\t", "[TAB]"));
            } catch (IOException | JSONException expected) {
                // A malformed string always reaches the caller as a checked JSON refusal.
            } catch (RuntimeException escaped) {
                missed.append(" unchecked ").append(escaped.getClass().getSimpleName()).append(' ').append(input);
            }
        }
        assertEquals("", missed.toString());
    }

    @Test(timeout = 20_000) public void fixedGrammarTreesKeepEveryValueAndNumericPrecision() throws Exception {
        long started = System.nanoTime();
        for (long seed : BoundedJsonGrammar.seeds()) {
            Random random = new Random(seed);
            for (int sample = 0; sample < BoundedJsonGrammar.SAMPLES; sample++) {
                Map<String, Object> expected = BoundedJsonGrammar.object(random, sample);
                String text = BoundedJsonGrammar.render(expected, random);
                BoundedJsonGrammar.requireSize(text);
                assertEquals("The generator split a Unicode surrogate pair", text,
                        new String(text.getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8));
                requireTree(expected, SettingsJson.parseObject(text, LIMITS));
                requireTree(expected, SettingsJson.parseObject(text.getBytes(StandardCharsets.UTF_8), LIMITS));
                BoundedJsonGrammar.requireTime(started);
            }
        }
    }

    @Test(timeout = 20_000) public void mutationsRejectDuplicatesTruncationTrailingTokensAndBadEscapes() throws Exception {
        long started = System.nanoTime();
        for (long seed : BoundedJsonGrammar.seeds()) {
            Random random = new Random(seed);
            for (int sample = 0; sample < BoundedJsonGrammar.SAMPLES; sample++) {
                String good = BoundedJsonGrammar.render(BoundedJsonGrammar.object(random, sample), random);
                String duplicate = "{\"samp" + "\\u006c" + "e\":0," + good.substring(1);
                try {
                    SettingsJson.parseObject(duplicate, LIMITS);
                    fail("A generated escaped duplicate was accepted");
                } catch (SettingsJson.DuplicateNameException expected) {
                    assertEquals("sample", expected.name);
                }
                for (String bad : new String[]{good.substring(0, good.length() - 1), good + " true",
                        "{\"bad\":\"\\q\",\"nested\":" + good + "}", good + '\0'}) requireRejected(bad, LIMITS);
                byte[] bytes = good.getBytes(StandardCharsets.UTF_8);
                bytes[bytes.length - 1] = (byte) 0xC0;
                try {
                    SettingsJson.parseObject(bytes, LIMITS);
                    fail("Malformed generated UTF-8 was accepted");
                } catch (IOException expected) { assertTrue(expected.getMessage().contains("UTF-8")); }
                BoundedJsonGrammar.requireTime(started);
            }
        }
    }

    @Test(timeout = 20_000) public void randomizedCasesCrossEachIndependentParserLimit() throws Exception {
        long started = System.nanoTime();
        for (long seed : BoundedJsonGrammar.seeds()) {
            Random random = new Random(seed);
            for (int sample = 0; sample < BoundedJsonGrammar.SAMPLES; sample++) {
                String padding = BoundedJsonGrammar.space(random);
                requireRejected("{\"a\":" + padding + "[[0]]}", new SettingsJson.Limits(2, 128, 1024, 256, 8192));
                requireRejected("{\"a\":" + padding + "[0,0,0]}", new SettingsJson.Limits(8, 4, 1024, 256, 8192));
                requireRejected("{\"a\":" + padding + BoundedJsonGrammar.quote("1234567", random) + "}",
                        new SettingsJson.Limits(8, 128, 6, 256, 8192));
                requireRejected("{\"a\":" + padding + "[0,0,0]}", new SettingsJson.Limits(8, 128, 1024, 2, 8192));
                String bytes = "{\"a\":" + padding + "\"\u732b\u732b\u732b\"}";
                int length = bytes.getBytes(StandardCharsets.UTF_8).length;
                requireRejected(bytes, new SettingsJson.Limits(8, 128, 1024, 256, length - 1));
                requireTree(java.util.Collections.singletonMap("a", "\u732b\u732b\u732b"),
                        SettingsJson.parseObject(bytes, new SettingsJson.Limits(8, 128, 1024, 256, length)));
                BoundedJsonGrammar.requireTime(started);
            }
        }
    }

    private static void requireRejected(String text, SettingsJson.Limits limits) throws Exception {
        try {
            SettingsJson.parseObject(text, limits);
            fail("Generated invalid/over-budget JSON was accepted: " + text);
        } catch (IOException | JSONException expected) { /* The caller receives a checked refusal. */ }
    }

    private static void requireTree(Object expected, Object actual) throws Exception {
        if (expected instanceof Map) {
            assertTrue(actual instanceof JSONObject);
            JSONObject object = (JSONObject) actual;
            Map<?, ?> map = (Map<?, ?>) expected;
            Set<String> names = new HashSet<>();
            for (Iterator<String> iterator = object.keys(); iterator.hasNext();) names.add(iterator.next());
            assertEquals(map.keySet(), names);
            for (Map.Entry<?, ?> entry : map.entrySet()) requireTree(entry.getValue(), object.get((String) entry.getKey()));
        } else if (expected instanceof List) {
            assertTrue(actual instanceof JSONArray);
            List<?> list = (List<?>) expected;
            JSONArray array = (JSONArray) actual;
            assertEquals(list.size(), array.length());
            for (int i = 0; i < list.size(); i++) requireTree(list.get(i), array.get(i));
        } else if (expected instanceof Number) {
            assertEquals(expected.getClass(), actual.getClass());
            assertEquals(0, new BigDecimal(expected.toString()).compareTo(new BigDecimal(actual.toString())));
        } else assertEquals(expected == null ? JSONObject.NULL : expected, actual);
    }
}
