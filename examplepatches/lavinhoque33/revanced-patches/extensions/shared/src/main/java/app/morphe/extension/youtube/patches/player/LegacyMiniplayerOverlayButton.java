/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-23.
 */

package app.morphe.extension.youtube.patches.player;

import android.annotation.SuppressLint;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;

import app.morphe.extension.shared.utils.ResourceUtils;

/** Keeps the native bar's controls findable by their controllers while suppressing their display. */
@SuppressLint("AppCompatCustomView")
public final class LegacyMiniplayerOverlayButton extends ImageView {
    private final boolean hideButton;

    public LegacyMiniplayerOverlayButton(Context context, AttributeSet attrs) {
        super(context, attrs);

        hideButton = MiniplayerPatch.shouldHideDefaultOverlayButton(context);
        if (hideButton) {
            if (getId() == ResourceUtils.getIdIdentifier("floaty_close_button")) {
                DefaultMiniplayerDismissGesture.setLegacyClose(this);
            }

            if (getVisibility() == VISIBLE) {
                super.setVisibility(INVISIBLE);
            }
        }
    }

    @Override
    public void setVisibility(int visibility) {
        // The bar sizes and positions other controls from these buttons, and playback can show them again.
        super.setVisibility(hideButton && visibility == VISIBLE ? INVISIBLE : visibility);
    }
}
