/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * The word lists on their own: how a typed list is cleaned and bounded, how a phrase and a post's
 * words are folded, and what the two lists make of a post. Robolectric for the phone's ICU, which
 * does the folding.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostWordsTest {
    @Before
    @After
    public void forget() {
        PostWords.forgetForTests();
    }

    private static String lines(int count, String prefix) {
        return lines(count, prefix, "");
    }

    /** [count] phrases, numbered between [prefix] and [suffix], one per line. */
    private static String lines(int count, String prefix, String suffix) {
        List<String> lines = new ArrayList<>();
        for (int i = 0; i < count; i++) lines.add(prefix + i + suffix);
        return String.join("\n", lines);
    }

    private static String repeat(String text, int times) {
        return String.join("", Collections.nCopies(times, text));
    }

    @Test
    public void aListIsOnePhrasePerLineWithoutTheSpacesAroundIt() {
        assertEquals(Arrays.asList("spoiler", "giveaway now"),
                PostWords.phrases("  spoiler \n\n\tgiveaway now \r\n   \n"));
        assertEquals("spoiler\ngiveaway now", PostWords.clean("  spoiler \n\n\tgiveaway now \r\n   \n"));
        assertEquals(Collections.emptyList(), PostWords.phrases(""));
        assertEquals(Collections.emptyList(), PostWords.phrases(null));
        assertEquals("", PostWords.clean(null));
    }

    /** 2 to 60 characters, counted as characters people see: an emoji is one, not two. */
    @Test
    public void aPhraseIsTwoToSixtyCharacters() {
        String sixty = repeat("a", 60);
        assertEquals(Arrays.asList("ab", sixty), PostWords.phrases("a\nab\n" + sixty + "\n" + sixty + "b"));
        // An emoji is one character (two UTF-16 units), so sixty fit and sixty-one don't.
        assertEquals(Collections.singletonList(repeat("😀", 60)),
                PostWords.phrases(repeat("😀", 60) + "\n" + repeat("😀", 61)));
    }

    @Test
    public void aListHoldsFiftyPhrasesAndARepeatCountsOnce() {
        assertEquals(PostWords.MAX_PHRASES, PostWords.phrases(lines(80, "word")).size());
        assertEquals("word49", PostWords.phrases(lines(80, "word")).get(49));
        // A repeat in another case or width is the same phrase, and the first one written stays.
        assertEquals(Arrays.asList("Spoiler", "leak"), PostWords.phrases("Spoiler\nSPOILER\nleak\nｓｐｏｉｌｅｒ"));
        // Repeats don't take a place: fifty different phrases after a repeat all fit.
        assertEquals(PostWords.MAX_PHRASES, PostWords.phrases("word0\n" + lines(50, "word")).size());
    }

    @Test
    public void whatCleaningLeavesOutIsCountedAndACleanListStaysAsItIs() {
        String typed = "a\nspoiler\nSpoiler\n\n  \n" + repeat("x", 61) + "\nleak";
        assertEquals("spoiler\nleak", PostWords.clean(typed));
        assertEquals("one too short, one repeat, one too long", 3, PostWords.leftOut(typed));
        assertEquals(30, PostWords.leftOut(lines(80, "word")));
        assertEquals(0, PostWords.leftOut("  spoiler  \n\n"));
        assertTrue(PostWords.isClean("spoiler\nleak"));
        assertTrue(PostWords.isClean(""));
        assertFalse(PostWords.isClean(" spoiler"));
        assertFalse(PostWords.isClean("spoiler\n"));
        assertFalse(PostWords.isClean("spoiler\nSPOILER"));
        assertFalse(PostWords.isClean(lines(51, "word")));
        assertFalse(PostWords.isClean(null));
        assertEquals(2, PostWords.count("spoiler\nleak\na"));
    }

    /** A phrase that folds to less than two characters is left out: it would match nearly every post. */
    @Test
    public void aPhraseThatFoldsToAlmostNothingIsLeftOut() {
        // A letter and a zero width joiner, which Unicode's matching folds away.
        assertEquals(Collections.emptyList(), PostWords.phrases("a‍"));
        assertEquals(Collections.emptyList(), PostWords.phrases("​​"));
    }

    /**
     * One character is a phrase when it's a word on its own: an ideograph, a kana or Hangul
     * syllable, or a symbol such as an emoji. A lone letter or digit of a script that spaces its
     * words is in nearly every post, so it's still left out. The folded text decides, so a heart
     * with its emoji variation selector is one character and a thumbs up with a skin tone is two.
     */
    @Test
    public void aSingleIdeographSyllableOrSymbolIsAPhrase() {
        String heart = "❤" + (char) 0xFE0F;
        assertEquals(Arrays.asList("猫", "ね", "カ", "한", heart, "👍🏽", "😀"),
                PostWords.phrases("猫\nね\nカ\n한\n" + heart + "\n👍🏽\n😀"));
        // The heart without its selector folds to the same character, so it's a repeat.
        assertEquals(Collections.singletonList(heart), PostWords.phrases(heart + "\n❤"));
        // A letter or digit, a letter that folds to two ("ß" is "ss"), a Hangul letter that isn't a
        // syllable, and symbols that fold to a letter or digit ("Ⓐ" is "a", "①" is "1").
        assertEquals(Collections.emptyList(), PostWords.phrases("a\n7\nA\né\nж\nß\nㅋ\nⒶ\n①"));
        assertEquals(9, PostWords.leftOut("a\n7\nA\né\nж\nß\nㅋ\nⒶ\n①"));
        assertTrue(PostWords.isClean("猫\n" + heart));

        assertEquals(PostWords.Verdict.HIDE, judge("猫", "", "うちの猫です"));
        assertEquals(PostWords.Verdict.HIDE, judge(heart, "", "love it ❤"));
        assertEquals(PostWords.Verdict.KEEP, judge("spoiler", "한", "spoiler 한국"));
        assertEquals(PostWords.Verdict.NO_MATCH, judge("猫", "", "うちの犬です"));
    }

    @Test
    public void caseAndWidthFoldTheUnicodeWay() {
        assertEquals(PostWords.fold("spoiler"), PostWords.fold("SPOILER"));
        assertEquals(PostWords.fold("spoiler"), PostWords.fold("ＳＰＯＩＬＥＲ"));
        // Full case folding, which lowercasing alone doesn't do: the sharp s and the final sigma.
        assertEquals(PostWords.fold("strasse"), PostWords.fold("Straße"));
        assertEquals(PostWords.fold("σοφοσ"), PostWords.fold("ΣΟΦΟς"));
        // A composed letter and the same letter built from two code points are one.
        assertEquals(PostWords.fold("café"), PostWords.fold("café"));
    }

    private static PostWords.Verdict judge(String hide, String keep, String... texts) {
        return PostWords.rules(hide, keep).judge(Arrays.asList(texts));
    }

    @Test
    public void aHidePhraseAnywhereInThePostsWordsHidesIt() {
        assertEquals(PostWords.Verdict.HIDE, judge("spoiler", "", "Huge SPOILER for the finale"));
        // Plain substrings: inside a longer word too.
        assertEquals(PostWords.Verdict.HIDE, judge("spoil", "", "Spoilers ahead"));
        assertEquals(PostWords.Verdict.HIDE, judge("giveaway now", "", "Enter the GIVEAWAY NOW!"));
        assertEquals(PostWords.Verdict.HIDE, judge("straße", "", "Unsere STRASSE ist gesperrt"));
        // The second text is a shared post's.
        assertEquals(PostWords.Verdict.HIDE, judge("spoiler", "", "Look at this", "spoiler inside"));
        assertEquals(PostWords.Verdict.NO_MATCH, judge("spoiler", "", "Nothing to see", "here either"));
    }

    @Test
    public void aKeepPhraseWinsWhereverItIs() {
        assertEquals(PostWords.Verdict.KEEP, judge("spoiler", "my team", "Spoiler about MY TEAM"));
        assertEquals(PostWords.Verdict.KEEP, judge("spoiler", "my team", "My team shared", "a spoiler"));
        assertEquals(PostWords.Verdict.KEEP, judge("spoiler", "spoiler", "spoiler"));
        // A keep phrase alone hides nothing and is never a reason to hide.
        assertEquals(PostWords.Verdict.NO_MATCH, judge("", "my team", "my team"));
        assertEquals(PostWords.Verdict.NO_MATCH, judge("spoiler", "my team", "just my cat"));
    }

    /** Characters that mean something in a pattern mean only themselves in a phrase. */
    @Test
    public void thereAreNoPatterns() {
        assertEquals(PostWords.Verdict.NO_MATCH, judge("a.c", "", "abc"));
        assertEquals(PostWords.Verdict.HIDE, judge("a.c", "", "see a.c here"));
        assertEquals(PostWords.Verdict.NO_MATCH, judge(".*", "", "anything at all"));
        assertEquals(PostWords.Verdict.NO_MATCH, judge("[ab]", "", "a b"));
        assertEquals(PostWords.Verdict.HIDE, judge("\\d+", "", "literally \\d+"));
    }

    @Test
    public void noWordsAndNoTextMatchNothing() {
        assertTrue(PostWords.rules("", "keep me").hidesNothing());
        assertFalse(PostWords.rules("x1", "").hidesNothing());
        assertEquals(PostWords.Verdict.NO_MATCH, judge("spoiler", ""));
    }

    /** Only the first fifty phrases of a longer store count, whatever wrote it. */
    @Test
    public void aStoreLongerThanTheBoundsStillHoldsFiftyPhrases() {
        // The suffix keeps one number's phrase from being part of another's: "p5x" isn't in "p50x".
        String stored = lines(51, "p", "x");
        assertEquals(PostWords.Verdict.HIDE, judge(stored, "", "has p49x in it"));
        assertEquals(PostWords.Verdict.NO_MATCH, judge(stored, "", "has p50x in it"));
    }

    @Test
    public void theFoldedListsAreKeptUntilEitherChanges() {
        PostWords.Rules first = PostWords.rules("spoiler", "team");
        assertSame(first, PostWords.rules("spoiler", "team"));
        assertFalse(first == PostWords.rules("spoiler", "teams"));
        assertFalse(first == PostWords.rules("spoilers", "team"));
    }
}
