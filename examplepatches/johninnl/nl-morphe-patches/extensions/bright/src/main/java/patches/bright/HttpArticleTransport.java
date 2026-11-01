package patches.bright;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/**
 * The private, scoped article client. One signed GET per eligible article,
 * redirects disabled and re-validated hop by hop, bounded in time, size and
 * concurrency. The signing header is attached to exactly this client's
 * requests and nowhere else; any rejection defers to the publisher.
 */
final class HttpArticleTransport {

    static final String API_HOST = "api.bright.nl";
    static final int DOMAIN_ID = 300;
    static final int MAX_REDIRECTS = 3;
    private static final int CONNECT_TIMEOUT_MILLIS = 8000;
    private static final int READ_TIMEOUT_MILLIS = 12000;
    private static final int MAX_BODY_BYTES = 8 * 1024 * 1024;
    /** API 24 has no String.repeat; the fixed route policy is spelled out. */
    private static final String SCOPE_QUERY = "?scope=premium";
    private static final Semaphore ACTIVE = new Semaphore(2, true);

    private final ArticleHeaderSigner signer;
    private final ArticleParser parser;

    HttpArticleTransport(ArticleHeaderSigner signer, ArticleParser parser) {
        this.signer = signer;
        this.parser = parser;
    }

    ArticleResult fetch(ArticleRef ref, CancelToken cancel) {
        String header = signer.sign();
        if (header == null) {
            return ArticleResult.defer(ArticleResult.Outcome.DEFER_TO_PUBLISHER, "no-key");
        }
        try {
            cancel.throwIfCancelled();
            if (!ACTIVE.tryAcquire(CONNECT_TIMEOUT_MILLIS, TimeUnit.MILLISECONDS)) {
                return ArticleResult.defer(ArticleResult.Outcome.NETWORK_ERROR, "busy");
            }
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            return ArticleResult.defer(ArticleResult.Outcome.CANCELLED, "acquire");
        }
        try {
            return fetchValidated(ref, header, cancel);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            return ArticleResult.defer(ArticleResult.Outcome.CANCELLED, "cancelled");
        } catch (IOException io) {
            return ArticleResult.defer(ArticleResult.Outcome.NETWORK_ERROR, "io");
        } catch (Exception failure) {
            return ArticleResult.defer(ArticleResult.Outcome.NETWORK_ERROR, "error");
        } finally {
            ACTIVE.release();
        }
    }

    private ArticleResult fetchValidated(ArticleRef ref, String header, CancelToken cancel)
            throws IOException, InterruptedException {
        URI uri = articleRequestUri(ref.id);
        for (int hop = 0; hop <= MAX_REDIRECTS; hop++) {
            cancel.throwIfCancelled();
            byte[] body = null;
            int status = -1;
            String location = null;
            String contentType = null;
            HttpURLConnection connection = (HttpURLConnection) new URL(uri.toString()).openConnection();
            try {
                connection.setRequestMethod("GET");
                connection.setInstanceFollowRedirects(false);
                connection.setConnectTimeout(CONNECT_TIMEOUT_MILLIS);
                connection.setReadTimeout(READ_TIMEOUT_MILLIS);
                // The private article header never leaves this exact request.
                connection.setRequestProperty(HmacArticleHeaderSigner.HEADER_NAME, header);
                connection.setRequestProperty("Accept", "application/json");
                status = connection.getResponseCode();
                contentType = connection.getContentType();
                if (status >= 300 && status < 400) {
                    location = connection.getHeaderField("Location");
                } else if (status == 200) {
                    body = readBounded(connection.getInputStream());
                } else {
                    drain(connection);
                }
            } finally {
                connection.disconnect();
            }
            if (status >= 300 && status < 400) {
                uri = nextHop(uri, location);
                if (uri == null) {
                    return ArticleResult.defer(ArticleResult.Outcome.DEFER_TO_PUBLISHER, "redirect-policy");
                }
                continue;
            }
            if (status == 401 || status == 403) {
                return ArticleResult.defer(ArticleResult.Outcome.AUTH_REJECTED, "status-" + status);
            }
            if (status != 200) {
                return ArticleResult.defer(ArticleResult.Outcome.NETWORK_ERROR, "status-" + status);
            }
            if (body == null || !jsonContent(contentType)) {
                return ArticleResult.defer(ArticleResult.Outcome.UNSUPPORTED_CONTENT, "content-type");
            }
            return parser.parse(ref, body);
        }
        return ArticleResult.defer(ArticleResult.Outcome.NETWORK_ERROR, "redirect-limit");
    }

    /** Exact route and scope for the audited signed article request. */
    static URI articleRequestUri(long id) {
        return URI.create("https://" + API_HOST + "/domain/" + DOMAIN_ID + "/news/" + id + SCOPE_QUERY);
    }

    /**
     * Redirect policy: one more signed hop only when host, scheme, port,
     * method and the exact article route are unchanged. Cross-origin,
     * downgrade, route-changing and looping redirects lose the header and
     * defer to the publisher.
     */
    private URI nextHop(URI current, String location) {
        if (location == null) {
            return null;
        }
        URI target;
        try {
            target = current.resolve(location);
        } catch (Exception invalid) {
            return null;
        }
        if (!"https".equals(target.getScheme())) {
            return null;
        }
        if (!API_HOST.equals(target.getHost())) {
            return null;
        }
        if (target.getPort() != -1 && target.getPort() != 443) {
            return null;
        }
        if (target.getRawUserInfo() != null) {
            return null;
        }
        URI expected = articleRequestUri(extractId(current));
        if (!target.normalize().toString().equals(expected.normalize().toString())) {
            return null;
        }
        return target;
    }

    static long extractId(URI requestUri) {
        String path = requestUri.getRawPath();
        String marker = "/news/";
        int at = path.indexOf(marker);
        if (at < 0) {
            return -1;
        }
        String rest = path.substring(at + marker.length());
        long id = -1;
        int end = 0;
        while (end < rest.length() && Character.isDigit(rest.charAt(end))) {
            end++;
        }
        if (end == 0) {
            return -1;
        }
        try {
            id = Long.parseLong(rest.substring(0, end));
        } catch (NumberFormatException overflow) {
            return -1;
        }
        return id;
    }

    private static boolean jsonContent(String contentType) {
        return contentType != null && contentType.toLowerCase().contains("json");
    }

    private static byte[] readBounded(InputStream stream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        byte[] chunk = new byte[8192];
        int total = 0;
        int read;
        while ((read = stream.read(chunk)) != -1) {
            total += read;
            if (total > MAX_BODY_BYTES) {
                return null;
            }
            buffer.write(chunk, 0, read);
        }
        return buffer.toByteArray();
    }

    private static void drain(HttpURLConnection connection) {
        try {
            InputStream error = connection.getErrorStream();
            if (error == null) {
                return;
            }
            byte[] chunk = new byte[4096];
            while (error.read(chunk) != -1) {
                // bounded by read timeout; drop the body
            }
            error.close();
        } catch (IOException ignored) {
            // the error body is not required for any decision
        }
    }
}
