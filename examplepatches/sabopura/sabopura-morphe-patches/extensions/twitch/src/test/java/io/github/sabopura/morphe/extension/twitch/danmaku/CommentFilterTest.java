package io.github.sabopura.morphe.extension.twitch.danmaku;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public final class CommentFilterTest {
    @Test
    public void refusedExpressionsAreNamedAsWritten() {
        assertEquals(java.util.Arrays.asList("/[unclosed/", "/(a+)+$/"),
                CommentFilter.refused("spam\n/[unclosed/\n/^w+$/\n /(a+)+$/ \n/x/"));
        assertTrue(CommentFilter.refused("plain, words").isEmpty());
        assertTrue(CommentFilter.refused(null).isEmpty());
    }

    @Test
    public void emptyRulesBlockNothing() {
        assertTrue(CommentFilter.parse("").isEmpty());
        assertTrue(CommentFilter.parse(" \n , ").isEmpty());
        assertFalse(CommentFilter.parse(null).blocks("anything"));
    }

    @Test
    public void plainRulesIgnoreCaseWidthAndKana() {
        CommentFilter filter = CommentFilter.parse("spoiler\nネタバレ, ＡＢＣ");
        assertTrue(filter.blocks("No SPOILERS please"));
        assertTrue(filter.blocks("これはねたばれです"));
        assertTrue(filter.blocks("abc"));
        assertFalse(filter.blocks("great stream"));
    }

    @Test
    public void slashDelimitedRulesAreRegularExpressions() {
        CommentFilter filter = CommentFilter.parse("/^w+$/\n/[0-9]{3}-[0-9]{4}/");
        assertTrue(filter.blocks("wwww"));
        assertFalse(filter.blocks("wow"));
        assertTrue(filter.blocks("call 555-1234"));
    }

    @Test
    public void invalidRegularExpressionDoesNotDisableOtherRules() {
        CommentFilter filter = CommentFilter.parse("/[unclosed/\nbad");
        assertTrue(filter.blocks("so bad"));
        assertFalse(filter.blocks("[unclosed"));
    }

    /**
     * Android matches in ICU on a copy of the text, so a match cannot be stopped once it runs:
     * an expression that can backtrack exponentially is refused when the rules are read.
     */
    @Test(timeout = 5000)
    public void anExpressionThatCanBacktrackExponentiallyIsRefusedAndTheOthersStillApply() {
        CommentFilter filter = CommentFilter.parse("/(a+)+$/\nspam");
        assertFalse(filter.blocks("aaa"));
        assertTrue(filter.blocks("spam here"));
        assertTrue(CommentFilter.parse("/(a+)+$/").isEmpty());
    }

    @Test
    public void expressionsWithOneWayToMatchEachRepetitionAreKept() {
        CommentFilter filter = CommentFilter.parse("/^(草|w)+$/\n/(.)\\1{5,}/");
        assertTrue(filter.blocks("草ww草"));
        assertTrue(filter.blocks("!!!!!!"));
        assertFalse(filter.blocks("草 w"));
    }

    @Test
    public void expressionsDoNotRunOnTextLongerThanAnyDanmakuComment() {
        CommentFilter filter = CommentFilter.parse("/b$/");
        StringBuilder text = new StringBuilder();
        for (int i = 0; i < 2 * DanmakuSettings.MAX_MAX_LENGTH; i++) text.append('a');
        assertFalse(filter.blocks(text + "b"));
        assertTrue(filter.blocks(text.substring(1) + "b"));
    }

    @Test
    public void exponentialShapesAreFound() {
        for (String regex : new String[] {"(a+)+", "(a*)*b", "(\\w+\\s?)+$", "(a|a)+", "(a|ab)*c", "((a|a)b)+",
                "(a?){30}a{30}", "(.*a){20}", "(W|w)+", "(?:x+y?)+", "((ab)+c)+", "(?<n>a+)+", "(|a)+", "([ab]|a)+", "(a+){1234567890}"})
            assertTrue(regex, RegexShape.backtracksExponentially(regex));
    }

    @Test
    public void ordinaryShapesAreKept() {
        for (String regex : new String[] {"^w+$", "[0-9]{3}-[0-9]{4}", "(草|w)+", "(ry|ｒｙ)+", "(.)\\1{5,}", "https?://",
                "[(+*]+", "\\(a+\\)+", "(?i)(ab)+", "(ab){2}", "(a+)?b", "\\Q(a+)+\\E", "[a(]+(b)", "a{2,}(b|c)",
                "(?=a)b", "\\p{L}+", "(\\.|,)+", ".*死.*ね"})
            assertFalse(regex, RegexShape.backtracksExponentially(regex));
    }
}
