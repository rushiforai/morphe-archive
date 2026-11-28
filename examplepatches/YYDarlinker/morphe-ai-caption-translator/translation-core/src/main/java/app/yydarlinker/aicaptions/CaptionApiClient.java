package app.yydarlinker.aicaptions;


import java.net.HttpURLConnection;

/** Shared cancellable I/O contract; no legacy translator is shipped. */
public final class CaptionApiClient {
    public interface RequestControl extends CaptionSourceControl {
        boolean isCancelled();

        /** Admit one new model HTTP attempt; reading an admitted transport uses isCancelled. */
        default boolean tryBeginAttempt() {
            return !isCancelled();
        }

        void onConnection(HttpURLConnection c);

        default void onRequestBodySent() {}

    }

}
