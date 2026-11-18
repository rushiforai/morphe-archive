package app.template.extension.extension;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** A completed activity snapshot, independent of subsequent recordings. */
public final class ActivityBurst {
    public static final class Coverage {
        public final boolean requestsComplete, responsesComplete;
        public final int matchedSamples, cacheHits;
        public Coverage(boolean requestsComplete, boolean responsesComplete, int matchedSamples, int cacheHits) {
            if (matchedSamples < 0 || cacheHits < matchedSamples) throw new IllegalArgumentException();
            this.requestsComplete = requestsComplete; this.responsesComplete = responsesComplete;
            this.matchedSamples = matchedSamples; this.cacheHits = cacheHits;
        }
    }
    public static final class Ref {
        public final String printerId, burstId;
        public final long sequence;
        public Ref(String printerId, String burstId, long sequence) {
            if (printerId == null || burstId == null || sequence < 0) throw new IllegalArgumentException();
            this.printerId = printerId; this.burstId = burstId; this.sequence = sequence;
        }
    }
    public final Ref ref;
    public final long startedWallMillis, elapsedNanos;
    public final String endpoint;
    public final Coverage coverage;
    private final List<RequestRecord> requests;
    public ActivityBurst(Ref ref, long startedWallMillis, long elapsedNanos, List<RequestRecord> requests) {
        this(ref, startedWallMillis, elapsedNanos, requests, null, new Coverage(false, false, 0, 0));
    }
    public ActivityBurst(Ref ref, long startedWallMillis, long elapsedNanos, List<RequestRecord> requests,
                         String endpoint, Coverage coverage) {
        if (ref == null || elapsedNanos < 0 || requests == null || coverage == null) throw new IllegalArgumentException();
        this.ref = ref; this.startedWallMillis = startedWallMillis; this.elapsedNanos = elapsedNanos;
        this.endpoint = endpoint; this.coverage = coverage;
        this.requests = Collections.unmodifiableList(new ArrayList<>(requests));
    }
    public List<RequestRecord> requests() { return requests; }
}
