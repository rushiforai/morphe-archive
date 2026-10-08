/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.facebook.graphql.model.GraphQLFeedback;
import com.facebook.graphql.model.GraphQLMedia;
import com.facebook.graphql.model.GraphQLStory;
import com.facebook.graphql.model.GraphQLStoryAttachment;
import com.facebook.graphql.modelutil.BaseModelWithTree;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Map;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The reaction ceiling in the shared feed guard: a post with more reactions than the ceiling is
 * hidden, read from the feed unit's own feedback; a post at or under it stays, and so does one
 * whose count can't be read. Off reads nothing, paused is stock, and the report counts the ceiling
 * under its own reason beside the other rules'.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostReactionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    enum Category { ORGANIC }

    enum Style { PHOTO }

    /** Stands in for the two accessors the patch fills in: a feedback per story, reactors per feedback. */
    private static final class Stand {
        final Map<Object, Object> feedbacks = new IdentityHashMap<>();
        final Map<Object, Object> reactors = new IdentityHashMap<>();
        int calls;

        /** A story whose feedback says [count] reactions. */
        GraphQLStory post(int count) {
            BaseModelWithTree model = new BaseModelWithTree(0);
            model.number("count", count);
            GraphQLStory story = new GraphQLStory();
            GraphQLFeedback feedback = new GraphQLFeedback();
            feedbacks.put(story, feedback);
            reactors.put(feedback, model);
            return story;
        }

        PostTypes.Readers readers() {
            return new PostTypes.Readers(story -> null, attachment -> null, story -> null, story -> {
                calls++;
                Object feedback = feedbacks.get(story);
                if (feedback instanceof RuntimeException) throw (RuntimeException) feedback;
                return feedback;
            }, feedback -> {
                calls++;
                Object model = reactors.get(feedback);
                if (model instanceof RuntimeException) throw (RuntimeException) model;
                return model;
            });
        }
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_POSTS_OVER_REACTIONS.resetToDefault();
        Settings.HIDE_POSTS_WITH_WORDS.resetToDefault();
        Settings.HIDDEN_WORDS.resetToDefault();
        Settings.HIDE_PHOTO_POSTS.resetToDefault();
        PostText.cachedMembers = null;
        PostWords.forgetForTests();
        FeedFilterCounters.clear();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    private static boolean guard(Object unit, PostTypes.Readers readers) {
        return guard(unit, story -> null, readers);
    }

    private static boolean guard(Object unit, StoryFlag.Accessor message, PostTypes.Readers readers) {
        return FeedFilter.hideEdge(Category.ORGANIC, unit, true, true, story -> null, false, GenAiLabel.PATCHED, false,
                ShowcaseType.PATCHED, true, message, story -> null, story -> null, null, null, readers);
    }

    private static String line(String route) {
        for (String reported : FeedFilterCounters.report()) {
            if (reported.startsWith(route + ": ")) return reported;
        }
        return null;
    }

    /** The keys are the GraphQL names' hashes, read from Facebook 577, 580 and 581. */
    @Test
    public void theKeysAreTheOnesFacebookUses() {
        assertEquals(94851343, PostReactions.COUNT_KEY);
        assertEquals("com.facebook.graphql.model.GraphQLFeedback", GraphQLFeedback.class.getName());
        assertEquals(PostReactions.FEEDBACK_CLASS, GraphQLFeedback.class.getName());
    }

    @Test
    public void theChoicesAreTheCountsTheListOffers() {
        assertEquals(ReactionCeiling.OFF, Settings.HIDE_POSTS_OVER_REACTIONS.defaultValue);
        assertFalse(ReactionCeiling.OFF.exceeds(5_000_000));
        assertTrue(ReactionCeiling.K1.exceeds(1_001));
        assertFalse("at the ceiling stays", ReactionCeiling.K1.exceeds(1_000));
        assertFalse(ReactionCeiling.K1.exceeds(999));
        assertFalse("an unread count is never above", ReactionCeiling.K1.exceeds(PostReactions.UNREAD));
        for (ReactionCeiling ceiling : ReactionCeiling.values()) {
            assertEquals(ceiling, ReactionCeiling.fromFile(ceiling.fileValue));
        }
        assertNull(ReactionCeiling.fromFile("2000"));
        assertNull(ReactionCeiling.fromFile(null));
        assertNull(ReactionCeiling.fromFile(1000));
    }

    @Test
    public void offReadsNothingAndHidesNothing() {
        Stand stand = new Stand();
        assertFalse(guard(stand.post(9_999_999), stand.readers()));
        assertEquals("nothing was read with the ceiling off", 0, stand.calls);
        assertNull(line(PostReactions.ROUTE));
    }

    @Test
    public void aPostAboveTheCeilingGoesAndOneAtOrBelowStays() {
        Stand stand = new Stand();
        Settings.HIDE_POSTS_OVER_REACTIONS.save(ReactionCeiling.K1);
        assertTrue("above", guard(stand.post(1_001), stand.readers()));
        assertFalse("at the ceiling", guard(stand.post(1_000), stand.readers()));
        assertFalse("below", guard(stand.post(999), stand.readers()));
        assertFalse("nobody reacted", guard(stand.post(0), stand.readers()));
        String route = line(PostReactions.ROUTE);
        assertNotNull(route);
        assertTrue(route, route.contains("4 lists, 4 items, 1 removed"));
        assertTrue(route, route.contains("Removed: reaction ceiling 1"));
        assertTrue(route, route.contains("under the ceiling 3"));
        String feed = line(FeedFilter.FEED_ROUTE);
        assertNotNull(feed);
        assertTrue(feed, feed.contains("Removed: reaction ceiling 1"));

        Settings.HIDE_POSTS_OVER_REACTIONS.save(ReactionCeiling.K100);
        assertFalse("under a higher ceiling", guard(stand.post(99_999), stand.readers()));
        assertTrue(guard(stand.post(100_001), stand.readers()));
    }

    @Test
    public void aPostWhoseCountCantBeReadStays() {
        Settings.HIDE_POSTS_OVER_REACTIONS.save(ReactionCeiling.K1);
        Stand stand = new Stand();

        // No accessor filled in, as on a build without the anchors.
        assertFalse(guard(stand.post(5_000), new PostTypes.Readers(story -> null, a -> null, f -> null)));
        // The accessor throws.
        GraphQLStory throwing = new GraphQLStory();
        stand.feedbacks.put(throwing, new IllegalStateException("tree gone"));
        assertFalse(guard(throwing, stand.readers()));
        // The post's native tree is gone.
        assertFalse(guard(stand.post(5_000).released(), stand.readers()));
        // Not a story.
        assertFalse(guard(new Object(), stand.readers()));
        // No feedback, and no reactors: nobody reacted.
        assertFalse(guard(new GraphQLStory(), stand.readers()));
        GraphQLStory quiet = new GraphQLStory();
        stand.feedbacks.put(quiet, new GraphQLFeedback());
        assertFalse(guard(quiet, stand.readers()));
        // Feedback that isn't a GraphQLFeedback.
        GraphQLStory odd = new GraphQLStory();
        stand.feedbacks.put(odd, "feedback");
        assertFalse(guard(odd, stand.readers()));
        // Reactors that aren't a tree model.
        GraphQLStory plain = new GraphQLStory();
        GraphQLFeedback feedback = new GraphQLFeedback();
        stand.feedbacks.put(plain, feedback);
        stand.reactors.put(feedback, "reactors");
        assertFalse(guard(plain, stand.readers()));
        // Reactors whose tree is gone.
        GraphQLStory gone = new GraphQLStory();
        GraphQLFeedback goneFeedback = new GraphQLFeedback();
        BaseModelWithTree goneModel = new BaseModelWithTree(0);
        goneModel.number("count", 9_999);
        goneModel.releasedTree();
        stand.feedbacks.put(gone, goneFeedback);
        stand.reactors.put(goneFeedback, goneModel);
        assertFalse(guard(gone, stand.readers()));
        assertFalse("a released model was read", goneModel.readAfterRelease);

        String route = line(PostReactions.ROUTE);
        assertNotNull(route);
        assertTrue(route, route.contains("0 removed"));
        assertTrue(route, route.contains("accessor not patched 1"));
        assertTrue(route, route.contains("read failed 3"));
        assertTrue(route, route.contains("tree released 2"));
        assertTrue(route, route.contains("not a story 1"));
        assertTrue(route, route.contains("no feedback 1"));
        assertTrue(route, route.contains("no reactors 1"));
    }

    /**
     * The count reader and GraphQLFeedback are looked up once rather than for every post, and a
     * tree model class without the reader is remembered as missing rather than asked again.
     */
    @Test
    public void theCountReaderAndTheFeedbackClassAreLookedUpOnce() {
        PostReactions.forgetLookupsForTests();
        try {
            Stand stand = new Stand();
            Settings.HIDE_POSTS_OVER_REACTIONS.save(ReactionCeiling.K1);
            int hidden = 0;
            for (int i = 0; i < 20; i++) {
                if (guard(stand.post(i % 2 == 0 ? 2_000 : 10), stand.readers())) hidden++;
            }
            assertEquals("the reads stopped working", 10, hidden);
            assertEquals("one lookup for the reader and one for the feedback class", 2, PostReactions.LOOKUPS.get());

            PostReactions.forgetLookupsForTests();
            assertNull(PostReactions.cachedInt(Object.class));
            assertNull(PostReactions.cachedInt(Object.class));
            assertEquals("a missing reader was looked up again", 1, PostReactions.LOOKUPS.get());
            assertNotNull(PostReactions.cachedInt(BaseModelWithTree.class));
            assertNotNull(PostReactions.cachedInt(BaseModelWithTree.class));
            assertEquals(2, PostReactions.LOOKUPS.get());
        } finally {
            PostReactions.forgetLookupsForTests();
        }
    }

    @Test
    public void pausedFacebookKeepsEveryPost() {
        Stand stand = new Stand();
        Settings.HIDE_POSTS_OVER_REACTIONS.save(ReactionCeiling.K1);
        assertTrue(guard(stand.post(2_000), stand.readers()));
        PauseForTests.pause(app.morphe.extension.shared.settings.HushfacebookPause.Reason.SWITCH);
        int before = stand.calls;
        assertFalse(guard(stand.post(2_000), stand.readers()));
        assertEquals("a paused Facebook read nothing", before, stand.calls);
    }

    /** The report tells the ceiling's posts apart from the words, patterns and kinds that hid others. */
    @Test
    public void theReportCountsEachKindOfRuleUnderItsOwnReason() {
        Stand stand = new Stand();
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        Settings.HIDDEN_WORDS.save("spoiler\n/giv\\w+away/");
        Settings.HIDE_PHOTO_POSTS.save(true);
        Settings.HIDE_POSTS_OVER_REACTIONS.save(ReactionCeiling.K1);

        PostTypes.Readers readers = new PostTypes.Readers(
                story -> story instanceof GraphQLStory ? ((GraphQLStory) story).A0n() : null,
                attachment -> Collections.singletonList(Style.PHOTO), story -> null,
                story -> stand.feedbacks.get(story), feedback -> stand.reactors.get(feedback));
        StoryFlag.Accessor nothing = story -> null;

        assertTrue(guard(new GraphQLStory(), story -> FeedGuardForTests.postText("Big SPOILER inside"), readers));
        assertTrue(guard(new GraphQLStory(), story -> FeedGuardForTests.postText("a giveaway today"), readers));
        assertTrue(guard(new GraphQLStory(null, new GraphQLStoryAttachment(new GraphQLMedia("Photo"))), nothing, readers));
        assertTrue(guard(stand.post(2_500), nothing, readers));

        String feed = line(FeedFilter.FEED_ROUTE);
        assertNotNull(feed);
        assertTrue(feed, feed.contains("4 removed"));
        for (String reason : new String[] {"word filter 2", "photo post 1", "reaction ceiling 1"}) {
            assertTrue(feed + " lacks " + reason, feed.contains(reason));
        }
    }
}
