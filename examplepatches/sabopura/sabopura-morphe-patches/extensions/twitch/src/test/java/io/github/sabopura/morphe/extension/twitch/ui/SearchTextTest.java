package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;

public class SearchTextTest {
    private static List<String> tokens(String query) {
        return SearchText.tokens(query);
    }

    @Test
    public void everyWordMustMatch() {
        assertTrue(SearchText.matches("チャットの幅を変える", tokens("チャット 幅")));
        assertFalse(SearchText.matches("チャットの色を変える", tokens("チャット 幅")));
    }

    @Test
    public void fullWidthSpaceSeparatesWords() {
        assertEquals(2, tokens("チャット　幅").size());
    }

    @Test
    public void widthAndCaseAreIgnored() {
        assertTrue(SearchText.matches("NGワード", tokens("ｎｇ")));
        assertTrue(SearchText.matches("7TV", tokens("７ｔｖ")));
        assertTrue(SearchText.matches("ハイライト", tokens("ﾊｲﾗｲﾄ")));
    }

    @Test
    public void halfWidthVoicedKanaMatchesItsFullWidthForm() {
        assertTrue(SearchText.matches("タグ", tokens("ﾀｸﾞ")));
        assertTrue(SearchText.matches("ﾀｸﾞ", tokens("タグ")));
    }

    @Test
    public void blankQueryFindsNothing() {
        assertTrue(tokens("   ").isEmpty());
        assertFalse(SearchText.matches("anything", tokens("")));
    }

    @Test
    public void rangesPointIntoTheOriginalText() {
        List<int[]> ranges = SearchText.ranges("Use チャット拡張", tokens("ﾁｬｯﾄ"));
        assertEquals(1, ranges.size());
        assertArrayEquals(new int[]{4, 8}, ranges.get(0));
    }

    @Test
    public void rangesCoverHalfWidthVoicedPairsInTheOriginal() {
        List<int[]> ranges = SearchText.ranges("xﾀｸﾞy", tokens("グ"));
        assertArrayEquals(new int[]{2, 4}, ranges.get(0));
    }

    @Test
    public void overlappingMatchesMerge() {
        List<int[]> ranges = SearchText.ranges("abcd", tokens("abc bcd"));
        assertEquals(1, ranges.size());
        assertArrayEquals(new int[]{0, 4}, ranges.get(0));
    }
}
