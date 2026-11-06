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

import android.view.View;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
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

    /** Tumblr TV's "... more" label goes with a line that held only tags, and only a label hidden here comes back. */
    @Test
    public void tumblrTvsMoreLabelGoesWithTheTagsAndComesBackOnTheNextBind() {
        View more = new View(RuntimeEnvironment.getApplication());
        PostParts.tvMore(more, PostParts.tvTags("cats, dogs"));
        assertEquals("switched off, the label is Tumblr's", View.VISIBLE, more.getVisibility());

        Settings.HIDE_HASHTAGS.save(true);
        PostParts.tvMore(more, PostParts.tvTags("cats, dogs"));
        assertEquals("the tags were the post's only text", View.GONE, more.getVisibility());
        // A post with a description takes the other path, so tvTags isn't asked.
        PostParts.tvMore(more, "A description");
        assertEquals("the next post bound to that card has a description", View.VISIBLE, more.getVisibility());
        PostParts.tvMore(more, PostParts.tvTags(""));
        assertEquals("a post with neither tags nor a description keeps Tumblr's label", View.VISIBLE, more.getVisibility());

        more.setVisibility(View.GONE);
        PostParts.tvMore(more, PostParts.tvTags("cats"));
        PostParts.tvMore(more, "A description");
        assertEquals("a label Tumblr hid itself stays Tumblr's", View.GONE, more.getVisibility());
        more.setVisibility(View.VISIBLE);

        PostParts.tvMore(more, PostParts.tvTags("cats"));
        assertEquals(View.GONE, more.getVisibility());
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        PostParts.tvMore(more, PostParts.tvTags("cats"));
        assertEquals("paused, the next bind gets Tumblr's label back", View.VISIBLE, more.getVisibility());
        PauseForTests.resume();

        PostParts.tvTags("cats");
        PostParts.tvMore(more, PostParts.tvTags(""));
        assertEquals("a bind with no tags starts unmarked, whatever the bind before it did", View.VISIBLE, more.getVisibility());
        PostParts.tvTags("cats");
        PostParts.tvMore(more, "A description");
        assertEquals("a line with something written keeps its label", View.VISIBLE, more.getVisibility());
        PostParts.tvMore(more, PostParts.tvTags("cats") + " \n" + (char) 0xA0);
        assertEquals("spaces and line breaks show nothing", View.GONE, more.getVisibility());
        PostParts.tvMore(more, "A description");
        assertEquals(View.VISIBLE, more.getVisibility());

        PostParts.tvMore(null, PostParts.tvTags("cats"));
        PostParts.tvMore(more, "");
        assertEquals("a bind's mark is read once", View.VISIBLE, more.getVisibility());
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
