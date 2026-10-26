/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import com.facebook.graphservice.tree.TreeJNI;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Collections;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class StorySaveTitleTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    static final class Card {
        final TreeJNI story;
        Card(TreeJNI story) { this.story = story; }
    }

    @Before public void enable() {
        Settings.DOWNLOAD_STORIES.save(true);
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.DOWNLOAD_STORIES.resetToDefault();
        HookStatus.clear();
    }

    private static Card reel(boolean manifestOnly) {
        TreeJNI video = new TreeJNI().with("playlist", manifestOnly ? "<MPD></MPD>" : null);
        TreeJNI sticker = new TreeJNI().with("fb_shorts_story", new TreeJNI()
                .with("short_form_video_context", new TreeJNI().with("video", video)));
        if (!manifestOnly) sticker.with("playable_url", "https://video.xx.fbcdn.net/reel.mp4");
        return new Card(new TreeJNI().with("story_overlays", Collections.singletonList(sticker)));
    }

    @Test public void aResharedReelUsesTheVideoTitleInsteadOfItsStillCardTitle() {
        assertEquals("Save video", StoryPhoto.saveTitle(reel(false), "Save photo"));
    }

    @Test public void aManifestOnlyReshareOverridesTheNativeResourceFallback() {
        assertEquals("Save video", StoryPhoto.saveTitle(reel(true), null));
    }

    @Test public void ordinaryStoriesAndUnreadableCardsKeepTheExactNativeTitle() {
        String original = new String("Save reel");
        for (Object card : new Object[]{new Card(new TreeJNI()), new Object(), "unknown", null}) {
            assertSame(original, StoryPhoto.saveTitle(card, original));
            assertNull(StoryPhoto.saveTitle(card, null));
        }
    }

    @Test public void aReleasedNestedVideoKeepsTheNativeTitleWithoutReadingIt() {
        TreeJNI video = new TreeJNI().with("playlist", "<MPD></MPD>").releasedTree();
        TreeJNI reel = new TreeJNI().with("short_form_video_context", new TreeJNI().with("video", video));
        Card card = new Card(new TreeJNI().with("story_overlays", Collections.singletonList(
                new TreeJNI().with("fb_shorts_story", reel))));
        assertEquals("Save photo", StoryPhoto.saveTitle(card, "Save photo"));
        assertFalse("a title read a released native video tree", video.readAfterRelease);
    }

    @Test public void offPauseAndEarlyStartupKeepFacebooksTitle() {
        Card card = reel(false);
        String original = new String("Save photo");
        Settings.DOWNLOAD_STORIES.save(false);
        assertSame(original, StoryPhoto.saveTitle(card, original));
        Settings.DOWNLOAD_STORIES.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertSame(original, StoryPhoto.saveTitle(card, original));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertSame(original, StoryPhoto.saveTitle(card, original)));
        SettingsContextRule.beforeThePauseIsDecided(() -> assertSame(original, StoryPhoto.saveTitle(card, original)));
    }
}
