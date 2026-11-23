/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.youtube.patches;

import static app.morphe.extension.youtube.patches.player.BufferedSeekbarPatch.restoreBufferedFade;
import static app.morphe.extension.youtube.shared.PlayerControlsVisibility.PLAYER_CONTROLS_VISIBILITY_HIDDEN;
import static app.morphe.extension.youtube.shared.PlayerType.WATCH_WHILE_MAXIMIZED;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.res.Configuration;
import android.view.View;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.shared.PlayerControlsVisibility;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoInformation;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 26)
public class BufferedSeekbarPatchTest {
    private View seekbar;

    @Before
    public void setUp() {
        ReflectionHelpers.setStaticField(Utils.class, "context", RuntimeEnvironment.getApplication());
        BaseThemeUtils.updateLightDarkModeStatus(2);
        PlayerType.setFromString(WATCH_WHILE_MAXIMIZED.name());
        PlayerControlsVisibility.setFromString(PLAYER_CONTROLS_VISIBILITY_HIDDEN.name());
        ReflectionHelpers.setStaticField(VideoInformation.class, "videoIsLiveStream", false);
        seekbar = seekbarWithOrientation(Configuration.ORIENTATION_PORTRAIT);
    }

    @Test
    public void restoresOnlyTheFullyFadedBuffer() {
        float restored = restoreBufferedFade(seekbar, 0f, false);
        assertTrue(restored > 0f && restored < 1f);
        assertEquals(0.25f, restoreBufferedFade(seekbar, 0.25f, false), 0f);
        assertEquals(1f, restoreBufferedFade(seekbar, 1f, false), 0f);
    }

    @Test
    public void preservesVisibleAndTransitioningControls() {
        for (PlayerControlsVisibility visibility : PlayerControlsVisibility.values()) {
            if (visibility != PLAYER_CONTROLS_VISIBILITY_HIDDEN) {
                PlayerControlsVisibility.setFromString(visibility.name());
                assertEquals(visibility.name(), 0f, restoreBufferedFade(seekbar, 0f, false), 0f);
            }
        }
    }

    @Test
    public void preservesOtherPlayerModesAndLandscape() {
        for (PlayerType player : PlayerType.values()) {
            if (player != WATCH_WHILE_MAXIMIZED) {
                PlayerType.setFromString(player.name());
                assertEquals(player.name(), 0f, restoreBufferedFade(seekbar, 0f, false), 0f);
            }
        }

        PlayerType.setFromString(WATCH_WHILE_MAXIMIZED.name());
        View landscape = seekbarWithOrientation(Configuration.ORIENTATION_LANDSCAPE);
        assertEquals(0f, restoreBufferedFade(landscape, 0f, false), 0f);
    }

    @Test
    public void preservesScrubbingLiveAndLightTheme() {
        assertEquals(0f, restoreBufferedFade(seekbar, 0f, true), 0f);

        ReflectionHelpers.setStaticField(VideoInformation.class, "videoIsLiveStream", true);
        assertEquals(0f, restoreBufferedFade(seekbar, 0f, false), 0f);

        ReflectionHelpers.setStaticField(VideoInformation.class, "videoIsLiveStream", false);
        // The host app can be light even while Android (and the view configuration) is dark.
        BaseThemeUtils.updateLightDarkModeStatus(1);
        assertEquals(0f, restoreBufferedFade(seekbar, 0f, false), 0f);
    }

    @Test
    public void waitsForTheAppThemeInsteadOfAssumingSystemDark() {
        ReflectionHelpers.setStaticField(BaseThemeUtils.class, "isDarkModeEnabled", null);
        assertEquals(0f, restoreBufferedFade(seekbar, 0f, false), 0f);
    }

    private static View seekbarWithOrientation(int orientation) {
        Context application = RuntimeEnvironment.getApplication();
        Configuration config = new Configuration(application.getResources().getConfiguration());
        config.orientation = orientation;
        config.uiMode = (config.uiMode & ~Configuration.UI_MODE_NIGHT_MASK) | Configuration.UI_MODE_NIGHT_YES;
        return new View(application.createConfigurationContext(config));
    }
}
