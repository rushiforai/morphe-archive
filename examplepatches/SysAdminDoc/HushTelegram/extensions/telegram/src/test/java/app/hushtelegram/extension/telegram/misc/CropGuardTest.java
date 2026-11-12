/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.graphics.Bitmap;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import app.hushtelegram.extension.shared.L10nTablesForTests;
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
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CropGuardTest {
    private static final String TRY_AGAIN = "Couldn't crop the photo. Try again.";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.CROP_GUARD);
        Settings.CROP_GUARD.resetToDefault();
        CropGuard.begin();
        HookStatus.clear();
        ShadowToast.reset();
    }

    @Test public void onByDefaultAMissingPhotoHoldsTheEditorOnce() {
        assertTrue(Settings.CROP_GUARD.get());
        CropGuard.begin();
        assertTrue(CropGuard.missing(null));
        assertTrue(CropGuard.held());
        ShadowLooper.idleMainLooper();
        assertEquals(TRY_AGAIN, ShadowToast.getTextOfLatestToast());
        // Done or Send tapped again runs the crop again; nothing failed this time.
        CropGuard.begin();
        assertFalse(CropGuard.held());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.CROP_GUARD));
    }

    @Test public void aLoadedPhotoAndAMadeCopyLetTheCropThrough() {
        Bitmap photo = Bitmap.createBitmap(4, 4, Bitmap.Config.ARGB_8888);
        CropGuard.begin();
        assertFalse(CropGuard.missing(photo));
        assertFalse(CropGuard.notMade(photo));
        assertFalse(CropGuard.held());
        ShadowLooper.idleMainLooper();
        assertNull(ShadowToast.getTextOfLatestToast());
        // Diagnostics show the hook ran even though nothing failed.
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.CROP_GUARD));
    }

    @Test public void aRecycledPhotoOrNoCopyHoldsTheEditor() {
        Bitmap photo = Bitmap.createBitmap(4, 4, Bitmap.Config.ARGB_8888);
        photo.recycle();
        CropGuard.begin();
        assertTrue(CropGuard.missing(photo));
        assertTrue(CropGuard.held());

        CropGuard.begin();
        assertTrue(CropGuard.notMade(null));
        assertTrue(CropGuard.held());
        assertFalse("held once per failure", CropGuard.held());
    }

    @Test public void aLivePhotoStillThatWasntReadHoldsTheEditor() {
        CropGuard.begin();
        assertFalse(CropGuard.stillUnread(Bitmap.createBitmap(4, 4, Bitmap.Config.ARGB_8888)));
        assertFalse(CropGuard.held());

        CropGuard.begin();
        assertTrue(CropGuard.stillUnread(null));
        assertTrue(CropGuard.held());
        assertTrue(String.join("\n", HookStatus.report()).contains("still not read"));
    }

    @Test public void aFailureNobodyReadIsGoneWhenTheNextEditStarts() {
        // A crop applied from somewhere other than Done or Send fails, and nothing reads it there.
        assertTrue(CropGuard.notMade(null));
        CropGuard.begin();
        assertFalse(CropGuard.held());
    }

    @Test public void aHeldCropDeletesItsCroppedDrawing() throws Exception {
        File drawing = File.createTempFile("crop", "_temp.jpg");
        CropGuard.dropCopy(drawing.getPath());
        assertFalse(drawing.exists());
        // No drawing, or one already gone, is nothing to do.
        CropGuard.dropCopy(null);
        CropGuard.dropCopy(drawing.getPath());
        assertTrue(HookStatus.missing(FamilyNames.CROP_GUARD).isEmpty());
        assertFalse(String.join("\n", HookStatus.report()).contains("file not deleted"));

        // A file that stays (here a folder with something in it) is counted.
        File folder = Files.createTempDirectory("crop").toFile();
        File inside = new File(folder, "kept");
        assertTrue(inside.createNewFile());
        CropGuard.dropCopy(folder.getPath());
        assertTrue(folder.exists());
        assertTrue(String.join("\n", HookStatus.report()).contains("file not deleted"));
        assertTrue(inside.delete());
        assertTrue(folder.delete());
    }

    @Test public void offPausedOrUnreadableTelegramGoesOnAsBefore() {
        Settings.CROP_GUARD.save(false);
        assertFalse(CropGuard.missing(null));
        assertFalse(CropGuard.notMade(null));
        assertFalse(CropGuard.stillUnread(null));
        assertFalse(CropGuard.held());

        Settings.CROP_GUARD.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), CropGuard.missing(null));
            assertFalse(reason.name(), CropGuard.notMade(null));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(CropGuard.notMade(null)));
        SettingReadsForTests.breakReads(Settings.CROP_GUARD);
        assertFalse(CropGuard.missing(null));
        assertFalse(CropGuard.held());
        assertFalse(HookStatus.missing(FamilyNames.CROP_GUARD).isEmpty());
    }

    @Test public void theToastFitsTwoLinesInEveryLanguage() {
        assertFitsATwoLineToast("en", TRY_AGAIN);
        for (String language : new String[]{"bg", "de", "es", "in", "pt-rbr", "tr"}) {
            String row = L10nTablesForTests.of(language).get(TRY_AGAIN);
            assertNotNull(language, row);
            assertFitsATwoLineToast(language, row);
        }
    }

    /** A toast line holds about 34 characters on a small phone; 28 leaves room for wider letters. */
    private static void assertFitsATwoLineToast(String language, String text) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.split(" ")) {
            if (line.length() > 0 && line.length() + 1 + word.length() > 28) {
                lines.add(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(' ');
            line.append(word);
        }
        if (line.length() > 0) lines.add(line.toString());
        assertTrue(language + ": " + text, lines.size() <= 2);
        for (String each : lines) assertTrue(language + ": " + each, each.length() <= 28);
    }
}
