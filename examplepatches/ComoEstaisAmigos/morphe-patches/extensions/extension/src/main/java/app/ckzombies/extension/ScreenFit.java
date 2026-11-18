package app.ckzombies.extension;

import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;

/**
 * Lets the game draw into a surface 720 pixels high, which Android stretches over the screen.
 *
 * The engine lays everything out from the size its surface reports and draws its art unscaled.
 * The art was made for 2012's screens, so on a 1080p screen the menus and text come out small
 * and the full screen pictures cover only part of it. Given a 720 high surface the engine lays
 * out as it does on a 720p phone, and the system scales the result up.
 *
 * The 3D game is the exception: it fills any surface by itself, so while it exists the surface
 * keeps the screen's own resolution and the picture stays sharp. Its HUD is then the size it is
 * in the unpatched game.
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
    private static WeakReference<SurfaceView> mainView = new WeakReference<SurfaceView>(null);
    // Set on the engine's thread: whether its 3D game exists, and the surface format Android
    // last reported, which the engine wants with every size.
    private static volatile boolean inGame;
    private static volatile int surfaceFormat = -1;

    private ScreenFit() {
    }

    /** Called with the game's SurfaceView right after it is built, before it is laid out. */
    public static void attach(final SurfaceView view) {
        mainView = new WeakReference<SurfaceView>(view);
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
        int[] surface = targetSize(width, height);
        if (width != viewWidth || height != viewHeight || surface[0] != surfaceWidth || surface[1] != surfaceHeight) {
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

    /**
     * Called first in GluPlatformActivity.EnableMultipleTouch(). The engine turns multi-touch on
     * when it builds its 3D game (CSwerveGame) and off when it destroys it, and nowhere else. The
     * call comes on the engine's thread: the engine gets its new size at once, and Android's
     * surface follows on the main thread.
     */
    public static void gameScene(Object activity, boolean on) {
        if (inGame == on) {
            return;
        }
        inGame = on;
        final SurfaceView view = mainView.get();
        if (view == null) {
            return;
        }
        tellEngineNow(activity, view);
        view.post(new Runnable() {
            public void run() {
                fit(view.getHolder(), view.getWidth(), view.getHeight());
            }
        });
    }

    /** Called first in GluPlatformActivity.surfaceChanged() with the format Android reports. */
    public static void format(int format) {
        surfaceFormat = format;
    }

    /**
     * Hands the engine its new size at once, on its own thread, through the activity's own
     * surfaceChanged(). The engine builds the 3D game's HUD a few frames after the game object,
     * from the size it has processed by then; waiting for Android to resize the surface first
     * makes the HUD lay out for the old size. CApplet::surfaceChanged() stores the size and
     * queues the resize, and when Android's own call follows with the same size it changes
     * nothing more.
     */
    private static void tellEngineNow(Object activity, SurfaceView view) {
        int width = view.getWidth();
        int height = view.getHeight();
        if (activity == null || surfaceFormat < 0 || width <= 0 || height <= 0) {
            return;
        }
        int[] surface = targetSize(width, height);
        Log.i(TAG, (inGame ? "3D game" : "menus") + ", engine at " + surface[0] + "x" + surface[1]);
        try {
            Method changed = activity.getClass().getMethod("surfaceChanged",
                    SurfaceHolder.class, int.class, int.class, int.class);
            changed.invoke(activity, view.getHolder(), surfaceFormat, surface[0], surface[1]);
        } catch (Throwable t) {
            Log.w(TAG, "could not tell the engine", t);
        }
    }

    /** The surface the view gets now: its own size while the 3D game exists, else the fitted one. */
    private static int[] targetSize(int width, int height) {
        return inGame ? new int[] {width, height} : surfaceSize(width, height);
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
