/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;

/** The feed ads patch's question in the comment pill's check. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FeedAdPillsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String PILLS = "com.facebook.feedback.comments.plugins.indicatorpill.";

    @After
    public void restoreSwitch() {
        Settings.HIDE_SPONSORED_POSTS.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void aFeedAdsButtonStaysOffItsCommentsWhileTheSwitchIsOn() {
        assertEquals(2, FeedAdPills.AD_PILLS.size());
        for (String plugin : FeedAdPills.AD_PILLS) {
            assertTrue(plugin, FeedAdPills.holdsAdPill(plugin));
        }

        String line = null;
        for (String candidate : HookStatus.report()) {
            if (candidate.startsWith("Hide sponsored posts:")) line = candidate;
        }
        assertNotNull(String.join("\n", HookStatus.report()), line);
        assertTrue(line, line.contains(FeedAdPills.AD_PILL_HELD + " 2"));
    }

    @Test
    public void everyOtherPillIsLeftToFacebook() {
        assertFalse(FeedAdPills.holdsAdPill(PILLS + "organicmessagefloatingcta.OrganicMessageFloatingCtaPlugin"));
        assertFalse(FeedAdPills.holdsAdPill(PILLS + "organicaffiliatefloatingcta.OrganicAffiliateFloatingCtaPlugin"));
        assertFalse(FeedAdPills.holdsAdPill(PILLS + "findsvisualsearchfloatingcta.FindsVisualSearchFloatingCtaPlugin"));
        // The Reels, Watch and in-stream buttons are Hide sponsored reels' to answer.
        for (String plugin : ReelsAdFilter.AD_PILLS) {
            assertFalse(plugin, FeedAdPills.holdsAdPill(plugin));
        }
        assertFalse(FeedAdPills.holdsAdPill(null));
    }

    @Test
    public void withTheSwitchOffFacebookDecides() {
        Settings.HIDE_SPONSORED_POSTS.save(false);
        for (String plugin : FeedAdPills.AD_PILLS) {
            assertFalse(plugin, FeedAdPills.holdsAdPill(plugin));
        }
    }
}
