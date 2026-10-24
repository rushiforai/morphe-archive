/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.tumblr.rumblr.model.SponsoredState;
import com.tumblr.rumblr.model.TimelineObject;
import com.tumblr.rumblr.model.TimelineObjectType;
import com.tumblr.rumblr.model.post.DisplayType;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** What Hide ads and the suggestion card switches take out of a page of posts, and what they leave. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TimelineFilterTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void everyPatchIsIn() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        // Another test class's filter runs may have emptied a page in this sandbox already.
        TimelinePaging.resetForTests();
    }

    @After
    public void restore() {
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.HIDE_ADS.resetToDefault();
        Settings.HIDE_SUGGESTED_BLOGS.resetToDefault();
        Settings.HIDE_SUGGESTED_COMMUNITIES.resetToDefault();
        Settings.HIDE_SUGGESTED_TAGS.resetToDefault();
        Settings.HIDE_WATCH_IT_ROWS.resetToDefault();
        TimelineFilter.carouselItemsForTests = null;
        TimelinePaging.resetForTests();
        PauseForTests.resume();
        HookStatus.clear();
    }

    /** Tumblr's load types, by the names its own enum gives them. */
    private enum Load { AUTO_REFRESH, USER_REFRESH, RESUME, PAGINATION }

    /** One way a page reaches the filter: the response Tumblr parsed it for. */
    private interface Feed {
        List<?> load(List<?> page);
    }

    @Test
    public void everyAdKindIsTakenOutAndThePostsAroundItStayInOrder() {
        for (String type : TimelineFilter.AD_TYPES) {
            List<Object> page = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.valueOf(type)),
                    TimelineItems.post());
            List<?> shown = TimelineFilter.filter(page);
            assertEquals(type, 2, shown.size());
            assertSame(page.get(0), shown.get(0));
            assertSame(page.get(2), shown.get(1));
        }
    }

    @Test
    public void aPostTumblrLabelsSponsoredIsTakenOut() {
        List<Object> page = Arrays.asList(TimelineItems.sponsoredPost(), TimelineItems.post());
        List<?> shown = TimelineFilter.filter(page);
        assertEquals(1, shown.size());
        assertSame(page.get(1), shown.get(0));
    }

    /**
     * A paid Blaze post is a plain post the server tells Tumblr to show as sponsored, by its display
     * type, its display block or both, and Tumblr draws the server's "Sponsored with Blaze" line on
     * it. Each way goes and the posts around it stay in order, and with the switch off it stays.
     */
    @Test
    public void aPostServedAsAPaidPlacementIsTakenOut() {
        List<TimelineObject> paid = Arrays.asList(
                TimelineItems.postServed(null, DisplayType.SPONSORED),
                TimelineItems.postServed(SponsoredState.UNKNOWN, DisplayType.SPONSORED),
                TimelineItems.postServed(SponsoredState.NOT_SPONSORED, DisplayType.SPONSORED),
                TimelineItems.postServed(SponsoredState.SPONSORED, null),
                TimelineItems.postServed(SponsoredState.SPONSORED, DisplayType.NORMAL));
        for (TimelineObject item : paid) {
            List<Object> page = Arrays.asList(TimelineItems.post(), item, TimelineItems.post());
            assertEquals(Arrays.asList(page.get(0), page.get(2)), TimelineFilter.filter(page));
        }
        String report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains("ad removed 5"));

        Settings.HIDE_ADS.save(false);
        List<Object> page = Arrays.asList(TimelineItems.post(), paid.get(0), TimelineItems.post());
        assertSame(page, TimelineFilter.filter(page));
    }

    /**
     * A post served any other way stays: one from a blog you follow, a recommendation, Tumblr's own
     * promotion, and one whose display block says it isn't sponsored. Whether the post is blazed
     * doesn't come into it, so the same post on its own blog or from a blog you follow stays too.
     */
    @Test
    public void aPostServedAnyOtherWayStays() {
        List<Object> page = Arrays.asList(
                TimelineItems.postServed(null, null),
                TimelineItems.postServed(null, DisplayType.NORMAL),
                TimelineItems.postServed(SponsoredState.NOT_SPONSORED, null),
                TimelineItems.postServed(SponsoredState.UNKNOWN, DisplayType.NORMAL),
                TimelineItems.postServed(SponsoredState.NOT_SPONSORED, DisplayType.RECOMMENDATION),
                TimelineItems.postServed(null, DisplayType.IN_HOUSE),
                TimelineItems.postServed(SponsoredState.UNKNOWN, DisplayType.TRACK_SILENTLY));
        assertSame(page, TimelineFilter.filter(page));
    }

    @Test
    public void paidHeaderIconsRemovePostsWithoutAnyTimelineSponsoredFlag() {
        TimelineObject blaze = TimelineItems.postWithHeader("blaze", false, false);
        TimelineObject sponsored = TimelineItems.postWithHeader("money-alt", false, false);
        TimelineObject organic = TimelineItems.organicBlazedPost();
        List<Object> page = Arrays.asList(organic, blaze, TimelineItems.post(), sponsored);
        assertEquals(Arrays.asList(organic, page.get(2)), TimelineFilter.filter(page));
        String report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains("ad removed 2"));
        Settings.HIDE_ADS.save(false);
        assertSame(page, TimelineFilter.filter(page));
        Settings.HIDE_ADS.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertSame(page, TimelineFilter.filter(page));
    }

    @Test
    public void followedEditableAndUnknownHeaderContextsStay() {
        List<Object> page = Arrays.asList(
                TimelineItems.postWithHeader("blaze", true, false),
                TimelineItems.postWithHeader("blaze", false, true),
                TimelineItems.postWithHeader("money-alt", true, false),
                TimelineItems.postWithHeader("money-alt", false, true),
                TimelineItems.postWithHeader(null, false, false),
                TimelineItems.postWithHeader("star", false, false),
                TimelineItems.postWithHeader("BLAZE", false, false),
                TimelineItems.postWithHeader("new-paid-icon", false, false),
                TimelineItems.blazed(TimelineItems.postWithHeader("blaze", false, false)));
        assertSame(page, TimelineFilter.filter(page));
    }

    @Test
    public void paidIconsWithDefaultedOwnershipMetadataStay() {
        List<Object> page = Arrays.asList(
                TimelineItems.postWithHeader("blaze", false, false, false),
                TimelineItems.postWithHeader("money-alt", false, false, false),
                TimelineItems.postWithHeader("blaze", true, false, false),
                TimelineItems.postWithHeader("money-alt", false, true, false));
        assertSame(page, TimelineFilter.filter(page));
    }

    @Test
    public void anUnreadableHeaderIsKeptAndReported() {
        TimelineObject broken = new TimelineObject(new TimelineItems.Post(null, null, null, null, null) {
            @Override public String hushHeaderIcon() { throw new IllegalStateException("unreadable"); }
        }, false);
        List<Object> page = Arrays.asList(broken, TimelineItems.postWithHeader("blaze", false, false));
        assertEquals(Arrays.asList(broken), TimelineFilter.filter(page));
        assertTrue(String.join("\n", HookStatus.report("")).contains("timeline item"));
    }

    /**
     * Your own Blaze dashboard lists your campaigns as BLAZED_POST items, built through the same
     * page, so Hide ads leaves the whole list as Tumblr built it.
     */
    @Test
    public void yourOwnBlazeCampaignListStays() {
        List<Object> page = Arrays.asList(TimelineItems.blazed(TimelineItems.post()),
                TimelineItems.blazed(TimelineItems.postWith()), TimelineItems.of(TimelineObjectType.BLAZED_POST));
        assertSame(page, TimelineFilter.filter(page));
    }

    /**
     * A blog's posts keep their own copy of the list they hand the base constructor. That copy is
     * the filtered one, and the base constructor's call, right after, hands the same list back
     * without reading the page again. A page that isn't that list is filtered as usual.
     */
    @Test
    public void aBlogsOwnCopyOfItsPostsIsFilteredOnce() {
        List<Object> page = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.GEMINI_AD),
                TimelineItems.post());
        List<?> kept = TimelineFilter.filterKept(page);
        assertEquals(Arrays.asList(page.get(0), page.get(2)), kept);
        assertSame(kept, TimelineFilter.filter(kept));
        String report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains("Hide ads: invoked 1,") && report.contains("ad removed 1"));

        List<Object> next = new ArrayList<>(page);
        assertEquals(Arrays.asList(page.get(0), page.get(2)), TimelineFilter.filter(next));
        report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains("Hide ads: invoked 2,") && report.contains("ad removed 2"));
    }

    /**
     * Between a blog's own posts, the "Like this? Follow to see more" heading over its "Follow
     * <blog>" button, a carousel of suggested blogs and the one-item form of the prompt go with Hide
     * suggested blogs, and stay with it off. A button that opens a page stays either way.
     */
    @Test
    public void aBlogsFollowPromptAndSuggestionsGoWithSuggestedBlogs() {
        List<Object> page = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.followButton(), TimelineItems.post(), TimelineItems.carousel(TimelineObjectType.CAROUSEL,
                        TimelineItems.of(TimelineObjectType.TINY_BLOG_CAROUSEL_CARD)), TimelineItems.post(),
                TimelineItems.webButton(), TimelineItems.post(), TimelineItems.of(TimelineObjectType.BLOG_FOLLOW_CTA),
                TimelineItems.of(TimelineObjectType.BLOG_SUBSCRIPTION_CTA), TimelineItems.post());
        assertSame(page, TimelineItems.onABlog(page));
        Settings.HIDE_SUGGESTED_BLOGS.save(true);
        assertEquals(Arrays.asList(page.get(0), page.get(3), page.get(5), page.get(6), page.get(7), page.get(10)),
                TimelineItems.onABlog(page));
        String report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains("heading removed 1") && report.contains("card removed 4"));
    }

    /** A page with nothing to take out comes back as the very list Tumblr built. */
    @Test
    public void postsAndOtherItemsStay() {
        List<Object> page = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.of(TimelineObjectType.UNKNOWN), "not a timeline object", null);
        assertSame(page, TimelineFilter.filter(page));
    }

    @Test
    public void nullAndEmptyPagesComeBackAsTheyWere() {
        assertNull(TimelineFilter.filter(null));
        List<Object> empty = new ArrayList<>();
        assertSame(empty, TimelineFilter.filter(empty));
    }

    @Test
    public void theSwitchOffPauseOrABuildWithoutThePatchKeepsEverything() {
        List<Object> page = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.GEMINI_AD));
        assertEquals("the control: the switch is on to start", 1, TimelineFilter.filter(page).size());

        Settings.HIDE_ADS.save(false);
        assertSame(page, TimelineFilter.filter(page));
        Settings.HIDE_ADS.save(true);

        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertSame(page, TimelineFilter.filter(page));
        PauseForTests.resume();

        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertSame(page, TimelineFilter.filter(page));
    }

    @Test
    public void beforeTheSettingsAreReadyNothingIsTakenOut() {
        List<Object> page = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.GEMINI_AD));
        SettingsContextRule.withoutContext(() -> assertSame(page, TimelineFilter.filter(page)));
    }

    /** An item whose kind can't be read stays, and the failure is in the report. */
    @Test
    public void anItemThatCantBeReadIsKept() {
        List<Object> page = Arrays.asList(TimelineItems.unreadable(), TimelineItems.of(TimelineObjectType.NIMBUS_AD));
        List<?> shown = TimelineFilter.filter(page);
        assertEquals(1, shown.size());
        assertSame(page.get(0), shown.get(0));
        String report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains("timeline item"));
    }

    @Test
    public void eachSuggestionCardGoesOnlyWithItsOwnSwitch() {
        checkCards(Settings.HIDE_SUGGESTED_BLOGS, TimelineFilter.BLOG_TYPES);
        checkCards(Settings.HIDE_SUGGESTED_COMMUNITIES, TimelineFilter.COMMUNITY_TYPES);
        checkCards(Settings.HIDE_WATCH_IT_ROWS, TimelineFilter.WATCH_IT_TYPES);
    }

    /** With every card switch off, as they start, a page of cards and headings comes back as it was. */
    @Test
    public void theCardSwitchesStartOffAndKeepEverything() {
        List<Object> page = Arrays.asList(TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.of(TimelineObjectType.BLOG_CARD), TimelineItems.of(TimelineObjectType.COMMUNITY_ROW),
                TimelineItems.of(TimelineObjectType.VIDEO_HUBS_ROW), TimelineItems.post(),
                TimelineItems.carousel(TimelineObjectType.CAROUSEL,
                        TimelineItems.of(TimelineObjectType.TAG_CAROUSEL_CARD)),
                TimelineItems.of(TimelineObjectType.SIGNPOST), TimelineItems.of(TimelineObjectType.TITLE));
        assertSame(page, TimelineFilter.filter(page));
    }

    /**
     * Every tab of a search loads its pages as a search response, and on the Blogs and Communities
     * tabs a blog or community card is what was searched for. With both switches on, their cards and
     * rows come back as the very list Tumblr built, while the same pages in a dashboard lose every
     * card.
     */
    @Test
    public void aSearchKeepsTheBlogsAndCommunitiesItFound() {
        Settings.HIDE_SUGGESTED_BLOGS.save(true);
        Settings.HIDE_SUGGESTED_COMMUNITIES.save(true);
        List<Object> blogs = Arrays.asList(TimelineItems.of(TimelineObjectType.BLOG_CARD),
                TimelineItems.of(TimelineObjectType.BLOG_ROW), TimelineItems.of(TimelineObjectType.COMPACT_BLOG_CARD));
        List<Object> communities = Arrays.asList(TimelineItems.of(TimelineObjectType.COMMUNITY_CARD),
                TimelineItems.of(TimelineObjectType.COMMUNITY_ROW));

        for (List<Object> page : Arrays.asList(blogs, communities)) {
            assertSame(page, TimelineItems.inSearchResults(page));
        }
        String report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains(TimelineFilter.KEPT_RESULT + " 3"));
        assertTrue(report, report.contains(TimelineFilter.KEPT_RESULT + " 1"));
        assertFalse(report, report.contains("card removed"));
        assertFalse(report, report.contains("heading removed"));

        assertEquals("the control: a dashboard loses them", Collections.emptyList(),
                TimelineItems.onTheDashboard(blogs));
        assertEquals("a row is a line of a list and stays", Arrays.asList(communities.get(1)),
                TimelineItems.onTheDashboard(communities));
    }

    /**
     * A search's Posts tab is the one whose pages hold posts, and there a carousel of a tag's top
     * blogs or related communities sits between the posts found, under its heading. Those go with
     * their switches as in a dashboard, the heading that ends the page with them, and all stay with
     * the switches off.
     */
    @Test
    public void aSearchsPostsTabLosesTheCardsBetweenItsPosts() {
        List<Object> posts = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.carousel(TimelineObjectType.CAROUSEL,
                        TimelineItems.of(TimelineObjectType.TINY_BLOG_CAROUSEL_CARD)),
                TimelineItems.post(), TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.carousel(TimelineObjectType.CAROUSEL, TimelineItems.of(TimelineObjectType.COMMUNITY_CARD)),
                TimelineItems.post(), TimelineItems.of(TimelineObjectType.TITLE));
        assertSame(posts, TimelineItems.inSearchResults(posts));

        Settings.HIDE_SUGGESTED_BLOGS.save(true);
        assertEquals(Arrays.asList(posts.get(0), posts.get(3), posts.get(4), posts.get(5), posts.get(6)),
                TimelineItems.inSearchResults(posts));
        Settings.HIDE_SUGGESTED_COMMUNITIES.save(true);
        assertEquals(Arrays.asList(posts.get(0), posts.get(3), posts.get(6)), TimelineItems.inSearchResults(posts));
        String report = String.join("\n", HookStatus.report(""));
        assertFalse(report, report.contains(TimelineFilter.KEPT_RESULT));
    }

    /**
     * A carousel of tags Tumblr suggests ("Check out these tags", "Explore more #tag") goes with its
     * heading, and the one that ends a page takes its heading too. A carousel of the tags you follow
     * stays, and so does a page of lone tag cards, which is a carousel loading more of itself. The
     * other card switches leave tags alone, and this one leaves their cards.
     */
    @Test
    public void aCarouselOfSuggestedTagsGoesWithItsHeading() {
        List<Object> page = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.carousel(TimelineObjectType.CAROUSEL,
                        TimelineItems.of(TimelineObjectType.TAG_CAROUSEL_CARD)),
                TimelineItems.post(), TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.carousel(TimelineObjectType.CAROUSEL,
                        TimelineItems.of(TimelineObjectType.FOLLOWED_TAG_CAROUSEL_CARD)),
                TimelineItems.of(TimelineObjectType.BLOG_CARD), TimelineItems.of(TimelineObjectType.TITLE));
        Settings.HIDE_SUGGESTED_BLOGS.save(true);
        Settings.HIDE_SUGGESTED_COMMUNITIES.save(true);
        Settings.HIDE_WATCH_IT_ROWS.save(true);
        assertEquals("the other switches", Arrays.asList(page.get(0), page.get(1), page.get(2), page.get(3),
                page.get(4), page.get(5)), TimelineItems.onTheDashboard(page));
        Settings.HIDE_SUGGESTED_BLOGS.resetToDefault();
        Settings.HIDE_SUGGESTED_COMMUNITIES.resetToDefault();
        Settings.HIDE_WATCH_IT_ROWS.resetToDefault();

        Settings.HIDE_SUGGESTED_TAGS.save(true);
        assertEquals(Arrays.asList(page.get(0), page.get(3), page.get(4), page.get(5), page.get(6)),
                TimelineItems.onTheDashboard(page));
        List<Object> more = Arrays.asList(TimelineItems.of(TimelineObjectType.TAG_CAROUSEL_CARD),
                TimelineItems.of(TimelineObjectType.TAG_CAROUSEL_CARD));
        assertSame("a carousel's own page", more, TimelineItems.onTheDashboard(more));
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertSame("paused", page, TimelineItems.onTheDashboard(page));
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.TIMELINE_ADS));
        assertSame("without the patch", page, TimelineItems.onTheDashboard(page));
    }

    /**
     * A search's Posts tab shows "Related tags" between its posts, and those go. Its Tags tab lists
     * the tags it found under their headings, a page with no posts, and keeps every item.
     */
    @Test
    public void aSearchKeepsTheTagsItFoundAndLosesTheOnesBetweenItsPosts() {
        Settings.HIDE_SUGGESTED_TAGS.save(true);
        List<Object> posts = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.carousel(TimelineObjectType.CAROUSEL,
                        TimelineItems.of(TimelineObjectType.TAG_CAROUSEL_CARD)),
                TimelineItems.post());
        assertEquals(Arrays.asList(posts.get(0), posts.get(3)), TimelineItems.inSearchResults(posts));

        List<Object> tags = Arrays.asList(TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.of(TimelineObjectType.COMMUNITY_HUB_HEADER_CARD),
                TimelineItems.of(TimelineObjectType.TITLE), TimelineItems.of(TimelineObjectType.TAG_CARDS_COLLECTION));
        assertSame(tags, TimelineItems.inSearchResults(tags));
    }

    /**
     * Between a tag's posts Tumblr asks you to share the tag, and that prompt goes. The same kind of
     * item is the message of an empty Your tags tab, a page with no posts, and it stays there, so the
     * page isn't emptied either.
     */
    @Test
    public void thePromptToShareATagGoesOnlyFromBetweenPosts() {
        Settings.HIDE_SUGGESTED_TAGS.save(true);
        List<Object> tagPage = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.SIGNPOST),
                TimelineItems.post());
        assertEquals(Arrays.asList(tagPage.get(0), tagPage.get(2)), TimelineItems.onTheDashboard(tagPage));

        HookStatus.clear();
        List<Object> yourTags = Collections.singletonList(TimelineItems.of(TimelineObjectType.SIGNPOST));
        assertSame(yourTags, TimelineItems.onTheDashboard(yourTags));
        String report = String.join("\n", HookStatus.report(""));
        assertFalse(report, report.contains(TimelinePaging.EMPTIED));
    }

    /**
     * Communities' Browse page lists a category's communities as rows, and loads them through the
     * dashboard's own response. A row is a line of that list and never a suggestion, so a page of
     * them comes back as the very list Tumblr built, heading and all, and no page is emptied. A
     * card between posts still goes.
     */
    @Test
    public void aListOfCommunitiesKeepsItsRows() {
        Settings.HIDE_SUGGESTED_COMMUNITIES.save(true);
        List<Object> category = Arrays.asList(TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.of(TimelineObjectType.COMMUNITY_ROW), TimelineItems.of(TimelineObjectType.COMMUNITY_ROW));
        HookStatus.clear();
        assertSame(category, TimelineItems.onTheDashboard(category));
        String report = String.join("\n", HookStatus.report(""));
        assertFalse(report, report.contains("card removed"));
        assertFalse(report, report.contains("heading removed"));
        assertFalse(report, report.contains(TimelinePaging.EMPTIED));

        List<Object> feed = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.COMMUNITY_CARD),
                TimelineItems.of(TimelineObjectType.COMMUNITY_ROW));
        assertEquals(Arrays.asList(feed.get(0), feed.get(2)), TimelineItems.onTheDashboard(feed));
    }

    /** The rest of the filter doesn't ask where a page came from: an ad in search results still goes. */
    @Test
    public void aSearchStillLosesItsAds() {
        Settings.HIDE_SUGGESTED_BLOGS.save(true);
        List<Object> page = Arrays.asList(TimelineItems.of(TimelineObjectType.BLOG_CARD),
                TimelineItems.of(TimelineObjectType.GEMINI_AD), TimelineItems.of(TimelineObjectType.BLOG_CARD));
        assertEquals(Arrays.asList(page.get(0), page.get(2)), TimelineItems.inSearchResults(page));
    }

    /**
     * The cards go from each response that's a feed: the dashboard's, a blog's posts and likes. A
     * page built under no response the filter knows keeps them, and the report says so.
     */
    @Test
    public void theCardsGoOnlyFromAPageKnownToBeAFeed() {
        Settings.HIDE_SUGGESTED_BLOGS.save(true);
        List<Object> page = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.BLOG_CARD));
        List<Object> left = Arrays.asList(page.get(0));
        assertEquals(left, TimelineItems.onTheDashboard(page));
        assertEquals(left, TimelineItems.onABlog(page));
        assertEquals(left, TimelineItems.inLikes(page));
        assertEquals("the blogs beside a dashboard's card", left, TimelineItems.besideABlogCard(page, false));
        List<Object> related = Arrays.asList(TimelineItems.of(TimelineObjectType.BLOG_CARD),
                TimelineItems.of(TimelineObjectType.BLOG_CARD));
        assertSame("the blogs beside a search result", related, TimelineItems.besideABlogCard(related, true));

        HookStatus.clear();
        assertSame(page, TimelineFilter.filter(page));
        String report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains(TimelineFilter.KEPT_UNKNOWN + " 1"));
    }

    /**
     * How the filter reads the call stack: a search adapter anywhere on it means results, a feed's
     * adapter without one means a feed, and a class that only looks like one means neither.
     */
    @Test
    public void thePageIsKnownByTheAdapterParsingIt() {
        String search = PageSource.SEARCH_RESULTS;
        assertEquals(7, PageSource.FEEDS.size());
        for (String feed : PageSource.FEEDS) {
            assertEquals(feed, PageSource.FEED, PageSource.of(frames("okhttp3.Call", feed, "app.Hook")));
            assertEquals(feed, PageSource.RESULTS, PageSource.of(frames(search, feed)));
            assertEquals(feed, PageSource.RESULTS, PageSource.of(frames(feed, search)));
        }
        assertEquals(PageSource.RESULTS, PageSource.of(frames(search)));
        assertEquals(PageSource.UNKNOWN, PageSource.of(frames()));
        assertEquals(PageSource.UNKNOWN, PageSource.of(frames("com.tumblr.rumblr.model.TimelineJsonAdapter",
                "com.tumblr.rumblr.response.PostNotesResponseJsonAdapter",
                "com.tumblr.rumblr.response.SearchResultsResponse", search + "$Companion",
                "com.tumblr.rumblr.response.WrappedTimelineResponse")));
    }

    private static StackTraceElement[] frames(String... owners) {
        StackTraceElement[] frames = new StackTraceElement[owners.length];
        for (int i = 0; i < owners.length; i++) frames[i] = new StackTraceElement(owners[i], "fromJson", null, -1);
        return frames;
    }

    @Test
    public void aCarouselGoesByItsFirstItem() {
        Settings.HIDE_SUGGESTED_BLOGS.save(true);
        Object blogs = TimelineItems.carousel(TimelineObjectType.CAROUSEL,
                TimelineItems.of(TimelineObjectType.TINY_BLOG_CAROUSEL_CARD),
                TimelineItems.of(TimelineObjectType.TINY_BLOG_CAROUSEL_CARD));
        Object avatars = TimelineItems.carousel(TimelineObjectType.AVATAR_CAROUSEL,
                TimelineItems.of(TimelineObjectType.BLOG_CARD));
        Object posts = TimelineItems.carousel(TimelineObjectType.CAROUSEL, TimelineItems.post(),
                TimelineItems.of(TimelineObjectType.BLOG_CARD));
        Object empty = TimelineItems.carousel(TimelineObjectType.CAROUSEL);
        List<Object> page = Arrays.asList(blogs, TimelineItems.post(), avatars, posts, empty);
        List<?> shown = TimelineItems.onTheDashboard(page);
        assertEquals(Arrays.asList(page.get(1), posts, empty), shown);
    }

    /** Without the patch's bridge the stub answers nothing, so every carousel stays. */
    @Test
    public void aCarouselWhoseItemsCantBeReadStays() {
        Settings.HIDE_SUGGESTED_BLOGS.save(true);
        Object blogs = TimelineItems.carousel(TimelineObjectType.CAROUSEL,
                TimelineItems.of(TimelineObjectType.BLOG_CARD));
        TimelineFilter.carouselItemsForTests = null;
        List<Object> page = Arrays.asList(blogs, TimelineItems.post());
        assertSame(page, TimelineItems.onTheDashboard(page));
    }

    /**
     * A heading goes with the card after it, one before a post stays, and one ending the page goes
     * while a card switch is on, since its card may start the next page.
     */
    @Test
    public void aHeadingGoesWithTheCardItIntroduces() {
        Settings.HIDE_SUGGESTED_COMMUNITIES.save(true);
        List<Object> page = Arrays.asList(TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.of(TimelineObjectType.TITLE), TimelineItems.of(TimelineObjectType.COMMUNITY_CARD),
                TimelineItems.post(), TimelineItems.of(TimelineObjectType.TITLE), TimelineItems.post(),
                TimelineItems.of(TimelineObjectType.TITLE));
        List<?> shown = TimelineItems.onTheDashboard(page);
        assertEquals(Arrays.asList(page.get(3), page.get(4), page.get(5)), shown);
        String report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains("heading removed 3"));
        assertTrue(report, report.contains("card removed 1"));
    }

    /** With only Hide ads on, a heading before an ad goes with it and one ending the page stays. */
    @Test
    public void withOnlyHideAdsAHeadingEndingThePageStays() {
        List<Object> page = Arrays.asList(TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.of(TimelineObjectType.GEMINI_AD), TimelineItems.post(),
                TimelineItems.of(TimelineObjectType.TITLE));
        List<?> shown = TimelineFilter.filter(page);
        assertEquals(Arrays.asList(page.get(2), page.get(3)), shown);
    }

    /** A community's own header card heads that community's page, so it isn't a suggestion. */
    @Test
    public void aCommunitysOwnHeaderCardStays() {
        Settings.HIDE_SUGGESTED_COMMUNITIES.save(true);
        List<Object> page = Arrays.asList(TimelineItems.of(TimelineObjectType.COMMUNITY_HUB_HEADER_CARD),
                TimelineItems.post());
        assertSame(page, TimelineItems.onTheDashboard(page));
    }

    /**
     * A page whose items all go comes back empty, and Tumblr takes an empty page for the end of the
     * feed. On the dashboard, a blog, likes and search alike, the fragment is told to load the next
     * page while the page came with a next link, for its first page and for a later one, and to do
     * as Tumblr does when it came with none or kept a post.
     */
    @Test
    public void aPageWhoseItemsAllGoSendsTheFeedOnToItsNextPage() {
        List<Object> ads = Arrays.asList(TimelineItems.of(TimelineObjectType.GEMINI_AD), TimelineItems.sponsoredPost());
        Object next = new Object();
        List<Feed> feeds = Arrays.asList(TimelineItems::onTheDashboard, TimelineItems::onABlog,
                TimelineItems::inLikes, TimelineItems::inSearchResults);
        for (int i = 0; i < feeds.size(); i++) {
            String feed = "feed " + i;
            Object fragment = new Object();

            assertEquals(feed, Collections.emptyList(), feeds.get(i).load(ads));
            assertEquals(feed + ", its first page", TimelinePaging.NEXT,
                    TimelinePaging.onPage(fragment, Load.AUTO_REFRESH, next, true));
            assertEquals(feed, Collections.emptyList(), feeds.get(i).load(ads));
            assertEquals(feed + ", a later page", TimelinePaging.NEXT,
                    TimelinePaging.onPage(fragment, Load.PAGINATION, next, true));

            assertEquals(feed + ", a page that kept a post", TimelinePaging.STOCK,
                    TimelinePaging.onPage(fragment, Load.PAGINATION, next, false));
            assertEquals(feed + ", a later page with no next link", TimelinePaging.STOCK,
                    TimelinePaging.onPage(fragment, Load.PAGINATION, null, true));
            assertEquals(feed + ", a first page with no next link", TimelinePaging.STOCK,
                    TimelinePaging.onPage(fragment, Load.USER_REFRESH, null, true));
        }
        String report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains(TimelinePaging.EMPTIED + " 8"));
        assertTrue(report, report.contains(TimelinePaging.SKIPPED + " 8"));
        assertFalse(report, report.contains(TimelinePaging.STOPPED));
    }

    /** The card switches empty a page the same way: a dashboard page of suggested blogs under a heading. */
    @Test
    public void aPageOfNothingButSuggestionsGoesOnToo() {
        Settings.HIDE_SUGGESTED_BLOGS.save(true);
        List<Object> cards = Arrays.asList(TimelineItems.of(TimelineObjectType.TITLE),
                TimelineItems.of(TimelineObjectType.BLOG_CARD), TimelineItems.of(TimelineObjectType.BLOG_CARD));
        Object fragment = new Object();
        assertEquals(Collections.emptyList(), TimelineItems.onTheDashboard(cards));
        assertEquals(TimelinePaging.NEXT, TimelinePaging.onPage(fragment, Load.PAGINATION, new Object(), true));
        String report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains(TimelinePaging.EMPTIED + " 1"));
    }

    /**
     * Five empty pages in a row end it. A run that began with a first page or a refresh has shown
     * nothing, so the fifth gets Tumblr's empty view. One that began further down a list ends the
     * way Tumblr ends a list. Each fragment counts its own pages, and a refresh starts over.
     */
    @Test
    public void fiveEmptyPagesInARowEndIt() {
        List<Object> ads = Arrays.asList(TimelineItems.of(TimelineObjectType.GEMINI_AD));
        assertEquals(Collections.emptyList(), TimelineFilter.filter(ads));
        Object next = new Object();

        Object blank = new Object();
        Object scrolled = new Object();
        assertEquals(TimelinePaging.NEXT, TimelinePaging.onPage(blank, Load.RESUME, next, true));
        assertEquals(TimelinePaging.NEXT, TimelinePaging.onPage(scrolled, Load.PAGINATION, next, true));
        for (int page = 2; page < TimelinePaging.LIMIT; page++) {
            assertEquals("page " + page, TimelinePaging.NEXT, TimelinePaging.onPage(blank, Load.PAGINATION, next, true));
            assertEquals("page " + page, TimelinePaging.NEXT,
                    TimelinePaging.onPage(scrolled, Load.PAGINATION, next, true));
        }
        assertEquals(TimelinePaging.EMPTY, TimelinePaging.onPage(blank, Load.PAGINATION, next, true));
        assertEquals(TimelinePaging.STOCK, TimelinePaging.onPage(scrolled, Load.PAGINATION, next, true));
        String report = String.join("\n", HookStatus.report(""));
        assertTrue(report, report.contains(TimelinePaging.STOPPED + " 2"));

        // A refresh in the middle of a run starts counting again.
        Object refreshed = new Object();
        for (int page = 1; page < TimelinePaging.LIMIT; page++) {
            assertEquals(TimelinePaging.NEXT,
                    TimelinePaging.onPage(refreshed, page == 1 ? Load.AUTO_REFRESH : Load.PAGINATION, next, true));
        }
        assertEquals(TimelinePaging.NEXT, TimelinePaging.onPage(refreshed, Load.USER_REFRESH, next, true));
        assertEquals(TimelinePaging.NEXT, TimelinePaging.onPage(refreshed, Load.PAGINATION, next, true));

        // And so does a page that kept something.
        assertEquals(TimelinePaging.STOCK, TimelinePaging.onPage(refreshed, Load.PAGINATION, next, false));
        for (int page = 1; page < TimelinePaging.LIMIT; page++) {
            assertEquals(TimelinePaging.NEXT, TimelinePaging.onPage(refreshed, Load.PAGINATION, next, true));
        }
        assertEquals("it began down the list this time", TimelinePaging.STOCK,
                TimelinePaging.onPage(refreshed, Load.PAGINATION, next, true));
    }

    /**
     * A blank run that reaches a page with no next link has still shown nothing, so it ends in the
     * empty view though the page arrived as a next page.
     */
    @Test
    public void aBlankRunThatReachesTheLastPageShowsTheEmptyView() {
        assertEquals(Collections.emptyList(),
                TimelineFilter.filter(Arrays.asList(TimelineItems.of(TimelineObjectType.GEMINI_AD))));
        Object fragment = new Object();
        assertEquals(TimelinePaging.NEXT, TimelinePaging.onPage(fragment, Load.AUTO_REFRESH, new Object(), true));
        assertEquals(TimelinePaging.EMPTY, TimelinePaging.onPage(fragment, Load.PAGINATION, null, true));
    }

    /**
     * Until a switch has emptied a page, every page is Tumblr's to handle, the empty ones too. Nothing
     * is counted, so the report stays as it was.
     */
    @Test
    public void whileNoPageHasBeenEmptiedEveryPageIsTumblrsOwn() {
        List<Object> page = Arrays.asList(TimelineItems.post(), TimelineItems.of(TimelineObjectType.GEMINI_AD));
        assertEquals("a page that kept a post isn't an emptied one", 1, TimelineFilter.filter(page).size());
        HookStatus.clear();
        Object fragment = new Object();
        Object next = new Object();
        for (Load type : Load.values()) {
            assertEquals(type.name(), TimelinePaging.STOCK, TimelinePaging.onPage(fragment, type, next, true));
            assertEquals(type.name(), TimelinePaging.STOCK, TimelinePaging.onPage(fragment, type, next, false));
        }
        assertEquals(Collections.emptyList(), HookStatus.report(""));
    }

    /** Paused, or before the settings are ready, an empty page is Tumblr's own again and the run is dropped. */
    @Test
    public void pausedOrBeforeTheSettingsAreReadyAnEmptyPageIsTumblrsOwn() {
        assertEquals(Collections.emptyList(),
                TimelineFilter.filter(Arrays.asList(TimelineItems.of(TimelineObjectType.GEMINI_AD))));
        Object fragment = new Object();
        Object next = new Object();
        assertEquals("the control", TimelinePaging.NEXT, TimelinePaging.onPage(fragment, Load.AUTO_REFRESH, next, true));

        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertEquals(TimelinePaging.STOCK, TimelinePaging.onPage(fragment, Load.PAGINATION, next, true));
        PauseForTests.resume();
        assertEquals("the run began again, down the list", TimelinePaging.NEXT,
                TimelinePaging.onPage(fragment, Load.PAGINATION, next, true));
        assertEquals("so with no next link it ends as Tumblr ends a list", TimelinePaging.STOCK,
                TimelinePaging.onPage(fragment, Load.PAGINATION, null, true));

        SettingsContextRule.withoutContext(() -> assertEquals(TimelinePaging.STOCK,
                TimelinePaging.onPage(fragment, Load.AUTO_REFRESH, next, true)));
    }

    /** What isn't a fragment and a load type is left to Tumblr, and nothing is thrown. */
    @Test
    public void anythingTheHookCantReadIsLeftToTumblr() {
        assertEquals(Collections.emptyList(),
                TimelineFilter.filter(Arrays.asList(TimelineItems.of(TimelineObjectType.GEMINI_AD))));
        Object next = new Object();
        assertEquals(TimelinePaging.STOCK, TimelinePaging.onPage(null, Load.PAGINATION, next, true));
        assertEquals(TimelinePaging.STOCK, TimelinePaging.onPage(new Object(), null, next, true));
        assertEquals(TimelinePaging.STOCK, TimelinePaging.onPage(new Object(), "PAGINATION", next, true));
    }

    /**
     * In a dashboard page each of [kinds] goes with [setting] on, and stays with it off, paused, or
     * without its patch's capability.
     */
    private static void checkCards(BooleanSetting setting, Set<String> kinds) {
        for (String kind : kinds) {
            // A button is a card only when it follows a blog.
            Object card = TimelineFilter.BUTTON.equals(kind) ? TimelineItems.followButton()
                    : TimelineItems.of(TimelineObjectType.valueOf(kind));
            List<Object> page = Arrays.asList(TimelineItems.post(), card, TimelineItems.post());
            assertSame(kind + " with the switch off", page, TimelineItems.onTheDashboard(page));
            setting.save(true);
            List<?> shown = TimelineItems.onTheDashboard(page);
            assertEquals(kind, Arrays.asList(page.get(0), page.get(2)), shown);
            PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
            assertSame(kind + " paused", page, TimelineItems.onTheDashboard(page));
            PauseForTests.resume();
            PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.TIMELINE_ADS));
            assertSame(kind + " without the patch", page, TimelineItems.onTheDashboard(page));
            PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
            setting.resetToDefault();
        }
    }
}
