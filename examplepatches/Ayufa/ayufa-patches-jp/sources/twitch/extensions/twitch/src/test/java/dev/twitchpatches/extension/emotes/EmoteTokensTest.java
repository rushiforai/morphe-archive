package dev.twitchpatches.extension.emotes;

import java.util.Collections;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

public class EmoteTokensTest {
    private List<EmoteTokens.Match> matches(String text) {
        return EmoteTokens.find(text, Collections.singletonMap("Code", new Emote("Code", "url", false, false)));
    }

    @Test public void exactTokensPreserveUtf16OffsetsAndUnicodeSpacing() {
        String text = "\uD83D\uDE00\u00a0Code\n\u2066Code\u2069";
        List<EmoteTokens.Match> found = matches(text);
        assertEquals(2, found.size());
        assertEquals(3, found.get(0).start);
        assertEquals("Code", text.substring(found.get(1).start, found.get(1).end));
    }

    @Test public void punctuationLinksAndPartialMatchesRemainPlainText() {
        assertTrue(matches("Code! xCode CodeSuffix https://site/Code").isEmpty());
        assertEquals(1, matches("Code Code!").size());
    }

    @Test public void workIsBoundedForLongAndRepeatedMessages() {
        assertTrue(matches("a".repeat(8193)).isEmpty());
        assertEquals(32, matches("Code ".repeat(100)).size());
    }

    @Test public void protectedSpanOverlapExcludesTouchingEndpoints() {
        assertTrue(EmoteTokens.overlaps(3, 7, 2, 4));
        assertFalse(EmoteTokens.overlaps(3, 7, 7, 10));
        assertFalse(EmoteTokens.overlaps(3, 7, 0, 3));
    }
}
