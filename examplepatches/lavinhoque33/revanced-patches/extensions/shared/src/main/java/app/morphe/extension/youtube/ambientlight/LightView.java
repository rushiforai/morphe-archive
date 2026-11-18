/*
 * Copyright 2026 Morphe.
 * Copyright (C) 2026 lavinhoque33.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-17.
 * Written by lavinhoque33, 2026-11-17 (adapted port).
 * https://github.com/MorpheApp/morphe-patches/pull/4747
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.extension.youtube.ambientlight;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.view.View;

/**
 * Draws the light in the app window while the player moves. A view of the window is drawn in
 * the same frame as the player, which a surface is not. One lies under everything else in the
 * window, like the surfaces, for what the page does not cover, such as the status bar. Another
 * lies over the player, for the part of it that the video does not cover. The surfaces take
 * over again once the player rests.
 */
@SuppressLint("ViewConstructor")
final class LightView extends View {
    private final boolean inPlayer;

    LightView(Context context, boolean inPlayer) {
        super(context);
        this.inPlayer = inPlayer;
        setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (inPlayer) {
            AmbientLightController.drawWindowLight(canvas, this, false, 1f, null);
        } else {
            AmbientLightController.drawWindowLight(canvas, this, true, SeeThroughPage.lightAlpha(),
                    SeeThroughPage.lightBounds());
        }
    }
}
