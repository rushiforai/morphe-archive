/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.os.Build;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Picture-in-picture: with the switch on, the Reels viewer's gate says yes on Android 12 or later,
 * and ReelsPipUtil's check says yes there where the phone has the feature. Both count it. Off,
 * paused, on Android 11, without the feature or with no activity, Facebook's own code decides.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PictureInPictureTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.PICTURE_IN_PICTURE.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.PICTURE_IN_PICTURE + ":")) return line;
        }
        return null;
    }

    @Test
    public void onBothSayYesWhereThePhoneHasTheFeature() {
        assertTrue("the switch doesn't start on once picked", Settings.PICTURE_IN_PICTURE.get());
        assertTrue(PictureInPictureForTests.allowsWithTheFeature());
        assertTrue(PictureInPictureForTests.allows(Build.VERSION_CODES.UPSIDE_DOWN_CAKE, true));
        assertTrue(PictureInPictureForTests.surfaceAllows());
        assertEquals(FamilyNames.PICTURE_IN_PICTURE + ": invoked 3, 2 found, 0 missing. Counted: "
                + PictureInPicture.ALLOWED + " 2, " + PictureInPicture.SURFACE + " 1", statusLine());
    }

    @Test
    public void withoutTheFeatureOrBeforeAndroid12FacebookDecides() {
        assertFalse("a phone without the feature got a yes", PictureInPictureForTests.allows(Build.VERSION_CODES.S, false));
        assertFalse("Android 11 got a yes", PictureInPictureForTests.allows(Build.VERSION_CODES.R, true));
        assertFalse("Android 11's gate said yes", PictureInPictureForTests.surfaceAllows(Build.VERSION_CODES.R));
        assertFalse("no activity got a yes", PictureInPicture.allowed(null));
    }

    @Test
    public void offOrPausedFacebookDecides() {
        Settings.PICTURE_IN_PICTURE.save(false);
        assertFalse(PictureInPictureForTests.allowsWithTheFeature());
        assertFalse(PictureInPictureForTests.surfaceAllows());
        Settings.PICTURE_IN_PICTURE.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " said yes", PictureInPictureForTests.allowsWithTheFeature());
            assertFalse("a Hushfacebook paused by " + reason + " let the gate say yes", PictureInPictureForTests.surfaceAllows());
            PauseForTests.resume();
        }
    }
}
