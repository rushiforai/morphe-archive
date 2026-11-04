package app.tikkamasalla.stremio.oneahead.demux;

/**
 * Bytes a job may fetch. An episode budget normally has a show budget as its parent; the caller
 * persists {@link #used()} and passes it back as the starting value.
 */
public final class ByteBudget {
    private final ByteBudget parent;
    private final long cap;
    private long used;

    public ByteBudget(long cap) {
        this(cap, 0, null);
    }

    public ByteBudget(long cap, long alreadyUsed, ByteBudget parent) {
        this.cap = cap;
        this.used = alreadyUsed;
        this.parent = parent;
    }

    public synchronized long used() {
        return used;
    }

    /** What is left here and in every parent. */
    public synchronized long remaining() {
        long left = cap - used;
        return parent == null ? left : Math.min(left, parent.remaining());
    }

    /** Refuses before the bytes are requested, so a cap is never overshot by more than one read. */
    public void check(long bytes) throws DemuxException {
        long left = remaining();
        if (bytes > left) {
            throw new DemuxException(DemuxException.Kind.BUDGET, "need " + bytes + ", left " + left);
        }
    }

    public synchronized void add(long bytes) {
        used += bytes;
        if (parent != null) parent.add(bytes);
    }
}
