package xyz.urro.transit;

/** Short replacement-model gaps preserve identity, but cannot fire an activation timer. */
public final class GoDataContinuity {
    public static final long GRACE_MS = 2000;
    private long missingSince = -1;
    public void missing(long now) { if (missingSince < 0) missingSince = now; }
    public boolean resume(long now) {
        boolean same = !expired(now);
        missingSince = -1;
        return same;
    }
    public long remaining(long now) { return missingSince < 0 ? GRACE_MS : Math.max(0, GRACE_MS - (now - missingSince)); }
    public boolean missing() { return missingSince >= 0; }
    public boolean expired(long now) { return missingSince >= 0 && now - missingSince >= GRACE_MS; }
}
