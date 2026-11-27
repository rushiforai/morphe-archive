package org.ungoogled.car;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorSpace;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.hardware.HardwareBuffer;
import android.media.Image;
import android.media.ImageReader;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import android.view.Surface;

/**
 * Stands between Maps' car display and the Car App Library's Surface.
 *
 * Maps renders its car UI through a virtual display, which SurfaceFlinger composes into the display's output
 * Surface. When that Surface is the host's and the host stops taking frames (a layout change, the Surface going
 * away), SurfaceFlinger waits for a free buffer on its main thread and the whole system hangs (watchdog restart).
 * So the virtual display draws into an ImageReader of ours, which is always drained (on its own thread), and the
 * newest frame is drawn on the host's Surface (by the GPU) on another thread, the only one that can block on the
 * host.
 *
 * The host's Surface can still be held by a process of ours that died (the host keeps it across a restart of
 * the app). A hardware canvas on it aborts the process in native code, so each new Surface is first tried with
 * EGL, which only fails.
 */
final class FrameRelay {
    private static final String TAG = "UA-CAR";
    /** Held at once: one on screen, one waiting, one coming in, and room for acquireLatestImage. */
    private static final int MAX_IMAGES = 5;

    private final HandlerThread inThread = new HandlerThread("UA-frames-in");
    private final HandlerThread outThread = new HandlerThread("UA-frames-out");
    private final Handler in;
    private final Handler out;
    private final Object lock = new Object();

    private ImageReader reader;
    private int width, height;
    private volatile Surface output;
    private volatile Rect destination;
    private Image pending;   // newest frame not drawn yet (lock)
    private boolean drawPosted;

    // Out thread only.
    private Image shown;     // last frame drawn
    private Surface checked; // the output found free to draw on
    private Surface failed;  // the output found held by another producer

    FrameRelay() {
        inThread.start();
        outThread.start();
        in = new Handler(inThread.getLooper());
        out = new Handler(outThread.getLooper());
    }

    /** The Surface Maps' virtual display draws into, of the given size. */
    Surface input(int width, int height) {
        if (reader != null && this.width == width && this.height == height) return reader.getSurface();
        releaseReader();
        this.width = width;
        this.height = height;
        reader = ImageReader.newInstance(width, height, PixelFormat.RGBA_8888, MAX_IMAGES,
                HardwareBuffer.USAGE_GPU_SAMPLED_IMAGE | HardwareBuffer.USAGE_GPU_COLOR_OUTPUT);
        reader.setOnImageAvailableListener(this::onImage, in);
        Log.i(TAG, "frame relay " + width + "x" + height);
        return reader.getSurface();
    }

    /** Drawn over every frame, on the host's Surface. */
    interface Overlay {
        /** [area]: Maps' display on the Surface; [safe]: the part of it the host leaves uncovered. */
        void draw(Canvas canvas, Rect area, Rect safe, float density);
    }

    private volatile Rect safe;

    /** The part of the host's Surface it leaves uncovered (null: all of it). */
    void safe(Rect area) {
        safe = area == null ? null : new Rect(area);
        post();
    }

    private volatile Overlay overlay;
    private volatile float density = 1f;

    void overlay(Overlay overlay) {
        this.overlay = overlay;
    }

    /** The host's density (its dpi / 160), for the overlay. */
    void density(float density) {
        this.density = density;
    }

    /** Draws the last frame again (the overlay changed). */
    void redraw() {
        post();
    }

    /** Where frames go: the host's Surface, or null while there is none. */
    void output(Surface surface) {
        output = surface;
        if (surface != null) post();
    }

    /** The part of the host's Surface frames are drawn into (null: all of it). */
    void destination(Rect area) {
        destination = area == null ? null : new Rect(area);
        post();
    }

    void release() {
        output = null;
        releaseReader();
        out.post(() -> {
            if (shown != null) shown.close();
            shown = null;
        });
        inThread.quitSafely();
        outThread.quitSafely();
    }

    private void releaseReader() {
        ImageReader old = reader;
        reader = null;
        if (old == null) return;
        // Images of the old reader are closed with it: drop them first, on the threads that use them.
        in.post(() -> {
            synchronized (lock) {
                if (pending != null) pending.close();
                pending = null;
            }
            out.post(() -> {
                if (shown != null) shown.close();
                shown = null;
                old.close();
            });
        });
    }

    private void onImage(ImageReader source) {
        Image image;
        try {
            image = source.acquireLatestImage();
        } catch (IllegalStateException e) {
            // Every image is held (the out thread is stuck on the host): drop the waiting one and retry.
            synchronized (lock) {
                if (pending != null) pending.close();
                pending = null;
            }
            try {
                image = source.acquireLatestImage();
            } catch (IllegalStateException again) {
                return;
            }
        }
        if (image == null) return;
        synchronized (lock) {
            if (pending != null) pending.close();
            pending = image;
        }
        post();
    }

    private void post() {
        synchronized (lock) {
            if (drawPosted) return;
            drawPosted = true;
        }
        out.post(this::draw);
    }

    private void draw() {
        Image image;
        synchronized (lock) {
            drawPosted = false;
            image = pending;
            pending = null;
        }
        Surface target = output;
        if (image == null) {
            image = shown;   // a new output Surface: show the last frame again
            shown = null;
            if (image == null) return;
        }
        if (target == null || !target.isValid() || !usable(target)) {
            keep(image);
            return;
        }
        HardwareBuffer buffer = null;
        try {
            buffer = image.getHardwareBuffer();
            Bitmap bitmap = Bitmap.wrapHardwareBuffer(buffer, ColorSpace.get(ColorSpace.Named.SRGB));
            Canvas canvas = target.lockHardwareCanvas();
            try {
                canvas.drawColor(Color.BLACK);
                if (bitmap != null) {
                    Rect area = destination;
                    if (area == null) area = new Rect(0, 0, canvas.getWidth(), canvas.getHeight());
                    canvas.drawBitmap(bitmap, null, area, null);
                    Overlay over = overlay;
                    if (over != null) {
                        try {
                            Rect uncovered = safe;
                            if (uncovered == null || !Rect.intersects(uncovered, area)) uncovered = area;
                            over.draw(canvas, area, uncovered, density);
                        } catch (RuntimeException e) {
                            Log.w(TAG, "frame relay: drawing the overlay", e);
                        }
                    }
                }
            } finally {
                target.unlockCanvasAndPost(canvas);
            }
        } catch (RuntimeException e) {
            Log.w(TAG, "frame relay: drawing to the host surface", e);
        } finally {
            if (buffer != null) buffer.close();
        }
        keep(image);
    }

    /** [image] is the one on screen now; the one before can go. */
    private void keep(Image image) {
        if (shown != null && shown != image) shown.close();
        shown = image;
    }

    /** Whether [surface] can be drawn on: once per Surface, as EGL connects and disconnects. */
    private boolean usable(Surface surface) {
        if (surface == checked) return true;
        if (surface == failed) return false;
        if (connects(surface)) {
            checked = surface;
            return true;
        }
        failed = surface;
        Log.w(TAG, "frame relay: the host's surface is held by another producer; reconnect Android Auto");
        return false;
    }

    private static boolean connects(Surface surface) {
        EGLDisplay display = EGL14.eglGetDisplay(EGL14.EGL_DEFAULT_DISPLAY);
        int[] version = new int[2];
        if (display == EGL14.EGL_NO_DISPLAY || !EGL14.eglInitialize(display, version, 0, version, 1)) return true;
        int[] attributes = {
                EGL14.EGL_RENDERABLE_TYPE, EGL14.EGL_OPENGL_ES2_BIT,
                EGL14.EGL_SURFACE_TYPE, EGL14.EGL_WINDOW_BIT,
                EGL14.EGL_RED_SIZE, 8, EGL14.EGL_GREEN_SIZE, 8, EGL14.EGL_BLUE_SIZE, 8, EGL14.EGL_ALPHA_SIZE, 8,
                EGL14.EGL_NONE,
        };
        EGLConfig[] configs = new EGLConfig[1];
        int[] count = new int[1];
        if (!EGL14.eglChooseConfig(display, attributes, 0, configs, 0, 1, count, 0) || count[0] == 0) return true;
        EGLSurface probe;
        try {
            probe = EGL14.eglCreateWindowSurface(display, configs[0], surface, new int[]{EGL14.EGL_NONE}, 0);
        } catch (RuntimeException e) {
            return false;
        }
        if (probe == null || probe == EGL14.EGL_NO_SURFACE) return false;
        // Destroying it disconnects EGL from the Surface, for the hardware canvas to connect.
        EGL14.eglDestroySurface(display, probe);
        return true;
    }
}
