package app.template.extension.extension;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Result of replaying one specific activity snapshot. */
public final class ReplayRun {
    public static final class RequestResult {
        public final String requestToken;
        private final byte[] response;
        public RequestResult(String requestToken, byte[] response) {
            if (requestToken == null || requestToken.isEmpty()) throw new IllegalArgumentException();
            this.requestToken = requestToken;
            this.response = response == null ? null : response.clone();
        }
        public byte[] response() { return response == null ? null : response.clone(); }
    }
    public final String id, endpoint;
    public final ActivityBurst.Ref source;
    public final long elapsedNanos;
    private final List<RequestResult> results;
    public ReplayRun(String id, ActivityBurst.Ref source, String endpoint, long elapsedNanos,
                     List<RequestResult> results) {
        if (id == null || id.isEmpty() || source == null || endpoint == null || elapsedNanos < 0 || results == null)
            throw new IllegalArgumentException();
        this.id = id; this.source = source; this.endpoint = endpoint; this.elapsedNanos = elapsedNanos;
        this.results = Collections.unmodifiableList(new ArrayList<>(results));
    }
    public List<RequestResult> results() { return results; }
}
