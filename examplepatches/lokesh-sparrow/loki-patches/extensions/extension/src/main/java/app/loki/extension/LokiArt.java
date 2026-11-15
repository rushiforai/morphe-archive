/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;

import app.linkedin.extension.IconDrawable;

/**
 * The Loki Patches mark: Material's puzzle piece ("extension"), the same glyph Splitwise's Account row and the
 * Truecaller menu row use. Drawn from path data because an extension ships no resources.
 */
final class LokiArt {
    static final int ACCENT = 0xFF2DBCB1;

    private LokiArt() {
    }

    /** The app icon: accent tile with the white puzzle piece, for the long-press shortcut. */
    static Drawable tile(Context context) {
        int size = Math.max(48, (int) (108 * context.getResources().getDisplayMetrics().density));
        Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        Paint background = new Paint(Paint.ANTI_ALIAS_FLAG);
        background.setColor(ACCENT);
        canvas.drawRect(0, 0, size, size, background);

        // Adaptive icons crop to the inner 72 of 108: keep the glyph well inside it.
        Drawable puzzle = new IconDrawable(IconDrawable.EXTENSION, 0xFFFFFFFF);
        int inset = Math.round(size * 0.30f);
        puzzle.setBounds(inset, inset, size - inset, size - inset);
        puzzle.draw(canvas);

        Drawable drawable = new BitmapDrawable(context.getResources(), bitmap);
        drawable.setBounds(0, 0, size, size);
        return drawable;
    }
}
