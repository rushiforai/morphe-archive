/*
 * Copyright 2026 Morphe.
 * Copyright (C) 2026 lavinhoque33
 * https://github.com/MorpheApp/morphe-patches/pull/5107
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.shared.patches.glassmenus;

import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.ColorStateListDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.ShapeDrawable;

import androidx.annotation.Nullable;

/** Finds menu fills without trying to draw unknown app drawables on a software canvas. */
final class SolidColors {
    @Nullable
    static Drawable leafOf(@Nullable Drawable drawable) {
        for (int depth = 0; drawable != null && depth <= 4; depth++) {
            if (drawable.isStateful() || drawable instanceof RippleDrawable) return null;

            if (drawable instanceof DrawableWrapper wrapper) {
                drawable = wrapper.getDrawable();
            } else if (drawable instanceof LayerDrawable layers) {
                if (layers.getNumberOfLayers() != 1) return null;
                drawable = layers.getDrawable(0);
            } else {
                return drawable;
            }
        }
        return null;
    }

    static int colorOf(@Nullable Drawable drawable) {
        return leafColor(leafOf(drawable));
    }

    static int leafColor(@Nullable Drawable drawable) {
        if (drawable == null) return Color.TRANSPARENT;
        if (drawable instanceof ColorDrawable color) return color.getColor();
        if (drawable instanceof ShapeDrawable shape) {
            return shape.getPaint().getShader() == null ? shape.getPaint().getColor() : Color.TRANSPARENT;
        }
        if (drawable instanceof GradientDrawable gradient) {
            return gradient.getColors() == null ? colorForState(gradient.getColor(), gradient) : Color.TRANSPARENT;
        }
        if (drawable instanceof ColorStateListDrawable list) {
            return colorForState(list.getColorStateList(), list);
        }
        return LithoFills.colorOf(drawable);
    }

    private static int colorForState(@Nullable ColorStateList colors, Drawable drawable) {
        return colors == null ? Color.TRANSPARENT : colors.getColorForState(drawable.getState(), colors.getDefaultColor());
    }

    private SolidColors() {
    }
}
