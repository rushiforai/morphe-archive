package app.morphed.extension.twitch.adblock;

import app.morphed.extension.twitch.hls.UrlKey;

import java.io.IOException;
import java.util.Map;
import java.util.function.LongSupplier;

/**
 * Logs every request the ad blocker makes itself: what, how long, and the result. Query strings
 * (which hold access tokens) are left out.
 */
public final class LoggingHttp implements Http {
    private final Http delegate;
    private final Logger logger;
    private final LongSupplier clock;

    public LoggingHttp(Http delegate, Logger logger, LongSupplier clock) {
        this.delegate = delegate;
        this.logger = logger;
        this.clock = clock;
    }

    @Override
    public Response get(String url, Map<String, String> headers) throws IOException {
        return logged("GET", url, () -> delegate.get(url, headers));
    }

    @Override
    public Response post(String url, Map<String, String> headers, String body) throws IOException {
        return logged("POST", url, () -> delegate.post(url, headers, body));
    }

    private interface Call {
        Response run() throws IOException;
    }

    private Response logged(String method, String url, Call call) throws IOException {
        long start = clock.getAsLong();
        try {
            Response response = call.run();
            logger.log("HTTP " + method + " " + UrlKey.of(url) + " -> " + response.status + " in "
                    + (clock.getAsLong() - start) + "ms, " + (response.body == null ? 0 : response.body.length()) + " chars");
            return response;
        } catch (IOException e) {
            logger.log("HTTP " + method + " " + UrlKey.of(url) + " failed after " + (clock.getAsLong() - start) + "ms: " + e);
            throw e;
        }
    }
}
