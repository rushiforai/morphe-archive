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
import app.hushtumblr.extension.tumblr.rootmute.HushDashboardTimeline;
import app.hushtumblr.extension.tumblr.rootmute.RootPostMutes;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Hide liked posts and Hide your own reblogs act on a dashboard screen's pages only. A post you
 * open, your review queue, a Blaze list and the audio player load the dashboard's response too,
 * so parsing it keeps every post.
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
}
