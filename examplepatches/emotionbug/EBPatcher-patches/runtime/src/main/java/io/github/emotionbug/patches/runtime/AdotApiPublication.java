package io.github.emotionbug.patches.runtime;

import java.util.IdentityHashMap;

/** Native response persistence spans several Room transactions and coroutine threads. */
final class AdotApiPublication {
    private static final IdentityHashMap<Object, Boolean> owners = new IdentityHashMap<>();
    private AdotApiPublication() { }

    static synchronized void begin(Object continuation) {
        owners.put(continuation, Boolean.TRUE);
    }

    static synchronized boolean end(Object continuation) {
        return owners.remove(continuation) != null && owners.isEmpty();
    }

    /** Check after acquiring the native write transaction, never before it. */
    static synchronized boolean active() { return !owners.isEmpty(); }
}
