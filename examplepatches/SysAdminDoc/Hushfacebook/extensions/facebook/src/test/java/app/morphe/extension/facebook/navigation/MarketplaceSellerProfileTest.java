/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Show View profile on Marketplace sellers: with its switch on, the seller page's experiment flag
 * is answered true and counted, and every other name goes to Facebook's store unasked and
 * uncounted. Off or paused, the flag goes to Facebook's store too.
 */
@RunWith(RobolectricTestRunner.class)
public class MarketplaceSellerProfileTest {
    private static final HushfacebookPause.Reason[] PAUSES = {
            HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
            HushfacebookPause.Reason.MARKER_FILE};

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.SHOW_SELLER_VIEW_PROFILE.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SELLER_VIEW_PROFILE + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSellerPageFlagIsAnsweredTrue() {
        assertTrue(MarketplaceSellerProfile.answerTrue(MarketplaceSellerProfile.FLAG));
        assertTrue(MarketplaceSellerProfile.answerTrue(new String(MarketplaceSellerProfile.FLAG.toCharArray())));
        assertEquals(FamilyNames.SELLER_VIEW_PROFILE + ": invoked 2, 1 found, 0 missing. Counted: "
                + MarketplaceSellerProfile.ANSWERED + " 2", statusLine());
    }

    @Test
    public void everyOtherNameGoesToFacebookUncounted() {
        String[] others = {
                null, "",
                "qe_marketplace_commerce_profile_page:use_message_primary_button",
                "qe_marketplace_commerce_profile_page:contextual_view_header_enabled ",
                "QE_MARKETPLACE_COMMERCE_PROFILE_PAGE:CONTEXTUAL_VIEW_HEADER_ENABLED",
                "c2c_rating_review_visibility:show_c2c_reviews"};
        for (String name : others) {
            assertFalse(String.valueOf(name), MarketplaceSellerProfile.answerTrue(name));
        }
        assertNull("a read of another flag was counted", statusLine());
    }

    @Test
    public void offOrPausedTheFlagGoesToFacebook() {
        Settings.SHOW_SELLER_VIEW_PROFILE.save(false);
        assertFacebooks("off");
        Settings.SHOW_SELLER_VIEW_PROFILE.save(true);
        for (HushfacebookPause.Reason reason : PAUSES) {
            PauseForTests.pause(reason);
            assertFacebooks("paused by " + reason);
            PauseForTests.resume();
        }
        assertTrue("the switch didn't come back after the pause",
                MarketplaceSellerProfile.answerTrue(MarketplaceSellerProfile.FLAG));
    }

    private static void assertFacebooks(String when) {
        HookStatus.clear();
        assertFalse(when, MarketplaceSellerProfile.answerTrue(MarketplaceSellerProfile.FLAG));
        assertEquals(when + ", the report", FamilyNames.SELLER_VIEW_PROFILE + ": invoked 1, 0 found, 0 missing",
                statusLine());
    }
}
