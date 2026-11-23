package nl.johninnl.eclipse.auto.tree;

import java.util.ArrayList;
import java.util.List;

/**
 * The page size of the browse request being answered, and the cut that keeps a list inside it.
 *
 * <p>The app's own children method builds the answer for every node it knows (favourites,
 * playlists, albums, the library) and then checks that the list fits the host's page size,
 * throwing when it does not. The browse upgrade learns the page size in the prologue it puts at the
 * start of that method and keeps it here, for this thread only: the list is built and handed on in
 * the same call on the same thread, so no other request can overwrite it in between, and every call
 * sets it again before anything else runs.
 */
public final class PageLimit {
    private static final ThreadLocal<Integer> CURRENT = new ThreadLocal<>();

    /** Remember the page size of the request that is starting on this thread. */
    public static void set(int pageSize) { CURRENT.set(pageSize); }

    /** The page size of this thread's request; unlimited when none was recorded. */
    public static int current() {
        Integer pageSize = CURRENT.get();
        return pageSize == null ? Integer.MAX_VALUE : pageSize;
    }

    /**
     * {@code items} unchanged (the same list) when it fits, otherwise a copy of its first
     * {@code pageSize} entries, so the host gets a valid first page. A page size of zero or less
     * leaves nothing to show.
     */
    public static <T> List<T> limit(List<T> items, int pageSize) {
        if (items.size() <= pageSize) return items;
        return pageSize <= 0 ? new ArrayList<T>() : new ArrayList<>(items.subList(0, pageSize));
    }

    private PageLimit() { }
}
