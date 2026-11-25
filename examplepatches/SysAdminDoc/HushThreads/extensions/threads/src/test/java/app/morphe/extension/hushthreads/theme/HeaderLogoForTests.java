/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.theme;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;

import java.util.ArrayList;
import java.util.List;

/** Stands in for Threads' logo canvas and the bundled logo around {@link HeaderLogo}. */
public final class HeaderLogoForTests {
    private HeaderLogoForTests() {
    }

    /** A logo that remembers where it was drawn. */
    static final class Logo extends ColorDrawable {
        final List<Rect> drawn = new ArrayList<>();

        Logo() {
            super(0xff0261fc);
        }

        @Override
        public void draw(Canvas canvas) {
            drawn.add(new Rect(getBounds()));
            super.draw(canvas);
        }
    }

    /** Threads' logo canvas, measured at [width] by [height] unless a test changes it. */
    static final class FakeCanvas implements HeaderLogo.Surface {
        long size;
        RuntimeException fails;
        final Canvas canvas;
        final List<Object> asked = new ArrayList<>();

        FakeCanvas(int width, int height) {
            size = HeaderLogoForTests.size(width, height);
            canvas = new Canvas(Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888));
        }

        @Override
        public long size(Object scope) {
            asked.add(scope);
            return size;
        }

        @Override
        public Canvas canvas(Object scope) {
            if (fails != null) throw fails;
            return canvas;
        }
    }

    /** A Compose Size: width's float bits high, height's low. */
    static long size(float width, float height) {
        return ((long) Float.floatToRawIntBits(width) << 32) | (Float.floatToRawIntBits(height) & 0xffffffffL);
    }

    static FakeCanvas install(Logo logo, int width, int height) {
        FakeCanvas canvas = new FakeCanvas(width, height);
        HeaderLogo.surface = canvas;
        HeaderLogo.logo = logo;
        return canvas;
    }

    /** Puts the patch's surface back and forgets the logo. */
    public static void reset() {
        HeaderLogo.forgetLogo();
    }

    /** Whether the hook draws HushThreads' logo over Threads' own on a measured canvas. */
    public static boolean drawsOver() {
        Logo logo = new Logo();
        install(logo, 120, 48);
        try {
            return HeaderLogo.draw(new Object()) && !logo.drawn.isEmpty();
        } finally {
            reset();
        }
    }
}
