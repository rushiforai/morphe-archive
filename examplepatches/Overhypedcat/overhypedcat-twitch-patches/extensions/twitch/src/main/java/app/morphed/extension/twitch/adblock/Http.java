package app.morphed.extension.twitch.adblock;

import java.io.IOException;
import java.util.Map;

/**
 * The few HTTP calls the ad blocker makes on its own: access tokens and backup playlists.
 */
public interface Http {
    final class Response {
        public final int status;
        public final String body;

        public Response(int status, String body) {
            this.status = status;
            this.body = body;
        }

        public boolean isOk() {
            return status == 200 && body != null;
        }
    }

    Response get(String url, Map<String, String> headers) throws IOException;

    Response post(String url, Map<String, String> headers, String body) throws IOException;
}
