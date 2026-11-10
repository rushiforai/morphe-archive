package app.morphe.extension.twitch.base;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.webkit.JavascriptInterface;

/**
 * JavaScript bridge exposed to the Twitch web app as
 * {@code window.seyttingsNative}. The injected row calls
 * {@link #open()} when the user presses OK on SEYTTINGS.
 */
public final class SeyttingsBridge {

    private final Context context;

    public SeyttingsBridge(Context context) {
        this.context = context;
    }

    @JavascriptInterface
    public void open() {
        final Context target = context;
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                Seyttings.show(target);
            }
        });
    }
}
