package app.onlynazril.extension.tiktok.feedfilter;

/** Videos whose digg count falls outside the set range. */
public final class LikeCountFilter implements IFilter {
    private final long[] range;

    public LikeCountFilter(long[] range) {
        this.range = range;
    }

    @Override
    public boolean shouldRemove(Object item) {
        return Counts.outside(item, "getDiggCount", "diggCount", range);
    }

    @Override
    public String reason(Object item) {
        return "likes=" + Counts.of(item, "getDiggCount", "diggCount");
    }
}
