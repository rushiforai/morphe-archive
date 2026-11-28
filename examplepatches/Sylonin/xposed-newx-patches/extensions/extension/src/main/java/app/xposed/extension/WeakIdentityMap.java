package app.xposed.extension;

import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

/**
 * A map from objects, compared by identity, to values, holding its keys weakly. X's badge lists
 * compare equal across accounts and posts, so only identity tells them apart. Not thread-safe.
 */
final class WeakIdentityMap<V> {
    private static final class Key extends WeakReference<Object> {
        private final int hash;

        Key(Object referent, ReferenceQueue<Object> queue) {
            super(referent, queue);
            hash = System.identityHashCode(referent);
        }

        @Override
        public int hashCode() {
            return hash;
        }

        @Override
        public boolean equals(Object other) {
            if (this == other) return true;
            if (!(other instanceof Key)) return false;
            Object referent = get();
            return referent != null && referent == ((Key) other).get();
        }
    }

    private final Map<Key, V> map = new HashMap<>();
    private final ReferenceQueue<Object> queue = new ReferenceQueue<>();

    void put(Object key, V value) {
        expunge();
        map.put(new Key(key, queue), value);
    }

    V get(Object key) {
        if (key == null) return null;
        return map.get(new Key(key, null));
    }

    int size() {
        expunge();
        return map.size();
    }

    /** Drops the entries whose keys were collected. */
    private void expunge() {
        for (Reference<?> collected; (collected = queue.poll()) != null; ) map.remove(collected);
    }
}
