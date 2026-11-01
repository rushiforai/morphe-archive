/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import com.tumblr.rumblr.model.TimelineObject;
import com.tumblr.rumblr.model.post.blocks.TextBlock;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;
import app.hushtumblr.extension.tumblr.settings.TextSettings;

/** A post asked for by name, from a link or a notification, gets past the switches that clear a feed. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DirectPostsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void hideReblogsIsOn() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        Settings.HIDE_ADS.save(false);
        Settings.HIDE_REBLOGS.save(true);
        TimelinePaging.resetForTests();
        DirectPosts.resetForTests();
    }

    @After
    public void restore() {
        Settings.HIDE_ADS.resetToDefault();
        Settings.HIDE_REBLOGS.resetToDefault();
        Settings.HIDE_POSTS_WITH_WORDS.resetToDefault();
        TextSettings.HIDDEN_WORDS.resetToDefault();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        TimelinePaging.resetForTests();
        DirectPosts.resetForTests();
        HookStatus.clear();
    }

    private static TimelineObject reblog(String id, String text) {
        return TimelineItems.reblogWithId(id, Collections.singletonList(new TextBlock(text)));
    }

    private static List<?> shown(Object... items) {
        return TimelineFilter.filter(Arrays.asList(items));
    }

    @Test
    public void aReblogNobodyAskedForStillGoes() {
        assertTrue(shown(reblog("55", "first")).isEmpty());
    }

    @Test
    public void aReblogOpenedByItselfStaysWithHideReblogsOn() {
        TimelineObject reblog = reblog("55", "first");
        DirectPosts.opening("55");
        assertEquals(Collections.singletonList(reblog), shown(reblog));
    }

    @Test
    public void onlyThePostAskedForGetsPast() {
        TimelineObject asked = reblog("55", "first");
        DirectPosts.opening("55");
        assertEquals(Collections.singletonList(asked), shown(reblog("56", "first"), asked, reblog("57", "first")));
    }

    @Test
    public void theAskIsUsedUpSoAFeedLaterStillHidesIt() {
        DirectPosts.opening("55");
        assertEquals(1, shown(reblog("55", "first")).size());
        assertTrue(shown(reblog("55", "first")).isEmpty());
    }

    @Test
    public void aRefreshAsksAgain() {
        DirectPosts.opening("55");
        assertEquals(1, shown(reblog("55", "first")).size());
        DirectPosts.opening("55");
        assertEquals(1, shown(reblog("55", "first")).size());
    }

    @Test
    public void aSubclassesKeptListIsReadOnceSoItsAskCoversBothConstructors() {
        TimelineObject reblog = reblog("55", "first");
        DirectPosts.opening("55");
        List<?> kept = TimelineFilter.filterKept(Arrays.asList(reblog));
        assertEquals(Collections.singletonList(reblog), kept);
        assertEquals(Collections.singletonList(reblog), TimelineFilter.filter(kept));
    }

    @Test
    public void aHiddenWordLetsItThroughToo() {
        Settings.HIDE_REBLOGS.save(false);
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("first");
        TimelineObject post = TimelineItems.postWithId("56", new TextBlock("first"));
        assertTrue(shown(post).isEmpty());
        DirectPosts.opening("56");
        assertEquals(Collections.singletonList(post), shown(post));
    }

    @Test
    public void asksThatNeverGetAnAnswerAreLetGoOldestFirst() {
        for (int id = 1; id <= 9; id++) DirectPosts.opening(String.valueOf(id));
        assertTrue(shown(reblog("1", "first")).isEmpty());
        assertEquals(1, shown(reblog("2", "first")).size());
        assertEquals(1, shown(reblog("9", "first")).size());
    }

    @Test
    public void aQueryWithNoIdAsksForNothing() {
        DirectPosts.opening(null);
        DirectPosts.opening("");
        assertTrue(shown(reblog("", "first")).isEmpty());
    }
}
