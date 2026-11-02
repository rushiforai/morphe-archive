package com.miui.miwallpaper.earth.superwallpaper;

import android.os.Handler;

/**
 * Delays the AOD zoom-out on screen-off so the device's closing animation can
 * finish before the wallpaper transitions.
 *
 * <p>Only one transition can be pending at a time. The pending transition is
 * cancelled when the display wakes, so a long delay cannot put an awake device
 * back into the AOD state.</p>
 */
@SuppressWarnings("unused")
public final class AodDelay implements Runnable {

    private static AodDelay sPending;

    private final Handler handler;
    private final BaseEarthSuperWallpaper.SuperWallpaperEngine engine;
    private final int position;

    private AodDelay(
            Handler handler,
            BaseEarthSuperWallpaper.SuperWallpaperEngine engine,
            int position
    ) {
        this.handler = handler;
        this.engine = engine;
        this.position = position;
    }

    public static void post(
            Handler handler,
            BaseEarthSuperWallpaper.SuperWallpaperEngine engine,
            int position,
            long delayMs
    ) {
        cancel();
        AodDelay runnable = new AodDelay(handler, engine, position);
        sPending = runnable;
        handler.postDelayed(runnable, delayMs);
    }

    public static void cancel() {
        AodDelay pending = sPending;
        if (pending != null) {
            pending.handler.removeCallbacks(pending);
            sPending = null;
        }
    }

    @Override
    public void run() {
        sPending = null;
        engine.goToAodState(position);
    }
}
