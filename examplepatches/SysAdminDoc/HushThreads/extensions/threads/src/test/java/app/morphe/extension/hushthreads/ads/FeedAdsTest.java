/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
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

import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * What Hide ads does to a feed page with its switch on. The patch writes the two lookups in when
 * you patch, and {@link ShadowFeedAds} stands in for them: an item is its own post, and
 * {@link ShadowFeedAds#AD} is the one post Threads calls an ad.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {ShadowFeedAds.class, ShadowFeedAds.Status.class},
        instrumentedPackages = "app.morphe.extension.hushthreads.ads")
public class FeedAdsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void clearCounts() {
        ShadowFeedAds.Status.ads = true;
        ShadowFeedAds.Status.suggestions = false;
        HookStatus.clear();
    }

    @After
    public void restore() {
        Settings.HIDE_ADS.resetToDefault();
        Settings.HIDE_SUGGESTED_USERS.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void adsComeOutAndTheRestKeepTheirOrder() {
        List<Object> page = Arrays.asList(ShadowFeedAds.AD, "first", "second", ShadowFeedAds.AD, "third", ShadowFeedAds.AD);
        assertEquals(Arrays.asList("first", "second", "third"), FeedAds.filter(page));
    }

    @Test
    public void aPageWithoutAdsComesBackAsTheSameList() {
        List<Object> page = Arrays.asList("first", "second");
        assertSame(page, FeedAds.filter(page));
    }

    @Test
    public void pagesWithoutMatchesStillCountBothSuccessfulChecks() {
        ShadowFeedAds.Status.suggestions = true;
        List<Object> first = Arrays.asList("followed", "repost");
        List<Object> second = Collections.singletonList("ordinary");
        assertSame(first, FeedAds.filter(first));
        assertSame(second, FeedAds.filter(second));
        assertEquals(Arrays.asList(
                "Hide ads: invoked 2, 0 found, 0 missing. Counted: feed pages checked 2, feed items checked 3",
                "Hide suggested users: invoked 2, 0 found, 0 missing. Counted: feed pages checked 2, feed items checked 3"),
                HookStatus.report());
    }

    @Test
    public void emptyDisabledOmittedAndFailedChecksDoNotCountPages() {
        ShadowFeedAds.Status.suggestions = true;
        Settings.HIDE_ADS.save(false);
        FeedAds.filter(null);
        FeedAds.filter(Collections.emptyList());
        FeedAds.filter(Collections.singletonList("post"));
        Settings.HIDE_ADS.save(true);
        Settings.HIDE_SUGGESTED_USERS.save(false);
        FeedAds.filter(Arrays.asList(ShadowFeedAds.AD, ShadowFeedAds.BROKEN));
        ShadowFeedAds.Status.ads = false;
        FeedAds.filter(Collections.singletonList("post"));
        List<String> report = HookStatus.report();
        assertTrue(report.toString(), !report.get(0).contains("Counted:"));
        assertTrue(report.toString(), report.get(1).endsWith("feed pages checked 1, feed items checked 1"));
    }

    /** A resumed merge is called again with no page and reads the copy it saved the first time. */
    @Test
    public void noPageAndAnEmptyPageComeBackAsTheyAre() {
        assertNull(FeedAds.filter(null));
        List<Object> empty = Collections.emptyList();
        assertSame(empty, FeedAds.filter(empty));
        assertTrue(HookStatus.report().toString(), !HookStatus.report().toString().contains("Counted:"));
    }

    @Test
    public void anItemWithoutAPostStays() {
        List<Object> page = Arrays.asList(null, "first", ShadowFeedAds.AD);
        assertEquals(Arrays.asList(null, "first"), FeedAds.filter(page));
    }

    @Test
    public void aPageOfOnlyAdsComesBackEmpty() {
        assertEquals(Collections.emptyList(), FeedAds.filter(Arrays.asList(ShadowFeedAds.AD, ShadowFeedAds.AD)));
    }

    @Test
    public void theSwitchOffLeavesThePageAlone() {
        Settings.HIDE_ADS.save(false);
        List<Object> page = Arrays.asList("first", ShadowFeedAds.AD);
        assertSame(page, FeedAds.filter(page));
    }

    /** One item that breaks Threads' own check keeps the page whole, rather than dropping posts blind. */
    @Test
    public void anItemThatBreaksTheCheckKeepsTheWholePage() {
        List<Object> page = Arrays.asList(ShadowFeedAds.AD, ShadowFeedAds.BROKEN, "first");
        assertSame(page, FeedAds.filter(page));
    }

    @Test
    public void outcomesCountPostsRatherThanPages() {
        List<Object> page = Arrays.asList(ShadowFeedAds.AD, "first", ShadowFeedAds.AD, ShadowFeedAds.AD);
        assertEquals(Collections.singletonList("first"), FeedAds.filter(page));
        assertEquals(Collections.singletonList("Hide ads: invoked 1, 0 found, 0 missing. "
                + "Counted: feed pages checked 1, feed items checked 4, ad posts taken out 3"), HookStatus.report());
    }

    @Test
    public void unchangedDisabledAndFailOpenPagesDoNotAddRemovalOutcomes() {
        List<Object> page = Arrays.asList(ShadowFeedAds.AD, "first");
        FeedAds.filter(Collections.singletonList("first"));
        Settings.HIDE_ADS.save(false);
        assertSame(page, FeedAds.filter(page));
        Settings.HIDE_ADS.save(true);
        List<Object> broken = Arrays.asList(ShadowFeedAds.AD, ShadowFeedAds.BROKEN, "first");
        assertSame(broken, FeedAds.filter(broken));
        SettingsContextRule.withoutContext(() -> assertSame(page, FeedAds.filter(page)));
        assertTrue(HookStatus.report().toString(),
                !HookStatus.report().toString().contains("ad posts taken out"));
    }

    @Test
    public void aPausedPageDoesNotAddRemovalOutcomes() throws Exception {
        java.lang.reflect.Method pause = Setting.class.getDeclaredMethod("setPausedForProcess", boolean.class);
        pause.setAccessible(true);
        try {
            pause.invoke(null, true);
            List<Object> page = Arrays.asList(ShadowFeedAds.AD, "first");
            assertSame(page, FeedAds.filter(page));
            assertEquals(Collections.singletonList("Hide ads: invoked 1, 0 found, 0 missing"), HookStatus.report());
        } finally {
            pause.invoke(null, false);
        }
    }

    @Test
    public void mixedPagesUseBothRulesAndCountEachActualRemoval() {
        ShadowFeedAds.Status.suggestions = true;
        List<Object> page = Arrays.asList("followed", ShadowFeedAds.AD, ShadowFeedAds.SUGGESTED,
                "repost", ShadowFeedAds.KICKSTART, "recommended", ShadowFeedAds.AD);
        assertEquals(Arrays.asList("followed", "repost", "recommended"), FeedAds.filter(page));
        assertEquals(Arrays.asList("Hide ads: invoked 1, 0 found, 0 missing. "
                        + "Counted: feed pages checked 1, feed items checked 7, ad posts taken out 2",
                "Hide suggested users: invoked 1, 0 found, 0 missing. "
                        + "Counted: feed pages checked 1, feed items checked 7, suggestion cards taken out 2"),
                HookStatus.report());
    }

    @Test
    public void suggestionOnlySelectionLeavesAdsAndDoesNotInvokeTheirRule() {
        ShadowFeedAds.Status.ads = false;
        ShadowFeedAds.Status.suggestions = true;
        assertEquals(Arrays.asList(ShadowFeedAds.AD, "post"),
                FeedAds.filter(Arrays.asList(ShadowFeedAds.AD, ShadowFeedAds.SUGGESTED, "post")));
        assertEquals(Collections.singletonList("Hide suggested users: invoked 1, 0 found, 0 missing. "
                + "Counted: feed pages checked 1, feed items checked 3, suggestion cards taken out 1"), HookStatus.report());
    }

    @Test
    public void theTwoSwitchesActIndependently() {
        ShadowFeedAds.Status.suggestions = true;
        List<Object> page = Arrays.asList(ShadowFeedAds.AD, ShadowFeedAds.SUGGESTED, "post");
        Settings.HIDE_SUGGESTED_USERS.save(false);
        assertEquals(Arrays.asList(ShadowFeedAds.SUGGESTED, "post"), FeedAds.filter(page));
        Settings.HIDE_ADS.save(false);
        Settings.HIDE_SUGGESTED_USERS.save(true);
        assertEquals(Arrays.asList(ShadowFeedAds.AD, "post"), FeedAds.filter(page));
        Settings.HIDE_SUGGESTED_USERS.save(false);
        assertSame(page, FeedAds.filter(page));
    }

    @Test
    public void aBrokenSecondRuleRollsBackTheWholePageAndBothCounts() {
        ShadowFeedAds.Status.suggestions = true;
        List<Object> page = Arrays.asList(ShadowFeedAds.AD, ShadowFeedAds.SUGGESTED,
                ShadowFeedAds.BROKEN_SUGGESTED, "post");
        assertSame(page, FeedAds.filter(page));
        assertTrue(HookStatus.report().toString(), !HookStatus.report().toString().contains("Counted:"));
    }

    @Test
    public void aPageThatBreaksWhileWalkedIsFiledUnderTheSelectedRulesOnly() {
        List<Object> page = unreadablePage();
        assertSame(page, FeedAds.filter(page));
        assertEquals(1, HookStatus.report().size());
        String line = HookStatus.report().get(0);
        assertTrue(line, line.startsWith("Hide ads: invoked 1, 0 found, 1 missing"));

        HookStatus.clear();
        ShadowFeedAds.Status.suggestions = true;
        assertSame(page, FeedAds.filter(page));
        List<String> report = HookStatus.report();
        assertEquals(report.toString(), 2, report.size());
        assertTrue(report.toString(), report.get(0).startsWith("Hide ads: invoked 1, 0 found, 1 missing"));
        assertTrue(report.toString(), report.get(1).startsWith("Hide suggested users: invoked 1, 0 found, 1 missing"));
    }

    /** A page whose items can't be read, the way a list changed under Threads' feet would behave. */
    private static List<Object> unreadablePage() {
        return new java.util.AbstractList<Object>() {
            @Override public Object get(int index) { throw new java.util.ConcurrentModificationException(); }
            @Override public int size() { return 2; }
        };
    }

    @Test
    public void paginatedRemovalCountsAccumulateWithoutReorderingPosts() {
        ShadowFeedAds.Status.suggestions = true;
        assertEquals(Arrays.asList("a", "b"),
                FeedAds.filter(Arrays.asList("a", ShadowFeedAds.SUGGESTED, "b")));
        assertEquals(Arrays.asList("c", "d"),
                FeedAds.filter(Arrays.asList(ShadowFeedAds.KICKSTART, "c", ShadowFeedAds.AD, "d")));
        assertEquals(Arrays.asList("Hide ads: invoked 2, 0 found, 0 missing. "
                        + "Counted: feed pages checked 2, feed items checked 7, ad posts taken out 1",
                "Hide suggested users: invoked 2, 0 found, 0 missing. "
                        + "Counted: feed pages checked 2, feed items checked 7, suggestion cards taken out 2"),
                HookStatus.report());
    }

    @Test
    public void bothRulesPreserveTheOriginalListWithoutContextOrWhilePaused() throws Exception {
        ShadowFeedAds.Status.suggestions = true;
        List<Object> page = Arrays.asList(ShadowFeedAds.AD, ShadowFeedAds.SUGGESTED, "post");
        SettingsContextRule.withoutContext(() -> assertSame(page, FeedAds.filter(page)));
        java.lang.reflect.Method pause = Setting.class.getDeclaredMethod("setPausedForProcess", boolean.class);
        pause.setAccessible(true);
        try {
            pause.invoke(null, true);
            assertSame(page, FeedAds.filter(page));
            assertTrue(HookStatus.report().toString(), !HookStatus.report().toString().contains("Counted:"));
        } finally {
            pause.invoke(null, false);
        }
    }
}
