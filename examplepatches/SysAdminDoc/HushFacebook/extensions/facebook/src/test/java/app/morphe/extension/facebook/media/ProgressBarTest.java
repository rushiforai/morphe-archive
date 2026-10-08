/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.view.View;
import android.widget.LinearLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.PatchFamily;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Keep the progress bar: with the switch on, the Reels viewer's bar is kept full size each time
 * Facebook would shrink it, and a full-screen video's fade timer isn't set, each counted. Off,
 * paused, or before the settings are ready, both answer no, so Facebook shrinks the bar and fades
 * the controls as before.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ProgressBarTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.KEEP_PROGRESS_BAR.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.PROGRESS_BAR + ":")) return line;
        }
        return null;
    }

    @Test
    public void onTheBarAndTheControlsAreKeptEachTimeAndCounted() {
        Settings.KEEP_PROGRESS_BAR.save(true);
        // A reel's controls hide, then it plays on: Facebook shrinks the bar twice.
        assertTrue("the reel's bar shrank with the switch on", ProgressBar.keepsReelBar());
        assertTrue("the reel's bar shrank with the switch on", ProgressBar.keepsReelBar());
        // A full-screen video's controls show once and are touched once.
        assertTrue("a fade timer was set with the switch on", ProgressBar.keepsControls());
        assertTrue("a fade timer was set with the switch on", ProgressBar.keepsControls());
        assertTrue("a fade timer was set with the switch on", ProgressBar.keepsControls());
        assertEquals(FamilyNames.PROGRESS_BAR + ": invoked 5, 2 found, 0 missing. Counted: "
                + ProgressBar.REEL_BAR_KEPT + " 2, " + ProgressBar.CONTROLS_KEPT + " 3", statusLine());
    }

    @Test
    public void offOrPausedFacebookShrinksAndFades() {
        assertFalse("the switch doesn't start off", Settings.KEEP_PROGRESS_BAR.get());
        assertFalse("off, the reel's bar was kept", ProgressBar.keepsReelBar());
        assertFalse("off, the controls were kept", ProgressBar.keepsControls());

        Settings.KEEP_PROGRESS_BAR.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " kept the reel's bar", ProgressBar.keepsReelBar());
            assertFalse("a Hushfacebook paused by " + reason + " kept the controls", ProgressBar.keepsControls());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            assertFalse("the reel's bar was kept before the settings were ready", ProgressBar.keepsReelBar());
            assertFalse("the controls were kept before the settings were ready", ProgressBar.keepsControls());
        });

        String line = statusLine();
        assertFalse("an answer that left it to Facebook was counted: " + line, line != null && line.contains("Counted"));
        assertTrue("on again after the pause, the reel's bar wasn't kept", ProgressBar.keepsReelBar());
        assertTrue("on again after the pause, the controls weren't kept", ProgressBar.keepsControls());
    }

    @Test
    public void theSwitchNeedsNoRestartAndTravelsWithItsFamily() {
        assertFalse("each shrink and timer asks again, so no restart is needed", Settings.KEEP_PROGRESS_BAR.rebootApp);
        assertNull("nothing asks before the switch changes", Settings.KEEP_PROGRESS_BAR.userDialogMessage);
        assertTrue("Pause and the report don't know the switch",
                PatchFamily.PROGRESS_BAR.switches.contains(Settings.KEEP_PROGRESS_BAR));
    }

    @Test
    public void theTimeLabelIsHiddenAfterTheActiveLookAndCountedOnce() {
        LinearLayout label = new LinearLayout(RuntimeEnvironment.getApplication());
        label.setVisibility(View.VISIBLE);
        ProgressBar.hideTimeLabel(label);
        assertEquals("the label stayed on screen", View.INVISIBLE, label.getVisibility());
        // Already hidden: nothing to do, nothing counted again.
        ProgressBar.hideTimeLabel(label);
        assertEquals(View.INVISIBLE, label.getVisibility());
        assertEquals(FamilyNames.PROGRESS_BAR + ": invoked 0, 0 found, 0 missing. Counted: "
                + ProgressBar.TIME_LABEL_HIDDEN + " 1", statusLine());
    }

    @Test
    public void aMissingTimeLabelIsLeftAlone() {
        ProgressBar.hideTimeLabel(null);
        assertNull("a missing label was reported", statusLine());
    }
}
