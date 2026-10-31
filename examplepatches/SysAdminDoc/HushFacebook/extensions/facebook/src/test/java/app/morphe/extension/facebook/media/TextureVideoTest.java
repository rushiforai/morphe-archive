/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

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
 * Fix washed-out video colors (#308): with the switch on, the player's must-use-a-SurfaceView
 * decision answers no and its TextureView preference answers yes, and a player kept off its
 * SurfaceView is counted. Off, paused or before the settings are ready both answers are
 * Facebook's own.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TextureVideoTest {
    private static final HushfacebookPause.Reason[] PAUSES = {
            HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
            HushfacebookPause.Reason.MARKER_FILE};

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
        Settings.DRAW_VIDEOS_WITH_THE_SCREEN.save(true);
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.DRAW_VIDEOS_WITH_THE_SCREEN.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.HDR_BRIGHTNESS + ":")) return line;
        }
        return "";
    }

    @Test
    public void onThePlayerDrawsIntoItsTextureView() {
        assertFalse("a player Facebook kept on a SurfaceView stayed there", TextureVideo.surfaceView(true));
        assertFalse("a player Facebook kept off a SurfaceView went onto one", TextureVideo.surfaceView(false));
        assertTrue("the TextureView preference stayed off", TextureVideo.preferTextureView(false));
        assertTrue("the TextureView preference was turned off", TextureVideo.preferTextureView(true));
        String line = statusLine();
        assertTrue("the player kept off its SurfaceView wasn't counted once: " + line,
                line.contains(TextureVideo.DRAWN_WITH_THE_SCREEN + " 1"));
    }

    @Test
    public void offPausedOrNotReadyFacebookDecides() {
        Settings.DRAW_VIDEOS_WITH_THE_SCREEN.save(false);
        assertTrue("off, a SurfaceView player lost it", TextureVideo.surfaceView(true));
        assertFalse("off, the TextureView preference was turned on", TextureVideo.preferTextureView(false));
        Settings.DRAW_VIDEOS_WITH_THE_SCREEN.save(true);
        for (HushfacebookPause.Reason reason : PAUSES) {
            PauseForTests.pause(reason);
            assertTrue(reason.name() + ": a SurfaceView player lost it", TextureVideo.surfaceView(true));
            assertFalse(reason.name() + ": the TextureView preference was turned on", TextureVideo.preferTextureView(false));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            assertTrue("a SurfaceView player lost it before the settings were ready", TextureVideo.surfaceView(true));
            assertFalse("the preference was turned on before the settings were ready", TextureVideo.preferTextureView(false));
        });
        String line = statusLine();
        assertFalse("an answer left to Facebook was counted: " + line, line.contains("Counted"));
    }
}
