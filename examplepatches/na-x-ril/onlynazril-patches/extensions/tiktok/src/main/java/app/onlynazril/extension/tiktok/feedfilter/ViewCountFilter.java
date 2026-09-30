package app.onlynazril.extension.tiktok.feedfilter;

/** Videos whose play count falls outside the set range. */
public final class ViewCountFilter implements IFilter {
    private final long[] range;

    public ViewCountFilter(long[] range) {
        this.range = range;
    }

    @Override
    public boolean shouldRemove(Object item) {
        return Counts.outside(item, "getPlayCount", "playCount", range);
    }

    @Override
    public String reason(Object item) {
        return "views=" + Counts.of(item, "getPlayCount", "playCount");
    }
}
