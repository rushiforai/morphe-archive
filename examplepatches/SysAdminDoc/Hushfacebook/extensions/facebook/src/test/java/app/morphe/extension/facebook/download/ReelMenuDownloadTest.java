/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.facebook.video.engine.api.VideoPlayerParams;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.net.InetAddress;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Issue #18: reels drawn without the UDD sidebar had no Download anywhere. Their More sheet now gets
 * a Download row, whose handler comes from {@link ReelMenuDownload#forReel} each time a sheet is
 * built. The switch, a pause and a start before the settings are ready each leave the sheet as
 * Facebook built it, counted apart the way the sidebar's reasons are, and a tap saves the reel once.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelMenuDownloadTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    @After
    public void clean() {
        HookStatus.clear();
        PauseForTests.resume();
        Settings.DOWNLOAD_REELS.resetToDefault();
    }

    private static Object reel() {
        return new FileNameTemplateTest.ReelSourceParams(new VideoPlayerParams(
                "VideoId: 2233445566778899", new FileNameTemplateTest.ReelSource(
                        "https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/clip_720p.mp4?oh=1&oe=2")));
    }

    private static ReelMenuDownload row(Object player) {
        return ReelMenuDownload.forReel(player, RuntimeEnvironment.getApplication(), "hd", "sd", "manifest", null);
    }

    private static String line() {
        List<String> lines = HookStatus.report();
        assertEquals(lines.toString(), 1, lines.size());
        return lines.get(0);
    }

    @Test
    public void aSheetBuiltWithTheRowIsCounted() {
        assertNotNull(row(reel()));
        assertNotNull(row(reel()));
        assertEquals("Download any reel: invoked 0, 0 found, 0 missing. Counted: " + ReelMenuDownload.ROW_ADDED + " 2",
                line());
    }

    @Test
    public void eachReasonTheRowStaysOutIsCountedApart() {
        Settings.DOWNLOAD_REELS.save(false);
        assertNull(row(reel()));

        Settings.DOWNLOAD_REELS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertNull("a paused build added the row", row(reel()));
        PauseForTests.resume();

        SettingsContextRule.beforeThePauseIsDecided(() -> assertNull(row(reel())));

        String line = line();
        assertTrue(line, line.contains(ReelMenuDownload.ROW_SWITCH_OFF + " 1"));
        assertTrue(line, line.contains(ReelMenuDownload.ROW_PAUSED + " 1"));
        assertTrue(line, line.contains(ReelMenuDownload.ROW_NOT_READY + " 1"));
        assertFalse(line, line.contains(ReelMenuDownload.ROW_ADDED));
    }

    /** Facebook found no player state for the reel: no row, and nothing counted as added. */
    @Test
    public void noPlayerStateMeansNoRow() {
        assertNull(row(null));
        assertEquals(Collections.emptyList(), HookStatus.report());
    }

    @Test
    public void eachTapOfTheRowSavesOnce() throws Exception {
        AtomicInteger saves = new AtomicInteger();
        MediaDownload.detailsForTests = details -> saves.incrementAndGet();
        // Every Meta name answers a private address, so each save stops before it connects.
        MediaDownload.policyForTests = new MediaUrlPolicy(host -> new InetAddress[] { InetAddress.getByName("10.9.8.7") });
        try {
            ReelMenuDownload handler = row(reel());
            assertNotNull(handler);
            handler.run();
            handler.run();
            long deadline = System.nanoTime() + 20_000_000_000L;
            while (MediaDownload.savesInFlight() > 0) {
                assertTrue("a save never finished", System.nanoTime() < deadline);
                Thread.sleep(10);
            }
        } finally {
            MediaDownload.detailsForTests = null;
            MediaDownload.policyForTests = null;
            LogBufferManager.clearLogBuffer();
        }
        assertEquals("two taps", 2, saves.get());
    }

    /** The phrases are the whole of what a count says: no id, name or address of a reel. */
    @Test
    public void everyCountedPhraseIsFixedText() {
        for (String phrase : new String[]{ReelMenuDownload.ROW_ADDED, ReelMenuDownload.ROW_SWITCH_OFF,
                ReelMenuDownload.ROW_PAUSED, ReelMenuDownload.ROW_NOT_READY}) {
            assertTrue(phrase, phrase.matches("[A-Za-z ,]+"));
        }
        assertEquals(Collections.emptyList(), HookStatus.report());
    }
}
