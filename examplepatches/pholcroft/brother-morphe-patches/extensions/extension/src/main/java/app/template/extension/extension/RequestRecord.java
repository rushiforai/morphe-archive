package app.template.extension.extension;

/** An immutable observed request. Times are relative monotonic nanoseconds. */
public final class RequestRecord {
    public enum Outcome { SUCCESS, TIMEOUT, CANCELLED, ERROR }
    /** Replay parameters and the observed response's type; no credential value is stored. */
    public static final class Details {
        public final String endpoint, contextId, responseType, outcome;
        public final int port, version, requestId, timeoutMillis, retries;
        public final long sampleNanos;
        public Details(String endpoint, int port, int version, int requestId, int timeoutMillis,
                       int retries, String contextId, String responseType, String outcome, long sampleNanos) {
            if (endpoint == null || port < 1 || port > 65535 || timeoutMillis < 0 || retries < 1
                    || contextId == null || responseType == null || outcome == null || sampleNanos < -1)
                throw new IllegalArgumentException("Invalid request details");
            this.endpoint = endpoint; this.port = port; this.version = version; this.requestId = requestId;
            this.timeoutMillis = timeoutMillis; this.retries = retries; this.contextId = contextId;
            this.responseType = responseType; this.outcome = outcome; this.sampleNanos = sampleNanos;
        }
    }
    public final String token, oid;
    public final int ordinal;
    public final long startNanos, endNanos;
    public final boolean cached;
    public final Details details;
    public final Outcome outcome;
    private final byte[] response;

    public RequestRecord(String token, int ordinal, String oid, long startNanos,
                         long endNanos, boolean cached, byte[] response) {
        this(token, ordinal, oid, startNanos, endNanos, cached, response, null);
    }
    public RequestRecord(String token, int ordinal, String oid, long startNanos,
                         long endNanos, boolean cached, byte[] response, Details details) {
        this(token, ordinal, oid, startNanos, endNanos, cached, response, details, Outcome.SUCCESS);
    }
    public RequestRecord(String token, int ordinal, String oid, long startNanos,
                         long endNanos, boolean cached, byte[] response, Details details, Outcome outcome) {
        if (token == null || oid == null || ordinal < 0 || startNanos < 0 || endNanos < startNanos)
            throw new IllegalArgumentException("Invalid request record");
        if (outcome == null) throw new IllegalArgumentException("Missing outcome");
        this.token = token; this.ordinal = ordinal; this.oid = oid;
        this.startNanos = startNanos; this.endNanos = endNanos; this.cached = cached;
        this.details = details;
        this.outcome = outcome;
        this.response = response == null ? null : response.clone();
    }
    public byte[] response() { return response == null ? null : response.clone(); }
}
