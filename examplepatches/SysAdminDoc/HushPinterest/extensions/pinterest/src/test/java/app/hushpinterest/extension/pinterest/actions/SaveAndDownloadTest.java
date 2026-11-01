/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.app.Application;
import android.app.DownloadManager;
import android.content.Context;
import android.os.Looper;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDownloadManager;
import org.robolectric.shadows.ShadowToast;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;

import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/** Save pins you download and Download pins you save (#17): both directions, and never a loop between them. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SaveAndDownloadTest {
    private static final Map<String, Object> PIN = Map.of("id", "123", "images", Map.of("orig", Map.of(
            "url", "https://i.pinimg.com/originals/source.png", "width", 3000, "height", 2000)));
    private static final Object SAVER = new Object();
    private static final String NOT_SAVED = "Couldn't save this pin. Open it once, then try again.";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for Pinterest: a save goes back through the method every save goes through, as the real one does. */
    private static final class FakeHost implements SaveAndDownload.Host {
        final List<Object> saves = new ArrayList<>();
        boolean alreadySaved;
        RuntimeException failure;

        @Override public void save(Object saver, Object pin) {
            assertSame(SAVER, saver);
            saves.add(pin);
            if (failure != null) throw failure;
            SaveAndDownload.saving(pin);
        }

        @Override public boolean saved(Object pin) { return alreadySaved; }
    }

    private Application app;
    private ShadowDownloadManager downloads;
    private FakeHost host;

    @Before public void setUp() {
        app = RuntimeEnvironment.getApplication();
        downloads = Shadows.shadowOf((DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE));
        PauseForTests.resume();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS, PatchFamily.Capability.SAVE_AND_DOWNLOAD));
        Settings.DOWNLOAD_PINS.save(true);
        host = new FakeHost();
        SaveAndDownload.hostForTests = host;
        SaveAndDownload.latest = SAVER;
        ShadowToast.reset();
    }

    @After public void tearDown() {
        SaveAndDownload.hostForTests = null;
        SaveAndDownload.latest = null;
        Settings.SAVE_DOWNLOADED_PINS.save(false);
        Settings.DOWNLOAD_SAVED_PINS.save(false);
        Settings.DOWNLOAD_PINS.save(false);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
    }

    private int queued(Runnable action) throws Exception {
        int before = downloads.getRequestCount();
        action.run();
        Utils.awaitBackgroundTasksForTests();
        return downloads.getRequestCount() - before;
    }

    private int download() throws Exception {
        return queued(() -> assertTrue(PinDownloads.start(PIN, app)));
    }

    private int save() throws Exception {
        return queued(() -> SaveAndDownload.saving(PIN));
    }

    @Test public void bothSwitchesStartOff() {
        assertFalse(Settings.SAVE_DOWNLOADED_PINS.defaultValue);
        assertFalse(Settings.DOWNLOAD_SAVED_PINS.defaultValue);
    }

    @Test public void aDownloadSavesThePinOnlyWithItsSwitchOn() throws Exception {
        assertEquals(1, download());
        assertTrue("off by default", host.saves.isEmpty());

        Settings.SAVE_DOWNLOADED_PINS.save(true);
        assertEquals(1, download());
        assertEquals(List.of(PIN), host.saves);
    }

    @Test public void aSaveDownloadsThePinOnlyWithItsSwitchOn() throws Exception {
        assertEquals("off by default", 0, save());

        Settings.DOWNLOAD_SAVED_PINS.save(true);
        assertEquals(1, save());
    }

    @Test public void aPinThatIsAlreadySavedIsNotSavedAgain() throws Exception {
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        host.alreadySaved = true;
        assertEquals("the download still goes ahead", 1, download());
        assertTrue(host.saves.isEmpty());
        assertFalse("and nothing nags about it", told());
    }

    @Test public void withBothOnADownloadDownloadsOnceAndSavesOnce() throws Exception {
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        Settings.DOWNLOAD_SAVED_PINS.save(true);
        assertEquals("its own save doesn't download it again", 1, download());
        assertEquals(List.of(PIN), host.saves);
    }

    @Test public void withBothOnASaveDownloadsOnceAndDoesNotSaveAgain() throws Exception {
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        Settings.DOWNLOAD_SAVED_PINS.save(true);
        assertEquals(1, save());
        assertTrue(host.saves.isEmpty());
    }

    @Test public void aDownloadsOwnSaveOnlyGuardsItself() throws Exception {
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        Settings.DOWNLOAD_SAVED_PINS.save(true);
        assertEquals(1, download());
        assertEquals("a save of your own afterwards downloads as usual", 1, save());
    }

    @Test public void gridAndBoardDownloadsAreNeverSaved() throws Exception {
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        assertEquals(1, queued(() -> assertTrue(PinDownloads.start(PIN, app, result -> {}))));
        assertTrue(host.saves.isEmpty());
    }

    @Test public void withNoQuickSaveYetYouAreToldAndTheDownloadStands() throws Exception {
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        SaveAndDownload.latest = null;
        assertEquals(1, download());
        assertTrue(host.saves.isEmpty());
        assertTrue(told());
    }

    @Test public void aFailedSaveIsToldAndLeavesTheGuardClear() throws Exception {
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        Settings.DOWNLOAD_SAVED_PINS.save(true);
        host.failure = new IllegalStateException("host changed");
        assertEquals("the download still stands", 1, download());
        assertTrue(told());
        assertEquals("the next save isn't mistaken for the failed one", 1, save());
    }

    @Test public void downloadPinsOffTakesBothWithIt() throws Exception {
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        Settings.DOWNLOAD_SAVED_PINS.save(true);
        Settings.DOWNLOAD_PINS.save(false);
        assertFalse(PinDownloads.start(PIN, app));
        assertEquals(0, save());
        assertTrue(host.saves.isEmpty());
    }

    @Test public void pauseTurnsBothOff() throws Exception {
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        Settings.DOWNLOAD_SAVED_PINS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(SaveAndDownloadForTests.savesADownload(PIN));
        assertFalse(SaveAndDownloadForTests.downloadsASave(PIN));
        PauseForTests.resume();
        assertTrue(SaveAndDownloadForTests.savesADownload(PIN));
        assertTrue(SaveAndDownloadForTests.downloadsASave(PIN));
    }

    @Test public void aBuildWithoutTheHooksDoesNothingAndKeepsNoHelper() throws Exception {
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.PIN_DOWNLOADS));
        Settings.SAVE_DOWNLOADED_PINS.save(true);
        Settings.DOWNLOAD_SAVED_PINS.save(true);
        assertEquals("the download itself is Download pins'", 1, download());
        assertEquals(0, save());
        assertTrue(host.saves.isEmpty());
        SaveAndDownload.latest = null;
        SaveAndDownload.saver(SAVER);
        assertNull(SaveAndDownload.latest);
    }

    @Test public void theHelperIsKeptWithTheSwitchOffSoItCanTurnOnLater() {
        SaveAndDownload.latest = null;
        SaveAndDownload.saver(SAVER);
        assertSame(SAVER, SaveAndDownload.latest);
    }

    private static boolean told() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        return ShadowToast.showedToast(NOT_SAVED);
    }
}
