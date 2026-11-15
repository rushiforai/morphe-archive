package app.drbushytop.extension.relay.inline;

import android.content.Context;
import android.util.Log;

import java.io.File;
import java.lang.reflect.Method;
import java.util.concurrent.Future;

/**
 * Downloads through Relay's own Glide, exactly as Relay's full screen image viewer does
 * ({@code FragmentImagePreview}: {@code Glide.with(..).downloadOnly().load(url).submit().get()}).
 *
 * <p>That puts the file in Glide's disk cache under the same key the viewer looks up, so opening
 * a picture already drawn inline does not download it again.
 *
 * <p>Glide is obfuscated in Relay 10.2.40, which is the only version these patches target, so
 * the method names below are that build's. If any is missing the caller falls back to a plain
 * download.
 */
final class RelayGlide {
    private static volatile boolean broken;
    private static Method with;          // static RequestManager Glide.u(Context)
    private static Method downloadOnly;  // RequestBuilder RequestManager.p()
    private static Method load;          // RequestBuilder RequestBuilder.P0(String)
    private static Method submit;        // FutureTarget RequestBuilder.V0()
    private static Method clear;         // void RequestManager.o(Target)

    private RelayGlide() {
    }

    private static synchronized boolean resolve() {
        if (with != null) return true;
        if (broken) return false;
        try {
            Class<?> glide = Class.forName("com.bumptech.glide.Glide");
            Class<?> manager = Class.forName("com.bumptech.glide.RequestManager");
            Class<?> builder = Class.forName("com.bumptech.glide.RequestBuilder");
            Class<?> target = Class.forName("com.bumptech.glide.request.target.Target");
            Method withMethod = glide.getMethod("u", Context.class);
            downloadOnly = manager.getMethod("p");
            load = builder.getMethod("P0", String.class);
            submit = builder.getMethod("V0");
            clear = manager.getMethod("o", target);
            with = withMethod;
            return true;
        } catch (Throwable t) {
            broken = true;
            Log.w(InlineCommentMedia.TAG, "Relay's Glide not found, downloading directly", t);
            return false;
        }
    }

    /** Off the main thread. The downloaded file, or null when Glide cannot be used. */
    static File download(Context context, String url) throws Exception {
        if (context == null || !resolve()) return null;
        Object manager = with.invoke(null, context.getApplicationContext());
        Object request = load.invoke(downloadOnly.invoke(manager), url);
        Object future = submit.invoke(request);
        try {
            return (File) ((Future<?>) future).get();
        } finally {
            try {
                clear.invoke(manager, future);
            } catch (Throwable ignored) {
                // Only frees the request; the file stays in the cache.
            }
        }
    }
}
