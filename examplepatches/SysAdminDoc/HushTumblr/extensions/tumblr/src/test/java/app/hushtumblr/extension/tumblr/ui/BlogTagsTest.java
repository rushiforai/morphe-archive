/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertFalse;
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

/** When a tag tapped under a post opens the posting blog's tag search, and when Tumblr's own search stays. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class BlogTagsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int NOT_A_BLOG_SCREEN = 0;
    private static final int BLOG_SCREEN = 1;

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
        Settings.TAG_BLOG_SEARCH.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
    }

    /** Tumblr's listener as the patch leaves it, answering the blog it was built with. */
    private static HushTagBlog postedBy(String blog) {
        return () -> blog;
    }

    @Test
    public void onATagOpensThePostingBlogsSearch() {
        Settings.TAG_BLOG_SEARCH.save(true);
        assertTrue(BlogTags.blogScreen(NOT_A_BLOG_SCREEN, postedBy("staff")));
        assertTrue(BlogTags.blogScreen(NOT_A_BLOG_SCREEN, postedBy("photography")));

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("tag opened on its blog 2"));
    }

    @Test
    public void offATagKeepsTumblrsSearch() {
        assertFalse(BlogTags.blogScreen(NOT_A_BLOG_SCREEN, postedBy("staff")));
        String report = String.join("\n", HookStatus.report());
        assertFalse(report, report.contains("tag opened on its blog"));
    }

    @Test
    public void aBlogsOwnScreenStaysABlogScreenWhateverTheSwitch() {
        assertTrue("off", BlogTags.blogScreen(BLOG_SCREEN, postedBy("staff")));
        assertTrue("off, no blog", BlogTags.blogScreen(BLOG_SCREEN, null));
        Settings.TAG_BLOG_SEARCH.save(true);
        assertTrue("on", BlogTags.blogScreen(BLOG_SCREEN, postedBy("staff")));
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertTrue("paused", BlogTags.blogScreen(BLOG_SCREEN, postedBy("staff")));
        SettingsContextRule.withoutContext(() ->
                assertTrue("before settings", BlogTags.blogScreen(BLOG_SCREEN, postedBy("staff"))));
    }

    @Test
    public void pausedATagKeepsTumblrsSearch() {
        Settings.TAG_BLOG_SEARCH.save(true);
        assertTrue("the control: the switch is on", BlogTags.blogScreen(NOT_A_BLOG_SCREEN, postedBy("staff")));

        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertFalse(BlogTags.blogScreen(NOT_A_BLOG_SCREEN, postedBy("staff")));
        PauseForTests.resume();
        assertTrue(BlogTags.blogScreen(NOT_A_BLOG_SCREEN, postedBy("staff")));
    }

    @Test
    public void aPostWithNoBlogNameKeepsTumblrsSearch() {
        Settings.TAG_BLOG_SEARCH.save(true);
        assertFalse("no blog", BlogTags.blogScreen(NOT_A_BLOG_SCREEN, postedBy(null)));
        assertFalse("an empty name", BlogTags.blogScreen(NOT_A_BLOG_SCREEN, postedBy("")));
        assertFalse("no listener", BlogTags.blogScreen(NOT_A_BLOG_SCREEN, null));
        assertFalse("a listener the patch didn't bridge", BlogTags.blogScreen(NOT_A_BLOG_SCREEN, new Object()));
        String report = String.join("\n", HookStatus.report());
        assertFalse(report, report.contains("tag opened on its blog"));
    }

    @Test
    public void aCommunityPostKeepsTumblrsCommunityTagFilter() {
        Settings.TAG_BLOG_SEARCH.save(true);
        assertFalse(BlogTags.blogScreen(NOT_A_BLOG_SCREEN, postedBy("@@knitting")));
    }

    @Test
    public void aColdStartOrABuildWithoutTheHookKeepsTumblrsSearch() {
        Settings.TAG_BLOG_SEARCH.save(true);
        SettingsContextRule.withoutContext(() ->
                assertFalse(BlogTags.blogScreen(NOT_A_BLOG_SCREEN, postedBy("staff"))));

        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.POST_TAGS));
        assertFalse("its hook isn't in this build", BlogTags.blogScreen(NOT_A_BLOG_SCREEN, postedBy("staff")));
    }

    @Test
    public void aBridgeThatThrowsKeepsTumblrsSearchAndIsReported() {
        Settings.TAG_BLOG_SEARCH.save(true);
        HushTagBlog broken = () -> {
            throw new IllegalStateException("changed model");
        };
        assertFalse(BlogTags.blogScreen(NOT_A_BLOG_SCREEN, broken));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("IllegalStateException"));
    }
}
