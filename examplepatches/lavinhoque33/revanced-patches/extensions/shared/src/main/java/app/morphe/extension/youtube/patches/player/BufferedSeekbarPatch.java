/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.youtube.patches.player;

import android.content.res.Configuration;
import android.view.View;

import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.youtube.patches.player.MiniplayerPatch.MiniplayerType;
import app.morphe.extension.youtube.shared.PlayerControlsVisibility;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoInformation;

public final class BufferedSeekbarPatch {
    // Keep the native buffer paint distinguishable from the unplayed track without making it look played.
    private static final float HIDDEN_BUFFER_FADE = 0.65f;

    private BufferedSeekbarPatch() {}

    /** Injection point: called only from the native buffered segment painters. */
    @SuppressWarnings("unused")
    public static float restoreBufferedFade(View seekbar, float stockFade, boolean scrubbing) {
        return stockFade == 0f && !scrubbing && isHiddenPortraitWatch(seekbar) ? HIDDEN_BUFFER_FADE : stockFade;
    }

    /** Injection point for the native floaty timebar's geometry and painter on YouTube 20.05.46. */
    @SuppressWarnings("unused")
    public static boolean allowLegacyMiniplayerBuffer(View seekbar, int floatyTimebarId) {
        return isLegacyMiniplayerView(seekbar, floatyTimebarId)
                && isLegacyMiniplayerType(MiniplayerPatch.getCurrentMiniplayerType());
    }

    private static boolean isLegacyMiniplayerType(MiniplayerType type) {
        return type == MiniplayerType.MINIMAL || type == MiniplayerType.TABLET;
    }

    private static boolean isLegacyMiniplayerView(View seekbar, int floatyTimebarId) {
        return PlayerType.getCurrent() == PlayerType.WATCH_WHILE_MINIMIZED
                && seekbar.getParent() instanceof View wrapper && wrapper.getId() == floatyTimebarId
                && !VideoInformation.getLiveStreamState()
                && isDarkPortrait(seekbar);
    }

    public static boolean isHiddenPortraitWatch(View seekbar) {
        return !VideoInformation.getLiveStreamState()
                && PlayerType.getCurrent() == PlayerType.WATCH_WHILE_MAXIMIZED
                && PlayerControlsVisibility.getCurrent() == PlayerControlsVisibility.PLAYER_CONTROLS_VISIBILITY_HIDDEN
                && isDarkPortrait(seekbar);
    }

    private static boolean isDarkPortrait(View seekbar) {
        return BaseThemeUtils.isAppThemeResolved()
                && BaseThemeUtils.isDarkModeEnabled()
                && seekbar.getResources().getConfiguration().orientation == Configuration.ORIENTATION_PORTRAIT;
    }
}
