package io.github.sabopura.morphe.extension.twitch.original;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class SpeechTextTest {
    private static String english(String text) {
        return SpeechText.of("a", text, false, false, 120);
    }

    private static String japanese(String text) {
        return SpeechText.of("a", text, false, true, 120);
    }

    @Test
    public void linksAreNotSpelledOut() {
        assertEquals("look link", english("look https://example.com/x?y=1"));
        assertEquals("見て リンク", japanese("見て https://example.com/x?y=1"));
    }

    @Test
    public void aLinkWithoutItsSchemeIsALinkNotLaughter() {
        assertEquals("リンク 見て", japanese("www.example.com/watch?v=1 見て"));
        assertEquals("link", english("WWW.example.com"));
    }

    @Test
    public void linkOnlyMessageStillSaysLink() {
        assertEquals("link", english("https://example.com"));
    }

    @Test
    public void emptyTextHasNothingToSay() {
        assertNull(SpeechText.of("a", "   ", true, false, 120));
    }

    @Test
    public void senderNameLeadsWhenAsked() {
        assertEquals("ayu, hello", SpeechText.of("ayu", "hello", true, false, 120));
        assertEquals("あゆ、こんにちは", SpeechText.of("あゆ", "こんにちは", true, true, 120));
        assertEquals("hello", SpeechText.of("", "hello", true, false, 120));
    }

    @Test
    public void longMessagesAreCut() {
        assertEquals("abcde", SpeechText.of("x", "abcdefgh", false, false, 5));
    }

    @Test
    public void aLongRunOfOneCharacterIsSaidThreeTimes() {
        assertEquals("nooo way!!!", english("nooooooooo way!!!!!!!!"));
        assertEquals("あああ", japanese("ああああああああ"));
        assertEquals("😂😂😂", english("😂😂😂😂😂😂"));
        assertEquals("www", english("wwwwwwwwwwww"));
    }

    @Test
    public void numbersKeepEveryDigit() {
        assertEquals("10000 points", english("10000 points"));
        assertEquals("１００００円", japanese("１００００円"));
    }

    @Test
    public void aJapaneseVoiceLaughsInsteadOfSpellingW() {
        assertEquals("わら", japanese("wwwwwwww"));
        assertEquals("それなわら", japanese("それなw"));
        assertEquals("草わら", japanese("草ｗｗｗ"));
        assertEquals("わら", japanese("WWW"));
    }

    @Test
    public void wInsideAWordIsNoLaugh() {
        assertEquals("wktk", japanese("wktk"));
        assertEquals("W杯", japanese("W杯"));
        assertEquals("ww2 の話", japanese("ww2 の話"));
        assertEquals("show", japanese("show"));
    }

    @Test
    public void aJapaneseVoiceClapsForEights() {
        assertEquals("ぱちぱち", japanese("888"));
        assertEquals("ぱちぱち", japanese("８８８８８８８８"));
        assertEquals("おつぱちぱち", japanese("おつ8888"));
    }

    @Test
    public void eightsInANumberStayANumber() {
        assertEquals("888円", japanese("888円"));
        assertEquals("1888", japanese("1888"));
        assertEquals("88", japanese("88"));
        assertEquals("888", english("888"));
    }

    @Test
    public void wordsShownAsPicturesAreLeftOut() {
        Set<String> emotes = new HashSet<>(Arrays.asList("KEKW", "catJAM"));
        assertEquals("that was close", SpeechText.without("KEKW that was  catJAM close KEKW", emotes::contains));
        assertEquals("", SpeechText.without("KEKW KEKW", emotes::contains));
        assertEquals("kekw", SpeechText.without("kekw", emotes::contains));
    }
}
