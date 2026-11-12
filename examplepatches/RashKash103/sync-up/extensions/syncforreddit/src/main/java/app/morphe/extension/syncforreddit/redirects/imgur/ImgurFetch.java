package app.morphe.extension.syncforreddit.redirects.imgur;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.http.ArchiveRequests;
import app.morphe.extension.syncforreddit.redirects.ProxyRoute;
import app.morphe.extension.syncforreddit.redirects.RedirectSettings;

import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Asking Imgur for something that is read rather than drawn — an album's page, or its API.
 *
 * <p>These are not requests the app makes: they are made from inside the answer to one, while
 * Sync waits to be told what an album holds. They therefore never pass through the interceptor,
 * which is where the routes live, and so went out directly however the settings were set. In a
 * region Imgur refuses that means they went out and failed, with a proxy sitting configured and
 * unused.
 *
 * <p>So the proxy is offered here too. Rimgo is not, because what it serves is a page of its
 * own rather than Imgur's — {@link RimgoAlbum} reads that — and DuckDuckGo's proxy is not,
 * because it fetches pictures and nothing else.
 */
public final class ImgurFetch {
    private ImgurFetch() {}

    /** @return Whether a request from here would be carried by a proxy rather than sent direct. */
    public static boolean throughAProxy() {
        return RedirectSettings.redirecting()
                && RedirectSettings.usingProxy()
                && ProxyRoute.configured();
    }

    /**
     * @return What Imgur answered, as text.
     * @throws IOException Where it could not be asked, or answered with anything but success —
     *                     which in a refused region is what being refused looks like.
     */
    public static String text(String url, String accept, @Nullable Map<String, String> alsoSend)
            throws IOException {
        if (!throughAProxy()) {
            return ArchiveRequests.get(url, accept, alsoSend);
        }

        Request.Builder asking = new Request.Builder().url(url);
        if (accept != null) {
            asking.header("Accept", accept);
        }
        if (alsoSend != null) {
            for (Map.Entry<String, String> each : alsoSend.entrySet()) {
                asking.header(each.getKey(), each.getValue());
            }
        }

        Response answered = ProxyRoute.carry(asking.build());
        if (answered == null) {
            throw new IOException(url + " could not be carried by the proxy");
        }
        try {
            if (!answered.isSuccessful()) {
                throw new IOException(url + " answered " + answered.code()
                        + " through the proxy");
            }
            ResponseBody body = answered.body();
            if (body == null) {
                throw new IOException(url + " answered nothing through the proxy");
            }
            Logger.printDebug(() -> "imgur: " + url + " was read through the proxy");
            return body.string();
        } finally {
            answered.close();
        }
    }
}
