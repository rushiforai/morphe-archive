/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowSystemClock;

import java.time.Duration;
import java.util.Collections;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class GalleryCameraTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stand-ins for two ChatAttachAlertPhotoLayouts and a camera view. */
    private final Object gallery = new Object();
    private final Object otherGallery = new Object();
    private final Object cameraView = new Object();

    @Before public void setUp() {
        Settings.GALLERY_CAMERA_ON_TAP.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.GALLERY_CAMERA_ON_TAP);
        Settings.GALLERY_CAMERA_ON_TAP.resetToDefault();
        GalleryCamera.sleep(gallery);
        GalleryCamera.sleep(otherGallery);
        HookStatus.clear();
    }

    @Test public void offByDefaultSoTheGalleryStartsItsCameraAsTelegramDoes() {
        assertFalse(Settings.GALLERY_CAMERA_ON_TAP.get());
        assertStock(gallery);
        assertEquals(Collections.singletonList("Gallery camera on tap: invoked 3, 0 found, 0 missing"), HookStatus.report());
    }

    @Test public void switchedOnAGalleryKeepsItsCameraOffUntilATap() {
        Settings.GALLERY_CAMERA_ON_TAP.save(true);
        assertTrue(GalleryCamera.keepCameraOff(gallery));
        assertTrue(GalleryCamera.keepCameraOff(gallery));
        assertFalse("nothing opens a camera no tap woke", GalleryCamera.openWhenReady(gallery, cameraView));
        assertEquals(Collections.singletonList("Gallery camera on tap: invoked 2, 0 found, 0 missing. Counted: gallery camera kept off 2"),
                HookStatus.report());
    }

    @Test public void aTapWakesThatGalleryAndOpensItsCameraOnceTheViewExists() {
        Settings.GALLERY_CAMERA_ON_TAP.save(true);
        assertTrue("the hook runs checkCamera(true) itself", GalleryCamera.wakeOnTap(gallery, null));
        assertFalse(GalleryCamera.keepCameraOff(gallery));
        assertTrue("another gallery stays asleep", GalleryCamera.keepCameraOff(otherGallery));
        assertFalse("still starting, no view yet", GalleryCamera.openWhenReady(gallery, null));
        assertTrue(GalleryCamera.openWhenReady(gallery, cameraView));
        assertFalse("it opens once", GalleryCamera.openWhenReady(gallery, cameraView));
        assertFalse("an awake gallery with a view opens it the stock way", GalleryCamera.wakeOnTap(gallery, cameraView));
        assertTrue("a tap while the view is still missing starts it again", GalleryCamera.wakeOnTap(gallery, null));
        assertTrue(GalleryCamera.openWhenReady(gallery, cameraView));
    }

    @Test public void aNewOpenPutsTheGalleryBackToSleep() {
        Settings.GALLERY_CAMERA_ON_TAP.save(true);
        assertTrue(GalleryCamera.wakeOnTap(gallery, null));
        GalleryCamera.sleep(gallery);
        assertTrue(GalleryCamera.keepCameraOff(gallery));
        assertFalse(GalleryCamera.openWhenReady(gallery, cameraView));
    }

    @Test public void aWokenCameraDoesNotOpenByItselfOnceTheSwitchIsOffOrPaused() {
        Settings.GALLERY_CAMERA_ON_TAP.save(true);
        assertTrue(GalleryCamera.wakeOnTap(gallery, null));
        Settings.GALLERY_CAMERA_ON_TAP.save(false);
        assertFalse("switched off after the tap", GalleryCamera.openWhenReady(gallery, cameraView));
        Settings.GALLERY_CAMERA_ON_TAP.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse("paused after the tap", GalleryCamera.openWhenReady(gallery, cameraView));
        PauseForTests.resume();
        assertTrue("back on, the tap still opens it", GalleryCamera.openWhenReady(gallery, cameraView));
    }

    @Test public void aCameraThatTakesTooLongDoesNotOpenByItself() {
        Settings.GALLERY_CAMERA_ON_TAP.save(true);
        assertTrue(GalleryCamera.wakeOnTap(gallery, null));
        ShadowSystemClock.advanceBy(Duration.ofMillis(GalleryCamera.OPEN_WINDOW_MS + 1));
        assertFalse(GalleryCamera.openWhenReady(gallery, cameraView));
        assertFalse("the gallery stays awake", GalleryCamera.keepCameraOff(gallery));
    }

    @Test public void aPermissionRequestFromATapWakesTheGalleryForTheGrant() {
        Settings.GALLERY_CAMERA_ON_TAP.save(true);
        GalleryCamera.wakeForPermission(gallery);
        assertFalse(GalleryCamera.keepCameraOff(gallery));
        assertTrue(GalleryCamera.openWhenReady(gallery, cameraView));
        assertEquals(Collections.singletonList("Gallery camera on tap: invoked 2, 0 found, 0 missing. "
                        + "Counted: permission request woke the camera 1, woken camera opened 1"),
                HookStatus.report());
    }

    @Test public void everyPauseReasonStartsTheCameraAsTelegramDoesAndResumeRestoresTheGate() {
        Settings.GALLERY_CAMERA_ON_TAP.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertStock(gallery);
            PauseForTests.resume();
        }
        assertTrue(GalleryCamera.keepCameraOff(gallery));
    }

    @Test public void unavailableSettingsStartTheCameraAsTelegramDoes() {
        Settings.GALLERY_CAMERA_ON_TAP.save(true);
        SettingsContextRule.withoutContext(() -> assertStock(gallery));
    }

    @Test public void unreadableSettingFailsOpenAndReportsItsStateFailure() {
        Settings.GALLERY_CAMERA_ON_TAP.save(true);
        SettingReadsForTests.breakReads(Settings.GALLERY_CAMERA_ON_TAP);
        assertStock(gallery);
        assertEquals(Collections.singletonList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.GALLERY_CAMERA_ON_TAP));
    }

    private void assertStock(Object layout) {
        assertFalse(GalleryCamera.keepCameraOff(layout));
        assertFalse(GalleryCamera.wakeOnTap(layout, null));
        GalleryCamera.wakeForPermission(layout);
        assertFalse("nothing woke it, so nothing opens by itself", GalleryCamera.openWhenReady(layout, cameraView));
        assertFalse(HookStatus.report().stream().anyMatch(row -> row.contains("Counted:")));
    }
}
