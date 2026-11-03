/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

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

import java.util.EnumSet;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** When Hide hashtags and Hide the Follow button leave those parts off a post card or its reblog trail, and when they don't. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostPartsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void everyPatchIsIn() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        HookStatus.clear();
    }

    @After
    public void restore() {
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.HIDE_HASHTAGS.resetToDefault();
        Settings.HIDE_FOLLOW_BUTTON.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
    }

    @Test
    public void eachSwitchHidesItsOwnPart() {
        Settings.HIDE_HASHTAGS.save(true);
        assertTrue(PostParts.hideTags());
        assertFalse("the other switch is still off", PostParts.hideFollowButton());

        Settings.HIDE_HASHTAGS.save(false);
        Settings.HIDE_FOLLOW_BUTTON.save(true);
        assertFalse(PostParts.hideTags());
        assertTrue(PostParts.hideFollowButton());
        assertTrue(PostParts.hideFollowButton());

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("tags hidden 1"));
        assertTrue(report, report.contains("follow button hidden 2"));
    }

    @Test
    public void hideHashtagsEmptiesTumblrTvsTagLine() {
        assertEquals("cats, dogs", PostParts.tvTags("cats, dogs"));
        Settings.HIDE_HASHTAGS.save(true);
        assertEquals("", PostParts.tvTags("cats, dogs"));
        assertEquals("nothing to hide", "", PostParts.tvTags(""));
        assertNull(PostParts.tvTags(null));

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("Tumblr TV tags hidden 1"));

        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FOLLOW_BUTTON));
        assertEquals("its hook isn't in this build", "cats", PostParts.tvTags("cats"));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertEquals("cats", PostParts.tvTags("cats"));
    }

    @Test
    public void hideTheFollowButtonGivesTheReblogTrailsFollowNoEntry() {
        Object entry = new Object();
        assertSame("switched off, the entry is Tumblr's", entry, PostParts.trailFollow(entry));
        Settings.HIDE_FOLLOW_BUTTON.save(true);
        assertNull(PostParts.trailFollow(entry));
        assertNull("nothing to hide", PostParts.trailFollow(null));

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("reblog trail follow button hidden 1"));

        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.POST_TAGS));
        assertSame("its hook isn't in this build", entry, PostParts.trailFollow(entry));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertSame(entry, PostParts.trailFollow(entry));
    }

    @Test
    public void bothSwitchesStartOffSoTheCardIsTumblrs() {
        assertFalse(PostParts.hideTags());
        assertFalse(PostParts.hideFollowButton());
    }

    @Test
    public void pauseABuildWithoutTheHookOrAColdStartLeavesTheCardAlone() {
        Settings.HIDE_HASHTAGS.save(true);
        Settings.HIDE_FOLLOW_BUTTON.save(true);
        assertTrue("the control: the tags switch is on", PostParts.hideTags());
        assertTrue("the control: the Follow switch is on", PostParts.hideFollowButton());

        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertFalse(PostParts.hideTags());
        assertFalse(PostParts.hideFollowButton());
        PauseForTests.resume();

        SettingsContextRule.withoutContext(() -> {
            assertFalse(PostParts.hideTags());
            assertFalse(PostParts.hideFollowButton());
        });

        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FOLLOW_BUTTON));
        assertFalse("its hook isn't in this build", PostParts.hideTags());
        assertTrue(PostParts.hideFollowButton());
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.POST_TAGS));
        assertTrue(PostParts.hideTags());
        assertFalse("its hook isn't in this build", PostParts.hideFollowButton());
    }
}
