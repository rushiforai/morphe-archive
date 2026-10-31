package samsungcompat.sync;

import java.util.Collections;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/** Per-device edit counters. Immutable; ordering does not depend on device clocks. */
public final class VersionVector {
    public enum Order { EQUAL, BEFORE, AFTER, CONCURRENT }

    public static final VersionVector EMPTY = new VersionVector(new TreeMap<>());

    private final SortedMap<String, Long> counters;

    private VersionVector(SortedMap<String, Long> counters) {
        this.counters = Collections.unmodifiableSortedMap(counters);
    }

    public static VersionVector of(Map<String, Long> counters) {
        TreeMap<String, Long> copy = new TreeMap<>();
        for (Map.Entry<String, Long> e : counters.entrySet()) {
            if (e.getValue() != null && e.getValue() > 0) copy.put(e.getKey(), e.getValue());
        }
        return new VersionVector(copy);
    }

    public long get(String device) {
        Long value = counters.get(device);
        return value == null ? 0 : value;
    }

    public Map<String, Long> asMap() {
        return counters;
    }

    public boolean isEmpty() {
        return counters.isEmpty();
    }

    public VersionVector increment(String device) {
        TreeMap<String, Long> next = new TreeMap<>(counters);
        next.put(device, get(device) + 1);
        return new VersionVector(next);
    }

    public VersionVector merge(VersionVector other) {
        TreeMap<String, Long> next = new TreeMap<>(counters);
        for (Map.Entry<String, Long> e : other.counters.entrySet()) {
            next.put(e.getKey(), Math.max(get(e.getKey()), e.getValue()));
        }
        return new VersionVector(next);
    }

    /** How this vector relates to {@code other}: BEFORE means other has seen everything we have. */
    public Order compare(VersionVector other) {
        boolean less = false;
        boolean greater = false;
        TreeMap<String, Long> keys = new TreeMap<>(counters);
        keys.putAll(other.counters);
        for (String device : keys.keySet()) {
            long a = get(device);
            long b = other.get(device);
            if (a < b) less = true;
            else if (a > b) greater = true;
        }
        if (less && greater) return Order.CONCURRENT;
        if (less) return Order.BEFORE;
        if (greater) return Order.AFTER;
        return Order.EQUAL;
    }

    @Override
    public boolean equals(Object o) {
        return o instanceof VersionVector && counters.equals(((VersionVector) o).counters);
    }

    @Override
    public int hashCode() {
        return counters.hashCode();
    }

    @Override
    public String toString() {
        return counters.toString();
    }
}
