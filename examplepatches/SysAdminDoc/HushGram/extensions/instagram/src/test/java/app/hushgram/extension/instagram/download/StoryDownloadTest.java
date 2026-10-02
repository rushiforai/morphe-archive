/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.os.Looper;
import android.text.SpannableString;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.shadows.ShadowToast;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;

/** What the story menu's hooks answer, and what a tap on Download does with them. */
@RunWith(RobolectricTestRunner.class)
public class StoryDownloadTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void tearDown() {
        Settings.DOWNLOAD_STORIES.save(true);
    }

    /** With the switch on, Download goes at the end of any story's menu, and only once. */
    @Test
    public void withTheSwitchOnEveryStoryOffersDownload() {
        CharSequence[] menu = {"Report", "Mute"};
        assertArrayEquals(new CharSequence[] {"Report", "Mute", "Download"}, StoryDownload.labels(menu));

        CharSequence[] already = {"Report", new SpannableString("Download")};
        assertSame(already, StoryDownload.labels(already));

        assertArrayEquals(new CharSequence[] {"Download"}, StoryDownload.labels(new CharSequence[0]));
        assertNull(StoryDownload.labels(null));
    }

    /** Off, the menu and every tap are Instagram's own. */
    @Test
    public void offInstagramDecides() {
        Settings.DOWNLOAD_STORIES.save(false);
        CharSequence[] menu = {"Report", "Mute"};
        assertSame(menu, StoryDownload.labels(menu));
        assertFalse("a tap was taken from Instagram", StoryDownload.save("Download", new Object()));
    }

    /** Any label but Download goes on to Instagram's handler. */
    @Test
    public void anotherLabelGoesOn() {
        assertFalse(StoryDownload.save("Report", new Object()));
        assertFalse(StoryDownload.save(null, new Object()));
    }

    /**
     * A tap on Download is HushGram's, even when the story gives nothing to save: an unpatched
     * build's bridges answer nothing, so the save can't start, and the toast says so. The label
     * counts however the menu styled it.
     */
    @Test
    public void aTapWithNothingToSaveSaysSo() {
        assertTrue(StoryDownload.save(new SpannableString("Download"), new Object()));
        Shadows.shadowOf(Looper.getMainLooper()).idle();

        assertEquals("Download failed", String.valueOf(ShadowToast.getTextOfLatestToast()));
    }

    /** Without the bridges written, a story has no picture, and the read doesn't throw. */
    @Test
    public void anUnpatchedStoryHasNoPicture() {
        assertTrue(StoryDownload.pictures(new Object()).isEmpty());
    }
}
