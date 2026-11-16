package app.onlynazril.extension.tiktok.feedfilter;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.Collection;

/**
 * The pager storage's item list, with ads refused at insertion.
 * <p>
 * The pager storage is a plain {@code ArrayList} that the ad SDK can also add to directly, without
 * going through the setter or any of the insert callbacks the filter hooks. Wrapping the field
 * itself is the only point every path shares: a direct {@code add}, an insert callback and a page
 * restore all end here. The list is still an {@code ArrayList}, so existing casts and iteration are
 * unchanged.
 * <p>
 * Only ads are refused. The same storage class backs the detail feed and the profile's own feed;
 * refusing a LIVE or drama item there removes the video the user just opened, which is a black
 * screen and, when the list keeps its previous items, the wrong video. The feed's own hooks remove
 * those items from the feed.
 */
public final class AdFreeList extends ArrayList<Object> {
    public AdFreeList(Collection<?> source) {
        super(source == null ? 0 : source.size());
        if (source == null) return;
        for (Object item : source) {
            if (!FeedFilter.shouldRefuse(item)) super.add(item);
        }
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
        boolean changed = false;
        if (items == null) return false;
        for (Object item : items) changed |= add(item);
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
