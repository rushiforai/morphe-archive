/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.comment;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.categories.CommentsPreferenceCategory;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Allow photo comments on PineDrama, off, on and paused (#156). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class CommentPhotosTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    public static final class TestActivity extends PreferenceActivity {
        @Override public void onCreate(android.os.Bundle state) {
            setTheme(android.R.style.Theme_Material_NoActionBar);
            super.onCreate(state);
        }
    }

    @After public void tearDown() {
        PausedProcess.set(false);
        Settings.PINEDRAMA_COMMENT_PHOTOS.resetToDefault();
    }

    @Test public void offPineDramaAnswersAsItShips() {
        assertEquals(Boolean.FALSE, Settings.PINEDRAMA_COMMENT_PHOTOS.defaultValue);
        assertFalse(CommentPhotos.isOn());
    }

    @Test public void onTheGateHandsBackTheServerValue() {
        Settings.PINEDRAMA_COMMENT_PHOTOS.save(true);
        assertTrue(CommentPhotos.isOn());
        Settings.PINEDRAMA_COMMENT_PHOTOS.save(false);
        assertFalse(CommentPhotos.isOn());
    }

    @Test public void pausedPineDramaAnswersAsItShipsWithTheSwitchOn() {
        Settings.PINEDRAMA_COMMENT_PHOTOS.save(true);
        PausedProcess.set(true);
        assertFalse(CommentPhotos.isOn());
    }

    @Test public void onlyTheCommentAlbumEntryIsReportedInstalled() {
        assertFalse("off", CommentPhotos.allowPluginEntry("comment_photo_comment_panel_upload"));
        Settings.PINEDRAMA_COMMENT_PHOTOS.save(true);
        assertTrue(CommentPhotos.allowPluginEntry("comment_photo_comment_panel_upload"));
        assertFalse("the photo editor keeps PineDrama's answer", CommentPhotos.allowPluginEntry("CommentImageEdit"));
        assertFalse(CommentPhotos.allowPluginEntry("record"));
        assertFalse(CommentPhotos.allowPluginEntry(null));
        PausedProcess.set(true);
        assertFalse("paused", CommentPhotos.allowPluginEntry("comment_photo_comment_panel_upload"));
    }

    @Test public void theSwitchIsReachable() {
        try (var controller = Robolectric.buildActivity(TestActivity.class).setup()) {
            var activity = controller.get();
            Utils.setContext(activity);
            SettingsStatus.commentPhotosEnabled = true;
            PreferenceScreen screen = activity.getPreferenceManager().createPreferenceScreen(activity);
            new CommentsPreferenceCategory(activity, screen);
            assertNotNull(screen.findPreference(CommentPhotos.SWITCH_KEY));
        } finally {
            SettingsStatus.commentPhotosEnabled = false;
        }
    }
}
