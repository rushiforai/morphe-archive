/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;

import org.junit.Test;

public class YandexVotContentRangeTest {

    @Test
    public void parsesValidHeader() {
        YandexVotContentRange range = YandexVotContentRange.parse("bytes 0-99/10000");
        assertNotNull(range);
        assertEquals(0, range.start);
        assertEquals(99, range.end);
        assertEquals(10000, range.total);
    }

    @Test
    public void parsesFullRangeAndWhitespaceTolerances() {
        assertNotNull(YandexVotContentRange.parse("bytes 0-5295307/10590616"));
        assertNotNull(YandexVotContentRange.parse("Bytes 0-99/10000"));
        assertNotNull(YandexVotContentRange.parse("  bytes 0-99/10000  "));
        assertNotNull(YandexVotContentRange.parse("bytes 0-99/10000 "));
    }

    @Test
    public void rejectsMissingMalformedOrUnknownHeaders() {
        assertNull(YandexVotContentRange.parse(null));
        assertNull(YandexVotContentRange.parse(""));
        assertNull(YandexVotContentRange.parse("bytes"));
        assertNull(YandexVotContentRange.parse("0-99/10000"));
        assertNull(YandexVotContentRange.parse("range 0-99/10000"));
        assertNull(YandexVotContentRange.parse("bytes 0-99/10000 extra"));
        assertNull(YandexVotContentRange.parse("bytes -1-99/10000"));
        assertNull(YandexVotContentRange.parse("bytes 0-99/-1"));
        assertNull(YandexVotContentRange.parse("bytes 0-99/*"));
        assertNull(YandexVotContentRange.parse("bytes 0-99/abc"));
        assertNull(YandexVotContentRange.parse("bytes a-b/c"));
        assertNull(YandexVotContentRange.parse("bytes 10-9/10000")); // start > end
        assertNull(YandexVotContentRange.parse("bytes 0-20/10"));     // total <= end
        assertNull(YandexVotContentRange.parse("bytes 0-0/0"));
    }

    @Test
    public void requireAcceptsExactlyMatchingRange() throws Exception {
        YandexVotContentRange range =
                YandexVotContentRange.require("bytes 0-5295307/10590616", 0, 5_295_307, 10_590_616);
        assertNotNull(range);
        assertEquals(5_295_308, range.end - range.start + 1);

        // Unknown knownTotal still validates start/end and total coverage.
        assertNotNull(YandexVotContentRange.require("bytes 0-99/10000", 0, 99, 0));
    }

    @Test
    public void requireRejectsMissingHeader() {
        expectReadFailure(() ->
                YandexVotContentRange.require(null, 0, 99, 10000));
    }

    @Test
    public void requireRejectsWrongStartOffset() {
        expectReadFailure(() ->
                YandexVotContentRange.require("bytes 50-149/10000", 0, 99, 10000));
    }

    @Test
    public void requireRejectsWrongEnd() {
        expectReadFailure(() ->
                YandexVotContentRange.require("bytes 0-98/10000", 0, 99, 10000));
        expectReadFailure(() ->
                YandexVotContentRange.require("bytes 0-100/10000", 0, 99, 10000));
    }

    @Test
    public void requireRejectsTotalContradictingKnownFileSize() {
        expectReadFailure(() ->
                YandexVotContentRange.require("bytes 0-99/9999", 0, 99, 10000));
    }

    private static void expectReadFailure(ThrowingRunnable action) {
        try {
            action.run();
            fail("Expected SourceReadException");
        } catch (YandexVotAudioTransfer.SourceReadException expected) {
            // expected
        } catch (Exception unexpected) {
            fail("Expected SourceReadException but got " + unexpected);
        }
    }

    private interface ThrowingRunnable {
        void run() throws Exception;
    }
}
