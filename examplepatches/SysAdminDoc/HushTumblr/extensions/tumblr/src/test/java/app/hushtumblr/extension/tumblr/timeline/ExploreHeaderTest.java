/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import com.tumblr.rumblr.response.RadarHeaderResponse;
import com.tumblr.rumblr.response.RadarHeaderResponse.RadarHeader;
import com.tumblr.rumblr.response.RadarHeaderResponse.TakeOverAd;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.EnumSet;
import java.util.List;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** Explore's header, which a sponsor can pay to fill with its own image and takeover ad. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ExploreHeaderTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        Settings.HIDE_ADS.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
    }

    @After public void restore() {
        Settings.HIDE_ADS.resetToDefault();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        HookStatus.clear();
    }

    private static RadarHeaderResponse header(String type, String badge, TakeOverAd ad) {
        return new RadarHeaderResponse(new RadarHeader(type, badge, ad));
    }

    private static RadarHeaderResponse sponsored() {
        return header("sponsored", "https://assets.tumblr.com/sponsored.png", new TakeOverAd());
    }

    private String report() {
        return String.join("\n", HookStatus.report());
    }

    @Test public void aSponsoredHeaderIsHiddenWithHideAdsOn() {
        assertTrue("Hide ads is on by default", Settings.HIDE_ADS.get());
        assertTrue(ExploreHeader.hideSponsored(sponsored()));
        assertTrue(report(), report().contains(ExploreHeader.HIDDEN + " 1"));
    }

    @Test public void anyOneSignOfASponsorIsEnough() {
        assertTrue("the header type", ExploreHeader.hideSponsored(header(" Sponsored ", null, null)));
        assertTrue("a takeover ad", ExploreHeader.hideSponsored(header("post", null, new TakeOverAd())));
        assertTrue("a sponsor badge", ExploreHeader.hideSponsored(header(null, "https://assets.tumblr.com/b.png", null)));
    }

    @Test public void aPostsHeaderStays() {
        assertFalse(ExploreHeader.hideSponsored(header("post", null, null)));
        assertFalse("a blank badge", ExploreHeader.hideSponsored(header("post", "  ", null)));
        assertFalse("no header", ExploreHeader.hideSponsored(new RadarHeaderResponse(null)));
        assertFalse("no response", ExploreHeader.hideSponsored(null));
        assertFalse(report(), report().contains(ExploreHeader.HIDDEN));
    }

    @Test public void offPausedOrWithoutItsHookTheHeaderStays() {
        Settings.HIDE_ADS.save(false);
        assertFalse(ExploreHeader.hideSponsored(sponsored()));
        Settings.HIDE_ADS.save(true);
        for (HushTumblrPause.Reason reason : HushTumblrPause.Reason.values()) {
            if (reason == HushTumblrPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ExploreHeader.hideSponsored(sponsored()));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(ExploreHeader.hideSponsored(sponsored())));
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertFalse(ExploreHeader.hideSponsored(sponsored()));
        assertFalse(report(), report().contains(ExploreHeader.HIDDEN));
    }

    @Test public void aHeaderThatThrowsStaysAndIsReported() {
        RadarHeader broken = new RadarHeader("sponsored", null, null) {
            @Override public String getHeaderType() {
                throw new IllegalStateException("parcel");
            }
        };
        assertFalse(ExploreHeader.hideSponsored(new RadarHeaderResponse(broken)));
        List<String> missing = HookStatus.missing(FamilyNames.HIDE_ADS);
        assertEquals(missing.toString(), 1, missing.size());
        assertTrue(missing.get(0), missing.get(0).contains(ExploreHeader.STEP));
    }
}
