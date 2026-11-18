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
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** #19: with auto-play off, a tap on a feed video could only open the full-screen player. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FeedVideoTapTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final class Video implements HushFeedVideo {
        int answer = 1;
        int starts;
        int pauses;
        boolean breaksOnPause;

        @Override public int hushPlayInPlace() {
            starts++;
            return answer;
        }

        @Override public void hushPausePlayback() {
            pauses++;
            if (breaksOnPause) throw new IllegalStateException("player released");
        }
    }

    @Before public void setUp() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        Settings.TAP_TO_PLAY_FEED_VIDEOS.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
    }

    @After public void restore() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.resetToDefault();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        HookStatus.clear();
    }

    @Test public void theSwitchStartsOffAndTumblrKeepsTheTap() {
        assertFalse(Settings.TAP_TO_PLAY_FEED_VIDEOS.defaultValue);
        Video video = new Video();
        assertEquals(0, FeedVideoTap.onTap(video));
        assertEquals(0, video.starts);
    }

    @Test public void aTapStartsAStoppedVideoInPlace() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.save(true);
        Video video = new Video();
        assertEquals(1, FeedVideoTap.onTap(video));
        assertEquals(1, video.starts);
    }

    @Test public void aVideoThatDidNotStartLeavesTheTapToTumblr() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.save(true);
        Video playing = new Video();
        playing.answer = 0;
        assertEquals(0, FeedVideoTap.onTap(playing));
        assertEquals(1, playing.starts);
    }

    @Test public void startingAnotherVideoPausesTheOneTappedBefore() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.save(true);
        Video first = new Video();
        Video second = new Video();
        FeedVideoTap.onTap(first);
        FeedVideoTap.onTap(second);
        assertEquals(1, first.pauses);
        assertEquals(0, second.pauses);
    }

    @Test public void tappingTheSameVideoAgainNeverPausesIt() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.save(true);
        Video video = new Video();
        FeedVideoTap.onTap(video);
        FeedVideoTap.onTap(video);
        assertEquals(0, video.pauses);
    }

    @Test public void aTapThatGoesFullScreenLeavesTheOtherVideoAlone() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.save(true);
        Video first = new Video();
        Video playing = new Video();
        playing.answer = 0;
        FeedVideoTap.onTap(first);
        FeedVideoTap.onTap(playing);
        assertEquals(0, first.pauses);
    }

    @Test public void aPauseThatFailsStillCountsAsStarted() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.save(true);
        Video first = new Video();
        first.breaksOnPause = true;
        FeedVideoTap.onTap(first);
        assertEquals(1, FeedVideoTap.onTap(new Video()));
    }

    @Test public void aVideoThatThrowsLeavesTheTapToTumblr() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.save(true);
        assertEquals(0, FeedVideoTap.onTap(new HushFeedVideo() {
            @Override public int hushPlayInPlace() {
                throw new IllegalStateException("no player");
            }

            @Override public void hushPausePlayback() {
            }
        }));
    }

    @Test public void anythingElseLeavesTheTapToTumblr() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.save(true);
        assertEquals(0, FeedVideoTap.onTap(new Object()));
        assertEquals(0, FeedVideoTap.onTap(null));
    }

    @Test public void aBuildWithoutTheHookLeavesTheTapToTumblr() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.complementOf(EnumSet.of(PatchFamily.Capability.FEED_VIDEO_TAP)));
        Video video = new Video();
        assertEquals(0, FeedVideoTap.onTap(video));
        assertEquals(0, video.starts);
    }

    @Test public void everyPauseKeepsTheSavedChoiceAndLeavesTheTapToTumblr() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.save(true);
        for (HushTumblrPause.Reason reason : HushTumblrPause.Reason.values()) {
            if (reason == HushTumblrPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            Video video = new Video();
            assertEquals(reason.name(), 0, FeedVideoTap.onTap(video));
            assertEquals(reason.name(), 0, video.starts);
            assertTrue(reason.name(), Settings.TAP_TO_PLAY_FEED_VIDEOS.savedValue());
            PauseForTests.resume();
        }
    }

    @Test public void settingsThatAreNotReadyLeaveTheTapToTumblr() {
        Settings.TAP_TO_PLAY_FEED_VIDEOS.save(true);
        Video video = new Video();
        SettingsContextRule.withoutContext(() -> assertEquals(0, FeedVideoTap.onTap(video)));
        assertEquals(0, video.starts);
    }
}
