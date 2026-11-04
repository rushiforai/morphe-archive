package app.tikkamasalla.stremio.oneahead;

/**
 * Heap rules of the background job. The worker process has a heap of the same limit, so the job stops above a
 * floor, and a big step only starts when its arrays fit above that floor. Measured on a PC JVM with
 * the serial collector: one file's read and feature build runs in a 42 MB heap, the same for a 0.3 GB
 * and a 7.9 GB read, and detection with 5 references in a 38 MB heap including the 15 MB of features.
 */
final class HeapGate {
    static final long FLOOR_BYTES = 32L * 1024 * 1024;
    /** Before a file: read buffers, both float windows and one prep, at the 36 MB peak measured. */
    static final long FETCH_BYTES = 40L * 1024 * 1024;
    /** Before the feature build, with the windows and buffers already held: one prep measured 34 MB. */
    static final long BUILD_BYTES = 34L * 1024 * 1024;
    /** Correlation arrays with the features already held. */
    static final long DETECT_BYTES = 32L * 1024 * 1024;
    private static final long GC_SPACING_MS = 10_000;
    private static volatile long lastGcMs;

    private HeapGate() {}

    private static long headroom() {
        Runtime r = Runtime.getRuntime();
        return r.maxMemory() - (r.totalMemory() - r.freeMemory());
    }

    /** True when a step needing this many bytes leaves the floor free. Garbage does not count against it. */
    static boolean fits(long bytes) {
        if (headroom() >= bytes + FLOOR_BYTES) return true;
        System.gc();
        return headroom() >= bytes + FLOOR_BYTES;
    }

    /**
     * True when the heap really is under the floor. Polled often, so at most one collection per
     * spacing, and only a reading right after a collection counts: garbage never stops a job.
     */
    static boolean belowFloor() {
        if (headroom() >= FLOOR_BYTES) return false;
        long now = System.currentTimeMillis();
        if (now - lastGcMs < GC_SPACING_MS) return false;
        lastGcMs = now;
        System.gc();
        return headroom() < FLOOR_BYTES;
    }
}
