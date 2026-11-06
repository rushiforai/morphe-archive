package app.template.extension.extension;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Tiny identity-keyed memo shared by the Proteus Reddit listing helpers
 * ("Block AutoMod comments", "Content filters", "Show deleted comments").
 *
 * <p>Reddit's comment/feed rows are deserialized once and then read through
 * {@code Listing.getChildren()} on the UI path, where Jetpack Compose can
 * call the getter many times per frame.  Each Proteus helper used to redo a
 * full reflective traversal of the whole list on every call, which dropped
 * frames during list animations and fast scrolling.
 *
 * <p>The listings themselves are effectively immutable after deserialization
 * (freshly built per page), so keying the cache on the list's <em>identity</em>
 * — never on content — is both safe and cheap.  The entry also records the
 * list size, and a cached entry is discarded when the size no longer matches,
 * so a hypothetically mutated list is simply re-processed instead of serving
 * stale output.
 *
 * <p>The cache is a small access-ordered LRU ({@value #CAPACITY} entries), so
 * memory stays bounded even with endless feed pagination.  Contents are
 * process-local; nothing is written anywhere.
 */
final class ProteusListMemo {

    private static final int CAPACITY = 16;

    private static final LinkedHashMap<Key, MemoEntry> MEMO =
            new LinkedHashMap<Key, MemoEntry>(2 * CAPACITY, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<Key, MemoEntry> eldest) {
                    return size() > CAPACITY;
                }
            };

    private static final class Key {
        private final List<?> ref;

        private Key(List<?> ref) {
            this.ref = ref;
        }

        @Override
        public int hashCode() {
            return System.identityHashCode(ref);
        }

        @Override
        public boolean equals(Object other) {
            return other instanceof Key && ((Key) other).ref == ref;
        }
    }

    private static final class MemoEntry {
        private final int size;
        private final List<?> output;

        private MemoEntry(int size, List<?> output) {
            this.size = size;
            this.output = output;
        }
    }

    private ProteusListMemo() {
        // Static surface only.
    }

    /**
     * Returns the previously computed output for exactly this list instance,
     * or {@code null} when there is no (still-valid) cache entry.
     */
    static List<?> get(List<?> list) {
        synchronized (MEMO) {
            Key key = new Key(list);
            MemoEntry entry = MEMO.get(key);
            if (entry == null) {
                return null;
            }
            if (entry.size != list.size()) {
                MEMO.remove(key);
                return null;
            }
            return entry.output;
        }
    }

    /** Records that processing {@code input} produced {@code output}. */
    static void put(List<?> input, List<?> output) {
        synchronized (MEMO) {
            MEMO.put(new Key(input), new MemoEntry(input.size(), output));
        }
    }
}
