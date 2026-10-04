package app.ckzombies.extension;

import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;

/**
 * Lets the game draw into a surface 720 pixels high, which Android stretches over the screen.
 *
 * The engine lays everything out from the size its surface reports and draws its art unscaled.
 * The art was made for 2012's screens, so on a 1080p screen the menus and text come out small
 * and the full screen pictures cover only part of it. Given a 720 high surface the engine lays
 * out as it does on a 720p phone, and the system scales the result up.
 *
 * Touch positions arrive in view pixels, so they are scaled down to surface pixels, and so is
 * the distance a finger has to move before a touch counts as a drag.
 */
@SuppressWarnings("unused")
public final class ScreenFit {

    static final String TAG = "CKZFIT";
    static final int SHORT_SIDE = 720;

    // The game has one view at a time, and layout and touch both run on the main thread.
    private static int viewWidth;
    private static int viewHeight;
    private static int surfaceWidth;
    private static int surfaceHeight;

    private ScreenFit() {
    }

    /** Called with the game's SurfaceView right after it is built, before it is laid out. */
    public static void attach(final SurfaceView view) {
        try {
            view.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
                public void onLayoutChange(View v, int left, int top, int right, int bottom,
                                           int oldLeft, int oldTop, int oldRight, int oldBottom) {
                    fit(view.getHolder(), right - left, bottom - top);
                }
            });
        } catch (Throwable ignored) {
            // Older Android has no layout listener, and no screen that needs this. The extension is
            // built for a newer minimum, so R8 drops an SDK_INT check here; the missing class is
            // caught instead, and the game then runs at its own size.
        }
    }

    /**
     * Sizes the surface for a view of this size. It runs on every layout, not only when the size
     * changes: closing the game leaves the process alive, and the next view, of the same size,
     * needs its own surface sized. Both holder calls do nothing when nothing changes.
     */
    static void fit(SurfaceHolder holder, int width, int height) {
        if (width <= 0 || height <= 0) {
            return;
        }
        int[] surface = surfaceSize(width, height);
        if (width != viewWidth || height != viewHeight) {
            Log.i(TAG, "view " + width + "x" + height + ", surface " + surface[0] + "x" + surface[1]);
        }
        viewWidth = width;
        viewHeight = height;
        surfaceWidth = surface[0];
        surfaceHeight = surface[1];
        if (surface[0] == width && surface[1] == height) {
            holder.setSizeFromLayout();
        } else {
            holder.setFixedSize(surface[0], surface[1]);
        }
    }

    /** The surface for a view: the same shape, its short side brought down to 720. */
    static int[] surfaceSize(int width, int height) {
        int shortSide = Math.min(width, height);
        if (shortSide <= SHORT_SIDE) {
            return new int[] {width, height};
        }
        float scale = (float) SHORT_SIDE / shortSide;
        return new int[] {Math.round(width * scale), Math.round(height * scale)};
    }

    /** Called first in each of the activity's four touch methods, with the position's x. */
    public static int x(int x) {
        return scale(x, surfaceWidth, viewWidth);
    }

    public static int y(int y) {
        return scale(y, surfaceHeight, viewHeight);
    }

    /**
     * The game takes 1/32 of the display's short side as the distance that turns a touch into a
     * drag, in display pixels. It compares that with positions that are now in surface pixels.
     */
    public static int threshold(int pixels) {
        boolean wide = viewWidth >= viewHeight;
        return Math.max(1, scale(pixels, wide ? surfaceHeight : surfaceWidth, wide ? viewHeight : viewWidth));
    }

    private static int scale(int value, int surface, int view) {
        return view <= 0 || surface == view ? value : value * surface / view;
    }
}
