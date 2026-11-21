/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.player;

import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;

import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.settings.Settings;

public final class CenterPlaybackButtonPatch {
    public static final int MIN_PERCENT = 60;
    public static final int MAX_PERCENT = 120;
    public static final int DEFAULT_PERCENT = 100;

    private CenterPlaybackButtonPatch() {}

    /** Injection point: once, after the native watch-player button group is inflated. */
    public static void resize(View controls) {
        int percent = Math.max(MIN_PERCENT, Math.min(MAX_PERCENT, Settings.CENTER_PLAYBACK_BUTTON_SIZE.get()));
        if (percent == DEFAULT_PERCENT || !(controls instanceof RelativeLayout)) {
            return;
        }

        View area = findControl(controls, "player_control_play_pause_replay_button_touch_area");
        View icon = findControl(controls, "player_control_play_pause_replay_button");
        if (!(area instanceof FrameLayout) || !(icon instanceof ImageView)
                || icon.getParent() != area || area.getParent() != controls
                || !(icon.getLayoutParams() instanceof FrameLayout.LayoutParams iconParams)
                || !(area.getLayoutParams() instanceof RelativeLayout.LayoutParams areaParams)
                || areaParams.getRule(RelativeLayout.CENTER_IN_PARENT) == 0) {
            return;
        }

        LayoutParams controlsParams = controls.getLayoutParams();
        if (controlsParams == null || controlsParams.height <= 0 || iconParams.width <= 0
                || iconParams.height <= 0 || areaParams.width <= 0 || areaParams.height <= 0) {
            return;
        }

        // Resize actual layout bounds, not the visual transform. The native TouchDelegate stays
        // inside its FrameLayout and the neighboring controls stay anchored to its edges.
        int minTouchSize = Math.round(48 * controls.getResources().getDisplayMetrics().density);
        float scale = percent / 100f;
        int width = Math.max(minTouchSize, Math.round(areaParams.width * scale));
        int height = Math.max(minTouchSize, Math.round(areaParams.height * scale));
        resizeIcon(icon, iconParams, scale, width, height);
        areaParams.width = width;
        areaParams.height = height;
        area.setLayoutParams(areaParams);

        // Keep the stock row height when shrinking; only grow it to avoid clipping the new target.
        if (height > controlsParams.height) {
            controlsParams.height = height;
            controls.setLayoutParams(controlsParams);
        }
    }

    private static View findControl(View controls, String name) {
        int id = ResourceUtils.getIdentifier(name, ResourceType.ID, controls.getContext());
        return id == 0 ? null : controls.findViewById(id);
    }

    private static void resizeIcon(View icon, LayoutParams params, float scale, int maxWidth, int maxHeight) {
        params.width = Math.min(maxWidth, Math.round(params.width * scale));
        params.height = Math.min(maxHeight, Math.round(params.height * scale));
        icon.setLayoutParams(params);
        icon.setPadding(
                Math.round(icon.getPaddingLeft() * scale),
                Math.round(icon.getPaddingTop() * scale),
                Math.round(icon.getPaddingRight() * scale),
                Math.round(icon.getPaddingBottom() * scale));
    }
}
