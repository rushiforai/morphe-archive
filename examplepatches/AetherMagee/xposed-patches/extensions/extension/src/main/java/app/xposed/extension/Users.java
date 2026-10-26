package app.xposed.extension;

import android.util.Log;

import java.lang.reflect.Field;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/** User id to handle, learned from every TwitterUser X builds. Analytics only know author ids. */
final class Users {
    private static final int LIMIT = 20_000;

    private static final Map<Long, String> handles = new LinkedHashMap<Long, String>(1024, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<Long, String> eldest) {
            return size() > LIMIT;
        }
    };
    private static Field idField, usernameField;
    private static boolean broken;

    private Users() {
    }

    static void onTwitterUser(Object user) {
        if (broken || user == null) return;
        try {
            if (idField == null) {
                // "class|idField|usernameField", resolved at patch time from TwitterUser.toString().
                String[] spec = Hooks.twitterUserFields().split("\\|");
                Class<?> c = Class.forName(spec[0]);
                usernameField = c.getDeclaredField(spec[2]);
                usernameField.setAccessible(true);
                Field id = c.getDeclaredField(spec[1]);
                id.setAccessible(true);
                idField = id;
            }
            String username = (String) usernameField.get(user);
            if (username == null) return;
            long id = idField.getLong(user);
            synchronized (handles) {
                handles.put(id, username.toLowerCase(Locale.ROOT));
            }
        } catch (Exception e) {
            broken = true;
            Log.e(Hooks.TAG, "TwitterUser fields are unavailable", e);
        }
    }

    /** Ids learned from lookups, so filtered accounts resolve even if X never built their TwitterUser. */
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
