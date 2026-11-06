/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
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

    /** Units Threads types as ads come out by their type. Suggestion units and ordinary posts stay. */
    @Test
    public void adUnitTypesComeOutAndSuggestionsAndPostsStay() {
        List<Object> page = Arrays.asList(UnitType.THREAD, UnitType.AD, "ordinary post", UnitType.AD4AD,
                UnitType.SUGGESTED_USERS, UnitType.INTENT_AWARE_AD_PIVOT, UnitType.STORIES_NETEGO,
                UnitType.STAND_ALONE_MULTI_AD_PIVOT, UnitType.CLIPS_NETEGO, UnitType.ADS_FEEDBACK_INTERFACE,
                UnitType.SUGGESTED_BUSINESSES, UnitType.ADS_FEEDBACK_INTERFACE_INTERESTS_PICKER, UnitType.MEDIA,
                UnitType.ADS_FEEDBACK_INTERFACE_REPETITION, UnitType.BLOKS_NETEGO);
        assertEquals(Arrays.asList(UnitType.THREAD, "ordinary post", UnitType.SUGGESTED_USERS, UnitType.STORIES_NETEGO,
                UnitType.CLIPS_NETEGO, UnitType.SUGGESTED_BUSINESSES, UnitType.MEDIA, UnitType.BLOKS_NETEGO),
                FeedAds.filter(page));
        assertEquals(Collections.singletonList("Hide ads: invoked 1, 0 found, 0 missing. "
                + "Counted: feed pages checked 1, feed items checked 15, ad posts taken out 7"), HookStatus.report());
        // A name is matched whole, and only an enum constant has one.
        assertTrue(FeedAds.isAdUnitType(UnitType.AD));
        assertFalse(FeedAds.isAdUnitType(UnitType.ADS));
        assertFalse(FeedAds.isAdUnitType("AD"));
        assertFalse(FeedAds.isAdUnitType(null));
    }

    /** A page of ad units stays whole with the switch off. */
    @Test
    public void adUnitTypesStayWithTheSwitchOff() {
        Settings.HIDE_ADS.save(false);
        List<Object> page = Arrays.asList(UnitType.AD, UnitType.THREAD, UnitType.AD4AD);
        assertSame(page, FeedAds.filter(page));
    }

    /** Stands in for Threads' feed unit type enum, with constant names Threads ships, plus one near miss. */
    private enum UnitType {
        THREAD, MEDIA, AD, ADS, AD4AD, INTENT_AWARE_AD_PIVOT, STAND_ALONE_MULTI_AD_PIVOT, ADS_FEEDBACK_INTERFACE,
        ADS_FEEDBACK_INTERFACE_INTERESTS_PICKER, ADS_FEEDBACK_INTERFACE_REPETITION, SUGGESTED_USERS,
        SUGGESTED_BUSINESSES, STORIES_NETEGO, CLIPS_NETEGO, BLOKS_NETEGO
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
    public void spoolPagesGetTheSameRulesAndCountAsTheSpoolsToo() {
        ShadowFeedAds.Status.suggestions = true;
        List<Object> page = Arrays.asList("followed", ShadowFeedAds.AD, ShadowFeedAds.SUGGESTED, "recommended");
        assertEquals(Arrays.asList("followed", "recommended"), FeedAds.spoolPage(page));
        List<Object> plain = Collections.singletonList("ordinary");
        assertSame(plain, FeedAds.spoolPage(plain));
        assertSame(plain, FeedAds.filter(plain));
        assertNull(FeedAds.spoolPage(null));
        assertEquals(Arrays.asList(
                "Hide ads: invoked 4, 0 found, 0 missing. Counted: feed pages checked 3,"
                        + " spool feed pages checked 2, feed items checked 6, ad posts taken out 1",
                "Hide suggested users: invoked 4, 0 found, 0 missing. Counted: feed pages checked 3,"
                        + " spool feed pages checked 2, feed items checked 6, suggestion cards taken out 1"),
                HookStatus.report());
    }

    /** With the switch off, paused, without settings or with the check broken, a spool page stays whole and uncounted. */
    @Test
    public void spoolPagesStayWholeWhenHideAdsCannotAnswer() throws Exception {
        List<Object> page = Arrays.asList("first", ShadowFeedAds.AD);
        Settings.HIDE_ADS.save(false);
        assertSame(page, FeedAds.spoolPage(page));
        Settings.HIDE_ADS.save(true);
        SettingsContextRule.withoutContext(() -> assertSame(page, FeedAds.spoolPage(page)));
        java.lang.reflect.Method pause = Setting.class.getDeclaredMethod("setPausedForProcess", boolean.class);
        pause.setAccessible(true);
        try {
            pause.invoke(null, true);
            assertSame(page, FeedAds.spoolPage(page));
        } finally {
            pause.invoke(null, false);
        }
        List<Object> broken = Arrays.asList(ShadowFeedAds.AD, ShadowFeedAds.BROKEN, "first");
        assertSame(broken, FeedAds.spoolPage(broken));
        String report = HookStatus.report().toString();
        assertTrue(report, !report.contains("Counted:"));
        assertTrue(report, report.contains("'spool feed page' hook (it threw java.lang.IllegalStateException)"));
        assertTrue(report, !report.contains("'feed page' hook"));
    }

    /** For You's other writes into either cache get the same rules, counted as writes rather than pages. */
    @Test
    public void forYouWritesGetTheSameRulesAndCountApartFromPages() {
        ShadowFeedAds.Status.suggestions = true;
        List<Object> write = Arrays.asList(ShadowFeedAds.SUGGESTED, "followed", ShadowFeedAds.AD);
        assertEquals(Collections.singletonList("followed"), FeedAds.spoolWrite(write));
        assertEquals(Collections.singletonList("followed"), FeedAds.forYouWrite(write));
        List<Object> plain = Collections.singletonList("ordinary");
        assertSame(plain, FeedAds.spoolWrite(plain));
        // A resumed write passes no list, and that isn't a check.
        assertNull(FeedAds.forYouWrite(null));
        assertNull(FeedAds.spoolWrite(null));
        assertEquals(Arrays.asList(
                "Hide ads: invoked 5, 0 found, 0 missing. Counted: For You cache writes checked 3,"
                        + " spool cache writes checked 2, feed items checked 7, ad posts taken out 2",
                "Hide suggested users: invoked 5, 0 found, 0 missing. Counted: For You cache writes checked 3,"
                        + " spool cache writes checked 2, feed items checked 7, suggestion cards taken out 2"),
                HookStatus.report());
    }

    /** With the switch off, paused, without settings or with the check broken, a For You write stays whole and uncounted. */
    @Test
    public void forYouWritesStayWholeWhenHideAdsCannotAnswer() throws Exception {
        List<Object> write = Arrays.asList("first", ShadowFeedAds.AD);
        Settings.HIDE_ADS.save(false);
        assertSame(write, FeedAds.forYouWrite(write));
        assertSame(write, FeedAds.spoolWrite(write));
        Settings.HIDE_ADS.save(true);
        SettingsContextRule.withoutContext(() -> assertSame(write, FeedAds.forYouWrite(write)));
        java.lang.reflect.Method pause = Setting.class.getDeclaredMethod("setPausedForProcess", boolean.class);
        pause.setAccessible(true);
        try {
            pause.invoke(null, true);
            assertSame(write, FeedAds.spoolWrite(write));
        } finally {
            pause.invoke(null, false);
        }
        List<Object> broken = Arrays.asList(ShadowFeedAds.AD, ShadowFeedAds.BROKEN, "first");
        // The report names only the first miss, so the list of every miss, read after each
        // write, says which write threw under which name.
        assertSame(broken, FeedAds.forYouWrite(broken));
        String misses = HookStatus.missing().toString();
        assertTrue(misses, misses.contains("'For You cache write' hook (it threw java.lang.IllegalStateException)"));
        assertTrue(misses, !misses.contains("'spool cache write' hook"));
        assertSame(broken, FeedAds.spoolWrite(broken));
        misses = HookStatus.missing().toString();
        assertTrue(misses, misses.contains("'spool cache write' hook (it threw java.lang.IllegalStateException)"));
        assertTrue(misses, !misses.contains("'feed page' hook"));
        String report = HookStatus.report().toString();
        assertTrue(report, !report.contains("Counted:"));
    }

    /** For You's writes of one item get the same rules, and an item they take out isn't written. */
    @Test
    public void forYouItemWritesGetTheSameRulesAndCountApart() {
        ShadowFeedAds.Status.suggestions = true;
        assertTrue(FeedAds.spoolItem(ShadowFeedAds.SUGGESTED));
        assertTrue(FeedAds.forYouItem(ShadowFeedAds.AD));
        assertFalse(FeedAds.forYouItem("followed"));
        // A resumed write passes no item, and that isn't a check.
        assertFalse(FeedAds.forYouItem(null));
        assertFalse(FeedAds.spoolItem(null));
        assertEquals(Arrays.asList(
                "Hide ads: invoked 5, 0 found, 0 missing. Counted: For You item writes checked 3,"
                        + " spool item writes checked 1, feed items checked 3, ad posts taken out 1",
                "Hide suggested users: invoked 5, 0 found, 0 missing. Counted: For You item writes checked 3,"
                        + " spool item writes checked 1, feed items checked 3, suggestion cards taken out 1"),
                HookStatus.report());
    }

    /** With the switch off, paused, without settings or with the check broken, a one-item write goes ahead uncounted. */
    @Test
    public void forYouItemWritesGoAheadWhenHideAdsCannotAnswer() throws Exception {
        Settings.HIDE_ADS.save(false);
        assertFalse(FeedAds.forYouItem(ShadowFeedAds.AD));
        assertFalse(FeedAds.spoolItem(ShadowFeedAds.AD));
        Settings.HIDE_ADS.save(true);
        SettingsContextRule.withoutContext(() -> assertFalse(FeedAds.forYouItem(ShadowFeedAds.AD)));
        java.lang.reflect.Method pause = Setting.class.getDeclaredMethod("setPausedForProcess", boolean.class);
        pause.setAccessible(true);
        try {
            pause.invoke(null, true);
            assertFalse(FeedAds.spoolItem(ShadowFeedAds.AD));
        } finally {
            pause.invoke(null, false);
        }
        assertFalse(FeedAds.forYouItem(ShadowFeedAds.BROKEN));
        String misses = HookStatus.missing().toString();
        assertTrue(misses, misses.contains("'For You item write' hook (it threw java.lang.IllegalStateException)"));
        assertTrue(misses, !misses.contains("'spool item write' hook"));
        assertFalse(FeedAds.spoolItem(ShadowFeedAds.BROKEN));
        misses = HookStatus.missing().toString();
        assertTrue(misses, misses.contains("'spool item write' hook (it threw java.lang.IllegalStateException)"));
        assertTrue(misses, !misses.contains("'feed page' hook"));
        String report = HookStatus.report().toString();
        assertTrue(report, !report.contains("Counted:"));
    }

    /** An ad Threads inserts into a page it holds stays out. Anything else goes in. */
    @Test
    public void insertedAdsStayOutAndOtherInsertsGoIn() {
        assertTrue(FeedAds.insertedAd(ShadowFeedAds.AD));
        assertTrue(FeedAds.insertedAd(UnitType.AD4AD));
        assertFalse(FeedAds.insertedAd("ordinary post"));
        assertFalse(FeedAds.insertedAd(UnitType.SUGGESTED_USERS));
        assertFalse(FeedAds.insertedAd(null));
        assertEquals(Collections.singletonList("Hide ads: invoked 5, 0 found, 0 missing. "
                + "Counted: inserted items checked 4, inserted ads taken out 2"), HookStatus.report());
    }

    /** With the switch off, paused, without settings or with the check broken, every insert goes in uncounted. */
    @Test
    public void insertsGoInWhenHideAdsCannotAnswer() throws Exception {
        Settings.HIDE_ADS.save(false);
        assertFalse(FeedAds.insertedAd(ShadowFeedAds.AD));
        Settings.HIDE_ADS.save(true);
        SettingsContextRule.withoutContext(() -> assertFalse(FeedAds.insertedAd(ShadowFeedAds.AD)));
        java.lang.reflect.Method pause = Setting.class.getDeclaredMethod("setPausedForProcess", boolean.class);
        pause.setAccessible(true);
        try {
            pause.invoke(null, true);
            assertFalse(FeedAds.insertedAd(ShadowFeedAds.AD));
        } finally {
            pause.invoke(null, false);
        }
        assertFalse(FeedAds.insertedAd(ShadowFeedAds.BROKEN));
        String report = HookStatus.report().toString();
        assertTrue(report, !report.contains("Counted:"));
        assertTrue(report, report.contains("'inserted item' hook (it threw java.lang.IllegalStateException)"));
        ShadowFeedAds.Status.ads = false;
        HookStatus.clear();
        assertFalse(FeedAds.insertedAd(ShadowFeedAds.AD));
        assertEquals(Collections.emptyList(), HookStatus.report());
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
        assertTrue(HookStatus.report().toString(), HookStatus.report().toString()
                .contains("'feed page' hook (it threw java.lang.IllegalStateException)"));
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

    /** The ads an opened post fetches for its replies all come out, and are counted apart from the feed's. */
    @Test
    public void anOpenedPostsAdsAllComeOut() {
        List<Object> ads = Arrays.asList("first ad", "second ad");
        List<?> left = FeedAds.permalinkAds(ads);
        assertTrue(left.toString(), left.isEmpty());
        assertEquals(Collections.singletonList("Hide ads: invoked 1, 0 found, 0 missing. "
                + "Counted: opened post ads taken out 2"), HookStatus.report());
    }

    @Test
    public void anOpenedPostsAdsStayWithTheSwitchOffUnselectedOrPaused() throws Exception {
        List<Object> ads = Collections.singletonList("ad");
        Settings.HIDE_ADS.save(false);
        assertSame(ads, FeedAds.permalinkAds(ads));
        Settings.HIDE_ADS.save(true);
        SettingsContextRule.withoutContext(() -> assertSame(ads, FeedAds.permalinkAds(ads)));
        java.lang.reflect.Method pause = Setting.class.getDeclaredMethod("setPausedForProcess", boolean.class);
        pause.setAccessible(true);
        try {
            pause.invoke(null, true);
            assertSame(ads, FeedAds.permalinkAds(ads));
        } finally {
            pause.invoke(null, false);
        }
        assertTrue(HookStatus.report().toString(), !HookStatus.report().toString().contains("Counted:"));
        HookStatus.clear();
        ShadowFeedAds.Status.ads = false;
        assertSame(ads, FeedAds.permalinkAds(ads));
        assertEquals(Collections.emptyList(), HookStatus.report());
    }

    @Test
    public void noOpenedPostAdsComeBackAsTheyAre() {
        assertNull(FeedAds.permalinkAds(null));
        List<Object> none = Collections.emptyList();
        assertSame(none, FeedAds.permalinkAds(none));
        assertTrue(HookStatus.report().toString(), !HookStatus.report().toString().contains("Counted:"));
    }

    /** A list that breaks when asked keeps what Threads sent, and files the failure under Hide ads. */
    @Test
    public void anOpenedPostAdListThatBreaksStaysAsItWas() {
        List<Object> ads = new java.util.AbstractList<Object>() {
            @Override public Object get(int index) { throw new java.util.ConcurrentModificationException(); }
            @Override public int size() { throw new java.util.ConcurrentModificationException(); }
        };
        assertSame(ads, FeedAds.permalinkAds(ads));
        String line = HookStatus.report().get(0);
        assertTrue(line, line.startsWith("Hide ads: invoked 1, 0 found, 1 missing"));
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
