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
 * sorted by rating count (descending, stable, unrated last) and ad items are
 * dropped. Items the rules do not recognise as products (banners, widgets,
 * headers, ...) keep their original index, products only move between
 * product slots.
 */
final class ListingSorter {

    private ListingSorter() {}

    interface Rules {
        /** True for product items; everything else keeps its position. */
        boolean isProduct(JSONObject item);

        /** Rating count of a product item, or -1 when unknown. */
        int ratingCount(JSONObject item);

        /** True for sponsored / ad product items. */
        boolean isAd(JSONObject item);
    }

    /** Totals collected while rewriting one response. */
    static final class Stats {
        int lists;
        int sorted;
        int adsRemoved;

        boolean changed() {
            return sorted > 0 || adsRemoved > 0;
        }

        @Override
        public String toString() {
            return "lists=" + lists + " sorted=" + sorted + " adsRemoved=" + adsRemoved;
        }
    }

    private static final class Slot {
        final JSONObject item;
        final int count;
        final int index;

        Slot(JSONObject item, int count, int index) {
            this.item = item;
            this.count = count;
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
        final boolean doSort = SortState.sortOn();
        List<Slot> products = new ArrayList<>();
        boolean[] isProductSlot = new boolean[arr.length()];
        int ads = 0;
        int rated = 0;
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
            if (count > 0) rated++;
            products.add(new Slot(item, count, i));
        }
        if (products.size() + ads == 0) return null;
        stats.lists++;

        List<Slot> sorted = new ArrayList<>(products);
        if (doSort && rated >= 2) {
            // Collections.sort is stable: ties keep the server's order.
            Collections.sort(sorted, (a, b) -> Integer.compare(b.count, a.count));
        }
        boolean reordered = false;
        for (int i = 0; i < sorted.size(); i++) {
            if (sorted.get(i) != products.get(i)) {
                reordered = true;
                break;
            }
        }
        boolean removesAds = dropAds && ads > 0;
        if (!reordered && !removesAds) return null;

        // Fill product slots in order with the sorted products; slots freed
        // by removed ads collapse, other items stay where they were.
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
        return out;
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
