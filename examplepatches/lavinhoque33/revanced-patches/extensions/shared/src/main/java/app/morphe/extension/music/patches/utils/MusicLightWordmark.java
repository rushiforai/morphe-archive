/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25
 */
package app.morphe.extension.music.patches.utils;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.view.View;

import java.util.WeakHashMap;

import app.morphe.extension.shared.utils.ResourceUtils;

/** Adapts only the lettering of stock and bundled Music toolbar logos. */
public final class MusicLightWordmark {
    private MusicLightWordmark() {
    }

    /** Injection point at the stock toolbar's logo setter. */
    public static Drawable apply(View toolbar, Drawable original) {
        if (!MusicLightTheme.isEnabled()) return original;

        if (original instanceof LayerDrawable layers) {
            int wordmarkId = ResourceUtils.getIdIdentifier("morphe_reseam_music_header_wordmark");
            if (wordmarkId == 0 || !(layers.findDrawableByLayerId(wordmarkId) instanceof BitmapDrawable logo)) {
                return original;
            }

            Drawable light = applyToBitmap(toolbar, logo);
            if (light != logo) ((LayerDrawable) layers.mutate()).setDrawableByLayerId(wordmarkId, light);
            return original;
        }
        return original instanceof BitmapDrawable logo ? applyToBitmap(toolbar, logo) : original;
    }

    private static Drawable applyToBitmap(View toolbar, BitmapDrawable logo) {
        Bitmap source = logo.getBitmap();
        if (source == null || source.getConfig() == Bitmap.Config.HARDWARE) return logo;

        Bitmap light = LightLogos.bySource.computeIfAbsent(source, MusicLightWordmark::darkenLetters);
        if (light == null) return logo;

        BitmapDrawable drawable = new BitmapDrawable(toolbar.getResources(), light);
        drawable.setAlpha(logo.getAlpha());
        return drawable;
    }

    // Loaded only when the light toolbar binds artwork. Binding happens on the UI thread.
    private static final class LightLogos {
        private static final WeakHashMap<Bitmap, Bitmap> bySource = new WeakHashMap<>();
    }

    private static Bitmap darkenLetters(Bitmap source) {
        int width = source.getWidth();
        int height = source.getHeight();
        if (width < height * 2 || width > height * 4) return null;

        int split = findSeparator(source, width, height);
        if (split < 0) return null;

        int letteringWidth = width - split;
        int[] lettering = new int[letteringWidth * height];
        source.getPixels(lettering, 0, letteringWidth, split, 0, letteringWidth, height);
        int darkRgb = MusicLightTheme.FOREGROUND & 0x00FFFFFF;
        boolean changed = false;
        for (int i = 0; i < lettering.length; i++) {
            int pixel = lettering[i];
            if ((pixel >>> 24) == 0) continue;
            int darkPixel = (pixel & 0xFF000000) | darkRgb;
            changed |= pixel != darkPixel;
            lettering[i] = darkPixel;
        }
        if (!changed) return null;

        Bitmap light = source.copy(Bitmap.Config.ARGB_8888, true);
        if (light == null) return null;
        light.setPixels(lettering, 0, letteringWidth, split, 0, letteringWidth, height);
        return light;
    }

    private static int findSeparator(Bitmap source, int width, int height) {
        // The mark and lettering have a transparent gap near one third of the width.
        // Check a few nearby columns because resource density scaling can move the gap.
        int first = (width * 31 + 50) / 100;
        int last = (width * 37 + 50) / 100;
        for (int x = first; x <= last; x++) {
            int y = 0;
            while (y < height && (source.getPixel(x, y) >>> 24) <= 16) {
                y++;
            }
            if (y == height) return x;
        }
        return -1;
    }
}
