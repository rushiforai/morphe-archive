package nl.johninnl.medium.reader;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.net.URI;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
import nl.johninnl.medium.vendor.okhttp3.Authenticator;
import nl.johninnl.medium.vendor.okhttp3.Call;
import nl.johninnl.medium.vendor.okhttp3.CookieJar;
import nl.johninnl.medium.vendor.okhttp3.OkHttpClient;
import nl.johninnl.medium.vendor.okhttp3.Request;
import nl.johninnl.medium.vendor.okhttp3.Response;
import nl.johninnl.medium.vendor.okhttp3.ResponseBody;

/** Isolated HTTPS client: no account jar, authentication, shared cache or app interceptors. */
public final class MirrorClient {
    private final URI origin;
    private final OkHttpClient client;
    private final int timeoutMillis;
    private final int maxBytes;

    public MirrorClient(URI origin) { this(origin, new OkHttpClient.Builder(), 12000, 8 * 1024 * 1024); }
    public URI origin() { return origin; }

    /** Caller may supply TLS/proxy configuration; credential and redirect policy remains owned here. */
    public MirrorClient(URI origin, OkHttpClient.Builder transport, int timeoutMillis, int maxBytes) {
        if (!"https".equalsIgnoreCase(origin.getScheme()) || origin.getHost() == null || origin.getUserInfo() != null ||
                origin.getQuery() != null || origin.getFragment() != null || !(origin.getPath().isEmpty() || origin.getPath().equals("/"))) {
            throw new IllegalArgumentException("Mirror must be an HTTPS origin without credentials or a path");
        }
        if (timeoutMillis <= 0 || maxBytes <= 0) throw new IllegalArgumentException("Limits must be positive");
        this.origin = origin.resolve("/"); this.timeoutMillis = timeoutMillis; this.maxBytes = maxBytes;
        transport.interceptors().clear();
        transport.networkInterceptors().clear();
        client = transport.cookieJar(CookieJar.NO_COOKIES).authenticator(Authenticator.NONE)
                .proxyAuthenticator(Authenticator.NONE).cache(null).followRedirects(false).followSslRedirects(false)
                .retryOnConnectionFailure(false).connectTimeout(timeoutMillis, TimeUnit.MILLISECONDS)
                .readTimeout(timeoutMillis, TimeUnit.MILLISECONDS).callTimeout(timeoutMillis, TimeUnit.MILLISECONDS).build();
    }

    public ArticleBody fetch(String postId, Cancellation cancellation) throws ArticleException {
        return fetch(postId, null, cancellation);
    }
    public ArticleBody fetch(String postId, String mediumUrl, Cancellation cancellation) throws ArticleException {
        if (postId == null || !postId.matches("[a-f0-9]{12}")) throw new ArticleException("IDENTITY", "Invalid public article ID");
        cancellation.check();
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(timeoutMillis);
        URI current = articleUrl(postId, mediumUrl);
        for (int redirects = 0; redirects <= 4; redirects++) {
            cancellation.check();
            long remaining = deadline - System.nanoTime();
            if (remaining <= 0) throw new ArticleException("TIMEOUT", "Article request timed out");
            Request request = new Request.Builder().url(current.toString()).header("Accept", "text/html")
                    .header("User-Agent", "MediumNativeReader/0.1").build();
            Call call = client.newCall(request);
            call.timeout().timeout(remaining, TimeUnit.NANOSECONDS);
            try (Cancellation.Registration registration = cancellation.onCancel(call::cancel)) {
                cancellation.check();
                try (Response response = call.execute()) {
                    cancellation.check();
                    int status = response.code();
                    if (status == 301 || status == 302 || status == 303 || status == 307 || status == 308) {
                        URI next;
                        try { next = current.resolve(response.header("Location")); }
                        catch (RuntimeException invalid) { throw new ArticleException("REDIRECT", "Invalid mirror redirect", invalid); }
                        if (!sameOrigin(next)) throw new ArticleException("REDIRECT", "Mirror redirected to another origin");
                        current = next;
                        continue;
                    }
                    if (status != 200) throw new ArticleException("HTTP", "Mirror returned HTTP " + status);
                    String mediaType = response.header("Content-Type");
                    if (mediaType == null || !mediaType.toLowerCase(Locale.ROOT).split(";", 2)[0].trim().equals("text/html")) {
                        throw new ArticleException("CONTENT_TYPE", "Mirror did not return an HTML article");
                    }
                    ResponseBody responseBody = response.body();
                    if (responseBody == null) throw new ArticleException("MISSING_BODY", "Mirror response has no body");
                    try (InputStream input = responseBody.byteStream(); ByteArrayOutputStream bytes = new ByteArrayOutputStream()) {
                        byte[] buffer = new byte[8192];
                        int count;
                        while ((count = input.read(buffer)) != -1) {
                            cancellation.check();
                            if (System.nanoTime() >= deadline) throw new ArticleException("TIMEOUT", "Article request timed out");
                            if (count > maxBytes - bytes.size()) throw new ArticleException("RESPONSE_LIMIT", "Mirror response is too large");
                            bytes.write(buffer, 0, count);
                        }
                        cancellation.check();
                        if (System.nanoTime() >= deadline) throw new ArticleException("TIMEOUT", "Article request timed out");
                        String html = StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                                .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes.toByteArray())).toString();
                        ArticleBody body = ArticleParser.parse(html, postId, origin);
                        cancellation.check();
                        return body;
                    }
                }
            } catch (CharacterCodingException invalid) {
                throw new ArticleException("INCOMPLETE_RESPONSE", "Mirror response has invalid text encoding", invalid);
            } catch (IOException failure) {
                cancellation.check();
                if (failure instanceof InterruptedIOException || System.nanoTime() >= deadline) {
                    throw new ArticleException("TIMEOUT", "Article request timed out", failure);
                }
                throw new ArticleException("NETWORK", "Unable to fetch the article", failure);
            }
        }
        throw new ArticleException("REDIRECT", "Mirror redirected too many times");
    }

    private URI articleUrl(String postId, String mediumUrl) {
        if (mediumUrl != null) try {
            URI source = URI.create(mediumUrl);
            if ("https".equalsIgnoreCase(source.getScheme()) && source.getHost() != null && source.getUserInfo() == null &&
                    source.getPath() != null && source.getPath().matches(".*[-/]" + postId)) {
                // Use Freedium's public full-URL route; strip attribution/share query parameters.
                URI clean = new URI("https", null, source.getHost(), source.getPort(), source.getPath(), null, null);
                return URI.create(origin.toString() + clean.toASCIIString());
            }
        } catch (IllegalArgumentException | java.net.URISyntaxException invalid) { /* Use the validated ID route. */ }
        return origin.resolve(postId);
    }

    private boolean sameOrigin(URI uri) {
        return "https".equalsIgnoreCase(uri.getScheme()) && uri.getUserInfo() == null && uri.getFragment() == null &&
                origin.getHost().equalsIgnoreCase(uri.getHost()) && port(origin) == port(uri);
    }
    private static int port(URI uri) { return uri.getPort() == -1 ? 443 : uri.getPort(); }
}
