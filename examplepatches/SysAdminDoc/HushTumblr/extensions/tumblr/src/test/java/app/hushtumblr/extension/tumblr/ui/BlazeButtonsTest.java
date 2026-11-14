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

import com.tumblr.rumblr.communities.PostOverflowMenuItem;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** When Hide Blaze prompts takes the Blaze buttons off posts, and when Tumblr's own answers stand. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class BlazeButtonsTest {
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
        Settings.HIDE_BLAZE_PROMPTS.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
    }

    @Test
    public void theSwitchStartsOffSoTumblrsAnswersStand() {
        assertTumblrs();
    }

    @Test
    public void theSwitchTakesEveryBlazeButtonOffPosts() {
        Settings.HIDE_BLAZE_PROMPTS.save(true);
        assertFalse("no flame under your own post", BlazeButtons.ownPostButton(1));
        assertFalse("no Blaze in the post menu", BlazeButtons.postMenuItem(1));
        assertFalse("no Blaze in the share sheet", BlazeButtons.shareTarget(1));

        List<PostOverflowMenuItem> menu = menu();
        List<?> kept = BlazeButtons.communityMenu(menu);
        assertEquals("Promote leaves, Copy link stays", 1, kept.size());
        assertTrue(kept.get(0) instanceof PostOverflowMenuItem.CopyLink);
        assertEquals("Tumblr's own list is left as it was", 2, menu.size());

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("own post flame 1"));
        assertTrue(report, report.contains("post menu item 1"));
        assertTrue(report, report.contains("share sheet target 1"));
        assertTrue(report, report.contains("community menu Promote 1"));
    }

    @Test
    public void whatTumblrWouldntShowStaysHidden() {
        Settings.HIDE_BLAZE_PROMPTS.save(true);
        assertFalse(BlazeButtons.ownPostButton(0));
        assertFalse(BlazeButtons.postMenuItem(0));
        assertFalse(BlazeButtons.shareTarget(0));
        List<PostOverflowMenuItem> noPromote = Collections.singletonList(new PostOverflowMenuItem.CopyLink());
        assertSame("nothing to take out, the same list", noPromote, BlazeButtons.communityMenu(noPromote));
        assertNull(BlazeButtons.communityMenu(null));
        List<Object> withNull = new ArrayList<>();
        withNull.add(null);
        withNull.add(new PostOverflowMenuItem.PromotePost());
        List<?> kept = BlazeButtons.communityMenu(withNull);
        assertEquals("an empty slot is Tumblr's to deal with", 1, kept.size());
        assertNull(kept.get(0));
    }

    @Test
    public void everyPauseHandsTumblrItsAnswersBack() {
        Settings.HIDE_BLAZE_PROMPTS.save(true);
        assertFalse("the control: the switch is on", BlazeButtons.postMenuItem(1));
        for (HushTumblrPause.Reason reason : new HushTumblrPause.Reason[] {
                HushTumblrPause.Reason.SWITCH, HushTumblrPause.Reason.CRASH_LOOP, HushTumblrPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertTumblrs();
            PauseForTests.resume();
        }
        assertFalse("and the switch takes over again on resume", BlazeButtons.shareTarget(1));
    }

    @Test
    public void aColdStartOrABuildWithoutTheHooksLeavesThemToTumblr() {
        Settings.HIDE_BLAZE_PROMPTS.save(true);
        SettingsContextRule.withoutContext(this::assertTumblrs);

        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.BLAZE_PROMPT_FLAGS));
        assertTumblrs();
        String report = String.join("\n", HookStatus.report());
        for (String hidden : new String[] {"own post flame", "post menu item", "share sheet target", "community menu Promote"})
            assertFalse(report, report.contains(hidden));
    }

    private void assertTumblrs() {
        assertTrue(BlazeButtons.ownPostButton(1));
        assertTrue(BlazeButtons.postMenuItem(1));
        assertTrue(BlazeButtons.shareTarget(1));
        assertFalse(BlazeButtons.ownPostButton(0));
        List<PostOverflowMenuItem> menu = menu();
        assertSame(menu, BlazeButtons.communityMenu(menu));
    }

    private static List<PostOverflowMenuItem> menu() {
        List<PostOverflowMenuItem> menu = new ArrayList<>();
        menu.add(new PostOverflowMenuItem.PromotePost());
        menu.add(new PostOverflowMenuItem.CopyLink());
        return menu;
    }
}
