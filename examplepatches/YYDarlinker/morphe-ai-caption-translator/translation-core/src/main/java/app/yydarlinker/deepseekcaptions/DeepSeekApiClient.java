package app.yydarlinker.deepseekcaptions;

import org.json.JSONObject;

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

}
