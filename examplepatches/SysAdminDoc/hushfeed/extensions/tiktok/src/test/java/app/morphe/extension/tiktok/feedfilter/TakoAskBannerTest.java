/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.feedfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import com.ss.android.ugc.aweme.feed.model.banner.BannerCommonKey;
import com.ss.android.ugc.aweme.feed.model.banner.BannerCommonStruct;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * Issue #6 as its reporter still saw it on 0.40.0: the "Ask · topic" bar under a For You video is
 * a common bottom banner keyed {@code bottom_banner_tako}, not one of the Tako components.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class TakoAskBannerTest {
    /** A video whose banner list can be read back after the filter replaced it. */
    static final class Video extends Aweme {
        List banners;
        int replaced;

        @Override public List getBanners() { return banners; }
        @Override public void setBanners(List banners) { this.banners = banners; replaced++; }
    }

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        HookStatus.clear();
        TakoAiFilter.resetBannerKindsForTests();
        Settings.HIDE_TAKO_AI.save(false);
    }

    @After public void tearDown() {
        Settings.HIDE_TAKO_AI.resetToDefault();
        HookStatus.clear();
    }

    private static BannerCommonStruct banner(String componentKey) {
        BannerCommonStruct banner = new BannerCommonStruct();
        banner.bannerKey = new BannerCommonKey();
        banner.bannerKey.componentKey = componentKey;
        return banner;
    }

    @Test public void theAskBannerIsTakenOutAndTheOthersStay() {
        Settings.HIDE_TAKO_AI.save(true);
        BannerCommonStruct search = banner("bottom_banner_search_rs");
        BannerCommonStruct ask = banner("bottom_banner_tako");
        BannerCommonStruct drama = banner("bottom_banner_series_mini_drama");
        List<Object> original = new ArrayList<>(Arrays.asList(search, ask, drama));
        Video video = new Video();
        video.banners = original;

        List<?> answer = TakoAiFilter.filterBanners(video, original);

        assertEquals(Arrays.asList(search, drama), answer);
        assertSame("the video kept the list with the Ask banner in it", answer, video.banners);
        assertEquals(Arrays.asList(search, ask, drama), original);

        // The next read gets the replaced list and finds nothing to do.
        assertSame(answer, TakoAiFilter.filterBanners(video, video.banners));
        assertEquals(1, video.replaced);
    }

    @Test public void withTheSwitchOffTheAskBannerIsLeft() {
        List<Object> original = new ArrayList<>(Arrays.asList(banner("bottom_banner_tako")));
        Video video = new Video();
        video.banners = original;

        assertSame(original, TakoAiFilter.filterBanners(video, original));
        assertEquals(0, video.replaced);
        assertEquals(1, original.size());
    }

    @Test public void aVideoWithoutAnAskBannerIsNotTouched() {
        Settings.HIDE_TAKO_AI.save(true);
        List<Object> original = new ArrayList<>(Arrays.asList(banner("bottom_banner_search_rs"),
                new Object(), new BannerCommonStruct()));
        Video video = new Video();
        video.banners = original;

        assertSame(original, TakoAiFilter.filterBanners(video, original));
        assertEquals(0, video.replaced);
        assertNull(TakoAiFilter.filterBanners(video, null));
    }

    @Test public void aMissingVideoStillGetsTheFilteredAnswer() {
        Settings.HIDE_TAKO_AI.save(true);
        List<Object> original = new ArrayList<>(Arrays.asList(banner("bottom_banner_tako")));

        assertTrue(TakoAiFilter.filterBanners(null, original).isEmpty());
    }

    @Test public void theExportNamesTheBannerHookWheneverItRuns() {
        TakoAiFilter.filterBanners(new Video(), new ArrayList<>());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("tako AI"));
    }
}
