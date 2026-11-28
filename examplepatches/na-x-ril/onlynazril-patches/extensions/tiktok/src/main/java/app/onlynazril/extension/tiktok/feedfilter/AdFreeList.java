package app.onlynazril.extension.tiktok.feedfilter;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * A list's item storage, with ads refused at insertion.
 * <p>
 * An ad can be added straight into the pager's own {@code ArrayList}, without a setter, a fetch or
 * an insert callback the page hooks see. The profile feed does exactly that: the log shows the ad
 * rendered with no page or setter line before it, so the only point it passes is the list itself.
 * Replacing the field at construction makes every path share one refusal, and the list is still an
 * {@code ArrayList}, so casts and iteration are unchanged.
 * <p>
 * **Ads only.** The same storage class backs the detail feed and a profile's own feed; refusing a
 * LIVE, drama or out-of-range item there would drop the video the user just opened. Those filters
 * belong to the feed's pages, which is where they run.
 */
public final class AdFreeList extends ArrayList<Object> {
    public AdFreeList(Collection<?> source) {
        super(source == null ? 0 : source.size());
        if (source == null) return;
        List<Object> kept = new ArrayList<>(source.size());
        for (Object item : source) {
            if (!FeedFilter.shouldRefuse(item)) kept.add(item);
        }
        super.addAll(kept);
    }

    @Override
    public boolean add(Object item) {
        if (FeedFilter.shouldRefuse(item)) {
            FeedFilter.logRefusedItem(item);
            return false;
        }
        return super.add(item);
    }

    @Override
    public void add(int index, Object item) {
        if (FeedFilter.shouldRefuse(item)) {
            FeedFilter.logRefusedItem(item);
            return;
        }
        super.add(index, item);
    }

    @Override
    public boolean addAll(Collection<?> items) {
        if (items == null) return false;
        boolean changed = false;
        for (Object item : items) {
            if (FeedFilter.shouldRefuse(item)) {
                FeedFilter.logRefusedItem(item);
                continue;
            }
            changed |= super.add(item);
        }
        return changed;
    }

    @Override
    public boolean addAll(int index, Collection<?> items) {
        if (items == null) return false;
        int at = index;
        boolean changed = false;
        for (Object item : items) {
            if (FeedFilter.shouldRefuse(item)) {
                FeedFilter.logRefusedItem(item);
                continue;
            }
            super.add(at++, item);
            changed = true;
        }
        return changed;
    }

    @Override
    public Object set(int index, Object item) {
        if (FeedFilter.shouldRefuse(item)) {
            FeedFilter.logRefusedItem(item);
            return get(index);
        }
        return super.set(index, item);
    }
}
