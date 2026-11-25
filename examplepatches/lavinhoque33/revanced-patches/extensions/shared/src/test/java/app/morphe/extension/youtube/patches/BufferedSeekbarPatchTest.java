/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.youtube.patches;

import static app.morphe.extension.youtube.patches.player.BufferedSeekbarPatch.allowLegacyMiniplayerBuffer;
import static app.morphe.extension.youtube.patches.player.BufferedSeekbarPatch.restoreBufferedFade;
import static app.morphe.extension.youtube.shared.PlayerControlsVisibility.PLAYER_CONTROLS_VISIBILITY_HIDDEN;
import static app.morphe.extension.youtube.shared.PlayerType.WATCH_WHILE_MAXIMIZED;
import static app.morphe.extension.youtube.shared.PlayerType.WATCH_WHILE_MINIMIZED;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.robolectric.util.ReflectionHelpers.ClassParameter.from;

import android.content.Context;
import android.content.res.Configuration;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.player.BufferedSeekbarPatch;
import app.morphe.extension.youtube.patches.player.MiniplayerPatch.MiniplayerType;
import app.morphe.extension.youtube.shared.PlayerControlsVisibility;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoInformation;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 26)
public class BufferedSeekbarPatchTest {
    private static final int FLOATY_TIMEBAR_ID = 0x7f0b0799;
    private static final int WATCH_TIMEBAR_ID = 0x7f0b16ba;
    private static final int SHORTS_TIMEBAR_ID = 0x7f0b1066;

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

    @Test
    public void onlyMinimalAndTabletSelectLegacyMiniplayerBuffer() {
        for (MiniplayerType type : MiniplayerType.values()) {
            boolean enabled = ReflectionHelpers.callStaticMethod(BufferedSeekbarPatch.class,
                    "isLegacyMiniplayerType", from(MiniplayerType.class, type));
            assertEquals(type.name(), type == MiniplayerType.MINIMAL || type == MiniplayerType.TABLET, enabled);
        }
    }

    @Test
    public void onlyTheMinimizedFloatyTimebarReceivesTheLegacyOverride() {
        View floaty = nativeTimebar(Configuration.ORIENTATION_PORTRAIT, FLOATY_TIMEBAR_ID);
        assertFalse(allowLegacyMiniplayerBuffer(floaty, FLOATY_TIMEBAR_ID)); // Maximized watch player.

        PlayerType.setFromString(WATCH_WHILE_MINIMIZED.name());
        assertTrue(eligibleLegacyView(floaty));
        assertFalse(allowLegacyMiniplayerBuffer(seekbar, FLOATY_TIMEBAR_ID)); // Detached native view.
        assertFalse(allowLegacyMiniplayerBuffer(
                nativeTimebar(Configuration.ORIENTATION_PORTRAIT, WATCH_TIMEBAR_ID), FLOATY_TIMEBAR_ID));
        assertFalse(allowLegacyMiniplayerBuffer(
                nativeTimebar(Configuration.ORIENTATION_PORTRAIT, SHORTS_TIMEBAR_ID), FLOATY_TIMEBAR_ID));
        assertEquals(0f, restoreBufferedFade(floaty, 0f, false), 0f); // Main-player fade policy stays separate.
    }

    @Test
    public void legacyMiniplayerBufferLeavesLiveLightAndLandscapeStock() {
        PlayerType.setFromString(WATCH_WHILE_MINIMIZED.name());
        View floaty = nativeTimebar(Configuration.ORIENTATION_PORTRAIT, FLOATY_TIMEBAR_ID);

        ReflectionHelpers.setStaticField(VideoInformation.class, "videoIsLiveStream", true);
        assertFalse(allowLegacyMiniplayerBuffer(floaty, FLOATY_TIMEBAR_ID));

        ReflectionHelpers.setStaticField(VideoInformation.class, "videoIsLiveStream", false);
        BaseThemeUtils.updateLightDarkModeStatus(1);
        assertFalse(allowLegacyMiniplayerBuffer(floaty, FLOATY_TIMEBAR_ID));

        BaseThemeUtils.updateLightDarkModeStatus(2);
        assertFalse(allowLegacyMiniplayerBuffer(
                nativeTimebar(Configuration.ORIENTATION_LANDSCAPE, FLOATY_TIMEBAR_ID), FLOATY_TIMEBAR_ID));
    }

    private static boolean eligibleLegacyView(View timebar) {
        return ReflectionHelpers.callStaticMethod(BufferedSeekbarPatch.class, "isLegacyMiniplayerView",
                from(View.class, timebar), from(int.class, FLOATY_TIMEBAR_ID));
    }

    private static View nativeTimebar(int orientation, int wrapperId) {
        View timebar = seekbarWithOrientation(orientation);
        FrameLayout wrapper = new FrameLayout(timebar.getContext());
        wrapper.setId(wrapperId);
        wrapper.addView(timebar);
        return timebar;
    }

    private static View seekbarWithOrientation(int orientation) {
        Context application = RuntimeEnvironment.getApplication();
        Configuration config = new Configuration(application.getResources().getConfiguration());
        config.orientation = orientation;
        config.uiMode = (config.uiMode & ~Configuration.UI_MODE_NIGHT_MASK) | Configuration.UI_MODE_NIGHT_YES;
        return new View(application.createConfigurationContext(config));
    }
}
