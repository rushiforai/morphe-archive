/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class GalleryCameraTileTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_GALLERY_CAMERA_TILE);
        Settings.HIDE_GALLERY_CAMERA_TILE.resetToDefault();
        Settings.GALLERY_CAMERA_ON_TAP.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultTheGalleryKeepsItsTile() {
        assertFalse(Settings.HIDE_GALLERY_CAMERA_TILE.get());
        assertTrue(GalleryCameraTile.tile(true));
        assertFalse(GalleryCameraTile.tile(false));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.HIDE_GALLERY_CAMERA_TILE));
    }

    @Test public void onTheGalleryIsBuiltWithoutTheTile() {
        Settings.HIDE_GALLERY_CAMERA_TILE.save(true);
        assertFalse(GalleryCameraTile.tile(true));
        assertFalse(GalleryCameraTile.tile(false));
    }

    @Test public void withCameraOnTapAlsoOnHidingWinsAndASleepingGalleryStaysQuiet() {
        Settings.HIDE_GALLERY_CAMERA_TILE.save(true);
        Settings.GALLERY_CAMERA_ON_TAP.save(true);
        Object gallery = new Object();
        GalleryCamera.sleep(gallery);
        assertFalse(GalleryCameraTile.tile(true));
        // A gallery without a tile never builds a camera view, so nothing opens by itself.
        assertFalse(GalleryCamera.openWhenReady(gallery, null));
        assertTrue(GalleryCamera.keepCameraOff(gallery));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheTile() {
        Settings.HIDE_GALLERY_CAMERA_TILE.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertTrue(reason.name(), GalleryCameraTile.tile(true));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertTrue(GalleryCameraTile.tile(true)));
        SettingReadsForTests.breakReads(Settings.HIDE_GALLERY_CAMERA_TILE);
        assertTrue(GalleryCameraTile.tile(true));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_GALLERY_CAMERA_TILE).isEmpty());
    }
}
