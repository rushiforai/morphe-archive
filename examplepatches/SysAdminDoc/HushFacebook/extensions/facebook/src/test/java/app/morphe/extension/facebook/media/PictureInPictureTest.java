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
        // The patch is in Morphe Manager's default selection with its switch off; these tests run with it on.
        Settings.PICTURE_IN_PICTURE.save(true);
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
        assertFalse("the switch starts off", Settings.PICTURE_IN_PICTURE.defaultValue);
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

    @Test
    public void onTheWatchViewerFlagOpensAndCountsOnlyAFlip() {
        assertTrue("a no stayed a no with the switch on", PictureInPictureForTests.immersiveAllows());
        assertTrue("a yes turned into a no", PictureInPictureForTests.immersiveAllows(Build.VERSION_CODES.S, true));
        assertEquals(FamilyNames.PICTURE_IN_PICTURE + ": invoked 2, 1 found, 0 missing. Counted: "
                + PictureInPicture.IMMERSIVE + " 1", statusLine());
    }

    @Test
    public void offPausedOrBeforeAndroid12TheWatchViewerFlagIsFacebooks() {
        assertFalse("Android 11 changed a no", PictureInPictureForTests.immersiveAllows(Build.VERSION_CODES.R, false));
        assertTrue("Android 11 changed a yes", PictureInPictureForTests.immersiveAllows(Build.VERSION_CODES.R, true));
        Settings.PICTURE_IN_PICTURE.save(false);
        assertFalse("the switch off changed a no", PictureInPictureForTests.immersiveAllows());
        assertTrue("the switch off changed a yes", PictureInPictureForTests.immersiveAllows(Build.VERSION_CODES.S, true));
        Settings.PICTURE_IN_PICTURE.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " changed a no", PictureInPictureForTests.immersiveAllows());
            assertTrue("a Hushfacebook paused by " + reason + " changed a yes",
                    PictureInPictureForTests.immersiveAllows(Build.VERSION_CODES.S, true));
            PauseForTests.resume();
        }
        String line = statusLine();
        assertFalse("a flag left alone was counted", line != null && line.contains(PictureInPicture.IMMERSIVE));
    }

    @Test
    public void onTheVideoTabsGateAndFlagOpenAndCountOnlyAFlip() {
        assertTrue("the gate's no stayed a no with the switch on", PictureInPictureForTests.homeGateAllows());
        assertTrue("the gate's yes turned into a no", PictureInPictureForTests.homeGateAllows(Build.VERSION_CODES.S, true));
        assertTrue("the flag's no stayed a no with the switch on", PictureInPictureForTests.homeFlagAllows());
        assertTrue("the flag's yes turned into a no", PictureInPictureForTests.homeFlagAllows(Build.VERSION_CODES.S, true));
        assertEquals(FamilyNames.PICTURE_IN_PICTURE + ": invoked 4, 2 found, 0 missing. Counted: "
                + PictureInPicture.HOME_GATE + " 1, " + PictureInPicture.HOME_FLAG + " 1", statusLine());
    }

    @Test
    public void offPausedOrBeforeAndroid12TheVideoTabsAnswersAreFacebooks() {
        for (boolean answer : new boolean[] {false, true}) {
            assertEquals("Android 11 changed the gate's answer", answer,
                    PictureInPictureForTests.homeGateAllows(Build.VERSION_CODES.R, answer));
            assertEquals("Android 11 changed the flag's answer", answer,
                    PictureInPictureForTests.homeFlagAllows(Build.VERSION_CODES.R, answer));
            Settings.PICTURE_IN_PICTURE.save(false);
            assertEquals("the switch off changed the gate's answer", answer,
                    PictureInPictureForTests.homeGateAllows(Build.VERSION_CODES.S, answer));
            assertEquals("the switch off changed the flag's answer", answer,
                    PictureInPictureForTests.homeFlagAllows(Build.VERSION_CODES.S, answer));
            Settings.PICTURE_IN_PICTURE.save(true);
            for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                    HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
                PauseForTests.pause(reason);
                assertEquals("a Hushfacebook paused by " + reason + " changed the gate's answer", answer,
                        PictureInPictureForTests.homeGateAllows(Build.VERSION_CODES.S, answer));
                assertEquals("a Hushfacebook paused by " + reason + " changed the flag's answer", answer,
                        PictureInPictureForTests.homeFlagAllows(Build.VERSION_CODES.S, answer));
                PauseForTests.resume();
            }
        }
        String line = statusLine();
        assertFalse("an answer left alone was counted", line != null
                && (line.contains(PictureInPicture.HOME_GATE) || line.contains(PictureInPicture.HOME_FLAG)));
    }
}
