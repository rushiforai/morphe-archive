package app.xposed.extension;

import java.util.LinkedHashMap;
import java.util.Map;

/** User ids and handles, learned from the posts X shows. Client events only carry author ids. */
final class Users {
    private static final int LIMIT = 20_000;

    private static final Map<Long, String> handles = lru();
    private static final Map<String, Long> ids = lru();

    private Users() {
    }

    private static <K, V> Map<K, V> lru() {
        return new LinkedHashMap<K, V>(1024, 0.75f, true) {
            @Override
            protected boolean removeEldestEntry(Map.Entry<K, V> eldest) {
                return size() > LIMIT;
            }
        };
    }

    /** handle is lower case. */
    static void put(long id, String handle) {
        if (id == 0 || handle == null) return;
        synchronized (handles) {
            handles.put(id, handle);
            ids.put(handle, id);
        }
    }

    static String handleFor(long id) {
        synchronized (handles) {
            return handles.get(id);
        }
    }

    /** The id last seen for a lowercase handle, or 0. */
    static long idFor(String handle) {
        synchronized (handles) {
            Long id = ids.get(handle);
            return id != null ? id : 0;
        }
    }
}
