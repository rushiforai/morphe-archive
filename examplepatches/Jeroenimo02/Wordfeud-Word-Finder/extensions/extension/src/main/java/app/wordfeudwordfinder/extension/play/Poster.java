package app.wordfeudwordfinder.extension.play;

import java.io.IOException;
import java.util.Map;

/** Sends one POST and returns the response body. Implementations never log the headers or the body. */
public interface Poster {

    /**
     * Returns the body of a 2xx response. Throws {@link HttpStatusException} for any other status (with the error
     * body when one could be read) and a plain {@link IOException} for connection problems and time-outs.
     */
    String post(String url, String body, Map<String, String> headers) throws IOException;

    /** A response outside 2xx. {@link #body} may be null. */
    final class HttpStatusException extends IOException {
        public final int status;
        public final String body;

        public HttpStatusException(int status, String body) {
            super("HTTP " + status);
            this.status = status;
            this.body = body;
        }
    }
}
