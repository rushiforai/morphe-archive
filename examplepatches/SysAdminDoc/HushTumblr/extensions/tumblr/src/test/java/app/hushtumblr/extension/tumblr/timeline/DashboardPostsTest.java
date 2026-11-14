/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.tumblr.rumblr.model.post.blocks.ImageBlock;
import com.tumblr.rumblr.model.post.blocks.TextBlock;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.rootmute.HushAccountIdentity;
import app.hushtumblr.extension.tumblr.rootmute.HushDashboardTimeline;
import app.hushtumblr.extension.tumblr.rootmute.MatureAccountsForTests;
import app.hushtumblr.extension.tumblr.rootmute.RootPostMutes;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Hide liked posts, Hide your own reblogs and Hide reblogs of your posts act on a dashboard
 * screen's pages only. A post you open, your review queue, a Blaze list and the audio player load
 * the dashboard's response too, so parsing it keeps every post.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DashboardPostsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void everyPatchIsIn() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        Settings.HIDE_ADS.save(false);
        HookStatus.clear();
    }

    @After
    public void restore() {
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.HIDE_ADS.resetToDefault();
        Settings.HIDE_OWN_REBLOGS.resetToDefault();
        Settings.HIDE_LIKED_POSTS.resetToDefault();
        Settings.HIDE_REBLOGS_OF_YOURS.resetToDefault();
        MatureAccountsForTests.restore();
        PauseForTests.resume();
        HookStatus.clear();
    }

    /** The dashboard, or its tab held by the dashboard host. */
    private static final HushDashboardTimeline DASHBOARD = () -> true;
    /** Explore or Communities: the dashboard's tab class under another host. */
    private static final HushDashboardTimeline OTHER_TAB = () -> false;

    // The models a card's wrapper holds, as the bridge patches make them.
    private static final Object TEXT = TimelineItems.postWith(new TextBlock("hello")).getData();
    private static final Object PHOTO = TimelineItems.postWith(new ImageBlock(), new TextBlock("caption")).getData();
    private static final Object YOUR_REBLOG =
            TimelineItems.yourReblogOf(Collections.singletonList(new TextBlock("first")), new TextBlock("mine")).getData();
    private static final Object THEIR_REBLOG =
            TimelineItems.reblogOf(Collections.singletonList(new TextBlock("first")), new TextBlock("theirs")).getData();
    private static final Object YOUR_POST = TimelineItems.yourPostWith(new TextBlock("my own")).getData();
    private static final Object LIKED = TimelineItems.likedPostWith(new TextBlock("liked already")).getData();

    /** A card's wrapper, which noted [facts] of its post as it was built. */
    private static HushPostFacts wrapper(int facts) {
        return () -> facts;
    }

    /** What the dashboard page hook makes of [page] on [screen]. */
    private static List<?> shown(Object screen, List<?> page) {
        return RootPostMutes.dashboardPage(screen, page);
    }

    @Test
    public void aPostsFactsSayLikedAndYourReblogOnly() {
        assertEquals(DashboardPosts.LIKED, DashboardPosts.facts(LIKED));
        assertEquals(DashboardPosts.OWN_REBLOG, DashboardPosts.facts(YOUR_REBLOG));
        assertEquals("their reblog", 0, DashboardPosts.facts(THEIR_REBLOG));
        assertEquals("a post you made, not a reblog", 0, DashboardPosts.facts(YOUR_POST));
        assertEquals("a model without the bridges", 0, DashboardPosts.facts(new Object()));
        assertEquals("no model", 0, DashboardPosts.facts(null));
        // The facts are noted whatever the switches say, so one turned on later applies to the next page.
        assertFalse(Settings.HIDE_LIKED_POSTS.get());
        assertFalse(Settings.HIDE_OWN_REBLOGS.get());
        assertEquals(DashboardPosts.LIKED, DashboardPosts.facts(LIKED));
    }

    /**
     * Hide your own reblogs starts off. Turned on, a reblog Tumblr says you can edit leaves a
     * dashboard page, and someone else's reblog and a post you made yourself stay.
     */
    @Test
    public void hideYourOwnReblogsTakesYourReblogsOffTheDashboard() {
        List<Object> page = Arrays.asList(TEXT, YOUR_REBLOG, THEIR_REBLOG, YOUR_POST);
        assertFalse(Settings.HIDE_OWN_REBLOGS.get());
        assertSame(page, shown(DASHBOARD, page));
        Settings.HIDE_OWN_REBLOGS.save(true);
        HookStatus.clear();
        assertEquals(Arrays.asList(TEXT, THEIR_REBLOG, YOUR_POST), shown(DASHBOARD, page));
        String report = String.join(" | ", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.HIDE_OWN_REBLOGS) && report.contains("post removed 1"));
    }

    /**
     * Hide liked posts starts off. Turned on, a post Tumblr sent already liked leaves a dashboard
     * page, and the posts around it stay.
     */
    @Test
    public void hideLikedPostsTakesLikedPostsOffTheDashboard() {
        List<Object> page = Arrays.asList(TEXT, LIKED, PHOTO);
        assertFalse(Settings.HIDE_LIKED_POSTS.get());
        assertSame(page, shown(DASHBOARD, page));
        Settings.HIDE_LIKED_POSTS.save(true);
        HookStatus.clear();
        assertEquals(Arrays.asList(TEXT, PHOTO), shown(DASHBOARD, page));
        String line = "";
        for (String each : HookStatus.report()) {
            if (each.startsWith(FamilyNames.HIDE_LIKED_POSTS + ":")) line = each;
        }
        assertTrue(String.join(" | ", HookStatus.report()), line.contains("post removed 1"));
    }

    /** A card answers by what its wrapper noted, the way Tumblr's cards reach the hook. */
    @Test
    public void aCardIsJudgedByWhatItsWrapperNoted() {
        Settings.HIDE_LIKED_POSTS.save(true);
        Settings.HIDE_OWN_REBLOGS.save(true);
        HushPostFacts liked = wrapper(DashboardPosts.LIKED), yours = wrapper(DashboardPosts.OWN_REBLOG), plain = wrapper(0);
        assertEquals(Collections.singletonList(plain), shown(DASHBOARD, Arrays.asList(liked, plain, yours)));
        // An item the hook can't read a post from stays.
        Object unknown = new Object();
        List<Object> page = Arrays.asList(unknown, TEXT);
        assertSame(page, shown(DASHBOARD, page));
    }

    /**
     * A post you open, your review queue, a Blaze list, the audio player, Explore and every other
     * screen keep liked posts and your reblogs. Parsing never takes them out, even from the
     * dashboard's own response.
     */
    @Test
    public void likedPostsAndYourReblogsStayEverywhereButTheDashboard() {
        Settings.HIDE_LIKED_POSTS.save(true);
        Settings.HIDE_OWN_REBLOGS.save(true);
        List<Object> page = Arrays.asList(TEXT, LIKED, YOUR_REBLOG);
        assertSame("a permalink or any other screen", page, shown(new Object(), page));
        assertSame("Explore or Communities", page, shown(OTHER_TAB, page));
        assertSame("no screen", page, shown(null, page));
        List<Object> parsed = Arrays.asList(TimelineItems.postWith(new TextBlock("hello")),
                TimelineItems.likedPostWith(new TextBlock("liked already")),
                TimelineItems.yourReblogOf(Collections.singletonList(new TextBlock("first")), new TextBlock("mine")));
        assertSame("the dashboard's response", parsed, TimelineItems.onTheDashboard(parsed));
        assertSame("a blog", parsed, TimelineItems.onABlog(parsed));
        assertSame("likes", parsed, TimelineItems.inLikes(parsed));
        assertSame("search", parsed, TimelineItems.inSearchResults(parsed));
        assertSame("an unknown page", parsed, TimelineFilter.filter(parsed));
    }

    /** Without its patch in the build, or while paused, a switch takes nothing out. */
    @Test
    public void eachSwitchNeedsItsPatchAndStopsWhilePaused() {
        Settings.HIDE_LIKED_POSTS.save(true);
        Settings.HIDE_OWN_REBLOGS.save(true);
        List<Object> page = Arrays.asList(TEXT, LIKED, YOUR_REBLOG);
        PatchFamilyForTests.capabilities(EnumSet.complementOf(EnumSet.of(
                PatchFamily.Capability.LIKED_POSTS, PatchFamily.Capability.OWN_REBLOG_POSTS)));
        assertSame("without either patch", page, shown(DASHBOARD, page));
        PatchFamilyForTests.capabilities(EnumSet.complementOf(EnumSet.of(PatchFamily.Capability.OWN_REBLOG_POSTS)));
        assertEquals("liked posts only", Arrays.asList(TEXT, YOUR_REBLOG), shown(DASHBOARD, page));
        PatchFamilyForTests.capabilities(EnumSet.complementOf(EnumSet.of(PatchFamily.Capability.LIKED_POSTS)));
        assertEquals("your reblogs only", Arrays.asList(TEXT, LIKED), shown(DASHBOARD, page));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        assertEquals(Collections.singletonList(TEXT), shown(DASHBOARD, page));
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        try {
            assertSame("paused", page, shown(DASHBOARD, page));
        } finally {
            PauseForTests.resume();
        }
    }

    /** Tumblr takes an empty page for the end of the feed, so a page these switches empty goes on. */
    @Test
    public void aDashboardPageTheyEmptyGoesOnToTheNextPage() {
        TimelinePagingForTests.reset();
        try {
            Settings.HIDE_LIKED_POSTS.save(true);
            assertTrue(shown(DASHBOARD, Arrays.asList(LIKED, LIKED)).isEmpty());
            String report = String.join("\n", HookStatus.report());
            assertTrue(report, report.contains(TimelinePagingForTests.EMPTIED + " 1"));
        } finally {
            TimelinePagingForTests.reset();
        }
    }

    // A mutual's posts, as seen by an account whose blogs are "Me" and "side-blog".
    /** A mutual's reblog straight from your blog, of a post someone else made first. */
    private static final Object REBLOGGED_FROM_YOU = TimelineItems.reblogFromBlogs("me", "someone", false).getData();
    /** A mutual's reblog, by way of someone else, of a post your side blog made. */
    private static final Object YOUR_POST_REBLOGGED = TimelineItems.reblogFromBlogs("someone", "side-blog", false).getData();
    /** A mutual's reblog of a post that has nothing to do with you. */
    private static final Object THEIRS_REBLOGGED = TimelineItems.reblogFromBlogs("someone", "stranger", false).getData();
    /** Your own reblog of a post from your other blog: Tumblr says you can edit it. */
    private static final Object YOU_REBLOGGED_YOURSELF = TimelineItems.reblogFromBlogs("side-blog", "side-blog", true).getData();

    /** Signs in as an account whose blogs are [blogs], with Tumblr's fresh user/info. */
    private static void signedInAs(String... blogs) {
        MatureAccountsForTests.reset();
        MatureAccountsForTests.commit(TimelineItems.accountWithBlogs(blogs));
    }

    /**
     * Hide reblogs of your posts starts off. Turned on, someone else's reblog of a post from one
     * of your blogs leaves a dashboard page, whether it came straight from you or your blog made
     * the post first. A mutual's own post, their reblog of someone else's post and your own
     * reblogs stay.
     */
    @Test
    public void hideReblogsOfYourPostsTakesOtherPeoplesReblogsOfYoursOffTheDashboard() {
        signedInAs("Me", "side-blog");
        List<Object> page = Arrays.asList(TEXT, REBLOGGED_FROM_YOU, THEIRS_REBLOGGED, YOUR_POST_REBLOGGED,
                YOU_REBLOGGED_YOURSELF, YOUR_POST);
        assertFalse(Settings.HIDE_REBLOGS_OF_YOURS.get());
        assertSame(page, shown(DASHBOARD, page));
        Settings.HIDE_REBLOGS_OF_YOURS.save(true);
        HookStatus.clear();
        assertEquals(Arrays.asList(TEXT, THEIRS_REBLOGGED, YOU_REBLOGGED_YOURSELF, YOUR_POST), shown(DASHBOARD, page));
        String line = "";
        for (String each : HookStatus.report()) {
            if (each.startsWith(FamilyNames.HIDE_REBLOGS_OF_YOURS + ":")) line = each;
        }
        assertTrue(String.join(" | ", HookStatus.report()), line.contains("post removed 2"));
        // Hide your own reblogs takes your reblog out too, under its own name.
        Settings.HIDE_OWN_REBLOGS.save(true);
        assertEquals(Arrays.asList(TEXT, THEIRS_REBLOGGED, YOUR_POST), shown(DASHBOARD, page));
    }

    /**
     * Your blog's page, a post you open and every screen but the dashboard keep reblogs of your
     * posts. So does the dashboard's response as it's parsed.
     */
    @Test
    public void reblogsOfYourPostsStayEverywhereButTheDashboard() {
        signedInAs("me", "side-blog");
        Settings.HIDE_REBLOGS_OF_YOURS.save(true);
        List<Object> page = Arrays.asList(TEXT, REBLOGGED_FROM_YOU, YOUR_POST_REBLOGGED);
        assertSame("your blog, a permalink or any other screen", page, shown(new Object(), page));
        assertSame("Explore or Communities", page, shown(OTHER_TAB, page));
        assertSame("no screen", page, shown(null, page));
        List<Object> parsed = Arrays.asList(TimelineItems.postWith(new TextBlock("hello")),
                TimelineItems.reblogFromBlogs("me", "me", false));
        assertSame("the dashboard's response", parsed, TimelineItems.onTheDashboard(parsed));
        assertSame("a blog", parsed, TimelineItems.onABlog(parsed));
    }

    /**
     * Until Tumblr has the signed-in account's blogs from a fresh user/info response, or when it
     * can't read them, every post stays.
     */
    @Test
    public void withoutTheAccountsBlogsEveryPostStays() {
        Settings.HIDE_REBLOGS_OF_YOURS.save(true);
        List<Object> page = Arrays.asList(TEXT, REBLOGGED_FROM_YOU);
        MatureAccountsForTests.reset();
        assertSame("no account yet", page, shown(DASHBOARD, page));
        MatureAccountsForTests.commit((HushAccountIdentity) () -> "no-blogs-bridge");
        assertSame("an account without the blogs bridge", page, shown(DASHBOARD, page));
        signedInAs();
        assertSame("an account with no blogs", page, shown(DASHBOARD, page));
        signedInAs("me");
        assertEquals(Collections.singletonList(TEXT), shown(DASHBOARD, page));
        // A post model without the reblog source bridge stays.
        Object unbridged = new Object();
        List<Object> mixed = Arrays.asList(unbridged, TEXT);
        assertSame(mixed, shown(DASHBOARD, mixed));
    }

    /** Without its patch in the build, or while paused, Hide reblogs of your posts takes nothing out. */
    @Test
    public void hideReblogsOfYourPostsNeedsItsPatchAndStopsWhilePaused() {
        signedInAs("me");
        Settings.HIDE_REBLOGS_OF_YOURS.save(true);
        List<Object> page = Arrays.asList(TEXT, REBLOGGED_FROM_YOU);
        PatchFamilyForTests.capabilities(EnumSet.complementOf(EnumSet.of(PatchFamily.Capability.REBLOGS_OF_YOURS)));
        assertSame("without its patch", page, shown(DASHBOARD, page));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        assertEquals(Collections.singletonList(TEXT), shown(DASHBOARD, page));
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        try {
            assertSame("paused", page, shown(DASHBOARD, page));
        } finally {
            PauseForTests.resume();
        }
    }

    /** A dashboard page left empty by Hide reblogs of your posts goes on to the next one. */
    @Test
    public void aPageOfReblogsOfYourPostsGoesOnToTheNextPage() {
        TimelinePagingForTests.reset();
        try {
            signedInAs("me", "side-blog");
            Settings.HIDE_REBLOGS_OF_YOURS.save(true);
            assertTrue(shown(DASHBOARD, Arrays.asList(REBLOGGED_FROM_YOU, YOUR_POST_REBLOGGED)).isEmpty());
            String report = String.join("\n", HookStatus.report());
            assertTrue(report, report.contains(TimelinePagingForTests.EMPTIED + " 1"));
        } finally {
            TimelinePagingForTests.reset();
        }
    }
}
