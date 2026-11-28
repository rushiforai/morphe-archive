package app.yydarlinker.aicaptions;

import static org.junit.Assert.*;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 35})
public class CaptionUnicodeContractTest {
    @Test public void capturedClustersKeepBoundariesAndReadingAndLineWidths() throws Exception {
        JSONObject contract;
        try (InputStream in = getClass().getResourceAsStream("/n28a/unicode-contract.json")) {
            assertNotNull(in);
            contract = new JSONObject(new String(in.readAllBytes(), StandardCharsets.UTF_8));
        }
        assertEquals(contract.getString("counter_version"), CaptionUnicode.COUNTER_VERSION);
        assertEquals(contract.getString("boundary_version"), CaptionUnicode.BOUNDARY_VERSION);
        CaptionLanguageProfile english = CaptionLanguageProfile.fromCode("en");
        JSONArray cases = contract.getJSONArray("cases");
        assertTrue(cases.length() > 0);
        for (int row = 0; row < cases.length(); row++) {
            JSONObject test = cases.getJSONObject(row);
            String text = test.getString("text"), id = test.getString("id");
            JSONArray boundaries = test.getJSONArray("boundaries");
            int[] expected = new int[boundaries.length()];
            for (int offset = 0; offset < expected.length; offset++) {
                expected[offset] = boundaries.getInt(offset);
            }
            assertArrayEquals(id, expected, CaptionUnicode.characterBoundaries(text, Locale.ENGLISH));
            assertEquals(id, test.getInt("reading"), CaptionUnicode.readingUnits(text, english));
            assertEquals(id, test.getInt("halves"), CaptionUnicode.lineHalfUnits(text, english));
            for (int cut : CaptionUnicode.lineBoundaries(text, Locale.ENGLISH)) {
                assertTrue(id + " split a grapheme at " + cut, Arrays.binarySearch(expected, cut) >= 0);
            }
        }
    }

    @Test public void lineBreaksKeepNonbreakingSpaceAndIndicClustersIntact() {
        assertArrayEquals(new int[]{0, 3}, CaptionUnicode.lineBoundaries("a\u00a0b", Locale.ENGLISH));
        assertArrayEquals(new int[]{0, 3, 4}, CaptionUnicode.lineBoundaries("a\r\nb", Locale.ENGLISH));
        assertArrayEquals(new int[]{0, 4, 5}, CaptionUnicode.lineBoundaries("क्ष x", Locale.forLanguageTag("hi")));
    }

    @Test public void mixedScriptWidthsPreserveCombiningMarksAndCompositeEmoji() {
        CaptionLanguageProfile japanese = CaptionLanguageProfile.fromCode("ja");
        CaptionLanguageProfile korean = CaptionLanguageProfile.fromCode("ko");
        assertEquals(1, CaptionUnicode.lineHalfUnits("e\u0301", japanese));
        assertEquals(2, CaptionUnicode.lineHalfUnits("👩🏽‍💻", japanese));
        assertEquals(2, CaptionUnicode.lineHalfUnits("각", korean));
        assertEquals(6, CaptionUnicode.lineHalfUnits("123", korean));
    }
}
