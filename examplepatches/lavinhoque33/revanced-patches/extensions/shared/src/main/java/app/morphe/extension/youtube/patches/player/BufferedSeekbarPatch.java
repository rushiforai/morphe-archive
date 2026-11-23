/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.youtube.patches.player;

import android.content.res.Configuration;
import android.view.View;

import app.morphe.extension.shared.utils.BaseThemeUtils;
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
        if (stockFade != 0f || scrubbing || VideoInformation.getLiveStreamState()
                || PlayerType.getCurrent() != PlayerType.WATCH_WHILE_MAXIMIZED
                || PlayerControlsVisibility.getCurrent() != PlayerControlsVisibility.PLAYER_CONTROLS_VISIBILITY_HIDDEN
                || !BaseThemeUtils.isAppThemeResolved()
                || !BaseThemeUtils.isDarkModeEnabled()
                || seekbar.getResources().getConfiguration().orientation != Configuration.ORIENTATION_PORTRAIT) {
            return stockFade;
        }

        return HIDDEN_BUFFER_FADE;
    }
}
