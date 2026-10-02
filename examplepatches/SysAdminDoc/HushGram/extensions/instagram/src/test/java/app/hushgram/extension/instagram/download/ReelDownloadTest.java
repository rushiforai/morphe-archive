/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.os.Looper;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.shadows.ShadowToast;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;

/** What the reel menu's hooks answer, and what a tap on Download does with them. */
@RunWith(RobolectricTestRunner.class)
public class ReelDownloadTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void tearDown() {
        Settings.DOWNLOAD_REELS.save(true);
    }

    /** With the switch on, every reel gets the row, whatever Instagram and its flag say. */
    @Test
    public void withTheSwitchOnEveryReelOffersDownload() {
        assertTrue(ReelDownload.offer(false));
        assertTrue(ReelDownload.offer(true));
        assertFalse(ReelDownload.withhold(true));
        assertFalse(ReelDownload.withhold(false));
    }

    /** Off, the menu is Instagram's own. Pause turns the switch off for the whole process, as it does every switch. */
    @Test
    public void offInstagramDecides() {
        Settings.DOWNLOAD_REELS.save(false);
        assertFalse(ReelDownload.offer(false));
        assertTrue(ReelDownload.offer(true));
        assertTrue(ReelDownload.withhold(true));
        assertFalse(ReelDownload.withhold(false));
        assertFalse("a tap was taken from Instagram", ReelDownload.save(new Object(), null));
        List<Object> reduced = options(Option.PLAYBACK_CONTROLS, Option.REPORT);
        ReelDownload.addTo(reduced, Option.DOWNLOAD);
        assertEquals(options(Option.PLAYBACK_CONTROLS, Option.REPORT), reduced);
    }

    /** The patch hands Instagram's answers over as ints, since a boolean method may return one. Non-zero is yes. */
    @Test
    public void thePatchsIntEntriesReadNonZeroAsYes() {
        assertTrue(ReelDownload.offer(0));
        assertTrue(ReelDownload.offer(2));
        assertFalse(ReelDownload.withhold(1));
        Settings.DOWNLOAD_REELS.save(false);
        assertFalse("with the switch off, 0 became a yes", ReelDownload.offer(0));
        assertTrue("with the switch off, 1 lost Instagram's yes", ReelDownload.offer(1));
        assertTrue("2 is a yes too", ReelDownload.offer(2));
        assertFalse(ReelDownload.withhold(0));
        assertTrue("with the switch off, Instagram's flag lost its hold", ReelDownload.withhold(1));
        assertTrue(ReelDownload.withhold(2));
    }

    /** Instagram's option names, as the reduced reel menu's list holds them. */
    private enum Option { SHOP_SIMILAR, SAVE, UNSAVE, PLAYBACK_CONTROLS, DOWNLOAD, WHY_AM_I_SEEING_THIS, REPORT }

    private static List<Object> options(Object... options) {
        return new ArrayList<>(Arrays.asList(options));
    }

    /** The reduced menu gets Download after its save rows, which is above Playback, and only once. */
    @Test
    public void theReducedMenuGetsDownloadAboveItsRows() {
        List<Object> plain = options(Option.PLAYBACK_CONTROLS, Option.WHY_AM_I_SEEING_THIS, Option.REPORT);
        ReelDownload.addTo(plain, Option.DOWNLOAD);
        assertEquals(options(Option.DOWNLOAD, Option.PLAYBACK_CONTROLS, Option.WHY_AM_I_SEEING_THIS, Option.REPORT), plain);

        List<Object> saved = options(Option.SHOP_SIMILAR, Option.UNSAVE, Option.PLAYBACK_CONTROLS, Option.REPORT);
        ReelDownload.addTo(saved, Option.DOWNLOAD);
        assertEquals(options(Option.SHOP_SIMILAR, Option.UNSAVE, Option.DOWNLOAD, Option.PLAYBACK_CONTROLS, Option.REPORT), saved);

        List<Object> already = options(Option.DOWNLOAD, Option.REPORT);
        ReelDownload.addTo(already, Option.DOWNLOAD);
        assertEquals(options(Option.DOWNLOAD, Option.REPORT), already);

        List<Object> empty = options();
        ReelDownload.addTo(empty, Option.DOWNLOAD);
        assertEquals(options(Option.DOWNLOAD), empty);
        ReelDownload.addTo(null, Option.DOWNLOAD);
    }

    /**
     * A tap with the switch on is HushGram's, even when the reel gives nothing to save: an unpatched
     * build's bridges answer nothing, so the save can't start, and the toast says so rather than
     * Instagram's own download starting.
     */
    @Test
    public void aTapWithNothingToSaveSaysSo() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();

        assertTrue(ReelDownload.save(new Object(), activity));
        Shadows.shadowOf(Looper.getMainLooper()).idle();

        assertEquals("Download failed", String.valueOf(ShadowToast.getTextOfLatestToast()));
    }

    /** Without the bridges written, a reel has no files and no details, and neither read throws. */
    @Test
    public void anUnpatchedReelHasNothing() {
        Object reel = new Object();
        assertTrue(ReelDownload.renditions(reel).isEmpty());
        PostDetails details = ReelDownload.details(reel);
        assertFalse(details.hasVideoId());
        assertFalse(details.hasOwner());
        assertNull(details.posted);
    }
}
