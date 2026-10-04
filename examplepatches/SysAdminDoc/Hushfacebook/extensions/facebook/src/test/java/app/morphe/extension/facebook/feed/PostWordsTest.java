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
    public void aListHoldsAThousandPhrasesAndARepeatCountsOnce() {
        assertEquals(1000, PostWords.MAX_PHRASES);
        assertEquals(PostWords.MAX_PHRASES, PostWords.phrases(lines(1030, "word")).size());
        assertEquals("word999", PostWords.phrases(lines(1030, "word")).get(999));
        // A repeat in another case or width is the same phrase, and the first one written stays.
        assertEquals(Arrays.asList("Spoiler", "leak"), PostWords.phrases("Spoiler\nSPOILER\nleak\nｓｐｏｉｌｅｒ"));
        // Repeats don't take a place: a thousand different phrases after a repeat all fit.
        assertEquals(PostWords.MAX_PHRASES, PostWords.phrases("word0\n" + lines(1000, "word")).size());
    }

    /** A list's share of the room is what it takes in a settings file: JSON's escapes, then UTF-8. */
    @Test
    public void aListsBytesAreWhatAFileHolds() throws Exception {
        assertEquals(0, PostWords.encodedBytes(null));
        assertEquals(0, PostWords.encodedBytes(""));
        assertEquals(2, PostWords.encodedBytes("ab"));
        assertEquals("a line break is written as two", 4, PostWords.encodedBytes("ab\ncd".substring(1, 4)));
        assertEquals("a slash and a quote are escaped", 10, PostWords.encodedBytes("a/b \"c\""));
        assertEquals(2, PostWords.encodedBytes("é"));
        assertEquals(3, PostWords.encodedBytes("猫"));
        assertEquals(4, PostWords.encodedBytes("😀"));
        assertEquals("a tab is written as two", 4, PostWords.encodedBytes("a\tb"));
        // A list that's written with the rest of a file takes no more than this in it.
        String list = "spoiler\nStraße/猫 😀\n\"quoted\"";
        String file = new org.json.JSONObject().put("k", list).toString();
        assertEquals(file.getBytes(java.nio.charset.StandardCharsets.UTF_8).length - "{\"k\":\"\"}".length(),
                PostWords.encodedBytes(list));
    }

    @Test
    public void bothListsShareTheirRoom() {
        String half = asciiOfBytes(PostWords.MAX_LIST_BYTES / 2);
        assertEquals(PostWords.MAX_LIST_BYTES / 2, PostWords.encodedBytes(half));
        assertTrue(PostWords.fits(half, half));
        assertTrue(PostWords.fits(null, asciiOfBytes(PostWords.MAX_LIST_BYTES)));
        assertFalse(PostWords.fits(half, half + "x"));
        assertFalse(PostWords.fits(asciiOfBytes(PostWords.MAX_LIST_BYTES + 1), ""));

        PostWords.Size full = PostWords.size(half, PostWords.MAX_LIST_BYTES / 2);
        assertTrue(full.fits());
        assertEquals(100, full.percent());
        PostWords.Size over = PostWords.size(half + "x", PostWords.MAX_LIST_BYTES / 2);
        assertFalse(over.fits());
        assertFalse(over.tooMany());
        assertEquals("one byte over shows past 100", 101, over.percent());
        assertEquals("any phrase at all shows", 1, PostWords.size("ab", 0).percent());
        assertEquals(0, PostWords.size("", 0).percent());
        // What's typed is measured as it would be stored.
        assertEquals(PostWords.size("spoiler\nleak", 5).bytes, PostWords.size("  spoiler \n\nleak\nSPOILER", 5).bytes);
    }

    @Test
    public void aThousandAndOnePhrasesAreTooManyWhateverTheirSize() {
        PostWords.Size most = PostWords.size(lines(1000, "w"), 0);
        assertFalse(most.tooMany());
        assertTrue(most.fits());
        assertEquals(1000, most.phrases);
        PostWords.Size past = PostWords.size(lines(1001, "w"), 0);
        assertTrue(past.tooMany());
        assertFalse(past.fits());
        assertEquals("counting stops one past the most", 1001, PostWords.size(lines(5000, "w"), 0).phrases);
        // Lines left out for their length or as repeats don't count toward the most.
        assertFalse(PostWords.size(lines(1000, "w") + "\nW0\na\n" + repeat("x", 61), 0).tooMany());
    }

    /** A thousand short phrases in each list, as #58 asked for, fit in the room together. */
    @Test
    public void aThousandShortPhrasesInEachListFitTogether() {
        String hide = WordsCorpus.hide();
        String keep = WordsCorpus.keep();
        assertEquals(1000, PostWords.count(hide));
        assertEquals(1000, PostWords.count(keep));
        assertTrue(PostWords.isClean(hide));
        assertTrue(PostWords.isClean(keep));
        assertTrue(PostWords.encodedBytes(hide) + PostWords.encodedBytes(keep) + " bytes", PostWords.fits(hide, keep));
    }

    /** A clean list of plain letters that takes exactly [bytes] in a file, eight at least. */
    public static String asciiOfBytes(int bytes) {
        List<String> phrases = new ArrayList<>();
        int left = bytes;
        for (int index = 0; left > 0; index++) {
            // A line break before each phrase but the first takes two bytes.
            int separator = phrases.isEmpty() ? 0 : 2;
            int room = left - separator;
            // The last phrase takes what's left. One before it leaves that last one eight at least.
            int length = room <= PostWords.MAX_LENGTH ? room : Math.min(PostWords.MAX_LENGTH, room - 2 - 8);
            phrases.add(phraseOf(index, length));
            left -= separator + length;
        }
        String list = String.join("\n", phrases);
        assertEquals(bytes, PostWords.encodedBytes(list));
        assertTrue(PostWords.isClean(list));
        return list;
    }

    /** Phrase [index] as [length] plain letters and digits, eight at least, which no other index gives. */
    private static String phraseOf(int index, int length) {
        String stem = "q" + Integer.toString(index, 26) + "q";
        StringBuilder phrase = new StringBuilder(stem);
        while (phrase.length() < length) phrase.append('x');
        return phrase.substring(0, length);
    }

    @Test
    public void whatCleaningLeavesOutIsCountedAndACleanListStaysAsItIs() {
        String typed = "a\nspoiler\nSpoiler\n\n  \n" + repeat("x", 61) + "\nleak";
        assertEquals("spoiler\nleak", PostWords.clean(typed));
        assertEquals("one too short, one repeat, one too long", 3, PostWords.leftOut(typed));
        assertEquals(30, PostWords.leftOut(lines(1030, "word")));
        assertEquals(0, PostWords.leftOut("  spoiler  \n\n"));
        assertTrue(PostWords.isClean("spoiler\nleak"));
        assertTrue(PostWords.isClean(""));
        assertFalse(PostWords.isClean(" spoiler"));
        assertFalse(PostWords.isClean("spoiler\n"));
        assertFalse(PostWords.isClean("spoiler\nSPOILER"));
        assertFalse(PostWords.isClean(lines(1001, "word")));
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

    private static PostWords.Verdict whole(String hide, String keep, String... texts) {
        return PostWords.rules(hide, keep, true).judge(Arrays.asList(texts));
    }

    @Test
    public void wholeWordsAreOptionalAndNeverCutAWordRun() {
        for (String text : Arrays.asList("what", "that", "hats")) {
            assertEquals(text, PostWords.Verdict.HIDE, judge("hat", "", text));
            assertEquals(text, PostWords.Verdict.NO_MATCH, whole("hat", "", text));
        }
        assertEquals(PostWords.Verdict.HIDE, whole("hat", "", "hat!"));
        assertEquals(PostWords.Verdict.HIDE, whole("hat", "", "a hat, please"));
        assertEquals(PostWords.Verdict.HIDE,
                PostWords.rules("hat", "", false).judge(Collections.singletonList("what")));
    }

    @Test
    public void wholeWordsUseTheSameUnicodeNormalization() {
        assertEquals(PostWords.Verdict.HIDE, whole("café", "", "CAFÉ!"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("café", "", "décaféiné"));
        assertEquals(PostWords.Verdict.HIDE, whole("hat", "", "ＳＯＭＥ ＨＡＴ!"));
        assertEquals(PostWords.Verdict.HIDE, whole("straße", "", "STRASSE!"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("straße", "", "Straßen"));
    }

    @Test
    public void lettersMarksNumbersAndConnectorsStayInOneRun() {
        for (String text : Arrays.asList("1hat", "hat1", "hat١", "_hat", "hat_", "hat‿",
                "hat́", "hat⃝", "𐐨hat", "hat𐐨", "hat𐀀")) {
            assertEquals(text, PostWords.Verdict.NO_MATCH, whole("hat", "", text));
        }
        assertEquals(PostWords.Verdict.HIDE, whole("hat", "", "hat-box"));
        assertEquals(PostWords.Verdict.HIDE, whole("hat", "", "hat.box"));
    }

    @Test
    public void internalApostrophesJoinLettersButQuotesDoNot() {
        assertEquals(PostWords.Verdict.NO_MATCH, whole("can", "", "can't"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("can", "", "can’t"));
        assertEquals(PostWords.Verdict.HIDE, whole("can't", "", "can't!"));
        assertEquals(PostWords.Verdict.HIDE, whole("can’t", "", "can’t!"));
        assertEquals(PostWords.Verdict.HIDE, whole("can", "", "'can'"));
        assertEquals(PostWords.Verdict.HIDE, whole("can", "", "‘can’"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("can̸", "", "can̸’t"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("can", "", "can'̸t"));
    }

    @Test
    public void symbolsAndPunctuationHaveTheirOwnEndpoints() {
        assertEquals(PostWords.Verdict.HIDE, whole("😀", "", "a😀b"));
        assertEquals(PostWords.Verdict.HIDE, whole("👍🏽", "", "a👍🏽b"));
        assertEquals(PostWords.Verdict.HIDE, whole("hat!", "", "hat!box"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("hat!", "", "what!box"));
        assertEquals(PostWords.Verdict.HIDE, whole("@cat", "", "box@cat!"));
        assertEquals(PostWords.Verdict.HIDE, whole(".*", "", "a.*b"));
        assertEquals(PostWords.Verdict.HIDE, whole("😀hat", "", "a😀hat!"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("😀hat", "", "a😀hats"));
    }

    @Test
    public void cjkIsOneRunWithoutGuessingWordBreaks() {
        assertEquals(PostWords.Verdict.HIDE, whole("猫", "", "猫!"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("猫", "", "うちの猫です"));
        assertEquals(PostWords.Verdict.HIDE, whole("猫犬", "", "猫犬!"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("猫犬", "", "猫犬鳥"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("한", "", "한국"));
    }

    @Test
    public void everySuffixKeepsItsOwnBoundariesAndValidKeepsWin() {
        assertEquals(PostWords.Verdict.HIDE, whole("copycat", "cat", "copycat"));
        assertEquals(PostWords.Verdict.HIDE, whole("copycat!", "cat!", "copycat!"));
        assertEquals(PostWords.Verdict.HIDE, whole("hat!", "at!", "hat!box"));
        assertEquals(PostWords.Verdict.KEEP, whole("cat", "copycat", "copycat"));
        assertEquals(PostWords.Verdict.KEEP, whole("copycat", "cat", "copycat cat"));
        assertEquals(PostWords.Verdict.KEEP, whole("copycat", "cat", "copycat", "cat!"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("copycat", "cat", "copycats"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole("", "cat", "cat"));
    }

    @Test
    public void changingOnlyTheModeRebuildsTheRules() {
        PostWords.Rules substrings = PostWords.rules("hat", "cat", false);
        assertSame(substrings, PostWords.rules("hat", "cat", false));
        PostWords.Rules wholeWords = PostWords.rules("hat", "cat", true);
        assertFalse(substrings == wholeWords);
        assertSame(wholeWords, PostWords.rules("hat", "cat", true));
        assertEquals(PostWords.Verdict.NO_MATCH, wholeWords.judge(Collections.singletonList("what")));
        assertEquals(PostWords.Verdict.HIDE, PostWords.rules("hat", "cat", false)
                .judge(Collections.singletonList("what")));
    }

    /** Nested suffixes must not turn each character into a walk of every matching phrase. */
    @Test
    public void wholeWordSuffixesAndAThousandPhrasesStayBounded() {
        List<String> nested = new ArrayList<>();
        for (int size = 2; size <= PostWords.MAX_LENGTH; size++) nested.add(repeat("a", size));
        assertEquals(PostWords.Verdict.NO_MATCH,
                whole(String.join("\n", nested), "aa", repeat("a", 10 * 1024)));
        assertEquals(PostWords.Verdict.HIDE,
                whole(String.join("\n", nested), "aa", repeat("a", PostWords.MAX_LENGTH)));
        assertEquals(PostWords.Verdict.HIDE, whole(lines(1001, "p", "x"), "", "p999x!"));
        assertEquals(PostWords.Verdict.NO_MATCH, whole(lines(1001, "p", "x"), "", "p1000x!"));

        PostWords.Rules rules = PostWords.rules(WordsCorpus.hide(), WordsCorpus.keep(), true);
        List<String> post = Collections.singletonList(WordsCorpus.post());
        assertEquals(PostWords.Verdict.NO_MATCH, rules.judge(post));
        long[] took = new long[200];
        for (int warm = 0; warm < 50; warm++) rules.judge(post);
        for (int run = 0; run < took.length; run++) {
            long start = System.nanoTime();
            rules.judge(post);
            took[run] = System.nanoTime() - start;
        }
        Arrays.sort(took);
        long p95 = took[(int) Math.ceil(took.length * 0.95) - 1];
        assertTrue("whole words p95 " + p95 / 1000 + " us", p95 < 16_700_000L);
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

    /** Only the first thousand phrases of a longer store count, whatever wrote it. */
    @Test
    public void aStoreLongerThanTheBoundsStillHoldsAThousandPhrases() {
        // The suffix keeps one number's phrase from being part of another's: "p5x" isn't in "p50x".
        String stored = lines(1001, "p", "x");
        assertEquals(PostWords.Verdict.HIDE, judge(stored, "", "has p999x in it"));
        assertEquals(PostWords.Verdict.NO_MATCH, judge(stored, "", "has p1000x in it"));
    }

    /**
     * The automaton finds what checking each phrase with {@link String#contains} finds, for lists
     * whose phrases overlap, nest and share prefixes and suffixes, across texts and scripts.
     */
    @Test
    public void theMatcherAgreesWithPlainContains() {
        // The textbook overlaps first: each of these ends inside another.
        assertEquals(PostWords.Verdict.HIDE, judge("he\nshe\nhis\nhers", "", "ushers"));
        assertEquals(PostWords.Verdict.KEEP, judge("ushers", "she", "ushers"));
        assertEquals(PostWords.Verdict.HIDE, judge("abcd\nbc", "", "xabcx"));
        assertEquals(PostWords.Verdict.NO_MATCH, judge("abcd\nbcf", "", "abcbcd"));

        java.util.Random random = new java.util.Random(58);
        String[] alphabet = {"a", "b", "c", "A", "😀", "猫", "ß", "s"};
        for (int round = 0; round < 3000; round++) {
            List<String> hide = new ArrayList<>();
            List<String> keep = new ArrayList<>();
            for (int i = random.nextInt(8); i > 0; i--) hide.add(word(random, alphabet, 2 + random.nextInt(4)));
            for (int i = random.nextInt(3); i > 0; i--) keep.add(word(random, alphabet, 2 + random.nextInt(4)));
            List<String> texts = new ArrayList<>();
            for (int i = 1 + random.nextInt(2); i > 0; i--) texts.add(word(random, alphabet, random.nextInt(24)));
            String hidden = String.join("\n", hide);
            String kept = String.join("\n", keep);
            assertEquals(hidden + " / " + kept + " / " + texts, naive(hidden, kept, texts),
                    PostWords.rules(hidden, kept).judge(texts));
        }
    }

    private static String word(java.util.Random random, String[] alphabet, int length) {
        StringBuilder word = new StringBuilder();
        for (int i = 0; i < length; i++) word.append(alphabet[random.nextInt(alphabet.length)]);
        return word.toString();
    }

    /** The verdict as it was reached before the automaton: every phrase against every text. */
    private static PostWords.Verdict naive(String hidden, String kept, List<String> texts) {
        List<String> hide = PostWords.phrases(hidden);
        if (hide.isEmpty() || texts.isEmpty()) return PostWords.Verdict.NO_MATCH;
        List<String> folded = new ArrayList<>();
        for (String text : texts) folded.add(PostWords.fold(text));
        for (String phrase : PostWords.phrases(kept)) {
            for (String text : folded) if (text.contains(PostWords.fold(phrase))) return PostWords.Verdict.KEEP;
        }
        for (String phrase : hide) {
            for (String text : folded) if (text.contains(PostWords.fold(phrase))) return PostWords.Verdict.HIDE;
        }
        return PostWords.Verdict.NO_MATCH;
    }

    /**
     * #58: with 1,000 phrases in each list, a 10 KB post is judged in well under a 60 Hz frame
     * (16.7 ms) at the 95th percentile, from rules built once for every post, and the verdict is
     * the one plain contains reaches. The phones run the same corpus through app_process.
     */
    @Test
    public void aThousandPhrasesJudgeATenKilobytePostWithinAFrame() {
        String hide = WordsCorpus.hide();
        String keep = WordsCorpus.keep();
        List<String> post = Collections.singletonList(WordsCorpus.post());
        assertEquals(10 * 1024, post.get(0).length());
        PostWords.Rules rules = PostWords.rules(hide, keep);
        assertEquals(PostWords.Verdict.NO_MATCH, naive(hide, keep, post));
        assertEquals(PostWords.Verdict.NO_MATCH, rules.judge(post));
        // One phrase at the very end still hides it, and one keep phrase still keeps it.
        String phrase = PostWords.phrases(hide).get(999);
        assertEquals(PostWords.Verdict.HIDE, rules.judge(Collections.singletonList(post.get(0) + phrase)));
        assertEquals(PostWords.Verdict.KEEP, rules.judge(Arrays.asList(post.get(0) + phrase,
                PostWords.phrases(keep).get(0))));

        long[] took = new long[200];
        for (int warm = 0; warm < 50; warm++) rules.judge(post);
        for (int run = 0; run < took.length; run++) {
            long start = System.nanoTime();
            assertSame(rules, PostWords.rules(hide, keep));
            rules.judge(post);
            took[run] = System.nanoTime() - start;
        }
        Arrays.sort(took);
        long p95 = took[(int) Math.ceil(took.length * 0.95) - 1];
        assertTrue("p95 " + p95 / 1000 + " us", p95 < 16_700_000L);
    }

    @Test
    public void theFoldedListsAreKeptUntilEitherChanges() {
        PostWords.Rules first = PostWords.rules("spoiler", "team");
        assertSame(first, PostWords.rules("spoiler", "team"));
        assertFalse(first == PostWords.rules("spoiler", "teams"));
        assertFalse(first == PostWords.rules("spoilers", "team"));
    }
}
