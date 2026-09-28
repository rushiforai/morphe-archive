/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.facebook.graphql.model.GraphQLStory;
import com.facebook.graphql.modelutil.BaseModelWithTree;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The word filter in the shared feed guard: a phrase from the hide list in a post's own words, or
 * in the post it shares, hides it; a phrase from the keep list keeps it; a post with no words, or
 * with a part that can't be read, stays. It counts on a route of its own with shapes only, and
 * reads nothing of a post while its switch is off, its hide list is empty or Hushfacebook is paused.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostWordsRuleTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    enum Category { ORGANIC, SPONSORED }

    /** Stands in for an accessor the patch fills in: a model per story, and how often it was asked. */
    private static final class Answers implements StoryFlag.Accessor {
        private final Map<Object, Object> models = new IdentityHashMap<>();
        private final Object otherwise;
        int calls;

        Answers(Object otherwise) {
            this.otherwise = otherwise;
        }

        Answers with(Object story, Object model) {
            models.put(story, model);
            return this;
        }

        @Override
        public Object model(Object story) {
            calls++;
            Object model = models.containsKey(story) ? models.get(story) : otherwise;
            if (model instanceof RuntimeException) throw (RuntimeException) model;
            return model;
        }
    }

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
        Settings.HIDE_SPONSORED_POSTS.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        PostText.cachedMembers = null;
        PostWords.forgetForTests();
        FeedFilterCounters.clear();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    private static boolean guard(Object category, Object unit, StoryFlag.Accessor message, StoryFlag.Accessor attached) {
        return FeedFilter.hideEdge(category, unit, true, true, story -> null, false, GenAiLabel.PATCHED, false,
                ShowcaseType.PATCHED, true, message, attached);
    }

    /** The guard for a story whose message holds [text] and which shares nothing. */
    private static boolean guard(String text) {
        return guard(Category.ORGANIC, new GraphQLStory(), new Answers(FeedGuardForTests.postText(text)), new Answers(null));
    }

    private static void listen(String hide, String keep) {
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        Settings.HIDDEN_WORDS.save(hide);
        Settings.KEPT_WORDS.save(keep);
    }

    /** The line the word filter's route wrote, or null when the rule never ran. */
    private static String wordsLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(FeedFilter.WORDS_ROUTE + ": ")) return line;
        }
        return null;
    }

    private static String feedLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(FeedFilter.FEED_ROUTE + ": ")) return line;
        }
        return null;
    }

    /** The keys are the ones read from Facebook 577 and 580. The patch's own test pins the same numbers. */
    @Test
    public void theKeysAreTheOnesFacebookUses() {
        assertEquals(0xdb1d8904, PostText.TEXT_TYPE_TAG);
        assertEquals(0x36452d, PostText.TEXT_KEY);
        assertEquals(0x38eb0007, PostText.MESSAGE_FIELD.hashCode());
    }

    @Test
    public void theSwitchStartsOffAndTheListsStartEmpty() {
        assertFalse(Settings.HIDE_POSTS_WITH_WORDS.defaultValue);
        assertEquals("", Settings.HIDDEN_WORDS.defaultValue);
        assertEquals("", Settings.KEPT_WORDS.defaultValue);
    }

    @Test
    public void aPostWithAListedPhraseIsHidden() {
        listen("spoiler\ngiveaway", "");
        BaseModelWithTree message = FeedGuardForTests.postText("Huge SPOILER for tonight");
        Answers answers = new Answers(message);

        assertTrue(guard(Category.ORGANIC, new GraphQLStory(), answers, new Answers(null)));
        assertEquals("the message was asked for once", 1, answers.calls);
        assertEquals(FeedFilter.FEED_ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: word filter. "
                + "Removed: word filter 1. Kinds: ORGANIC 1", feedLine());
        assertEquals(FeedFilter.WORDS_ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: hide word. "
                + "Removed: hide word 1. Kinds: hide word 1", wordsLine());
        assertEquals(1, PostWords.hiddenSinceStart());
    }

    /** The control for the one above: the same post without the phrase stays. */
    @Test
    public void aPostWithoutOneStays() {
        listen("spoiler", "");
        assertFalse(guard("Nothing to see here"));
        assertEquals(FeedFilter.WORDS_ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: no match 1", wordsLine());
        assertEquals(0, PostWords.hiddenSinceStart());
    }

    @Test
    public void aKeepPhraseWinsInThePostOrInTheOneItShares() {
        listen("spoiler", "my team");
        assertFalse(guard("A spoiler about my team"));

        GraphQLStory shared = new GraphQLStory();
        GraphQLStory story = new GraphQLStory(shared);
        Answers messages = new Answers(null)
                .with(story, FeedGuardForTests.postText("MY TEAM, again"))
                .with(shared, FeedGuardForTests.postText("spoiler inside"));
        assertFalse(guard(Category.ORGANIC, story, messages, new Answers(null).with(story, shared)));
        assertEquals(FeedFilter.WORDS_ROUTE + ": 2 lists, 2 items, 0 removed. Kinds: keep word 2", wordsLine());
    }

    @Test
    public void aSharedPostsWordsCountToo() {
        listen("spoiler", "");
        GraphQLStory shared = new GraphQLStory();
        GraphQLStory story = new GraphQLStory(shared);
        Answers messages = new Answers(null).with(shared, FeedGuardForTests.postText("spoiler inside"));
        assertTrue("a share with no words of its own, of a post with the phrase",
                guard(Category.ORGANIC, story, messages, new Answers(null).with(story, shared)));
    }

    /**
     * A post with no words, or one with a part that can't be read, stays and says why: a keep
     * phrase could be in the part that wasn't read.
     */
    @Test
    public void missingOrUnreadableTextKeepsThePostAndSaysWhy() {
        listen("spoiler", "");
        GraphQLStory story = new GraphQLStory();
        Answers none = new Answers(null);

        assertFalse("no message", guard(Category.ORGANIC, story, none, none));
        assertFalse("an empty message", guard(""));
        assertFalse("a message of spaces", guard("  \n "));
        BaseModelWithTree otherType = new BaseModelWithTree(StoryFlag.typeTag("XFBTextWithEntities"))
                .with(PostText.TEXT_FIELD, "spoiler");
        assertFalse("a model of another type", guard(Category.ORGANIC, story, new Answers(otherType), none));
        assertFalse("a model that isn't a tree", guard(Category.ORGANIC, story, new Answers(new Object()), none));
        assertFalse("a message accessor that throws",
                guard(Category.ORGANIC, story, new Answers(new IllegalStateException()), none));
        assertFalse("a message accessor never filled in", guard(Category.ORGANIC, story, PostText.MESSAGE, none));
        Answers spoiler = new Answers(FeedGuardForTests.postText("spoiler"));
        assertFalse("a shared post accessor that throws",
                guard(Category.ORGANIC, story, spoiler, new Answers(new IllegalStateException())));
        assertFalse("a shared post accessor never filled in", guard(Category.ORGANIC, story, spoiler, PostText.ATTACHED));
        GraphQLStory shared = new GraphQLStory();
        Answers sharedUnreadable = new Answers(FeedGuardForTests.postText("spoiler")).with(shared, new Object());
        assertFalse("a shared post whose text can't be read",
                guard(Category.ORGANIC, story, sharedUnreadable, new Answers(null).with(story, shared)));
        assertFalse("not a story", guard(Category.ORGANIC, new Object(), spoiler, none));
        assertFalse("no feed unit", guard(Category.ORGANIC, null, spoiler, none));

        assertEquals(FeedFilter.WORDS_ROUTE + ": 12 lists, 12 items, 0 removed. Kinds: no text 3, "
                        + "accessor not patched 2, ambiguous: text not a tree model 2, read failed 2, "
                        + "ambiguous: text of another type 1, no feed unit 1, not a story 1",
                wordsLine());
        assertEquals(0, PostWords.hiddenSinceStart());
        List<String> misses = HookStatus.missing(FamilyNames.POST_WORDS);
        assertTrue(misses.toString(), misses.contains("method com.facebook.graphql.model.GraphQLStory#the message accessor"));
        assertTrue(misses.toString(), misses.contains("method com.facebook.graphql.model.GraphQLStory#the attached_story accessor"));
    }

    /** Off, with the hide list empty, or paused, the rule asks nothing of the post. */
    @Test
    public void offEmptyOrPausedTheRuleReadsNothing() {
        Settings.HIDDEN_WORDS.save("spoiler");
        Answers answers = new Answers(FeedGuardForTests.postText("spoiler"));
        assertFalse("switch off", guard(Category.ORGANIC, new GraphQLStory(), answers, answers));
        assertEquals(0, answers.calls);
        assertNull("the rule counted a post with its switch off", wordsLine());

        listen("", "my team");
        assertFalse("hide list empty", guard(Category.ORGANIC, new GraphQLStory(), answers, answers));
        assertEquals(0, answers.calls);
        assertEquals(FeedFilter.WORDS_ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: no words listed 1", wordsLine());

        listen("spoiler", "");
        FeedFilterCounters.clear();
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            assertFalse(why + " hid a post", guard(Category.ORGANIC, new GraphQLStory(), answers, answers));
            assertEquals(why + " asked the accessor", 0, answers.calls);
        }
        assertNull(wordsLine());
        PauseForTests.resume();
        assertTrue("the rule didn't come back after the pause",
                guard(Category.ORGANIC, new GraphQLStory(), answers, new Answers(null)));
    }

    /** Without the patch the rule doesn't run whatever the switch says, and the public guard is that. */
    @Test
    public void anUnpatchedBuildHidesNothing() {
        listen("spoiler", "");
        Answers answers = new Answers(FeedGuardForTests.postText("spoiler"));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new GraphQLStory(), true, true, story -> null, false,
                GenAiLabel.PATCHED, false, ShowcaseType.PATCHED, false, answers, answers));
        assertEquals(0, answers.calls);
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new GraphQLStory()));
        assertNull(wordsLine());
    }

    /** A post an earlier rule already hid isn't read. */
    @Test
    public void anEarlierRuleWins() {
        listen("spoiler", "");
        Answers answers = new Answers(FeedGuardForTests.postText("spoiler"));
        assertTrue(guard(Category.SPONSORED, new GraphQLStory(), answers, answers));
        assertEquals(0, answers.calls);
        assertNull(wordsLine());
    }

    /**
     * Nothing of a post's words or of a phrase reaches the diagnostic report, the log or Hook
     * status, with Debug logging on: only the shapes and the counts do.
     */
    @Test
    public void noWordOrPhraseReachesTheReport() {
        BaseSettings.DEBUG.save(true);
        listen("zanzibarquux\nmangosteen", "pomegranatekeep");
        assertTrue(guard("I spotted a ZANZIBARQUUX"));
        assertFalse(guard("pomegranatekeep and mangosteen"));
        assertFalse(guard("plain words only, xylophonic"));
        assertFalse(guard(Category.ORGANIC, new GraphQLStory(), new Answers(new IllegalStateException()), new Answers(null)));

        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains(FeedFilter.WORDS_ROUTE + ": 4 lists, 4 items, 1 removed"));
        assertTrue(report, report.contains(FamilyNames.POST_WORDS + ": invoked 4"));
        for (String secret : Arrays.asList("zanzibarquux", "mangosteen", "pomegranatekeep", "xylophonic", "spotted")) {
            assertFalse("the report carries " + secret + ":\n" + report, report.toLowerCase().contains(secret));
        }
    }

    /**
     * A build missing a member the reader needs keeps every post, and the Hook status row names
     * what's missing. The control, with every member there, reports three found.
     */
    @Test
    public void theReportSaysWhetherTheReaderFoundWhatItNeeds() {
        listen("spoiler", "");
        guard(Category.ORGANIC, new GraphQLStory(), new Answers(null), new Answers(null));
        List<String> found = HookStatus.report();
        assertTrue(String.join("\n", found), found.contains(FamilyNames.POST_WORDS + ": invoked 1, 3 found, 0 missing"));

        HookStatus.clear();
        FeedFilterCounters.clear();
        PostText.Members complete = PostText.Members.lookUp(PostText.class.getClassLoader());
        PostText.cachedMembers = new PostText.Members(complete.story, complete.treeModel, null, complete.typeTag);
        assertFalse(guard("spoiler"));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.POST_WORDS + ": invoked 1, 2 found, 1 missing. "
                + "First missing: method com.facebook.graphql.modelutil.BaseModelWithTree#getCachedString(int)"));
        assertEquals(FeedFilter.WORDS_ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: reader missing 1", wordsLine());
    }
}
