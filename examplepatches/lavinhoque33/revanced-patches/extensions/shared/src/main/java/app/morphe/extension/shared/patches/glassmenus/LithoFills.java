/*
 * Copyright 2026 Morphe.
 * Copyright (C) 2026 lavinhoque33
 * https://github.com/MorpheApp/morphe-patches/pull/5107
 * https://github.com/MorpheApp/morphe-patches/pull/5130
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.shared.patches.glassmenus;

import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Looper;
import android.view.View;

import androidx.annotation.Nullable;

import java.util.Map;
import java.util.WeakHashMap;

/** Records Litho's mounted backgrounds, which are not exposed by View.getBackground(). */
final class LithoFills {
    interface Visitor {
        void accept(Drawable drawable, int color, View host);
    }

    private static final Map<Drawable, Integer> colors = new WeakHashMap<>();
    private static volatile int changes;

    static void onColor(Drawable drawable, int color) {
        boolean opaque = Color.alpha(color) >= 0xF0;
        boolean changed;
        synchronized (colors) {
            if (opaque) {
                Integer previous = colors.get(drawable);
                changed = previous == null || previous != color;
                if (changed) colors.put(drawable, color);
            } else {
                changed = colors.remove(drawable) != null;
            }
        }
        if ((!opaque && !changed) || !GlassSurface.hasOpenMenus()) return;

        View host = Looper.myLooper() == Looper.getMainLooper() ? hostOf(drawable) : null;
        if (host != null) {
            GlassSurface.onLithoBoundsChanged(host);
        } else if (changed) {
            // A new fill can receive its bounds before it has a mounted callback.
            synchronized (colors) {
                changes++;
            }
        }
    }

    static int changes() {
        return changes;
    }

    static int colorOf(Drawable drawable) {
        synchronized (colors) {
            return colors.getOrDefault(drawable, Color.TRANSPARENT);
        }
    }

    static void visitInside(View panel, Visitor visitor) {
        synchronized (colors) {
            for (Map.Entry<Drawable, Integer> entry : colors.entrySet()) {
                Drawable drawable = entry.getKey();
                if (drawable == null) continue;

                View host = hostOf(drawable);
                if (host != null && isInside(host, panel)) visitor.accept(drawable, entry.getValue(), host);
            }
        }
    }

    @Nullable
    static View hostOf(Drawable drawable) {
        Drawable.Callback callback = drawable.getCallback();
        for (int depth = 0; depth < 8 && callback instanceof Drawable wrapper; depth++) {
            callback = wrapper.getCallback();
        }
        return callback instanceof View view ? view : null;
    }

    static boolean isInside(View child, View parent) {
        for (Object current = child; current instanceof View view; current = view.getParent()) {
            if (view == parent) return true;
        }
        return false;
    }

    private LithoFills() {
    }
}
