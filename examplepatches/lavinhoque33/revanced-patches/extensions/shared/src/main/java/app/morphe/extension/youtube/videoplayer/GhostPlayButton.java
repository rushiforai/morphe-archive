/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/5197
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.extension.youtube.videoplayer;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.view.View;

import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.patches.ghostplay.GhostHistoryDialog;
import app.morphe.extension.youtube.patches.ghostplay.GhostPlayPatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerControlButton;

/** Bottom control shared by the legacy and modern player overlays. */
@SuppressWarnings("unused")
public final class GhostPlayButton {
    private static final String BUTTON = "morphe_ghost_play_button";
    private static PlayerControlButton control;
    private static Boolean lastActive;

    private GhostPlayButton() {}

    public static void initializeButton(View controls) {
        if (!GhostPlayPatch.isEnabled() || !Settings.GHOST_PLAY_PLAYER_BUTTON.get()
                || controls.findViewById(ResourceUtils.getIdIdentifier(BUTTON)) == null) return;
        control = new PlayerControlButton(controls, BUTTON, true,
                () -> GhostPlayPatch.isEnabled() && Settings.GHOST_PLAY_PLAYER_BUTTON.get(),
                view -> GhostPlayPatch.toggleFromPlayerButton(), view -> {
                    GhostHistoryDialog.showQuickMenu(view.getContext());
                    return true;
                });
        lastActive = null;
        refreshButtonState();
    }

    public static void refreshButtonState() {
        if (control == null || control.imageView() == null) return;
        boolean active = GhostPlayPatch.isCurrentVideoGhost();
        if (lastActive != null && lastActive == active) return;
        lastActive = active;
        control.setIcon(active ? "morphe_ghost_play_button_on" : "morphe_ghost_play_button_off");
        control.imageView().setActivated(active);
        control.imageView().setContentDescription(str(active ? "morphe_ghost_play_video_active_toast"
                : "morphe_ghost_play_dialog_title"));
    }

    public static void setVisibility(boolean visible, boolean animated) {
        if (control != null) control.setVisibility(visible, animated);
    }

    public static void setVisibilityImmediate(boolean visible) {
        if (control != null) control.setVisibilityImmediate(visible);
    }

    public static void setVisibilityNegatedImmediate() {
        if (control != null) control.setVisibilityNegatedImmediate();
    }
}
