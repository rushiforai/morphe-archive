package app.yydarlinker.deepseekcaptions;

import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;

/** Shared cancellable I/O contract; no legacy translator is shipped. */
final class DeepSeekApiClient {
    interface RequestControl extends CaptionSourceControl {
        boolean isCancelled();

        /** Admit one new model HTTP attempt; reading an admitted transport uses isCancelled. */
        default boolean tryBeginAttempt() {
            return !isCancelled();
        }

        void onConnection(HttpURLConnection c);

        default void onRequestBodySent() {}

        default void onQualityEvidence(JSONObject source, String response, String metadata) {}
    }

    static byte[] readFully(InputStream stream, int max) throws Exception {
        try (InputStream in = stream;
                ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] b = new byte[8192];
            int n;
            while ((n = in.read(b)) != -1) {
                if (Thread.currentThread().isInterrupted()) throw new InterruptedException();
                if (out.size() + n > max) throw new IOException("response_too_large");
                out.write(b, 0, n);
            }
            return out.toByteArray();
        }
    }
}
