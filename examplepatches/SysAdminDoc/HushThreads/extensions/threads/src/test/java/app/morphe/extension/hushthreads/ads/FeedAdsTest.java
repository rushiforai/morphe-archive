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
@Config(sdk = 30, shadows = ShadowFeedAds.class, instrumentedPackages = "app.morphe.extension.hushthreads.ads")
public class FeedAdsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void clearCounts() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        Settings.HIDE_ADS.resetToDefault();
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

    /** A resumed merge is called again with no page and reads the copy it saved the first time. */
    @Test
    public void noPageAndAnEmptyPageComeBackAsTheyAre() {
        assertNull(FeedAds.filter(null));
        List<Object> empty = Collections.emptyList();
        assertSame(empty, FeedAds.filter(empty));
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
                + "Counted: ad posts taken out 3"), HookStatus.report());
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
}
