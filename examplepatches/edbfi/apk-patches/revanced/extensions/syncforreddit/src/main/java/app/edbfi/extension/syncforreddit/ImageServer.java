// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.URI;
import java.net.UnknownHostException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import okhttp3.Call;
import okhttp3.Dns;
import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okhttp3.Route;

/**
 * Runs in the app's image client, after the app's own interceptor. The app loads previews of some links in comments
 * and posts (Imgur albums, Tenor, Gfycat, website previews) from its developer's image server, which refuses links it
 * hasn't cached (401). Imgur album and Tenor previews come from Imgur and Tenor instead, and website previews from the
 * linked page itself; every other preview fails here, so the image client no longer sends the links people scroll past
 * to that server.
 */
public final class ImageServer implements Interceptor {
    static final String PREFIX = "https://ap.syncforreddit.com/image?url=";
    // Glide asks again each time a failed preview scrolls back into view.
    private static final long RETRY_AFTER_MS = 5 * 60_000;
    private static final int PAGE_TIMEOUT_MS = 5_000;
    private static final Map<String, Long> FAILED = new LinkedHashMap<String, Long>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Long> eldest) {
            return size() > 256;
        }
    };

    // Set while this thread loads a website preview: OkHttp looks hosts up on the call's thread, before connecting.
    static final ThreadLocal<Boolean> PREVIEWING = new ThreadLocal<>();
    // Cancels a page fetch that runs past its deadline, however slowly the site sends.
    private static final ScheduledThreadPoolExecutor WATCHDOG = new ScheduledThreadPoolExecutor(1, task -> {
        Thread thread = new Thread(task, "WebsitePreviews watchdog");
        thread.setDaemon(true);
        return thread;
    });

    static {
        // A preview that finished in time drops its watchdog, and with it the call it holds.
        WATCHDOG.setRemoveOnCancelPolicy(true);
    }

    private ImageServer() {}

    /** Replaces the app's {@code build()} of its image client. */
    public static OkHttpClient build(OkHttpClient.Builder builder) {
        OkHttpClient client = builder.addInterceptor(new ImageServer()).addNetworkInterceptor(new Guard()).build();
        return client.newBuilder().dns(new PreviewDns(client.dns())).build();
    }

    /** Throws only IOException: anything else thrown here would crash the app on OkHttp's thread. */
    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        String url = request.url().toString();
        if (!url.startsWith(PREFIX)) return chain.proceed(request);
        if (failedRecently(url)) throw new IOException("Preview failed recently: " + url);
        WebsitePreviews.Pages pages = WebsitePreviews.isEnabled() ? link -> fetchHead(chain, link) : null;
        boolean website = pages != null && WebsitePreviews.isWebsite(url.substring(PREFIX.length()));
        // Every preview's call is to the image server's host, and OkHttp runs five at once per host: however slowly a
        // site answers, its page and its image's headers get WebsitePreviews.DEADLINE_MS in all. The watchdog only
        // bounds the time: a lost connection looks the same, so only what a site sent is remembered.
        Call call = chain.call();
        ScheduledFuture<?> watchdog = website
                ? WATCHDOG.schedule(call::cancel, WebsitePreviews.DEADLINE_MS, TimeUnit.MILLISECONDS)
                : null;
        if (website) PREVIEWING.set(Boolean.TRUE);
        try {
            String image = thumbnailUrl(url, Imgur.isEnabled() ? Imgur.IMGUR : null, Tenor.isEnabled() ? Tenor.TENOR : null, pages);
            // The app's interceptor set the User-Agent it sends Reddit; other sites get the system's own.
            Request.Builder builder = request.newBuilder().url(image).header("User-Agent", Http.systemUserAgent());
            // A website names any image: Guard checks it as it checked the page. Imgur and Tenor are known hosts.
            if (website) builder.tag(Guard.class, Guard.ON);
            Request thumbnail = builder.build();
            if (website) checkHop(thumbnail.url());
            Response response = chain.proceed(thumbnail);
            // Glide fails on any other answer: don't ask the page again each time the preview scrolls into view.
            if (response.code() / 100 != 2) failed(url);
            return response;
        } catch (Exception error) {
            // Anything else is an answer: an image URL OkHttp refuses, or OkHttp's own NumberFormatException for a huge
            // Retry-After.
            IOException failure = error instanceof IOException ? (IOException) error : new Answer("Preview failed: " + url, error);
            if (worthRemembering(failure)) failed(url);
            throw failure;
        } finally {
            if (watchdog != null) watchdog.cancel(false);
            PREVIEWING.remove();
        }
    }

    /**
     * A failure that is an answer, worth remembering: Imgur, Tenor or a page had nothing to show, or refused to say (a
     * 429 or 5xx, which also spares the shared client's quota), or a request was refused. A lost connection is tried
     * again when the preview next shows, and a preview nothing handles costs nothing to fail again.
     */
    static final class Answer extends IOException {
        Answer(String message) {
            super(message);
        }

        Answer(String message, Throwable cause) {
            super(message, cause);
        }
    }

    static boolean worthRemembering(IOException failure) {
        for (Throwable cause = failure; cause != null; cause = cause.getCause()) {
            if (cause instanceof Answer || cause instanceof RefusedHost) return true;
        }
        return false;
    }

    /**
     * Checks a hop of a website preview before OkHttp connects: its host, and that it goes direct. Through a proxy,
     * OkHttp would name the host to it in a CONNECT, and the proxy would reach any address.
     */
    private static void checkHop(HttpUrl url) throws IOException {
        WebsitePreviews.checkHost(url.host());
        // Asked as OkHttp's RouteSelector asks: uri() escapes what java.net.URI refuses, and no selector, no host URI
        // can parse (an underscore) or no answer means a direct connection.
        ProxySelector selector = ProxySelector.getDefault();
        if (selector == null) return;
        List<Proxy> proxies;
        try {
            URI uri = url.uri();
            if (uri.getHost() == null) return;
            proxies = selector.select(uri);
        } catch (RuntimeException error) {
            throw new Answer("No route to check: " + url, error);
        }
        if (proxies == null) return;
        for (Proxy proxy : proxies) {
            if (proxy.type() != Proxy.Type.DIRECT) throw new Answer("Behind a proxy: " + url);
        }
    }

    /** An answer from {@link PreviewDns}, which may only throw this type. */
    static final class RefusedHost extends UnknownHostException {
        RefusedHost(String message) {
            super(message);
        }
    }

    /**
     * The image client's DNS, which the app sets to DNS over HTTPS or leaves to the system. For a website preview, it
     * refuses a host with any address that isn't public: what it answers is what OkHttp connects to.
     */
    static final class PreviewDns implements Dns {
        private final Dns dns;

        PreviewDns(Dns dns) {
            this.dns = dns;
        }

        @Override
        public List<InetAddress> lookup(String host) throws UnknownHostException {
            List<InetAddress> addresses = dns.lookup(host);
            if (Boolean.TRUE.equals(PREVIEWING.get()) && !WebsitePreviews.allPublic(addresses)) {
                throw new RefusedHost("Not a public address: " + host + " " + addresses);
            }
            return addresses;
        }
    }

    private static synchronized boolean failedRecently(String url) {
        Long at = FAILED.get(url);
        return at != null && System.currentTimeMillis() - at < RETRY_AFTER_MS;
    }

    private static synchronized void failed(String url) {
        FAILED.put(url, System.currentTimeMillis());
    }

    /**
     * Where to load a preview from the developer's image server instead: Imgur for an album, Tenor for a Tenor link,
     * the image a website names for other https links, nowhere for the rest. A null API is a fix that is off.
     */
    static String thumbnailUrl(String url, Imgur.Api imgur, Tenor.Api tenor, WebsitePreviews.Pages pages) throws IOException {
        String link = url.substring(PREFIX.length());
        String thumbnail = null;
        try {
            if (imgur != null) thumbnail = Imgur.albumPreview(url, imgur);
            if (thumbnail == null && tenor != null && Tenor.handles(link)) thumbnail = Tenor.thumbnail(link, tenor);
            if (thumbnail == null && pages != null && WebsitePreviews.isWebsite(link)) {
                thumbnail = WebsitePreviews.image(link, pages);
            }
        } catch (IOException error) {
            throw new IOException("Preview failed: " + url, error);
        } catch (Exception error) {
            // A malformed answer, a bad ID, nothing to show: anything else is an answer.
            throw new Answer("Preview failed: " + url, error);
        }
        if (thumbnail == null) throw new IOException("Sync's image server is gone: " + url);
        return thumbnail;
    }

    /**
     * The head of the page at the link, fetched through the rest of the image client so {@link Guard} checks every hop:
     * a fresh request, so the page gets no header the app sends Reddit, and the client keeps no cookies.
     */
    private static WebsitePreviews.Page fetchHead(Chain chain, String link) throws IOException {
        Request page;
        try {
            page = new Request.Builder()
                    .url(link)
                    .header("User-Agent", Http.systemUserAgent())
                    .header("Accept", "text/html,application/xhtml+xml")
                    .tag(Guard.class, Guard.ON)
                    .build();
        } catch (IllegalArgumentException error) {
            throw new IOException("Not a URL: " + link, error);
        }
        checkHop(page.url());
        // The client's connect timeout holds: this OkHttp reads only the read timeout from the chain.
        try (Response response = chain.withReadTimeout(PAGE_TIMEOUT_MS, TimeUnit.MILLISECONDS).proceed(page)) {
            if (response.code() != 200) throw new Answer("The page answered " + response.code() + ": " + link);
            String contentType = response.header("Content-Type");
            ResponseBody body = response.body();
            byte[] head = new byte[0];
            if (WebsitePreviews.isHtml(contentType) && body != null) {
                // From the answer on, not before: slow DNS or a slow connection is the network's, not the site's.
                long deadline = System.currentTimeMillis() + WebsitePreviews.PAGE_READ_MS;
                try (InputStream in = body.byteStream()) {
                    head = WebsitePreviews.readHead(in, WebsitePreviews.MAX_HEAD_BYTES, deadline);
                }
            }
            return new WebsitePreviews.Page(response.request().url().toString(), contentType, head);
        }
    }

    /**
     * A network interceptor: checks each hop of a website preview once connected, before its request is sent. It must
     * be https and reach a public address. A redirect must lead to https and a host {@link WebsitePreviews#checkHost}
     * allows, checked before OkHttp follows it; {@link PreviewDns} checks a name's addresses. Behind a proxy the address
     * is the proxy's, so nothing is sent: the proxy would reach any host.
     */
    static final class Guard implements Interceptor {
        static final Guard ON = new Guard();

        @Override
        public Response intercept(Chain chain) throws IOException {
            Request request = chain.request();
            if (request.tag(Guard.class) == null) return chain.proceed(request);
            if (!request.isHttps()) throw new Answer("Not https: " + request.url());
            Route route = chain.connection() == null ? null : chain.connection().route();
            if (route == null || route.proxy().type() != Proxy.Type.DIRECT) {
                throw new Answer("Behind a proxy: " + request.url());
            }
            InetSocketAddress address = route.socketAddress();
            if (!WebsitePreviews.isPublic(address.getAddress())) {
                throw new Answer("Not a public address (" + address.getAddress() + "): " + request.url());
            }
            Response response = chain.proceed(request);
            String location = response.code() / 100 == 3 ? response.header("Location") : null;
            if (location != null) {
                HttpUrl next = request.url().resolve(location);
                try {
                    if (next == null) throw new Answer("Not a URL: " + location);
                    if (!next.toString().startsWith("https://")) throw new Answer("Not https: " + next);
                    checkHop(next);
                } catch (IOException | RuntimeException refused) {
                    response.close();
                    throw refused instanceof IOException ? (IOException) refused : new IOException("Redirect failed", refused);
                }
            }
            return response;
        }
    }
}
