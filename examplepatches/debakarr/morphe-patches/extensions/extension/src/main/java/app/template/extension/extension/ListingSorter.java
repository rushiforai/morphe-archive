package app.template.extension.extension;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Re-orders product lists inside a parsed JSON response.
 *
 * <p>For every array stored under one of the given keys, product items are
 * sorted by the current {@link SortState.Mode} (most ratings or highest
 * average, stable, unknown last), products rated below 4★ are dropped when that
 * filter is on, and ad items are dropped. Items the rules do not recognise as
 * products (banners, widgets, headers, ...) keep their original index, products
 * only move between product slots.
 *
 * <p>Every organic product that goes by is also recorded in {@link RankedStore},
 * whatever the toggles say, so the ranked list can order across pages.
 */
final class ListingSorter {

    private ListingSorter() {}

    /**
     * What a site's list items look like. An abstract class rather than an
     * interface with default methods: the extension is merged into apps whose
     * minimum Android version predates default-method support.
     */
    abstract static class Rules {
        /** True for product items; everything else keeps its position. */
        abstract boolean isProduct(JSONObject item);

        /** Rating count of a product item, or -1 when unknown. */
        abstract int ratingCount(JSONObject item);

        /** True for sponsored / ad product items. */
        abstract boolean isAd(JSONObject item);

        /** Average rating 0-5 of a product item, or -1 when unknown. */
        double rating(JSONObject item) {
            return -1;
        }

        /** The product as the ranked list should show it, or null when it can't be described. */
        Product describe(JSONObject item) {
            return null;
        }
    }

    /** Totals collected while rewriting one response. */
    static final class Stats {
        int lists;
        int sorted;
        int adsRemoved;
        int filtered;

        boolean changed() {
            return sorted > 0 || adsRemoved > 0 || filtered > 0;
        }

        @Override
        public String toString() {
            return "lists=" + lists + " sorted=" + sorted + " adsRemoved=" + adsRemoved
                + " filtered=" + filtered;
        }
    }

    private static final class Slot {
        final JSONObject item;
        final int count;
        final double rating;
        final int index;

        Slot(JSONObject item, int count, double rating, int index) {
            this.item = item;
            this.count = count;
            this.rating = rating;
            this.index = index;
        }
    }

    /** Recursively rewrites every array under {@code keys}. */
    static void rewrite(Object node, Set<String> keys, Rules rules, Stats stats, int depth) {
        if (depth > 16 || node == null) return;
        if (node instanceof JSONObject) {
            JSONObject obj = (JSONObject) node;
            Iterator<String> it = obj.keys();
            List<String> names = new ArrayList<>();
            while (it.hasNext()) names.add(it.next());
            for (String key : names) {
                Object child = obj.opt(key);
                if (child instanceof JSONArray && keys.contains(key)) {
                    JSONArray rewritten = rewriteList((JSONArray) child, rules, stats);
                    if (rewritten != null) {
                        try {
                            obj.put(key, rewritten);
                        } catch (Exception ignored) {
                            // keep the original list
                        }
                        child = rewritten;
                    }
                }
                rewrite(child, keys, rules, stats, depth + 1);
            }
        } else if (node instanceof JSONArray) {
            JSONArray arr = (JSONArray) node;
            for (int i = 0; i < arr.length(); i++) {
                rewrite(arr.opt(i), keys, rules, stats, depth + 1);
            }
        }
    }

    /** Returns the rewritten list, or null when nothing changed. */
    static JSONArray rewriteList(JSONArray arr, Rules rules, Stats stats) {
        final boolean dropAds = SortState.hideAds();
        final SortState.Mode mode = SortState.mode();
        final boolean minFour = SortState.minFour();
        final long now = System.currentTimeMillis();
        List<Slot> products = new ArrayList<>();
        boolean[] isProductSlot = new boolean[arr.length()];
        int ads = 0;
        int filtered = 0;
        int known = 0;
        for (int i = 0; i < arr.length(); i++) {
            JSONObject item = arr.optJSONObject(i);
            if (item == null || !rules.isProduct(item)) continue;
            if (rules.isAd(item)) {
                ads++;
                // Ads are either dropped, or kept fixed in their slot.
                if (dropAds) isProductSlot[i] = true;
                continue;
            }
            isProductSlot[i] = true;
            int count = rules.ratingCount(item);
            double rating = rules.rating(item);
            // Remember it for the ranked list, whatever the toggles say.
            RankedStore.add(rules.describe(item), now);
            if (minFour && Ranker.belowMin(rating)) {
                // Dropped like an ad: the slot collapses.
                filtered++;
                continue;
            }
            if (Ranker.known(mode, rating, count)) known++;
            products.add(new Slot(item, count, rating, i));
        }
        if (products.size() + ads + filtered == 0) return null;
        stats.lists++;

        List<Slot> sorted = new ArrayList<>(products);
        if (mode != SortState.Mode.OFF && known >= 2) {
            // Collections.sort is stable: ties keep the server's order.
            Collections.sort(sorted, (a, b) -> Ranker.compare(mode, a.rating, a.count, b.rating, b.count));
        }
        boolean reordered = false;
        for (int i = 0; i < sorted.size(); i++) {
            if (sorted.get(i) != products.get(i)) {
                reordered = true;
                break;
            }
        }
        boolean removesAds = dropAds && ads > 0;
        if (!reordered && !removesAds && filtered == 0) return null;

        // Fill product slots in order with the sorted products; slots freed
        // by removed ads or filtered products collapse, other items stay put.
        JSONArray out = new JSONArray();
        int next = 0;
        for (int i = 0; i < arr.length(); i++) {
            if (!isProductSlot[i]) {
                out.put(arr.opt(i));
            } else if (next < sorted.size()) {
                out.put(sorted.get(next++).item);
            }
        }
        if (reordered) stats.sorted += sorted.size();
        if (removesAds) stats.adsRemoved += ads;
        stats.filtered += filtered;
        return out;
    }

    /**
     * A JSON number, or the first number inside a string ("4", "4.3", "₹1,299"), as a
     * double, or -1. Currency signs and other leading text are skipped.
     */
    static double toDouble(Object value) {
        if (value instanceof Number) {
            double d = ((Number) value).doubleValue();
            return d > 0 ? d : -1;
        }
        if (value instanceof String) {
            String t = ((String) value).replace(",", "");
            int start = 0;
            while (start < t.length() && !Character.isDigit(t.charAt(start))) start++;
            if (start >= t.length()) return -1;
            int end = start;
            while (end < t.length() && (Character.isDigit(t.charAt(end)) || t.charAt(end) == '.')) end++;
            try {
                double d = Double.parseDouble(t.substring(start, end));
                return d > 0 ? d : -1;
            } catch (NumberFormatException e) {
                return -1;
            }
        }
        return -1;
    }

    /** The first non-empty string stored under any of {@code keys}, or "". */
    static String firstString(JSONObject obj, String... keys) {
        if (obj == null) return "";
        for (String key : keys) {
            String v = obj.optString(key, "").trim();
            if (!v.isEmpty() && !"null".equals(v)) return v;
        }
        return "";
    }

    /** The first positive number stored under any of {@code keys} (or under their {@code discounted}/{@code value}), or -1. */
    static double firstNumber(JSONObject obj, String... keys) {
        if (obj == null) return -1;
        for (String key : keys) {
            Object v = obj.opt(key);
            if (v instanceof JSONObject) {
                JSONObject o = (JSONObject) v;
                double d = toDouble(o.opt("discounted"));
                if (d <= 0) d = toDouble(o.opt("value"));
                if (d <= 0) d = toDouble(o.opt("selling"));
                if (d > 0) return d;
            } else {
                double d = toDouble(v);
                if (d > 0) return d;
            }
        }
        return -1;
    }

    /** Parses "4.7K+", "| 1.1L", "12,345 ratings" into a number, or -1. */
    static int parseCountText(String text) {
        if (text == null) return -1;
        String t = text.trim();
        int bar = t.lastIndexOf('|');
        if (bar >= 0) t = t.substring(bar + 1).trim();
        int start = -1;
        for (int i = 0; i < t.length(); i++) {
            if (Character.isDigit(t.charAt(i))) {
                start = i;
                break;
            }
        }
        if (start < 0) return -1;
        int end = start;
        while (end < t.length() && (Character.isDigit(t.charAt(end))
            || t.charAt(end) == ',' || t.charAt(end) == '.')) {
            end++;
        }
        double value;
        try {
            value = Double.parseDouble(t.substring(start, end).replace(",", ""));
        } catch (NumberFormatException e) {
            return -1;
        }
        String rest = t.substring(end).trim().toLowerCase();
        if (rest.startsWith("k")) value *= 1_000;
        else if (rest.startsWith("m")) value *= 1_000_000;
        else if (rest.startsWith("l")) value *= 100_000;
        else if (rest.startsWith("cr")) value *= 10_000_000;
        if (value <= 0) return -1;
        return (int) Math.min(Integer.MAX_VALUE, value);
    }
}
