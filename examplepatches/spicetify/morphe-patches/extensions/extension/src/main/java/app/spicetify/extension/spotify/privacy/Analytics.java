package app.spicetify.extension.spotify.privacy;

import io.reactivex.rxjava3.core.Single;

/** Runtime helpers injected by the Remove analytics and tracking patch. */
public final class Analytics {

    private Analytics() {}

    /**
     * Answers Spotify's pending-events RPC (playback logging) with an error so nothing
     * reaches the server. Subscribers already treat RPC failures as terminal, so the
     * error is swallowed exactly like a network failure.
     */
    public static Single<Object> noPendingEvents(Object request) {
        return Single.error(new IllegalStateException("analytics removed"));
    }
}
