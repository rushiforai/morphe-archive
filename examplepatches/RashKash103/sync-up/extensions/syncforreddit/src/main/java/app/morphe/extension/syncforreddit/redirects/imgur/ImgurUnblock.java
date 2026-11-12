package app.morphe.extension.syncforreddit.redirects.imgur;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.io.IOException;
import java.util.Locale;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import app.morphe.extension.syncforreddit.http.OkHttpRequestHook;
import app.morphe.extension.syncforreddit.redirects.ProxyRoute;
import app.morphe.extension.syncforreddit.redirects.RedirectSettings;

import okhttp3.HttpUrl;
import okhttp3.Request;
import okhttp3.Response;

/**
 * Takes Imgur requests another way, where Imgur refuses to answer this part of the world.
 *
 * <p>Imgur blocks whole regions — the United Kingdom among them — and what arrives in place of a
 * picture is a notice. Nothing in Sync can be told to do anything about that, and it affects
 * every picture in every feed, so there is nothing to work around by hand either.
 *
 * <p>Three routes, each able to answer a different amount:
 *
 * <ol>
 *   <li><b>DuckDuckGo's image proxy</b> is tried first for a still picture. It needs nothing
 *       set up, nothing trusted beyond DuckDuckGo, and no third party chosen, which is why it
 *       is the one that is on by default. It serves one picture at a time and nothing else.
 *   <li><b>Rimgo</b>, where instances have been chosen, serves pictures, videos and album pages
 *       alike. It is opt-in, because asking a stranger's server for pictures is a decision
 *       rather than a default.
 *   <li><b>A proxy</b> of the reader's own carries anything, Imgur's own API included. Also
 *       opt-in, for the same reason and more so.
 * </ol>
 *
 * <p>Only requests to Imgur are touched. Everything else in the app goes out exactly as it did,
 * and where every route fails the original request is made anyway, so a failure here leaves the
 * app no worse off than it was — and leaves the undelete interceptor below still able to find a
 * picture that is genuinely gone rather than merely refused.
 *
 * @noinspection unused
 */
public class ImgurUnblock extends PatchedditInterceptor {
    /**
     * How many Rimgo instances one request is asked of before the next route is tried.
     *
     * <p>Bounded: this runs while the picture is not on the screen, and a long list of instances
     * that are being rate limited must not turn into a long wait before the proxy is reached.
     */
    private static final int MOST_INSTANCES = 2;

    /** What answered last, for the settings screen to show. Kept in memory and nowhere else. */
    private static volatile String lastUsed = "";

    @Override
    public boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * Always registered, and decides for itself whether to do anything: the master switch is a
     * setting rather than a patch, so that it can be turned on and off without repatching.
     */
    @Override
    public boolean isEnabled() {
        return isPatchIncluded();
    }

    /** @return What answered the last Imgur request, or an empty string if none has yet. */
    public static String lastUsed() {
        return lastUsed;
    }

    @NonNull
    @Override
    protected Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        HttpUrl url = request.url();

        if (!RedirectSettings.redirecting() || !ImgurRoutes.isImgur(url.host())) {
            return chain.proceed(request);
        }

        ImgurRoutes.Kind kind = ImgurRoutes.kindOf(url.host(), url.encodedPath());
        if (kind == ImgurRoutes.Kind.NONE) {
            return chain.proceed(request);
        }

        // Asked to step in only once Imgur itself has refused: Imgur answers quickest where it
        // answers at all, and this keeps the routes for where they are needed.
        if (RedirectSettings.onlyOnceRefused()) {
            try {
                Response direct = chain.proceed(request);
                if (isWhatWasAskedFor(direct, kind)) {
                    said("Imgur");
                    return direct;
                }
                Logger.printDebug(() -> "imgur: " + url + " was answered " + direct.code()
                        + " " + direct.header("Content-Type", "") + "; taking another route");
                direct.close();
            } catch (IOException ex) {
                // Being refused is not always a reply. Where a region is blocked at the name
                // or at the connection rather than by Imgur answering, asking throws — and
                // letting that out would mean the routes were never tried in exactly the case
                // they exist for.
                Logger.printDebug(() -> "imgur: " + url + " could not be reached (" + ex
                        + "); taking another route");
            }
        }

        Response answered = throughDuckDuckGo(chain, request, url, kind);
        if (answered == null) {
            answered = throughRimgo(chain, request, url, kind);
        }
        if (answered == null) {
            answered = throughAProxy(request, kind);
        }
        if (answered != null) {
            return answered;
        }

        // Nothing worked. The request is made anyway rather than answered with a failure of our
        // own: where Imgur is not in fact blocking this reader it will simply answer, and where
        // the picture is gone rather than refused the undelete interceptor below still gets its
        // turn at the archive.
        Logger.printDebug(() -> "imgur: no route answered for " + url + "; asking Imgur itself");
        said("Imgur (no route answered)");
        return chain.proceed(request);
    }

    // region The routes.

    @Nullable
    private Response throughDuckDuckGo(
            Chain chain, Request request, HttpUrl url, ImgurRoutes.Kind kind) throws IOException {
        if (!RedirectSettings.usingDuckDuckGo()) {
            return null;
        }
        String instead = ImgurRoutes.duckDuckGo(url.toString(), kind);
        if (instead == null) {
            return null;
        }
        HttpUrl parsed = HttpUrl.parse(instead);
        if (parsed == null) {
            return null;
        }

        Response answered;
        try {
            answered = chain.proceed(leavingUs(request).url(parsed).build());
        } catch (IOException ex) {
            // One route being unreachable says nothing about the next.
            Logger.printDebug(() -> "imgur: DuckDuckGo could not be reached: " + ex);
            return null;
        }
        if (isWhatWasAskedFor(answered, kind)) {
            Logger.printDebug(() -> "imgur: DuckDuckGo served " + url.encodedPath());
            said("DuckDuckGo");
            return answered;
        }
        // Its refusal is a small SVG apology, which an image decoder would draw as a broken
        // picture, so it is closed here rather than handed on.
        Logger.printDebug(() -> "imgur: DuckDuckGo answered " + answered.code() + " for "
                + url.encodedPath());
        answered.close();
        return null;
    }

    @Nullable
    private Response throughRimgo(
            Chain chain, Request request, HttpUrl url, ImgurRoutes.Kind kind) throws IOException {
        if (!RedirectSettings.usingRimgo()) {
            return null;
        }
        // More than one instance, because what one serves another refuses: of the published
        // list, instances that serve pictures perfectly answer 403 to an album, and an instance
        // that has just been rate limited by Imgur answers 429 to everything for a while. A
        // failure here rests the instance, so the next turn of this picks a different one.
        for (int attempt = 0; attempt < MOST_INSTANCES; attempt++) {
            String instance = RimgoInstances.inUse();
            if (instance == null) {
                return null;
            }
            Response answered = throughThisInstance(chain, request, url, kind, instance);
            if (answered != null) {
                return answered;
            }
        }
        return null;
    }

    @Nullable
    private Response throughThisInstance(Chain chain, Request request, HttpUrl url,
                                         ImgurRoutes.Kind kind, String instance)
            throws IOException {
        String instead = ImgurRoutes.rimgo(instance, url.host(), url.encodedPath(), kind);
        if (instead == null) {
            return null;
        }
        HttpUrl parsed = HttpUrl.parse(instead);
        if (parsed == null) {
            return null;
        }

        Request asking = leavingUs(request).url(parsed).build();
        Response answered;
        if (RimgoRoute.carrying(instance)) {
            // This instance has a certificate attached, which Sync's own client knows nothing
            // about, so the request is carried on a client that can offer it.
            answered = RimgoRoute.carry(instance, asking);
            if (answered == null) {
                RimgoInstances.failed(instance);
                return null;
            }
            answered = answered.newBuilder().request(request).build();
        } else {
            try {
                answered = chain.proceed(asking);
            } catch (IOException ex) {
                Logger.printDebug(() -> "imgur: " + instance + " could not be reached: " + ex);
                RimgoInstances.failed(instance);
                return null;
            }
        }
        if (isWhatWasAskedFor(answered, kind)) {
            Logger.printDebug(() -> "imgur: " + instance + " served " + url.encodedPath());
            RimgoInstances.worked(instance);
            said("Rimgo (" + hostOf(instance) + ")");
            return answered;
        }
        // Held apart from the variable above, which is reassigned where the certificate
        // client carried the request and so cannot be spoken about from inside a log message.
        final Response said = answered;
        Logger.printDebug(() -> "imgur: " + instance + " answered " + said.code()
                + " " + said.header("Content-Type", "") + " for " + url.encodedPath());
        answered.close();
        RimgoInstances.failed(instance);
        return null;
    }

    @Nullable
    private Response throughAProxy(Request request, ImgurRoutes.Kind kind) {
        if (!RedirectSettings.usingProxy() || !ProxyRoute.configured()) {
            return null;
        }
        Response answered = ProxyRoute.carry(leavingUs(request).build());
        if (answered == null) {
            return null;
        }
        if (isWhatWasAskedFor(answered, kind)) {
            Logger.printDebug(() -> "imgur: the proxy served " + request.url().encodedPath());
            said("Proxy");
            // Handed back against the request the chain asked about rather than the one that
            // was carried, so that nothing downstream is surprised by what it is holding.
            return answered.newBuilder().request(request).build();
        }
        Logger.printDebug(() -> "imgur: the proxy answered " + answered.code() + " for "
                + request.url().encodedPath());
        answered.close();
        return null;
    }

    // endregion

    /**
     * @return Whether this is the thing that was asked for, rather than something that merely
     *         arrived. A status on its own is not enough: an instance that routes a media
     *         address to its page handler answers 200 with HTML, and HTML given to an image
     *         decoder draws as a broken picture, which reads as this patch failing rather than
     *         as that instance being wrong.
     */
    private static boolean isWhatWasAskedFor(Response answered, ImgurRoutes.Kind kind) {
        if (!answered.isSuccessful()) {
            return false;
        }
        String kindOfBody = answered.header("Content-Type", "");
        String said = kindOfBody == null ? "" : kindOfBody.toLowerCase(Locale.ROOT);

        switch (kind) {
            case PICTURE:
                return said.startsWith("image/");
            case VIDEO:
                // A gif served where a video was asked for is still something that plays.
                return said.startsWith("video/") || said.startsWith("image/")
                        || said.startsWith("application/octet-stream");
            default:
                return true;
        }
    }

    /**
     * @return The request as it should leave for somewhere that is not Imgur. The header that
     *         marks a request as one made to draw a picture is ours and means nothing to anyone
     *         else, so it is not sent to a third party; nothing below reads it on these
     *         addresses.
     */
    private static Request.Builder leavingUs(Request request) {
        return request.newBuilder().removeHeader(OkHttpRequestHook.IMAGE_REQUEST);
    }

    private static void said(String what) {
        lastUsed = what;
    }

    private static String hostOf(String instance) {
        HttpUrl parsed = HttpUrl.parse(instance);
        return parsed == null ? instance : parsed.host();
    }
}
