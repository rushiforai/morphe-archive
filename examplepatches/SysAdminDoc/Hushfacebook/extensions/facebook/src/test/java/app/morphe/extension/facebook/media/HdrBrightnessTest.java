/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import android.view.SurfaceView;
import android.view.Window;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Turn off HDR brightness: with its switch on, Facebook's request for an HDR window comes out as
 * one for the default colour mode, a headroom as none, and on Android 15 a SurfaceView Facebook
 * builds asks for none. Every other colour mode goes through, and off or paused Facebook's
 * requests go through as asked.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class HdrBrightnessTest {
    private static final HushfacebookPause.Reason[] PAUSES = {
            HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
            HushfacebookPause.Reason.MARKER_FILE};

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Activity activity;

    @Before
    public void start() {
        HookStatus.clear();
        activity = Robolectric.buildActivity(Activity.class).create().get();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.TURN_OFF_HDR_BRIGHTNESS.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.HDR_BRIGHTNESS + ":")) return line;
        }
        return null;
    }

    /** The colour mode the window ends up in once Facebook asks for [mode]. */
    private int asked(int mode) {
        Window window = activity.getWindow();
        window.setColorMode(ActivityInfo.COLOR_MODE_WIDE_COLOR_GAMUT);
        HdrBrightness.setColorMode(window, mode);
        return window.getColorMode();
    }

    private float askedHeadroom(float headroom) {
        Window window = activity.getWindow();
        window.setDesiredHdrHeadroom(0f);
        HdrBrightness.setDesiredHdrHeadroom(window, headroom);
        return window.getDesiredHdrHeadroom();
    }

    @Test
    public void anHdrWindowStaysInTheUsualRange() {
        assertEquals("an HDR window", ActivityInfo.COLOR_MODE_DEFAULT, asked(ActivityInfo.COLOR_MODE_HDR));
        assertEquals("the default mode", ActivityInfo.COLOR_MODE_DEFAULT, asked(ActivityInfo.COLOR_MODE_DEFAULT));
        assertEquals("wide colour", ActivityInfo.COLOR_MODE_WIDE_COLOR_GAMUT, asked(ActivityInfo.COLOR_MODE_WIDE_COLOR_GAMUT));
        assertEquals(FamilyNames.HDR_BRIGHTNESS + ": invoked 1, 1 found, 0 missing. Counted: "
                + HdrBrightness.WINDOW_HELD + " 1", statusLine());
    }

    @Test
    public void theHeadroomIsHeldToNone() {
        assertEquals(HdrBrightness.NO_HEADROOM, askedHeadroom(4f), 0f);
        assertEquals(HdrBrightness.NO_HEADROOM, askedHeadroom(100f), 0f);
        assertEquals(FamilyNames.HDR_BRIGHTNESS + ": invoked 2, 1 found, 0 missing. Counted: "
                + HdrBrightness.HEADROOM_HELD + " 2", statusLine());
    }

    @Test
    public void aSurfaceViewAsksForNoHeadroom() {
        HdrBrightness.surfaceBuilt(new SurfaceView(activity));
        assertEquals(FamilyNames.HDR_BRIGHTNESS + ": invoked 1, 1 found, 0 missing. Counted: "
                + HdrBrightness.SURFACE_HELD + " 1", statusLine());
    }

    @Test
    @Config(sdk = 34)
    public void beforeAndroid15ASurfaceViewIsLeftAlone() {
        HdrBrightness.surfaceBuilt(new SurfaceView(activity));
        assertNull("a SurfaceView on Android 14 was counted", statusLine());
        // Android 14 has the HDR window and no headroom, and the window is still kept in the usual range.
        assertEquals(ActivityInfo.COLOR_MODE_DEFAULT, asked(ActivityInfo.COLOR_MODE_HDR));
    }

    @Test
    public void offOrPausedFacebooksRequestsGoThrough() {
        Settings.TURN_OFF_HDR_BRIGHTNESS.save(false);
        assertFacebooks("off");
        Settings.TURN_OFF_HDR_BRIGHTNESS.save(true);
        for (HushfacebookPause.Reason reason : PAUSES) {
            PauseForTests.pause(reason);
            assertFacebooks("paused by " + reason);
            PauseForTests.resume();
        }
        assertEquals("the switch didn't come back after the pause",
                ActivityInfo.COLOR_MODE_DEFAULT, asked(ActivityInfo.COLOR_MODE_HDR));
    }

    private void assertFacebooks(String when) {
        HookStatus.clear();
        assertEquals(when + ", an HDR window", ActivityInfo.COLOR_MODE_HDR, asked(ActivityInfo.COLOR_MODE_HDR));
        assertEquals(when + ", the headroom", 4f, askedHeadroom(4f), 0f);
        HdrBrightness.surfaceBuilt(new SurfaceView(activity));
        String line = statusLine();
        assertEquals(when + ", the report", FamilyNames.HDR_BRIGHTNESS + ": invoked 3, 0 found, 0 missing", line);
    }
}
