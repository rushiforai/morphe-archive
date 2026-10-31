package app.xposed.extension;

import java.util.LinkedHashMap;
import java.util.Map;

/** User id to handle, learned from the posts X shows and from lookups. Client events only carry author ids. */
final class Users {
    private static final int LIMIT = 20_000;

    private static final Map<Long, String> handles = new LinkedHashMap<Long, String>(1024, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<Long, String> eldest) {
            return size() > LIMIT;
        }
    };

    private Users() {
    }

    /** handle is lower case. */
    static void put(long id, String handle) {
        if (id == 0 || handle == null) return;
        synchronized (handles) {
            handles.put(id, handle);
        }
    }

    static String handleFor(long id) {
        synchronized (handles) {
            return handles.get(id);
        }
    }
}
