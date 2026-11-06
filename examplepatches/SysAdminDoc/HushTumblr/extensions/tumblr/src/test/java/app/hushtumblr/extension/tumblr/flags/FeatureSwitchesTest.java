/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.flags;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * The table behind the feature hook. What each family's switch does to its flags, paused and
 * before the settings are ready included, is held by PausedHooksTest's probes.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FeatureSwitchesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        HookStatus.clear();
    }

    /** The flag named [flag] as the hook sees it. */
    public static FakeFeature flag(String flag) {
        return FakeFeature.valueOf(flag);
    }

    @Test
    public void aFlagNoFamilyClaimsKeepsTumblrsAnswer() {
        assertTrue(FeatureSwitches.isEnabled(FakeFeature.UNCLAIMED_FLAG, true));
        assertFalse(FeatureSwitches.isEnabled(FakeFeature.UNCLAIMED_FLAG, false));
        assertTrue(FeatureSwitches.isEnabled(null, true));
        assertFalse(FeatureSwitches.isEnabled(null, false));
        SettingsContextRule.withoutContext(() -> assertTrue(FeatureSwitches.isEnabled(FakeFeature.UNCLAIMED_FLAG, true)));
    }

    /** A claim names a family by its constant and its patch name, and the two have to agree. */
    @Test
    public void everyClaimNamesAFamilyWithASwitch() {
        List<String> wrong = new ArrayList<>();
        for (String flag : FeatureSwitches.claimedFlags()) {
            FeatureSwitches.Claim claim = FeatureSwitches.claimOn(flag);
            assertNotNull(flag, claim);
            PatchFamily family;
            try {
                family = PatchFamily.valueOf(claim.family);
            } catch (IllegalArgumentException unknown) {
                wrong.add(flag + ": no family " + claim.family);
                continue;
            }
            if (!family.patchName.equals(claim.patchName)) wrong.add(flag + ": " + claim.patchName + " isn't " + family.patchName);
            if (family.switches.isEmpty()) wrong.add(flag + ": " + family.patchName + " has no switch to turn it off with");
        }
        assertEquals(new ArrayList<String>(), wrong);
    }

    /**
     * Each claimed flag answers off while its family's switch is on, and Tumblr's own answer while
     * it's off, while the family isn't in the build, and whenever Tumblr's answer is already off.
     */
    @Test
    public void everyClaimedFlagFollowsItsFamilysSwitch() {
        List<String> wrong = new ArrayList<>();
        try {
            PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
            for (String flag : FeatureSwitches.claimedFlags()) {
                PatchFamily family = PatchFamily.valueOf(FeatureSwitches.claimOn(flag).family);
                for (BooleanSetting setting : family.switches) setting.save(true);
                if (FeatureSwitches.isEnabled(flag(flag), true)) wrong.add(flag + " stayed on with its switch on");
                if (FeatureSwitches.isEnabled(flag(flag), false)) wrong.add(flag + " turned on");
                for (BooleanSetting setting : family.switches) setting.save(false);
                if (!FeatureSwitches.isEnabled(flag(flag), true)) wrong.add(flag + " went off with its switch off");
                for (BooleanSetting setting : family.switches) setting.save(true);
                PatchFamilyForTests.inBuild(EnumSet.complementOf(EnumSet.of(family)));
                if (!FeatureSwitches.isEnabled(flag(flag), true)) wrong.add(flag + " went off without its patch");
                PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
                for (BooleanSetting setting : family.switches) setting.resetToDefault();
            }
        } finally {
            PatchFamilyForTests.inBuild(null);
        }
        assertEquals(new ArrayList<String>(), wrong);
    }

    /**
     * Hide the Communities tab answers for the post editor's tips and leaves the tab's own flag to
     * Tumblr. Off, that flag takes the tab out of Tumblr's list, and Tumblr's bottom bar then never
     * runs the one method that hides the tab's button, which stays on the bar with nothing behind
     * it. BottomBarTabs hides the button instead.
     */
    @Test
    public void theCommunitiesTabsOwnFlagStaysTumblrs() {
        try {
            PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
            Settings.HIDE_COMMUNITIES_TAB.save(true);
            assertNull(FeatureSwitches.claimOn("COMMUNITIES_TAB_BAR_ITEM"));
            assertTrue(FeatureSwitches.isEnabled(flag("COMMUNITIES_TAB_BAR_ITEM"), true));
            assertFalse(FeatureSwitches.isEnabled(flag("COMMUNITIES_TAB_BAR_ITEM"), false));
            assertFalse("the post editor's tips still go", FeatureSwitches.isEnabled(flag("COMMUNITIES_TOOLTIPS"), true));
        } finally {
            Settings.HIDE_COMMUNITIES_TAB.resetToDefault();
            PatchFamilyForTests.inBuild(null);
        }
    }

    /**
     * Hide ads answers off for the full-screen ad's two flags: the one Tumblr's interstitial manager
     * checks before it asks for or shows an ad, and the one that lets a blog opened from a
     * notification, a message or the notes reach that manager. The cooldown flag stays Tumblr's,
     * since off it ends the wait between two ads.
     */
    @Test
    public void hideAdsTurnsTheFullScreenAdOff() {
        try {
            PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
            for (String flag : new String[] {"MAKE_NIMBUS_INTERSTITIAL_CLIENT_AD_REQUESTS", "INTERSTITIAL_ADS_BLOG_OPENING_TRIGGERS"}) {
                Settings.HIDE_ADS.save(true);
                assertFalse(flag + " with Hide ads on", FeatureSwitches.isEnabled(flag(flag), true));
                Settings.HIDE_ADS.save(false);
                assertTrue(flag + " with Hide ads off", FeatureSwitches.isEnabled(flag(flag), true));
                assertFalse(flag + " Tumblr had off", FeatureSwitches.isEnabled(flag(flag), false));
            }
            Settings.HIDE_ADS.save(true);
            assertNull(FeatureSwitches.claimOn("INTERSTITIAL_ADS_CLIENT_COOLDOWN"));
            assertTrue(FeatureSwitches.isEnabled(flag("INTERSTITIAL_ADS_CLIENT_COOLDOWN"), true));
        } finally {
            Settings.HIDE_ADS.resetToDefault();
            PatchFamilyForTests.inBuild(null);
        }
    }

    /** Keep Blaze posts is an option of Hide ads: on alone, it turns none of Hide ads' flags off. */
    @Test
    public void keepBlazePostsAloneLeavesTheAdFlagsOn() {
        try {
            PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
            Settings.HIDE_ADS.save(false);
            Settings.KEEP_BLAZE_POSTS.save(true);
            List<String> claimed = new ArrayList<>();
            for (String flag : FeatureSwitches.claimedFlags()) {
                if (!PatchFamily.HIDE_ADS.name().equals(FeatureSwitches.claimOn(flag).family)) continue;
                claimed.add(flag);
                assertTrue(flag + " with only Keep Blaze posts on", FeatureSwitches.isEnabled(flag(flag), true));
            }
            assertFalse("Hide ads claims flags", claimed.isEmpty());
        } finally {
            Settings.HIDE_ADS.resetToDefault();
            Settings.KEEP_BLAZE_POSTS.resetToDefault();
            PatchFamilyForTests.inBuild(null);
        }
    }

    /**
     * A claimed flag asked before the settings are ready keeps Tumblr's answer and is counted under
     * its family, so a read that comes too early for the switch shows in the report. An answer
     * that's already off has nothing to turn off and isn't counted.
     */
    @Test
    public void aClaimedFlagAskedBeforeTheSettingsIsCounted() {
        FeatureSwitches.Claim claim = FeatureSwitches.claimOn("LIVERAMP_ATS");
        SettingsContextRule.withoutContext(() -> {
            assertFalse(FeatureSwitches.isEnabled(flag("LIVERAMP_ATS"), false));
            assertTrue(FeatureSwitches.isEnabled(flag("LIVERAMP_ATS"), true));
        });
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(claim.patchName));
        assertTrue(report, report.contains(FeatureSwitches.READ_EARLY + " 1"));
    }

    /** The probes reach a flag through {@link FakeFeature}, so it needs one constant per claimed flag. */
    @Test
    public void everyClaimedFlagHasAStandIn() {
        List<String> missing = new ArrayList<>();
        for (String flag : FeatureSwitches.claimedFlags()) {
            try {
                flag(flag);
            } catch (IllegalArgumentException absent) {
                missing.add(flag);
            }
        }
        assertEquals("add these to FakeFeature", new ArrayList<String>(), missing);
    }
}
