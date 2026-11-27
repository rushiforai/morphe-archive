// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.websitepreview;

import android.os.Build;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.Proxy;
import java.net.Socket;
import java.net.URI;
import java.net.UnknownHostException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import okhttp3.Authenticator;
import okhttp3.Call;
import okhttp3.Connection;
import okhttp3.ConnectionPool;
import okhttp3.CookieJar;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;

final class PreviewClient {
    private static final int MAX_PAGE_BYTES = 512 * 1024;
    private static final int MAX_IMAGE_BYTES = 3 * 1024 * 1024;
    private static final int MAX_IMAGE_CANDIDATES = 2;
    private static final int MAX_REDIRECTS = 3;
    private static final int MAX_URL_LENGTH = 4096;
    private static final long TIME_BUDGET_NANOS = TimeUnit.SECONDS.toNanos(12);
    private static final String IMAGE_ACCEPT = "image/webp,image/png,image/jpeg,image/gif";

    // Glide can start four source loads concurrently.
    private static final ThreadPoolExecutor DNS = new ThreadPoolExecutor(
            0, 4, 30, TimeUnit.SECONDS, new SynchronousQueue<>(), work -> {
                Thread thread = new Thread(work, "Sync preview DNS");
                thread.setDaemon(true);
                return thread;
            });

    interface Access {
        boolean allows(HttpUrl url);
    }

    interface ImageDecoder<T> {
        T decode(byte[] bytes) throws IOException;
    }

    private final OkHttpClient client;
    private final boolean supportsAvif;

    PreviewClient() {
        this(new OkHttpClient.Builder()
                .proxy(Proxy.NO_PROXY)
                .cookieJar(CookieJar.NO_COOKIES)
                .authenticator(Authenticator.NONE)
                .proxyAuthenticator(Authenticator.NONE)
                .dns(host -> resolve(() -> InetAddress.getAllByName(host)))
                .connectionPool(new ConnectionPool(0, 1, TimeUnit.SECONDS))
                .protocols(Collections.singletonList(Protocol.HTTP_1_1))
                .connectTimeout(3, TimeUnit.SECONDS)
                .readTimeout(3, TimeUnit.SECONDS)
                .followRedirects(false)
                .followSslRedirects(false)
                .retryOnConnectionFailure(false)
                .addNetworkInterceptor(chain -> {
                    Connection connection = chain.connection();
                    if (connection == null) throw new IOException("Missing website preview connection");
                    Socket socket = connection.socket();
                    checkPeer(connection.route().socketAddress().getAddress(), socket.getInetAddress());
                    return chain.proceed(chain.request());
                })
                .build(), Build.VERSION.SDK_INT);
    }

    PreviewClient(OkHttpClient client, int sdkInt) {
        this.client = client;
        this.supportsAvif = sdkInt >= Build.VERSION_CODES.S;
    }

    static void checkPeer(InetAddress selected, InetAddress peer) throws IOException {
        if (!PublicAddress.allows(peer) || !peer.equals(selected)) {
            throw new IOException("Website preview peer is not an approved public address");
        }
    }

    static List<InetAddress> publicAnswers(InetAddress[] addresses) throws UnknownHostException {
        if (addresses.length == 0) throw new UnknownHostException("No website preview addresses");
        for (InetAddress address : addresses) {
            if (!PublicAddress.allows(address)) throw new UnknownHostException("Non-public preview address");
        }
        return Arrays.asList(addresses);
    }

    static List<InetAddress> resolve(Callable<InetAddress[]> query) throws UnknownHostException {
        Future<InetAddress[]> lookup;
        try {
            lookup = DNS.submit(query);
        } catch (RejectedExecutionException ignored) {
            throw new UnknownHostException("Website preview DNS busy");
        }
        try {
            return publicAnswers(lookup.get(2, TimeUnit.SECONDS));
        } catch (InterruptedException ignored) {
            Thread.currentThread().interrupt();
            throw new UnknownHostException("Website preview DNS interrupted");
        } catch (ExecutionException | TimeoutException ignored) {
            throw new UnknownHostException("Website preview DNS unavailable");
        } finally {
            lookup.cancel(true);
        }
    }

    static HttpUrl url(String reference, HttpUrl base) {
        if (reference == null || reference.length() > MAX_URL_LENGTH || reference.indexOf('\\') >= 0) {
            return null;
        }
        // Check the spelling before OkHttp canonicalizes the authority, including an empty userinfo.
        URI syntax;
        try {
            syntax = URI.create(reference);
        } catch (IllegalArgumentException ignored) {
            return null;
        }
        String authority = syntax.getRawAuthority();
        if ((syntax.isAbsolute() && authority == null) || (authority != null && authority.contains("@"))) {
            return null;
        }
        HttpUrl resolved = base == null ? HttpUrl.parse(reference) : base.resolve(reference);
        if (resolved == null || !resolved.encodedUsername().isEmpty() || !resolved.encodedPassword().isEmpty()
                || resolved.toString().length() > MAX_URL_LENGTH || !PublicAddress.allows(resolved)) {
            return null;
        }
        return resolved.newBuilder().fragment(null).build();
    }

    static final class RequestScope {
        private Call call;
        private boolean cancelled;

        synchronized boolean start(Call next) {
            if (cancelled) return false;
            call = next;
            return true;
        }

        synchronized void finish() {
            call = null;
        }

        synchronized void cancel() {
            cancelled = true;
            if (call != null) call.cancel();
        }

        synchronized boolean isCancelled() {
            return cancelled;
        }
    }

    static final class FetchedImage<T> {
        final HttpUrl url;
        final T image;

        FetchedImage(HttpUrl url, T image) {
            this.url = url;
            this.image = image;
        }
    }

    <T> FetchedImage<T> fetch(HttpUrl page, Access access, RequestScope scope, ImageDecoder<T> decoder)
            throws IOException {
        long deadline = System.nanoTime() + TIME_BUDGET_NANOS;
        Transfer html = get(page, false, access, scope, deadline, new TransferBudget(MAX_PAGE_BYTES));
        TransferBudget imageBudget = new TransferBudget(MAX_IMAGE_BYTES);
        IOException failure = new IOException("Website has no supported preview image");
        for (HttpUrl image : imageUrls(html)) {
            try {
                Transfer response = get(image, true, access, scope, deadline, imageBudget);
                return new FetchedImage<>(response.url, decoder.decode(response.bytes));
            } catch (RequestStopped stopped) {
                throw stopped;
            } catch (IOException unavailable) {
                failure = unavailable;
            }
        }
        throw failure;
    }

    private Transfer get(HttpUrl url, boolean image, Access access, RequestScope scope, long deadline,
            TransferBudget budget) throws IOException {
        while (true) {
            if (!access.allows(url)) throw new RequestStopped("Website preview disabled");
            long remaining = deadline - System.nanoTime();
            if (remaining < TimeUnit.MILLISECONDS.toNanos(1)) throw new RequestStopped("Website preview timed out");
            budget.request();

            // Sync renames Okio's Timeout class. Set the budget through OkHttp's builder.
            Call call = client.newBuilder().callTimeout(remaining, TimeUnit.NANOSECONDS).build()
                    .newCall(new Request.Builder().url(url).header("Accept", accept(image)).build());
            if (!scope.start(call)) throw new RequestStopped("Website preview cancelled");
            try (Response response = call.execute()) {
                if (redirect(response.code())) {
                    url = url(response.header("Location"), url);
                    if (url == null) throw new IOException("Unsupported website preview redirect");
                    continue;
                }
                ResponseBody body = response.body();
                MediaType type = body == null ? null : body.contentType();
                if (!response.isSuccessful() || type == null || !supported(type, image)) {
                    throw new IOException("Unsupported website preview response");
                }
                if (body.contentLength() > budget.bytes) throw new IOException("Website preview response too large");
                return new Transfer(url, type, readLimited(body.byteStream(), budget));
            } finally {
                scope.finish();
            }
        }
    }

    private static boolean redirect(int code) {
        return code == 301 || code == 302 || code == 303 || code == 307 || code == 308;
    }

    private String accept(boolean image) {
        if (!image) return "text/html,application/xhtml+xml";
        return supportsAvif ? "image/avif," + IMAGE_ACCEPT : IMAGE_ACCEPT;
    }

    private boolean supported(MediaType type, boolean image) {
        String subtype = type.subtype();
        return image
                ? type.type().equals("image") && (subtype.equals("png") || subtype.equals("jpeg")
                        || subtype.equals("webp") || subtype.equals("gif") || (supportsAvif && subtype.equals("avif")))
                : (type.type().equals("text") && subtype.equals("html"))
                        || (type.type().equals("application") && subtype.equals("xhtml+xml"));
    }

    private static byte[] readLimited(InputStream stream, TransferBudget budget) throws IOException {
        ByteArrayOutputStream result = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        for (int count; (count = stream.read(buffer)) != -1;) {
            if (count > budget.bytes) throw new RequestStopped("Website preview response too large");
            budget.bytes -= count;
            result.write(buffer, 0, count);
        }
        return result.toByteArray();
    }

    private static List<HttpUrl> imageUrls(Transfer page) throws IOException {
        Charset charset = page.type.charset();
        String encoding = charset == null ? null : charset.name();
        List<HttpUrl> images = new ArrayList<>(MAX_IMAGE_CANDIDATES);
        for (Element meta : Jsoup.parse(new ByteArrayInputStream(page.bytes), encoding, page.url.toString())
                .head().select("meta[property=og:image][content], meta[name=og:image][content]")) {
            String content = meta.attr("content").trim();
            if (!content.isEmpty()) {
                HttpUrl image = url(content, page.url);
                if (image != null && !images.contains(image)) {
                    images.add(image);
                    if (images.size() == MAX_IMAGE_CANDIDATES) break;
                }
            }
        }
        return images;
    }

    private static final class RequestStopped extends IOException {
        RequestStopped(String message) {
            super(message);
        }
    }

    private static final class TransferBudget {
        private int requests = MAX_REDIRECTS + 1;
        private int bytes;

        TransferBudget(int bytes) {
            this.bytes = bytes;
        }

        void request() throws RequestStopped {
            if (requests == 0 || bytes == 0) throw new RequestStopped("Website preview budget exhausted");
            requests--;
        }
    }

    private static final class Transfer {
        final HttpUrl url;
        final MediaType type;
        final byte[] bytes;

        Transfer(HttpUrl url, MediaType type, byte[] bytes) {
            this.url = url;
            this.type = type;
            this.bytes = bytes;
        }
    }
}
