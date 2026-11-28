package dev.jason.gboardpatches.extension.swiftkey;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Test;

public final class GboardSwiftKeyRuntimeTest {
    @After
    public void tearDown() {
        GboardSwiftKeyRuntime.resetForTesting();
    }

    @Test
    public void cycleCaseFollowsSwiftKeyWordTitleUpperLowerCycle() {
        assertEquals("Hello", GboardSwiftKeyRuntime.cycleCase("hello"));
        assertEquals("HELLO", GboardSwiftKeyRuntime.cycleCase("Hello"));
        assertEquals("hello", GboardSwiftKeyRuntime.cycleCase("HELLO"));
        assertEquals("Iphone", GboardSwiftKeyRuntime.cycleCase("iPhone"));
        assertEquals("A", GboardSwiftKeyRuntime.cycleCase("a"));
        assertEquals("a", GboardSwiftKeyRuntime.cycleCase("A"));
        assertEquals("বাংলা", GboardSwiftKeyRuntime.cycleCase("বাংলা"));
        assertEquals("12345", GboardSwiftKeyRuntime.cycleCase("12345"));
    }

    @Test
    public void extractTouchingWordMatchesWordEndAndMidWordButIgnoresTrailingSpace() {
        GboardSwiftKeyRuntime.WordSpan atEnd =
                GboardSwiftKeyRuntime.extractTouchingWord("say hello", "");
        assertNotNull(atEnd);
        assertEquals("hello", atEnd.word);
        assertEquals(5, atEnd.leftLen);
        assertEquals(0, atEnd.rightLen);

        GboardSwiftKeyRuntime.WordSpan midWord =
                GboardSwiftKeyRuntime.extractTouchingWord("say he", "llo world");
        assertNotNull(midWord);
        assertEquals("hello", midWord.word);
        assertEquals(2, midWord.leftLen);
        assertEquals(3, midWord.rightLen);

        assertNull(GboardSwiftKeyRuntime.extractTouchingWord("say hello ", ""));
        assertNull(GboardSwiftKeyRuntime.extractTouchingWord("", "hello"));
        assertNull(GboardSwiftKeyRuntime.extractTouchingWord("12345", ""));
        assertNull(GboardSwiftKeyRuntime.extractTouchingWord("বাংলা", ""));
    }

    @Test
    public void smartSpaceTrimBeforePunctuationOnlyTrimsSingleSpaceAfterWord() {
        assertTrue(GboardSwiftKeyRuntime.shouldTrimSpaceBeforePunctuation("hello ", ','));
        assertTrue(GboardSwiftKeyRuntime.shouldTrimSpaceBeforePunctuation("hello ", '.'));
        assertTrue(GboardSwiftKeyRuntime.shouldTrimSpaceBeforePunctuation("বাংলা ", '?'));
        assertTrue(GboardSwiftKeyRuntime.shouldTrimSpaceBeforePunctuation("(ok) ", '!'));
        assertTrue(GboardSwiftKeyRuntime.shouldTrimSpaceBeforePunctuation("done ", ';'));
        assertTrue(GboardSwiftKeyRuntime.shouldTrimSpaceBeforePunctuation("note ", ':'));

        assertFalse(GboardSwiftKeyRuntime.shouldTrimSpaceBeforePunctuation("hello", ','));
        assertFalse(GboardSwiftKeyRuntime.shouldTrimSpaceBeforePunctuation("hello  ", ','));
        assertFalse(GboardSwiftKeyRuntime.shouldTrimSpaceBeforePunctuation("hello. ", '.'));
        assertFalse(GboardSwiftKeyRuntime.shouldTrimSpaceBeforePunctuation(" ", ','));
        assertFalse(GboardSwiftKeyRuntime.shouldTrimSpaceBeforePunctuation("hello ", 'a'));
    }
}
