package app.xposed.extension;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Compose snapshot states that hooked composables read, so they recompose when an account
 * loads (one state per handle) or when settings change (one shared state).
 */
final class States {
    private static final int LIMIT = 4000;
    private static final Handler main = new Handler(Looper.getMainLooper());

    private static final Map<String, Object> handles = new LinkedHashMap<String, Object>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Object> eldest) {
            return size() > LIMIT;
        }
    };
    private static Object global;
    private static int sequence;
    private static volatile boolean broken;

    private States() {
    }

    /**
     * Subscribes the composable being composed to changes of key (a handle, or another key
     * of ours) and of the settings. Returns the key's state for {@link #changedState}, or
     * null when Compose state is unavailable.
     */
    static Object observe(String key) {
        if (broken) return null;
        try {
            Object g, h;
            synchronized (handles) {
                if (global == null) global = ComposeBridge.intState(0);
                g = global;
                h = handles.get(key);
                if (h == null) {
                    h = ComposeBridge.intState(0);
                    handles.put(key, h);
                }
            }
            ComposeBridge.readIntState(g);
            ComposeBridge.readIntState(h);
            return h;
        } catch (Throwable t) {
            broken = true;
            Log.e(Hooks.TAG, "Compose state is unavailable; badges won't update until scrolled", t);
            return null;
        }
    }

    /** Recomposes what observed a state, even after it left the map. */
    static void changedState(Object state) {
        if (state != null) write(state);
    }

    /** Recomposes what shows handle. */
    static void changed(String handle) {
        Object h;
        synchronized (handles) {
            h = handles.get(handle);
        }
        if (h != null) write(h);
    }

    /** Recomposes everything we hooked, e.g. after a settings or theme change. */
    static void changedAll() {
        Object g;
        synchronized (handles) {
            g = global;
        }
        if (g != null) write(g);
    }

    private static void write(Object state) {
        if (broken) return;
        Runnable r = () -> {
            try {
                ComposeBridge.writeIntState(state, ++sequence);
            } catch (Throwable t) {
                broken = true;
                Log.e(Hooks.TAG, "Compose state is unavailable", t);
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            main.post(r);
        }
    }
}
