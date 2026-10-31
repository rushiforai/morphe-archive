package app.morphe.extension.syncforreddit.http.imgur;

import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;

import app.morphe.extension.shared.Logger;

/**
 * Sync gives its Imgur requests Volley's default patience of two and a half seconds. That is
 * ample for the proxy it was written against, but the answers now come from an archive, and a
 * lookup there regularly takes longer than that. Without more time Sync gives up and opens the
 * link in a browser before the reply arrives.
 *
 * @noinspection unused
 */
public final class ImgurRequestTimeout {
    /**
     * Comfortably longer than a lookup takes, while still giving up rather than leaving a
     * request outstanding for as long as the archive cares to take.
     */
    private static final int TIMEOUT_MS = 25_000;

    private ImgurRequestTimeout() {}

    public static void allowTimeForTheArchive(Request request) {
        try {
            request.setRetryPolicy(new DefaultRetryPolicy(TIMEOUT_MS, 0, 1f));
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not give the Imgur request more time", ex);
        }
    }
}
