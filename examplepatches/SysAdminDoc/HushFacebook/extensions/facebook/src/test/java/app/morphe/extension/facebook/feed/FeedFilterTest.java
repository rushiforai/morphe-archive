/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.facebook.graphql.model.GraphQLPagesYouMayLikeFeedUnit;
import com.facebook.graphql.model.GraphQLStory;
import com.facebook.graphql.modelutil.BaseModelWithTree;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.util.Collections;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/** The rules the shared feed guard asks about each edge. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FeedFilterTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for GraphQLFeedStoryCategory: only the constant names matter to the rule. */
    enum Category { ORGANIC, SPONSORED, PROMOTION, INJECTED_STORY, ENGAGEMENT, ENGAGEMENT_QP, FB_SHORTS, FB_SHORTS_FALLBACK, END_OF_FEED_REELS, FB_STORIES }

    @After
    public void restoreSwitches() {
        Settings.HIDE_SPONSORED_POSTS.resetToDefault();
        Settings.HIDE_PROMOTED_POSTS.resetToDefault();
        Settings.HIDE_SUGGESTED_POSTS.resetToDefault();
        Settings.HIDE_SUGGESTED_FOR_YOU.resetToDefault();
        Settings.HIDE_PEOPLE_YOU_MAY_KNOW.resetToDefault();
        Settings.HIDE_SUGGESTED_GROUPS.resetToDefault();
        Settings.HIDE_STORIES_YOU_MIGHT_LIKE.resetToDefault();
        Settings.HIDE_STORIES_TRAY.resetToDefault();
        Settings.HIDE_FEED_REELS.resetToDefault();
        FeedFilter.storiesTrayInBuildForTests = null;
        FeedFilterCounters.clear();
    }

    /** The guard with only the reels patch in: no story flag rule reads anything. */
    private static boolean reelsOnly(Category category, Object feedUnit, boolean reelsPatched) {
        return FeedFilter.hideEdge(category, feedUnit, false, false, story -> null, false, story -> null, reelsPatched);
    }

    /**
     * A row of reels goes under each of the three categories Facebook files one under, with the
     * patch in and the switch on (its default). A post, a story row and the reels rows of a build
     * without the patch all stay, and so do the rows once the switch is off.
     */
    @Test
    public void reelsRowsLeaveTheFeedWithTheirPatchAndSwitch() {
        assertTrue("the switch starts on", Settings.HIDE_FEED_REELS.get());
        for (Category reels : new Category[]{Category.FB_SHORTS, Category.FB_SHORTS_FALLBACK, Category.END_OF_FEED_REELS}) {
            assertTrue(reels.name(), reelsOnly(reels, new Object(), true));
            assertFalse("without the patch: " + reels, reelsOnly(reels, new Object(), false));
        }
        assertFalse("a post stays", reelsOnly(Category.ENGAGEMENT, new Object(), true));
        assertFalse("a stories row stays", reelsOnly(Category.FB_STORIES, new Object(), true));
        assertFalse("a category that is not an enum is not guessed at", FeedFilter.hideEdge(
                "FB_SHORTS", new Object(), false, false, story -> null, false, story -> null, true));

        Settings.HIDE_FEED_REELS.save(false);
        assertFalse("the switch off keeps the rows", reelsOnly(Category.FB_SHORTS, new Object(), true));
    }

    /** A hidden row counts under its category, so a report says how many of each went. */
    @Test
    public void aHiddenReelsRowCountsUnderItsCategory() {
        reelsOnly(Category.FB_SHORTS, new Object(), true);
        reelsOnly(Category.FB_SHORTS, new Object(), true);
        reelsOnly(Category.END_OF_FEED_REELS, new Object(), true);
        reelsOnly(Category.ENGAGEMENT, new Object(), true);
        String report = String.join("\n", FeedFilterCounters.report());
        assertTrue(report, report.contains(FeedFilter.FEED_ROUTE + ": 4 lists, 4 items, 3 removed"));
        assertTrue(report, report.contains("Removed: FB_SHORTS 2, END_OF_FEED_REELS 1"));
    }

    @Test
    public void sponsoredAndPromotedEdgesAreHiddenByDefault() {
        assertTrue(FeedFilter.hiddenCategory(Category.SPONSORED));
        assertTrue(FeedFilter.hiddenCategory(Category.PROMOTION));
    }

    /** The mutation control: an ordinary post, or a category the rule does not know, stays. */
    @Test
    public void organicAndUnknownEdgesStay() {
        assertFalse(FeedFilter.hiddenCategory(Category.ORGANIC));
        assertFalse(FeedFilter.hiddenCategory(Category.INJECTED_STORY));
        assertFalse(FeedFilter.hiddenCategory(null));
        assertFalse("a category that is not an enum is not guessed at", FeedFilter.hiddenCategory("SPONSORED"));
    }

    @Test
    public void eachSwitchTurnsItsCategoryBackOn() {
        Settings.HIDE_PROMOTED_POSTS.save(false);
        assertTrue(FeedFilter.hiddenCategory(Category.SPONSORED));
        assertFalse(FeedFilter.hiddenCategory(Category.PROMOTION));

        Settings.HIDE_SPONSORED_POSTS.save(false);
        assertFalse(FeedFilter.hiddenCategory(Category.SPONSORED));
    }

    @Test
    public void aSuggestedUnitIsRecognisedByItsKeptClass() {
        assertTrue(FeedFilter.isSuggested(new GraphQLPagesYouMayLikeFeedUnit()));
        assertFalse(FeedFilter.isSuggested(new Object()));
        assertFalse(FeedFilter.isSuggested(null));
    }

    /**
     * No patch flipped the status flags in a test JVM, so the shared guard must leave every edge
     * alone: a feed filter only acts for the patches that were selected.
     */
    @Test
    public void anUnpatchedBuildHidesNothing() {
        assertFalse(FeedFilter.hideEdge(Category.SPONSORED, new GraphQLPagesYouMayLikeFeedUnit()));
    }

    /** With both patches in, the guard hides by category first and by unit type second. */
    @Test
    public void thePatchedGuardHidesByCategoryAndByUnit() {
        assertTrue(FeedFilter.hideEdge(Category.SPONSORED, new Object(), true, false));
        assertFalse("the suggested rule belongs to its own patch",
                FeedFilter.hideEdge(Category.ORGANIC, new GraphQLPagesYouMayLikeFeedUnit(), true, false));
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, new GraphQLPagesYouMayLikeFeedUnit(), false, true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new Object(), true, true));
    }

    /**
     * Every edge is counted before a rule runs, and a hidden one records why, so a diagnostic
     * report shows the guard ran even on a build where no patch switched a rule on.
     */
    @Test
    public void everyEdgeIsCountedAndEveryHiddenOneSaysWhy() {
        FeedFilterCounters.clear();
        FeedFilter.hideEdge(Category.ORGANIC, new Object(), true, true);
        FeedFilter.hideEdge(Category.SPONSORED, new Object(), true, true);
        FeedFilter.hideEdge(Category.ORGANIC, new GraphQLPagesYouMayLikeFeedUnit(), true, true);
        FeedFilter.hideEdge(Category.SPONSORED, null);

        String report = String.join("\n", FeedFilterCounters.report());
        assertTrue(report, report.contains(FeedFilter.FEED_ROUTE + ": 4 lists, 4 items, 2 removed"));
        assertTrue(report, report.contains("Last reason: GraphQLPagesYouMayLikeFeedUnit"));
        assertTrue(report, report.contains("Kinds: ORGANIC 2, SPONSORED 2"));
    }

    /**
     * A build that carries none of the suggested unit classes hides nothing under that switch, and
     * the report says so: the model package moved. The control, with the class there, reports it
     * found. A clear starts a new Hook status row, and the classes are reported into it again.
     */
    @Test
    public void theReportSaysWhetherTheSuggestedUnitsAreInThisBuild() throws Exception {
        Field cache = FeedFilter.class.getDeclaredField("suggestedClasses");
        cache.setAccessible(true);
        LogBufferManager.clearLogBuffer();
        try {
            cache.set(null, new Class<?>[0]);
            assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new Object(), true, true));
            String report = LogBufferManager.buildExportText();
            // The three found are the members the recommendation flag is read through.
            assertTrue(report, report.contains("Hide suggested and promoted posts: invoked 1, 3 found, 1 missing. "
                    + "First missing: class com.facebook.graphql.model#any suggested feed unit"));
            assertTrue(report, report.contains("Hide sponsored posts: invoked 1, 0 found, 0 missing"));

            cache.set(null, null);
            LogBufferManager.clearLogBuffer();
            assertTrue(FeedFilter.hideEdge(Category.ORGANIC, new GraphQLPagesYouMayLikeFeedUnit(), true, true));
            assertTrue(String.join("\n", HookStatus.report()),
                    HookStatus.report().contains("Hide suggested and promoted posts: invoked 1, 4 found, 0 missing"));
        } finally {
            cache.set(null, null);
            LogBufferManager.clearLogBuffer();
        }
    }

    /**
     * On a signed-in feed, posts from accounts nobody there followed arrived as ENGAGEMENT stories,
     * like posts from friends, and no INJECTED_STORY edge ever came. The "Suggested for you" switch
     * reads Facebook's own recommendation flag now (RecommendationRuleTest), and the category on its
     * own hides nothing.
     */
    @Test
    public void theStoryCategoryAloneNoLongerMarksASuggestedPost() {
        assertFalse(FeedFilter.hideEdge(Category.INJECTED_STORY, new Object(), false, true));
        assertFalse(FeedFilter.hideEdge(Category.INJECTED_STORY, new GraphQLStory(), false, true,
                story -> FeedGuardForTests.recommendationContext(false), false, GenAiLabel.PATCHED));
    }

    /**
     * "People you may know" has no kept class, so it's found by the GraphQL type its
     * getTypeName() answers. The type of the row's own edges, and a unit with no type, stay.
     */
    @Test
    public void peopleYouMayKnowGoesByItsTypeName() {
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow(), false, true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC,
                new TypedFeedUnit("PaginatedPeopleYouMayKnowFeedUnitUsersEdge"), false, true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit("Story"), false, true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow(), true, false));
        Settings.HIDE_PEOPLE_YOU_MAY_KNOW.save(false);
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow(), false, true));
    }

    /**
     * The suggested groups row goes by the type name its shared model answers, with its own
     * switch. What sits near it stays: a group's post (a Story), the row's own items, friend
     * requests, which the same model answers for another tag, and People you may know once its
     * switch is off. Each switch works without the other.
     */
    @Test
    public void suggestedGroupsGoByTheirTypeName() {
        assertTrue(Settings.HIDE_SUGGESTED_GROUPS.defaultValue);
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.suggestedGroups(), false, true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit("Story"), false, true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC,
                new TypedFeedUnit("GroupsYouShouldJoinFeedUnitItem"), false, true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit("FriendRequestsFeedUnit"), false, true));
        // Without the patch the rule never runs.
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.suggestedGroups(), true, false));

        Settings.HIDE_PEOPLE_YOU_MAY_KNOW.save(false);
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.suggestedGroups(), false, true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow(), false, true));

        Settings.HIDE_PEOPLE_YOU_MAY_KNOW.save(true);
        Settings.HIDE_SUGGESTED_GROUPS.save(false);
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.suggestedGroups(), false, true));
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow(), false, true));
    }

    /**
     * Facebook's own engagement cards, which is how the suggested groups row comes now (S22, 580,
     * 2026-09-29: an ENGAGEMENT_QP CustomizedStory). The promos switch hides every one. The groups
     * switch alone hides only the card whose tracking names the groups promotion, and keeps the
     * category's other cards (emulator, 580, 2026-09-30: a Meta AI discover unit), one it can't
     * read, and one naming no promotion. With both off every card stays, and so does an ENGAGEMENT
     * post, a friend's or a group's.
     */
    @Test
    public void facebooksEngagementCardsGoWithEitherSwitch() {
        Object groups = engagementCard("CustomizedStory", FeedFilter.GROUPS_PROMOTION_ID);
        Object metaAi = engagementCard("QuickPromotionNativeTemplateFeedUnit", "977392048680404");
        Object unnamed = new BaseModelWithTree("CustomizedStory") { }.with("tracking", "{\"qid\":\"1\"}");
        Object untyped = new TypedFeedUnit("CustomizedStory");
        for (Object card : new Object[] {groups, metaAi, unnamed, untyped}) {
            assertTrue(FeedFilter.hideEdge(Category.ENGAGEMENT_QP, card, false, true));
        }
        assertFalse(FeedFilter.hideEdge(Category.ENGAGEMENT, new TypedFeedUnit("Story"), false, true));
        assertFalse("without the patch the rule never runs", FeedFilter.hideEdge(Category.ENGAGEMENT_QP, groups, true, false));

        Settings.HIDE_SUGGESTED_POSTS.save(false);
        assertTrue("the groups switch alone kept the groups row", FeedFilter.hideEdge(Category.ENGAGEMENT_QP, groups, false, true));
        assertFalse("the groups switch alone took another promotion", FeedFilter.hideEdge(Category.ENGAGEMENT_QP, metaAi, false, true));
        assertFalse("a card naming no promotion went", FeedFilter.hideEdge(Category.ENGAGEMENT_QP, unnamed, false, true));
        assertFalse("a card that isn't a tree model went", FeedFilter.hideEdge(Category.ENGAGEMENT_QP, untyped, false, true));
        Settings.HIDE_SUGGESTED_GROUPS.save(false);
        assertFalse("with both switches off the card went", FeedFilter.hideEdge(Category.ENGAGEMENT_QP, groups, false, true));
        Settings.HIDE_SUGGESTED_POSTS.save(true);
        assertTrue("the promos switch alone kept the card", FeedFilter.hideEdge(Category.ENGAGEMENT_QP, metaAi, false, true));
    }

    /**
     * Facebook folds People you may know into the engagement cards too. With the promos switch off
     * it goes only with its own switch: the groups switch alone keeps it.
     */
    @Test
    public void peopleYouMayKnowInTheEngagementCardsFollowsItsOwnSwitch() {
        Settings.HIDE_SUGGESTED_POSTS.save(false);
        Settings.HIDE_PEOPLE_YOU_MAY_KNOW.save(false);
        Object people = TypedFeedUnit.peopleYouMayKnow();
        assertFalse(FeedFilter.hideEdge(Category.ENGAGEMENT_QP, people, false, true));
        Settings.HIDE_PEOPLE_YOU_MAY_KNOW.save(true);
        assertTrue(FeedFilter.hideEdge(Category.ENGAGEMENT_QP, people, false, true));
    }

    /** The promotion an engagement card's tracking names, as Facebook's feed fetch fills it in. */
    @Test
    public void promotionIdReadsTheTrackingJson() {
        assertEquals("625620278343662", FeedFilter.promotionId(engagementCard("CustomizedStory", "625620278343662")));
        assertNull(FeedFilter.promotionId(new BaseModelWithTree("CustomizedStory") { }));
        assertNull(FeedFilter.promotionId(new BaseModelWithTree("CustomizedStory") { }
                .with("tracking", "{\"quick_promotion_id\":\"")));
        assertNull(FeedFilter.promotionId(new TypedFeedUnit("CustomizedStory")));
        assertNull(FeedFilter.promotionId(null));
    }

    /** An ENGAGEMENT_QP card of [type] whose tracking names [promotion], the way the feed logs one. */
    private static BaseModelWithTree engagementCard(String type, String promotion) {
        return new BaseModelWithTree(type) { }.with("tracking", "{\"qid\":\"-6066084948626958425\",\"sty\":1351,"
                + "\"quick_promotion_id\":\"" + promotion + "\",\"qp_log\":{\"" + promotion + "\":{\"nux_id\":\"2798\"}}}");
    }

    /**
     * The groups rule fails open: a unit whose type name can't be read, or whose tree Facebook
     * already released, stays, and the live control with the same name goes. What it hid is
     * counted under the type name, on the feed's own route.
     */
    @Test
    public void suggestedGroupsFailOpenAndCountWhatTheyHid() {
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit.Unreadable(), true, true));
        BaseModelWithTree released = new BaseModelWithTree("GroupsYouShouldJoinFeedUnit") { }.released();
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, released, true, true));
        assertFalse("the guard asked a released tree its type name", released.readAfterRelease);

        FeedFilterCounters.clear();
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, new BaseModelWithTree("GroupsYouShouldJoinFeedUnit") { },
                true, true));
        FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.suggestedGroups(), true, true);
        String report = String.join("\n", FeedFilterCounters.report());
        assertTrue(report, report.contains(FeedFilter.FEED_ROUTE + ": 2 lists, 2 items, 2 removed. "
                + "Last reason: GroupsYouShouldJoinFeedUnit. Removed: GroupsYouShouldJoinFeedUnit 2."));
    }

    /**
     * A row of Stories between posts goes when the flag Facebook's Discover unit reads says it's
     * from people you aren't connected to. A row of your friends' Stories stays, and so does a
     * unit of another type carrying the same flag, a row without the patch, and every row once the
     * switch is off. The other suggested rows keep their own switches.
     */
    @Test
    public void storiesYouMightLikeGoByTheirFlag() {
        assertTrue(Settings.HIDE_STORIES_YOU_MIGHT_LIKE.defaultValue);
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(true), false, true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(false), false, true));
        BaseModelWithTree tray = new BaseModelWithTree("StoriesTrayFeedUnit") { }
                .with(FeedFilter.UNCONNECTED_STORIES_FLAG, true);
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, tray, false, true));
        assertEquals("the flag is only read on a Discover unit", 0, tray.reads);
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(true), true, false));

        Settings.HIDE_STORIES_YOU_MIGHT_LIKE.save(false);
        BaseModelWithTree unread = FeedGuardForTests.storiesRow(true);
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, unread, false, true));
        assertEquals("the switch off reads nothing of the row", 0, unread.reads);
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.suggestedGroups(), false, true));
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow(), false, true));
    }

    /**
     * The Stories rule fails open: a unit answering the type name that isn't a tree model, one
     * whose name can't be read, and one whose tree Facebook released all stay. Each row read is
     * counted on the rule's own route under what the read found, and a hidden one on the feed's
     * route under the type and the flag.
     */
    @Test
    public void storiesYouMightLikeFailOpenAndCountWhatTheyRead() {
        FeedFilterCounters.clear();
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit(FeedFilter.DISCOVER_UNIT_TYPE), true, true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit.Unreadable(), true, true));
        BaseModelWithTree released = FeedGuardForTests.storiesRow(true).released();
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, released, true, true));
        assertFalse("the guard asked a released tree its type name", released.readAfterRelease);
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(false), true, true));
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(true), true, true));

        String report = String.join("\n", FeedFilterCounters.report());
        assertTrue(report, report.contains(FeedFilter.STORIES_YOU_MIGHT_LIKE_ROUTE + ": 3 lists, 3 items, 1 removed. "
                + "Last reason: DiscoverFeedUnit:is_unconnected_mbsu. Removed: DiscoverFeedUnit:is_unconnected_mbsu 1. "
                + "Kinds: connected 1, not a tree model 1, unconnected 1"));
        assertTrue(report, report.contains(FeedFilter.FEED_ROUTE + ": 5 lists, 5 items, 1 removed. "
                + "Last reason: DiscoverFeedUnit:is_unconnected_mbsu."));
    }

    /**
     * The Stories tray is never an edge on a real feed: the feed's adapter list adds it as an
     * adapter of its own (StoriesTrayTest). Without Hide Stories tray in the build, a unit answering
     * its type name, should one ever come through, is left to Facebook like any other unit no rule
     * claims, with the tray's switch on. With that patch in, it goes with the rows of Stories
     * (theStoriesTraySwitchTakesTheRowsOfStoriesBetweenPosts).
     */
    @Test
    public void aStoriesTrayEdgeIsNotHiddenByTheGuard() {
        FeedFilter.storiesTrayInBuildForTests = false;
        assertTrue(Settings.HIDE_STORIES_TRAY.get());
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.storiesTray(), true, true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.storiesTray()));
        assertTrue(String.join("\n", FeedFilterCounters.report()),
                String.join("\n", FeedFilterCounters.report()).contains(FeedFilter.FEED_ROUTE + ": 2 lists, 2 items, 0 removed"));
    }

    /**
     * A row of Stories between posts with a Create story card, seen with the tray hidden (issue #45),
     * goes with the tray while Hide Stories tray is in the build and its switch is on: a row of your
     * friends' Stories, one from people you aren't connected to, and the tray itself as an edge. A
     * post stays, and every row comes back with the switch off or without the patch.
     */
    @Test
    public void theStoriesTraySwitchTakesTheRowsOfStoriesBetweenPosts() {
        FeedFilter.storiesTrayInBuildForTests = true;
        assertTrue(Settings.HIDE_STORIES_TRAY.get());
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(false), false, false));
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(true), false, false));
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.storiesTray(), false, false));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit("Story"), false, false));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit.Unreadable(), false, false));

        String report = String.join("\n", FeedFilterCounters.report());
        assertTrue(report, report.contains(FeedFilter.FEED_ROUTE + ": 5 lists, 5 items, 3 removed. "
                + "Last reason: StoriesTrayFeedUnit:stories tray. Removed: DiscoverFeedUnit:stories tray 2, "
                + "StoriesTrayFeedUnit:stories tray 1."));

        Settings.HIDE_STORIES_TRAY.save(false);
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(false), false, false));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.storiesTray(), false, false));
        Settings.HIDE_STORIES_TRAY.resetToDefault();
        FeedFilter.storiesTrayInBuildForTests = false;
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(false), false, false));
    }

    /**
     * The model's other two kinds of Stories between posts, one large tile and one person's Stories
     * in a viewer, go under the same switch and come back with it off. A unit of the model's reels
     * showcase type is the control: the tray's switch leaves it to Hide Reels in the feed.
     */
    @Test
    public void theStoriesTraySwitchTakesTheSingleTilesAndViewersOfStories() {
        FeedFilter.storiesTrayInBuildForTests = true;
        assertTrue(Settings.HIDE_STORIES_TRAY.get());
        TypedFeedUnit tile = new TypedFeedUnit("StoriesOneColumnOneRowLargeTileFeedUnit");
        TypedFeedUnit viewer = new TypedFeedUnit("StoriesSingleBucketInlineViewerFeedUnit");
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, tile, false, false));
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, viewer, false, false));
        assertNull(FeedFilter.storiesRowReason("ShowcaseFeedUnit"));

        String report = String.join("\n", FeedFilterCounters.report());
        assertTrue(report, report.contains(FeedFilter.FEED_ROUTE + ": 2 lists, 2 items, 2 removed. "
                + "Last reason: StoriesSingleBucketInlineViewerFeedUnit:stories tray. "
                + "Removed: StoriesOneColumnOneRowLargeTileFeedUnit:stories tray 1, "
                + "StoriesSingleBucketInlineViewerFeedUnit:stories tray 1."));

        Settings.HIDE_STORIES_TRAY.save(false);
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, tile, false, false));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, viewer, false, false));
        Settings.HIDE_STORIES_TRAY.resetToDefault();
        FeedFilter.storiesTrayInBuildForTests = false;
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, tile, false, false));
    }

    /**
     * With "Stories you might like" on as well, a row from people you aren't connected to keeps that
     * rule's reason, which runs first, and a row of your friends' Stories goes under the tray's.
     */
    @Test
    public void storiesYouMightLikeKeepsItsReasonBesideTheTraySwitch() {
        FeedFilter.storiesTrayInBuildForTests = true;
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(true), false, true));
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, FeedGuardForTests.storiesRow(false), false, true));

        String report = String.join("\n", FeedFilterCounters.report());
        assertTrue(report, report.contains("Removed: DiscoverFeedUnit:is_unconnected_mbsu 1, DiscoverFeedUnit:stories tray 1."));
    }

    /** A type name that can't be read, or isn't text, keeps the unit: the rules fail open. */
    @Test
    public void aUnitWhoseTypeNameCantBeReadStays() {
        assertNull(FeedFilter.typeName(new TypedFeedUnit.Unreadable()));
        assertNull(FeedFilter.typeName(new Object()));
        assertNull(FeedFilter.typeName(null));
        assertEquals("StoriesTrayFeedUnit", FeedFilter.typeName(TypedFeedUnit.storiesTray()));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new TypedFeedUnit.Unreadable(), true, true));
    }

    /**
     * A model whose native tree Facebook already released answers getTypeName() from native code
     * that no try block catches, so the guard asks isValidGraphServicesJNIModel() first and keeps
     * the unit without asking its name. The control, with the tree still there, reads the name and
     * hides the row.
     */
    @Test
    public void aReleasedTreeIsNeverAskedItsTypeName() {
        BaseModelWithTree released = new BaseModelWithTree("PaginatedPeopleYouMayKnowFeedUnit") { }.released();
        assertNull(FeedFilter.typeName(released));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, released, true, true));
        assertFalse("the guard asked a released tree its type name", released.readAfterRelease);

        BaseModelWithTree live = new BaseModelWithTree("PaginatedPeopleYouMayKnowFeedUnit") { };
        assertEquals("PaginatedPeopleYouMayKnowFeedUnit", FeedFilter.typeName(live));
        assertTrue(FeedFilter.hideEdge(Category.ORGANIC, live, true, true));
    }

    /**
     * Every rule that hides counts under its own reason, so a report says how many posts each one
     * took out: the total and whichever rule fired last couldn't. Rules run several times each, in
     * a mixed order, and a kept post adds nothing to any of them.
     */
    @Test
    public void eachRuleCountsWhatItHid() {
        FeedFilterCounters.clear();
        StoryFlag.Accessor recommended = story -> FeedGuardForTests.recommendationContext(true);
        for (int i = 0; i < 3; i++) {
            FeedFilter.hideEdge(Category.SPONSORED, new Object(), true, true);
            FeedFilter.hideEdge(Category.ORGANIC, new GraphQLStory(), true, true, recommended, false,
                    GenAiLabel.PATCHED);
        }
        FeedFilter.hideEdge(Category.PROMOTION, new Object(), true, true);
        FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow(), true, true);
        FeedFilter.hideEdge(Category.ORGANIC, new GraphQLPagesYouMayLikeFeedUnit(), true, true);
        FeedFilter.hideEdge(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow(), true, true);
        FeedFilter.hideEdge(Category.ORGANIC, new Object(), true, true);

        String report = String.join("\n", FeedFilterCounters.report());
        assertTrue(report, report.contains(FeedFilter.FEED_ROUTE + ": 11 lists, 11 items, 10 removed. "
                + "Last reason: PaginatedPeopleYouMayKnowFeedUnit. Removed: SPONSORED 3, "
                + "is_in_feed_recommendation_story 3, PaginatedPeopleYouMayKnowFeedUnit 2, "
                + "GraphQLPagesYouMayLikeFeedUnit 1, PROMOTION 1. Kinds: ORGANIC 7, SPONSORED 3, PROMOTION 1"));
    }

    /**
     * An edge Facebook swaps into the feed in another's place never passes the funnel, so the swap
     * asks the same guard: a sponsored edge stays out with its patch in and its switch on, and an
     * ordinary one, or any edge of a build without the patch, goes in. Every swap counts on its own
     * route under its category and as a news feed post too, so a report says whether swaps happen.
     */
    @Test
    public void aSwappedInEdgeGetsTheFeedGuardsVerdictAndIsCounted() {
        assertTrue(FeedFilter.hideSwappedEdge(Category.SPONSORED, new Object(), true, false));
        assertFalse("an ordinary post goes in", FeedFilter.hideSwappedEdge(Category.ORGANIC, new Object(), true, false));
        assertFalse("without the patch", FeedFilter.hideSwappedEdge(Category.SPONSORED, new Object(), false, false));
        assertTrue(FeedFilter.hideSwappedEdge(Category.ORGANIC, new GraphQLPagesYouMayLikeFeedUnit(), false, true));

        String report = String.join("\n", FeedFilterCounters.report());
        assertTrue(report, report.contains(FeedFilter.SWAP_ROUTE + ": 4 lists, 4 items, 2 removed. "
                + "Last reason: ORGANIC swap skipped. Removed: ORGANIC swap skipped 1, SPONSORED swap skipped 1. "
                + "Kinds: ORGANIC 2, SPONSORED 2"));
        assertTrue(report, report.contains(FeedFilter.FEED_ROUTE + ": 4 lists, 4 items, 2 removed. "
                + "Last reason: GraphQLPagesYouMayLikeFeedUnit."));

        Settings.HIDE_SPONSORED_POSTS.save(false);
        assertFalse("the switch off lets it in", FeedFilter.hideSwappedEdge(Category.SPONSORED, new Object(), true, false));
    }

    /**
     * With the sponsored patch in, Hook status counts each swap on that patch's line, kept or
     * skipped, beside the runs the guard itself counts there. Without it the line says nothing of
     * swaps.
     */
    @Test
    public void aSwapIsCountedOnTheSponsoredPostsHookStatusLine() {
        HookStatus.clear();
        try {
            FeedFilter.hideSwappedEdge(Category.SPONSORED, new Object(), true, false);
            FeedFilter.hideSwappedEdge(Category.ORGANIC, new Object(), true, false);
            FeedFilter.hideSwappedEdge(Category.SPONSORED, new Object(), true, false);
            assertEquals(Collections.singletonList("Hide sponsored posts: invoked 3, 0 found, 0 missing. "
                    + "Counted: " + FeedFilter.SWAP_SKIPPED + " 2, " + FeedFilter.SWAP_KEPT + " 1"), HookStatus.report());

            HookStatus.clear();
            FeedFilter.hideSwappedEdge(Category.SPONSORED, new Object(), false, false);
            assertEquals(Collections.emptyList(), HookStatus.report());
        } finally {
            HookStatus.clear();
        }
    }
}