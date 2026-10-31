package com.dhuadapter.core;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

/**
 * Pure, dependency-free ordered-transform registry (no android / Pine imports)
 * so the "one target, many category contributions, applied in order" logic is
 * unit-testable on a bare JVM.
 *
 * Keyed by an arbitrary target id (e.g. a method name). Each category registers
 * a Consumer that mutates the shared argument (e.g. a Configuration). apply()
 * runs every registered transform for a key, in registration order, isolating
 * a throwing transform so one bad contributor cannot break the others.
 *
 * SharedHooks wraps this: it installs exactly ONE Pine hook per key whose
 * callback calls apply(key, arg) — so a framework method needed by several
 * categories is hooked once, never double-trampolined.
 */
public final class TransformRegistry<T> {

    private final Map<String, List<Consumer<T>>> byKey = new LinkedHashMap<>();

    /** Register a transform for a target key. Order of registration is preserved. */
    public void register(String key, Consumer<T> transform) {
        if (key == null || transform == null) {
            return;
        }
        byKey.computeIfAbsent(key, k -> new ArrayList<>()).add(transform);
    }

    /** True if at least one transform is registered for the key. */
    public boolean has(String key) {
        List<Consumer<T>> list = byKey.get(key);
        return list != null && !list.isEmpty();
    }

    /** Number of transforms registered for the key (0 if none). */
    public int count(String key) {
        List<Consumer<T>> list = byKey.get(key);
        return list == null ? 0 : list.size();
    }

    /** All registered keys, in first-registration order. */
    public java.util.Set<String> keys() {
        return byKey.keySet();
    }

    /**
     * Apply every transform registered for the key to the target, in order.
     * A transform that throws is skipped (its Throwable is swallowed) so one
     * bad contributor cannot abort the rest — matches the hook-callback contract
     * where an exception must not crash the hooked framework call.
     */
    public void apply(String key, T target) {
        List<Consumer<T>> list = byKey.get(key);
        if (list == null) {
            return;
        }
        for (Consumer<T> t : list) {
            try {
                t.accept(target);
            } catch (Throwable ignored) {
                // isolate: one failing transform must not stop the others
            }
        }
    }
}
