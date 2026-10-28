package io.github.sabopura.morphe.extension.youtube.ambient;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.PixelFormat;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

import io.github.sabopura.morphe.extension.youtube.shared.Views;

/**
 * Window-sized surface underneath YouTube's window that theater mode paints the light on.
 * Painting the light as the watch page's background redrew the whole page (text, thumbnails,
 * everything) for every light frame, 20-30 times a second; on this surface a new light frame
 * only replaces this buffer, like the video surface does, and the page is left alone.
 */
final class LightSurface extends SurfaceView implements SurfaceHolder.Callback {
    private final Runnable onReady;
    private final Runnable onLost;
    private volatile boolean ready;

    LightSurface(Context context, Runnable onReady, Runnable onLost) {
        super(context);
        this.onReady = onReady;
        this.onLost = onLost;
        // Not the video: the player and danmaku surface searches skip it.
        setTag(Views.OWN_SURFACE_TAG);
        getHolder().setFormat(PixelFormat.TRANSLUCENT);
        getHolder().addCallback(this);
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
    }

    /** A canvas for the next frame, or null while there is no buffer. */
    Canvas lock() {
        Surface surface = getHolder().getSurface();
        if (!ready || surface == null || !surface.isValid()) return null;
        try {
            return surface.lockHardwareCanvas();
        } catch (Throwable throwable) {
            return null;
        }
    }

    void post(Canvas canvas) {
        getHolder().getSurface().unlockCanvasAndPost(canvas);
    }

    @Override public void surfaceCreated(SurfaceHolder holder) {
        ready = true;
        onReady.run();
    }

    @Override public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        onReady.run();
    }

    @Override public void surfaceDestroyed(SurfaceHolder holder) {
        ready = false;
        onLost.run();
    }
}
