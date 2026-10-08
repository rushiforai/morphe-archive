/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

import com.facebook.graphql.model.GraphQLStory;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Pattern lines in the word lists: what the matcher reads and refuses, that it agrees with Java's
 * own regex on the syntax it shares, that no pattern can hang a post, and how the word filter
 * counts a pattern apart from a word.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostPatternTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    enum Category { ORGANIC }

    /** The count of hidden posts is the process's, and other test classes in this JVM hide posts too. */
    @Before
    public void forgetHiddenPosts() {
        PostWords.forgetForTests();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_POSTS_WITH_WORDS.resetToDefault();
        Settings.HIDDEN_WORDS.resetToDefault();
        Settings.KEPT_WORDS.resetToDefault();
        PostText.cachedMembers = null;
        PostWords.forgetForTests();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static PostPattern.Result find(String pattern, String text) throws PostPattern.Invalid {
        return PostPattern.compile(pattern).find(text, new PostPattern.Budget(PostWords.STEPS_PER_POST));
    }

    @Test
    public void theEverydaySyntaxMatchesAsJavaDoes() throws Exception {
        String[][] cases = {
                {"colou?r", "My COLOR is"}, {"colou?r", "colouur"}, {"^spoiler", "x\nSpoiler alert"},
                {"^spoiler", "a spoiler"}, {"end$", "the end\nnext"}, {"\\bcat\\b", "concat"}, {"\\bcat\\b", "a cat!"},
                {"[0-9]{3}-[0-9]{4}", "call 555-1234"}, {"a{2,3}b", "aab"}, {"a{2,3}b", "ab"}, {"a{2,}b", "aaaab"},
                {"(?:foo|bar)baz", "xbarbaz"}, {"[^a-z]+", "abc"}, {"[^a-z]+", "abcD1"}, {"\\d+\\s*%", "50 %"},
                {"crypto|bitcoin|nft", "Buy NFTs now"}, {"é+", "CAFÉ"}, {"\\w+ing", "läuft running"},
                {"a.c", "a\nc"}, {"a.c", "abc"}, {"(a|ab)(c|bcd)d", "abcd"}, {"(a*)*b", "aaaa"}, {"[\\d,]+", "1,000"},
                {"[a-]x", "-x"}, {"\\$\\d", "cost $5"}, {"\\u0041b", "xab"}, {"giveaways?", "GIVEAWAY!"},
                {"(?:free|cheap) (?:iphone|crypto)", "get a Free iPhone now"}, {"\\Bnet", "internet"},
        };
        int flags = Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE | Pattern.MULTILINE | Pattern.UNICODE_CHARACTER_CLASS;
        for (String[] pair : cases) {
            boolean java = Pattern.compile(pair[0], flags).matcher(pair[1]).find();
            assertEquals(pair[0] + " in " + pair[1], java ? PostPattern.Result.MATCH : PostPattern.Result.NO_MATCH,
                    find(pair[0], pair[1]));
        }
    }

    @Test
    public void aStrayBraceIsItself() throws Exception {
        assertEquals(PostPattern.Result.MATCH, find("x{", "ax{b"));
        assertEquals(PostPattern.Result.MATCH, find("a{,5}", "a{,5}"));
    }

    @Test
    public void whatItWouldReadAnotherWayIsRefused() {
        for (String pattern : Arrays.asList("(", "a)", "(?=a)", "(?!a)", "(?<=a)b", "(?<x>a)", "(?i)a", "\\1", "a*+",
                "*a", "+a", "?a", "[a", "\\p{L}", "\\A", "a{101}", "[z-a]", "\\", "[\\b]", "[a-\\d]", "\\u12")) {
            assertNull(pattern, PostPattern.compileOrNull(pattern));
        }
        assertNotNull(PostPattern.compileOrNull("a{100}"));
        // A counted repeat written out past the program's room is refused rather than truncated.
        assertNull(PostPattern.compileOrNull("(?:abcdefghij){100}(?:abcdefghij){100}(?:abcdefghij){100}"));
    }

    /**
     * Stacked repeats of a part that writes nothing, or that would write out past the program's
     * room, are refused at once. The row compiles the list on every keystroke, on the main thread,
     * and so does a settings import, so a few characters must never mean billions of steps.
     */
    @Test
    public void repeatsThatWouldTakeForeverToCompileAreRefusedAtOnce() {
        for (String pattern : Arrays.asList("(){100}{100}{100}{100}{100}", "(?:){100}{100}{100}{100}{100}",
                "(a{0}){100}{100}{100}{100}", "((){100}){100}{100}", "(|){100}{100}{100}{100}{100}",
                "(a{0}b{0}){100}{100}{100}", "()*", "(?:){0,100}", "(?:a{1}){100}{100}{100}{100}{100}",
                "((a?){100}){100}{100}{100}", "(?:(?:a|b){10}){10}{10}{10}{10}")) {
            long start = System.nanoTime();
            assertNull(pattern, PostPattern.compileOrNull(pattern));
            long millis = (System.nanoTime() - start) / 1_000_000;
            assertTrue(pattern + " took " + millis + " ms to refuse", millis < 1_000);
        }
        // The row names it on Save like any pattern it can't read, and a settings file can't carry it.
        String list = "spoiler\n/(){100}{100}{100}{100}{100}/";
        assertEquals(2, PostWords.size(list, 0).badLine);
        assertTrue(!PostWords.isClean(list));
    }

    /** Counted repeats that fit still compile and match as Java's do, nested ones and {0} included. */
    @Test
    public void countedRepeatsThatFitStillMatchAsJavaDoes() throws Exception {
        String[][] cases = {
                {"(?:ab){2,3}c", "xababc"}, {"(?:ab){2,3}c", "abc"}, {"x{0}y", "y"}, {"(a?){3}b", "ab"},
                {"(?:a*){2}b", "aab"}, {"(?:(?:a|b){10}){10}", "ab"}, {"(?:a|b){2,}c", "abbc"},
                {"colou?r{1,2}", "colorr"}, {"(?:a|){3}b", "aab"}, {"(?:(?:ab){2}){3}", "abababababab"},
        };
        int flags = Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE | Pattern.MULTILINE | Pattern.UNICODE_CHARACTER_CLASS;
        for (String[] pair : cases) {
            boolean java = Pattern.compile(pair[0], flags).matcher(pair[1]).find();
            assertEquals(pair[0] + " in " + pair[1], java ? PostPattern.Result.MATCH : PostPattern.Result.NO_MATCH,
                    find(pair[0], pair[1]));
        }
        // The largest that fits: 1999 instructions, and the match makes 2000.
        assertNotNull(PostPattern.compileOrNull("(?:abcdefghij){100}(?:abcdefghij){99}abcdefghi"));
        assertNull(PostPattern.compileOrNull("(?:abcdefghij){100}(?:abcdefghij){99}abcdefghij"));
    }

    /** Backtracking patterns that take Java's own matcher longer than any test runs finish here. */
    @Test
    public void noPatternHangsALongPost() throws Exception {
        StringBuilder text = new StringBuilder();
        for (int i = 0; i < 60_000; i++) text.append('a');
        for (String evil : Arrays.asList("(a+)+b", "(a|a)*c", "(a|aa)+$b", "(.*a){20}x", "(\\w+\\s?)+z")) {
            long start = System.nanoTime();
            PostPattern.Result result = find(evil, text.toString());
            long millis = (System.nanoTime() - start) / 1_000_000;
            assertTrue(evil + " answered " + result, result != PostPattern.Result.MATCH);
            assertTrue(evil + " took " + millis + " ms", millis < 5_000);
        }
    }

    @Test
    public void aBudgetRunsOutAsTooSlowRatherThanAnAnswer() throws Exception {
        PostPattern pattern = PostPattern.compile("(?:a|b)*c");
        assertEquals(PostPattern.Result.TOO_SLOW, pattern.find("ababababababab", new PostPattern.Budget(10)));
        assertEquals(PostPattern.Result.NO_MATCH, pattern.find("ababababababab", new PostPattern.Budget(10_000)));
    }

    /**
     * A position whose character can't begin a match costs no step, so a long post with no first
     * letter of the pattern in it fits a small budget, while a pattern that can match nothing at
     * all, and a character past ASCII, are still tried everywhere.
     */
    @Test
    public void aPositionThatCantStartAMatchCostsNothing() throws Exception {
        StringBuilder xs = new StringBuilder();
        for (int i = 0; i < 5_000; i++) xs.append('x');
        assertEquals(PostPattern.Result.NO_MATCH, PostPattern.compile("\\b(abc|abd)\\b").find(xs, new PostPattern.Budget(10)));
        assertEquals(PostPattern.Result.MATCH,
                PostPattern.compile("\\b(abc|abd)\\b").find(xs + " abd", new PostPattern.Budget(1_000)));
        assertEquals("a pattern that can match nothing", PostPattern.Result.MATCH,
                PostPattern.compile("x*").find("", new PostPattern.Budget(10)));
        assertEquals(PostPattern.Result.MATCH, PostPattern.compile("x*$").find(xs, new PostPattern.Budget(1_000_000)));
        assertEquals("a letter past ASCII", PostPattern.Result.MATCH,
                PostPattern.compile("été").find("un ÉTÉ doux", new PostPattern.Budget(1_000)));
        assertEquals("a class", PostPattern.Result.MATCH, PostPattern.compile("[0-9]+ ok").find(xs + " 42 ok", new PostPattern.Budget(1_000)));
    }

    @Test
    public void randomPatternsAgreeWithJava() throws Exception {
        Random random = new Random(7);
        String[] atoms = {"a", "b", "c", ".", "[ab]", "[^a]", "\\d", "(?:ab|c)", "\\bb", "1"};
        String[] quantifiers = {"", "", "*", "+", "?", "{1,2}", "{2}"};
        String[] letters = {"a", "b", "c", "1", " ", "A", "B"};
        int flags = Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE | Pattern.MULTILINE | Pattern.UNICODE_CHARACTER_CLASS;
        for (int round = 0; round < 2000; round++) {
            StringBuilder pattern = new StringBuilder();
            for (int i = 1 + random.nextInt(4); i > 0; i--) {
                pattern.append(atoms[random.nextInt(atoms.length)]).append(quantifiers[random.nextInt(quantifiers.length)]);
                if (random.nextInt(6) == 0) pattern.append('|');
            }
            if (pattern.charAt(pattern.length() - 1) == '|') pattern.append('c');
            StringBuilder text = new StringBuilder();
            for (int i = random.nextInt(12); i > 0; i--) text.append(letters[random.nextInt(letters.length)]);
            boolean java = Pattern.compile(pattern.toString(), flags).matcher(text).find();
            assertEquals(pattern + " in '" + text + "'", java ? PostPattern.Result.MATCH : PostPattern.Result.NO_MATCH,
                    find(pattern.toString(), text.toString()));
        }
    }

    @Test
    public void aLineBetweenSlashesIsAPatternAndABadOneIsLeftOut() {
        assertEquals("colou?r", PostWords.patternBody("/colou?r/"));
        assertNull("too short to be a pattern", PostWords.patternBody("/a/"));
        assertNull(PostWords.patternBody("//"));
        assertNull(PostWords.patternBody("/half"));
        assertEquals(Arrays.asList("/colou?r/", "spoiler", "/a/"), PostWords.phrases("/colou?r/\n/(oops/\nspoiler\n/a/"));
        assertEquals(1, PostWords.leftOut("/colou?r/\n/(oops/\nspoiler"));
        assertTrue(PostWords.isClean("/colou?r/\nspoiler"));
        assertTrue("a settings file can't carry a pattern the row would refuse",
                !PostWords.isClean("/colou?r/\n/(oops/"));
        StringBuilder longest = new StringBuilder("/");
        for (int i = 0; i < PostWords.MAX_PATTERN_LENGTH; i++) longest.append('a');
        assertEquals(1, PostWords.count(longest + "/"));
        assertEquals(0, PostWords.count(longest + "a/"));
    }

    @Test
    public void theRowRefusesABadPatternByLineAndTooManyPatterns() {
        PostWords.Size bad = PostWords.size("spoiler\n/fine+/\n/(oops/\n/[also/", 0);
        assertEquals(3, bad.badLine);
        assertTrue(!bad.fits());
        StringBuilder many = new StringBuilder();
        for (int i = 0; i <= PostWords.MAX_PATTERNS; i++) many.append("/word").append(i).append("/\n");
        PostWords.Size tooMany = PostWords.size(many.toString(), 0);
        assertEquals(PostWords.MAX_PATTERNS + 1, tooMany.patterns);
        assertTrue(tooMany.tooManyPatterns());
        assertTrue(!tooMany.fits());
        assertEquals("a store's patterns past the most are left out", PostWords.MAX_PATTERNS,
                PostWords.count(many.toString()));
        PostWords.Size fine = PostWords.size("spoiler\n/fine+/\n/fine+/", 0);
        assertEquals(1, fine.patterns);
        assertEquals(0, fine.badLine);
        assertTrue(fine.fits());
    }

    @Test
    public void patternsJudgeAfterWordsAndAKeepPatternWins() {
        List<String> text = Collections.singletonList("A spoilers thread");
        assertEquals(PostWords.Verdict.HIDE_PATTERN, PostWords.rules("/spoilers?/", "").judge(text));
        assertEquals(PostWords.Verdict.HIDE, PostWords.rules("thread\n/spoilers?/", "").judge(text));
        assertEquals(PostWords.Verdict.KEEP_PATTERN, PostWords.rules("/spoilers?/", "/\\bthread\\b/").judge(text));
        assertEquals(PostWords.Verdict.KEEP, PostWords.rules("/spoilers?/", "thread").judge(text));
        assertEquals(PostWords.Verdict.NO_MATCH, PostWords.rules("/^spoiler/", "").judge(text));
        StringBuilder huge = new StringBuilder();
        for (int i = 0; i < 300_000; i++) huge.append('a');
        assertEquals(PostWords.Verdict.TOO_SLOW,
                PostWords.rules("/(?:a|aa|aaa|aaaa|aaaaa)*b/", "").judge(Collections.singletonList(huge.toString())));
    }

    /** The filter on: a pattern hides a post and is counted as a pattern; off and paused are stock. */
    @Test
    public void theGuardHidesByPatternAndCountsItsKind() {
        Settings.HIDDEN_WORDS.save("/give ?aways?/");
        GraphQLStory story = new GraphQLStory();
        Object message = FeedGuardForTests.postText("Big GIVEAWAY today");
        assertTrue(!FeedGuardForTests.hidesByWords(Category.ORGANIC, story, message));
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        assertTrue(FeedGuardForTests.hidesByWords(Category.ORGANIC, story, message));
        assertEquals(1, PostWords.hiddenSinceStart());
        String line = null;
        for (String reported : FeedFilterCounters.report()) {
            if (reported.startsWith(FeedFilter.WORDS_ROUTE + ": ")) line = reported;
        }
        assertEquals(FeedFilter.WORDS_ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: hide pattern. "
                + "Removed: hide pattern 1. Kinds: hide pattern 1", line);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertTrue(!FeedGuardForTests.hidesByWords(Category.ORGANIC, story, message));
    }
}
