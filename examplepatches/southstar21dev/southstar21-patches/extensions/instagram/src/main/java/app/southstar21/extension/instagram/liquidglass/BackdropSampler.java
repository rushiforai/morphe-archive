package app.southstar21.extension.instagram.liquidglass;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.PixelCopy;
import android.view.View;
import android.view.Window;

/**
 * Measures how bright the content around the pill is, so the glass can adapt like iOS does
 * (frostier over dark content in light mode, darker over bright content in dark mode).
 * <p>
 * The pill itself can't be sampled since we draw over it, so this copies the strip of the
 * window just above the pill (the content about to scroll underneath) a few times a second.
 */
final class BackdropSampler {
    private static final long INTERVAL_MS = 250;

    interface Listener {
        void onLuminance(float luminance);
    }

    private final View anchor;
    private final Listener listener;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Bitmap bitmap = Bitmap.createBitmap(24, 4, Bitmap.Config.ARGB_8888);
    private final int[] pixels = new int[24 * 4];
    private final int[] location = new int[2];
    private long lastRequest;
    private boolean inFlight;

    BackdropSampler(View anchor, Listener listener) {
        this.anchor = anchor;
        this.listener = listener;
    }

    /** Samples the strip of height {@code stripHeight} above {@code pillInAnchor}, rate limited. */
    void maybeSample(Rect pillInAnchor, int stripHeight) {
        long now = SystemClock.uptimeMillis();
        if (inFlight || now - lastRequest < INTERVAL_MS) return;
        Window window = windowOf(anchor.getContext());
        if (window == null || !anchor.isAttachedToWindow()) return;

        anchor.getLocationInWindow(location);
        int top = location[1] + pillInAnchor.top - stripHeight;
        Rect src = new Rect(location[0] + pillInAnchor.left, Math.max(0, top),
                location[0] + pillInAnchor.right, location[1] + pillInAnchor.top);
        if (src.isEmpty()) return;

        lastRequest = now;
        inFlight = true;
        try {
            PixelCopy.request(window, src, bitmap, result -> {
                inFlight = false;
                if (result == PixelCopy.SUCCESS) listener.onLuminance(averageLuminance());
            }, handler);
        } catch (Throwable t) {
            inFlight = false;
        }
    }

    private float averageLuminance() {
        bitmap.getPixels(pixels, 0, bitmap.getWidth(), 0, 0, bitmap.getWidth(), bitmap.getHeight());
        float sum = 0f;
        for (int c : pixels) {
            sum += 0.2126f * Color.red(c) + 0.7152f * Color.green(c) + 0.0722f * Color.blue(c);
        }
        return sum / (pixels.length * 255f);
    }

    static Window windowOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return ((Activity) context).getWindow();
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}
