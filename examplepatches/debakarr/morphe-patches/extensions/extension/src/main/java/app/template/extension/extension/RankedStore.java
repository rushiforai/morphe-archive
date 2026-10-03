package app.template.extension.extension;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Every product seen in any listing page the app loaded, newest page last, so
 * the ranked list can order across pages — which a per-response rewrite cannot.
 *
 * <p>In memory only, bounded, and de-duplicated by product id. It is cleared
 * explicitly from the panel, and automatically after a long idle gap so one
 * search's results are not mixed into the next.
 */
final class RankedStore {

    private RankedStore() {}

    private static final int MAX_PRODUCTS = 3000;
    /** A listing page after this long a silence starts a fresh collection. */
    static final long IDLE_RESET_MS = 20 * 60 * 1000L;

    private static final Map<String, Product> sProducts = new LinkedHashMap<>();
    private static long sLastAdd;

    /** Adds (or refreshes) a product. Ads must never be passed in. */
    static synchronized void add(Product p, long nowMs) {
        if (p == null || p.id == null || p.id.isEmpty()) return;
        if (sLastAdd != 0 && nowMs - sLastAdd > IDLE_RESET_MS) sProducts.clear();
        sLastAdd = nowMs;
        Product old = sProducts.get(p.id);
        // Keep whichever copy knows more (a later page can fill in a missing rating).
        if (old != null && !(p.hasRating() && !old.hasRating()) && !(p.hasCount() && !old.hasCount())) return;
        if (old == null && sProducts.size() >= MAX_PRODUCTS) {
            // Drop the oldest entry to stay bounded.
            String first = sProducts.keySet().iterator().next();
            sProducts.remove(first);
        }
        sProducts.put(p.id, p);
    }

    static synchronized int size() {
        return sProducts.size();
    }

    static synchronized void clear() {
        sProducts.clear();
        sLastAdd = 0;
    }

    static synchronized List<Product> snapshot() {
        return new ArrayList<>(sProducts.values());
    }

    /** The ranked list for the panel. */
    static List<Product> ranked(SortState.Mode mode, boolean minFour) {
        return Ranker.rank(snapshot(), mode, minFour);
    }
}
