/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.EnumSet;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** #21: with the switch on, a post holds the website's 30 images instead of the app's 10. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MoreImagesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void aBuildWithThePatch() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
    }

    @After
    public void restore() {
        PauseForTests.resume();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.MORE_IMAGES_PER_POST.resetToDefault();
    }

    @Test
    public void theSwitchStartsOffAndWaitsForARestart() {
        assertFalse(Settings.MORE_IMAGES_PER_POST.defaultValue);
        assertTrue("Tumblr builds the limit once a process", Settings.MORE_IMAGES_PER_POST.rebootApp);
        assertEquals(10, MoreImages.imageBlocks(10));
    }

    @Test
    public void withTheSwitchOnAPostHoldsTheWebsitesThirty() {
        Settings.MORE_IMAGES_PER_POST.save(true);
        assertEquals(30, MoreImages.imageBlocks(10));
        assertEquals("a limit already past the website's is never lowered", 40, MoreImages.imageBlocks(40));
    }

    @Test
    public void aPausedHushTumblrAndABuildWithoutThePatchKeepTumblrsTen() {
        Settings.MORE_IMAGES_PER_POST.save(true);
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertEquals("a paused switch reads off", 10, MoreImages.imageBlocks(10));
        PauseForTests.resume();

        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertEquals(10, MoreImages.imageBlocks(10));
    }
}
